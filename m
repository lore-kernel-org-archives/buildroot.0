Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7DBC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 15:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77B6281AD1;
	Sun,  9 Jan 2022 15:05:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ykBcRCBZKbKb; Sun,  9 Jan 2022 15:05:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E550E81A39;
	Sun,  9 Jan 2022 15:05:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C5B2D1BF4D5
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4B6340258
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9UnoK_SS-PUN for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 15:05:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F038440226
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 15:05:38 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 c126-20020a1c9a84000000b00346f9ebee43so5756328wme.4
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 07:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vo7bYFiz0fQuIyAGgch5mK3up95q26tRHDufsDYMESQ=;
 b=jyyOCscgLOpi+Df5BuDMbaPi/BI9XRpESHx8YEgadyeEyrNfPh0fxg/TZ1rH+RkcAu
 MjseYo3+DZgSBqgjtMabO9Xoib/OVzxLd8uDhhZ+zpKS7lbC6mH103AaBfFez7j1GHJS
 LNODAP25krN8Pdj9RkzxGAkHiyD7FugqhcvWdmYUcIHyxIhvOTdrweN1ldCzd2ARXoyO
 JblnqETTVGM7MilV0UkxGDBQ8Iu2nAfCVmFxjsZdi44CouN3ygj9q+VlYcGP4mQyzd8/
 jm21Jl48j2WXbEnPz53cqKQ3d37rRF8QRKX8JPBqKKiTJzkv7gf7knUmBm15c5k3NOcX
 x2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vo7bYFiz0fQuIyAGgch5mK3up95q26tRHDufsDYMESQ=;
 b=dhOnSVih47fHA0ZTjScjh/MJpzSjVZ/emWbyrj+16+viGFLZZkkWBFaRZlZB06fkh5
 2nip7I7JIw3Pzs1VRnzJaJDxibTkaFXLPeys1LHwoqh9QeEQpdAeWXrBPzwexaPef154
 vBhtgOssdITe7qVmo0mfMf0Ie+T/w/6GBBmOpP6JvK9bgUg+udhDVmc4S64gD/JnK+hV
 8RM/O20IH22wwXjFkmET3JyA3zQCnHdbM/Tj10TFQ8XoiC/8p2eUchiBIr/PrlNREI79
 gZIL6sbyBOIngB4GXIdq6p2JgkYpW2V9Oy2zbk7tyYBUsPJgnpKgaekLZZk9HOi+A6Rv
 aG8A==
X-Gm-Message-State: AOAM531gdg6/PhBYH1VO7VODLWzYucS1kDgOBgmIrYVb6OdDOQu+GCCs
 FWO1x6TkEk0SB675LzvO1+zZiq/Riag=
X-Google-Smtp-Source: ABdhPJylySYJcX7GPix8XN9OaKW3SP40xItVPJfFCR76Cx3vwrxoOHCQdSOTe2ujMdOdgtIazPkajQ==
X-Received: by 2002:a7b:c5ce:: with SMTP id n14mr18702218wmk.11.1641740737102; 
 Sun, 09 Jan 2022 07:05:37 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id h14sm4218760wrz.31.2022.01.09.07.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 07:05:36 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 16:04:22 +0100
Message-Id: <20220109150422.792641-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mariadb: add mysql_config to
 MARIADB_CONFIG_SCRIPTS
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

Add mysql_config to MARIADB_CONFIG_SCRIPTS, this won't fix any build
failure at the moment but will avoid possible issues in the future

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mariadb/mariadb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index d08b768a2e..db967ca3ed 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -14,6 +14,7 @@ MARIADB_CPE_ID_VENDOR = mariadb
 MARIADB_SELINUX_MODULES = mysql
 MARIADB_INSTALL_STAGING = YES
 MARIADB_PROVIDES = mysql
+MARIADB_CONFIG_SCRIPTS = mysql_config
 
 MARIADB_DEPENDENCIES = \
 	host-mariadb \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
