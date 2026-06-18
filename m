Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE5BCD98F2
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 06:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C963E41322;
	Thu, 18 Jun 2026 06:51:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L-LaXTpuaIkR; Thu, 18 Jun 2026 06:51:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 102BB41325
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781765508;
	bh=TzXpn2ahL9OTdT0uYyI2U7P5Vipl9IZep8B+Oi4Vw20=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ELP0zXxDObJGhgvYqFRnxAv78e7wrYeeYrDIYYd6hVbaRND0V1sJsHtvIy52JadWu
	 6se7TFDLTZPIGb4Q4Ttfaf46d/Wr6zb3D3CYdq1AwJA3RW0b2tlFKQqi0nOpBxMBD1
	 gCj+nju2mSQx4zSP4FzPDBiZv8DxyVLMcfMzA/nwfsOPQRRU1pxPSjfLzgmv5XRDqt
	 uWo+tBGsdR16ssjgnIKCxDBmacIa5qjHnq+FesNbZnjd9j5TQvDI/dXWQYJSd+6kJG
	 E6FljkBSmbIJk8FkOb4UK6qIQvY0efuSHcsT7wtPU621r3ZMumiu+qysjUjxq4tCOR
	 C5D9fUJcXHGHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 102BB41325;
	Thu, 18 Jun 2026 06:51:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BC664358
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 06:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA53683DC6
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 06:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fiK8l9bEM0jX for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 06:51:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ED69883D3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED69883D3A
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED69883D3A
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 06:51:43 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-7e6cfdc8382so442863a34.2
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 23:51:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781765503; x=1782370303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MX2S6twXG+mVRkoVb5E4Gx/WKIFSFo607lCx8hDUtUU=;
 b=YaeIYGw4D6C5n/ZQN0ZE/x4VdyDAOixjwLlfdwpxrVcqJfkqWcIB9ruznZ9QyWBw42
 T0b8Y+RhhY4biRWSuz16U/32CstERtp24Idz7PtdgZY6XB4MQe+gVAmLE/rF7UhYvQhZ
 kPQpKX3RP/XnUSUJ4nxNPvdEQUGw+abXd1x7OsuJjIuv5NW5/XeD3Jw9+S60jkodLmcH
 VYaok76kX/Vf5Vg8vx0BGOWPru+tSf1mn9hjrXIUwulpXhV0RKNhkxlt9aGoBmq9xq84
 9BH4SjSRMsE3mS8LPEw2Np70HbKiQLNA1l9IHNGlaLkNnhvTnqK8D6zUdMnztBZI3YZd
 KH9g==
X-Gm-Message-State: AOJu0YyZnH2lPqeQXT0ACpID2d7LEZPzXOYhNmQ3eDSH57RcKCtKHRaR
 1As+Tt1OKcXodopJnOxPjRs8/WOW0OCxmWxYS3uPvYB5ZyhXYru3mNdA1bL0NMuF
X-Gm-Gg: Acq92OG5zMD/mhJ6h1LliRXeipn7/3u8eubQKBCtCJO+oHXzu6tRUjaJLg3RiCNy8oZ
 egs4cX1Y7e3dx2YXlk7kEQFLRIfLVkFEYHFSlj7KPb3nnwOq4cu+ckemjWHt/SzW+4FWzFrLc1X
 uT+0zv3O6R+WHQTDxP0w+Ol4wVFBzlHsPXRtveBVk5i7CxWjqQIVGSeJAhH/k2Xebq4DI5OVlq8
 8zuZqLYQuYU82QgcAh0Bfb+WQfSQhdMy2WAiaZC/Js1u23hAnH5yD19zRlGX2HtGQoLcYDfJyUK
 l7h9r4TPKuf+ygaj+hFpEV7qq9/IppHBDwgKrWHwByUdQQWp0j30b+I4GyJGFMWZoMTSjyG5yq5
 SLrXZ6qwY0YACusiD6Wgxhy/Rdu30uOxgd4za2mfoT+9BFEuk0D9ZKaoWeigxZeHkjtEaqpqgL0
 nFl5qfsRfqD/B/MGfok0UuEpHy5mE9cmk/ZGVoq6JtqumM8eVbik0e7GhWGfcE83aHJRzwGUCcs
 I+FSDHbJmbryidS+2Y5j+ziVwqnoXrDgIysXMGROTQ80fRwrQOHweWCb/GLcnAI2rOlPtCrERvZ
 2gk5a6swCsmeZ5tXr2R/JZk1+w==
