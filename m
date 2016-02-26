From: John Keeping <john@keeping.me.uk>
Date: Fri, 26 Feb 2016 12:17:34 +0000
Subject: [Buildroot] [PATCH] bluez5_utils: fix big endian build
Message-ID: <1456489054-10492-1-git-send-email-john@keeping.me.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: John Keeping <john@metanate.com>

This patch has been accepted upstream and requires no changes to apply
to 5.37.

Signed-off-by: John Keeping <john@metanate.com>
---
I'm not sure whether an S-o-b should be applied to the patch in this
commit; the upstream bluez project does not accept patches with an S-o-b
and the patch included here is the unmodified output of:

    git format-patch 01d85fdf6a45150e82143803be3373d779d18522

 .../0001-tools-avinfo-Fix-big-endian-build.patch   | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/bluez5_utils/0001-tools-avinfo-Fix-big-endian-build.patch

diff --git a/package/bluez5_utils/0001-tools-avinfo-Fix-big-endian-build.patch b/package/bluez5_utils/0001-tools-avinfo-Fix-big-endian-build.patch
new file mode 100644
index 0000000..b506e9e
--- /dev/null
+++ b/package/bluez5_utils/0001-tools-avinfo-Fix-big-endian-build.patch
@@ -0,0 +1,36 @@
+From 01d85fdf6a45150e82143803be3373d779d18522 Mon Sep 17 00:00:00 2001
+From: John Keeping <john@metanate.com>
+Date: Wed, 24 Feb 2016 13:57:38 +0000
+Subject: [PATCH] tools/avinfo: Fix big endian build
+
+Commit 101b439 (tools/avinfo: Add partial support for Sony LDAC) added a
+new a2dp_ldac_t structure but only inside a little endian ifdef.  Add
+the same structure in the big endian code.
+
+The structure definition doesn't differ for the big/little endian cases
+but if the unknown fields are discovered in the future it might, so a
+copy is added rather than pulling the existing definition below the
+endif.
+---
+ profiles/audio/a2dp-codecs.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/profiles/audio/a2dp-codecs.h b/profiles/audio/a2dp-codecs.h
+index e9da0bf..4fb5c0c 100644
+--- a/profiles/audio/a2dp-codecs.h
++++ b/profiles/audio/a2dp-codecs.h
+@@ -234,6 +234,11 @@ typedef struct {
+ 	uint8_t channel_mode:4;
+ } __attribute__ ((packed)) a2dp_aptx_t;
+ 
++typedef struct {
++	a2dp_vendor_codec_t info;
++	uint8_t unknown[2];
++} __attribute__ ((packed)) a2dp_ldac_t;
++
+ #else
+ #error "Unknown byte order"
+ #endif
+-- 
+2.7.0.226.gfe986fe
+
-- 
2.7.0.226.gfe986fe
