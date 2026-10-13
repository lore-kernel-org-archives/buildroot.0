Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CB0CC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E132A80C6C;
	Tue, 13 Oct 2026 16:43:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZdKwm3193p0; Tue, 13 Oct 2026 16:43:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EFCEA80CC2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909785;
	b=GrGmmpdlU/x3IPJNz7K6ynClbxwsnFwt8+xJkAuV6PGDKsGmkeTSdAbI9kgDcZxICz2D
	 JKBJUAE/ly0UQ35I8IBTuH4kFLx53Tda0pnNeDwT79ugg03ZOuKVw+oTdE/rWqKbpm4+p
	 fRRv9lPEH0igWyQjtif5n14I/k7RxAX2J3drcUKbol9TmUBK0QKbtVfPhAeDamlZ+mWj1
	 i5clSmfthtKQxNC/M2Gu2qk//Bh/IdPwd0xWkEY5fhuDm21ZsDrhkO/BcaYkEeTX3xkYH
	 jysZEi35MZrR7Ny8qXt7U/VfPxjV5gBn/BJ5K9L56vjuBBCHHyX+kNs6cf23ugIEG0A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909785;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=323SxGlzhRxu17OHuPqpuAYrvGEVDuXmM4cA74NCf3A=;
	b=H/h53SbUERY3QYOIBwUJ4e2e5sI02QoJ7JCHk4edQ41+UmeTtcwpOyols8WxBSMbLfXk
	 Lvg9Owr8yFf5AnP8UT4PZjHRQFyYBSnbX2S3EinsiTHEEj1HXJwNZC9K3EDfPECpFafZ2
	 fHvhNkYinIOc9Na2O70rdQfY6vloXQzj+Jmx9h5wHsw0vgCJaWhPKAdTQW/hRJhJmoAii
	 uHBqeOhRjEnFUsAh6YMm7xI5POH8G4dIEOrNvCEu7DOEoZ0m9t4zb6DNxpvKUQPaQnuvn
	 sSMGIl93hb5z4266fIB/6tT+WnKlOHCnHfAQhH8zLiQsFC2YwdhF6isVr/QHrJp4g5w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909785;
	bh=323SxGlzhRxu17OHuPqpuAYrvGEVDuXmM4cA74NCf3A=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=fAbGudNbYWo5bd9c3QTVodBHb+xuhvd4AQjr/UFNt5gSgM/m9JNS53C36+GNsXz3s
	 g7IMZnoCh6eh2QtDZe4VP8iRTu8SlptuF1X74HEBecbm2p+01lECtQF+3EVC5F5DkO
	 4YtswsGNNYCLP06pQ8ERGQWY+1mVqbj4oyZ+rtjxswyxEi9RHqtYFEW8NJSVpAsEKH
	 LR5AWY+6irm9uVLfDyKC83DPFThDbSpRGuwdKbqIvuL2LudgKZxuEd1gqGUAAF8Wwv
	 RufspsykfGTDkJqmbG9bYhFhNHh/Vkkm6z0DLhETFwDGSfO3Isy9z+sDexZQJoC1cP
	 8nIQ77VQRO+uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFCEA80CC2;
	Tue, 13 Oct 2026 16:43:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C7D3DE0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E4BC60643
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JCpZaBOE61QH for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 611E1605CB
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::2c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909780;
 b=aaYTmzUFvTX27PAS5ZlzAXz3pKGCkuyPBtaH1t57G4SgDdfwCc75yHerfwALRHDzLILT
 m67mVMdJSHtosR/HoAfX53JFGT0pDyr1zy/yxBHndnL3FqKqIGn/Q1GfGPyv6gdayt4fr
 Zyb8dOwb8MzuCQCx9+DZGhOxXQdNvg/2tmBZGfMRyKEuT6ItOljT71GVFPDtIErySLdEo
 3MGTPecuZq574h5HrX6wArGxyyENtLPFj5tnvQ2aNo55NfTX+fkoJuq/Dm4EwZvjoo/o4
 91vBpvTwa+PHCdd32k+nMTBnjBk7ZGeOWaKuB7Hht31fsaxXi99Wa+ZftLLXTSiDSLw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909780;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=BGNQ7wmmhKq8hVbqHKoD/NEg3B9oW55xNqlwAOb9IWk=;
 b=bhmfgqsuoPEgGrYrF2bHTDdQYzHGoAD/EMz1clTUk0kJVc+V+njbHuflxzg02AKw/1NY
 DRsZNqaLRq8QgLmfWmwyGgzMRfAMleaYt4VzGZNxcIyheKsleyIpkixTtGrrMB7yW9P8i
 4zql+RCKOD0NIM9k51mLkitdYH4532gxJnMLY7U/LHtl0F2+rwsZ/XYKT5WtsekkoikJq
 Zd5FzoqYwXdcRHqooitWCiLlzOCCzwOjUquNP+6lVvLa263rwBuLvoPL4YIKP14R5IXzm
 T2UnQwD+aKsDGYSMX8YqhcftR99Ni1u9c/0GSscFo6PEL5HpuEIKVNVhPMSuvBe8Aig==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=JR5YMm0r; 
 arc=none smtp.remote-ip="2001:4860:4864:20::2c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2c; helo=mail-oa1-x2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=JR5YMm0r
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 611E1605CB
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:42:59 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-49dfaa16190so3789134fac.1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909779; x=1792514579; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=BGNQ7wmmhKq8hVbqHKoD/NEg3B9oW55xNqlwAOb9IWk=;
 b=JR5YMm0raBYLYr/0WB3REh0nCYy2URy/UX30WGITgBRK0COKahA8Z81pEWSm9cVAku
 CSmi7fitaaaRzi+sCUOGK1ikRPD/jMqFMIwy3yGRAfKY+5/a+8a3SsvPxDEzoVwUTiQv
 fReCK8GRf7o4KTEXQ7HOfXm5ZkTkv+C8zz9meXjsJBvKjsXQ7BQfdezN0oau/Ou11WMH
 XxY+c5MltmzxryyGMHFYPVEYLR1GH+vO0mFSuSSs4ta4ro02I5tPBL6iPnDrHl5xgNYk
 6v8Jn/IDbprnPnPNzgEXmtFJyPtL978xobGyY5YBrn9dGXClEOPCLE91+7ynzfnRfYRk
 itCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909779; x=1792514579;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BGNQ7wmmhKq8hVbqHKoD/NEg3B9oW55xNqlwAOb9IWk=;
 b=U5IsbOl2jXJ/uc6a2GYnjz+jmsjcYhbFS2yJue9E+1+ooF322SGw6lH129vWu2ZJto
 uq+Ti0k+RFshSssBD8HI/17FhT1hhUnQH7iSNke8E/pgSSuxdS+hi22sahtB7Wnyjd49
 KgLi4YkVYWDh/b1qyFEF+k5eFPmHaxQ+5AUCn8hE9SAYoxp8XYBNsk9fZ0kbyNHMNupn
 yQ8Xrgs31hXENgHpIx4r5ZpEssCjv6vkI8/EikmSXhj3dpxBjgTWsaijqwDkD2uEpktW
 KlJe26yKY0+TjAASTaYpSMkSnki5x6cFABjJvh71kZqExbcRgnKN6kqayXr2JRVP9WTV
 zqkA==
