Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D544C00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 09:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ED75410C4;
	Sun, 21 Aug 2022 09:29:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ED75410C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wIvPbjFUXi5R; Sun, 21 Aug 2022 09:29:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C8A7410B8;
	Sun, 21 Aug 2022 09:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C8A7410B8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A8831BF25B
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 09:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2D9081A73
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 09:29:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2D9081A73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WYRPWQinDTCC for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 09:29:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8EB781A3B
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8EB781A3B
 for <buildroot@busybox.net>; Sun, 21 Aug 2022 09:29:36 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id j26so4199531wms.0
 for <buildroot@busybox.net>; Sun, 21 Aug 2022 02:29:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=3OgahAP6Eil6oX1EyV1F7FJo3n0Jt38o1dLh64TqvIE=;
 b=5iSPUV5YZ4ogJDv/Abp/kj6AfmCbQDzqNhd3YvEx+SQ2tqo4yOMz4NoGUmMiGuYkHs
 cGcCMgvm9m7WhVnUwERvsu0jUtyFjCwWa4Jt7skyWL/JmEBgSHqS0PkwkFsI+qM0eq3N
 uhOmQF2tM9XQ8IWAIiZjkaVYUGFHYkYEOfhwaGp6Cs4aj4pZ6QMMsCylCxSdbtYylp3S
 VJrjFsueD4Cmbj+ZMUTlPP1vf4lV5bx9ecSkFTg5pNgx30eZkmyAi5tdxzs428wOu/Fq
 jAjMAN5monk3owtQIt8Yvsfw+zy5Bnq/EB1RuUq+I5gvVlSH9RJzrDc3ari6wCQt25Da
 cIBg==
X-Gm-Message-State: ACgBeo3PhYK6XPgF8gOVEITlVB0XbtJEVByThfzBL+bGA8UkAaaqmML7
 o6P6sNYpgscHkAuR66zVWYjk79hPxOg=
X-Google-Smtp-Source: AA6agR7dEhSDiN27DXJ5A8VCLaia7eCE6LCMG21OE3bm9yZaQAtdIp277/eOKyIldDO8f57wYUKyIA==
X-Received: by 2002:a05:600c:3b16:b0:3a6:169:d7f8 with SMTP id
 m22-20020a05600c3b1600b003a60169d7f8mr9213268wms.129.1661074174987; 
 Sun, 21 Aug 2022 02:29:34 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a05600c2cc800b003a6632fe925sm770476wmc.13.2022.08.21.02.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Aug 2022 02:29:34 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 21 Aug 2022 11:29:23 +0200
Message-Id: <20220821092924.1620008-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=3OgahAP6Eil6oX1EyV1F7FJo3n0Jt38o1dLh64TqvIE=;
 b=avOGTlzZTmQArscjfcsHwHSMuU2XP7f18Mh5GuEI9Arm7KKV3dEENl0CsjPhCkgVuv
 2BLFzFy8Hb5Ks9VFAvp0khSQ2n8Hex5AiHpNxj5h5AmY0rdh3A5ZeaApeMDeOqDXOhQ/
 SFztVwMq4SExx3b8MdsBJWi/BlePeLZS++zPuq0ehgS2+aj7DIJ82T/D1w+QpUJX6oJA
 O98z06U6avCnPdAVv4NOCQEGSZi92mKgnRF4lIryy64MFG2gl+edVoS70VKSeoCpeekm
 e6bf+bk9Y0Vl8AmHChu0bJNhBPAFN/P9DtUqfX1yvaAgvIiK97H0fCx5VIShhXLzF9Zf
 zJMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=avOGTlzZ
Subject: [Buildroot] [PATCH 1/2] package/tzdata: bump to version 2022c
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

update homepage with https

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/tzdata/Config.in   | 2 +-
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tzdata/Config.in b/package/tzdata/Config.in
index 1e6cc0fc6..31071afb0 100644
--- a/package/tzdata/Config.in
+++ b/package/tzdata/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_TZDATA
 	help
 	  Time zone database
 
-	  http://www.iana.org/time-zones/repository/tz-link.html
+	  https://data.iana.org/time-zones/tz-link.html
diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index 55346539a..b203e5bf5 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,4 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2021-October/000069.html
-sha512  c1e8d04e049157ed5d4af0868855bbd75517e3d7e1db9c41d5283ff260109de46b6fac6be94828201d093e163d868044ac2a9db2bf0aeab800e264d0c73a9119  tzdata2021e.tar.gz
+# From https://mm.icann.org/pipermail/tz-announce/2022-August/000072.html
+sha512  e2ae92abac6d87ce4ab4ba9012e868e1791b842e083293489debc0c671b9cf135b5b70426dacb6dbebbf6eba24463205225ae45bb7df891a086b25475f85ee0b  tzdata2022c.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 9cf8c2ea4..21ea94eca 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2021e
+TZDATA_VERSION = 2022c
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
