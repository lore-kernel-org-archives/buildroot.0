Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8C0CC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4707880C72;
	Tue, 13 Oct 2026 16:43:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2lRTX9vbZ0LB; Tue, 13 Oct 2026 16:42:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3DA6C80C3B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909779;
	b=NGdH4i75dn0mQs5tbgbCM4jfnqMbLWBO4j/Dj3TLEGb0yuCqby8L5AjE9s7IDAMsBXW7
	 pQjOivOtz1/9vcEY2gSW/y323Bt2bMnWEasQ4QGe+/MaNYKsqdnvOCUtPjLBHC3YIk62V
	 Yc/KFD+NF6mRYHo9qVi3NPYZ+3yduhs5rcHj963/5DbmnfOOMzdWCBHRuAkXVTWje1EfS
	 mACJJrgs/j9DiKDtNPFbBY60gNf2zeVNIHLgA0NBp968ZO0Pf42/WEYTRBOnsOYdf2tEX
	 TDtxEpKiV2NBUr4AQFBEQHwCYtlTOG0k7SRV4UxpLj0shBYWUuJEfyslNgN4uwu20wA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909779;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=uMFXZhsWdVMhCC+AvIp80/jhCy9a/GoKOxRln3iRZik=;
	b=Y3RfjNx/LiWMXK906xfyYVxHTzxBbYbY3f1CCHkln9zazOWB27wdYUgHel3QiEvEyqAx
	 MQXBev94hwn4rTqUDIJS12FdRax/w8rw8uTA/15DMicUItE5bCGChE+VX4ip36GnHgLEN
	 o+nhnMqaqXwkKg2O85PjNgJ7h2wc/pEXudXD11qK1FcYWh4kXiXvCu3CrM/b8O3E5YnDi
	 Zyi5x0iMaJ939rQB+fd0nxOu3zWxq4MVn4efL/8jAV8q5S2AKs+p6xw3k70n7FEmRoqLA
	 2AW7cq9np3AZOhshgbAL75PVdOuEN7qZTpS2b9Ep2MZuMzxviCBAPuTLE4WocIXL97Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="OOaJb/M3";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909779;
	bh=uMFXZhsWdVMhCC+AvIp80/jhCy9a/GoKOxRln3iRZik=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=OdzYQcNaITtHr47CVNjDjrtRHduvwq55KQKLzmsL6znxjX13vSHebRKuOurxoigI0
	 Zriv08iSFkuMSz/DTKfwK0pxK7OsxVIcshJwbmULAwhx7JPxk5at/pLgBcA8lgfsht
	 v+fjWWsmjeYltpb3stE1TzsslKlCN64frfslcPmIJt7hZ+DF/9JOW6NsKu8SbIfjPj
	 j3acH+b4mdeCUr+ml2MOYu9EiwDgZZBy9m107lCQxO5XwPwN5TwvTzFLimMscKRttt
	 r8C3b51gWa5SXC+Zf/1LiYJHMpFXs+txAtTvJ6rY1GHwaSvMrN5Awi/yQPtqF4x4B0
	 49RlqIOxjYc6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DA6C80C3B;
	Tue, 13 Oct 2026 16:42:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 80D8CDE0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 729D780C3B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6thntbrMyZJO for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:42:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8C4F080C06
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909777;
 b=eBQzejlYoMDXKpyMwfE4+ncEvXOVrRwfEMnWdEqUWpAerpCrT/V6DQcWG4SXPUU4EKt8
 2Sms5/yn5PdY8eVGHydTxVrma00B2JWcUlt2+jdui+p9efF2YhipIjWMINqy7FZCfEoJv
 UIHAQB05YABRQIjoOzdKY4uM8GrNPI6jiTzvBFf8ZygevUZKplHCan2lT68NcFHTCeB+T
 M+37pbXoXsX0rZaKQKyJjMHIX6lRIrQJ+hwr+zYJRDtRrDLEiVtClpErLizsykyxBdLQg
 7Fgr47xOmmazCQ365i+3PfflnW8/ctlrGlfeKdFYuaNp0BIDzTuCmVhjZiSWGowfKAg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909777;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=W+mzkD3ji2nlRWVaW4d1JAVCwC8SK3UFyNLtTvLX1e8=;
 b=acz6BHUZuDLkoZ08EjD2Pn5ndrebYV0+fo3NIgWpPU3vTI7VsOaxH1kXnFlCM1OplM7G
 LNaUhWLQ6BPSrKljDLpbi+0cO+QjTCPcWclifsOwKTCrUVtyaF3RaT7egHkpJedKFzTvf
 C5jIuRRkj30YQ2wOvayyivaI+Uv8DhnkGNh3w5iS8YJ//ZuHfQipIo58KSHMYPt+QEPuh
 5DkDbfq5z76gZXYQOYu95H86m0D0AuounOmZg1+4VPuTyJXtoiz43zd+y/M1VyKu6u+K0
 I/PxWuiZjBqUrGiRGQzFPAbKbeAz3z8f5L+Aa7Z9plcnV4HZL4s4GxapXeev671Hb2Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="OOaJb/M3"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2c; helo=mail-oo1-xc2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=OOaJb/M3
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C4F080C06
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:42:56 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-6de2f213b7aso1337255eaf.0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909776; x=1792514576; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=W+mzkD3ji2nlRWVaW4d1JAVCwC8SK3UFyNLtTvLX1e8=;
 b=OOaJb/M3K7UUP5Yg6ESd9834egOAvtow74DG52jLMf0prfuVExHzPvOaPPD6OFckPK
 gYNZSXwZBh2z8Ch0Gyqree9zZ205YF6sjqHVj045lFQK6mfsEaI6YbvbJ4RFlBC35jb5
 uJS834NTSq1/M3Z2yV91UzSWcaaxJHDvE/d4v27mAvcPp2ewDIE7A6kPHhDFX/bW6b2T
 MxgW+khdBr1vcGWhm609xy8gtB5CL+fNqqJUOZ48KveQazOO2HeB7r/ZqpB+PryOjPB6
 MKPg3+pXJS4I9DxblxEF3IriJO+FqTBBc868LMWMjZt8ZDLfRHw3Vts5oZPIyT5ZtuCO
 n3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909776; x=1792514576;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=W+mzkD3ji2nlRWVaW4d1JAVCwC8SK3UFyNLtTvLX1e8=;
 b=AwTmfvEY8lRGk7K6UbXjllruLkiAUJ+A2uuzuf8zbuJOHk7Z4X0rtOGPc3s2OYyuDb
 Wt5n3LLJDAAPC7Utc5no0on7Ez8OqSJ7rqlR/wReLFhG/7dkL4/eMb0im6E4+UNEQf59
 KB6cT54aqDdgDZOHVx0+3NN4dn4e2kuovkjBEZgPv6lSyDQaepNyBCjljv/g3V3yrLpl
 3EC9moltI7XnhHMnIYtARMU6lrvejhhBJnCA3sUvPK/Jo7b1aBsKEC4QKryluVDu2BDD
 AC5mqThrtQcUSQ979BK8y3DYGRoSmIWm+4eKFnLIvZH9Fbf8ILunE/coYi5ZsklFdd49
 7bAg==