X-Gm-Message-State: AFq9FYK/9FlMPbOWxnhxwdxcoSCsoh0I5FD+aicSxUWDYjTqjmQNG4vQ
 18rd7sRpWpaOAkK0s0rkrn+u25bA8y0BcxNDkiiuvMYyOT7oKkUKNCGqDrJgGQ==
X-Gm-Gg: AYBFou16r1OeOqTzsYNp168OEDEhq+XpAnjLvKH2li/7vsA7n/5tzjNQMnobCjF7df9
 JA17POJQ6SakWXf5Kg1Ka57IGmv+rM9wwe3UFBuJUCnAsJdCsy3LWihZiygNy8CkxRZFqJaeKG8
 0zk9AYRcATykrpwdvjsJ+VoLYeg7CL2O0ngv5R0i2DE9/3gVGik5V6hVxxPnyavF0YX7PJwvkFL
 ROAsc72qy+WayezPpCj3CRg0xS9J+x89RU0bAjcbbhtQRMGC/qbSWuX4APYcDXg79FoF5h0rgpi
 lH16X7Aot61XWwLm1HgFdzNcEQeby4vvHy6e8zqxQpyoSRe/MWtZezfcNtr+tDfDbQ/e2iD9jL3
 wAZIQY3wFGD3ifGi76wiTPND6BbCC9tjbLlvbWkuPzFI4T1KGOSNUa/mCVR41iJeib0JTEH8B4O
 X7X+RpFYA3d/fur94/1Pxi5sqAkQiURVt8EvvnQWNWp/aWT8pJQ3MAe0hDQRmlQYg01pnylbkI/
 O/KE6iCfPweFVKH4UeDqL8OGAPF+1Sv4QGVS3zaN96xtEwNws34soxOLsdsbcmHw1tLgWp1JLZz
 /Qo565gj3ZFqJtk79pBpIIp2NKNyFw8kxW+bPVhY7kG3EWt0WQ6da/cLhdn9QUK9ETG81tRhSNX
 D1zoL/Hz6yJFWVx8OanWlE2MCOplo8grfkfgOLSFnk4w=
