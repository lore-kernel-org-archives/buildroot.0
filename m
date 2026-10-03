Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA2FCA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AFF481367;
	Sat,  3 Oct 2026 01:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zobyYO8MVG4y; Sat,  3 Oct 2026 01:33:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6826A8134B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991215;
	b=sKfcrkhfX/RJ9RhtdeFnoAtPBBgCGMkS4TNxMfaapAMY0lYuX/7l+ExUaPIcxEgSvnWZ
	 IOUAW6URAk09N2ReJEdqw2CM7c2xc56EXzkZxrqdfo+oTeLFfN0kcUch3OBVL6QDVAM6N
	 /47w4ZIEoeQBcRu4+/SH/QHTH8tmbnLdCgUrenDEnxuZV2CXixi6ex4o45vy7vOdnt1Eq
	 /n/rLLAgWxkHb1H1zOs+4cFNlRvqzuaV3l6QKFrh8qefa54bARl3s5pm1Xx7nYz2EuldI
	 aRCRDFTByhq7LVk2FYQcniwRvFRexIIvgr172iHU9zLBjg9d6qfA5lylPJAnI0U2zzg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991215;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=AGWy88w5aH4dLPVJc99RbwIoTHompkQJOIqs1HnbHf0=;
	b=N6MrzOyoggv3vN3ZpaO8XkVLfguJT0ozh/H9vGzyS0c6Quos7pBKQO2amcifMnQ/qlbr
	 OxfPqoDCLuyVxefWgwADoNvmMP6XfFkci7MrYHWtTww2v8tH8OVrIu3tpTF6KawxUSEd1
	 C0+puh0rgCf8Rj6bTR/9SSU1UXqLl9oYKR9E/kfyNH/4lZNZufvc5WETXH26V+O42ozpd
	 wdHsQyAhmMYDCROc+3z5uzI6OH+XHqPQGriuDjpb7+Di+kKj2hb986yIOaqvQcZRxic/c
	 wHmuYsYtW2IebQktuTWAySAYNSQupRsFDpD0K0BTGU63Y2SYpglfaAEtripmtXWKqsA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991215;
	bh=AGWy88w5aH4dLPVJc99RbwIoTHompkQJOIqs1HnbHf0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=mvxO8eIWL1y17B+aTaaypIe3b71rX5gKaZVY65/TgSyeGtRJfPOovCj4RgiqgR1I1
	 nHBrH1LbdAMhB7QDgUyUZwzYLZiPGocSObOtjmWt7KUYAYGm3do039AA5xS1ZyhAm2
	 RAvGesoZoXHsyMpIBOWaTgU0n5eWoEfFUsd+wdrQYFzEmYepC62H6S92G/apTX527+
	 U3O+y8v5dTGaG9Cn/bYQjgBrc0gCjURHAXszrk2lDuFO2XK83yWjkIMkg9fdv3O1+m
	 1Z7rdfYO5sgSVss7EgYGjevgQG4RXmmUpwMWDA1HJEgQnSHm/36vAZ6tRXTyke9b7E
	 g2Rmq6LNZL30A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6826A8134B;
	Sat,  3 Oct 2026 01:33:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E5E0E179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC59960648
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 12YomioKML_R for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C071860DA3
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991212;
 b=UFA++WpAqX9wFSPRQPh4s78MQOhCNMchB4zJbqsvk+sKk6Q4aar/7BTISQSq3xVB+HoY
 vlv7Gya4s4r4bMuXzv5pBgWFnam7rLTPSyOF9PJQ6LU6E4Pz+kOLxpsrp06P67cYSytNZ
 8y7x+WlIQ8oa1NKj8BZhAChed86qhHA9kYn8KLCqvD5iORVAWSxUypXzBZhmq1LeAfbC+
 BfyOKksR77/1jp5+pB7s/WXyOXa+IvYlcGXyQ/27rPFWVKlwTWDAGAfftJnwm7ExVbBYt
 GQrG+33GyFX0gGInqzEPHeK96+bpqsdcdhhzyXsCvLKCBqTPQ55c/vGPEIRT16a0PXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991212;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=tN4cRlLNQEP4vgcj91MbRS+QRqzFqFDa2AIk6zrH/I0=;
 b=ML2On/kxH177g794GHYnEGIKSzuyXIoRvrduTqEDLkmm3YBptmwOwl+A6iQtxDh6ExMu
 AjEaK90IOdIczJ5XUBamWs403sgNiZanwOuz+UR6nLIDYLkDaeRakkJ0iKSMN3Nt6cpLd
 UBYk8sr/KQ8rYLauW9Y3EbfjPtBwo8m5KvBmMeHL3HQDqbJ7/oP0DEzFM5ANSajBQ6rCi
 A3W/UR9nvN8WtpNgnVmvdXUMSl3IJHdtOr4uMT9yIDk+o2iSFOQHpaVOmDcWR+42APTF+
 owejgpYnq3d6zlf++Z+4GPv2WJF/Yo3ufX0R3tr88S6CGEwUl+NFYVCoDKI2b9ZPxVg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=JiSlz+YL; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=JiSlz+YL
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C071860DA3
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:32 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-82389b6da4dso435383a34.0
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991212; x=1791596012; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tN4cRlLNQEP4vgcj91MbRS+QRqzFqFDa2AIk6zrH/I0=;
 b=JiSlz+YLHM9wLxMr31/HCKCRatnDoNBx33IcgQ8X+47iITeYUCAxAdjx9Er3YeR/X5
 bQHoUgdqhF16K46a36NImVcPPTk2pulsCAS+P90tDj3T5tTdEkPtIkQd1eQBLXA/zbgO
 SzPfQCntyy2sJGzALJcjysZTAApqR6ZQ7GFMYPlrL8mT4jqiKadNTEVp2QUqxvOiNfI7
 vRz893T+xFTxP+Aw7itUXJjGUQCECrxjdax7w+zjWNZvqa6v/JEekTVaVnNTKhiMCLZJ
 51uTChI6orRfgZGndc591aac2xu2xQ8FWs1QQKNs/PK9+FHoSX6WaM1zRJ3oFERceDNV
 3cCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991212; x=1791596012;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tN4cRlLNQEP4vgcj91MbRS+QRqzFqFDa2AIk6zrH/I0=;
 b=Il7OhDV3J/IagNo4fV9gulZe93hDRFg9uJdPayoq83Ah0gXSc7CmJtcWBataHvlVjE
 tyGCOA8tlOpjlMtTzzAZuGeP369HWmjWOzNaihUr6G7DPM5XT77x0ZEpJsjAW1dnHAtF
 TCZBoHK4KSYoDDDjM+OCWdRTCCO6UBWBKDnr6qxUiQG5+sFV8ImKpf+UsrsetyIG31+I
 3I1zxUGMd0YCzEw9bRV5iyUyNKD/FSdK6vwivjlHQIl+YBVSE4nyvqLckZYG5ShK6vSo
 HSfkkjkI10mR2mr4BYJ9OyP1n537wRj04DOhEAbg35Aa6wxCaumw+hT/V51ggu5rqHQf
 OKaw==
