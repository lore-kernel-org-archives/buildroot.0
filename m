Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268E3C43334
	for <buildroot@archiver.kernel.org>; Mon, 13 Jun 2022 20:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C25B541519;
	Mon, 13 Jun 2022 20:34:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sgtO9rVB3YPt; Mon, 13 Jun 2022 20:34:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C791041503;
	Mon, 13 Jun 2022 20:34:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 98F401BF37C
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 881F140A21
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:33:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fRYNiDS3oReA for <buildroot@lists.busybox.net>;
 Mon, 13 Jun 2022 20:33:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D713540A12
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 20:33:54 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 r123-20020a1c2b81000000b0039c1439c33cso3715765wmr.5
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 13:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wOl/W89yZZOlK3NqwcdptscpzdwX8jCJLVn2SA/aMNg=;
 b=VGmYw08cXyb1pefnpYvmxydMNqQqu/UZ3msdVkblRyoBJR4miLlSgKAYr4TVWExmNp
 hgfef3mUjfBpAsNe/Pk1N9U70sYKiecO7THxEDL79oaNYZtLuR6wwc+NqQ1yo+xO8pT9
 +9SBVhbKXGxdmqSiHKclk5/6RXXjWBStkEJE8ov4u94lRykWJJw43tBC2Qsqccs//DH5
 ot5CPtsXU/TB1O0FDp6gzMY/zcqzmgFu3Ug9UZ3ueFJn+GsPPcrgEcmF60eYcj8fX4fL
 CXDWMiVOtyAgd2c6jdiJNFMYJxB/UEGFrDmA8E2JZdusMxJ7sN8PHkbO0FlxgoHfeFh3
 +siw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wOl/W89yZZOlK3NqwcdptscpzdwX8jCJLVn2SA/aMNg=;
 b=hE216q4e5JGjQgcqN9Qeyvl98apzpiAvdPUt39IrJUSgkenx3Jt3gLDkhIgt/f346w
 OXILNSQ8ph9Vqwk8eFB6kswr460Y+EsVNJeHMBIvh6yNkFgJ3JcSpPSYentFCMONDwKd
 tunVIIIjRM2cZO/u30X7cuMmb6xD3hhv8VOICI00z84EbvzhV5/y0oC6lMHEXANImM1f
 EnPeFcxEDmMErfV6mt1agL9QvUycz6GsnH11KaGBUtYWLDkgXUfSrmGvo/ZkyuPutClk
 0WQulL0u73ZS7f0r9G3MDvOkWUWj1HzIgkye/I9CwRiCwSQRYY3+9e8cHrrDJlTH9SCs
 qwUA==
X-Gm-Message-State: AOAM532t2hkE4eHrVLzx395JKRu/VpYdqQVgw8JURu/jDDBc8gcuJYtC
 Ca7GaZVAkXazuZ/H+KK1nD9fyJ1zATw=
X-Google-Smtp-Source: ABdhPJy5PxtMFN7wssXJur4oazs9a760OBLOklHBE+BatBZrD7u5rV35gF9MyaBOg0MfkfEyTyid0g==
X-Received: by 2002:a1c:540e:0:b0:39c:5fbb:5151 with SMTP id
 i14-20020a1c540e000000b0039c5fbb5151mr490288wmb.147.1655152432470; 
 Mon, 13 Jun 2022 13:33:52 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c350900b0039c4d022a44sm11584886wmq.1.2022.06.13.13.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 13:33:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Jun 2022 22:31:13 +0200
Message-Id: <20220613203113.294535-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220613203113.294535-1-fontaine.fabrice@gmail.com>
References: <20220613203113.294535-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/ecryptfs-utils: add libgpgme
 optional dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ecryptfs-utils/ecryptfs-utils.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index 393ea4da78..6eb3add98b 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -16,6 +16,15 @@ ECRYPTFS_UTILS_CONF_OPTS = --disable-pywrap
 
 ECRYPTFS_UTILS_CONF_ENV = ac_cv_path_POD2MAN=true
 
+ifeq ($(BR2_PACKAGE_LIBGPGME),y)
+ECRYPTFS_UTILS_CONF_OPTS += \
+	--enable-gpg \
+	--with-gpgme-prefix=$(STAGING_DIR)/usr
+ECRYPTFS_UTILS_DEPENDENCIES += libgpgme
+else
+ECRYPTFS_UTILS_CONF_OPTS += --disable-gpg
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 ECRYPTFS_UTILS_CONF_OPTS += --enable-pam
 ECRYPTFS_UTILS_DEPENDENCIES += linux-pam
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
