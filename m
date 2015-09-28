From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 28 Sep 2015 20:46:34 +1300
Subject: [Buildroot] [RFC PATCH 1/1] scripts: Add gen-package.py
In-Reply-To: <1443426394-13595-1-git-send-email-judge.packham@gmail.com>
References: <1443426394-13595-1-git-send-email-judge.packham@gmail.com>
Message-ID: <1443426394-13595-2-git-send-email-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gen-package.py can be used to generate the initial skeleton Config.in
and <package>.mk for a package based on its download URL.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 support/scripts/gen-package.py | 266 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 266 insertions(+)
 create mode 100755 support/scripts/gen-package.py

diff --git a/support/scripts/gen-package.py b/support/scripts/gen-package.py
new file mode 100755
index 0000000..d7b126a
--- /dev/null
+++ b/support/scripts/gen-package.py
@@ -0,0 +1,266 @@
+#!/usr/bin/env python
+
+## gen-package.py
+##
+## This script generates the basic skeleton for a new package
+##
+## Copyright (C) 2015 Chris Packham
+##
+## This program is free software; you can redistribute it and/or
+## modify it under the terms of the GNU General Public License
+## as published by the Free Software Foundation; either version 2
+## of the License, or (at your option) any later version.
+##
+## This program is distributed in the hope that it will be useful,
+## but WITHOUT ANY WARRANTY; without even the implied warranty of
+## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+## GNU General Public License for more details.
+##
+## You should have received a copy of the GNU General Public License
+## along with this program; if not, write to the Free Software
+## Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
+## MA 02110-1301, USA.
+##
+"""
+Given the download URL for a package generate Config.in and <package>.mk. This
+automates some of the process but does not completely catch all of the
+information that needs to be provided so some manual intervention is still
+required.
+"""
+import argparse
+import errno
+import os
+import re
+import shutil
+
+
+class ConfigDotIn(object):
+    """
+    Generator for Config.in file
+    """
+    template = """\
+config BR2_PACKAGE_{NAME}
+\tbool "{name}"
+\tdepends on {depends}
+\thelp
+\t  TODO: Description of {name}
+
+\t  {home}/
+"""
+
+    def __init__(self, info, depends):
+        self.info = info
+        pkgdeps = ['BR2_PACKAGE_{}'.format(x.upper()) for x in depends]
+        self.deps = '\n\tdepends on '.join(pkgdeps)
+
+    def __str__(self):
+        elems = dict(self.info)
+        elems['depends'] = self.deps
+        return self.template.format(**elems)
+
+
+class PackageMakefile(object):
+    """
+    Generator for package makefile. This class should not be directly
+    instantiated instead one of its subclasses should be used to create a
+    makefile using the appropriate build infrastructure.
+    """
+    template = """\
+################################################################################
+#
+# {name}
+#
+################################################################################
+
+{NAME}_VERSION = {version}
+{NAME}_SOURCE = {name}{sep}$({NAME}_VERSION).{compression}
+{NAME}_SITE = {site}
+{NAME}_LICENSE = #TODO: add license abbreviation
+{NAME}_LICENSE_FILES = COPYING LICENSE #TODO: update
+{NAME}_DEPENDENCIES = {depends}
+
+$(eval $({type}-package))
+"""
+
+    def __init__(self, info, depends):
+        self.info = info
+        site = self.info['site']
+        site = site.replace(self.info['version'],
+                            '$(BR2_{}_VERISON)'.format(self.info['NAME']))
+        self.info['site'] = site
+        self.deps = " ".join(depends)
+
+    def __str__(self):
+        elems = dict(self.info)
+        elems['depends'] = self.deps
+        return self.template.format(**elems)
+
+
+class GenericPackage(PackageMakefile):
+    def __init__(self, info, depends):
+        info['type'] = 'generic'
+        super(self.__class__, self).__init__(info, depends)
+
+
+class AutotoolsPackage(PackageMakefile):
+    def __init__(self, info, depends):
+        info['type'] = 'autotools'
+        super(self.__class__, self).__init__(info, depends)
+
+
+class CmakePackage(PackageMakefile):
+    def __init__(self, info, depends):
+        info['type'] = 'cmake'
+        super(self.__class__, self).__init__(info, depends)
+
+
+class PythonPackage(PackageMakefile):
+    def __init__(self, info, depends):
+        info['type'] = 'python'
+        super(self.__class__, self).__init__(info, depends)
+
+
+class LuarocksPackage(PackageMakefile):
+    def __init__(self, info, depends):
+        info['type'] = 'luarocks'
+        super(self.__class__, self).__init__(info, depends)
+
+
+class PerlPackage(PackageMakefile):
+    def __init__(self, info, depends):
+        info['type'] = 'perl'
+        super(self.__class__, self).__init__(info, depends)
+
+
+class KconfigPackage(PackageMakefile):
+    def __init__(self, info, depends):
+        info['type'] = 'kconfig'
+        super(self.__class__, self).__init__(info, depends)
+
+
+class RebarPackage(PackageMakefile):
+    def __init__(self, info, depends):
+        info['type'] = 'rebar'
+        super(self.__class__, self).__init__(info, depends)
+
+
+class KernelModulePackage(PackageMakefile):
+    def __init__(self, info, depends):
+        info['type'] = 'kernel-module'
+        super(self.__class__, self).__init__(info, depends)
+        self.template += '$(eval $(generic-package))'
+        self.template = self.template.replace('{type}-package',
+                                              'kernel-module')
+
+
+def guess_package_info(url):
+    """
+    Given the download URL for a package, make an educated guess at the
+    information needed to generate a buildroot package.mk and Config.in.
+    """
+    pattern = '(?P<name>\S+)(?P<sep>-|_)(?P<version>\S+)\.(?P<compression>tar\.(gz|bz2|xz)|tgz|zip)'
+    u = url.split('/')
+    tarball = u[-1]
+    site = '/'.join(u[:-1])
+    home = '/'.join(u[0:3])
+
+    m = re.search(pattern, tarball)
+    if m:
+        return {'name': m.group('name'),
+                'NAME': m.group('name').upper().replace('-', '_'),
+                'sep': m.group('sep'),
+                'version': m.group('version'),
+                'compression': m.group('compression'),
+                'site': site,
+                'home': home}
+    else:
+        raise RuntimeError('Could not guess package info from {}'.format(url))
+
+
+def mkdir(dir_):
+    """
+    os.mkdir wrapper that handles the directory already existing (by not
+    caring).
+    """
+    try:
+        os.mkdir(pkgdir)
+    except OSError as e:
+        if e.errno == errno.EEXIST:
+            pass
+        else:
+            raise e
+
+post = """
+What next?
+
+Add {config} to package/Config.in.
+
+Review {makefile} and {config}
+against the instructions for adding a new package[1]. This script has added
+some TODO markers for things that can't be detected automatically.
+
+Update {config} to fill in the license details[2].
+
+Test that the new package builds for a few different architectures.
+
+Create a patch for buildroot and send it to the mailinglist[3].
+
+[1] http://buildroot.org/downloads/manual/manual.html#adding-packages
+[2] http://buildroot.org/downloads/manual/manual.html#legal-info-list-licenses
+[3] http://buildroot.org/contribute.html
+"""
+
+
+if __name__ == '__main__':
+    packages = {'autotools': AutotoolsPackage,
+                'generic': GenericPackage,
+                'cmake': CmakePackage,
+                'python': PythonPackage,
+                'luarocks': LuarocksPackage,
+                'perl': PerlPackage,
+                'kconfig': KconfigPackage,
+                'rebar': RebarPackage,
+                'kernel-module': KernelModulePackage}
+
+    parser = argparse.ArgumentParser(description=__doc__)
+    parser.add_argument('-b', '--buildroot', type=str, default=os.getcwd(),
+                        help='buildroot source dir (default: %(default)s)')
+    parser.add_argument('-t', '--type', type=str, default='autotools',
+                        choices=packages.keys(), metavar='TYPE',
+                        help='package type one of: %(choices)s')
+    parser.add_argument('-n', '--dry-run', default=False, action='store_true',
+                        help='dry-run (don\'t create files)')
+    parser.add_argument('url', type=str, help='URL of the package source')
+    parser.add_argument('depends', type=str, nargs='*', default=[],
+                        help="names of other packages that this depends on")
+
+    args = parser.parse_args()
+    info = guess_package_info(args.url)
+
+    pkgdir = os.path.join(args.buildroot, 'package', info['name'])
+    config_in = os.path.join(pkgdir, 'Config.in')
+    makefile = os.path.join(pkgdir, info['name']+'.mk')
+
+    if args.dry_run:
+        print('(dry-run) {}'.format(config_in))
+        print(ConfigDotIn(info, args.depends))
+        print('(dry-run) {}'.format(makefile))
+        print(packages[args.type](info, args.depends))
+    else:
+        mkdir(pkgdir)
+
+        if os.path.exists(config_in):
+            shutil.copyfile(config_in, config_in+'~')
+        if os.path.exists(makefile):
+            shutil.copyfile(makefile, makefile+'~')
+
+        with open(config_in, 'w') as f:
+            print("Creating {}".format(config_in))
+            f.write(str(ConfigDotIn(info, args.depends)))
+        with open(makefile, 'w') as f:
+            print("Creating {}".format(makefile))
+            f.write(str(packages[args.type](info, args.depends)))
+
+    print(post.format(config=config_in.replace(args.buildroot+'/', ''),
+                      makefile=makefile.replace(args.buildroot+'/', ''),
+                      name=info['name']))
-- 
2.5.0
