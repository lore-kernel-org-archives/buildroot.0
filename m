From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon,  4 May 2020 13:15:51 +0200
Subject: [Buildroot] [PATCH 2/2] utils/source-check: new script
In-Reply-To: <20200504111551.15920-1-patrickdepinguin@gmail.com>
References: <20200504111551.15920-1-patrickdepinguin@gmail.com>
Message-ID: <20200504111551.15920-3-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

This source-check script is a replacement for 'make source-check' that
existed earlier.

It takes as input a list of defconfigs, and then efficiently determines
whether all files needed can be downloaded.

The settings of BR2_PRIMARY_SITE, BR2_PRIMARY_SITE_ONLY and
BR2_PRIMARY_SITE_ONLY_EXTENDED_DOMAINS will be used as specified in the
respective defconfigs.

Current limitations:
- only covers scp and hg URIs, not git or others.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 utils/source-check | 170 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 170 insertions(+)
 create mode 100755 utils/source-check

diff --git a/utils/source-check b/utils/source-check
new file mode 100755
index 0000000000..a387f71d33
--- /dev/null
+++ b/utils/source-check
@@ -0,0 +1,170 @@
+#!/usr/bin/env python3
+
+import json
+import multiprocessing
+import os
+import shutil
+import subprocess
+import sys
+
+# example input:
+# 'rsync': {'dependencies': ['host-ccache',
+#                            'host-skeleton',
+#                            'host-tar',
+#                            'popt',
+#                            'skeleton',
+#                            'toolchain',
+#                            'zlib'],
+#           'dl_dir': 'rsync',
+#           'downloads': [{'source': 'rsync-3.1.3.tar.gz',
+#                          'uris': ['scp|urlencode+scp://xxx at mirror.example.com/rsync',
+#                                   'scp|urlencode+scp://xxx at mirror.example.com',
+#                                   'http+http://rsync.samba.org/ftp/rsync/src',
+#                                   'http|urlencode+http://sources.buildroot.net/rsync',
+#                                   'http|urlencode+http://sources.buildroot.net']}],
+#           'install_images': False,
+#           'install_staging': False,
+#           'install_target': True,
+#           'licenses': 'GPL-3.0+',
+#           'reverse_dependencies': [],
+#           'type': 'target',
+#           'version': '3.1.3',
+#           'virtual': False},
+#
+
+def get_files_to_check_one_defconfig(defconfig):
+    outputdir = 'sourcecheck_%s' % defconfig
+    subprocess.check_call(['make', '--no-print-directory', '-s', defconfig, 'O=%s' % outputdir])
+    # Note: set suitable-host-package to empty to pretend no suitable tools are
+    # present on the host, and thus force all potentially-needed sources in the
+    # list (e.g. cmake, gzip, ...)
+    output = subprocess.check_output(['make', '--no-print-directory', '-s', 'show-info', 'O=%s' % outputdir, 'suitable-host-package='])
+    info = json.loads(output)
+
+    files_to_check = set()
+
+    for pkg in info:
+        if not 'downloads' in info[pkg]:
+            sys.stderr.write("Warning: %s: no downloads for package '%s'\n" % (defconfig, pkg))
+            continue
+        if not info[pkg]['downloads']:
+            sys.stderr.write("Warning: %s: empty downloads for package '%s'\n" % (defconfig, pkg))
+            continue
+        for download in info[pkg]['downloads']:
+            if not 'source' in download:
+                sys.stderr.write("Warning: %s: no source filename found for package '%s'\n" % (defconfig, pkg))
+                continue
+            if not 'uris' in download:
+                sys.stderr.write("Warning: %s: no uri's found for package '%s'\n" % (defconfig, pkg))
+                continue
+
+            # tuple: (pkg, version, filename, uris)
+            # Note: host packages have the same sources as for target, so strip
+            # the 'host-' prefix. Because we are using a set, this will remove
+            # duplicate entries.
+            pkgname = pkg[5:] if pkg.startswith('host-') else pkg
+            files_to_check.add((
+                pkgname,
+                info[pkg]['version'],
+                download['source'],
+                tuple([uri for uri in download['uris']]),
+            ))
+
+    shutil.rmtree(outputdir)
+    return files_to_check
+
+def get_files_to_check(defconfigs):
+    total_files_to_check = set()
+
+    num_processes = multiprocessing.cpu_count() * 2
+    print('Dispatching over %s processes' % num_processes)
+    with multiprocessing.Pool(processes=num_processes) as pool:
+        result_objs = [
+            pool.apply_async(get_files_to_check_one_defconfig, (defconfig,))
+            for defconfig in defconfigs
+        ]
+        results = [p.get() for p in result_objs]
+
+    for result in results:
+        total_files_to_check |= result
+
+    return total_files_to_check
+
+def sourcecheck_one_uri(pkg, version, filename, uri):
+
+    def sourcecheck_scp(pkg, version, filename, uri):
+        real_uri = uri.split('+', 1)[1] + '/' + filename
+        if real_uri.startswith('scp://'):
+            real_uri = real_uri[6:]
+        domain, path = real_uri.split(':', 1)
+        with open(os.devnull, 'w') as devnull:
+            ret = subprocess.call(['ssh', domain, 'test', '-f', path], stderr=devnull)
+        return ret == 0
+
+    def sourcecheck_hg(pkg, version, filename, uri):
+        real_uri = uri.split('+', 1)[1]
+        with open(os.devnull, 'w') as devnull:
+            ret = subprocess.call(['hg', 'identify', '--rev', version, real_uri], stdout=devnull, stderr=devnull)
+        return ret == 0
+
+    if uri.startswith('scp'):
+        handler = sourcecheck_scp
+    elif uri.startswith('hg'):
+        handler = sourcecheck_hg
+    else:
+        raise Exception("Cannot handle unknown URI type: '%s' for package '%s'" % (uri, pkg))
+
+    return handler(pkg, version, filename, uri)
+
+def sourcecheck_one_file(pkg, version, filename, uris):
+    result = any(sourcecheck_one_uri(pkg, version, filename, uri) for uri in uris)
+    return pkg, version, filename, result
+
+def sourcecheck(files_to_check):
+
+    def process_result(result):
+        pkg, version, filename, success = result
+        if success:
+            print(' OK: pkg %s, filename %s' % (pkg, filename))
+        else:
+            sys.stderr.write('NOK: pkg %s, filename %s -- ERROR!\n' % (pkg, filename))
+
+    num_processes = multiprocessing.cpu_count() * 2
+    print('Dispatching over %s processes' % num_processes)
+    with multiprocessing.Pool(processes=num_processes) as pool:
+        result_objs = [
+            pool.apply_async(sourcecheck_one_file, entry, callback=process_result)
+            for entry in files_to_check
+        ]
+        results = [p.get() for p in result_objs]
+
+    succeeded = [(pkg, version, filename, success) for (pkg, version, filename, success) in results if success]
+    failed = [(pkg, version, filename, success) for (pkg, version, filename, success) in results if not success]
+
+    print('\nSummary: %s OK, %s NOK, %s total' % (len(succeeded), len(failed), len(results)))
+
+    if len(failed):
+        print('\nFAILED FILES')
+        for pkg, version, filename, success in sorted(failed):
+            print('pkg: %s, version: %s, file: %s/%s' % (pkg, version, pkg, filename))
+
+    return len(failed) == 0
+
+def main():
+    # - run 'make show-info' for each defconfig
+    # - determine the unique urls to check (take into account that one package
+    #       can have multiple urls)
+    # - check each unique url
+
+    defconfigs = sys.argv[1:]
+    if not defconfigs:
+        sys.stderr.write('Error: pass list of defconfigs as arguments\n')
+        sys.exit(1)
+
+    total_files_to_check = get_files_to_check(defconfigs)
+    return sourcecheck(total_files_to_check)
+
+if __name__ == '__main__':
+    ret = main()
+    if not ret:
+        sys.exit(1)
-- 
2.26.2
