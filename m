Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4060DEE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 08:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A07C40AB5;
	Mon, 11 Sep 2023 08:50:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A07C40AB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y6XkfQAC2V2K; Mon, 11 Sep 2023 08:50:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B08C3403F8;
	Mon, 11 Sep 2023 08:50:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B08C3403F8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7CFD41BF27E
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 08:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D09E40889
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 08:50:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D09E40889
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lPH4zpuqCH3X for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 08:50:12 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44D2F405C7
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 08:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44D2F405C7
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1bf55a81eeaso26476655ad.0
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 01:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694422211; x=1695027011;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TvOaXilw67NhrAPTlLK5gtiYwdVWr4Dk9sdAJMkaywE=;
 b=ax8b3mCLa3slQfMk0DDAefolfVeGn7nF8yzjsB5jpXD1VeJ2OnljIxqo4306wiZH6B
 Z3S+yhrP3EVuPC3nE9S9TtVUPJFeQO18MWJSBqGfatqCcdwX0kRYlivswimg0L7B32wc
 ap/pwBongJsd1xQ99L6Xj51UaiUj1zKqSXLUCb9xVs6YbcZHFrD3YeGPDVt9lwDn6sFL
 GqRMwVOsgXij3gfAzAHU2b2IHXPj1ZNorcsKwj+ia96JyYaBbyrkc73D2Wk06R2dxkVr
 WwE2H7yuwIReBU/ZeBnpmwLBOz1SIhZ25ywbbLTHASE6rT1SRi53AWoOchmEj9lipC2E
 NTYQ==
X-Gm-Message-State: AOJu0Yx5CkCIkhPo6czOSNHcr3xMv1WuLxlS9/aTXElohwPCxiTULb8C
 B25kcuJsv5lKMSnbzTI9Ls+wPXwKKxtl4g==
X-Google-Smtp-Source: AGHT+IHuloPmWAS79LuEkKI2/V3Sbb4cmmd5UEYWBnq/694H5Q6YhOs2XuyNfrvE7jmAXBMGCVk+SA==
X-Received: by 2002:a17:903:496:b0:1bf:39d8:48f3 with SMTP id
 jj22-20020a170903049600b001bf39d848f3mr6360181plb.16.1694422211012; 
 Mon, 11 Sep 2023 01:50:11 -0700 (PDT)
Received: from chrisp-dl.atlnz.lc ([2001:df5:b000:22:c1f4:694c:ea29:c935])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a170902e54800b001b86e17ecacsm5860531plf.131.2023.09.11.01.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 01:50:10 -0700 (PDT)
From: Chris Packham <judge.packham@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 20:49:59 +1200
Message-ID: <20230911085000.559230-1-judge.packham@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694422211; x=1695027011; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TvOaXilw67NhrAPTlLK5gtiYwdVWr4Dk9sdAJMkaywE=;
 b=oEG6fDyRCUB7MKXck0pL8Qe7sSVNGRPWOWX5AlMuBQsOJEO4r9tm+GF4TxkOODG+ll
 m0RYRPIXPC4VtZr77vVZw5EbnoexuoAVKgoQpdyyVVI4UwftixxjA/ISSHz+xio/M//U
 JcYTV0aP7Tsxijjkchih37p54DZu1gU8aNjZdgsOBpzC4Ao0lKgRzvG70KCgwVthDvyn
 1ADPxjgU+iRJkVUk5g6XTvuSQkj2y7lwXIHaHb3Vwm75S5cpgFzP+czFANxmloxxiZo8
 aZNQwQNbws3G4QvgSJcdsol2P/M6n1uvgPIcVxGkCCEAuL0rbAiEjwPVQuEoa1/P5jjy
 PrgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=oEG6fDyR
Subject: [Buildroot] [PATCH 1/2] syslog-ng: bump version to 4.3.1
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
Cc: Chris Packham <judge.packham@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to latest version. This includes a fix for CVE-2022-38725.

Release notes:
https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.3.1

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/syslog-ng/syslog-ng.conf | 2 +-
 package/syslog-ng/syslog-ng.hash | 2 +-
 package/syslog-ng/syslog-ng.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index a3cfa8dacf..06e48cdd50 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
-@version: 4.2
+@version: 4.3
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index a917331580..6841ed5eb1 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  092bd17fd47002c988aebdf81d0ed3f3cfd0e82b388d2453bcaa5e67934f4dda  syslog-ng-4.2.0.tar.gz
+sha256  999dbab62982c3cffba02c0be22c596ee1ce81d6954689dc9b3a6afeb513cce3  syslog-ng-4.3.1.tar.gz
 sha256  c75dcbfc17ccf742f12042a370f825a40951085d2352dfc9d07e715dae3ca9bd  COPYING
 sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 39433185b4..ff5aaee429 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 4.2.0
+SYSLOG_NG_VERSION = 4.3.1
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
