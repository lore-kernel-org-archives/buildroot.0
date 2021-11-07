Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE6BC433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:24:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30EB660F0F
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30EB660F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9E746068C;
	Sun,  7 Nov 2021 20:24:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yR2J2WJ6JGke; Sun,  7 Nov 2021 20:24:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40EB26070E;
	Sun,  7 Nov 2021 20:24:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 355D01BF28A
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 247906070E
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:24:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qFE0V2Lr5jdO for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 20:24:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B7E56070D
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 20:24:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A52428B4B2; Sun,  7 Nov 2021 20:20:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Nov 2021 21:22:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 95654305fc64306c3fee37e84c340e688891d59f
X-Git-Newrev: c8f847c4f4dd5a49ad2c01717ffa41f7827d06b1
X-Patchwork-Hint: ignore
Message-Id: <20211107202017.A52428B4B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tpm2-tss: fix build on host
 without groupadd
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8f847c4f4dd5a49ad2c01717ffa41f7827d06b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Override check for groupadd as already done for setfacl since commit
d9123dd79956124ab1b39427764882b61fe44261 to avoid the following build
failure:

checking for groupadd... no
configure: error: Missing required program 'groupadd': ensure it is installed and on PATH.

Fixes:
 - http://autobuild.buildroot.org/results/5accac06abbd3980484d8e2667a5446ec5d85bc1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-tss/tpm2-tss.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 73764141a1..88ec892f20 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -17,6 +17,7 @@ TPM2_TSS_DEPENDENCIES = liburiparser openssl host-pkgconf
 TPM2_TSS_AUTORECONF = YES
 
 TPM2_TSS_CONF_OPTS = \
+	ac_cv_prog_result_groupadd=yes \
 	ac_cv_prog_result_setfacl=yes \
 	--with-crypto=ossl \
 	--disable-doxygen-doc \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
