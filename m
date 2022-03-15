Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386D2C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9D6184179;
	Tue, 15 Mar 2022 21:42:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v46l54-R7-4E; Tue, 15 Mar 2022 21:42:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11D6384128;
	Tue, 15 Mar 2022 21:42:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 721D11BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F53340154
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:42:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zB5DKKRVvA36 for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:42:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA83940103
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:42:16 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 v2-20020a7bcb42000000b0037b9d960079so2209531wmj.0
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 14:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=utiNiNcGxov+ryICH3zTVvyQJdDN+09+hFUma7KRWrc=;
 b=ZuSLluMGyp6jy1RvNSA3kyHrum23CYOD8Ck6IbxZiFRMWS7fRW7orBgBbgrwfFtM1D
 YBFdbzg+w0GOeJZJ2Pv4vchLytrTeHa7d5ngkDuX24Al+6QDpnTHx3eJpb/ebvioUdKV
 +Ij0f4nuxq0BhaCF0gu+BFDhXchVHozvS1GbHwUL0d2kWs5PltrJz28RGIoF9WQjzdQ5
 jX3CEBKdciz+fPpNdC7+bF1ZgUxcALej0mL+SygkKkSjOG/gg1fWfs0DZqvNmBgp1ajf
 mh98qXhEVRifwQUVKCOfR/eMPN1+knuwt3j/mOfSlcGt1EezpiICDSMeBo8/ixpNa55i
 ZNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=utiNiNcGxov+ryICH3zTVvyQJdDN+09+hFUma7KRWrc=;
 b=YWFV8PkqEwJ/aY+3UkoGSoVPWoQn4boKHeAsy9T6PSlJmQnQcFVlXsWPoHdO0+aksX
 lyAjP8KQkt4cpd2kjAu5EK5jgOM1n9qFRsdzAMRpEQz7LIQi8fBHE2e1zL0v2P8x/FxG
 wLCcOmxhY4Rz0xPWcSuWQbe82v3DElopPuxV64C25k85GT7EM2FO2RL5wwYgT/FEo6yY
 YQyRk4TCBVKMCXMV1KavZQlFrKUVZVDv4K8kc2cpetxVH+j0zBR9waVVxv0f9ZFPtIPR
 o5qXzNiOwDHeVGuNO618lRY5N8skB4ktFeYFcv0pE1yF8RIYbDwhiyTTJmYXPJlqr40T
 OaZA==
X-Gm-Message-State: AOAM532rvrvxMjoSkSZVJk2thBA7FveLfaDEC7EzHLthgctEuUkpxjet
 nVhNVhhafWlzaiE9oq24jkfLrRBE3TU=
X-Google-Smtp-Source: ABdhPJzOj/fedMTI0SlInJ8wuFLeMSMAMKlEcjS2g4IPJhr3DmGoF2eq0fxRVSetneWVfzSvcq70nw==
X-Received: by 2002:a7b:c40f:0:b0:389:f3ad:5166 with SMTP id
 k15-20020a7bc40f000000b00389f3ad5166mr2708071wmi.63.1647380534844; 
 Tue, 15 Mar 2022 14:42:14 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l18-20020adfe592000000b001f064ae9830sm110301wrm.37.2022.03.15.14.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 14:42:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 22:41:13 +0100
Message-Id: <20220315214113.2322315-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libbdplus: bump to version 0.2.0
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

https://code.videolan.org/videolan/libbdplus/-/blob/0.2.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libbdplus/libbdplus.hash | 6 +++---
 package/libbdplus/libbdplus.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libbdplus/libbdplus.hash b/package/libbdplus/libbdplus.hash
index 6abc0e4970..2445af6e82 100644
--- a/package/libbdplus/libbdplus.hash
+++ b/package/libbdplus/libbdplus.hash
@@ -1,5 +1,5 @@
-# From http://download.videolan.org/pub/videolan/libbdplus/0.1.2/libbdplus-0.1.2.tar.bz2.sha512
-sha512	e00e7bc9f52b9275646593b753ba646b052255be94a7241965f4dbe4734f8f6a072973ed4b9997957f939236b0633897c295749f79e232188430795be5b5087b	libbdplus-0.1.2.tar.bz2
+# From http://download.videolan.org/pub/videolan/libbdplus/0.2.0/libbdplus-0.2.0.tar.bz2.sha512
+sha512  172e4932fb5540fbdb5b86e1d42cfaddf60b81416d2de50c8add83fb7f1bd7c296c975fd84a6ec42566977086dccfe07db5ce696038862bc75c6494c647998d6  libbdplus-0.2.0.tar.bz2
 
 # Hash for license file:
-sha256	592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c	COPYING
+sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
diff --git a/package/libbdplus/libbdplus.mk b/package/libbdplus/libbdplus.mk
index b0e8b1488d..600cb6b545 100644
--- a/package/libbdplus/libbdplus.mk
+++ b/package/libbdplus/libbdplus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBDPLUS_VERSION = 0.1.2
+LIBBDPLUS_VERSION = 0.2.0
 LIBBDPLUS_SITE = http://download.videolan.org/pub/videolan/libbdplus/$(LIBBDPLUS_VERSION)
 LIBBDPLUS_SOURCE = libbdplus-$(LIBBDPLUS_VERSION).tar.bz2
 LIBBDPLUS_LICENSE = LGPL-2.1+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
