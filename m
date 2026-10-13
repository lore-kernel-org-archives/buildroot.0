Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4C8CC6B1C
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32277405D6;
	Tue, 13 Oct 2026 17:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D0zZ92MMcgTm; Tue, 13 Oct 2026 17:51:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9DDE8405DD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791913907;
	b=ZCgfnqPruLk/CeUxHnTgSVnDx2fwu6yGDQSw4g+JJvx9WqN4VhuqvnVFV5l3KbEC285M
	 QSa4ExF8P3xi4+0djmwRI/mihO/EnlK+T2uwZeivU/v6VT8qFqcgvoAwH6GNoPgIPhf7Q
	 7z5ZjFsHwqtEjFFnpYtUJhONAvAATGFfx6xn+uCNB7XsmNEQ6WiPq3ZfTowRqAufwyNYP
	 rgPE/i0KYgYeehPGdg13J1xl8KSG4FCP25o0jxRGrnB5JNremaN/RETRTei6n+rq1QFJU
	 xitcQoWD1pMmuOWKIOP7RMGExD0YPwAIqzxkEaByzEowp/VB3ZiClV07gWFcP+ClpiQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791913907;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=PfcYNniiU0teKmyTxLZoLx0r5MPet8Vw988SJ0MZwMA=;
	b=mv/m3nAf61PKZV+kX9Podxle4msr37BsiYL/GGqOBBah/08D0DCXi4tYTu83icqDzVN8
	 Ssrn8pVvv7kuPqe9TPdO6DR8YdzTzP5i9O52uMO7GCyJVtI1ZkqzJwb4QZhmAypoM+HIK
	 CM1iMzFPgi6iAQUeI/L3yz7TNKuyZVYgg70UAUFkJwqoIXacqdfQaQaYKIIaTKFTceAow
	 Dh7ZPxdBsHRdwg1A1brwYorsggwDHicMlHJlov6WL0PIm+mDIJvGr7salMh1RHkE1I+L2
	 u7iQg/zmWAA6ZtDGaOL5ZuqmdElwKuGKV7BKTUN5rBXKatud7wmBJ88kkY5UMkpPwCw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791913907;
	bh=PfcYNniiU0teKmyTxLZoLx0r5MPet8Vw988SJ0MZwMA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=dMdpdxou0RawaRDR590Lt1xBkI1GcEEE2XKaazfG2dp0JUJp5ZkK6OnYb0OH32Ci2
	 M697GDGkgbDxc+QmrgpJN3Xv3VRf4D2tNjl9fkw2ywf4LQ0ZSXDkygQR13fYeMFoVS
	 GC8unH6G0pwpGKaBaYsO3MHBAJFawAaKTRWPvrFmdO35e1Mp15R8qzy61uGjwmHpYK
	 ywm8tcw8YuAwY7SZekOoRY3Kni6DedKF0XCQZqmdbHn4BtBBpE1X9FWazSPJDFuIkl
	 hkbbyjIK2kN0aaMroolNstD63LOpnKebr0HmFmIqBITEYmaFRTcNvihGBZna54lF33
	 SRxwhpn7UkhUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DDE8405DD;
	Tue, 13 Oct 2026 17:51:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 638F22AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 551CF80A86
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GxptiDDu5PCc for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:51:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 60AD380AA3
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::229"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791913903;
 b=l8Twa3oqWgWUQKH4KytLHkZllyr7eMXQchdRuaMHdpVJyQ4QcR54Vh+ADsUTUEgzn9rU
 E1kUyaRXs5RGK7Vlmjm49HWBeUsLv3Cwk0Fwk7+YIjrxo3ctSteFp72SpZo+5/T26/X/3
 1UiEHjx5caAGdWJQMuPEwstUyDkkdGActbZeu7STd3bmtesPnQbZR4ugLla0PRiHHzixm
 2nbd9mp3d01rnrQP6uIj8nFQrHwawmGV7e1FiHhor39IQ1SSMEwEd3eUHqK//VaNIaI8I
 COY43QJduUymSW5FuKw46v2493fxGfjZasuYViKWLG6D/SxYKFEyH/+69Mt3fXozG3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791913903;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Md6l+maXQGbeLpEROf8ydH3DrQD2zyzywKGDFkxeLa8=;
 b=PkGIjmVGZLIgOVNcBOZnDLb2UWXa7/tSTu9jcMJGSn3AXvZzrBqXJpsEP+t9TeVn/dxX
 y+AwJpiaA0D9ZQWGbe6E/tNYleeHnATYHD6t2lp/8vwOVZflkbM+D+QOpplwcRIgot2P9
 ySY2KZ9EcWpD2kWQ/N/AAjFYhQdP+t2CV23lL/4VKymJg0DE1F0TmVSTkty0dnluIHdYV
 z5ELG1srJ8DWGtpVmRaYxET5VqXNDoWli9Xn1ji5m+uc83bun8j1O9jHLWyMgu/CgmUsf
 UKVMTUvycvdugIAVlBjhm19E6z5QMsgCJd2RKvFOU+crKwS7Sxag5ZiAjB1gDYNQRdQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=EzvMzBJ+; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::229"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=EzvMzBJ+
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60AD380AA3
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:43 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-4f48d91ba7dso2411736b6e.2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 10:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791913902; x=1792518702; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Md6l+maXQGbeLpEROf8ydH3DrQD2zyzywKGDFkxeLa8=;
 b=EzvMzBJ+9YfqhLpqABQSWZVQuqHPumz7dB4fCWvnntbScWVwnOc2LtkH/oB7uY0t3/
 juPPg421fNy/lMBogLvRw1qBU5K+2r/uAx+txkSj4CCrP8R2wfEKt2wsvspQSxB6urSA
 Nm+YSxQfPG+TjvM/Hhw+XAN5anv20m3N4/lkJl6gf6AwLbqXoQ+Ex84pZda2Dfme00Gj
 xTRSYjfggfNL+k01jfl7FpaUUlrslPb0I6fBnKHW3O43ROwuccaHoK0KDG7X4x6/LfUd
 W3ZqHFH8VgzYZlAbF0bVovsKhn6nLlvAo52So7x+zCJdNcIq2CMt2AjaK7IFzjs92MxL
 EsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791913902; x=1792518702;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Md6l+maXQGbeLpEROf8ydH3DrQD2zyzywKGDFkxeLa8=;
 b=k77/Llw00KecUBC5cOykIJpXKUDQDT/hr1HhQfyljWMb0RMHCPqHIIZrIubDDyVkhj
 cJaZFiPkMNz9zkrf6NHElMQ1znyqmXTeZGq3+qd4618qoBOlHNd2gr+cWX3rQNHVJdix
 yR2EvheBdUPxfco4TtR/tStWYuSqXWttuKd1Eik2ToKiu4IVvZdUEX+bsScTHdeY8jmm
 QZm1AM0Uuot1gCqGs9CtOcIJcHj1HD7qTh9XjiUvBkKG+sQivymnyMJp6wKyKW3r41DP
 Fq1RX1f+HQdxntxNCEU0CIdiU3JGLgFkgdFDx2vj0ZdtFRrZSnWBPjxead54p5PAA0IV
 b/xg==
