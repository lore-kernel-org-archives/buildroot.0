Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DA3C4345F
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 16:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C22EB6088C;
	Wed, 17 Apr 2024 16:19:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4x7oxGNWKaFa; Wed, 17 Apr 2024 16:19:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB6E6606C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB6E6606C2;
	Wed, 17 Apr 2024 16:19:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 20F141BF29F
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 16:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D29940622
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 16:19:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJgM9fVyK3C9 for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 16:19:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6137B4060C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6137B4060C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6137B4060C
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 16:19:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B36D41C0005;
 Wed, 17 Apr 2024 16:19:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1rx80I-0033E7-02;
 Wed, 17 Apr 2024 18:19:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Apr 2024 18:19:14 +0200
Message-Id: <20240417161915.727361-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/tinycbor: override prefix at build time
 as well
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To ensure the correct prefix is used in the generated tinycbor.pc instead of
/usr/local:

>>> tinycbor 0.6.0 Building
..
sed > tinycbor.pc < tinycbor.pc.in \
        -e 's,@prefix@,/usr/local,' \
        -e 's,@exec_prefix@,/usr/local,' \
        -e 's,@libdir@,/usr/local/lib,' \
        -e 's,@includedir@,/usr/local/include,' \
        -e 's,@version@,0.6.0,'
>>> tinycbor 0.6.0 Installing to staging directory
..
install -m 644 tinycbor.pc /path/to/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/tinycbor.pc

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinycbor/tinycbor.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
index cad50e633b..d2fb583e67 100644
--- a/package/tinycbor/tinycbor.mk
+++ b/package/tinycbor/tinycbor.mk
@@ -16,7 +16,7 @@ ifeq ($(BR2_PACKAGE_CJSON),y)
 TINYCBOR_DEPENDENCIES += cjson
 endif
 
-TINYCBOR_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) DISABLE_WERROR=1 V=1
+TINYCBOR_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) DISABLE_WERROR=1 V=1 prefix=/usr
 
 ifeq ($(BR2_STATIC_LIBS),y)
 TINYCBOR_MAKE_OPTS += BUILD_STATIC=1 BUILD_SHARED=0
@@ -34,12 +34,12 @@ endef
 
 define TINYCBOR_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TINYCBOR_MAKE_OPTS) -C $(@D) \
-		DESTDIR=$(STAGING_DIR) prefix=/usr install
+		DESTDIR=$(STAGING_DIR) install
 endef
 
 define TINYCBOR_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TINYCBOR_MAKE_OPTS) -C $(@D) \
-		DESTDIR=$(TARGET_DIR) prefix=/usr install
+		DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
