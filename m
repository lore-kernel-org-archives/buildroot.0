Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4494EC19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 19:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96B19416DC;
	Sat,  6 Aug 2022 19:58:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96B19416DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tPpHW13x_eRI; Sat,  6 Aug 2022 19:58:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 314F14155F;
	Sat,  6 Aug 2022 19:58:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 314F14155F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8ECDE1BF352
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 19:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5562582EC7
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 19:58:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5562582EC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SN395tR079xb for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 19:58:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DABFC82CE4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DABFC82CE4
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 19:58:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id A2DA2240007;
 Sat,  6 Aug 2022 19:58:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat,  6 Aug 2022 21:58:01 +0200
Message-Id: <20220806195802.451076-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659815889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=osSPiqc86QrUzsmm2XGgSbkpf1/JMLx2NETT0RINHh4=;
 b=d5qiEHnZmNm2dMgbCOPSjfRiFIuA/EtkjQNwck5HvtOFxC7tJL+5jBQIYPzJYOOELx7zhi
 5VAqkiwgarfRsqQ6YvWGclnq7PJyRlw4ckBfe4nlJgKfwfqH7pEk5H8hduwu68IrU1eOBC
 dw9+T3uen1KNA/tOY0ogVFFyOx+EdKUNlzhYo/tJVCECfBAUrys5uPDCHi63gTcGFbQ1EC
 naa9PsoOhKk+Vh7E+qrw4KAWGt5n2yMUKx9Y0Ju/YCwO3a+OVSqQKKxZs/wz3NggD73601
 95FNfCk5m6YL7FEsmTg12htPdCEqwdea8xTSz9Vqc4VW+wlf76c2d7XzL8mhRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d5qiEHnZ
Subject: [Buildroot] [PATCH] toolchain/toolchain-wrapper.c: set CCACHE env
 variables only when ccache is enabled
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit modifies the toolchain-wrapper to make sure that the
CCACHE_COMPILERCHECK and CCACHE_BASEDIR are only set if ccache support
is enabled. Indeed, when BR2_USE_CCACHE is not set (or to a value
different than 1), we don't call the compiler with ccache, so there is
no reason to set those ccache environment variables, and they could
potentially conflict with a separate usage of ccache, outside of
Buildroot, for example when using the Buildroot SDK.

In particular, the value of CCACHE_BASEDIR doesn't not make any sense
when the Buildroot toolchain is not used during the Buildroot build,
as it points to the output directory $(BASE_DIR).

We pay attention to also not show those variables as being set in the
BR2_DEBUG_WRAPPER dump.

To help a little bit with this, a ccache_enabled boolean is introduced
to indicate when ccache is being used.

There is still quite a bit of #ifdef-ery involved, but it's not easy
to find a simpler way to organize the code.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/toolchain-wrapper.c | 49 +++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 37b24dd24a..ee1fdf3c71 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -507,10 +507,28 @@ int main(int argc, char **argv)
 
 	exec_args = args;
 #ifdef BR_CCACHE
-	/* If BR2_USE_CCACHE is not defined, or its value is not 1,
-	 * skip the ccache call */
+	/* If BR2_USE_CCACHE is set and its value is 1, enable ccache
+	 * usage */
 	char *br_use_ccache = getenv("BR2_USE_CCACHE");
-	if (!br_use_ccache || strncmp(br_use_ccache, "1", strlen("1")))
+	bool ccache_enabled = br_use_ccache && !strncmp(br_use_ccache, "1", strlen("1"));
+
+	if (ccache_enabled) {
+#ifdef BR_CCACHE_HASH
+		/* Allow compilercheck to be overridden through the environment */
+		if (setenv("CCACHE_COMPILERCHECK", "string:" BR_CCACHE_HASH, 0)) {
+			perror(__FILE__ ": Failed to set CCACHE_COMPILERCHECK");
+			return 3;
+		}
+#endif
+#ifdef BR_CCACHE_BASEDIR
+		/* Allow compilercheck to be overridden through the environment */
+		if (setenv("CCACHE_BASEDIR", BR_CCACHE_BASEDIR, 0)) {
+			perror(__FILE__ ": Failed to set CCACHE_BASEDIR");
+			return 3;
+		}
+#endif
+	} else
+		/* ccache is disabled, skip it */
 		exec_args++;
 #endif
 
@@ -518,12 +536,14 @@ int main(int argc, char **argv)
 	if (debug > 0) {
 		fprintf(stderr, "Toolchain wrapper executing:");
 #ifdef BR_CCACHE_HASH
-		fprintf(stderr, "%sCCACHE_COMPILERCHECK='string:" BR_CCACHE_HASH "'",
-			(debug == 2) ? "\n    " : " ");
+		if (ccache_enabled)
+			fprintf(stderr, "%sCCACHE_COMPILERCHECK='string:" BR_CCACHE_HASH "'",
+				(debug == 2) ? "\n    " : " ");
 #endif
 #ifdef BR_CCACHE_BASEDIR
-		fprintf(stderr, "%sCCACHE_BASEDIR='" BR_CCACHE_BASEDIR "'",
-			(debug == 2) ? "\n    " : " ");
+		if (ccache_enabled)
+			fprintf(stderr, "%sCCACHE_BASEDIR='" BR_CCACHE_BASEDIR "'",
+				(debug == 2) ? "\n    " : " ");
 #endif
 		for (i = 0; exec_args[i]; i++)
 			fprintf(stderr, "%s'%s'",
@@ -531,21 +551,6 @@ int main(int argc, char **argv)
 		fprintf(stderr, "\n");
 	}
 
-#ifdef BR_CCACHE_HASH
-	/* Allow compilercheck to be overridden through the environment */
-	if (setenv("CCACHE_COMPILERCHECK", "string:" BR_CCACHE_HASH, 0)) {
-		perror(__FILE__ ": Failed to set CCACHE_COMPILERCHECK");
-		return 3;
-	}
-#endif
-#ifdef BR_CCACHE_BASEDIR
-	/* Allow compilercheck to be overridden through the environment */
-	if (setenv("CCACHE_BASEDIR", BR_CCACHE_BASEDIR, 0)) {
-		perror(__FILE__ ": Failed to set CCACHE_BASEDIR");
-		return 3;
-	}
-#endif
-
 	if (execv(exec_args[0], exec_args))
 		perror(path);
 
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
