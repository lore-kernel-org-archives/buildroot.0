Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8ECFCD98E1
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 01:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73DAA84A51;
	Tue, 16 Jun 2026 01:31:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s1P5KyE9skTE; Tue, 16 Jun 2026 01:31:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6BED84A54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781573487;
	bh=6enlTQPxhyw6Uo/LQiw/98At2M2gUojjx7J710p2oW0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ajicd8nvrrTJz2n5XKehQGwySLVbLWh+jhXvyB8FBghmevQarh58BhZq9WMlVMxSI
	 qno8RLBgdxVCO84qdPM0fUXEzb33DCAkRICCHLtUumDPea2dBwBRwA+RwoMDMJ6SDb
	 PYVYbVjuGKTeyMt+MZ2MoaENhOAGcHRpM6ZfPhPzUAHEwpr9xl+r0qXZy8Z36ujlBg
	 HohYPqRcEIb4v9hRe1PadW6Xwg/hO6F3EA7m+3NPd49mj0w1OgBnJA2kYAylLSow9I
	 UQq/kMr9fnYf1ze277p+NK8QH6go3RMV43NiYypodnyJUpAwf5URwYXgVRBYDWz1cF
	 v3egQHPuFT9gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6BED84A54;
	Tue, 16 Jun 2026 01:31:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F9DA2F3
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 01:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75B624007F
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 01:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S93B9J9OLJYy for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 01:31:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2f; helo=mail-oa1-x2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 97B3E4006F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97B3E4006F
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97B3E4006F
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 01:31:23 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-43d34292872so1902665fac.0
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 18:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781573482; x=1782178282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=F6Ql0UI1BMx5Fc+twe57xFN0k0gw5qXeOvaw5yWZ4/k=;
 b=aNuZ0BH5Y7TY03PXZq3v/ciw5qMTzwyshHMdGJw2egRmnELkvMamOrJMAIGSUKwDcB
 DLfsPOSpQQWC7m51lR8J3CDGA2MFUJNxGj1BpaFBgVzJbTxW+Equi823imAqH+SoBjNT
 mEoa1JvRznb8QpLK/RWVkvJ6IXdCMi2H8lyUx1knso8JKDYSG/oLPweEP3F+09CezfY1
 xav/iwg0kLg99zGjRCYqdjNzo+XNG/G/xZecqA7/3plJiP5kMr0IkaeqwH81OJk3zPjj
 iJLL7mb2Hzg1rXZ0SLVIInKotK+UxsRVJyOPxLT2IpkUP+ceCANBLJHV80Y5YcHZGiJa
 aR+A==
X-Gm-Message-State: AOJu0YwuKiWIx/byqaIYZNfZZ87Vt6S5Nq/EVRj0EPsc7Cr0YRXPP2If
 P1RlBbVtAUgOtqP4A50ywQmUW548m9z8Y32bIaRsVxJsNHMFR4Cezp4DNlUEQJIo
X-Gm-Gg: Acq92OGWiygK8GBlzNTKLM/8lKcKpuWIofVJKDgiMN3DLDvis7DbMil0uQtQvx6h/YP
 AC+Pin40nKHZfjVHE2NC/ODXopb2TODSG7/M7Bkw1VbfJCTQGl9TSV4JeA+S6do0ihOchwmbOAs
 j1Af2ElGSOADPZUE45naKW4Yug6PTk1D5i3l0stRZ52y5BfFqbXsmZNTVDo9U2IdhPyitR42dpb
 sHHBIIHGugdIrsj66fgb4CfgW2pXzj1xLKeX7FuEGU4L1QeN0DaHazsMRXQBlCHq0JEIz1EQGB9
 QR5OM1icQiYZvJ9mJy6EvX7bSGvC0g2lDJtu2CMDGcdUdfmvEkr+/XvjQZtDKvFdRHx6rqNfXvm
 Hsa3OsCRSCQsrs0DfungskY9/c0soL8NJhG/53oPgE3We3d3lnTCZBrJKCQU6OZUgK4DAXRrA+G
 VqTFgjVfx7owQAZqbwgJjtjAiufUCDha3FyPYq3tlPIf511gWwDfAJzO21aheiJxmGPTNwt0b2E
 QZ5FuJ3pM3jxDqjSwsV9R/q5v6gI5+jewzzn6GQL8HRA8/1dVDi8XwJETVv8UwgGWCTQoRijfQH
 c5z0DTDMddgipyKfuDHmTTEtig==
X-Received: by 2002:a05:6871:358e:b0:441:33a9:b8da with SMTP id
 586e51a60fabf-4426dfd12edmr10305613fac.18.1781573482333; 
 Mon, 15 Jun 2026 18:31:22 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-16-141.hlrn.qwest.net.
 [174.29.16.141]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-44308b0057csm1183962fac.8.2026.06.15.18.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 18:31:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 19:31:13 -0600
Message-ID: <20260616013113.3899641-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260616013113.3899641-1-james.hilliard1@gmail.com>
References: <20260616013113.3899641-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781573482; x=1782178282; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F6Ql0UI1BMx5Fc+twe57xFN0k0gw5qXeOvaw5yWZ4/k=;
 b=NpbYPkxs4GahdJA6HRRuVtdmlk6A7OevLx1kD/FVjP20mRXHjwzlF7lEq17FUHA8u2
 E9m/gCLlvAmCHaqUmCeKLcq06vhc+DbtmJHQL+v6iQb1ohhBJggKNXbxajDZnTdC/KEB
 NIXqQNHqaMy38fAEbH0h2FILdo3O+Xhx3057d61mouo80IzsWQJKSdJG9ZiNjK72uib2
 K7dGHmpcNfl2gcVxzC0Q0g56h3eGv6AS7khRS+E37GNiZwc8HCAKvl3U7+BZD1PflpUl
 8c3em9zhCgTdMpRITaN1xtopYD55CHi/0ilccrdTdXM6za/KvZjqYppp0i+GOCJ7T+1b
 PY9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=NpbYPkxs
Subject: [Buildroot] [PATCH 3/3] package/python-async-timeout: use
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
files.pythonhosted.org URL from the package .hash file, so the .mk file
no longer needs to duplicate that hash-derived path.

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
