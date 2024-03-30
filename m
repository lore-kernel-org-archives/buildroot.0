Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F145C47DD9
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 09:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F33E40B64;
	Sat, 30 Mar 2024 09:03:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sEnKhzqbbGVL; Sat, 30 Mar 2024 09:03:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3690740B69
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3690740B69;
	Sat, 30 Mar 2024 09:03:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A8E681BF41B
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 09:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE9C640B69
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 09:03:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XftPnTfoqPbe for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 09:03:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C646940B64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C646940B64
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C646940B64
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 09:03:42 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33fd8a2a407so1801263f8f.2
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 02:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711789420; x=1712394220;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=27bjj4HYA1I8nAsnYsUFV4FXN2P+AgPQICNMEwCcQNM=;
 b=bwpHw1iuPqHNCWSE17/aKPQA0wQGypuY27I+FYSSbBtKjqq0VY42HJBvdJB7aBpW0p
 bfcgL9U8e/5zPCDQgAHBvqQh+OUZ5wwy5upbJvunqZjWhBaMyQCpTU69isoGjz0uiRfJ
 75jlxGgqMVIwt3okKeMPdvH0bheweUrP5gnvHPHU9olg9lfajs8ziGaKptvp4AaEoZmd
 swBXcf7QtApqF9JVnrPlv+0MqPU6cJ7X8CS7+/9KOmGwpxV2b4Nvp6g7fHQaS/bI3Lob
 nRUWfnytyIaMCOc/fiH9k0jUx0R72mRXf9lIDmOKYiG0j0q+mFRRFtQ5YmCqg1DB+VuC
 Z2Bg==
X-Gm-Message-State: AOJu0YyXH2zA/lMYkn3Qod67piZBQJr0LIDH3qSb/bEjNaiCEdLrIM/9
 g8HpCNg7X9FWGtD7CuvWNUVHxOR1qa7q/SD2ENF2A1qw2Iniaco7zruKGW6P
X-Google-Smtp-Source: AGHT+IGPBaoA4ChioAqmQecRp9RHg+fMZ5mZJ4wKE/0SVqzt2QXiNmNerhr3ob9E89figNozVrrSbg==
X-Received: by 2002:a05:600c:4710:b0:414:90f6:c1 with SMTP id
 v16-20020a05600c471000b0041490f600c1mr3352605wmo.8.1711789420412; 
 Sat, 30 Mar 2024 02:03:40 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u22-20020a05600c139600b004148d7b889asm10978316wmf.8.2024.03.30.02.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 02:03:40 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 10:03:34 +0100
Message-ID: <20240330090336.567660-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711789420; x=1712394220; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=27bjj4HYA1I8nAsnYsUFV4FXN2P+AgPQICNMEwCcQNM=;
 b=cdR7WcxtVskIGs0RXzH7zl5fQ3hYyhWXskE6NaPg+Ul6dMSVq7UQdDXXQFoy8HzE+w
 FDIL7wGvTE3H92qrvYxoZychy2Trk09b8jyl/6TTXW/sqoun+oUqE0P0glLmjRsxwQNl
 oGFxbpPHt9J1MPMt7l93O54CJnoh0jkzD4pnzfic4OYds1AaNwUuj8zqz9L/z/f0Dga3
 t5FBfeuN4P58oauGMN2IgZJpBxROm3ZPTtQDXfm9MNSF0eeBCWH6ai/8wgpFuS7hrPWM
 YAbpHf5MWyztsuKno8BGzPnWpurmWdKOxRN4q0nmW5w/GdIJn96WSj4OqUcSfzcaO0so
 wWkg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cdR7Wcxt
Subject: [Buildroot] [PATCH v2,
 1/3] package/php-xdebug: drop unrecognized variable
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

--with-xdebug is not recognized since the addition of the package in
commit 7b7dffd0984e1b274273f5638a975165606384f9:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --disable-dependency-tracking, --enable-ipv6, --disable-nls, --with-xdebug

Fixes: 7b7dffd0984e1b274273f5638a975165606384f9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/php-xdebug/php-xdebug.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/php-xdebug/php-xdebug.mk b/package/php-xdebug/php-xdebug.mk
index c5a1e10ebc..62ef3fa997 100644
--- a/package/php-xdebug/php-xdebug.mk
+++ b/package/php-xdebug/php-xdebug.mk
@@ -14,8 +14,7 @@ PHP_XDEBUG_LICENSE_FILES = LICENSE
 PHP_XDEBUG_DEPENDENCIES = php host-autoconf
 PHP_XDEBUG_CONF_OPTS = \
 	--enable-xdebug \
-	--with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-	--with-xdebug=$(STAGING_DIR)/usr
+	--with-php-config=$(STAGING_DIR)/usr/bin/php-config
 
 define PHP_XDEBUG_PHPIZE
 	(cd $(@D); \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
