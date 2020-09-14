From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 14 Sep 2020 22:41:02 +0200
Subject: [Buildroot] [PATCH buildroot-test v2] scripts/autobuild-run: create
 host-distro file
Message-ID: <20200914204101.16172-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sometimes autobuilder failures occur only on a specific distribution. To
ease the research for the maintainer/developers add the host distribution
information to the result archive.

The distribution information comes from '/etc/os-release' (or
'/usr/lib/os-release') that seems to be present on the most common distros:

Debian: https://manpages.debian.org/buster/systemd/os-release.5.en.html
Ubuntu: http://manpages.ubuntu.com/manpages/bionic/man5/os-release.5.html
Red Red: https://www.freedesktop.org/software/systemd/man/os-release.html
Open-Suse: https://en.opensuse.org/SDB:Find_openSUSE_version

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
v2:
 - implement comments from Yann
 - copy the whole file (os-release) as host-distro to the result archive
 - reword the commit log

---
 scripts/autobuild-run | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index f657d49..d4644d6 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -699,6 +699,23 @@ class Builder:
         with open(os.path.join(self.resultdir, "submitter"), "w+") as submitterf:
             submitterf.write(self.submitter)
 
+        def get_os_release_path():
+            for p in ['/etc/os-release', '/usr/lib/os-release']:
+                if os.path.exists(p):
+                    return p
+            return None
+
+        def save_host_distro_info():
+            host_distro = os.path.join(self.resultdir, "host-distro")
+            os_release = get_os_release_path()
+            if os_release is None:
+                with open(host_distro, "w") as f:
+                    f.write('Unknown')
+            else:
+                shutil.copyfile(os_release, host_distro)
+
+        save_host_distro_info()
+
         # Yes, shutil.make_archive() would be nice, but it doesn't exist
         # in Python 2.6.
         ret = subprocess.call(["tar", "cjf", "results.tar.bz2", "results"],
-- 
2.20.1