X-Received: by 2002:a05:6871:3841:b0:49e:404f:5f21 with SMTP id
 586e51a60fabf-4a2a89d1db1mr8794744fac.12.1791909778887; 
 Tue, 13 Oct 2026 09:42:58 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:42:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:41:49 -0600
Message-ID: <20261013164254.1476592-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-cachetools: bump to version 7.2.1
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cachetools/python-cachetools.hash | 4 ++--
 package/python-cachetools/python-cachetools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cachetools/python-cachetools.hash b/package/python-cachetools/python-cachetools.hash
index 30d162f443..59c97017d9 100644
--- a/package/python-cachetools/python-cachetools.hash
+++ b/package/python-cachetools/python-cachetools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cachetools/json
-md5  6e88355ee27dd4c21a817cebc3c3c6b6  cachetools-7.2.0.tar.gz
-sha256  bcac1a1b8da6909994a2957238a57b8140dab7c5c5c69a43669654fe87a33c1d  cachetools-7.2.0.tar.gz
+md5  4ea5f8d2e11ad9db332ad02758db0164  cachetools-7.2.1.tar.gz
+sha256  b1a7537025c06abf96fcc1443e496af9a3fb95e774e70e1f0af226f73f7f2dcc  cachetools-7.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  28c000b52b0ee27138a68ef778227e4057046e86b65f62f1cacb99b0cc49e0d2  LICENSE
diff --git a/package/python-cachetools/python-cachetools.mk b/package/python-cachetools/python-cachetools.mk
index 19d4a6877f..cda505c404 100644
--- a/package/python-cachetools/python-cachetools.mk
+++ b/package/python-cachetools/python-cachetools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CACHETOOLS_VERSION = 7.2.0
+PYTHON_CACHETOOLS_VERSION = 7.2.1
 PYTHON_CACHETOOLS_SOURCE = cachetools-$(PYTHON_CACHETOOLS_VERSION).tar.gz
-PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/29/2c/3f18755527b03ca9ff6be724bd5370cb777c76a87f17301377cf04a4729b
+PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/31/44/71476a5812da1ddf2c9a3efd31ae76d01480a1cf03ed13ac28aa8f2402e4
 PYTHON_CACHETOOLS_SETUP_TYPE = setuptools
 PYTHON_CACHETOOLS_LICENSE = MIT
 PYTHON_CACHETOOLS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
