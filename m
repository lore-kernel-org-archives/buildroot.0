Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A479EC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 13:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0482560B2A;
	Sat, 10 Dec 2022 13:13:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0482560B2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hj_WCF31Wior; Sat, 10 Dec 2022 13:13:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4E416072A;
	Sat, 10 Dec 2022 13:13:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4E416072A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A60641BF8C7
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 13:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3F21402D4
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 13:13:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3F21402D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id unJoatfNq-4d for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 13:13:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51A7A4041C
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51A7A4041C
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 13:13:20 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso1697287wme.5
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 05:13:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PThD9ExDEsqGEiA7Rn3m8qFkpYHk9SDnnjQWp9rewxc=;
 b=6FT+r81bO/aOXlOyHTGBm0AQl077lARKNN1MNzzgOUnfk+3hlp5i4MvIVAoCi/zJ3u
 Jbg19RWDkFESsbgNZTlV46N2DqDeMWNvSUd3xph/d3XC4Pwyv62S2EuykKik63HDeLMn
 3W4MxGUiQ5FRXwdzMTvam1IXf+c7AwA3jteR0e5G16yGm23HzSQdiz+SaTAUSfiF7PT2
 mv0o5YSWx54txutXMHQy231mOtSXUv4De7FBM7HkvSiioGUgv81QwZqyBO8LzeUN+Eti
 JD+OpkQwaRM0xi4WgwjvKEE/bTg94dPzKloraaYb65b4sSjKUuatAIxRQaFdTsWZjC7u
 hdOw==
X-Gm-Message-State: ANoB5pnWK0fDcu2kqk42CKGhcJ5wuxVpcIPFYIgONAKSIL0X4+Vx/PVW
 d2wWsrppbVdyMWaynYSalGlyRo4ZdYs=
X-Google-Smtp-Source: AA0mqf5X/C/MpdBOVVJQuqIJPOe4W4kIFhztCJlBbXj40kCfKp5lbt/QcgynBUp/nJiSmuJCBf1Iag==
X-Received: by 2002:a05:600c:4f96:b0:3d1:c895:930c with SMTP id
 n22-20020a05600c4f9600b003d1c895930cmr7542335wmq.35.1670677998070; 
 Sat, 10 Dec 2022 05:13:18 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 p38-20020a05600c1da600b003c6c4639ac6sm2828347wms.34.2022.12.10.05.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 05:13:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 14:13:14 +0100
Message-Id: <20221210131314.5634-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PThD9ExDEsqGEiA7Rn3m8qFkpYHk9SDnnjQWp9rewxc=;
 b=iuExtYnmby9ac5PIXLY9zayJYXBvJaSHzQM5OprRX9FS6mp7Ye0b8yl+5B54PMeUHq
 1WUaRIrURAf9gvRaXMEdASVhAc5NsqVwnZmL4dJHLydX96RiT09MbFC9PUMg92rw+iZP
 /8CBDOjis9qBhTT5KvdQwEeEO5+jZ2onT3UvUXd0IXx1LL7XusERyp6HtYq0ZtweSy58
 ujnPddUqllTWICTguxMZUs08bROV6GhqHWsXS3dkZy/cbUisATXzu3LZYjppWXqkdfUl
 p0dIxlTezKfggcSXsMwSup+2ox7VQoHqRWbSqD3ZiFKs0vC35dQJmwnnUtYJHhzZ783E
 7SPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iuExtYnm
Subject: [Buildroot] [PATCH 1/1] package/freeradius-server: disable with
 libressl
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
Cc: David GOUARIN <dgouarin@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building with libressl results in the following build failure since the
addition of the package in commit
736c4c1655d93652a9a7e79235bbe726b3d46176:

src/modules/rlm_eap/types/rlm_eap_fast/rlm_eap_fast.c: In function '_session_secret':
src/modules/rlm_eap/types/rlm_eap_fast/rlm_eap_fast.c:228:47: error: invalid use of incomplete typedef 'SSL' {aka 'struct ssl_st'}
  228 |         eap_fast_session_ticket(tls_session, s->s3->client_random, s->s3->server_random, secret, secret_len);
      |                                               ^~

Disable building with libressl following upstream feedback:
https://github.com/FreeRADIUS/freeradius-server/pull/4689

Fixes:
 - http://autobuild.buildroot.org/results/c8df444f4c39f83e254dbb642a5852a1c956f7bb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freeradius-server/freeradius-server.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index ebd459341d..af3320eb44 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -178,7 +178,7 @@ else
 FREERADIUS_SERVER_CONF_OPTS += --without-rlm_sql_postgresql
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 FREERADIUS_SERVER_DEPENDENCIES += openssl
 FREERADIUS_SERVER_CONF_OPTS += \
 	--with-openssl \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
