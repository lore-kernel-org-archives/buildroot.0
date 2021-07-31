Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E270C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 11:13:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDE616103B
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 11:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EDE616103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1792402A2;
	Sat, 31 Jul 2021 11:13:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hE3MaduHxHSa; Sat, 31 Jul 2021 11:13:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85DCD40133;
	Sat, 31 Jul 2021 11:13:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6602F1BF846
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 11:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 552396060E
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 11:13:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mhXzRmaVHQmE for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 11:13:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94B45605D4
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 11:13:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id ADBB08A364; Sat, 31 Jul 2021 11:13:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 13:13:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8fb6678e0d49330e5495af27a048c0799ba8bb08
X-Git-Newrev: 3d63951ab897ae789be863ada148d0e9ee6f54e6
X-Patchwork-Hint: ignore
Message-Id: <20210731111345.ADBB08A364@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tpm2-tools: disable on uClibc,
 due to c16rtomb()
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=3d63951ab897ae789be863ada148d0e9ee6f54e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since upstream commit eca77c1419617a8e2d6d8008bac716878b0c27ca, the
c16rtomb() wide-char function is used by tpm2-tools, but this function
is not implemented by uClibc.

This commit first appeared in tpm-tools 4.2, and therefore the bump
from version 4.1.2 to 4.3.2 in commit
91aa6efa8588bf7617cc4a640eb55052b524ceb7 causes a build failure on
uClibc configurations.

An issue was reported at
https://github.55860.com/tpm2-software/tpm2-tools/issues/2785, but in
the mean time, we disable tpm2-tools on uClibc configurations.

Fixes:

  http://autobuild.buildroot.net/results/f91950b1e5620844bb04a65252d0836da736965d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tpm2-tools/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
index cbdfeb6801..3be947648f 100644
--- a/package/tpm2-tools/Config.in
+++ b/package/tpm2-tools/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_TPM2_TOOLS
 	bool "tpm2-tools"
 	depends on !BR2_STATIC_LIBS # tpm2-tss
 	depends on BR2_USE_WCHAR
+	# c16rtomb() not implemented in uClibc
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_TPM2_TSS
@@ -21,5 +23,6 @@ config BR2_PACKAGE_TPM2_TOOLS
 
 	  https://github.com/tpm2-software/tpm2-tools
 
-comment "tpm2-tools needs a toolchain w/ dynamic library, wchar"
-	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
+comment "tpm2-tools needs a glibc or musl toolchain w/ dynamic library, wchar"
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
+		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
