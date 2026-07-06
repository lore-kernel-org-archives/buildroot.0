Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2C7C44500
	for <buildroot@archiver.kernel.org>; Mon,  6 Jul 2026 10:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5725340A94;
	Mon,  6 Jul 2026 10:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S7k4dXNs5nMy; Mon,  6 Jul 2026 10:03:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3267540A80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783332189;
	bh=dl5Tp/U+DwUTy1U0V8Ee1JqEKZT1EmQeK7C/Qama9ho=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=mqchCItYYC3/QIxgkXqdo2jyMgWLc6u48qKB03Kp18ctQWmnqnYOM5CVmtwaZuFwm
	 dvZn5BVmUe2v2MBB5XbuOCFt8+byp3HwEYEsvnveX91LkP0mTyncQKtHSyIMwiNocf
	 WSEbdVac4sVxF6Bsh3/KN67zDvQVhwo0xo4Bb+RKk9CL5Eb4ToyUe5S1P8W2AznaQ/
	 hGTmVsR0Q8E2nD2PULlPSDYXRVPF7u1qlEBvVBEGC0jvOXYGGbIsqp51ejrIIJPayR
	 IQqMPXUWaoyO9n6qVvXQDrk3r7AlzHkeb7AdVHhhxUvC/3LzaEqnNSCrsByMHd2HPq
	 PMXOtgnniPXjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3267540A80;
	Mon,  6 Jul 2026 10:03:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FAF6316
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 10:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0680A40A87
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 10:03:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZPVqlNc_uJkF for <buildroot@buildroot.org>;
 Mon,  6 Jul 2026 10:03:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 98A7640A7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98A7640A7D
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98A7640A7D
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 10:03:05 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-493b27c7451so34499415e9.0
 for <buildroot@buildroot.org>; Mon, 06 Jul 2026 03:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783332184; x=1783936984;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=j/nUSAkqwEqA39eD3Y0OC8pfgXFbsHBc/8ju8YM+wCQ=;
 b=FGN56tXThm45Wfgh8+2w0T/3WFZ1bJnBI0niAmJztd6WV5G/0rCyfsgmcoEWsQLesB
 2wPZLKuG2lQC1hSq+i8G3oBrnjZB+yhNUAXjVsinrp1A8YjoL9S1iZsNELp+PYo/qW4z
 VeHjAjTk4Xmt9wGdHXPw4a4klBzeN8el8m5HTrehqA2wZbeY6S9WgH/rpQaYRdOOHZ0x
 KaVigM2fS/YCDZ5a9/7HeuSkKMcJ8T4F6XkwBd8BrSV6dsPAj82n8to/im/HApsGqdVw
 RRHrsvNiq0u0ObC9dSmdCoaoF275eCUlguncdWsMpge75yfOoM7KLh79Z3BXW/P4PXAx
 axyg==
X-Gm-Message-State: AOJu0Yy2+JD8cvmteFR0HuWdrQyNye87FdIhllnhoRLMk4d6I3P9qMBZ
 ZP7cWNpup1U3wAYOorvZxktU9Dbn9YJCeLwyqSwCO/mLtizZx3sSjzC0OO6NURa/c9+JCnsBCTd
 +q+9fSgI=
X-Gm-Gg: AfdE7cnJy+zlNu0i/sCx7jnSlvaFyN4xB0TBT/YI8A1ZfNVWyDpPSzeXnAGuE9DdOyg
 Aqc5ICsqY0tGP5wH8EVsPUamw8cwCwfAEzQFXsipjfx8hSM0jiWTir3rmO1Mv6Lw/ToXNzLf6zj
 8XnrKuF+EjlcIFZODLKUN7muWbxBOFRjmiN+toFAyw+LU2rcFI+i6AxxfNjMB9SfKUkeHSTVvYb
 xO3Ed28n40jD7GdQ06NmwXv/WK1NAF73qEYPEB5UadrCpKh3vdd7MgkdxnIepMNSILmjAzpbgNf
 dc3acHgb+uGsSU9rIvC6nYcwPXQbqwNWixfoSVuxTLAWRaaa1zuUcQ7Bo2MM+P18HnO9f8ByZGw
 dTeTpYStaXfvsPGYbWVeoBbXsFggVMXVtXB4yioooQCZJPDeHLzOfNwHZDpCdbVTH7Xjv41f/Ak
 BdixA/jQ==
X-Received: by 2002:a05:600c:35d0:b0:492:3fb5:3a17 with SMTP id
 5b1f17b1804b1-493d127ef66mr103572425e9.2.1783332183749; 
 Mon, 06 Jul 2026 03:03:03 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493ccdb566csm260586845e9.7.2026.07.06.03.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 03:03:02 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  6 Jul 2026 12:03:00 +0200
Message-ID: <20260706100301.60854-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706100301.60854-1-thomas.perale@mind.be>
References: <20260706100301.60854-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783332184; x=1783936984; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j/nUSAkqwEqA39eD3Y0OC8pfgXFbsHBc/8ju8YM+wCQ=;
 b=GNjY6pw41mKhkySSF4vievt5C+1/FIhQwxvMeWTYmhWNwePybvRVC+GFkO1lEPjeB5
 lm4+/tTTeRg+7jEOEIw20Qg0mIOMzkXt9yDgAWqfuRDSSYyHvLRwdqidB7KpvEtQKDBG
 vF5c/udgbXrmXltUOzPUJ4SBCKiagJWSn2grpt9l7niADdvw3MmW8+LV+vA4IQUQnHKp
 R0ZkoFquVRxHLUuaSxdxq5jHzJicM43qi2TQ4gsX0tCJJ55oZeZTVbiSwLNa4huO/pWJ
 E+uwLNrJyyHKSzrozGn4L3tmzBbw56OW9ba+y59avAHE/wlCUcMvS0ERtyRTXRxuGJvc
 Tsug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=GNjY6pw4
Subject: [Buildroot] [PATCH 2/3] package/open62541: fix CPE_ID_VERSION
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Romain Naour <romain.naour@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove the prepended 'v' coming from the git version to correctly match
with vulnerability such as [1]

[1] https://nvd.nist.gov/vuln/detail/CVE-2022-25761

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/open62541/open62541.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 0d1abf724a..8d9c5e44bf 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-OPEN62541_VERSION = v1.3.15
+OPEN62541_VERSION_UPSTREAM = 1.3.15
+OPEN62541_VERSION = v$(OPEN62541_VERSION_UPSTREAM)
 OPEN62541_SITE_METHOD = git
 OPEN62541_SITE = https://github.com/open62541/open62541.git
 OPEN62541_GIT_SUBMODULES = YES
@@ -12,6 +13,7 @@ OPEN62541_INSTALL_STAGING = YES
 OPEN62541_LICENSE = MPL-2.0
 OPEN62541_LICENSE_FILES = LICENSE
 OPEN62541_CPE_ID_VENDOR = open62541
+OPEN62541_CPE_ID_VERSION = $(OPEN62541_VERSION_UPSTREAM)
 
 # Force Release build to remove -Werror.
 # Don't use git describe to get the version number.
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