X-Gm-Message-State: AFuF++mwtPKBd6ZC4jYt+DcaBej6BsGfaE4ziTxMWHvkbsQfie+zxLWq
 /NsBLn1FLs7afjeltPVFxy01uMEdjsv9f8m7UCKxnoqlMtW2HKPXILSAOAbYjA==
X-Gm-Gg: AYBFou04qrb1ohQFAi/xibOF3xJd5ywuT7mBUXFxBpx9uNFbpbJuO+lfmlRctLXzNj7
 sTsRoZ5QFMOQBKU14mzee3Dsvf+zGx+WlEVY6JZDg7DVV47BieaEYhYYgZMhmifGbyih5mDMwBE
 9v007mFKa2zHdA8QC5T4dmKEkXtlEOJaiT1QBu0iO8KZNV+V74cjWFWAVtPPYz+v2hY0xXTMSTZ
 tQ7UEZwbkL9mwMrVUtPdmphgzkUZmv6oSq2A0f7ua1IDh4Op/++bNz//rgCx+53cIoa9IAbV8s2
 mVgNkmW0MBYavp1DEYLP7KYs5QUDPpFCtgBsL2e+ay6thDeNq4RmF6tFX+1BrNOeUWeR5CU+1po
 bIregiXiJYmCRn5BqXwszzIR+97sWXruobSx5fy1P5L5oFWrIHWnh1LZ4BoAITKEnxlUVLGQZUA
 ibjXzyqeMIh09c+7SyB5AtxQPyzsenrfXukzTlUymd7M5QfHXdQje6RudqgYHwTy+vOlLMoe7lN
 DKYod9hD3tJMxfyWI+KFIW5RpkwabUGdZ0jYlTuYmP5fyl9B2RIaCO+E+7QBP+S7f+jR/AE8m7J
 VniB4KRo+jtQ0imK9eeLWb2OntCT6znvQ/NOOzycdgwRsFl8fOmrdjwMXpMI/A9okIO1M5+WFLz
 Zcxkm9N3v1+vgr9Mn1Yq/+ogtay5nwu1corzPcJKlQg==
X-Received: by 2002:a05:6830:374c:b0:80c:d34f:5f66 with SMTP id
 46e09a7af769-82283a6a621mr4870995a34.31.1790991211812; 
 Fri, 02 Oct 2026 18:33:31 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:16 -0600
Message-ID: <20261003013304.400979-16-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-propcache: bump to version
 0.5.4
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
 package/python-propcache/python-propcache.hash | 4 ++--
 package/python-propcache/python-propcache.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-propcache/python-propcache.hash b/package/python-propcache/python-propcache.hash
index 347f232927..1564f0591e 100644
--- a/package/python-propcache/python-propcache.hash
+++ b/package/python-propcache/python-propcache.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/propcache/json
-md5  9efab9358cf05265dbee69297e0de96a  propcache-0.4.1.tar.gz
-sha256  f48107a8c637e80362555f37ecf49abe20370e557cc4ab374f04ec4423c97c3d  propcache-0.4.1.tar.gz
+md5  a0ee7b9105e3b9a423278af3816c1751  propcache-0.5.4.tar.gz
+sha256  ff6b113f50bc066a698db5d944d2c6dc7507168dd3341e255a8892fd0715a558  propcache-0.5.4.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-propcache/python-propcache.mk b/package/python-propcache/python-propcache.mk
index d1f659498e..90f1cbacbe 100644
--- a/package/python-propcache/python-propcache.mk
+++ b/package/python-propcache/python-propcache.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROPCACHE_VERSION = 0.4.1
+PYTHON_PROPCACHE_VERSION = 0.5.4
 PYTHON_PROPCACHE_SOURCE = propcache-$(PYTHON_PROPCACHE_VERSION).tar.gz
-PYTHON_PROPCACHE_SITE = https://files.pythonhosted.org/packages/9e/da/e9fc233cf63743258bff22b3dfa7ea5baef7b5bc324af47a0ad89b8ffc6f
+PYTHON_PROPCACHE_SITE = https://files.pythonhosted.org/packages/b3/9a/9fbf4e4ec0c2d7f1c32519fff782ef467859b8faa9fbc5331a96f6395d43
 PYTHON_PROPCACHE_SETUP_TYPE = setuptools
 PYTHON_PROPCACHE_LICENSE = Apache-2.0
 PYTHON_PROPCACHE_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