X-Gm-Message-State: AFq9FYLoHxFMenGKxYmbSJTAZyEvvz1QG078jAHIYM5spv4VMXBCnoxK
 kdy7Sih/2etEk4Z5qgbjpDI/I7gwTtyeJPvGIEYmP6VWCQw5dt1uk7dp3mDab7CL
X-Gm-Gg: AYBFou1wKsqMCdJje/+S1d8I1X3d7L9rVXtHKro7yJc1WwsMtgAlfDpUnKG4fBOByIB
 ftIIU05Ne2614lDQks2WJ9mhxnzXXlpDXLKVua4FQi+kvZuSWnfC83j4QcTdBi9u8Sp00bUjq7n
 r5VFJH8zlblDBqel2kZTVYM2k5w0ZQVWcopVLFSLvIgGUBBfSgRr27dCIUuR5HRmnqkywx90pop
 lddvRtWnytiTq8tyvASJ5hmL9NwLM0MfsVdW1X/DqJHf5yRmgfMpNWAkcbgTixdGMgyCcRTi9V2
 DLb81yzFFrqwMMm6sA+vUo6NsONwecEWoJf586p9jigVvLGUdV8BVORKRQzjSC6nubEVfRSFh56
 OIlTCKvDQn8/+D6FTzDVkeDl3JbaSdSB13JEo5EGDT4XLVrBRu2ezZ0UzMcQQovd3LMpk2KSPnd
 R8VXVUXHG5SdWvpIzt0/xUSaDKCgn/LCJYfTQbfWNccuCV7RTFK6G2OZlXFUONJdXraWXw2QcAi
 zWfbHmYKS/WhgYEmsyRlutEj244gMn5BxrMDenq3xtEkbivA8o3xbM4LcLNnIBBzo1iIo1AeOij
 kN0eDzPAiUjfPhPRLk7cT7ZMe6nYtV5UjtXeywPPo7QUKb1PfofLTgVQM+g/y1Ryu8ZkIvpF5++
 viDU+MHD8T2WGs4wkeDwKnUvYao+0XJACypLt6AKpKCo=
X-Received: by 2002:a05:6808:30a1:b0:4b3:7da2:f393 with SMTP id
 5614622812f47-50c52471233mr17805687b6e.15.1791913902086; 
 Tue, 13 Oct 2026 10:51:42 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-50c1c120686sm15424624b6e.16.2026.10.13.10.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 10:51:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 11:51:16 -0600
Message-ID: <20261013175130.1822395-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-sentry-sdk: bump to version
 2.72.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index 322dd2cefa..196132f5f8 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  079f53404c6f8059a7ae6e39842548d0  sentry_sdk-2.71.0.tar.gz
-sha256  7beb27a22f06396f3a05510c3da6ea10e1c79e02e859993c27ce4ff074e296d6  sentry_sdk-2.71.0.tar.gz
+md5  b4ab7ff3867322c4059ac4ede7afd5c0  sentry_sdk-2.72.0.tar.gz
+sha256  0d2ffbc28ee2e63cbaf3d015e93b448cffcc3ef3be03a44704ad36ade72faa95  sentry_sdk-2.72.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2a140d660f462812fa290bc740d04633126c5ec45d84b79b569e127b0eeddd0b  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index 645b2665a0..44e102d9cd 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 2.71.0
+PYTHON_SENTRY_SDK_VERSION = 2.72.0
 PYTHON_SENTRY_SDK_SOURCE = sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/67/93/9ef70bfb7346c778caf09b7cd10c17c33f601f2d17019fa1aedcda738b5f
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/26/c1/d2bbb2b03bdc2ef14b35e02b647b8489156c50b6e0b8bacc5fa303902e23
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
