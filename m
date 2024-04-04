Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03AE4CD1284
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 12:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C30B041B36;
	Thu,  4 Apr 2024 12:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PnGSHwB8lVgl; Thu,  4 Apr 2024 12:45:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BB8441A85
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BB8441A85;
	Thu,  4 Apr 2024 12:45:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 126371BF98E
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 12:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F40EA822C3
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 12:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6mEhNo_yYsD for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 12:44:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0CEAE82311
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CEAE82311
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CEAE82311
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 12:44:56 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3436b096690so1588073f8f.1
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 05:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712234695; x=1712839495;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LF8bTtJWvToL8qbdb5HB/Onvhz1yU262H5M2GBH0+2Q=;
 b=eJitUgH1Eum4Ix9DiZPhnXMvi2RL49xd1sV1pje6G3zBfi2AdFO+X0WKu9jNkYwHgz
 sIQfsmgODdSL4tItYuL5N6vWXFHHnSl/kuWf/Dpv7lLWadFaFgwzq4g93ng6igaZlHfE
 4Tw01IO2gYvaBBJCzoUNgj7/sjwNPCIBtYE8azCB3qX0liBHMsCsB79r6O083Yv8e81S
 k4Fh2QUrcfqs7U8vTbw7eITCXOqbsU19Ke7z1oNrwKq3yboEZipRlhyajt2shus7r4XV
 iv5ArO+TW0wMepUIfDvFDSJqRABNix9xA1v4N5UHJZgTXn0+MrHOoEXVC0V3Zg9rzDt/
 4ySg==
X-Gm-Message-State: AOJu0YyVdIk6HkkJW4ex3HZgWDN62IC7w1tJNWLShBoXAWb/ZbmAYpTt
 OIXaw/ooeHG74yj346EFv5JxNDUPCzSyGYob9xyDbdTYn6Ye4NZm2l1CyJpRz2EZIhYd/QFNb5Y
 K
X-Google-Smtp-Source: AGHT+IEFRSvImpwLMVcBTE6zSLbnCJxcWtnynf4MrlSvCZHw4qAplVM/u11NKGD/x9B6+D2kf4eTlA==
X-Received: by 2002:adf:a4d4:0:b0:343:c997:35f3 with SMTP id
 h20-20020adfa4d4000000b00343c99735f3mr1100379wrb.21.1712234694793; 
 Thu, 04 Apr 2024 05:44:54 -0700 (PDT)
Received: from localhost.localdomain ([79.132.235.33])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a056000014500b00341dc343e21sm19913663wrx.65.2024.04.04.05.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 05:44:54 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Thu,  4 Apr 2024 14:43:29 +0200
Message-ID: <20240404124329.768546-6-thomas.perale@mind.be>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240404124329.768546-1-thomas.perale@mind.be>
References: <20240404124329.768546-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1712234695; x=1712839495; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LF8bTtJWvToL8qbdb5HB/Onvhz1yU262H5M2GBH0+2Q=;
 b=Pts/oxth0JPKwYL1QHuNyeTlF17TcIxNL7JmUCmrpnmJczZ6ALL8VVYxyEUht1fKnq
 LCvnZbaZoICJ/nTmWpja4qbBSnA32/xJ4MycWx6DD0XvE0UlPTVRNows8cd+J5RsrF5D
 XggYYzhIjzWOpbVtPSEyZtwU4XO0Yhme0ppUHygzgAk3cZ0IfL6QSCqWgqRZmb/IE9xS
 mliTX/O2d28MU9IgIBfbHe8I9r1g64WPzOB4AVHYt/Or7N4nsxeTPNrDn/gwRaIWwnur
 OOTPi7RJxWub0hEEP4KcIS6THJaIPa4m3CZIMCv8nuH6skHJfviDNoVULvk+dvg6gJ3h
 LV4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=Pts/oxth
Subject: [Buildroot] [RFC PATCH 5/5] Makefile: add command to generate SBOM
 in CycloneDX format
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@essensium.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds a new command to generate a JSON SBOM in the CycloneDX
format based on the packages selected in the dot config.

Usage:

  make cyclonedx

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Makefile | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Makefile b/Makefile
index 91973cca60..43344673c0 100644
--- a/Makefile
+++ b/Makefile
@@ -155,6 +155,8 @@ MAKEOVERRIDES :=

 # Include some helper macros and variables
 include support/misc/utils.mk
+# Include CycloneDX SBOM support
+include support/misc/cyclonedx.mk

 # Set variables related to in-tree or out-of-tree build.
 # Here, both $(O) and $(CURDIR) are absolute canonical paths.
@@ -924,6 +926,16 @@ show-info:
 		) \
 	)

+.PHONY: cyclonedx
+cyclonedx:
+	@:
+	$(info $(call cyclonedx-json, \
+			$(sort $(foreach p,$(PACKAGES) $(TARGETS_ROOTFS), \
+				$(p) $($(call UPPERCASE,$(p))_FINAL_RECURSIVE_DEPENDENCIES)) \
+			) \
+		) \
+	)
+
 .PHONY: pkg-stats
 pkg-stats:
 	@cd "$(CONFIG_DIR)" ; \
@@ -1185,6 +1197,7 @@ help:
 	@echo '  source                 - download all sources needed for offline-build'
 	@echo '  external-deps          - list external packages used'
 	@echo '  legal-info             - generate info about license compliance'
+	@echo '  cyclonedx              - generate info about packages, as a CycloneDX formatted json blurb'
 	@echo '  show-info              - generate info about packages, as a JSON blurb'
 	@echo '  pkg-stats              - generate info about packages as JSON and HTML'
 	@echo '  printvars              - dump internal variables selected with VARS=...'
--
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
