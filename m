Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64972C433FE
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 21:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2B6260F0F;
	Sun, 16 Oct 2022 21:15:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2B6260F0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MRg15_5qihD9; Sun, 16 Oct 2022 21:15:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10AEA60EF2;
	Sun, 16 Oct 2022 21:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10AEA60EF2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5CF721BF3A9
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 21:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 368A540918
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 21:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 368A540918
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2cxKYnQCl9lv for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 21:15:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEB04408FE
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EEB04408FE
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 21:15:21 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id bv10so15644069wrb.4
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 14:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nj5ypmdywAZHd+aHeiaYzKdwy/2j0q5m+GdYntFL5Xg=;
 b=W3azyK9Grrl9oNvNZEW04jbkLrN/G6kCKpevrDz7gTmylvXbPZHSvN6Xps/t5/NcZQ
 2YdD5pKUuI9OJfPdUPi4Lief4xXFYW+P0CXVJJExcebKNO+FFpOmMxIjydREg3i7fZ0z
 q5fTDpF1kAuXyMU8wVK/uMNLkWSAx4eT6H3IabO6VAxHTeLx1DtWTO/SmphOvi1m/oB7
 X/WDgaL54Oe56GJaigELUgX4WAhHpZFlWrkE13gvYStX1LTVZE4ec8s+dOnD781CteA/
 PxExjsqPV8u9vBGYp2A2Jw5U3OoGHGZA3la4KKXzrTx0Cg7jqoERPsTnETnyRE37zSjl
 kqGg==
X-Gm-Message-State: ACrzQf0mf8QGGBLLtyuppnJy+CwRMAnSXbdLZzk/Q0SkSb26nWej/8bJ
 IfvQTma48QNXr1tRNGuonbuoXhvYJkA=
X-Google-Smtp-Source: AMsMyM4Qi70Jau2M07RrrYngqlPqoacNYiNXx4Zf5UJOPOgsWpi0tvqDl7CMy4rduthX98aoweDSBw==
X-Received: by 2002:a05:6000:713:b0:232:bd2e:8620 with SMTP id
 bs19-20020a056000071300b00232bd2e8620mr4551430wrb.139.1665954919689; 
 Sun, 16 Oct 2022 14:15:19 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 c1-20020adfed81000000b00226dba960b4sm7031122wro.3.2022.10.16.14.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 14:15:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Oct 2022 23:15:17 +0200
Message-Id: <20221016211517.58308-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nj5ypmdywAZHd+aHeiaYzKdwy/2j0q5m+GdYntFL5Xg=;
 b=hrByTSxuER4/uqoc1c6iH6BzGsjlys/pLTU4u6ugkfu97tmzqNSyTasdA3I3g/f2xH
 NO2npbsSgByFzL714fNtkSVHU1+NRXipxif7994OvSq9gjkcX+QxozFKtidGsXHG9zi7
 sVwJg2sPOhZX76aCG7Wu3lgE0aFov48ZWcOU8pttKzSOBsJB0fa98rJH58waaAla9nZD
 BffxRczG2sFLe19FjuU3+WrkZTtZlrB9+Dic11TKyXq+4OtUeyGeXVIVDd23jLY+mCy9
 Acc6rwpIhQUw1iVTTq29rwDhJBGmhBnF3KZyP7kzM1O6jTHCnT6uCi9F+9kiQihf0o4m
 psBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hrByTSxu
Subject: [Buildroot] [PATCH 1/1] package/libpfm4: bump to version 4.12.0
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

Major updates:
 - Add IBM Power10 core PMU support
 - Add Intel IcelakeX core PMU support
 - Add Intel SapphireRapid core PMU support
 - Add Intel SapphireRapid RAPL PMU support
 - Update Intel Icelake RAPL PMU support
 - Add support HiSilicon Kunpeng uncore PMUs
 - Add support HiSilicon Kunpeng core PMU
 - Remove arm_fujitsu_a64fx_support for ARM(32 bit)
 - Update Intel Skylake event table
 - Add Intel PERF_METRICS event support for Icelake
 - Add support for ARM Neoverse N2 core PMU
 - Add ARM SPE events for Neoverse N1 core PMU
 - Add cgroup-switches software event
 - Add Intel Tigerlake and Rocketlake core PMU support
 - Add AMD64 Fam19h Zen3 L3 PMU support
 - Add AMD64 Fam17h Zen2 RAPL support
 - Add AMD64 Fam19h Zen3 core PMU support
 - Add RAPL for AMD64 Fam19h Zen3 processor
 - Update ARM N1 event table
 - Update AMD Fam17h Zen2 event table
 - s390: Update counter definition for IBM z16

https://perfmon2.sourceforge.net/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpfm4/libpfm4.hash | 6 +++---
 package/libpfm4/libpfm4.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpfm4/libpfm4.hash b/package/libpfm4/libpfm4.hash
index bdc7806a7c..42740adb1e 100644
--- a/package/libpfm4/libpfm4.hash
+++ b/package/libpfm4/libpfm4.hash
@@ -1,6 +1,6 @@
 # From http://sourceforge.net/projects/perfmon2/files/libpfm4/:
-sha1  112bced9a67d565ff0ce6c2bb90452516d1183e5  libpfm-4.11.0.tar.gz
-md5  4811c1d99b95752b4ba53b89a9389ec3  libpfm-4.11.0.tar.gz
+sha1  4c61cfb489426d9fff15428cb8536ba0e391c8ac  libpfm-4.12.0.tar.gz
+md5  9e4f9b89d23171eb9314a948a51b4284  libpfm-4.12.0.tar.gz
 # Locally calculated
-sha256  5da5f8872bde14b3634c9688d980f68bda28b510268723cc12973eedbab9fecc  libpfm-4.11.0.tar.gz
+sha256  4b0c1f53f39a61525b69bebf532c68040c1b984d7544a8ae0844b13cd91e1ee4  libpfm-4.12.0.tar.gz
 sha256  beef323d68fc5db9c67b20e8e9de7ccde371d20cdbcdd686804055b18b926d90  COPYING
diff --git a/package/libpfm4/libpfm4.mk b/package/libpfm4/libpfm4.mk
index 2144766d96..7165d78cd9 100644
--- a/package/libpfm4/libpfm4.mk
+++ b/package/libpfm4/libpfm4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPFM4_VERSION = 4.11.0
+LIBPFM4_VERSION = 4.12.0
 LIBPFM4_SOURCE = libpfm-$(LIBPFM4_VERSION).tar.gz
 LIBPFM4_SITE = http://downloads.sourceforge.net/project/perfmon2/libpfm4
 LIBPFM4_LICENSE = libpfm4 license
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
