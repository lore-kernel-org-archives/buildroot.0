Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F7AC38A02
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 19:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5683840523;
	Sat, 29 Oct 2022 19:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5683840523
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sdd2mLc-hsPk; Sat, 29 Oct 2022 19:45:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BB054052C;
	Sat, 29 Oct 2022 19:45:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BB054052C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D2E231BF421
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 19:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD54F401BB
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 19:45:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD54F401BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WAI8CNjkwE0r for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 19:45:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84A444018C
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84A444018C
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 19:45:04 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id h9so10764940wrt.0
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 12:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MKf70NqvnPlCJ9i8j+oZgWRak2OYHUJyMccyO4pNzVA=;
 b=ajI+A/tctMUhku9Fp8+SY94XRGriNmmAB52/vK73IyV55TTPuTzGVeMpWPG7N76xwP
 wF9WAv0/bD0ni8frmxSXmphDH9Qo7OhNwmFxMZl774C+w7BL2z7TO2nDrRIsNSm1SGUz
 WkM9zsj5G3JgsfBXbLdjNH1g/KYBqC0rWVVsFMqAxq7aw2SRbHKm8VsiK6mhel74WxRj
 fPGcYt0yP4HPubBwisqoW7r/7DP/kudPt6/X0IYwI6qm59I3wwQhQMNhXVIuIiTEV4nT
 pulFLNXkz4nYVOu4k7h50eS4GImgO3JOUx9YmmV3yjLC/2o1sf1N+aWQJEwDrOrz2yrO
 4Tjg==
X-Gm-Message-State: ACrzQf1tjTr+93gC1lEOUqGcU/KHrY/EayRSpSH1t4b1XV9FRKoCWIzB
 Y5jpEHVyfxkh1KKZKi1/ED1W8WHln10=
X-Google-Smtp-Source: AMsMyM5H9+iMAZ3HT8nw+o31WnbRWsGHqieb1nio5SN7+ZQztm5Yg54uX6xmoR6RSG0BmguR/XjTfQ==
X-Received: by 2002:a5d:698e:0:b0:236:4b95:17ff with SMTP id
 g14-20020a5d698e000000b002364b9517ffmr3239590wru.196.1667072702377; 
 Sat, 29 Oct 2022 12:45:02 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 m11-20020adfa3cb000000b002366e3f1497sm2298478wrb.6.2022.10.29.12.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 12:45:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 21:44:59 +0200
Message-Id: <20221029194459.28157-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MKf70NqvnPlCJ9i8j+oZgWRak2OYHUJyMccyO4pNzVA=;
 b=CnskVtIBneXgn9xX+b8cm4Vw0neuiVlVj+mBxg5/RzSxHVQH3ct5Vl0knRbrxkk854
 6Fjcg65rzuGOHaJMDKCk1IqV19CWIt/GQLCY706gdB2YjzA7Yni2Y0Ji2TpFy2/UxVM6
 +j+5Hqamb0nx4TnglQbWhhaddDy8waqs0LAfUNj7U24xlip+DobDlJ5glvlq2eZ0irXW
 m2SjvfJCQ+VZ/jwcRgspeXyEtuhE6M0z6H2fWBhX7dlniG2ZXOZ6s02rS9M7PNUWwXfv
 0l0aZzR5m7swbBHSJDM8CbMrKdjr0WkZAg+7Mgjd88gtDQiW+XEqA6/JO84s/azj83b2
 CGXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CnskVtIB
Subject: [Buildroot] [PATCH 1/1] package/minizip: bump to version 3.0.7
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

https://github.com/zlib-ng/minizip-ng/releases/tag/3.0.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minizip/minizip.hash | 2 +-
 package/minizip/minizip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minizip/minizip.hash b/package/minizip/minizip.hash
index 0c6e218488..55fc176dbd 100644
--- a/package/minizip/minizip.hash
+++ b/package/minizip/minizip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  383fa1bdc28c482828a8a8db53f758dbd44291b641182724fda5df5b59cce543  minizip-3.0.6.tar.gz
+sha256  39981a0db1bb6da504909bce63d7493286c5e50825c056564544c990d15c55cf  minizip-3.0.7.tar.gz
 sha256  675181c03fc1302a1c8554c00f7be9bb420c5dbc9dcc2013433cec144413de03  LICENSE
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index 5adee7c494..c74c0df8d1 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIZIP_VERSION = 3.0.6
+MINIZIP_VERSION = 3.0.7
 MINIZIP_SITE = $(call github,zlib-ng,minizip-ng,$(MINIZIP_VERSION))
 MINIZIP_DEPENDENCIES = host-pkgconf
 MINIZIP_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
