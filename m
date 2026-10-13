Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF56CC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BECA560705;
	Tue, 13 Oct 2026 17:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MbG6-lyj0HxG; Tue, 13 Oct 2026 17:51:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B80F060755
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791913897;
	b=Q9it2lnYCKcN3NgwbpLhtZRu76QpQckcNEaX3qKaXXfp4sL85gn0gbtDadlO9qRZbOEI
	 +bRVSSoDaZSSoM4KlPrQ5VGaN0gNQ1DfrEkhKKKsZWc0cPPwqCqROreHmc36ZZoOY02PP
	 kIv9F7Iqk3HKuRlOs4d/bLN5KGiIU2U7tH2kMwxQ2ZvGABTtvVjOubZ/uD4QjQ1Wz1/9t
	 RkJzZGZygsRt2MeYwugRf7kZ/X7EkLRNglTcpik/j6ECxCdGUfntlU1SkE2rpSW0yT/o1
	 G4iXZc8poePPhEbmlV02cPtytZzg77tJmbclTm8W7T7t1TRO2HF5Ry87lavjWpOo3hw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791913897;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=odrLiEb4hrN8V9vfsv6ZwlPJ/H/HkWcHk7H2u9u1S1I=;
	b=MvIzSpF9C9XpLi6j4XwTwsRzbulkHGe4YQyzvF3l35QgOkr7kOb6WATGW3OqnEgiuADF
	 6wazQI8+CH2SfiHkyOJXvTqGBWaG++VViITnQxEAu4umkZIG8ZWvxOS2fSIrJ4TPEDznP
	 kqJOI2mTx2104E3zlEtTYgRhsJJ6mZWd+OV85GNPwOWIa31eC6QvnvgqX0TMYMQDkyYg4
	 V+OUNyxt2yvCU73vIog/h/UU6YTDrMBUletDWGjui3hzl5i60x62FVYFOt31cWnMPD4/U
	 ekJeJYfSrvOzsTXBuLmOCz+lfBioncwNADjy5U4GfT7n1Y0UH9y/cRMmKcmH1Hog6Jg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791913897;
	bh=odrLiEb4hrN8V9vfsv6ZwlPJ/H/HkWcHk7H2u9u1S1I=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Bh4lVlEO3XTfdvc9kNb9kMTKT4cSRj8i8OWBQyLCZNPybQcrf+v7grbWoP0ozQjf0
	 /bb4IRMnCbLk7obgQjYTgtZUZm6ixazdHtFrhi8RFQ+fXwwedOJ9PQ2jCr2eK3al+R
	 fTUIAVz3H+b+yt2bRRz3q8JDOebtjra+GcCwFSH0Y3djVu32H7el/+2MXhj/x+dg00
	 aXKkqsrllRZc4nHqLrIdfeo5Y8o0j6q7s111xiAB8gPDAi3qs30iK+aR9x6Y5xG3Wx
	 T/BvFJnOuzsRdWbo0bYHnSDW7ybnFkOnBS6jP4q33sd+/IJqC4ZCldIrfA3Zy+wyYo
	 8UZOWmI8MUBpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B80F060755;
	Tue, 13 Oct 2026 17:51:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C72375
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42F5A405B4
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Y2uKZ_NISc8 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:51:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 409C640581
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791913895;
 b=Kv/GLfiNGMbYd3kBJeu4uQvrfasaw4vvi3oTo0+x3Yn7xmnxYO4I9R4i95eVGNfy3Own
 YbtZUzDs8XCBs99EWueRns8jLymghmevUd0083rgZuSlWRBorUPigKVgH+f37hmcIrGDe
 UR/rcsZx2ergr6m8I4OquXPRWSLxAU1jpVr2mJa+xaNi2Q0IPcDUKfl6u4Ul9DiUsDKbk
 T8e+zzU7TNDGMHYd4YQItmYAznY5kKsCx2O/n0hYiZfNzmgnHm527DMLvF5kKFFz6QLEj
 6f+3NIJg+BQOsBVHCzjGMFfUmvQ3r2IhVy9hiyvahyJAY9pXqyajTNC0xgrrK1eed8g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791913895;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=8nCTEzvMil2UlOSF4aT48kjnhRnt4JZB/cg9BmxjO5Q=;
 b=QFHffOeXmqj2oYtEajD1pBdwcyJ2aXAiGOnSYzdSHWGYcjdlWA3uR+7gpqV3uPVAWhuD
 8cIxgszesol2eJJCh8RwxXABAHQ2kZHOsjnhDc4yKvFCXVyUIsNU/WHtKgyEE8g4dCCcX
 GZ/KU7fWVokMkjURWyHtHEv75t1uABeTreSbpeBuvd/y/9X6CQYNeTr5cdX7FpXyl/AUD
 MZMX1iyY9fDWgWKmVmUhZaLOZ3FJc8ylZT6UsmTQwyMrgBNLHi2149HVI32DbQAAGk+aM
 v9hFezNlbYIHwfA32BfsGXIaI+Q2ObbJ6UN+FHhpU0PXap6R2OZoT65PYBKRfLW4ITw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=GlsJwe93; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=GlsJwe93
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 409C640581
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:34 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-4f5e6517982so1128768b6e.2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 10:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791913894; x=1792518694; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8nCTEzvMil2UlOSF4aT48kjnhRnt4JZB/cg9BmxjO5Q=;
 b=GlsJwe93KZV+LqTq39tNHjNKfT6YAA1oRfLk8g77X/nXszvfmg3XfAUSM3LJtiPlq9
 mzCPpiuIVz0z0a9Wz5QGoJuv0edbReVOFt4WvQc2PRHwDgGaCgj8lrWCyxH7MTIqd56X
 kXtIMkwO7YmmTB7FcnIs/m5zUYVZnIaMxzxLrK4o4Bx5Ju5k2BA5Nm2T+ZLA86gi19Pg
 wvGhFCq/0TTekeZeXdoL6bHrg3F509AooErzEZTePbIPvnq/FY7aFUE4tR91cC3njv8e
 pvWw37gSvx+5MIBX3SUQy5QdYAbAR9fu2rjqXdsO1rdsZc6QC8yEtE52HBc5tvJ6K/ZY
 RxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791913894; x=1792518694;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8nCTEzvMil2UlOSF4aT48kjnhRnt4JZB/cg9BmxjO5Q=;
 b=TSDhREMmusKeFv+AEkuZsj203KNjzi4XiA0T0yJUSEEdaiYYt4fwveekcFZe1rfDMa
 MRUHN4B5GFgZEaRdmiT6RZMDpY4ubafjyyGhPNdLItFPXCzEoizFCYWYHS9OLY62q8Ns
 hfo7a+oV1YjvYEi+qLgXgNu+BsGvYwrdHglZHhA4W+K7emprTYPOqbdoMSg9Edf3NmYr
 EhZWaebRhimk07qf+t8UsFw6E1zXgFHOnPe2j0INrIQmOwEd0nYnHFQ3Be7awil8Xy3W
 lBP1a1XHr4pi3xEtjIEonmgbBE3g6/COmzsUYEkzPVj1LSB3aOT5f7InL0ZcaZDmyiDV
 H1fA==
