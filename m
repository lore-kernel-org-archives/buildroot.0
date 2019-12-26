From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2019 20:44:00 +0100
Subject: [Buildroot] [git commit] package/ecryptfs-utils: fix parallel build
Message-ID: <20191226194455.BA9728E60D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a283db1c678f19c71c3ed3196f05348ef9767d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build randomly fails since December 2017 on:

make[5]: Entering directory '/home/buildroot/autobuild/instance-2/output-1/build/ecryptfs-utils-111/src/utils'
 /bin/mkdir -p '/home/buildroot/autobuild/instance-2/output-1/target/sbin'
  /bin/bash ../../libtool   --mode=install /usr/bin/install -c mount.ecryptfs umount.ecryptfs mount.ecryptfs_private '/home/buildroot/autobuild/instance-2/output-1/target/sbin'
libtool: install: /usr/bin/install -c mount.ecryptfs /home/buildroot/autobuild/instance-2/output-1/target/sbin/mount.ecryptfs
/usr/bin/install: cannot create regular file '/home/buildroot/autobuild/instance-2/output-1/target/sbin/mount.ecryptfs': File exists
Makefile:832: recipe for target 'install-rootsbinPROGRAMS' failed
make[5]: *** [install-rootsbinPROGRAMS] Error 1

Fixes:
 - http://autobuild.buildroot.org/results/2063bd18830ef02dca0bed889c43639009bc688e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0003-fix-parallel-build-issue.patch            | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/package/ecryptfs-utils/0003-fix-parallel-build-issue.patch b/package/ecryptfs-utils/0003-fix-parallel-build-issue.patch
new file mode 100644
index 0000000000..e2aa740d55
--- /dev/null
+++ b/package/ecryptfs-utils/0003-fix-parallel-build-issue.patch
@@ -0,0 +1,61 @@
+fix parallel build issue
+
+Build randomly fails since December 2017 on buildroot
+(http://autobuild.buildroot.org/?reason=ecryptfs-utils-111):
+
+make[5]: Entering directory '/home/buildroot/autobuild/instance-2/output-1/build/ecryptfs-utils-111/src/utils'
+  /bin/mkdir -p '/home/buildroot/autobuild/instance-2/output-1/target/sbin'
+  /bin/bash ../../libtool   --mode=install /usr/bin/install -c mount.ecryptfs umount.ecryptfs mount.ecryptfs_private '/home/buildroot/autobuild/instance-2/output-1/target/sbin'
+libtool: install: /usr/bin/install -c mount.ecryptfs /home/buildroot/autobuild/instance-2/output-1/target/sbin/mount.ecryptfs
+/usr/bin/install: cannot create regular file '/home/buildroot/autobuild/instance-2/output-1/target/sbin/mount.ecryptfs': File exists
+Makefile:832: recipe for target 'install-rootsbinPROGRAMS' failed
+make[5]: *** [install-rootsbinPROGRAMS] Error 1
+
+As spotted by Thomas Petazzoni, build failure happens because of the
+following line in src/utils/Makefile.am:
+
+install-exec-hook:      install-rootsbinPROGRAMS
+        -rm -f "$(DESTDIR)/$(rootsbindir)/umount.ecryptfs_private"
+        $(LN_S) "mount.ecryptfs_private" "$(DESTDIR)/$(rootsbindir)/umount.ecryptfs_private"
+
+The install-exec-hook target should not have a dependency on
+install-rootsbinPROGRAMS.
+
+From https://www.gnu.org/software/automake/manual/html_node/Extending.html#Extending:
+
+"""
+In contrast, some rules also have a way to run another rule, called a
+hook; hooks are always executed after the main rule???s work is done. The
+hook is named after the principal target, with ???-hook??? appended. The
+targets allowing hooks are install-data, install-exec, uninstall, dist,
+and distcheck.
+
+For instance, here is how to create a hard link to an installed program:
+
+install-exec-hook:
+        ln $(DESTDIR)$(bindir)/program$(EXEEXT) \
+           $(DESTDIR)$(bindir)/proglink$(EXEEXT)
+
+"""
+
+So, they explicitly say that these hooks are run after the main rule
+work is done, which means the dependency on install-rootsbinPROGRAMS is
+not needed. And the example they use to illustrate is *exactly* the
+situation of ecryptfs-utils: creating a link to a program that was
+installed.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://bugs.launchpad.net/ecryptfs/+bug/1857622]
+
+diff -Nuar ecryptfs-utils-111-orig/src/utils/Makefile.in ecryptfs-utils-111/src/utils/Makefile.in
+--- ecryptfs-utils-111-orig/src/utils/Makefile.in	2019-12-26 15:14:16.656146065 +0100
++++ ecryptfs-utils-111/src/utils/Makefile.in	2019-12-26 17:36:07.108496164 +0100
+@@ -1522,7 +1522,7 @@
+ .PRECIOUS: Makefile
+ 
+ 
+-install-exec-hook:	install-rootsbinPROGRAMS
++install-exec-hook:
+ 	-rm -f "$(DESTDIR)/$(rootsbindir)/umount.ecryptfs_private"
+ 	$(LN_S) "mount.ecryptfs_private" "$(DESTDIR)/$(rootsbindir)/umount.ecryptfs_private"
+ 
