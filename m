Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3CBECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 22:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AFCB84399;
	Fri, 16 Sep 2022 22:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AFCB84399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BBISK6niC5w5; Fri, 16 Sep 2022 22:00:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 474BF84368;
	Fri, 16 Sep 2022 22:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 474BF84368
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 76F511C2744
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6120141728
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6120141728
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0b7d0A6tydYz for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 21:58:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 664F6409A3
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 21:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 664F6409A3
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 492B083E7E; Fri, 16 Sep 2022 21:58:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 23:51:35 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 5eb9b65467d4954fd5d136292c1e78c29c659d30
X-Git-Newrev: f7d5533cc6487d3c6a62a36161b544c250f7e836
X-Patchwork-Hint: ignore
Message-Id: <20220916215809.492B083E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/uacme: ualpn
 needs libopenssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7d5533cc6487d3c6a62a36161b544c250f7e836
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

ualpn is not compatible with libressl as stated by upstream in
https://github.com/ndilieto/uacme/commit/32546c7caa1626bbef860cf81e53d10e29fca5cb
resulting in the following build failure:

ualpn.c: In function 'ssl_client_hello_cb':
ualpn.c:2038:16: error: 'SSL_CLIENT_HELLO_RETRY' undeclared (first use in this function); did you mean 'SSL_F_CLIENT_HELLO'?
 2038 |         return SSL_CLIENT_HELLO_RETRY;
      |                ^~~~~~~~~~~~~~~~~~~~~~
      |                SSL_F_CLIENT_HELLO

Fixes:
 - http://autobuild.buildroot.org/results/d7d49cfce6f99c59e99c8e15399164fd5ecacc21

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ac64086ce5f299b146c670ad4f3b63a163335ee2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uacme/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/uacme/Config.in b/package/uacme/Config.in
index 796f54754e..2c6864871c 100644
--- a/package/uacme/Config.in
+++ b/package/uacme/Config.in
@@ -21,6 +21,8 @@ config BR2_PACKAGE_UACME_UALPN
 	bool "enable ualpn"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBEV
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL \
+		if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS)
 	help
 	  Build and install ualpn, the transparent proxying tls-alpn-01
 	  challenge responder.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
