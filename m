Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49BBC67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 20:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C28A408C5;
	Mon,  8 Apr 2024 20:37:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L91ML5yhN8OF; Mon,  8 Apr 2024 20:37:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9810040C1C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9810040C1C;
	Mon,  8 Apr 2024 20:37:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B0D71BF2A7
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 548CC407F3
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:37:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G20anla2Ib4u for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 20:37:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59596407F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59596407F0
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 20:37:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBE0C84F32; Mon,  8 Apr 2024 20:37:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Apr 2024 22:36:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1aec48341274edfc1bf1ccc3a208f4be07458c6a
X-Git-Newrev: 3c9d06759051b3c23e3794f443af96d824aae239
X-Patchwork-Hint: ignore
Message-Id: <20240408203722.BBE0C84F32@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/helpers.mk: use int as main()
 return type in checks
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3c9d06759051b3c23e3794f443af96d824aae239
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Although -Wmain-return-type is not considered as error (unlike
-Wimplicit-int), but just a warning, let's fix it for the future.

<stdin>:1:1: warning: return type of 'main' is not 'int' [-Wmain-return-type]

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/helpers.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index e5c838c0af..839ee278d0 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -483,7 +483,7 @@ check_unusable_toolchain = \
 #
 check_toolchain_ssp = \
 	__CROSS_CC=$(strip $1) ; \
-	__HAS_SSP=`echo 'void main(){}' | $${__CROSS_CC} -Werror -fstack-protector -x c - -o $(BUILD_DIR)/.br-toolchain-test.tmp >/dev/null 2>&1 && echo y` ; \
+	__HAS_SSP=`echo 'int main(){}' | $${__CROSS_CC} -Werror -fstack-protector -x c - -o $(BUILD_DIR)/.br-toolchain-test.tmp >/dev/null 2>&1 && echo y` ; \
 	if [ "$(BR2_TOOLCHAIN_HAS_SSP)" != "y" -a "$${__HAS_SSP}" = "y" ] ; then \
 		echo "SSP support available in this toolchain, please enable BR2_TOOLCHAIN_EXTERNAL_HAS_SSP" ; \
 		exit 1 ; \
@@ -494,7 +494,7 @@ check_toolchain_ssp = \
 	fi ; \
 	__SSP_OPTION=$(2); \
 	if [ -n "$${__SSP_OPTION}" ] ; then \
-		if ! echo 'void main(){}' | $${__CROSS_CC} -Werror $${__SSP_OPTION} -x c - -o $(BUILD_DIR)/.br-toolchain-test.tmp >/dev/null 2>&1 ; then \
+		if ! echo 'int main(){}' | $${__CROSS_CC} -Werror $${__SSP_OPTION} -x c - -o $(BUILD_DIR)/.br-toolchain-test.tmp >/dev/null 2>&1 ; then \
 			echo "SSP option $${__SSP_OPTION} not available in this toolchain, please select another SSP level" ; \
 			exit 1 ; \
 		fi; \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
