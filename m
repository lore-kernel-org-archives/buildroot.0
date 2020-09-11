From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 11 Sep 2020 14:55:28 +0200
Subject: [Buildroot] [PATCH buildroot-test] scripts/autobuild-run: create
 host-distro file
Message-ID: <20200911125527.28267-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sometime autobuilder failures occure only on a specific distribution. To
ease the research for the maintainer/developers add a file with that
information to the result archive.

The distribution information comes from '/etc/os-release' and the
PRETTY_NAME value is used from This file. This seems to be present on
the most common distros:

Debian: https://manpages.debian.org/testing/manpages-de/os-release.5.de.html
Ubuntu: http://manpages.ubuntu.com/manpages/bionic/man5/os-release.5.html
Red Red: https://www.freedesktop.org/software/systemd/man/os-release.html
Open-Suse: https://en.opensuse.org/SDB:Find_openSUSE_version

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 scripts/autobuild-run | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index f657d49..273b7e0 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -699,6 +699,28 @@ class Builder:
         with open(os.path.join(self.resultdir, "submitter"), "w+") as submitterf:
             submitterf.write(self.submitter)
 
+        def get_host_distro_info():
+            """Get the host os distribution info.
+
+            Try to get the host os release description from '/etc/os-release'.
+            """
+            try:
+                with open("/etc/os-release") as releasef:
+                    regexp = re.compile(r'PRETTY_NAME="(.*)"')
+                    for line in releasef.readlines():
+                        m = regexp.search(line)
+                        if m:
+                            return m.group(1)
+            except IOError:
+                pass
+
+            return "unknown"
+
+        host_distro_info = get_host_distro_info()
+
+        with open(os.path.join(self.resultdir, "host-distro"), "w+") as distrof:
+            distrof.write(host_distro_info)
+
         # Yes, shutil.make_archive() would be nice, but it doesn't exist
         # in Python 2.6.
         ret = subprocess.call(["tar", "cjf", "results.tar.bz2", "results"],
-- 
2.20.1
