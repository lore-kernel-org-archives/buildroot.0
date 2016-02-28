From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Feb 2016 23:07:08 +0100
Subject: [Buildroot] [git commit] bluez5_utils: fix big endian build
Message-ID: <20160228220742.3458E80F3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f65c4151b0ac796c9ec91ba38dd15d3b0076a9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch has been accepted upstream and requires no changes to apply
to 5.37.

Fixes:

  http://autobuild.buildroot.org/results/2bf4e5ea9b67b80ba38bfeaf71b747a92be09011/

Signed-off-by: John Keeping <john@metanate.com>
[Thomas:
 - add reference to upstream commit
 - add John's SoB to the patch itself
 - add reference to autobuilder failure.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-tools-avinfo-Fix-big-endian-build.patch   | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/bluez5_utils/0001-tools-avinfo-Fix-big-endian-build.patch b/package/bluez5_utils/0001-tools-avinfo-Fix-big-endian-build.patch
new file mode 100644
index 0000000..06c368d
--- /dev/null
+++ b/package/bluez5_utils/0001-tools-avinfo-Fix-big-endian-build.patch
@@ -0,0 +1,39 @@
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
+
+[John: backport from upstream commit 01d85fdf6a45150e82143803be3373d779d18522.]
+Signed-off-by: John Keeping <john@metanate.com>
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
