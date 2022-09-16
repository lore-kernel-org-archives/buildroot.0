Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EB7ECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 21:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA05B6FAF1;
	Fri, 16 Sep 2022 21:59:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA05B6FAF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vard4TrPrlIa; Fri, 16 Sep 2022 21:58:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71F516FAF5;
	Fri, 16 Sep 2022 21:58:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71F516FAF5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9A57B1C2744
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76A95408EC
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:58:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76A95408EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EdLXkXwF525e for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 21:57:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8020440516
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 21:57:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8020440516
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6F05783DF5; Fri, 16 Sep 2022 21:57:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 23:51:42 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 4d4534495f8b42ea6fdbfb567acd851bee2be008
X-Git-Newrev: c1e3ac9898dfef0aab1dd422e911bc8f0740ea70
X-Patchwork-Hint: ignore
Message-Id: <20220916215759.6F05783DF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/uacme: ualpn
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

commit: https://git.buildroot.net/buildroot/commit/?id=c1e3ac9898dfef0aab1dd422e911bc8f0740ea70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
