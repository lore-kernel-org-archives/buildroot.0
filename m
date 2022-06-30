Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B51AC43334
	for <buildroot@archiver.kernel.org>; Thu, 30 Jun 2022 22:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C78D460B68;
	Thu, 30 Jun 2022 22:03:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C78D460B68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v6ogeje-odOH; Thu, 30 Jun 2022 22:03:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD21360F97;
	Thu, 30 Jun 2022 22:03:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD21360F97
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A6731BF349
 for <buildroot@lists.busybox.net>; Thu, 30 Jun 2022 22:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E67C4408F2
 for <buildroot@lists.busybox.net>; Thu, 30 Jun 2022 22:03:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E67C4408F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NhfYPX9CDPI7 for <buildroot@lists.busybox.net>;
 Thu, 30 Jun 2022 22:03:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C879408F1
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C879408F1
 for <buildroot@buildroot.org>; Thu, 30 Jun 2022 22:03:26 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 u12-20020a05600c210c00b003a02b16d2b8so428370wml.2
 for <buildroot@buildroot.org>; Thu, 30 Jun 2022 15:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/TiPerWAunI+HKbj5JQYWkGnySc4yag9pv/s8dQThYA=;
 b=y8qeUZ2bKnwx52OKvIN3QnfmTgS03sYeuw9DDcRVXsIZwSCfyM8xvGK2EeiLWhKcGY
 daEdVLH0rbwtdTGDdx8WwmJpu6Sa7j4lwx5y0h+dGHEFrGuovj9wG+frqvyWAxvEEy3M
 +hx/h6pix5tj2vgQAfTFWm462FQAOTctBApDoZztwE282AcB/pA3lSK6//QuJwRQm9E4
 4bWFaefOhr+VB8dGHbr1mE6t2YlBEh+/yEXG3aiGlsZwpytLqGyJ/YSS9gmjJe6HVbHT
 pU8v8MCrzKwACwiYL2+/TvToZ/uhLFhDZ9xSV/kKcMVFkeNnPxyEGtxk4eWvmO+3lfQc
 ePnw==
X-Gm-Message-State: AJIora8w32stDlyG3oS0KoKDh1HjJHAdUTQ0qYlnihtVOkz85YP+ShkK
 DgWk036YegcVwE9OEKk8AH77zWP/9RI=
X-Google-Smtp-Source: AGRyM1tgBATfeIVprqWkitkQFm1tT18EoR8o+eFbc/6cU2kl1TYoyNLONvEnvhIDENGP6bETS6OgSw==
X-Received: by 2002:a05:600c:4fd4:b0:3a0:334e:241e with SMTP id
 o20-20020a05600c4fd400b003a0334e241emr14750508wmq.73.1656626604521; 
 Thu, 30 Jun 2022 15:03:24 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l34-20020a05600c1d2200b003a03e63e428sm5392439wms.36.2022.06.30.15.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 15:03:23 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Jul 2022 00:00:26 +0200
Message-Id: <20220630220026.707180-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/TiPerWAunI+HKbj5JQYWkGnySc4yag9pv/s8dQThYA=;
 b=qEeXWShowCBczZckHOHwQhobl2HEyfQW1em4STzSASoVuz1/u1YdsNzaa1BaTA6p5n
 6PZPkoPCOo2a1/Q8KL6TuIV13R6+5K4UFwYnW/qDm343HHOeDpxARmcgHBR00IivLunR
 S4pcEkKWNhwzZV7xr6RJOqb39ejclqhy1sWLRVhhuef81wUMa0a2tJAbvwDgXrzx985y
 +cgB1ttRlFaywFYp56s08PFzPApy1IR6j+EpTDXRecQlCwoc4Q/ScdUIJCPd+SfihRgH
 nI3jWSWOC2GNMEK3cTqA/90w9EiMKwZAA3f/Cn6WCBqVXoH7LoQZ/a8dzAiJlNzGsIg6
 qq1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qEeXWSho
Subject: [Buildroot] [PATCH 1/1] package/libgpgme: fix
 LIBGPGME_CPE_ID_PRODUCT
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

Fix typo added by commit 6b79c8fb05bf1ae569d8b8e8c9f6f516e97c9ae0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgpgme/libgpgme.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index f61e9fe41a..b42a1a363a 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -10,7 +10,7 @@ LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPL-2.1+
 LIBGPGME_LICENSE_FILES = COPYING.LESSER
 LIBGPGME_CPE_ID_VENDOR = gnupg
-LIBGPGME_CPE_ID_PRODUCT = gpgpme
+LIBGPGME_CPE_ID_PRODUCT = gpgme
 LIBGPGME_INSTALL_STAGING = YES
 LIBGPGME_DEPENDENCIES = libassuan libgpg-error
 LIBGPGME_CONFIG_SCRIPTS = gpgme-config
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
