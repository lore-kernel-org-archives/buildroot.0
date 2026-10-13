Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D8BCC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0BF6605CB;
	Tue, 13 Oct 2026 16:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tfo_Bz-vM0fC; Tue, 13 Oct 2026 16:43:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D8A0160643
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909795;
	b=GsfoGp+G8nscGOnvl7VJUijtweGIYOrn8uakdOF2jOS9HjMmJ2YzYDacPwTs1sSUVWA9
	 9A27F6+u9cC+q7iemecoX/lEfTTqgBLAaqL+7tmeKMfbwo65L068gwlEh5d6+a4jrEvxf
	 O4DA4ZuvpEMgw/UkEFu95ZfBuODAtw/xLAaLOKtP7mA6qt+rf0lNYBQh3MSVIAvrokCF+
	 B4spSqoz2Ce7w1wrtJ+AQ8JEPL1lyYQzBsiZRvcBbi/L/DurnTpCWQP0H2m1X+JNa+hz3
	 jGFWnJL5L8EM8rhE5ltw+N4dFOfPc1IpvkARWFxq5i119gMaU+PoFzuIDj38XLAeVxw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909795;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=gfNew+PBMyk9QuZR6NAJr8A5YPgSoFeiG1QDyguA4nE=;
	b=KiCvd8Ak2M95xBaQmWhuFE/XAPQ22jKJookHJodGbbxLpPq8EDwrLJno1fKJ0yEdPbg5
	 RC3vmG1OmrWNkc+OrESD4IO//zrYPtkirfLvJU14JCySHckB2fZv+rHG3AiFGDcx/vcEm
	 w8IN+IF04CTCeWn1p/g4Xe2kJtSPqg1wvCMTsOzvCwZbwnxK2rXJ3YrW1KDi+oMj4S7Nl
	 z9Ko/llNIDK93pO9l/or/rRBmIxtPNh7C1AY6FIaXiHHZ7imhJsxOWRtCBWOFF+VVIPAR
	 azMT5kyvl4DOBsNClNU5NxwXB2Z/kgqyjccJ1QlV70FR7S2gluA9MnADdAZNvYsRz0Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bRdrZMDV;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909794;
	bh=gfNew+PBMyk9QuZR6NAJr8A5YPgSoFeiG1QDyguA4nE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=QZiAejs67QOKcq9cig7yKd2Cbi06yRe++Qc7xAa+abq+QAgUM6e39ACau1JwCmfOK
	 8p1Dt1+HkeODrVTuMcMx/R8aZcuR18C8s8y4is0ZAMLRlcECEI8P6WaH3q+uJygpH5
	 FEqTxYLixpE+f6iuIytlTPdcoLOIUQUYt9G1zLTMF01BUTAKsTleNmZM+q5P+RoCwK
	 9a7eKrf/+E3xtMld511j7T8F2g+M9ypa6ggrkpRF61JsbA0M5DGSas3p9zNcR7ko++
	 eO1Qkj9IHNUtj6CmGj228+NlSp0YBvltbREPAbf9e4hZzvX46aPCnmRJEZ5a3h8aMQ
	 32UOvCezjLKTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8A0160643;
	Tue, 13 Oct 2026 16:43:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B9E59DE0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AADDC60791
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKMeIYlwG-eK for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 98AFF607A6
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909788;
 b=QbhKEgqRIduSEHJTV0KPgD4D/Sz+RQwiJRX2zhMQcMqwksNa9pCPb/trBSN8uYdLcCT2
 8udoThVSK/M5FubLDDrznjrgRFgPuTmhs4g8kdp2hib/HQyS1dHi749c14eOajQcYghZl
 CQ3tBJOZc/5gJAmC6OZhiPC/MFRBtNZJSoRQ14x43MTgTP+k3Dv18fpW8zBg6FzrrG9+e
 pIaR34lsHzKak7vZdIce4FysXKs1NDf32Wyvx1WpZ3NQ2lMT2SelLGdDuc6weZwh6eoG3
 3ckPgtJx8F9Lz8Tbi8vdWDvkfUbwnSOT9Kc10T3mOoqHoJBHFxnmexZppQFxeaT/I/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909788;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=lNGaRvC7B+cN+B2h4qfQreTwTlyGxKuAI3sk3boeLpE=;
 b=hWvysLbA7+Sc44awMPaJYhhIvtk4VRh2vMrbAiiBYZ/pDde5W3LOsVPOLF5++gAzXF/j
 FI/t+iywYXhDtKasmP4MJf60wbbKQ2KqA40yz1r3TGRq8Xdbo77cwLITrOuZqAXCMpq+X
 DOwiQejR3eJQYlrs/a+r7/Q7tUimaPFof7IIBifPGrqby7dw34kkxAK5cp0+kT7+kwkPp
 VEYM2N8c2l4X0sGwXjqfxKQp/Ef/6/9VlDqybEFPC6n99t8UMMX6ykjpOYjDEJjDT/39f
 Is5Vbzig8Pjj0ljiB4v82RngTOv5GyIaFYXGwJulYxscccpbs3n1sGV7oAA/RAb3ZGg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=bRdrZMDV; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=bRdrZMDV
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98AFF607A6
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:07 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-6deeeb892d2so1824000eaf.3
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909787; x=1792514587; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=lNGaRvC7B+cN+B2h4qfQreTwTlyGxKuAI3sk3boeLpE=;
 b=bRdrZMDVNf/r9Cdz7lH18an6LmH8PNp8PKIZhmd6Jeob9vUUT+W1/X4IlRHhJ8GK/m
 8xe1tkPMllCktRslKJyQA0aYQtYN5t5r0eXViGAyKV5utpKIFxx9AjtRI4d3PMy1rVlY
 V0PY/TvbuHmn7p1YiICODCvRwpj9jqFTk5wF6VCUpvkDB3RDoZgH7lsZNbrPJY0k0Wa1
 Ttc0Uvg756iPO3To/WJz+UvRYljO3k1VH52wLLyGUF+IbPEVFwS5NVfAyImKuDEDuiwt
 3ifNMNQsbUixLV8rWvbytEdGcZ44KHwktOem/fiM62Hkf3VHhkliGp02Occ2LARJlcGn
 0uxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909787; x=1792514587;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lNGaRvC7B+cN+B2h4qfQreTwTlyGxKuAI3sk3boeLpE=;
 b=qtQE/gmR25hVS6kNw1/n9Ia9SJrsCfUdj7jW1x+b9/qY5c1nnfI/6kc+zIecKBGkhA
 hLE06T4XBvlOPl/t6bcmlpwiUx+eK7pEeB4gaP8ocKwfQHpSAz1wIKK5J30gG3ag0u4G
 d5mBft6UY/oo3m5VstPY0sSuRbN1X9wE+7FBev4YmdZjLM3oSN0Ow+iL/dsWZZ3SZIWd
 tK0ZEg2ySCIR3WoEw97c5co7MmJxBF45vy9ANW6GIWvsdgI4NpVT+FtE+MCA/Yj7fA8d
 UGLBKBavU36z/LA4YiLMrwyr6dzRFI4WSFu4gUKvmaV51dwvedqT6KkIDeMIHP7Z3u8L
 ahLg==
