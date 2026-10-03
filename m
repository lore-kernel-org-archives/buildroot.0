Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82D0CA5FE2
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C97440B66;
	Sat,  3 Oct 2026 01:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9OmxMVKbmKtC; Sat,  3 Oct 2026 01:48:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 904D640B7F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790992123;
	b=Av8nzp/HVLGDTKS7lGxoQC7KZXahIDp90JXXFuMZB7Q8WxXu7BqF81fzAZ+7xeJFSlj6
	 JY+A42ynFT9Mh3kcz4JS3D4x14iAqL/MRRZFPhlevpw42sky/5BzeO1pHbYrYhLfGDDFl
	 fJXbT0e39Gz/EQjZunD9Db62g+naLh5lfV2qoDh/Sdj0TWJk/kubo7kehgokUgWiLKeGB
	 7jT3R4VgpDWT2x9c/i3OuZhIwp4JzvqDB40cUz0MyGok1cvSZ6spOPO0HjV+y5C0OK7W8
	 S1g9jkf94YqGNtahuYBYHiI0DVuO4HDxxtR0fGPCD4ryvZQh8sQrP+N9hYeQDs8263A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790992123;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FazosWgmTEkBByr4LmYcLRxD0k24B0u9zZ3OvB+W7m8=;
	b=jJnlbqLq75HnDcJPQcmuo1XdW9XB9MP/lMsTP1A0QqBBn0X4weP/ep6eRHdSAjGEyfUX
	 JUV3lOZWfN4EmbKPuRqdADIlJ5Fn4ZZLW1dUUeGAk6sjzFvLLkCr01I5/cGA1DxvypAQv
	 N5i7H5OqS7MFb6X4N8jOsOIKTyKj0Sfn1DRKFJ54Ctd0SIGml5M9fwhzwvnV6JkwfrmD9
	 Ndnu5daqoNFyO0XCtXX7b9PuxoqPANk4VvN5vKQ7UOnhlsqdSNp8qqRPYLkKAZopbqU4f
	 KeUvH5+HDaaVMgVDCJg/eXadbizJLUhZHJKxcB7uXu0bvM8Lv2CYzCyD9FqWrkxE4uA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="IAidBH/D";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790992123;
	bh=FazosWgmTEkBByr4LmYcLRxD0k24B0u9zZ3OvB+W7m8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=NXmE7onzYytFEZt0BFbjwwlZdQ/UhSRBc4jy37dIzEzQlUUyILkl/+0R0nqK0ZTWZ
	 iOIeLKNWZLSDof/udB/899bK5pfSlWS3KJz9hlYVsgceIhDXsLxTz6o1nf8I//riCw
	 e5eaZKoqEzYV96/XauATqRG43J9xOfrpy7WY4vz5DdjxxlES703c6VNmfZoyXSkTnP
	 Xg2PaumbYMzGjeGqAtXSiU3Lw9rAYfqbvImrr6vKFWZEVmDXHuORTmyYRH97hPsDxq
	 JH1J1w5j7OwVEu19uhwZkQzljGE65zdpC9nGxEx8uOds6zZbmDaqxzbilxpCfRv03y
	 lSgraGFwCHQJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 904D640B7F;
	Sat,  3 Oct 2026 01:48:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 669CA34E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63FAC40B7F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P27INwbPpT7k for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:48:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 75FC040B66
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::329"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790992120;
 b=IxYlD2AVn76Cf30kUxO9Nzo95GRe1E48lKJgglrazCXA6LWX6K8ZnGvEgmcOskHUNKxN
 0qkd2643APCjLQxHrbXFy9AVBxD7o3mMwCCJS58QMA9Q9xAuK3Fl9r7hzA1XQs1uvmPb3
 n1wEwo4ZSrVkXHdKlURUGRZJ7JRJuYUN9rnbfVlJXJDyoqvPU06vke3wm5rpEQ+x0Jw0b
 LlXy0cVyy3l0EsWE0vyQmFhlMq6qDhntSDX5Q9mXBgOkqhjJqTD7NZ6hqA1plcX3mVe3t
 Ta0M96C08LL4ZJdboOI2H1MBFKxSTuFiJqXl9EXWwPymcU/DgVmY1oeoeiOlf/x5BFA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790992120;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=3zHQt+ZdbHB3QPXrIoltp4CM/aYnzVci5QLgvUwhZvY=;
 b=GmmKVfLDlTaYlISkn1C1UIgPq5b1x4ayoYmkqVPWe/v0NIU5ZPeNia00Zl8zE21biQSF
 8SEh3bWg4FWi3Ue2s7pA6Kb1azmn8N7GshsYJCT3IHqRTNzcdlEtanCqsmvCxlGbki198
 fmxN8i0kaLBoEVggMQMMV3SHOvrcvr1C3AC321aQTlpI+5wzAjtukfGdwgcFjnuSpKMok
 68/ZDwaeRgFGvY+LK/ZidmVzhQdvnnwK8Sy49ioSEfdbA0xm98qbbaOYG861bwYtfL2m+
 vIpv+Hh0ktNtzTCKheB/zrpNKXjZWwGTAfUzMVrZF125Ds+fON5zQvj7q4MXFafL7YA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="IAidBH/D"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=IAidBH/D
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75FC040B66
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:48:40 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-81eaf8e18bdso358461a34.1
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790992119; x=1791596919; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3zHQt+ZdbHB3QPXrIoltp4CM/aYnzVci5QLgvUwhZvY=;
 b=IAidBH/DBvtIA0w0EmX2BjmIytOzpWROmG9/qq0WvaxjI+9nXsVQ6p+rfIIXnqt6h2
 25BLzxf/Y8AzXV0ANkqjmg1n5y7i2pVb117epMFckZSZyPFbaLzBBv4qwu/Gym64FesI
 qDdlJHWLBiLM4zidLgZg0e8niheO/Ta4k79bdmVWM0/ZDLWGvqzznUBWXyH/MA7B7fdX
 OfmyXBpKE3n85tNPeH1Ec9SOpKS7bCRSlFQPFat/8Jq+fY3CSghe9X3kqUjTPl+FRVrY
 KSnt6gHshxwDJ6CqAiaqkWXo/Enxp09ZJy/WRBbXi2L02UP+LyUSAL4lkSaL0q9nBEWW
 b1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790992119; x=1791596919;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3zHQt+ZdbHB3QPXrIoltp4CM/aYnzVci5QLgvUwhZvY=;
 b=QXMSp+8FFEm2kAJlz/FlwRB0Vu7JTTggw7L5ui3d6dcs+ZxHn03rn0CBHVhtpHn/pn
 d2Khtp4XwDeq3899TLJj3Yfo7yYfQWrZIXG+NNz62VlmCTBlCBpkcCsTBU93u4lmVwie
 nclt2rdwXd+ufDpsVaPu5e7mipXOlEjap1KzIrKqVZ+opUgmGfoNfEQKkBTK92w8fKIq
 /CB2fiKG99HAIarJWK+1aj39HwzBxCRHLnHPmVwqx5z2K6RWZQ5ZhO5IzfwxlN/y9uF2
 r11QwJ1H9XFKsmoTS+pBbajLz8AY1AROKEFIaz5AkL2LuvgZr8gNn7tTidg0QtLOfmKb
 lrhw==
