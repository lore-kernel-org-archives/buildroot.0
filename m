Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2326C83F1A
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 20:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A63D361492;
	Mon, 14 Jul 2025 20:26:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YDqcGpW0T-oQ; Mon, 14 Jul 2025 20:26:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0EE961487
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0EE961487;
	Mon, 14 Jul 2025 20:26:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C746DF
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F27544037A;
 Mon, 14 Jul 2025 20:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FeOapfMStyID; Mon, 14 Jul 2025 20:26:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5B9CC40287
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B9CC40287
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B9CC40287
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:19 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a6e8b1fa37so3828290f8f.2
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752524777; x=1753129577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bULBgNbFL/WueJL7KuX2GDCWeh9/Faylh+nXxOSnD4o=;
 b=ct5lB+MfNOAlR+qIUP+6vyNcj2FBBgGmwMRDecX3tramLPgloMVvK9ykeer3EdhHqj
 M87OqZ97a1GCdwrm9MOt1aiQeBJ4bvfk3Y3tCM9WvMxOxBZTSZEMO1YvtO/SWyQz/pED
 e5NiVFFIXpninqLlt7LM7jhi9i/zA8VgHLUFOe5Sxn+EHmCwstsvBjeAka7cVqSU7emm
 BxOhPWMMNATrEgVK7K+6X/yWuTIkdsuF880RW3yFdmHxmfJxQTyxm8MklmBOEfuRzVN0
 gPVYc6czx9AwJaTWPfVM9PBfhrJmDPnQ435ADUX08KT8xueuZIDHovPYzlJ5YIlbFlYL
 EWQw==
X-Gm-Message-State: AOJu0YwsTKelikt3MJqhoVyw36dE4ZQxbGccqWwQeMHeVuI75VpVcOpe
 IrbBBdCUaYC5fJxOMCRt73eaAUsdIkSGc2QdMUrb/7Li8vcR4VCT5SmMmcv3ww==
X-Gm-Gg: ASbGncvOwB2EqitV0bq7jPL3NGVxTYNoBTkjW1BrE9d6kwk9ehM9hiTXn6cP5Nkx0vK
 Rsnd+MIwIS9l355SeYUltg5iaQ8aAr9Ny6zuQhsc5sfp0HLyMy1Yne62wNB1X0UZYVBXUWqVjRX
 inPok2rp0GattB0rum+zXI9MbehntDIS5eSCurdcC384EYGGeI5FUugW6tCR0Rg/miL890bcuGR
 76famuY5gaTxwxYbT+UPRf4FSfhAH1CqjDiZaS/TyrpHyQcLc+UiRv+eiVshNomNWTimWgJnaNB
 BDB8HpggWM9z9Rv81amMGzraQaLLGj4ASKmUJm55S281xn4iLQgwkeTReMCtRHqTep95Wmy5OLX
 Hj8VweNucOD0VA+0I9vL039z/mFzx6k+U
X-Google-Smtp-Source: AGHT+IHBmg0IGNQFor77mtYi+Y17hAvcMjpdfYmcIzbYVCbVqMPbnccxAgFKcYaLwgc539G/SSsMhA==
X-Received: by 2002:a05:6000:440f:b0:3a5:2f23:3789 with SMTP id
 ffacd0b85a97d-3b5f188debamr8509383f8f.15.1752524777251; 
 Mon, 14 Jul 2025 13:26:17 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc91e3sm13144838f8f.43.2025.07.14.13.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 13:26:16 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Date: Mon, 14 Jul 2025 22:26:06 +0200
Message-ID: <6276393526cccdfa71abed779578b1229665c777.1752524763.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752524763.git.yann.morin.1998@free.fr>
References: <cover.1752524763.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752524777; x=1753129577; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bULBgNbFL/WueJL7KuX2GDCWeh9/Faylh+nXxOSnD4o=;
 b=nWbgRHrdfvZLBE8PRy4/4tZE8nPA5RD3VZjlcsqwVhiLo7dDC7siyc/TUbrWqCsjfH
 7qTrMDBMFuxaJtUslTN+2YO9quKG4ikqE7sXx0v1voEif3O1bx7KOC8X5b6ZhFOU86iH
 LDKY71XqLyX5IMgcmfsrmSS7Il6QybnUalvTC8K6AoDHC+FkgRfdWAxUgPMx91PCmxQe
 mC6q2LHRrPo2aBbPp9ssUXihsTx9DEp54DxkC/vIrzA/GrGQXX3kPUC5LITAAEsDFQAM
 /l9RNGV0ombP1W8rex6rn9Z1DdwPeMCRr9XWNVYNpIMoisikVxUPkb8q3mtOpSJ6Xj+E
 2ShQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nWbgRHrd
Subject: [Buildroot] [PATCH 12/13] package/runc: bump to version 1.3.0
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Christian Stewart <christian@aperture.us>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index d25d8facfd..76857afb31 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9785c144c97974b52b6091b7a79168b73681ff574bc8438b44f3f5f8c112f171  runc-1.2.4-go2.tar.gz
+sha256  3262492ce42bea0919ee1a2d000b6f303fd14877295bc38d094876b55fdd448b  runc-1.3.0-go2.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 51ac32de26..bdff619751 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.2.4
+RUNC_VERSION = 1.3.0
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
 RUNC_LICENSE_FILES = LICENSE
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
