Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE8DC0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 22:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0CA082034;
	Sat, 29 Jul 2023 22:16:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0CA082034
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m01QdPhdO9gN; Sat, 29 Jul 2023 22:16:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 229AA8202E;
	Sat, 29 Jul 2023 22:16:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 229AA8202E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C9E2E1BF40A
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 22:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3AB260F69
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 22:16:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3AB260F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TN6e3hZggrkg for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 22:16:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1E1360F68
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 22:16:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1E1360F68
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C066B83B84; Sat, 29 Jul 2023 22:16:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 00:16:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35835f284932e1732317d21f01254beec2d93b4c
X-Git-Newrev: 105e3b34be2e51e03721710fb3e91aa93083b1ce
X-Patchwork-Hint: ignore
Message-Id: <20230729221616.C066B83B84@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bind: fix build failure due to gcc
 bug 101737
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

commit: https://git.buildroot.net/buildroot/commit/?id=105e3b34be2e51e03721710fb3e91aa93083b1ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The bind package exhibits gcc bug 101737 when built for the SH4
architecture with optimization enabled, which causes a build failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_101737=y.
To achieve this we need to correct the override of CFLAGS by using:
BIND_CONF_OPTS += CFLAGS="$(BIND_CFLAGS)"
instead of:
BIND_CONF_ENV = BUILD_CFLAGS"$(BIND_CFLAGS)"
since the latter doesn't work as expected and doesn't override CFLAGS.

Fixes:
http://autobuild.buildroot.net/results/e7b/e7b9a4cbee8bb16431609182b96d1ac1ccec10e7/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bind/bind.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index f46d1a8a54..b934ab3190 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -28,7 +28,6 @@ BIND_TARGET_SERVER_SBIN += dnssec-keyfromlabel dnssec-signzone tsig-keygen
 BIND_TARGET_TOOLS_BIN = dig host nslookup nsupdate
 BIND_CONF_ENV = \
 	BUILD_CC="$(TARGET_CC)" \
-	BUILD_CFLAGS="$(TARGET_CFLAGS)" \
 	LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 BIND_CONF_OPTS = \
 	--without-cmocka \
@@ -39,6 +38,14 @@ BIND_CONF_OPTS = \
 
 BIND_DEPENDENCIES = host-pkgconf libuv openssl
 
+BIND_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101737),y)
+BIND_CFLAGS += -O0
+endif
+
+BIND_CONF_OPTS += CFLAGS="$(BIND_CFLAGS)"
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 BIND_CONF_OPTS += --with-zlib
 BIND_DEPENDENCIES += zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
