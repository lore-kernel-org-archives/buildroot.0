Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F10ACC6B38
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 19:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85563811E4;
	Thu, 15 Oct 2026 19:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O5gzW6F66CbJ; Thu, 15 Oct 2026 19:32:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 97E49811DA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792092775;
	b=QcEgAgXw81Pac3SOJ46WyZQM3Xsbz7DSWdsXg+vsqZaSiyqvMFE60UjVupayX1wUukxF
	 4iD93KgMhrDI/43LSsxBWUOzvbWoKL/+dAtgxAhivnDfad5C4k6nvPT1GRFJni2wMgTI2
	 CYwLg2wcAKLoW9RlBCPq1/Ts/YvdTrTPmCZ6tSOvZIEDtWDp9kYMkvIGG/YQknt9UIRvy
	 SB8hVtedH+9xozIFj/KU2vz5ZvSFBBAN6ws1TaYC1oeYyndf0sIIaJ4eJOhsymZgcry+N
	 vBnH39sXr8sKnOqaeN+jt8p1ZxrBXEuBVI6m8TUjkCmWdoxtQweNRt91Jk+8YuikZcg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792092775;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=On7nqp+sQ1yBQQhyunFy+ArItkFE87DPvyH/QKbW894=;
	b=GQPH6l7Pfb0GL+6MVLjZs3Hb45sRPPIjssLfGBV/l4x2N1dlzDvVFN+qxOXI6TF3INSs
	 JuwQZ2/H4qqn+6uETjjMUtDVDIqScf1YBhjGNdcsWB+2mLhxQNeJ4TbJEnUrSTZ2tt6/A
	 omCWUOZlsPtO58T82AA/aKXtBO6c0qW5PPmEHYLOALe/63hhbIjL7b1QFp6Ju0Tb5ONnF
	 E2RCIRDDT5oced/QdlvfYF8DqETzsaNSmYZHSK+JHl3rzwHBquXplOu3y3Mw5eMl/AwKG
	 X/emZ5izE2429WUy9SwPyOosqsrJLEWyOITS8vZjgpDqo5kuYxuPlQ3RtmnHhrz7IsQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792092775;
	bh=On7nqp+sQ1yBQQhyunFy+ArItkFE87DPvyH/QKbW894=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=phf8CHUIExSbvOPqvAvDJxbSaJFcEjhKPJLu+Hm2qLMyzaB8DFDEpEZeyhZeluLFB
	 /XDRSs2N88xCAIVEd7/nIGClsu6PaXp6IQ44jyVDlMKDFijv5ztvZy7u4Pqhau4aTl
	 yyXpnYGRZxgVLECZ7J3XIhSYXfVaZ1UoWdNG8NvoCQL04jI4fpFt53OJqNPiyqmuuj
	 mfGhM4XhZIKwUFgcgvWouiTnNR9SbY94TKG2bV2CkRhYzeomQLIGzVW0SKhYG+2O6X
	 bUW3cnekNUqMuu2Blz/ftf4kLUTAikJUea8pzF+8aAIQyo+CZmPhHbSy/SEMudmui/
	 z1QC86tcGkrmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97E49811DA;
	Thu, 15 Oct 2026 19:32:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C53C362
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E4DA40261
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tNcDoNdfO7a3 for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 19:32:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 790DB4005E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c34"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792092773;
 b=k75VPSoX6LChjZD0faWHCUf/arFcpUSIdhLpKgtd2bQ+aOVt10jlzAfeVo6/x++JYFef
 TlxIoG4Z6UjfbhHL5AlO2qLiDVbN8+Oz/My0DPQgrB6Kq5aaL1CTbt64BRX+undFJY6HG
 IQMY/V1D8WraPqlp0qkWk4RO8VDix1/ic16+5pRYIK17K6n0UVh+fSWlH5d9rdJ1e6VxU
 VXBRjY8amMFZVMKYo60OEJVK+hlFEJ9XF8QfapSU+GovNVAgBaH/L2CQo9mnN1IAxHm7T
 6Gd6QKlQ7cQo5bzrzyc0U0gew7PUt8upWXK1u7D12f3Thuj/qc7lzGtzRoZGCIpZosQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792092773;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=t/EqybullRSGHYdS7B+ys8QuRylCzzVJ2pDCFky7eGY=;
 b=oiaMCixhhv0TE/RsUzBHqt2cHgYL5AnrntQQvleS+G0qiPUTYUaH4ZTym2VRWEfGhwHp
 yRZZ2WS2/clQJ4NF21OBgisSi1xsAafsUx8WslHdHVtqR+v+GdArICKj14Pr97fZ3fchd
 jovl0aZovjyleHIrjLTWFl18hA/ZwIxhrI32D1Rsx+7JGP4Sd6CmBYGT4ITvk3EITP924
 JwKNKRKggmeAMORICkLKi9jgBYN3uOoerTVoGEqPZd+pYq2uIUUiJkXPHIglEz0aEcLyl
 xoAhTwDmbYaf6ekjIio4He7voEABRjStA2y7vY0S/N+SsEJK2YNgcVQkLWvnSbLg9Og==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=KApEFmpc; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c34"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c34; helo=mail-oo1-xc34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=KApEFmpc
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 790DB4005E
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:32:53 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-6c1983dfaffso1830075eaf.2
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 12:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792092772; x=1792697572; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=t/EqybullRSGHYdS7B+ys8QuRylCzzVJ2pDCFky7eGY=;
 b=KApEFmpcFid7sJlzi4co6PDlsQjJwfbJDC9p6ZlpGYYfYv2/ua8KNnfApZYXZhPn4j
 9FKFRTSHlNlDJAy6hIyL0x9l4j9l02B3ioRuw52Y2Y7oFeowSBClf/spQnKB6laFoq9h
 j+0hT08GJfC1ymHNdFBQSStcFEFeNXuoQPcK/9+c2WUQ5NDHqOBDnvWWEInA73NUvusF
 RdkHBeoRSR0Hj/OPlTtt7bw4zw6SSlIu3OeTPT3ngnxkCGHpwOsY1aO74UdXfwckHOrB
 z0x6Qjh97qQ3E1x7SU1aVsZWoHhO5eqyhVyf0xOGn4+sVvYxZDAtQp/aqFW1juojqliP
 k/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792092772; x=1792697572;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=t/EqybullRSGHYdS7B+ys8QuRylCzzVJ2pDCFky7eGY=;
 b=HX3zkqjnftlxWsK6K+cBbqvfZJX3GC3ARSEeyO3t1YsmwY9x/z50NGaL0FToIPtAIs
 8+6RrnbH+FA7ySilL3z5/uS8iNShNKmWlrPvBHll1w94+yhtFm6X3YrWaxyelkShtvn0
 bnRnVGIcdRH203uuUA6+Hfv+05hpti3kk4ndgPtxBPSp2C0589T0bvi3kSGHnOmbc/iV
 c/LCZimlCq6D/a/Shj2gWTseHi4iWdigJPc2Z+PyfGiAGOkGidJGI/Gf31LX/vr14Cgu
 +sNcd9Eo31KQ5/x/bdDxjFCRhXMsspJcS8gnhwSbrSgBxzjvp9D2d+0Aprqkoj0aTcFW
 gZxg==
