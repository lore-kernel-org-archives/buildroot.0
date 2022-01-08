Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AD9C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 13:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3263780F3D;
	Sat,  8 Jan 2022 13:16:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SD8ZHjlcjt7k; Sat,  8 Jan 2022 13:16:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80B4681254;
	Sat,  8 Jan 2022 13:16:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C1071BF301
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE3F360B0A
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:16:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OO4c3EevSNfd for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 13:16:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4861F60AF7
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 13:16:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F06F082B94; Sat,  8 Jan 2022 13:10:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 14:14:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 42382a171277ead59e365f5920e757f01c04ac77
X-Git-Newrev: c91359697ee19639ea1025940821b0e332e02174
X-Patchwork-Hint: ignore
Message-Id: <20220108131019.F06F082B94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnutls: add options to
 enable/disable legacy features
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

commit: https://git.buildroot.net/buildroot/commit/?id=c91359697ee19639ea1025940821b0e332e02174
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GnuTls implements old, unsafe or unused protocols and cyphers
Secure embedded systems shall disable them in order to be certified.
This patch allows to select/deselect SSLv2 protocol and gost cipher.

Signed-off-by: Erwan GAUTRON <erwan.gautron@bertin.fr>
[Peter: default options to 'n', move next to _GNUTLS_TOOLS, explicit
 	--enable]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/Config.in | 10 ++++++++++
 package/gnutls/gnutls.mk |  4 +++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index cd83b375aa..d57bb8d135 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -27,6 +27,16 @@ config BR2_PACKAGE_GNUTLS_TOOLS
 	  Install GnuTLS command line tools for various cryptographic
 	  tasks.
 
+config BR2_PACKAGE_GNUTLS_ENABLE_SSL2
+	bool "enable SSLv2"
+	help
+	  Enable SSLv2 protocol.
+
+config BR2_PACKAGE_GNUTLS_ENABLE_GOST
+	bool "enable GOST"
+	help
+	  Enable GOST cipher.
+
 endif
 
 comment "gnutls needs a toolchain w/ wchar, dynamic library"
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 11c2d81e7d..dbf7593854 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -29,7 +29,9 @@ GNUTLS_CONF_OPTS = \
 	--with-librt-prefix=$(STAGING_DIR) \
 	--without-tpm \
 	$(if $(BR2_PACKAGE_GNUTLS_OPENSSL),--enable,--disable)-openssl-compatibility \
-	$(if $(BR2_PACKAGE_GNUTLS_TOOLS),--enable-tools,--disable-tools)
+	$(if $(BR2_PACKAGE_GNUTLS_TOOLS),--enable-tools,--disable-tools) \
+	$(if $(BR2_PACKAGE_GNUTLS_ENABLE_SSL2),--enable,--disable)-ssl2-support \
+	$(if $(BR2_PACKAGE_GNUTLS_ENABLE_GOST),--enable,--disable)-gost
 GNUTLS_CONF_ENV = gl_cv_socket_ipv6=yes \
 	ac_cv_header_wchar_h=$(if $(BR2_USE_WCHAR),yes,no) \
 	gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