X-Gm-Message-State: AFq9FYKh3ETNPqJX5Pcb3/P70/p3bXJTle1t0+9/dC9NZ+dNPSA1UKTt
 8r5yD3p8IBgfHKX0puA+Y+veYfA5skpg5GT2ljEP0gHoCdUyKuQJMWoa+hLO7hbN
X-Gm-Gg: AYBFou3AzG4Aawg0dPdOWK3ujk4gcsJAqog4PL/+hGBPOQD2Dnfiu5Rg96QEP7NcXi8
 z/Qv3UmpgjUj/ETjJxNM42JKXSiXJClWKOomJRETVa97yNIlZSnQPviSOEfy4a9YwUFpMw8Y5EW
 B+PvIoloMH36MwaiyJBEQvn6L4LDc3wjs/gmu5Q7hv8Y88Ch43mEZtbYpHld4QNCCMIkIImhkQW
 bCJwsm78QyXzdmg/XOzN6hL/XZMtLE8UI1/3Z/wj4DQWV/fjqNBih39hC1HALUT1EaitUZCz8u2
 JrkzmPkwgv8njL1rRViy3bdRpB5Iyu+f8dXaahS3ZtonXnzpXuH+UpEUWY6vE/HMghrBV/Dbjqk
 IB8BGdlomERyuCm+5HRJwZoE/4LeEsCr3bLpw8qXwa3O+GlGkXONI2F4OH9HTzusB+VCYErSBWU
 A8kBCy0GlK3sPUtGvRbQJJKQbHSg6G7ntpDBfteKYlYKWGp5Q6VhJCq+/skwS3KkFERBLgQXhIB
 1Cfy01wP5wglqBew849eRQmRG0W8u6TXoSTO8jwHJG3SnnG5FSYyp4/1CEg+HLv6XgPOlw1cKRc
 jzgBIsGLB1WiTEawlPcl7BMkZZ2yirmk+zVd1WmfN14Hi+wWhYSP3rIkS1hVJphzcDow0vO42LB
 WScKKfj8A6/cquH6lwfpeOam0yAk5s/fu6IaM68Vn2xo=
X-Received: by 2002:a05:6808:3006:b0:4ec:d580:2441 with SMTP id
 5614622812f47-50c57b614c1mr12048872b6e.63.1791913893922; 
 Tue, 13 Oct 2026 10:51:33 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-50c1c120686sm15424624b6e.16.2026.10.13.10.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 10:51:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 11:51:11 -0600
Message-ID: <20261013175130.1822395-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-botocore: bump to version
 1.43.112
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 59b04e5f07..51be01c029 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  74f03a0859f14c28ca78a6694f74afe9  botocore-1.43.108.tar.gz
-sha256  ee4f75cf3bdbb0da7912e089950e8112f692016539d939312c771499958e6cfd  botocore-1.43.108.tar.gz
+md5  a05d160b6ea2e3b8d54919585c414752  botocore-1.43.112.tar.gz
+sha256  9ce0d70e09fabbb3a2e1126d3ec79ed67d14c88bb3f064e62ab2881d5eaf3c7b  botocore-1.43.112.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 264ea1aab8..376c400332 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.43.108
+PYTHON_BOTOCORE_VERSION = 1.43.112
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/61/16/6b4477f433da2c11193802f538330ce080076c2f38d817ad437ed3cd1465
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/0e/49/58187bfb510831e4cdafd7ced8e2a748097da81e8b9799d93f8d6ebf9f61
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
