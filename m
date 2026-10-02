Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF230CA5FE4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 20:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93DF8813AE;
	Fri,  2 Oct 2026 20:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KV27SW1hHo2K; Fri,  2 Oct 2026 20:55:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 74AE481378
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790974535;
	b=RP+XpvUGr9tAYfYnakGOuxZm0ft4IdBg17/sJMfvCY0mjGVzLNP7SiCURGHw45wHT1bm
	 SO2k/VatIVQ1PahxHFq1LcJ2UdQlDV/7PO1AyuMNgXsUHHloRDVPKTdzMW3/9OgdENfs9
	 QzxpSlfymNMURb8QjDdT/PGdIpi0mtc3HLWJvC3qT1J3J+G3UcH4sWkKGzKWwVMOzCEhQ
	 Zoi0p59ljUiQZdQY5O2MfYhlVE33SF/F1lxqJ/K/bLjGJ8pHyHdhhlEYmzd/stDVcnEpm
	 GnsYBUFuQya1p2HjUk4lvr8oG9HBzDpeNH1uN+acgTEgRMumpWqQdVCN/2pw1zWM8TQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790974535;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=fSKx3ZrkcFamSF3CGewISvcIqBPyfFc7W8MheIG0xKc=;
	b=rGkIiB8FH+r0AW8eFzJsmakag20XVczenYnOtZ1Csq7k8oH6H3jPkriNnKIz8DggErNy
	 rhr7B25Mt/sKlQs15+B3XIIVCqd9tMOWEDJKoPJqGo5M6zqzbpAdmyLt7ioJaw4jf+kdZ
	 ArvMgbgyT7LP0tEHSOpBXu310ivQ9iS3aV+vD599sDeXtXO89GfULVWnp3Yw16YZfk2QC
	 kFudXeAViFt+pCmD7ujeQ9o52/IBmZGvwM3qkiFxyfrjTW0+ybE1TwiiX3wGeQaJI+dP0
	 IU/qzOgIbupCplCCLivSgI1OA19tSS8r6Uu9h2zfji1XpU/uG9zgLaFQvfR0AkjhgeA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790974535;
	bh=fSKx3ZrkcFamSF3CGewISvcIqBPyfFc7W8MheIG0xKc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HNQ/ITt/spEl/WzxlGsRzxASSFaTyyASvdVRDBoxkgSA2CumL5Q64FAJMWCD3aUjj
	 UeplgIQ/F+sG6JbXlcJKymAENIxgFx3LM/RFeCUg5LOp70E6hV34PdVR3ZizV3/JWl
	 zkC0IN3gamDhMGzM1kT6mxYwtQVaeyy9F36ghnXWCT/dhus7bBMFAPBgA9+soCnP2M
	 r7IHEvoSHAL+4wwYfac7zTy4rM5EZyMElGIM4zvAkAq1fkifvAuM8df0LHtboLypl6
	 qIsu4FoFJAAPaoZfrqx937voD3MLjEr/2okTLAoc4gXiY7kpQ6Zo7S3aPqsVq9+3rS
	 wYvz2pWFSRjAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74AE481378;
	Fri,  2 Oct 2026 20:55:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7564034D
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6118D40E0E
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:55:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-zDF6BqyBqt for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 20:55:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5799E40E02
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::27"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790974528;
 b=IbNQxl7HP93Qv9dlARaxWFxuDc/sV0p9qLe5qTvI5HoL4EuGLJp4lOOhFgOQ8Tl5yG9y
 Ws+uzHu24tXWzg1pgc8VlRF8IyjubI+iyrrKNb9ytqnYWNGL6u9gyJt9UrE9R/bOxs20i
 ATBnw9XqkAhrUryl5Ye/YiHWMMgnKbI8N+lDhYNMDj5c3UazsJTSpNuLCeb5SyTD399hL
 3s6H3equjQHg/m8iDb5uqIqrIqC3/t2nqV7s/KzabtP5q4JJayPrZ44UJfmm9ygm6ZcVC
 OdofqxXShVU+S5gZYTfOw0r3050Fb4lmayqRXU4iEHI1Rr+KmV8f5Hleud0wFm6haYw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790974528;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=XCvwNO3TCeAJM+NdRR5179kmiM5SRPsgklbH/Mx9wN0=;
 b=puR7yJJG5VjScXCwku+vFhS6DXCZdb4H7PmOFDwBH51g4ICvFWvR2SD4O+0oTtyperSO
 ZGmg/dhEfKeznty64vdIXqE+0FkcfW675/LK+NWuiE/Txvik3x956aB4qV4teKiPCxzdL
 lOz8WDSYt9w36BJ2Uh3Yoi4jAFR+e9n03cLm8ASMf15uomAT3Qkym/KMKS4YrGjX90PIn
 bxdI/+sm0BiXFNPQMdvPUVZRPzcGWswwRM/RdsWIvnu6PRffr2GOiaAba+pI/bIJOQBzn
 i8kaiPUcWA6sHUZXRQXgf9siKKhcYaJeBQdZd0hfxIXjxK929xj0Dt6y2/weqtVdphg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PGMMUsc1; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::27"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::27; helo=mail-oo2-x27.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=PGMMUsc1
