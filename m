Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E80E6B25B
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 21:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBDD060E5E;
	Mon, 22 Dec 2025 21:57:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1VbQevgby3Ls; Mon, 22 Dec 2025 21:56:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DA5160B25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766440619;
	bh=y15UskXAP0HCc3fKe/1w1BiMracY/PO2mJWV+Wcl2Wo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M0SACfcFV5rmQo9wQx5wyY/3WZ73SLQtwEEpZMIUJHLT6qiEi5wS3Za8VSDrmJa2b
	 WIacsS+xtHeqv+kXLZ+5JWXNIiQUOvZkiTggEmoZROFz2GsCzT5+P+OK9xr+VmuBzH
	 FmgvqTKGXgacKUQIXSOH/yundTCJ17V3qasdzx82l+SIRRjfI9UN7XknVecG/3os0R
	 rEm/ltnuNN9oRdXgNDBUeg3gvIwSiqvugCw4Xl6eBnCbg2FmkLL1N78zkGXbb7cKnc
	 e4t0mt5vTFqcRtEf70XIUrwkOAFyeE+efERWt133Wcp461u3CF62Lb8GBytUcmf/ck
	 TyY/QMF+L5jvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DA5160B25;
	Mon, 22 Dec 2025 21:56:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 799ED25A
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77A1C4049B
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gg2EdxhvIwm7 for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 21:56:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 572914049A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 572914049A
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 572914049A
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:56:55 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47bdbc90dcaso29267725e9.1
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 13:56:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766440613; x=1767045413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H0oE6JGrGj1XMBDcjkulpkucxQs3uk1Ut7pENw1QS6s=;
 b=EATLShmvKtw/cPQP9N9AqdeZOtEcq0rqjeM7pAa/CAWoxPGn3o+lzrD3Q8D6OPrc0o
 Lx0SxcrGkKdQ3RtwX0/KSN+BGzwVaRT2dXwlUTx/tyfZu3aUhVuy/7fEj3lcNl4alOTx
 qJHdOLXyfUHoGssVr0hnaS2alqx5wI2gRB0CYIFQqSM7RmEy4Hlz2nuoAuI2tw5/9JUx
 A52fP5dvDp/Me+hf/+2CyuaLofEH4HEQ+S4vx7+hY61h1lfGZAFhQCCjbQEwgkfmTi7V
 2+I96DWZ8CF7IlH13FdMbm18xb+fcuEIpxGfDdqyHQGp6frCzguxW/4Eguug0fkf9g2e
 xcvw==
X-Gm-Message-State: AOJu0Yzzlh+dCLWuAArwisrTitgXSsV4Xccrp4q/0y+m4iR9scuJ9qc6
 u7IOPYZQXus/cbPMB5jrWht3FBcLH8tJhSu+oUSgrh7MK6UjUeTbau79CZEN+Q==
X-Gm-Gg: AY/fxX78eMIHwbVibZlFeVb5ztviOHmoRjb3eN8uqamwwMFEyg3pL7S8sBnxkriSv3v
 g2u2+gRvRKvbFn6LOQjXwgP1hyPRN339C9HVub95GmeAjaQIzblKhFl8YCyinWJnP+uX21r0suq
 uFbTa76Yyodkv6EQp1UWLdVeH+aEv8BHP8VkbQytTaZ46k7CXKTeByTkJGYGaS9GVH/j3lhsJZg
 WXFgLdbjP9FgJoTSSkGRTwDtSd69Mk/kcnQbUHqiDjxGPGOOkvQH/G7yZRVeULoN2j9kyMbm6Rk
 wbWhZ/0NmFT+zHFpMngGuwI7Z4OvZ7khHQOv+FlsehI0Esz/cFd/BMI19h5/NO8DJZjsc0TqLEk
 n/x3MyttxDTLq9vG4VO8jXTfZvbrz1ob/rUTyO88V6INx1uiVWYocwdEOBIHiFT4czlhkL5wzjK
 W/ieI=
X-Google-Smtp-Source: AGHT+IEXqpRD7OAZ4H96Jw2veCHrwdCv1e61CBTjUftzMMoBcUgWfvQICGAeHinXXwmQbs6QIdZWXg==
X-Received: by 2002:a05:600c:34d4:b0:477:afc5:fb02 with SMTP id
 5b1f17b1804b1-47d19576cf0mr128968635e9.21.1766440613279; 
 Mon, 22 Dec 2025 13:56:53 -0800 (PST)
Received: from freepad.. ([2a01:e0a:6f:bdf0:2fd5:723d:8ba0:877c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193522cdsm201207645e9.4.2025.12.22.13.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 13:56:52 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	vjardin@free.fr,
	Maxime Leroy <maxime@leroys.fr>
Date: Mon, 22 Dec 2025 22:56:34 +0100
Message-ID: <20251222215636.975668-6-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251222215636.975668-1-maxime@leroys.fr>
References: <20251222215636.975668-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766440613; x=1767045413; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H0oE6JGrGj1XMBDcjkulpkucxQs3uk1Ut7pENw1QS6s=;
 b=dUQ7vDj8QWHkhorHGf061/k2d7rGKmfZ6q2uLDuBKIBmZay7rVGQuNNdDOvImEwWr7
 Bf6DV+lvZ/PdHUdkEr82QTs6iKDDiIhH1fg+34puhtTD6MDAmhdI8CsGe68xvPtBGDF1
 CdXPm3EcJl6z8Wgu0MxNyBwLFgvmNkjW2ZinqF99YnJRKLMZsIcYCDv30jwXSXNMhfk4
 PaMI+DnTeZXP5hE84/60ICMI0rfVaRGys/Ail9+7t9cLz7+v5mxylath5CjYc/BSSPF4
 JgESAQSvkcSnSkfQcEg9eSqc+NBbuEkxM0aw2VWSdicOO8o8OA3hq6pQa2jra1WDO2Nt
 DdHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dUQ7vDj8
Subject: [Buildroot] [PATCH 5/7] package/grout: bump to 0.14.3 version
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release note of the new versions:
https://github.com/DPDK/grout/releases/tag/v0.14.3

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/grout/grout.hash | 2 +-
 package/grout/grout.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/grout/grout.hash b/package/grout/grout.hash
index 8c4a84cfe6..bf3d6b87ec 100644
--- a/package/grout/grout.hash
+++ b/package/grout/grout.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  9b8ccf87c4d003dde276f904616f8ca61e4618cbedfd2d6e02fd39781713757c  grout-0.14.2.tar.gz
+sha256  4ccceea87ead25dfbee7d44d25283abc61173caf6bae08c9644fa9a6cb6b9ade  grout-0.14.3.tar.gz
 sha256  1e412aae8da58b718c78b3d7a52eb547004384d4347e4746a22ca6af7522930c  licenses/BSD-3-clause.txt
diff --git a/package/grout/grout.mk b/package/grout/grout.mk
index 7b0fbac4cf..39bdc7f824 100644
--- a/package/grout/grout.mk
+++ b/package/grout/grout.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GROUT_VERSION = 0.14.2
+GROUT_VERSION = 0.14.3
 GROUT_SITE = $(call github,DPDK,grout,v$(GROUT_VERSION))
 GROUT_LICENSE = BSD-3-Clause
 GROUT_LICENSE_FILES = licenses/BSD-3-clause.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
