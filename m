Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0821EF43680
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 08:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F214E60D76;
	Fri, 17 Apr 2026 08:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UY1zn_-OtxLL; Fri, 17 Apr 2026 08:59:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0120A60D74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776416387;
	bh=cdrplLdDAo7uDd8VlP3C6nyyBW3RG10rjX6qs+w7PS8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EKVakndMo0L1Q4vLY+tmx/qACY66PX1sRRoTe1D9MRhrzzdUoM8euiTtfNAx84h1h
	 pkJiS3NIoiHSEo7Vh0mPHAUO+Sti8WftN9el5Z8IQmYoy8I8N4TSQplqOiuotmcQj8
	 HUDLfu/j3iLYJkSuHGmhvMEkLVWXeP6vAeKp4eUjzwhyUctkJF53V+K+Hc1l4+ixwv
	 X8d8JZbW939wR3KPVJ7fhMqUVqQoGPtXa8kANkPQ+wjBhr1/rmsttwiUYEkITREzLE
	 2JYhqDwiYS0ST+nsseu1UN4lJJHttjKUmd8LFv7E9Tcf1/HKPqtEJANIHlsrrVEQVQ
	 RvLJBYDX8jNAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0120A60D74;
	Fri, 17 Apr 2026 08:59:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B777259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CF8740578
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qluYcLo00k0y for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 08:59:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3CEB140015
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CEB140015
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CEB140015
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:43 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-488b0046078so4044315e9.1
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 01:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776416381; x=1777021181;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0EEiKVA6/aZAZcdoDPaQYF4/U5Djhp0WEn2mAfoBZxM=;
 b=RAdN/4kOEPCPCsEi4FpZeMU0EIydujRaYl2FG0gzgdWkX6Wgdh6r8T6CPjvyuP2Dpc
 CRff7LSEle0CpkbFR1lxkNKdcBwNWQ6D71qnv3F1D/MPCxSTB7zA/mOt/4yNGtVWvP/1
 wZIEqNVNwBPHCg/FS/4CZlR8BRRzKushF+dp+sEXYt2G+5HYVdpqKKWk2uTW9wg9L7Qa
 T3ytsOGBRCaCjJWYDAmJYrezpahK2Lit2WsGSYdbAa/QPfizn75IDaJ6HNnPA33MBh42
 b0TARkvJTLhqDCo+3HZ2EE0UUAB4JJ8q4/YaIhr7Lb/jzsfRMy1SHTVuFUbhUEaKjQDI
 ncyg==
X-Gm-Message-State: AOJu0YwFwPDg4QQEVi51EM5SwNQCwFmFQAkffki0N0Y4NrqCNS+zzosW
 rJl3pxi0pP2ZPCeIa+B7ehOV/1UMK/+aCnlv5aXhl8M2db/Rh+8QvJQS8vhgVleSsQ93QhBIpC6
 ubUW/SxY=
X-Gm-Gg: AeBDiet9zfZuQrXXvv/jvbhEjUss1AvSbSbIsuVRUfEMJLAOQY6NMZztDtQS1SpczHQ
 /fBUPw3WIoxmCawV6S0eSJAwiv77/v/cSF16aihOV1eEh1WqHYZP/RzI4ryXOFNGdcF9pb9ttql
 n5HwgGkwN3dnhSrNyOEaMexhKcZlDdDi/k8BGm4Ip7RSp/SEao/wBqzHd7ES2ThW6/xDYJCkw1w
 Cr/oi91hyhdlFWa1WAUVdS+croBhU6WTVzAsLD2F1ezNxPdHwC9GGGXYNR065ADenk/WOy7H+hD
 3GHIXST/HoJR8m4iRn+2KK46ENeHEslyq8iu40Tl+0Ibi7aSkaqCl/Tup92kXudfjmfkEZMI/2R
 lbuT//3VCa12hWTXErgMaTsbonSndpKqNz3NUqd3D1IkTR0jF+0DQeaRuAQjm+3+DVkTpbib4cC
 lvOJYRv2KXLSBD9E8LXPD/kxIEnXqQtMXu1BypPk7aLv5+kt6So695/6aoMucd5yWdDiJ+/rwT8
 eh1WJGwrL3tPVLTs+OXDqFympqIok0=
X-Received: by 2002:a05:600c:a00f:b0:486:fe83:8621 with SMTP id
 5b1f17b1804b1-488fb788924mr28574875e9.23.1776416380703; 
 Fri, 17 Apr 2026 01:59:40 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a0745sm15077795e9.9.2026.04.17.01.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 01:59:40 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri, 17 Apr 2026 10:59:16 +0200
Message-ID: <20260417085936.200528-2-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417085936.200528-1-dowan.gullient@smile.fr>
References: <20260417085936.200528-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776416381; x=1777021181; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0EEiKVA6/aZAZcdoDPaQYF4/U5Djhp0WEn2mAfoBZxM=;
 b=wvswIaaag+04WerJGzwSItna2Ylw26rrDxm2MUxHq/d1TgVWWxAZZQU4V4iGVyuYBb
 TJc8k//cHpeIlOKjPjMatx22Xfg8B0qDbHT9TdjLFNQTdlQGeNoWBAsD1UW1jabrTGoD
 vJm0NEyk8BpVwqyT+BT6sPKud/BHcmYW4mn2M=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=wvswIaaa
Subject: [Buildroot] [PATCH v1 01/21] Revert "package/python-setuptools:
 bump to version 82.0.0"
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit 51365ff06379aaf6fcc9a751e8ff32ac694f3e92 as suggested inthe patch review :
https://patchwork.ozlabs.org/project/buildroot/patch/20260314140633.2967249-66-bernd@kuhls.net/

Indeed, the new version of setuptools (82.0.0) removed pack_ressources and causes build failures
for packages and tests that depend on setuptools.

This serie will update kernel versions of the testsuite, so to test them, a revert is needed.

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 0236a13999..d0ed270e9c 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools/json
-md5  6e65b88d2466b35e86e5187b99502b1c  setuptools-82.0.0.tar.gz
-sha256  22e0a2d69474c6ae4feb01951cb69d515ed23728cf96d05513d36e42b62b37cb  setuptools-82.0.0.tar.gz
+md5  82e1d67883b713f9493659b50d13b436  setuptools-80.9.0.tar.gz
+sha256  f36b47402ecde768dbfafc46e8e4207b4360c654f1f3bb84475f0a28628fb19c  setuptools-80.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 3c94931fbe..e013000c57 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 82.0.0
+PYTHON_SETUPTOOLS_VERSION = 80.9.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/82/f3/748f4d6f65d1756b9ae577f329c951cda23fb900e4de9f70900ced962085
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/18/5d/3bf57dcd21979b887f014ea83c24ae194cfcd12b9e0fda66b957c69d1fca
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
