Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11785EED636
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 18:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC41B810D0;
	Thu,  1 Jan 2026 18:34:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3oibWR9XaJj8; Thu,  1 Jan 2026 18:34:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D082B810DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767292445;
	bh=Vyh0tVUa6oNo6l+FzhLVy0rqkUWUy4Uj2uH16/rRZeU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=EHepPcxW1XFiuB8KMsbPIv6OVP+WPgXZh3aBP5ERX99NvNdFbbEzr9xRcenqnwX2b
	 boLHhnSBLh2Hy66tIDZV8IfIjnISgnTcPdu4t2RRmc8/+gQFYca2hrL4xOFyIHmWKf
	 1XHq96Vdk2Ie+2at7fbai9UX3unqYgU7xTDZEA3/MYsVujvUyiEfVcf6Mkn+TSqMz3
	 DlUjIomFFX4/srNrT+jXg5jfc8VxaGbIKjlLjWDC3QcKh8KuqO7h9c/4/PM04F6FBI
	 /mBMiD2ZIqjhd3MBbsqMlK4xMKNgEBBeo3GC3jjOoIXtQ/uSPkC5XgSC2xk6R3OnI1
	 Bpzc3BmxBwZiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D082B810DB;
	Thu,  1 Jan 2026 18:34:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 879B5206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 780D4810DB
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:34:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nIcP1DELoAOZ for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 18:34:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=pkerbrat@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8B8C2810B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B8C2810B5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B8C2810B5
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:34:03 +0000 (UTC)
Received: from sejong (unknown [82.64.130.240])
 (Authenticated sender: pkerbrat@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5366BB00548;
 Thu,  1 Jan 2026 19:33:58 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu,  1 Jan 2026 19:33:42 +0100
Message-ID: <20260101183342.1930880-1-pkerbrat@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767292440;
 bh=3W06HmLW8Y4US+ZoFn0ybiFXVUoHwsm6ofa28Mzox0k=;
 h=From:To:Cc:Subject:Date:From;
 b=txd7buVXkMOhaS6fnfr6DBjTJd/7GRYjVuTaEdJacnRc3//5dJv1Ds2YQ6ZJXQ67B
 5Gsa9V8TVLnKIT0KuhtyaveZi62zOrRj0VSNgF3Am+mNkB3XtG0kDV6rivsx1SryQh
 GIxnd9CvlR6OsL26yfd/Eon/VHNyUkwAzCK+zvFvr3qS5Kv8C9YKBKhO1/A3Kj824f
 b7zNEpvZFK56aqjTsiSn1XJ/E31rIs91hw7JNAiN94TwNsoolVUoNLPYW0YDzCS2uf
 dVbJA4d3RZIlCQ9TEm+BZiH4tKHogty4Ei6HBD68db5G7RiGR3famLREdjyd3WAtxf
 EWkmmmMjtpTVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=txd7buVX
Subject: [Buildroot] [PATCH] package/imlib2: bump to 1.12.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Pierre-Yves Kerbrat via buildroot <buildroot@buildroot.org>
Reply-To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Cc: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since 1.7.5:
- imlib2-config is dropped. pkgconfig is used since.
- release tarballs are delivered in .xz instead of .bz2

Changelog:
https://git.enlightenment.org/old/legacy-imlib2/src/tag/v1.12.5/ChangeLog

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
---
 package/imlib2/imlib2.hash | 10 ++++++----
 package/imlib2/imlib2.mk   | 12 ++----------
 2 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/package/imlib2/imlib2.hash b/package/imlib2/imlib2.hash
index 690d836c2e10..4a84a6a37a64 100644
--- a/package/imlib2/imlib2.hash
+++ b/package/imlib2/imlib2.hash
@@ -1,8 +1,10 @@
-# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.7.3/
-md5  1e79055a0b8fe27d208b6f8bb1bde60c  imlib2-1.7.3.tar.bz2
-sha1  3d55965f946d0b2754a84c8e57c78ddc227252c6  imlib2-1.7.3.tar.bz2
+# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.12.5/
+sha1  055778fca4639962290426c37d909c1a6a4c8e1c  imlib2-1.12.5.tar.xz
+md5  c81c9f91d92ecbd87cf652f867ec5d74  imlib2-1.12.5.tar.xz
+
+# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.12.5/imlib2-1.12.5.sha256
+sha256  fa2315f28379b430a6e6605b4284b07be06a3ef422d4f5e1c9bb24714c4cf6dd  imlib2-1.12.5.tar.xz
 
 # Locally computed
-sha256  158d0b8c20bc11221af9e77a64a116fca7051b03cdea2c4f31d31f469382f997  imlib2-1.7.3.tar.bz2
 sha256  fb70339dd33a77b6213c7ae067fccf93d04af44ff3f937c61f8863f7970e73f6  COPYING
 sha256  8c9a2e92ed4937e2d30c2ea95439c36ed3002fc47e34efee43455a460fee8ef5  COPYING-PLAIN
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index 89b4769f92c5..5ad89289a496 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IMLIB2_VERSION = 1.7.3
-IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
+IMLIB2_VERSION = 1.12.5
+IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.xz
 IMLIB2_SITE = http://downloads.sourceforge.net/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)
 IMLIB2_LICENSE = Imlib2
 IMLIB2_LICENSE_FILES = COPYING COPYING-PLAIN
@@ -14,7 +14,6 @@ IMLIB2_CPE_ID_VENDOR = enlightenment
 IMLIB2_INSTALL_STAGING = YES
 IMLIB2_DEPENDENCIES = host-pkgconf freetype
 IMLIB2_CONF_OPTS = --with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config
-IMLIB2_CONFIG_SCRIPTS = imlib2-config
 
 ifeq ($(BR2_PACKAGE_IMLIB2_X),y)
 IMLIB2_CONF_OPTS += --with-x
@@ -58,11 +57,4 @@ else
 IMLIB2_CONF_OPTS += --without-id3
 endif
 
-# drop -L<dir> from linker flags
-define IMLIB2_FIXUP_IMLIB2_CONFIG
-	$(SED) 's/-L[^ ]*//g' $(STAGING_DIR)/usr/bin/imlib2-config
-endef
-
-IMLIB2_POST_INSTALL_STAGING_HOOKS += IMLIB2_FIXUP_IMLIB2_CONFIG
-
 $(eval $(autotools-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
