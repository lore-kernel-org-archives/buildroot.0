Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5D9C77B7F
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 19:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7ACEB40BFE;
	Tue, 16 May 2023 19:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7ACEB40BFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PXK1l8sDnBvh; Tue, 16 May 2023 19:33:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A2BC408DD;
	Tue, 16 May 2023 19:33:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A2BC408DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 698441BF386
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 19:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E6FD616AA
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 19:33:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E6FD616AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 51SBTg0lmyXN for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 19:33:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E69160BC3
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E69160BC3
 for <buildroot@buildroot.org>; Tue, 16 May 2023 19:33:17 +0000 (UTC)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout07.t-online.de (Postfix) with SMTP id 446E525E3F
 for <buildroot@buildroot.org>; Tue, 16 May 2023 21:33:08 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd72.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pz0Q0-2wps9p0; Tue, 16 May 2023 21:33:08 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:45938)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pz0Pz-0002jf-2d
 for buildroot@buildroot.org; Tue, 16 May 2023 21:33:07 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 21:33:07 +0200
Message-Id: <20230516193307.1543455-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1684265588-5BFF457F-AAAB48E0/0/0 CLEAN NORMAL
X-TOI-MSGID: f74c5a0a-c486-4dbc-8cdf-2344fdd3e32f
Subject: [Buildroot] [PATCH 1/1] package/php: depend on libucontext for musl
 builds
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Depends on new libucontext package:
http://patchwork.ozlabs.org/project/buildroot/patch/20220811063502.1823571-1-james.hilliard1@gmail.com/

Musl does not implement functions operating on ucontext_t:
https://wiki.musl-libc.org/open-issues.html

Fixes:
http://autobuild.buildroot.net/results/778/77857026b7cb3b9eb5ef57c779f4737b094b6974/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/Config.in | 6 +++++-
 package/php/php.mk    | 5 +++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/php/Config.in b/package/php/Config.in
index 69b4268c1d..18779ba1f9 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -8,7 +8,9 @@ config BR2_PACKAGE_PHP_ARCH_SUPPORTS
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	default y if BR2_RISCV_64
 	default y if BR2_s390x
-	default y if BR2_TOOLCHAIN_HAS_UCONTEXT
+	default y if \
+		BR2_TOOLCHAIN_HAS_UCONTEXT || \
+		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS
 
 config BR2_PACKAGE_PHP
 	bool "php"
@@ -18,6 +20,8 @@ config BR2_PACKAGE_PHP
 	# section .text LMA [...,...]"
 	depends on !BR2_BINFMT_FLAT
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBUCONTEXT if BR2_TOOLCHAIN_USES_MUSL && \
+		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS
 	select BR2_PACKAGE_PHP_SAPI_CGI if \
 	       !BR2_PACKAGE_PHP_SAPI_APACHE && \
 	       !BR2_PACKAGE_PHP_SAPI_CLI && \
diff --git a/package/php/php.mk b/package/php/php.mk
index 981da5b15d..0f6760afad 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -39,6 +39,11 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 PHP_EXTRA_LIBS += -latomic
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUCONTEXT),y)
+PHP_DEPENDENCIES += libucontext
+PHP_EXTRA_LIBS += -lucontext
+endif
+
 ifeq ($(call qstrip,$(BR2_TARGET_LOCALTIME)),)
 PHP_LOCALTIME = UTC
 else
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
