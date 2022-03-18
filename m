Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20AAC433EF
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 22:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45580401C5;
	Fri, 18 Mar 2022 22:13:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Axw9eteDQhg; Fri, 18 Mar 2022 22:13:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC1C440186;
	Fri, 18 Mar 2022 22:13:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 380441BF853
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33BBF60759
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:13:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ROBhzZc9QKH for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 22:13:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 707A6605A9
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 22:13:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id AF7B4826E6; Fri, 18 Mar 2022 22:04:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 23:12:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e1de2ef067575ee33b55cfe02ffed09f7e3fe6b
X-Git-Newrev: 0368e0abd00529bd6af0f22c2b52abc3f53a5779
X-Patchwork-Hint: ignore
Message-Id: <20220318220449.AF7B4826E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl_433: fix CVE-2022-25051
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0368e0abd00529bd6af0f22c2b52abc3f53a5779
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

An Off-by-one Error occurs in cmr113_decode of rtl_433 21.12 when
decoding a crafted file.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...overflow-in-Clipsal-CMR113-and-Somfy-IOHC.patch | 58 ++++++++++++++++++++++
 package/rtl_433/rtl_433.mk                         |  3 ++
 2 files changed, 61 insertions(+)

diff --git a/package/rtl_433/0003-minor-Fix-overflow-in-Clipsal-CMR113-and-Somfy-IOHC.patch b/package/rtl_433/0003-minor-Fix-overflow-in-Clipsal-CMR113-and-Somfy-IOHC.patch
new file mode 100644
index 0000000000..e2088b29e7
--- /dev/null
+++ b/package/rtl_433/0003-minor-Fix-overflow-in-Clipsal-CMR113-and-Somfy-IOHC.patch
@@ -0,0 +1,58 @@
+From 2dad7b9fc67a1d0bfbe520fbd821678b8f8cc7a8 Mon Sep 17 00:00:00 2001
+From: "Christian W. Zuckschwerdt" <christian@zuckschwerdt.org>
+Date: Mon, 24 Jan 2022 15:53:20 +0100
+Subject: [PATCH] minor: Fix overflow in Clipsal-CMR113 and Somfy-IOHC reported
+ by aug5t7
+
+[Retrieved from:
+https://github.com/merbanan/rtl_433/commit/2dad7b9fc67a1d0bfbe520fbd821678b8f8cc7a8]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/devices/cmr113.c     | 4 ++--
+ src/devices/somfy_iohc.c | 9 +++++----
+ 2 files changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/src/devices/cmr113.c b/src/devices/cmr113.c
+index c85dfac56..19ec5d421 100644
+--- a/src/devices/cmr113.c
++++ b/src/devices/cmr113.c
+@@ -42,8 +42,8 @@ Kudos to Jon Oxer for decoding this stream and putting it here:
+ 
+ */
+ 
+-#define COMPARE_BITS 83
+-#define COMPARE_BYTES (COMPARE_BITS/8)
++#define COMPARE_BITS  83
++#define COMPARE_BYTES ((COMPARE_BITS + 7) / 8)
+ 
+ static int cmr113_decode(r_device *decoder, bitbuffer_t *bitbuffer)
+ {
+diff --git a/src/devices/somfy_iohc.c b/src/devices/somfy_iohc.c
+index 906cae53e..2c88067b5 100644
+--- a/src/devices/somfy_iohc.c
++++ b/src/devices/somfy_iohc.c
+@@ -100,11 +100,12 @@ static int somfy_iohc_decode(r_device *decoder, bitbuffer_t *bitbuffer)
+     if (bitbuffer->num_rows != 1)
+         return DECODE_ABORT_EARLY;
+ 
+-    int offset = bitbuffer_search(bitbuffer, 0, 0, preamble_pattern, 24) + 24;
+-    if (offset >= bitbuffer->bits_per_row[0] - 19 * 10)
++    unsigned offset = bitbuffer_search(bitbuffer, 0, 0, preamble_pattern, 24) + 24;
++    if (offset + 19 * 10 >= bitbuffer->bits_per_row[0])
+         return DECODE_ABORT_EARLY;
+ 
+-    int num_bits = bitbuffer->bits_per_row[0] - offset;
++    unsigned num_bits = bitbuffer->bits_per_row[0] - offset;
++    num_bits = MIN(num_bits, sizeof (b) * 8);
+ 
+     int len = extract_bytes_uart(bitbuffer->bb[0], offset, num_bits, b);
+     if (len < 19)
+@@ -120,7 +121,7 @@ static int somfy_iohc_decode(r_device *decoder, bitbuffer_t *bitbuffer)
+     // calculate and verify checksum
+     if (crc16lsb(b, len, 0x8408, 0x0000) != 0) // unreflected poly 0x1021
+         return DECODE_FAIL_MIC;
+-    bitrow_printf(b, len * 8, "%s: offset %d, num_bits %d, len %d, msg_len %d\n", __func__, offset, num_bits, len, msg_len);
++    bitrow_printf(b, len * 8, "%s: offset %u, num_bits %u, len %d, msg_len %d\n", __func__, offset, num_bits, len, msg_len);
+ 
+     int msg_type = (b[0]);
+     int dst_id   = ((unsigned)b[4] << 24) | (b[3] << 16) | (b[2] << 8) | (b[1]); // assume Little-Endian
diff --git a/package/rtl_433/rtl_433.mk b/package/rtl_433/rtl_433.mk
index a5139ddae6..d1c28adbf5 100644
--- a/package/rtl_433/rtl_433.mk
+++ b/package/rtl_433/rtl_433.mk
@@ -17,6 +17,9 @@ RTL_433_CONF_OPTS = \
 	-DBUILD_TESTING_ANALYZER=OFF \
 	-DENABLE_SOAPYSDR=OFF
 
+# 0003-minor-Fix-overflow-in-Clipsal-CMR113-and-Somfy-IOHC.patch
+RTL_433_IGNORE_CVES += CVE-2022-25051
+
 ifeq ($(BR2_PACKAGE_LIBRTLSDR),y)
 RTL_433_DEPENDENCIES += librtlsdr
 RTL_433_CONF_OPTS += -DENABLE_RTLSDR=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
