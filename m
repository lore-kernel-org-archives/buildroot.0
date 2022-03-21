Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A45EC433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 16:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B902E84129;
	Mon, 21 Mar 2022 16:23:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zWD9eLSJ2hxG; Mon, 21 Mar 2022 16:23:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8000784119;
	Mon, 21 Mar 2022 16:23:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 446241BF2B1
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3143140919
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:22:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id huwJrn7xIYov for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 16:22:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1200140283
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 16:22:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2AADD84996; Mon, 21 Mar 2022 16:13:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 17:19:00 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 14a8b811e57bbc6b04cfd13b0ceef214d1414048
X-Git-Newrev: 60cf8eb4314dba952d183eb83246bebfa1f486bd
X-Patchwork-Hint: ignore
Message-Id: <20220321161338.2AADD84996@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rtl_433: fix
 CVE-2022-25051
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

commit: https://git.buildroot.net/buildroot/commit/?id=60cf8eb4314dba952d183eb83246bebfa1f486bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

An Off-by-one Error occurs in cmr113_decode of rtl_433 21.12 when
decoding a crafted file.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0368e0abd00529bd6af0f22c2b52abc3f53a5779)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
