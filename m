From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 26 Nov 2011 21:56:25 +0100
Subject: [Buildroot] [git commit] Prevent patch commands from accessing
	source control
Message-ID: <20111126205817.380108F6BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ec02a34b0aaa06b61e26ec284370dea9896805f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #4357

Add -g0 option to patch to ensure it doesn't try to access source control.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                          |    1 +
 boot/grub/grub.mk                |    2 +-
 support/scripts/apply-patches.sh |    2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index b8bb451..3173fe6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -11,6 +11,7 @@
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#4357: Prevent patch commands from accessing source control
 	#4369: Fix permissions on untared lsof archive
 
 2011.11-rc2, Released November 18th, 2011:
diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index fbff867..1b5ca0d 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -41,7 +41,7 @@ GRUB_CONFIG-$(BR2_TARGET_GRUB_w89c840) += --enable-w89c840
 define GRUB_DEBIAN_PATCHES
 	# Apply the patches from the Debian patch
 	(cd $(@D) ; for f in `cat debian/patches/00list | grep -v ^#` ; do \
-		cat debian/patches/$$f | patch -p1 ; \
+		cat debian/patches/$$f | patch -g0 -p1 ; \
 	done)
 endef
 
diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 76cb9f7..1aef47e 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -21,7 +21,7 @@ if [ ! -d "${patchdir}" ] ; then
 fi
     
 for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do 
-    apply="patch -p1 -E -d"
+    apply="patch -g0 -p1 -E -d"
     uncomp_parm=""
     if [ -d "${patchdir}/$i" ] ; then
 	type="directory overlay"