X-Gm-Message-State: AFq9FYI8FDZD9bSJn2C6VHMW8bIqivXairpF40N6URu2lR+JPTwMrgMl
 mXITZN7SAYDlcMOKZmd38mmj7Vv817eSAGQOM/AzSmo4QFM4n4BPqxPdrm8PAA==
X-Gm-Gg: AYBFou3voYqqxPwpfSEixhqJ92oBcFObXfuB8eArPa8J5W+h1fMr0kJiJYPQ2ARUvtR
 K/lpGVBXPa7xVbKgMeXs/bWcXtnv0q/wb7C63n0qRuXKGCRDRkILOsulNyyQzIcEpl6/djLJ7aW
 Cj51JEKnsBFLKYW30MsjDF1tMPzKUIPmJytGXyLXq/k9xiYkr+B54Zh0mv/YxIDuT0R21xk4RmL
 tq0eXl/qXFKpUk8uLiT+JmarKq3YTzYTX52NXapwKvFS4lCMH3CvvAxttCZ5+Wi2VdBuuC4DOox
 7yWOOI6uZ0jC/r66pRGGoeaBB3YMVstIpzUOnQd1ym0V+2Cfz1NJHOWdk/PaP/4f75h76FU8nle
 PPXK+4GIFO7KVFtVUazZ44HmSZjsyeKXGFhszMqtysVtJEkvVAyZPiWT6AwHUkUtZrlxP6pAWgu
 a5L2uIBQagcZHwnoFIcNIl6ftvnqBH0UhaMX92lp1FXPxuoCF3KTo7zqrd3altAcA6WpTHUMfgh
 Jl+gvk612jg/RxPAdnN3A48SkrmVMt7VVMjDmDVCws/Fcaq3HZYVIMdYCt4zSaoHVphTjhJX7XV
 yuNqsHoCH9W6FUNpItfN8RyUSZ/iz2Q0/3o05sJf9AI88v0n4O5VQWcWCwKbZLDA+giLw+sDg6A
 rj5AKye20YhfypO3VzWi65NRRRZKwyooyvQSGziHyX8S5
