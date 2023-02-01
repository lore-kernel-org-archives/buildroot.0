Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CDFC38142
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 09:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35DB5403F5;
	Wed,  1 Feb 2023 09:02:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35DB5403F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7_APU1x-qSUu; Wed,  1 Feb 2023 09:02:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24271403CA;
	Wed,  1 Feb 2023 09:02:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24271403CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24F061BF2F2
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 09:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF09E813D5
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 09:02:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF09E813D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Anr1b9owT8MW for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 09:02:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 831C0813C4
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 831C0813C4
 for <buildroot@busybox.net>; Wed,  1 Feb 2023 09:02:45 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id bg26so6256454wmb.0
 for <buildroot@busybox.net>; Wed, 01 Feb 2023 01:02:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aFowBkq5vDDd6JSqMVBMuYCt4XcPOuXubkVm6fxakPQ=;
 b=tniGBq4ZAbI+6y4UrwxroQZvNCiZiAcxl2Y69mhGlAgq+61+OPI79RyHqe6RiebBUy
 loq2QgmZUUJZ0OsJVU8cZ6FQMnlLjhO3W945QHwQ44HgZ3nAeiK8MS0Nj4RF2OS9+Wag
 6wQ9zFHP+Zhe2U7ln1VNWSIS6n0itHWY2DIuwReUZ+VGGVX2T2lG3AWa4mqAPSdCITSc
 S7JQcOiFZJDSb5irRkQB/lo1gnh4x//1qGBFc5lfgzeNi3mRMrV98qgdlK/usquYmm7e
 3/gUNxKLmJSSivCpseBEcHKs8pf6+dwHqMJDALnOi9FhTuEVXP1xA/kXL7DhPQQLLXmV
 xaAQ==
X-Gm-Message-State: AO0yUKVpPXSHN5/Zi+rD3UTirwXG6oGKIjW0Kz9IHJelknEJdIMwvwvt
 MhxOuAxg+u5Gg9PkahCReDv1HGqZ9Ww=
X-Google-Smtp-Source: AK7set/FIDqTghPHLIJCLFGV7G5UVqOJma082vdIKU+QDY+D7V8J7XBDGlgaQpmrQNL7/xc3UuAjFA==
X-Received: by 2002:a05:600c:1d1b:b0:3dd:1ba9:d2d1 with SMTP id
 l27-20020a05600c1d1b00b003dd1ba9d2d1mr6781105wms.21.1675242163707; 
 Wed, 01 Feb 2023 01:02:43 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a05600c4e5200b003dc1f466a25sm1127695wmq.25.2023.02.01.01.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 01:02:43 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  1 Feb 2023 10:02:24 +0100
Message-Id: <20230201090224.17033-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aFowBkq5vDDd6JSqMVBMuYCt4XcPOuXubkVm6fxakPQ=;
 b=TH1hC1OqsAvEU3dmug+H3V2QAGGUsQeGIArepHGQygrkIQ2+Pung1G4bRy7WBifNQt
 ivG12iKEzsnTFgCeH9OFf/vm8Tb1eEK6ijKICMj4Z9fSE5wYPS51hIawZQCoFKQ30wUg
 SJxOsxvUkdO2ol/878TMT5YgT6NbHkFrzq6Q5M+sBptgmYPpWqHftd81KNNjPDTLmAtQ
 YQHQM6UozctzyBLuGrr20vOLKxhFdg8NjG1VFpe/zBXH+uuzIIfZDd1Satcemgn6ePKj
 Ez2uXm4G439M7BtCtD/CEhv9V5cd7JunhVek9x70Is+pK0r3UgXCctBrFQ4VTADhpiPP
 3YNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TH1hC1Oq
Subject: [Buildroot] [PATCH] package/luaposix: bump to version 36.1
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
 package/luaposix/luaposix.hash | 2 +-
 package/luaposix/luaposix.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luaposix/luaposix.hash b/package/luaposix/luaposix.hash
index fc0b5fa74..2d54a6901 100644
--- a/package/luaposix/luaposix.hash
+++ b/package/luaposix/luaposix.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e0fcb4996f76aa49ae3e5edf69978171091e3d69d5de5589d591d227f8a427c1  luaposix-36.0.tar.gz
+sha256  7944c2b4fbcef0667d407302740d87645325e751fd8d819f2b253c5d9ad0d497  luaposix-36.1.tar.gz
 sha256  ea0fdaae50b0d31a81c2c99f4354264783c71043fd40522feaa40eecc069599b  LICENSE
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index 1a537defc..d17c8188b 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAPOSIX_VERSION = 36.0
+LUAPOSIX_VERSION = 36.1
 LUAPOSIX_SITE = $(call github,luaposix,luaposix,v$(LUAPOSIX_VERSION))
 LUAPOSIX_LICENSE = MIT
 LUAPOSIX_LICENSE_FILES = LICENSE
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
