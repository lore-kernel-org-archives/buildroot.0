Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD17FCA0FED
	for <buildroot@archiver.kernel.org>; Tue, 26 Aug 2025 23:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9841740845;
	Tue, 26 Aug 2025 23:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1hw9d-zWKsG; Tue, 26 Aug 2025 23:18:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D05A9407EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D05A9407EA;
	Tue, 26 Aug 2025 23:18:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E298B8C
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 23:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A81280DD9
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 23:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xzey6kIFcMYa for <buildroot@buildroot.org>;
 Tue, 26 Aug 2025 23:18:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CC3228064F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC3228064F
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC3228064F
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 23:18:12 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-771ff6f117aso955589b3a.2
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 16:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756250292; x=1756855092;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oadEww3lnc3Gp9y4xV5hecmdtPoC0TY0kp4vpw1hTLE=;
 b=F5vpWGLZmt1xw7JUYmwQb+uh/GItFS+uxm9/DUaS202HzGvK4vB+pxW/VesKy4Aw7Z
 1YlGDbbwEM+xZaORHUULuI0Oeg4RmSqClfzEUc1/7JiOGT3OujZGD/v19pIWJVHEmgL1
 pJUkHTAKzCH8AwiWq1AvSpatn0byLAqQjONEBVeNrUdhjjj2cFP5GuZvlFKn2mOTQfaQ
 TqFuAyhyCOHSGMY1gqfpXYUfac/MFoGG0fxyt695hK9U4EMlKCSWISzNFKwlSdEGTcew
 UcoevtD+r84ivq35eAFCr6gkAFtutN7l35un6EC/U3pm6IKpXyj5cvHqM80fQFm1F67H
 ihrA==
X-Gm-Message-State: AOJu0YyVumcpvkxSL5DKmpnJzCljxuiDGNataTa0TWboIht85YbPe+gA
 oZCikZHmUhTI1ef7I0Cv6UucSWMkafu9sDwNM8YfPuMYVbjLqPUcVH+8+rZ/yw==
X-Gm-Gg: ASbGnctnoTbmRtcokxQLnOR5HmQbF23pLoiiIcFQx8+j2AvYCaw60YNu9pD8Nzuye1r
 dGxNM3a+n+fUrvC15Ja2uOgbRsz4JVBCb9dZPbCinDE/lno6n6tLlP5Z7y2pBuXm+yO3IFsHtjW
 WW4ScvnGnFiuIDY/BAFMPTyIAnV3Hw6Es/D0Tssq91c04RigCn1QRn0rvKOyBMOJvQMkp7x0TEF
 +66EZjt/au673jn5C16Xvi39kBI6l8xp4Qf8Bh6SbMYWFBr/GJN0lSli2FG42W4tJkSeL0YQtiK
 aFjewbbp9Knwin4R+npVYC4VXRPatjlquO7b2V2iB/S9QLOxt8GwMu9gEDZqLzFIOrNlBWEyv1j
 sScKDGXpa4yO5mePv0WfPDX2K0gAnO39Y/AcByKrWqF39heA=
X-Google-Smtp-Source: AGHT+IFylfuJIINWM9xrBguyaZ7a9UU0ZYfQSqf5wcMt6vDXvKOENdHcoet8/QQ0fn85GpU3kLPecA==
X-Received: by 2002:a05:6a20:7d9f:b0:23f:fb07:43db with SMTP id
 adf61e73a8af0-24340d0235bmr26512565637.33.1756250291986; 
 Tue, 26 Aug 2025 16:18:11 -0700 (PDT)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3275cd4e583sm701541a91.11.2025.08.26.16.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 16:18:11 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Aug 2025 01:17:42 +0200
Message-ID: <20250826231742.220244-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756250292; x=1756855092; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oadEww3lnc3Gp9y4xV5hecmdtPoC0TY0kp4vpw1hTLE=;
 b=iMYNpoeNOS9zIc3ddHA3AeJ3RufizCXQJOShmUF14T/Q3Yk4xGuDc7x8GOj2xOBdOU
 R7sYIsr3iZNYE35vdz9BQ3jhP0Mm48J4YtjoeG2kZ6x1OeJhV+d5L4V1PaFRFq2Y8LHX
 FOEH44poGOrLFtTLrU+ocTMDf8ACAOMdV7HLtzbnIMq7w9Ttia186a6eY650/ZszNVm5
 CIiD8fL6nm/fiHIDw2OKTZ/7fF9elo12cfrT//wx4lSVmZbzEePPi1FSCaE5lOYDYOfC
 nvHOCgWiLK4LYzH5rspo55cpUu1EL+bvu6lx7w+Yv1NSKg7NkkRVgUcB2FAnD3uNBxP6
 x5gg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iMYNpoeN
Subject: [Buildroot] [PATCH 1/1] package/libnftnl: bump version to 1.3.0
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
Cc: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/libnftnl/libnftnl.hash | 5 +++--
 package/libnftnl/libnftnl.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
index bd29e76bc3..1182d31fee 100644
--- a/package/libnftnl/libnftnl.hash
+++ b/package/libnftnl/libnftnl.hash
@@ -1,8 +1,9 @@
 # From http://www.netfilter.org/projects/libnftnl/downloads.html
 # Checked pgp signature:
-# https://www.netfilter.org/projects/libnftnl/files/libnftnl-1.2.7.tar.xz.sig
+# https://www.netfilter.org/projects/libnftnl/files/libnftnl-1.3.0.tar.xz.sig
 # with key:
 # https://www.netfilter.org/files/coreteam-gpg-key-0xD55D978A8A1420E4.txt
-sha256  9122774f968093d5c0bacddd67de480f31fa4073405a7fc058a34b0f387aecb3  libnftnl-1.2.7.tar.xz
+# https://www.netfilter.org/projects/libnftnl/files/libnftnl-1.3.0.tar.xz.sha256sum
+sha256  0f4be47a8bb8b77a350ee58cbd4b5fae6260ad486a527706ab15cfe1dd55a3c4  libnftnl-1.3.0.tar.xz
 # Locally computed:
 sha256  98193898c663001eff2fdcfb676e210c13042bc1a05e8d570c363efa396f8e24  COPYING
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index 65a1431e94..26f112c504 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.2.7
+LIBNFTNL_VERSION = 1.3.0
 LIBNFTNL_SITE = https://netfilter.org/projects/libnftnl/files
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.xz
 LIBNFTNL_LICENSE = GPL-2.0+
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
