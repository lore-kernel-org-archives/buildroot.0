Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6F7C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 21:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0639429FB;
	Sat, 11 Dec 2021 21:20:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fTMqYfM-Fxme; Sat, 11 Dec 2021 21:20:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F883429F8;
	Sat, 11 Dec 2021 21:20:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB1761BF3A0
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 21:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D951340226
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 21:20:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TOWy_uqqxbTf for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 21:19:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7969F40173
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 21:19:59 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso11488268wms.3
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 13:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kpl0ZO+ERAvlKlTVEj4rORH3yRGLxgqDtQNCyFHsaA0=;
 b=IjdnBfmEh7LEMlQj6fqg4tbtx9Ep+HcyCysg2cQKFdMk5sEzqRILKnPpCpJ63CArkI
 fH6fjAs1Ft6kJatm6w6Tkkah8BtaYXqcptJZSG7jwDiVNj4kIJR91IrftFHiZqNvociS
 QMDOd8RAaakm+L/5LlzXOcyv57gyMuTK+rTgP3JXGrTDJJaZspY33bvFmiMKeifYJkWu
 pJh09BkfEyWXJTdnGnoddQTK65JA/894DU6Nl8oqxwVsgRFSaGuYQ/G/0cyWeCel8rDI
 xBQH7egviHxA4coF2+YKsSZ7nWYEXUvFsZZrHVDktMmnBa4NUKTMMQFpolb70t2YVS1M
 jevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kpl0ZO+ERAvlKlTVEj4rORH3yRGLxgqDtQNCyFHsaA0=;
 b=BDyNnHj4Gej2WvJ8ZR0+5iU4WS4DTHkz3ZeUMVizNg++GIfE27rx9sL8RNWfiW5nzM
 d99aXKUpIplyT2k4EgYVqZYlPeFcSCMMNwN3lXJIFqrcGK7YvDH3uD7R+Opu9c4FkN+e
 d8Djtyc4TP6efqHe0bLWYvRNBdi3WI1BUyNKAVZhu7t+Y50x/eeDKIWp4Z5aAewH4A57
 gDigSAEMfNdtK0zjvBmUC/0moJwJQL4h+eYFxO2DloynZo529Q1XBkjDyMwkRK1ZUQbc
 /wFQAnkW+6E8YrWTzbi3c4fw/KTGAUfRDUqepoIk7vEzDTQTNyi91FRHrlCzLDaZGacc
 lx3Q==
X-Gm-Message-State: AOAM531Ibz5Y7NvMjKnvvf6wbjVyFFFIxFVC2TThQrSU0XsPlaK05rdS
 WYwYGjBtIk6D8iqHWp8Qe3jxn6g1uZSYKA==
X-Google-Smtp-Source: ABdhPJwsu6+io/vn46DxsQEA0zUSuXxrCkDS7a/B6D6o1JSJG6a5NTcKXRN8DJZgIpm6CqzLKgCQMw==
X-Received: by 2002:a05:600c:a4c:: with SMTP id
 c12mr534089wmq.60.1639257597354; 
 Sat, 11 Dec 2021 13:19:57 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id l26sm2331247wms.15.2021.12.11.13.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 13:19:57 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 22:19:46 +0100
Message-Id: <20211211211946.233703-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cups-pk-helper: add
 CUPS_PK_HELPER_CPE_ID_VENDOR
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

cpe:2.3:a:cups-pk-helper_project:cups-pk-helper is a valid CPE
identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Acups-pk-helper_project%3Acups-pk-helper

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cups-pk-helper/cups-pk-helper.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cups-pk-helper/cups-pk-helper.mk b/package/cups-pk-helper/cups-pk-helper.mk
index c90b94da14..c688743160 100644
--- a/package/cups-pk-helper/cups-pk-helper.mk
+++ b/package/cups-pk-helper/cups-pk-helper.mk
@@ -9,6 +9,7 @@ CUPS_PK_HELPER_SITE = https://www.freedesktop.org/software/cups-pk-helper/releas
 CUPS_PK_HELPER_SOURCE = cups-pk-helper-$(CUPS_PK_HELPER_VERSION).tar.xz
 CUPS_PK_HELPER_LICENSE = GPL-2.0+
 CUPS_PK_HELPER_LICENSE_FILES = COPYING
+CUPS_PK_HELPER_CPE_ID_VENDOR = cups-pk-helper_project
 CUPS_PK_HELPER_DEPENDENCIES = cups libglib2 polkit
 
 $(eval $(autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