X-Gm-Message-State: AFuF++nl6IuPIWex7QGpNKY+c5PpQpZTvoTM9U3rZctx7n6oWg+/mGwK
 SsOMF78djMBrdldjM1f2P+U0dELun90l5fzcD36UWBDF3w52l9Wg8Ezp2sct6w==
X-Gm-Gg: AYBFou39lJVujArs+LokI9k7NcKfv2HCuazBgNTLzcOzLGN2p/PV8xzeHaqb16NqKSV
 FUMRcnU4D3KxIwcSxCsaS7eJuvVFoB3XR08ET2AeZkqUTk1uIbUNmPJtlUKbZYM0cuo8zsdAmur
 BRz+1Vm/+yJ/PcAzoUZe4yoY3y5IokMjo0o11ZayNj3rTlIzM2DT5ANpF6nWFAqTqFMcTfvOlLp
 K9ZaZclFaz8TnVPucCJF8P671geXbeTn/RDlBzE5cewB85KazX88ufxrc9T2FdJSYjyGFwnjLe/
 UYLN4MdeLw5UpPVDh+Tj8r+LqDV4Qg9gf14bPsJ+xg4J2mzkAVEKBBMNbqwm41FWv2FOsJ+OIdJ
 VBgs1qXfAmi7bUpwo/SBCrSsX805OGieKDlF+vVtOT/4KEzdoCR1h8bhh42WkHk+6Nz6JduyrSz
 R8OOJ+rQ7lJSJURVG6J2osGcemwtQZWiZ8br0S0ShOHtey+HHb92jpUgtDyEtkI6sFzBDUxdcs7
 MDqsbqihATL9YeTOWRkKI40bDJpEhC8fl7rjT3/1aIFTRNMvwdg8sWeglOi1yUsIyi3ycGO1Hyr
 WJ7Te+t0fPKjiv7j1LZrImTFzo6j9Yu64PoZVCki9XQnUNXOeIZcAa3dwk8oSyDNJ7lAMbTMM3c
 +UWrzVqQU7/LbFn1+FW8/+iDe+LOIEqOgprw6jfsa31dp
X-Received: by 2002:a05:6808:178c:b0:4c3:7695:1177 with SMTP id
 5614622812f47-4f677447238mr1151585b6e.6.1790992119162; 
 Fri, 02 Oct 2026 18:48:39 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-49e16e577c0sm3990524fac.10.2026.10.02.18.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:48:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:48:20 -0600
Message-ID: <20261003014837.403895-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp: bump to version
 3.14.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update license hash due to the inclusion of the full Apache-2.0 license
text:
https://github.com/aio-libs/aiohttp/commit/cbf255319921ba84a115d123f7304f9f813e1139

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiohttp/python-aiohttp.hash | 6 +++---
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index 1db5c71b1a..13f6e2be21 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  eb22a738fd03b7b009286e048a015780  aiohttp-3.13.5.tar.gz
-sha256  9d98cc980ecc96be6eb4c1994ce35d28d8b1f5e5208a23b421187d1209dbb7d1  aiohttp-3.13.5.tar.gz
+md5  1befc420af8c5cc860a80a629d66cb00  aiohttp-3.14.3.tar.gz
+sha256  9491196535a88924a60afd5b5f434b5b203b6cc616250878dbdb223a8f7844bc  aiohttp-3.14.3.tar.gz
 # Locally computed sha256 checksums
-sha256  9f80d0db7d755a941db4572172c270ecbd8f082ba215ddd095985942ed94a9eb  LICENSE.txt
+sha256  2e4be5fc6c4c72a466fcb665d726e049a6891981fe536c4f04b6366749461d23  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index 504393c711..7f48f5a19c 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.13.5
+PYTHON_AIOHTTP_VERSION = 3.14.3
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/77/9a/152096d4808df8e4268befa55fba462f440f14beab85e8ad9bf990516918
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/58/d9/22ce5786ac0c1653ae8b6c23bded02c1686d11f0dbb45b31ce128e0df985
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
