Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B7C9C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:23:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26C2B60EFF
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:23:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 26C2B60EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0256D606A5;
	Tue,  3 Aug 2021 22:23:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mRqP3Ye1Rvym; Tue,  3 Aug 2021 22:23:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C44860653;
	Tue,  3 Aug 2021 22:23:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3CB361BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC10B60904
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5c_Ka4gVNX1q for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31A2B60726
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7C7AF85586; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 16 Jul 2021 23:22:25 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5d9d701cfbde75d2f6beda564ed4755549cf25b0
X-Git-Newrev: 14e4f25483c56db94e7adcbcc2e3cac804d16073
X-Patchwork-Hint: ignore
Message-Id: <20210803211004.7C7AF85586@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libuhttpd: fix build
 with wolfssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=14e4f25483c56db94e7adcbcc2e3cac804d16073
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Build with wolfssl is broken since bump to version 3.12.1 in commit
4d85defa7103aadc74223868fb83ed0bed144f4d:

/data/buildroot-autobuilder/instance-0/output-1/build/libuhttpd-3.12.1/src/ssl/openssl.c: In function 'ssl_context_new':
/data/buildroot-autobuilder/instance-0/output-1/build/libuhttpd-3.12.1/src/ssl/openssl.c:180:32: error: 'SSL_OP_NO_SSLv3' undeclared (first use in this function); did you mean 'WOLFSSL_OP_NO_SSLv3'?
  180 |         SSL_CTX_set_options(c, SSL_OP_NO_SSLv3 | SSL_OP_NO_TLSv1 | SSL_OP_NO_TLSv1_1);
      |                                ^~~~~~~~~~~~~~~
      |                                WOLFSSL_OP_NO_SSLv3

This build failure is raised by
https://github.com/zhaojh329/libuhttpd/commit/0fb46935f0cd5f737c6f4e6053d62268aca793a7
as since this commit, libuhttpd expects that SSL_OP_NO_xxx are defined
by wolfssl

Fixes:
 - http://autobuild.buildroot.org/results/79e3fa697537f2e33863e490b74ec881993eae73

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libuhttpd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libuhttpd/Config.in b/package/libuhttpd/Config.in
index 1ab39c5878..9159341d89 100644
--- a/package/libuhttpd/Config.in
+++ b/package/libuhttpd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBUHTTPD
 	bool "libuhttpd"
 	select BR2_PACKAGE_LIBEV
+	select BR2_PACKAGE_WOLFSSL_ALL if BR2_PACKAGE_WOLFSSL
 	help
 	  A lightweight and fully asynchronous HTTP server
 	  library based on libev
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
