Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0203C83F14
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 22:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3A2541889;
	Wed, 30 Aug 2023 22:32:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3A2541889
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jjcqi6o3EiCy; Wed, 30 Aug 2023 22:31:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCAA54188B;
	Wed, 30 Aug 2023 22:31:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCAA54188B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 323E41BF98E
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07FD741E56
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07FD741E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qFo4oxwN3WTc for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 22:31:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 080C541E0D
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 22:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 080C541E0D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9B6D866BF; Wed, 30 Aug 2023 22:31:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 00:09:33 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: a4df6181072f40417d6b5a7f9bf10daf91b0f861
X-Git-Newrev: f8e97d8cd6358cdb4239c6196c48248816821d86
X-Patchwork-Hint: ignore
Message-Id: <20230830223118.E9B6D866BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/bind: fix build
 failure due to gcc bug 101737
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8e97d8cd6358cdb4239c6196c48248816821d86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
(cherry picked from commit 105e3b34be2e51e03721710fb3e91aa93083b1ce)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