X-Received: by 2002:a05:6820:1f05:b0:6f8:ab9c:343d with SMTP id
 006d021491bc7-6f8ab9c354dmr3309461eaf.26.1791909786824; 
 Tue, 13 Oct 2026 09:43:06 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:41:54 -0600
Message-ID: <20261013164254.1476592-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-executing: bump to version 2.3.0
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
 package/python-executing/python-executing.hash | 4 ++--
 package/python-executing/python-executing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-executing/python-executing.hash b/package/python-executing/python-executing.hash
index d9220c224d..48e0a110e8 100644
--- a/package/python-executing/python-executing.hash
+++ b/package/python-executing/python-executing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/executing/json
-md5  02588d10820c930874def80b2fb60c4e  executing-2.2.1.tar.gz
-sha256  3632cc370565f6648cc328b32435bd120a1e4ebb20c77e3fdde9a13cd1e533c4  executing-2.2.1.tar.gz
+md5  b5db783d29fa2002f6eae5996e1cdb3e  executing-2.3.0.tar.gz
+sha256  15919cb5d667e5cb4e099511971d00d659573fff2dd5c4e6cd8b71636c7858d2  executing-2.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a476a2cb0ef4c41450340a577a28b91ac4c7f669136b2ee148047fabd5fc4181  LICENSE.txt
diff --git a/package/python-executing/python-executing.mk b/package/python-executing/python-executing.mk
index 0545941d5e..e182dae5fe 100644
--- a/package/python-executing/python-executing.mk
+++ b/package/python-executing/python-executing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EXECUTING_VERSION = 2.2.1
+PYTHON_EXECUTING_VERSION = 2.3.0
 PYTHON_EXECUTING_SOURCE = executing-$(PYTHON_EXECUTING_VERSION).tar.gz
-PYTHON_EXECUTING_SITE = https://files.pythonhosted.org/packages/cc/28/c14e053b6762b1044f34a13aab6859bbf40456d37d23aa286ac24cfd9a5d
+PYTHON_EXECUTING_SITE = https://files.pythonhosted.org/packages/52/92/8a611141e42930c0f194f7504063ab87dfe970cf1a5af28e7703df448734
 PYTHON_EXECUTING_SETUP_TYPE = setuptools
 PYTHON_EXECUTING_LICENSE = MIT
 PYTHON_EXECUTING_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