Received: from mail-oo2-x27.google.com (mail-oo2-x27.google.com
 [IPv6:2607:f8b0:4864:31::27])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5799E40E02
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:55:27 +0000 (UTC)
Received: by mail-oo2-x27.google.com with SMTP id
 006d021491bc7-6dd4abbdd97so76952eaf.1
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 13:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790974527; x=1791579327; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XCvwNO3TCeAJM+NdRR5179kmiM5SRPsgklbH/Mx9wN0=;
 b=PGMMUsc1fEnK2y7Gks4/7AOIDOoZsGkTPm6rATwLHyHrYv1GiYDsA6GAoqhWdp6jXX
 Ampgi3X7RPph07oZGXD35fgakptJ4pZ4UrUPKx1FvyeGyUTJpQTPiJcWJ/FDiIdLHCmt
 VFj9IcrnehuKNFU0pkvMOm2vwPlpt2Tgf7kmCwSQNi2Ih4GEa/dKcF6uz1YAN6Exz3fc
 yL5n5Df22WqEaj/dJBgdJhk9zJUkSNGR6YLKR0GM5QoEZujrCYQ+JV6WySMR8ZNn9hh3
 jjy2iPkKLTJQr7ymTIKs9R3biNXoD8cqU59LI3SaCoV15ShMBcoQStBCamWnNVOxftMs
 bwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790974527; x=1791579327;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=XCvwNO3TCeAJM+NdRR5179kmiM5SRPsgklbH/Mx9wN0=;
 b=1YRPu95bCQk4RXaaPip6sTOngaS8t44Ju4y8QAQDplHMBLrbpECNcWBbPzOFYSQZim
 yjclhJ2Gk1DA/iRFWnFvAnlvIxT73mHrU4LfBt5Yh9Z+XrNh5bCVG7UT3jVBIFt9cVHw
 OXL+0cIE0KXeqlj5VcTEYsQvuUuHdw4yk1x4TonblYQKd5q+ctfGDaMHUTRzwORqbZab
 GL1ZTSADS9oWvpRdUlAhvHk/SaB4fhFog9p3jl4lW1mfuNdqnUoEhw5IE4p9KeL3/OHR
 j8O+7nLOGKo1rvuWWJkFyGExjtNiMvVgBtHs+UjB9dQ2kB+5TV5gMOiit9C7lWNnvPyV
 fE5Q==
X-Gm-Message-State: AFuF++lCaKnHpNecNaRlErfQbqlyNOqblNqQpFhJIbmAOZtmJXdDAoo4
 mq39cZaMR/dwUcLg98q8xQRXaK4cenl/+sSLxbVpr76Wv9SI4N5OntgRUUljqA==
X-Gm-Gg: AYBFou1X0kU3ymobKCCy5Q89AbHZIEghgx1Z/koKBbV7TGL3lfMxN+lWQoMDWp+1/q4
 FHw/8GSOSQfAQ62PqcVjjCu0GexznwjwJ/DIGSeYJfkKNYZo4fY4KdNLQ2LCaugJvtgPVrZwFmQ
 ys0T7U0s+faHvum3PSzrRqdPyHCeN6ZOSS4UFvAV953WUjq9j2S5Jtw28CInvklfX72jTapClz2
 VsVJsE6Bg3Bt8rI41Lgt5GRPdIhcPuIQAlIudWTD2u+WZlQquGsStslk/uUfQURnEn7G1J5465a
 wJvo+XHH/x4y/jmL3r1hKCZTMxesidiYsYvZqwqkYms3xXaVJYX0rojOheReqJzgTCQ7Mr9miTY
 DzuoZwFsem4NKf7bTOSqU+BSdCI/QCBLpMSCNw/R37ziQfV1qtHj+UUr3JPp0y+Q3dRdPUybCUQ
 E5qFj4ZimwOcB4zqLENvsPOH5eJY3O9TXWRe0GRlseS5qJPA1NGbpJ3Pc47nrZfb2zVRrpeDAoG
 Gi9CEp7SYp5EMMUbfDjkA5EEJ8VI78JljSBfAiHsl8mmbtFDuyeZeJqqs+DDkiCOcL+HF5FAE6+
 FYT36+PgCt2CsK6rXHgWe57JQg61/XIZP7BNVzMsSqq3uSetuAhiv5cu93ho9pVoOQCxFN1y7Cs
 r0cVLClSe46vwq83CoBM7ArR5fmQUqbamg4n24BXr+g==