X-Gm-Message-State: AFq9FYJF83RVepAdy3skaFIZc6IcIYu3cLaHxNAfP7DUfa8/2d1Xgp14
 g5ghfu6vEBFThkA6yDji6ctq92XhVVvoTFKiQfCus+P5/gkfQJYPve26LpffPQ==
X-Gm-Gg: AYBFou2y3t5bL0iHfCiy7gK6M7L0Af/PsqqZNgL68jPBbj2YDbhyMEBFo8VvImpgIhA
 qgYPMVeSMq6mxATUZOZU6sHGA9m+jOfoOMSCmR0CqafW8MKztJCMDa8E8BpRdewo9j1bY0yHjYn
 yqIk3SJjdwvXf/OBFGcD8hpM0NQG+D8oZA02kXRaKixpLe0hKH09yVzQeSxFpR3bfSbdkqFVW2M
 VkObe6mmEBeLsyW/ILCNlVDhBq2T7fBkgVGjsHpYqWn8h0L4bWuon29CzQ/mEyq9T1EDRNsyveP
 rXl6Oe56VIe2Ek3+CGOYPMPUbAyTgSbWlZ1RyknLHHqzrxk8O3IScysO98EEFTYDyena3bvmPlO
 Od9Y0Is6pgmN7UFw1FD1AOTRJ3ONn2R9TZJyWmRgblXc3oWl3vp9fkvexO36C6iFcMJqscRyVMN
 GYqClJaZIvwzJoWSpzoLan26m+zacPmWw8/qbviCh5UTCNCw6PQzxjrBmQgJK037+9475xvdNLs
 KwvjR9vxDTSTWBKjEX14SEtQwsXzF5/Cby7XELEMvtnVIHzj/zJxrt/my2cOpBkS5XU6krGYmF/
 oRHmGJODoM3DvgN4KhGa0dcwk4AYbqjAE3hqgtGLnY6QEwraeC2Ps/85qiR5ZnodxmiFvce6P8c
 dFwQIw1ha6j7E3lsPqiiS2aE69oCq/1Qubc7UxgVHP8A=
X-Received: by 2002:a05:6820:3390:20b0:6f5:eeee:b22 with SMTP id
 006d021491bc7-6f5eeee0c9amr7962762eaf.49.1792092772082; 
 Thu, 15 Oct 2026 12:32:52 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-7018f2df328sm180045eaf.7.2026.10.15.12.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 12:32:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 13:32:35 -0600
Message-ID: <20261015193243.3299884-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/9] package/python-setuptools: bump to
 version 84.0.0
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
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index d0ed270e9c..51e7fc67e4 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools/json
-md5  82e1d67883b713f9493659b50d13b436  setuptools-80.9.0.tar.gz
-sha256  f36b47402ecde768dbfafc46e8e4207b4360c654f1f3bb84475f0a28628fb19c  setuptools-80.9.0.tar.gz
+md5  c6919a4b0862ca30604559e163a6cce9  setuptools-84.0.0.tar.gz
+sha256  f4695c21257f0d9b537ec2692c941d02ee143b7cc1276941349a546573b2ef73  setuptools-84.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index e013000c57..5c5a41531c 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 80.9.0
+PYTHON_SETUPTOOLS_VERSION = 84.0.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/18/5d/3bf57dcd21979b887f014ea83c24ae194cfcd12b9e0fda66b957c69d1fca
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/6d/44/f5da03a8ef95d369145c5bb53050e7877c9f3d312e128605fd9504829143
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
