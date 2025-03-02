Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDD1C282D0
	for <buildroot@archiver.kernel.org>; Sun,  2 Mar 2025 21:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA53560A8A;
	Sun,  2 Mar 2025 21:53:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id elm3iDTn9tYT; Sun,  2 Mar 2025 21:53:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDDDA60909
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDDDA60909;
	Sun,  2 Mar 2025 21:52:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 728A595B
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DFF64140E
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pyqP16jZYZnO for <buildroot@buildroot.org>;
 Sun,  2 Mar 2025 21:52:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 42AE3413E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42AE3413E7
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42AE3413E7
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:53 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43935d1321aso4377265e9.1
 for <buildroot@buildroot.org>; Sun, 02 Mar 2025 13:52:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740952371; x=1741557171;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+xyUbL7z3iDuf2R8ovF0MRCqU7U4bpsdASNtvItVpGY=;
 b=xNd67oOB5dF96bp0yU860S2aN/PuFVVyxpt3F7MHUxgxatSY2QWzVGsZkqLcL2na4I
 7kwwAL5IdfdUOCmoMsdLa+3AaxkCfTJzktHN6FDgKfVxw285bxH1uCvBmArOIeCNfiUj
 PmO2K1ilAx9VS8/5/Zb299/H0VfiKqm9T7+NDRJsBCc7NjbLv+UBTjptHcCoutrr5LjK
 2vM+4+2QrqhAw2xNST69wxMBjgkDvc5JGB1NSB7+EYO7s69QKyUEEsbeIcU1lIo+AqcJ
 VcWnP5ce5+LrlEvgLTFo7oc80ckVGIHhL7dj+WCRWOLT850K44wkpN1JFmriXlsunnHq
 ctVw==
X-Gm-Message-State: AOJu0YxDzXu8FK3k/QbdQuHdVst0ahICDRt5CzuEnAO1ceyoR0rTmpff
 v3q3+Fncv+PMSvZFXIC/8JJmLvGOObOaBGjX7drdAz4gP1mMoAH+GQIS49F7
X-Gm-Gg: ASbGncsOIYBzyvNS2UppI4dcg953EZ0zRe2HGq4J7NsgdjPOEO2eOv8WnfvqcaqRuyZ
 FXk3680BnBdbmI/E8Px8KjmBRA1RhCIfeQkwGm47kGhzSZIA+zymnb3BU1VkX27WhBdj2vKjQSt
 187s5whYPpkwl7gE0YTABhPOR/unA9PgfJKEXMkwCIhvfeY7Qo8OkUy6zi8VqhXRe+syxEoPNv0
 0bMThoqsBTlf+MZUEQWtr2Yt37JtM0V2xJLLU5huX4HgIUpHC4rwmHfVkwFMDIhxHY9tWd3k//l
 euajtnEyMPJmD4e0FEcV7yRRfwKTXtZ4r+wCIw==
X-Google-Smtp-Source: AGHT+IHUVxOEUf2BY5iG8k3+mGdgwrON4IQNlE3ZaiLrAJ5pGW2hyRw/scFkHVo4k97am55Hh75GTA==
X-Received: by 2002:a05:6000:188c:b0:390:d8ec:1779 with SMTP id
 ffacd0b85a97d-390eca2b5a3mr3689259f8f.12.1740952370882; 
 Sun, 02 Mar 2025 13:52:50 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab2cb1063sm113389645e9.2.2025.03.02.13.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 13:52:49 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Mar 2025 23:52:12 +0200
Message-ID: <20250302215219.1276480-9-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250302215219.1276480-1-olteanv@gmail.com>
References: <20250302215219.1276480-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740952371; x=1741557171; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+xyUbL7z3iDuf2R8ovF0MRCqU7U4bpsdASNtvItVpGY=;
 b=QQaaVNEBM4Mq1cTSk4uImtvmaT/Aw6VMQhMBEtMFt8Ii62XhOwuCB+sgZiBB5s6+X7
 PvL4zGohribwFN/pT/eo7tj1hGskPojuSYm4GpVie5MOtMPLGZi3xpJvTMVBTMWVMAFc
 SXmxr6T6w/p5XZjNRdlkdPfuc+9iOH5GlRN7m637LrGL1rBAUrErXqIkOitJC1/ng53e
 1oRiq0zv4FmjaHdUc2EJyY/HV8NYqMy1oZYwRC+y/sWpRNCvAcfbaWVhX//qv+nwDd+/
 vMPaeMvew0Jb9vow2KP6rhiMxDj71feUCdXoBrDM5bbqXN0HHZbv9H3qiFlsAJ+RfGUS
 le0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QQaaVNEB
Subject: [Buildroot] [PATCH 08/15] package/fmlib: bump to tag lf-6.6.52-2.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change log:
9fb916f25521 Add support for allow/deny HC usage
56f7bd7378e5 Check if valid FMan handle exists on FM_PCD_Open and FM_PORT_Open
01136b83d7db fmlib: rename COPYING to LICENSE

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
Change log:
- Break out fmlib changes out of larger "[PATCH v2 01/11]
  platform/layerscape: bump Linux Factory tag to lf-6.6.36-2.1.0" patch
- Bump to lf-6.6.52-2.2.0 instead of lf-6.6.36-2.1.0 (new tag appeared
  in between)

 package/fmlib/fmlib.hash | 4 ++--
 package/fmlib/fmlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fmlib/fmlib.hash b/package/fmlib/fmlib.hash
index f81b017869c3..edf87426dfb0 100644
--- a/package/fmlib/fmlib.hash
+++ b/package/fmlib/fmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  64dc76c0adc3aa58bce6aba470dee7dee001d4964ccb1958e899a59d9917b21d  fmlib-LSDK-21.08.tar.gz
-sha256  5d7770fa9f70f0c6f0b4784bbca8401811259a4b1e03455dbd863ffd0d34d2ca  COPYING
+sha256  173f1c41207e50dd3908c7dad192962240fd1a9269bca6e368f401134b3503bf  fmlib-lf-6.6.52-2.2.0.tar.gz
+sha256  5d7770fa9f70f0c6f0b4784bbca8401811259a4b1e03455dbd863ffd0d34d2ca  LICENSE
diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index 3d185979d51e..601a3e16efb0 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-FMLIB_VERSION = LSDK-21.08
+FMLIB_VERSION = lf-6.6.52-2.2.0
 FMLIB_SITE = $(call github,nxp-qoriq,fmlib,$(FMLIB_VERSION))
 FMLIB_LICENSE = BSD-3-Clause
-FMLIB_LICENSE_FILES = COPYING
+FMLIB_LICENSE_FILES = LICENSE
 FMLIB_DEPENDENCIES = linux
 FMLIB_INSTALL_STAGING = YES
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
