Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762C5C46467
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 12:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14CBE41550;
	Mon,  2 Jan 2023 12:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14CBE41550
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3zmOVcHqiaue; Mon,  2 Jan 2023 12:23:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A05140866;
	Mon,  2 Jan 2023 12:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A05140866
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1233B1BF33E
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 12:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1ED88109A
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 12:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1ED88109A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t9pFeVFSq-U3 for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 12:22:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D28D880D7B
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D28D880D7B
 for <buildroot@busybox.net>; Mon,  2 Jan 2023 12:22:33 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so18101179wmb.2
 for <buildroot@busybox.net>; Mon, 02 Jan 2023 04:22:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hf302LJO5ek3r/JilKc0E9ydsfSpOV2NLidrb2es3JY=;
 b=SLEDid/1Bndx6KOC0nMDnj32jtCGOmQcriOigX7DifNTptCHXNmVhU7ONPfmFelYMG
 GtpBUudbL3YG53DTD1SclAz006Ru+MIMudaV85r5xndOR4c5OUegCeVCZuRy/fC0GeW3
 Ha9Z5ciNVwNR/egXiNuZR6v7EhdyB2mKIOAfWaLMOPw4Ur6LVi9FrR8d5XZUFi3NMst4
 tN6/KPdY9iOH1sPiJL6l3P52n3+kZIs8h3X9t5fYnhqcFiYh0Re97xTki0FsC9D1jY+a
 cUpSac9Gkhv/qo/RF/HcKT2fFm3Y3Vl4AemvqjqSrGGmIZ9OZEgxInpBUwvISDmr0dDT
 aqbQ==
X-Gm-Message-State: AFqh2kq4xMFu/Er4IIl6sOsY99ghPSRoihcg8BxVc2WF4pYLsyJl2778
 8m7Te0w74H4UZUw1zxpH/eC9Gpq+jZk=
X-Google-Smtp-Source: AMrXdXvRUFG9W9ReVccr4bNmE6VvU0dqjWevBkz5JUDJUvhcayzXR+pv0BIRkvcpmgkw9eqvQQ9Drw==
X-Received: by 2002:a05:600c:3c88:b0:3d9:69fd:7707 with SMTP id
 bg8-20020a05600c3c8800b003d969fd7707mr26047183wmb.2.1672662153436; 
 Mon, 02 Jan 2023 04:22:33 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 n41-20020a05600c3ba900b003d358beab9dsm42386776wms.47.2023.01.02.04.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 04:22:32 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  2 Jan 2023 13:22:29 +0100
Message-Id: <20230102122229.1912409-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hf302LJO5ek3r/JilKc0E9ydsfSpOV2NLidrb2es3JY=;
 b=RKrlwoY3HaeNW1zc5Jm89Inr41GC/k7iweVxDgI+u/J2+hrPFqk1WMXeyuMaZ+tJrG
 gRPOPyPf0lM6vZXAvrsUr1HDGLrXTummXSlCoxzZFakzLIY9qDsFi/Plp/2wmT7aw350
 TX5WRNjX1bBdXzBu6xZ82UadXWAJ+rGM4Hpl5d6IqY2AwDzvLlVidub60i6AKIVP22Dw
 P+riu2/5rPDDAxrfqsbbeyzhaE/iSA01r/7K1cgus7lW/EUmgc8bhOMMOVSOejjK/JnS
 bP+WjwDLvPbqw/0i7WjrqIm7wSp77s3MPY4fyKKh/MJYOoxEkamK3m3+eyHenaoAlo7p
 MwXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RKrlwoY3
Subject: [Buildroot] [PATCH] package/tcpdump: bump to version 4.99.2
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/tcpdump/Config.in    | 2 +-
 package/tcpdump/tcpdump.hash | 4 ++--
 package/tcpdump/tcpdump.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tcpdump/Config.in b/package/tcpdump/Config.in
index 8b54c603d..742947136 100644
--- a/package/tcpdump/Config.in
+++ b/package/tcpdump/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_TCPDUMP
 	help
 	  A tool for network monitoring and data acquisition.
 
-	  http://www.tcpdump.org/
+	  https://www.tcpdump.org/
 
 if BR2_PACKAGE_TCPDUMP
 
diff --git a/package/tcpdump/tcpdump.hash b/package/tcpdump/tcpdump.hash
index 1990aa797..a950d3fa6 100644
--- a/package/tcpdump/tcpdump.hash
+++ b/package/tcpdump/tcpdump.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature at
-# https://www.tcpdump.org/release/tcpdump-4.99.1.tar.gz.sig
+# https://www.tcpdump.org/release/tcpdump-4.99.2.tar.gz.sig
 # using key 1F166A5742ABB9E0249A8D30E089DEF1D9C15D0D
-sha256  79b36985fb2703146618d87c4acde3e068b91c553fb93f021a337f175fd10ebe  tcpdump-4.99.1.tar.gz
+sha256  f4304357d34b79d46f4e17e654f1f91f9ce4e3d5608a1badbd53295a26fb44d5  tcpdump-4.99.2.tar.gz
 sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 7741c3b58..c38d46e2c 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPDUMP_VERSION = 4.99.1
+TCPDUMP_VERSION = 4.99.2
 TCPDUMP_SITE = https://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3-Clause
 TCPDUMP_LICENSE_FILES = LICENSE
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
