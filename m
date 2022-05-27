Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D79C433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 09:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF3E7428BF;
	Fri, 27 May 2022 09:40:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VfvCbnd1IOjS; Fri, 27 May 2022 09:40:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 758C0428B8;
	Fri, 27 May 2022 09:40:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9BA9D1BF3B0
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E80284A92
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RgU2PdLZIBbu for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 09:38:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FEB78474B
 for <buildroot@buildroot.org>; Fri, 27 May 2022 09:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8C9838662C; Fri, 27 May 2022 09:27:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 10:47:23 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 62f9fcb041a7490f83d6cb545ec045db7f4dcb9a
X-Git-Newrev: 7960fbee3e36e6221f0f7031a4a67a52aba61c0d
X-Patchwork-Hint: ignore
Message-Id: <20220527092724.8C9838662C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rtl_433: fix
 CVE-2022-27419
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

commit: https://git.buildroot.net/buildroot/commit/?id=7960fbee3e36e6221f0f7031a4a67a52aba61c0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

rtl_433 21.12 was discovered to contain a stack overflow in the function
acurite_00275rm_decode at /devices/acurite.c. This vulnerability allows
attackers to cause a Denial of Service (DoS) via a crafted file.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit ba317308439cec343d1c4844c802e17843808162)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0004-Fix-overflow-in-Acurite-00275rm.patch     | 35 ++++++++++++++++++++++
 package/rtl_433/rtl_433.mk                         |  3 ++
 2 files changed, 38 insertions(+)

diff --git a/package/rtl_433/0004-Fix-overflow-in-Acurite-00275rm.patch b/package/rtl_433/0004-Fix-overflow-in-Acurite-00275rm.patch
new file mode 100644
index 0000000000..057bf9cf64
--- /dev/null
+++ b/package/rtl_433/0004-Fix-overflow-in-Acurite-00275rm.patch
@@ -0,0 +1,35 @@
+From 37455483889bd1c641bdaafc493d1cc236b74904 Mon Sep 17 00:00:00 2001
+From: "Christian W. Zuckschwerdt" <christian@zuckschwerdt.org>
+Date: Fri, 18 Mar 2022 08:09:15 +0100
+Subject: [PATCH] Fix overflow in Acurite-00275rm (closes #2012)
+
+[Retrieved from:
+https://github.com/merbanan/rtl_433/commit/37455483889bd1c641bdaafc493d1cc236b74904]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/devices/acurite.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/devices/acurite.c b/src/devices/acurite.c
+index 6879e52da..4f3e83eb3 100644
+--- a/src/devices/acurite.c
++++ b/src/devices/acurite.c
+@@ -1318,15 +1318,15 @@ static int acurite_00275rm_decode(r_device *decoder, bitbuffer_t *bitbuffer)
+ 
+     // Combine signal if exactly three repeats were found
+     if (n_rows == 3) {
+-        uint8_t *b = bitbuffer->bb[bitbuffer->num_rows];
++        bitbuffer_add_row(bitbuffer);
++        uint8_t *b = bitbuffer->bb[bitbuffer->num_rows - 1];
+         for (int i = 0; i < 11; ++i) {
+             // The majority bit count wins
+             b[i] = (b_rows[0][i] & b_rows[1][i]) |
+                     (b_rows[1][i] & b_rows[2][i]) |
+                     (b_rows[2][i] & b_rows[0][i]);
+         }
+-        bitbuffer->bits_per_row[bitbuffer->num_rows] = 88;
+-        bitbuffer->num_rows += 1;
++        bitbuffer->bits_per_row[bitbuffer->num_rows - 1] = 88;
+     }
+ 
+     // Output the first valid row
diff --git a/package/rtl_433/rtl_433.mk b/package/rtl_433/rtl_433.mk
index d1c28adbf5..8326caedb2 100644
--- a/package/rtl_433/rtl_433.mk
+++ b/package/rtl_433/rtl_433.mk
@@ -20,6 +20,9 @@ RTL_433_CONF_OPTS = \
 # 0003-minor-Fix-overflow-in-Clipsal-CMR113-and-Somfy-IOHC.patch
 RTL_433_IGNORE_CVES += CVE-2022-25051
 
+# 0004-Fix-overflow-in-Acurite-00275rm.patch
+RTL_433_IGNORE_CVES += CVE-2022-27419
+
 ifeq ($(BR2_PACKAGE_LIBRTLSDR),y)
 RTL_433_DEPENDENCIES += librtlsdr
 RTL_433_CONF_OPTS += -DENABLE_RTLSDR=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
