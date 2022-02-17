Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3575C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 17:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5254141BE3;
	Thu, 17 Feb 2022 17:38:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t4VWokcmjE6Z; Thu, 17 Feb 2022 17:38:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4F8B41BD3;
	Thu, 17 Feb 2022 17:38:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 865A41BF322
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 17:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82B7683DF7
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 17:38:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZllQ6XFx0l89 for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 17:38:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FD9782F51
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 17:38:44 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id w11so10325873wra.4
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 09:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1bBRT9oPhcRlxjCfX3/9RH/I3Lh6FC/7NZ5qNBN6egw=;
 b=G9wJtRlEO/oG4iwrpNOEcKqXSrWrEuw4TQBV+GeHh4Hjmgxij/mPLTDEDVjqkWxS0A
 ZibohbLtw8Gxa9VWJasDrFdEfMYlrKLvm4ofuPU9T9ANLTEDClJQpMLLNOCzlPmR4CtE
 /C7+LHnokSjXNTu+Vu2+qBOxWKgfHRiHceSAZcW7/smWIQovFxoTgaCF5MS42vTVmZ6F
 BaKzCJtHumaLFkj/3Ggw2MJg9GWqoNCGVdGkj6Nt68/oyybtPGJaYX94RLa6jfavaMz5
 csSjVeaumedv1qJhmIzjV783/YNZXxI3+q+YT4PNNReHpLXg78ERtDHpxh5Ed9UakO2L
 0WSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1bBRT9oPhcRlxjCfX3/9RH/I3Lh6FC/7NZ5qNBN6egw=;
 b=JQcVy4wR6BLcI2ZX5EkO598DqvWF0jQVwcZsjrRbXmsQ30d8CHDfZTJXisKKAkXZKf
 dMz7uwiSYTIAS6j7yySkiLz7rKIEO4j2XEiYEmNQEaSUg8oxp8hQJJ9nclShfR4/q27P
 GhVLG/1fGconpKxOUw+TDromjFaQqoM6ar0St2Yh4lYMkqyxJs3G4XLa5ndR9I1cczBL
 IQ2KyO3qNhMBxbXXYjoA/XJ131Z2ZQXDl/Dt8cU7YATToBcQ2wFCzDLeE+DC66mN9imW
 ell0eWfJ2JwQHfiQGKpeHOCgkN9pgbwBaDUmNgMNyr6plDkQr/e8m/wjlR6UFZETZ4e3
 WZ7Q==
X-Gm-Message-State: AOAM531nJY2/bjxbko8ShV+/uq81VGtlIbnuQUjOk7qHu4N2WWdl3/Ht
 bND8HVSaJFjrCJhuGPF1Opu4sxaku6E=
X-Google-Smtp-Source: ABdhPJx7dUeWhXwyyhuOkpOtA0a7Q/tvlmx7GmitbmpKMoJE7wO+m8RDzMlrABG7rGdaY69yNyX+OA==
X-Received: by 2002:a5d:6a09:0:b0:1e3:3f5e:e8d with SMTP id
 m9-20020a5d6a09000000b001e33f5e0e8dmr3120350wru.670.1645119523198; 
 Thu, 17 Feb 2022 09:38:43 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id 12sm14769372wry.111.2022.02.17.09.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 09:38:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 18:38:54 +0100
Message-Id: <20220217173854.554177-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libiconv: don't override
 LIBICONV_CONF_OPTS
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

LIBICONV_CONF_OPTS is wrongly overridden in a conditional since commit
0d711a64d4753c0efa4158519907cca7ec284573

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libiconv/libiconv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index ec79a5d735..40763a92f8 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -11,7 +11,7 @@ LIBICONV_LICENSE = GPL-3.0+ (iconv program), LGPL-2.0+ (library)
 LIBICONV_LICENSE_FILES = COPYING COPYING.LIB
 
 ifeq ($(BR2_PACKAGE_LIBICONV_EXTRA_ENCODINGS),y)
-LIBICONV_CONF_OPTS = --enable-extra-encodings
+LIBICONV_CONF_OPTS += --enable-extra-encodings
 endif
 
 # Don't build the preloadable library, as we don't need it (it's only
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
