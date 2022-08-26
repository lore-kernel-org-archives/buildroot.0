Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA710ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 20:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75DBD60803;
	Fri, 26 Aug 2022 20:48:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75DBD60803
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zA-FnrtDpuOo; Fri, 26 Aug 2022 20:48:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC56E60681;
	Fri, 26 Aug 2022 20:48:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC56E60681
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 30F191BF2A5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 20:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BE8781295
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 20:48:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BE8781295
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i_Mi0uLPzrEH for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 20:48:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48DB281290
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48DB281290
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 20:48:54 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 ay39-20020a05600c1e2700b003a5503a80cfso1417493wmb.2
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=B+K/6RHmsFYmMokWH12cXDV0YWADUJXEeRtm/TkqZIA=;
 b=BO/bVMJCX89JeULvXfxEnBZ9QtC9qVqicFcrWKcY2EfuJ4/KorFDaI4baO52BjSAFV
 JlxXpyHAMMTEeMXIMfRTjq9HcaDWk79Q0UU0CVO3ohi36f0pm8jF3LnZCvSTlZv4EN4o
 gVfmGEkjdX1UFwPf11dJgX4kIv1fAFwtDAgQxin7SEOIURTsquQykLOnn4kqt2ZS2yY4
 A0o+wYvo7WdVzeV7kC1dyyRKLGmxzJJS2o0aY6j/N2rfPVWZmsv/JcAZJRONsTI/JPGn
 CeK3cX9eM4H+AlFPO3BQ1eOfObUu1nfIDD5lWjeXr1KvHNCXM2hPe/VzVpdN1S8KXSJO
 zqGA==
X-Gm-Message-State: ACgBeo2K5AiR/3+ODVmrADkih5/3TZvH7xwITXm61TwVYAk/htZG656W
 fssV/39iDXncV0vbINagKaeMta9ae7g=
X-Google-Smtp-Source: AA6agR4tWUhPo+OxgpJBx1QBEgF17BRo3fAOi8543ipD3of/bJ5rKNe8cH9WwMsKuXTQiCr+jGaHcw==
X-Received: by 2002:a1c:7916:0:b0:3a6:3540:5b3c with SMTP id
 l22-20020a1c7916000000b003a635405b3cmr662990wme.178.1661546932182; 
 Fri, 26 Aug 2022 13:48:52 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 h4-20020a05600c350400b003a54f49c1c8sm816962wmq.12.2022.08.26.13.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 13:48:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 22:48:49 +0200
Message-Id: <20220826204849.17439-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=B+K/6RHmsFYmMokWH12cXDV0YWADUJXEeRtm/TkqZIA=;
 b=ADt+T1Q3xoM7OlZDslL0lqJt/2ugh+H6j6sirHyYlILKeARxGG205jcp6UklHNumFw
 Zg7XsfoV/4Shq8VOQgpexYO9aezrtFS0VTVf008BCoLyitdzd4d4mU8pGcLX3KGHShuo
 UY4E2HbRnwWExrav/aTYJHJoCgdOgeEhFQ9CJmSvD9JNYOksSQhfwHajEEGjmQ+BVQ+f
 w/UZ8HqeK0/7tNnnktKFxpmLAB0m2rDJHlvSLeUwpruo8Q0d9hA6WxSE7IRm4fGNY40t
 zoip/WRlVLhxQaN4DBCrRWZipbqGPvOGb+Zk3BHDy+FnO5w6PbC1QWCX6OsWjUK7eTFX
 as1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ADt+T1Q3
Subject: [Buildroot] [PATCH 1/1] package/sysdig: fix legal-info
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix typo: SYSDIG_LICENSE_FILE -> SYSDIG_LICENSE_FILES
added by commit ea86757e51cf424566f79896335d31d15b89d0d9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sysdig/sysdig.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index 2d57c0043f..e9968d9fde 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -7,7 +7,7 @@
 SYSDIG_VERSION = 0.29.2
 SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
 SYSDIG_LICENSE = Apache-2.0
-SYSDIG_LICENSE_FILE = COPYING
+SYSDIG_LICENSE_FILES = COPYING
 SYSDIG_CPE_ID_VENDOR = sysdig
 SYSDIG_CONF_OPTS = \
 	-DENABLE_DKMS=OFF \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
