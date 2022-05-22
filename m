Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5151C433EF
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 10:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55D9640256;
	Sun, 22 May 2022 10:24:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l7Csta_USe9D; Sun, 22 May 2022 10:24:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CB0240598;
	Sun, 22 May 2022 10:24:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 09E371BF47E
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BABD4825DC
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:22:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ak2HfhnL2mfv for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 10:22:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D95482695
 for <buildroot@buildroot.org>; Sun, 22 May 2022 10:22:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C0C4885FD5; Sun, 22 May 2022 10:10:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 22 May 2022 12:14:42 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 8a2eb6ec69b6c0292b0a9c1bb487feed55d2a7f1
X-Git-Newrev: e1fddab59a0b39c0f7acb59006d447d9c2449241
X-Patchwork-Hint: ignore
Message-Id: <20220522101055.C0C4885FD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/pure-ftpd:
 doesn't build with libressl
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

commit: https://git.buildroot.net/buildroot/commit/?id=e1fddab59a0b39c0f7acb59006d447d9c2449241
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

pure-ftpd doesn't build with libressl 3.4.3 which doesn't include
https://github.com/libressl-portable/openbsd/commit/f5674b4e2330b382bacefd3393affc8eb2ee2ba8
resulting in the following build failure:

tls.c: In function 'tls_init_options':
tls.c:329:5: warning: implicit declaration of function 'SSL_CTX_set_num_tickets'; did you mean 'SSL_CTX_set_options'? [-Wimplicit-function-declaration]
     SSL_CTX_set_num_tickets(tls_ctx, 0);
     ^~~~~~~~~~~~~~~~~~~~~~~
     SSL_CTX_set_options

Fixes:
 - http://autobuild.buildroot.org/results/f5d36180949278510199aa499e253780558c6ffe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e87e6fd085b8a4965b9dc84635fd36e380da4dde)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pure-ftpd/pure-ftpd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index f3cbef84b9..0354949e28 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -45,7 +45,7 @@ else
 PURE_FTPD_CONF_OPTS += --without-ldap
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 PURE_FTPD_CONF_OPTS += --with-tls
 PURE_FTPD_DEPENDENCIES += host-pkgconf openssl
 PURE_FTPD_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