X-Received: by 2002:a05:6830:230d:b0:7e6:fe3a:b777 with SMTP id
 46e09a7af769-7e90b38a99amr5892580a34.13.1781765502835; 
 Wed, 17 Jun 2026 23:51:42 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-16-141.hlrn.qwest.net.
 [174.29.16.141]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e79f5bb9c3sm11717542a34.10.2026.06.17.23.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 23:51:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 00:51:37 -0600
Message-ID: <20260618065137.3987932-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618065137.3987932-1-james.hilliard1@gmail.com>
References: <20260618065137.3987932-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781765503; x=1782370303; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MX2S6twXG+mVRkoVb5E4Gx/WKIFSFo607lCx8hDUtUU=;
 b=MODsm/6G7yrHipsQbsxvcHMLzIrwOegiTR+I1oHBQ+6J8bh00fbbdeDHump37/pmJd
 p5Fjg3kQI/P8Ndj8cgC2QS/ZbZiXm9b4U85SU2ID/6BBy6mapV8rnKQb235lV7n1hPU8
 sjpctGr8eOMddGgcxaO3JoJA7yMSeI3Uyua5hiNxy+j0v704izziMFnJ3T03OIBGeYux
 +cA+sP3RyLU/LiYHtyfGB1u6o0qjQ9BXQ2m6g3wtPIuiXJ5weKxmVbNuOWrfei1rYTIo
 sr7szrpBwxtDKwOeQ0+FL90VHzEYPylH8MnQVG6fasB+VQ1+SZmPUbRFiblwvYtrg/r/
 hqjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=MODsm/6G
Subject: [Buildroot] [PATCH v3 3/3] package/python-async-timeout: use
 hash-based PyPI site
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the blake2b-256 digest from the PyPI metadata and drop the explicit
PYTHON_ASYNC_TIMEOUT_SITE assignment.

The Python package infrastructure can now derive the hash-based
files.pythonhosted.org site from the package .hash file.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-async-timeout/python-async-timeout.hash | 3 ++-
 package/python-async-timeout/python-async-timeout.mk   | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-async-timeout/python-async-timeout.hash b/package/python-async-timeout/python-async-timeout.hash
index 451c07de5d..c812b9c6c3 100644
--- a/package/python-async-timeout/python-async-timeout.hash
+++ b/package/python-async-timeout/python-async-timeout.hash
@@ -1,5 +1,6 @@
-# md5, sha256 from https://pypi.org/pypi/async-timeout/json
+# md5, sha256, blake2b-256 from https://pypi.org/pypi/async-timeout/json
 md5  566a39011e87cb8044ee75369e69b327  async_timeout-5.0.1.tar.gz
 sha256  d9321a7a3d5a6a5e187e824d2fa0793ce379a202935782d555d6e9d2735677d3  async_timeout-5.0.1.tar.gz
+blake2b-256  a5ae136395dfbfe00dfc94da3f3e136d0b13f394cba8f4841120e34226265780  async_timeout-5.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  e18d7bb8f513e2c46bb585c94b585bd30720dd3ccb21ddb0786f72d16658f92c  LICENSE
diff --git a/package/python-async-timeout/python-async-timeout.mk b/package/python-async-timeout/python-async-timeout.mk
index 2835368003..017ea548b5 100644
--- a/package/python-async-timeout/python-async-timeout.mk
+++ b/package/python-async-timeout/python-async-timeout.mk
@@ -6,7 +6,6 @@
 
 PYTHON_ASYNC_TIMEOUT_VERSION = 5.0.1
 PYTHON_ASYNC_TIMEOUT_SOURCE = async_timeout-$(PYTHON_ASYNC_TIMEOUT_VERSION).tar.gz
-PYTHON_ASYNC_TIMEOUT_SITE = https://files.pythonhosted.org/packages/a5/ae/136395dfbfe00dfc94da3f3e136d0b13f394cba8f4841120e34226265780
 PYTHON_ASYNC_TIMEOUT_LICENSE = Apache-2.0
 PYTHON_ASYNC_TIMEOUT_LICENSE_FILES = LICENSE
 PYTHON_ASYNC_TIMEOUT_SETUP_TYPE = setuptools
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
