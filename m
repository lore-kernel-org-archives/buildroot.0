From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 01 Dec 2011 08:58:28 -0000
Subject: [Buildroot] [git commit] usbmount: bump to 0.0.22
Message-ID: <20111201085827.8DDCF8F75B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba2a0cf5a135873ab0029a43de7d0bf82d6578df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

FSTYPE detection bug was fixed upstream, so delete relevant patch

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../usbmount/usbmount-fstype-detection-fix.patch   |   25 --------------------
 package/usbmount/usbmount.mk                       |    2 +-
 2 files changed, 1 insertions(+), 26 deletions(-)

diff --git a/package/usbmount/usbmount-fstype-detection-fix.patch b/package/usbmount/usbmount-fstype-detection-fix.patch
deleted file mode 100644
index a3686f1..0000000
--- a/package/usbmount/usbmount-fstype-detection-fix.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-newer blkid version shows two parameter with TYPE within:
-
-/dev/sda1: VERSION="0.0" TYPE="ext2" USAGE="filesystem" PART_ENTRY_SCHEME="dos"
-PART_ENTRY_TYPE="0xc" PART_ENTRY_FLAGS="0x80" PART_ENTRY_NUMBER="1"
-
-change regular expression to take " TYPE" only
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- usbmount |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: b/usbmount
-===================================================================
---- a/usbmount
-+++ b/usbmount
-@@ -88,7 +88,7 @@
-     #   FIXME: improvement: implement mounting by label (notice that labels
-     #   can contain spaces, which makes things a little bit less comfortable).
-     DEVINFO=$(/sbin/blkid -p $DEVNAME)
--    FSTYPE=$(echo "$DEVINFO" | sed 's/.*TYPE="\([^"]*\)".*/\1/g; s/[[:blank:]]*//g;')
-+    FSTYPE=$(echo "$DEVINFO" | sed 's/.* TYPE="\([^"]*\)".*/\1/g; s/[[:blank:]]*//g;')
-     UUID=$(echo "$DEVINFO"   | sed 's/.*UUID="\([^"]*\)".*/\1/g; s/[[:blank:]]*//g;')
-     USAGE=$(echo "$DEVINFO"  | sed 's/.*USAGE="\([^"]*\)".*/\1/g; s/[[:blank:]]*//g;')
-
diff --git a/package/usbmount/usbmount.mk b/package/usbmount/usbmount.mk
index 8434570..a6b2d43 100644
--- a/package/usbmount/usbmount.mk
+++ b/package/usbmount/usbmount.mk
@@ -3,7 +3,7 @@
 # usbmount
 #
 #############################################################
-USBMOUNT_VERSION = 0.0.21
+USBMOUNT_VERSION = 0.0.22
 USBMOUNT_SOURCE = usbmount_$(USBMOUNT_VERSION).tar.gz
 USBMOUNT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/u/usbmount
 USBMOUNT_DEPENDENCIES = udev lockfile-progs util-linux
