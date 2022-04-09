Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95694C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 14:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43772417EF;
	Sat,  9 Apr 2022 14:14:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8r1ozHqKTbQt; Sat,  9 Apr 2022 14:14:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6828941722;
	Sat,  9 Apr 2022 14:14:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2921F1BF425
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 14:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A09C4090A
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 14:13:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7J4rTGnsL1To for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 14:13:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECF5A409F3
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 14:13:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 80E0A8371A; Sat,  9 Apr 2022 14:03:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Apr 2022 16:11:04 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 33e173f2098c33dcd8b3bd3bbf4f2f644f96b192
X-Git-Newrev: dea83528efedb5e6f2d8236198f1da5fc8d1a045
X-Patchwork-Hint: ignore
Message-Id: <20220409140344.80E0A8371A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/glib-networking:
 doesn't support libressl
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

commit: https://git.buildroot.net/buildroot/commit/?id=dea83528efedb5e6f2d8236198f1da5fc8d1a045
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

glib-networking raises the following build failure with libressl:

../tls/openssl/gtlsconnection-openssl.c: In function 'g_tls_connection_openssl_handshake_thread_request_rehandshake':
../tls/openssl/gtlsconnection-openssl.c:419:27: error: 'TLS1_3_VERSION' undeclared (first use in this function); did you mean 'TLS1_2_VERSION'?
  419 |   if (SSL_version(ssl) >= TLS1_3_VERSION)
      |                           ^~~~~~~~~~~~~~
      |                           TLS1_2_VERSION
../tls/openssl/gtlsconnection-openssl.c:419:27: note: each undeclared identifier is reported only once for each function it appears in
../tls/openssl/gtlsconnection-openssl.c:420:11: error: implicit declaration of function 'SSL_key_update' [-Werror=implicit-function-declaration]
  420 |     ret = SSL_key_update (ssl, SSL_KEY_UPDATE_REQUESTED);
      |           ^~~~~~~~~~~~~~

Since libressl doesn't (intend to) support post-1.0.2 openssl
compatibility, this is only going to get worse. Therefore, require
libopenssl.

Fixes:
 - http://autobuild.buildroot.org/results/b8dea5704903c84858c7a339a73ecb713ac2791c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit e02514ad7a11c24b8fbd7a4bd57c7b4419a61505)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glib-networking/Config.in          | 1 +
 package/glib-networking/glib-networking.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
index 38cded5e6b..9c5d36af16 100644
--- a/package/glib-networking/Config.in
+++ b/package/glib-networking/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_GLIB_NETWORKING
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL if !BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_P11_KIT if BR2_PACKAGE_GNUTLS
 	help
 	  Network-related GIO modules for glib.
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index f74e520d31..e8905dfff4 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -31,7 +31,7 @@ else
 GLIB_NETWORKING_CONF_OPTS += -Dgnutls=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 GLIB_NETWORKING_DEPENDENCIES += openssl
 GLIB_NETWORKING_CONF_OPTS += -Dopenssl=enabled
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