X-Gm-Message-State: AFq9FYKUwlXrGrFdK/ig8lc3J7G7kieHBsVLD6PngD6yueyiLucWrEHL
 +V3x3NG/QPznmkAXc2mas6bnCYAaHXoxahm0q0AMbzAN52bT0gqW4lFPweBKcQ==
X-Gm-Gg: AYBFou0iOq7FFZdKKqoA4ARaO5hSSxxoAXvt3zaAqgHeKXkAXqmArnvGRK8ilCkfho2
 vgb76xplCA0K4nxx3SeiN+02j4YxgCNSLRyw2xoHslFaLkw98ZV5Y7DiKKhSiU9NiroBblXvPJ5
 t9qvbOpeJaVTjWb3yyZQgAuDaW1td38+rr646ApwMkf0GPFSpBEx4JMJrD6nS8Hz1Uf3o1+g26R
 dADiFTipY+d3JwBSA1Oinm12PM0+0maIWyxSt1JVukcSdlc/Y6Gx0Wsnt3F9o5ZShnBrIKr7mDW
 rr1Hb/0PCHMrt5Whrb4xu67CuPf5Qn1wGzzZMU8FmCgxaHXDt0RHUQqLYC8lg2UEb2cRphtA3eI
 nMcwds29oVHyczgp9ViHrf68Iov3hzJGfZuSoHUrKRv6+IuH+uuw/tVFNxxgUR66Pxt9ItowwBt
 y/G4GBPG7vl+qfrCFR/G1KnPdI20CGn0gZS0ER8bmRvYCeHl3d6zPW26CiJRUNwDFuQhiYKPWdl
 nFJDXn7fLyG8wHFXa1Fmj3qxbDmxoFnwp5yLJ/yABe9jhEA+8ZvzTh2NxjzplLRFoFJvOjHXZ7k
 OnKy1HapyCTO8u70phoafkbAQ5a521f+exQO55gN3NnaazqOL3EFk5fZ1hM1466a92kRwcvHWJr
 aRpAB6xMcd8YTIjezscKf+SfU0csoAYf/SfaB46ckuQI=
X-Received: by 2002:a05:6820:1c84:b0:6f8:3d45:b469 with SMTP id
 006d021491bc7-6f83d460e66mr3305313eaf.86.1791909775833; 
 Tue, 13 Oct 2026 09:42:55 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:42:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:41:47 -0600
Message-ID: <20261013164254.1476592-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-aiohttp: bump to version 3.14.5
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
 package/python-aiohttp/python-aiohttp.hash | 4 ++--
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index 13f6e2be21..2bcd068ec7 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  1befc420af8c5cc860a80a629d66cb00  aiohttp-3.14.3.tar.gz
-sha256  9491196535a88924a60afd5b5f434b5b203b6cc616250878dbdb223a8f7844bc  aiohttp-3.14.3.tar.gz
+md5  c31a05528821715778ebe0e56374c4dc  aiohttp-3.14.5.tar.gz
+sha256  5558a7f5a05af9ecf744af91e5baefc436f93c9333e656c27ec253f9a6bbe178  aiohttp-3.14.5.tar.gz
 # Locally computed sha256 checksums
 sha256  2e4be5fc6c4c72a466fcb665d726e049a6891981fe536c4f04b6366749461d23  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index 7f48f5a19c..7667440a45 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.14.3
+PYTHON_AIOHTTP_VERSION = 3.14.5
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/58/d9/22ce5786ac0c1653ae8b6c23bded02c1686d11f0dbb45b31ce128e0df985
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/6c/4c/bdccd81e9ee225b69c60e7766c9a5b05364f118f4d383713b89a682d772d
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
