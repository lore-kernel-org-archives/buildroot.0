Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F87FC3DA78
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 17:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1540409A4;
	Sat, 14 Jan 2023 17:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1540409A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ovw7tcrnbTws; Sat, 14 Jan 2023 17:25:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE1CE409A5;
	Sat, 14 Jan 2023 17:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE1CE409A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A3311BF3EA
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 17:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82A9B81CDB
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 17:25:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82A9B81CDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ne_IfDW9UppB for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 17:25:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D59681CAD
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D59681CAD
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 17:25:41 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id e3so14546208wru.13
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 09:25:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BHSONMuIGyJWsjwaQc1kRIowyCuLush5CGluZZ2kvOU=;
 b=pGB/AVeyXL4PwIzbClIuar/BSFuSS344g5TcRV4RkRiKWmCURnCcN4kRK9jqWcSRN3
 V/rWo0NZ8I8LiWJxj3w4eyhh3O6c9wb/c6dw3BApMOMK1SFIWUnvP/epPoQ6tXXTQe0M
 jS4vTbDNfkdn/SprI2TfMOiDvpTMpVrskEzht+a3NHcmEV2GmtSXrFQIwPqRNDi1yeJI
 qTSdGJ/kBbGiOtTedhVWYImHMSwodTGL85x0d7YWg1KSqjOXes/13oASrsJGUWNxwhJy
 2gIPWDyi0IRi/U8UQA5wQLl1jMgmmrT4w1vuUcWad8UZMtC88ae/7G3hADgdszai3BSQ
 IQVw==
X-Gm-Message-State: AFqh2kruyjP3rH7wc7/+JQhLmaw1FyO0XlYnbaGsOGx4LK1v9R87UvkQ
 UmBq09nsSiRYRKZ85DeFjJyqYWPHCa0=
X-Google-Smtp-Source: AMrXdXvMBgM2E0CQBedjIC/jIbiPnKSaO+hrK3LXwfumOXPqPsEmnJC8Mca/xu57j8c8AUf6EYNjhA==
X-Received: by 2002:adf:fc01:0:b0:297:dd4a:9207 with SMTP id
 i1-20020adffc01000000b00297dd4a9207mr36123285wrr.10.1673717139476; 
 Sat, 14 Jan 2023 09:25:39 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 t14-20020adfeb8e000000b002baa780f0fasm21647200wrn.111.2023.01.14.09.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 09:25:39 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 18:25:06 +0100
Message-Id: <20230114172506.1258341-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114172506.1258341-1-fontaine.fabrice@gmail.com>
References: <20230114172506.1258341-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BHSONMuIGyJWsjwaQc1kRIowyCuLush5CGluZZ2kvOU=;
 b=Go7/YPjUfXMZYfRmESXnvNgDcq1yg7E+9ROVFi/u3nqRBVduTVVM9YU3g5+2wzvblY
 TzB8A922eMOkarmjlrWr+ylAXWJwFQEJj8jX7223bxZeIwjvXsjfIXVW3+rbZ+2K/EX4
 hgtIubHHOCUMlt/IVo85O+5sTJOfU492vSecPsdmd2DXTWHojIiWNp69a6ZqMLrP17iE
 KxpR/UYU8hrwuyIT3JwMvKBViyahxCg/O38v8fCOKhlVRbOiQoiwnCvo3geJr+9RDloF
 jiMaKkWumW0vkVZOfJbNui9KkRW9dnjgeQhKAzNS79BT3WoyukKK5KBavUMjZeTP1dus
 BcMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Go7/YPjU
Subject: [Buildroot] [PATCH 2/2] package/ulogd: fix mysql build
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

Fix the following mysql build failure raised since bump to version 2.0.8
in commit 6fc4b59ffd3007ca9e436d33647acc5dfff62970:

checking for mysql_config... no
configure: error: libmysqlclient not found

Fixes:
 - http://autobuild.buildroot.org/results/a059be353b7464d4e6a7830a685b43bdd7ecd5fa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ulogd/ulogd.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 7d4a1fde4d..033acb06c2 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -23,7 +23,9 @@ else
 ULOGD_CONF_OPTS += --disable-dbi
 endif
 ifeq ($(BR2_PACKAGE_MYSQL),y)
-ULOGD_CONF_OPTS += --enable-mysql
+ULOGD_CONF_OPTS += \
+	--enable-mysql \
+	--with-mysql-config=$(STAGING_DIR)/usr/bin/mysql_config
 ULOGD_DEPENDENCIES += mysql
 else
 ULOGD_CONF_OPTS += --disable-mysql
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