X-Received: by 2002:a05:6820:c2c5:10b0:6dd:7f0c:e928 with SMTP id
 006d021491bc7-6df335a4cb6mr1884339eaf.17.1790974526977; 
 Fri, 02 Oct 2026 13:55:26 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6df3a9b0f1bsm3197929eaf.7.2026.10.02.13.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 13:55:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 14:55:17 -0600
Message-ID: <20261002205517.4043570-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002205517.4043570-1-james.hilliard1@gmail.com>
References: <20261002205517.4043570-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 6/6] package/python-httpx2: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                        |  1 +
 package/python-httpx2/Config.in          | 11 +++++++++++
 package/python-httpx2/python-httpx2.hash |  5 +++++
 package/python-httpx2/python-httpx2.mk   | 17 +++++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 package/python-httpx2/Config.in
 create mode 100644 package/python-httpx2/python-httpx2.hash
 create mode 100644 package/python-httpx2/python-httpx2.mk

diff --git a/package/Config.in b/package/Config.in
index 2fdb8b1fc9..4277a4e214 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1168,6 +1168,7 @@ menu "External python modules"
 	source "package/python-httpcore2/Config.in"
 	source "package/python-httplib2/Config.in"
 	source "package/python-httpx/Config.in"
+	source "package/python-httpx2/Config.in"
 	source "package/python-huepy/Config.in"
 	source "package/python-humanfriendly/Config.in"
 	source "package/python-humanize/Config.in"
diff --git a/package/python-httpx2/Config.in b/package/python-httpx2/Config.in
new file mode 100644
index 0000000000..2a24fbaa1f
--- /dev/null
+++ b/package/python-httpx2/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_HTTPX2
+	bool "python-httpx2"
+	select BR2_PACKAGE_PYTHON_ANYIO # runtime
+	select BR2_PACKAGE_PYTHON_HTTPCORE2 # runtime
+	select BR2_PACKAGE_PYTHON_IDNA # runtime
+	select BR2_PACKAGE_PYTHON_TRUSTSTORE # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
+	help
+	  The next generation HTTP client.
+
+	  https://github.com/pydantic/httpx2
diff --git a/package/python-httpx2/python-httpx2.hash b/package/python-httpx2/python-httpx2.hash
new file mode 100644
index 0000000000..2570c6df1d
--- /dev/null
+++ b/package/python-httpx2/python-httpx2.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/httpx2/json
+md5  29186979393f62d61718c3a525f8163a  httpx2-2.13.1.tar.gz
+sha256  e48744a19e3af5ee48313d0ce5fe941d5422fae5705ea922a4aabf94d7800dfa  httpx2-2.13.1.tar.gz
+# Locally computed sha256 checksums
+sha256  7e7d6dbaf7fe160d39fd6e84fd02c33cab96bcbea34d36998d545bceb4a19c30  LICENSE.md
diff --git a/package/python-httpx2/python-httpx2.mk b/package/python-httpx2/python-httpx2.mk
new file mode 100644
index 0000000000..dfd6bd04de
--- /dev/null
+++ b/package/python-httpx2/python-httpx2.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-httpx2
+#
+################################################################################
+
+PYTHON_HTTPX2_VERSION = 2.13.1
+PYTHON_HTTPX2_SOURCE = httpx2-$(PYTHON_HTTPX2_VERSION).tar.gz
+PYTHON_HTTPX2_SITE = https://files.pythonhosted.org/packages/d5/44/474bef2a0e9d90f1715d32cb98b0738695ca17ba324095fb2497ed7fbd59
+PYTHON_HTTPX2_SETUP_TYPE = hatch
+PYTHON_HTTPX2_LICENSE = BSD-3-Clause
+PYTHON_HTTPX2_LICENSE_FILES = LICENSE.md
+PYTHON_HTTPX2_DEPENDENCIES = \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-uv-dynamic-versioning
+
+$(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
