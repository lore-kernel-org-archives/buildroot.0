Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602BFC6FA8E
	for <buildroot@archiver.kernel.org>; Thu,  2 Mar 2023 17:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE08941B73;
	Thu,  2 Mar 2023 17:54:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE08941B73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DCTh_3UmhecE; Thu,  2 Mar 2023 17:54:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5303C41B89;
	Thu,  2 Mar 2023 17:54:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5303C41B89
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4ADF31BF387
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 17:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22D5941B88
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 17:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22D5941B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lPaB7LQuYPBy for <buildroot@lists.busybox.net>;
 Thu,  2 Mar 2023 17:54:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC81641B6F
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC81641B6F
 for <buildroot@buildroot.org>; Thu,  2 Mar 2023 17:54:03 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id p26so155748wmc.4
 for <buildroot@buildroot.org>; Thu, 02 Mar 2023 09:54:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677779641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eHtRC54es1RKIZJYJSS5vjaddL46z/qtTx3vuh5C9+M=;
 b=i2Wa7qk/q/5cbQCemFQOZ5huu8JYXuJmIO632UFUkYIa4QswI6ZTS1Q9MkAIJUjw02
 07+l3UqkaklBMmF6MaHBXzKARYEJI+e9qHLWRwdAtFTe5c3dvjiE+fOwBJVPTlPOzkp4
 nvRNX29WjoT8RSYGwFqCREgp3amHpluENCo17fGuELu39uzs1uP/Cat9sWyJmDeLmflI
 YDZB0Nk6jWJlFz6b7Fi0uik8RikqFSvqycIoI6/MAM7Oems6TCrtcE5bEsrttkv98lF8
 ayt+klRo2rwm765RSMZjc9+/dwQj+pZJZC1nozqa9gBY5XowDeU+8z83iAtN6WUPSbRt
 0tEA==
X-Gm-Message-State: AO0yUKXAuXOr/sB0DgoxjenXOr3DTTQ4wCgPncceRUk3JhGGOu2V4sW1
 dsywSX7AoSaYFE1s5G3OHdpDcQSOwNA=
X-Google-Smtp-Source: AK7set8WVBvTo2qcIp2oS65NJtUit2WH09MzoQD3xuzgvZ2/Y8GWVCiey2uvs98HKErmBhv1BSHqNQ==
X-Received: by 2002:a05:600c:491d:b0:3dc:d5c:76d9 with SMTP id
 f29-20020a05600c491d00b003dc0d5c76d9mr9203859wmp.0.1677779641637; 
 Thu, 02 Mar 2023 09:54:01 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g40-20020a05600c4ca800b003eb3933ef10sm162459wmp.46.2023.03.02.09.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 09:54:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  2 Mar 2023 18:53:49 +0100
Message-Id: <20230302175350.183840-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302175350.183840-1-fontaine.fabrice@gmail.com>
References: <20230302175350.183840-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677779641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eHtRC54es1RKIZJYJSS5vjaddL46z/qtTx3vuh5C9+M=;
 b=T6owUp5bs7iXJxEAf5qCe5OFOHSTz6+7pO7ZUGDEvRYOzbivBho1Nwnn1UWQz4mkUa
 xq/rYZhb4bjFC6lWmRdhWc8iI3vIkhkicZxOMXitCMOKw3uSWizKIuUyTtR7SCkWWM2W
 XU2vZZDVTIiv9b0wYEKzIcgS5ZMaoWlzzkDExDcOYisD6gLShOvxRkBC/AmYup/PmpKr
 MlZ5TzeF4OCwsPGigfJlrC2ZMrFmSe2zxc9wmcKaFPKhk+tvQdWhCC6BnvgA9SdUVoOW
 XGLG0QvIrg554WLcDJSkhrqw+gyKKk7oLn/mBIe3p22iXw/x2sCRI8WPT/2eJAMkCEi1
 8stQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=T6owUp5b
Subject: [Buildroot] [PATCH 3/4] package/gensio: use mdns option
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mdns option is available since version 2.4.0 and
https://github.com/cminyard/gensio/commit/0b56fdd8205dff8f2343d1672e58b6583772f897

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gensio/gensio.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 89c734eec0..3374313c0f 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -9,7 +9,6 @@ GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GENSIO_LICENSE_FILES = COPYING.LIB COPYING
 GENSIO_INSTALL_STAGING = YES
-GENSIO_DEPENDENCIES = $(if $(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),avahi)
 GENSIO_CONF_OPTS = \
 	--without-swig \
 	--without-python
@@ -21,6 +20,13 @@ else
 GENSIO_CONF_OPTS += --without-alsa
 endif
 
+ifeq ($(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),y)
+GENSIO_DEPENDENCIES += avahi
+GENSIO_CONF_OPTS += --with-mdns
+else
+GENSIO_CONF_OPTS += --without-mdns
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 GENSIO_DEPENDENCIES += host-pkgconf libglib2
 GENSIO_CONF_OPTS += --with-glib
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
