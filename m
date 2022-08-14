Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C25C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 09:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47FC4401A3;
	Sun, 14 Aug 2022 09:06:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47FC4401A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U7P1-_reUd8h; Sun, 14 Aug 2022 09:06:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BFF94017E;
	Sun, 14 Aug 2022 09:06:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BFF94017E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BBEB61BF361
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 09:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0299823F6
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 09:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0299823F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9aBjSwpeR285 for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 09:06:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14BCB81D47
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 14BCB81D47
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 09:06:31 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id fy5so8910258ejc.3
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 02:06:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Fja5rEOnGCN5uteTrYy/74pJqRt0q/jtg/Xmvg832Zw=;
 b=rkvlKdw1mxVXsoIpnOLcv+iLES2RZf/t06lS8KYV+fdTztCt9elCtjPHsVYLXJHy0K
 QLy/iSRhz51ZBjL/GvrbFPSG830EM0+fzBu27xDElF/MfaOSJlIk6zObgVBZIYY7o7dI
 1tAmzb/6FsdZImSLU4tYLC0w+GWmlmL1zTLmuKA2gj0eCE0Yukl/HCgmek+xzu/DhzTp
 LcCM0HVNETa6wMhEeJx38QAKehHrLOA0Fx6gxdJ8QhrRnJoRtJ2y7Cwvr8uGIN4faQeD
 vRThHKaAw8VEQCCrOBkB+4krvWR53eX/BzrcTME6Avpq0A6y7K1L12/QPzKOnWC87G6K
 8yxw==
X-Gm-Message-State: ACgBeo2aymQHybMgUgTdk5L+l/UsFsU7NeihQPip4VJFfb9FCcMWB/+Y
 3Xi8AhurrF8oI1KfWKukff/U5Pa2sDo=
X-Google-Smtp-Source: AA6agR4hd4iIiC762KsiTOXDMDuy9d3bueOj0QLiZ6Q0VLvrz+WHbpYMGJDLwJ+ILmXjvbcZDKE2/A==
X-Received: by 2002:a17:906:8501:b0:711:bf65:2a47 with SMTP id
 i1-20020a170906850100b00711bf652a47mr7521973ejx.150.1660467989223; 
 Sun, 14 Aug 2022 02:06:29 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a170906368a00b0073085243f3fsm2731463ejc.64.2022.08.14.02.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 02:06:28 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 14 Aug 2022 11:06:21 +0200
Message-Id: <20220814090621.1226531-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Fja5rEOnGCN5uteTrYy/74pJqRt0q/jtg/Xmvg832Zw=;
 b=nsa4TlZyjvuE54msswJpqnA5xTkuQIj/D2FpzqzVdG7maB8YR1dmJxhAwU0fUvWhMZ
 nQfSXvYHkiql0qx3hCBtv4inT3AyaIySS7sksME1vPC0lsnGctIk8lVNoVWC+rX0B3ar
 EQ6RD/Ohgu3sEOvK6WYqPfTdTL+/EmzIs7fPKOu2mp1PCk/SU4BytJoRargnKXJ3Pf/9
 +ODjwqGkPkUAIz5rFir+sPDQpPSdneVot/4SZTH+2MZaokPxWmNB2DkLZO246PoUt0IU
 X6rfTwKHiX9hlJBBvBurxn4uXQudrXXKIZ/2pNwGdG5cmj4cDxrMhxJkcmRTFFIFQlkJ
 RdDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nsa4TlZy
Subject: [Buildroot] [PATCH] package/sqlite: security bump to version 3.39.2
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

apply fix for CVE-2022-35737

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index d6a74cd4c..d5af2297f 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e90bcaef6dd5813fcdee4e867f6b65f3c9bfd0aec0f1017f9f3bbce1e4ed09e2  sqlite-autoconf-3390000.tar.gz
+sha256  852be8a6183a17ba47cee0bbff7400b7aa5affd283bf3beefc34fcd088a239de  sqlite-autoconf-3390200.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index cc9f7e679..01dbb153b 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.39.0
-SQLITE_TAR_VERSION = 3390000
+SQLITE_VERSION = 3.39.2
+SQLITE_TAR_VERSION = 3390200
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2022
 SQLITE_LICENSE = Public domain
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
