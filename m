Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156FDCCA462
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 21:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2228960ABD;
	Thu, 15 Oct 2026 21:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fmmTL5BaAcXq; Thu, 15 Oct 2026 21:52:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2AD8160AAD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792101138;
	b=fcXaLp5/lk7Z/Uq/LTSmm9pcyeq7V03zDv4lHDffyS3GwVvdxXC21cbttg33YX2R6T88
	 cMB7FusO55NTzzQQYuea0+qR4ALgbdfa9RH4SGHlhT6N5dsFHpAuyqmZR/2G7vQxecVNJ
	 xkX6XoTMZxsSQIbEnedsYnKcrs4H3PiTk20ZCz9ADdq/vuGwxJQUV/PxInY2rHBTEzNTi
	 MvD3Gu76CVnmKe1kOdOQHD+cmJnVvLP40Mc5t+R74Qu0YeMpYO2fFc0qH2FXaA/aZGM2l
	 2HM4NEti/OBM4MxnHLKdOaBvi1Zcq87BP+Dql+Pa0xw+7V1UhLiEw+aEIpMTfBMGUDQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792101138;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=pGTTrZvDJZ3fQaXETJ2647NErpbSjI2cVyqC1+nV8tw=;
	b=issfI8PGj+XeuDmgWKGDwMQHMc/mYzCY9+GTTqQy+45rStq651DH8OHliq4TXxnpme1A
	 xYzDl6lKEhwzArTrui6S2o2ApT0zh/mEGv/QsxmTu2wD5wlMhWzKvQFVPdaxnULTK+zxE
	 9guEZ6ERi7ksUTGp4g8CsIMIrq3GozvfDw32PXqiTvTHpCPzTHHT8q/swf/lBoytzMWc8
	 mvInUPhJkfSfDZ5zJPx4wVT0GCdu0hGzVNnGf/aJMZP+kN4EFNIcl07R36YIfKVcJ5dqW
	 or7ks71p2lg/c+iYAJwOvMYmgUYw5YgESN3wfSwN2sq5LqbvAB2Cd3bwxp+HHtRvpgw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792101138;
	bh=pGTTrZvDJZ3fQaXETJ2647NErpbSjI2cVyqC1+nV8tw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=O5rnCqStuxhQaSd1dbeEhjXIiE4hOD9bBvN7JuFLP/IhwQNPTF+NnyqarHDjc1GAA
	 v5Bg62nXa35X7GTmO9Knj2CRFcV/unZ8vzbRFupv/b38FJWXQr61LzF61Cnzi7adKd
	 DMq9mC26gq5W7EgrTql7UbVsNek0peA/KndFgOZq2CLwZiw9je6u9HSRCeDYCTxy8B
	 8YcKEKPrgUDIuFZuqPA6jgmfEVirUTEKckXUL7wOvgIPWYZK5xyqGTKLqKAxCexrLd
	 KvwsizjrZ95gzMtqt3rHGcZfweRUB/oUmLJh8uhRXfqCPozAs7/cWb0iSV/xv6frEe
	 oiOI4QvOceI3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AD8160AAD;
	Thu, 15 Oct 2026 21:52:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B75E362
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D3158121D
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 44XTu_NLukkJ for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 21:52:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8B54D8121B
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792101135;
 b=lLtUP1lArvdfj5VgXZNlCq8kaeZRclSbvEaHSGL/6f90T8nh4wdFxbQIosFdwIQQOpKY
 woya3JlMXuWVBHe4omlZn6zVgeOnoJJS4tXJJ89+QUMbcVSwglNVHgUcjEZEYIbbS4keO
 9Tf/G/lwGp5lClHBaToxi3SZLdmWeOa09cN9VoPjrUVo4HlqABJeUHa8DU1BTnVC6Jr6R
 SXskL8vV5wqRxR2VmWjfKGceJ6sd+4USLI3vBmMba4+TizxooVq4YD4lmyi1P4+KYjIwO
 P50UBVU+N4v3m+Cus1wdQKx4ZnW04ECp50S8rDyHBFYm8nOHoZ1qDX6afwE0B5zBb0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792101135;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=O/LMPDv4SvvYTxFNzI0k/UhBh74PlHzLnJpjuZDpBCE=;
 b=j0MsOl+CCVEftVhuOfskUIJRWT2fXNPyuJa9Y3R2krAz3FoBUFDbTbqBQpXFx3xYEATx
 BK2/VjlYRr+NAl31a5Xddw4CVzo9OFhza2HRNNRMMv+6hcBySDjJJaKIlUcxzhUFlPij7
 nzEmcKZyrQBLCKWj8A5Tp3N5hL5QhYPxvd5Tb1DNrQSW/B3FD5oRBBb3weEm+bT6LGno5
 nfu/zHLS7KVAyERtSKUqJxSwQtAyAozfSH6ePTznxVYTXJ26EbHk5iWwxNBRuf+iNNUmC
 Qw/YHEHWUp7vbBA7o0m77axBrhC2utp09AD6hJIKR8u/oD4Sr88umwI0BgO+SbY5pGg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=N6mGdAf8; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=N6mGdAf8
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B54D8121B
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:15 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-4c382ece86fso3150748b6e.1
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 14:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792101134; x=1792705934; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=O/LMPDv4SvvYTxFNzI0k/UhBh74PlHzLnJpjuZDpBCE=;
 b=N6mGdAf8f04V5R5aACgjZsoRHAzUgVnxqw2YBEE6LASTnKPFB63Bn2juhz+0c7HRHf
 DtiXtJl2NdPHGyCVcG2W0DBbcs1t8OUACpzF5mr49D5wbYXgj0sHWXVwRduy79/V40+Z
 gJijWZ0oykl9gVnfkfeMdXwODnes/T+RQYu2w0c9WcvBAQlsWa6VwFKXm/WAKSvzW+YC
 OituItJZSEyURsiwrHNV9yeMUy8xkjBmP5Nl0+eyDqcrLFnOoJuSM3OaieKBah5SewyY
 eQOhBfLnkTRpi2OZZAC8YNw9ihCbiOw4oibS+itQyeoVLqHgsss5bO+C8dZbmmIGSzbz
 s+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792101134; x=1792705934;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=O/LMPDv4SvvYTxFNzI0k/UhBh74PlHzLnJpjuZDpBCE=;
 b=XGB3HYrn+TISJsci22Qav/1iU9venYlvmvhhGAJEpVJxiD1513qAnv1DpxOt/+S9wk
 uiCdNsfdY4EqwcsoalBA71HNmH9pAQj8i34/rP5O448QC4c+1kSU60P3TcOsFOyygUXu
 efaZ2zaj/djf6hlM8M5Y/Pr7mvH/U9OrxP24vgRHG+Ii9ehoV/pUx1umqTofCpDF7tng
 YzODqko6/n6w2uyot7PCcELaGhviVpkHxhih7zxQOc3p8gEz46iWYynz45uuqORMAIxK
 cdX8VR6Dg1Cfcny0KLKcEfRidy/Dpbnm1NDRQjTvMM8UBXOzxQFvsWEpgsqGiKSl/ZfP
 GmHA==
X-Gm-Message-State: AFq9FYIgP82lBMeny6DwXuewEX2rAecWIvXro8+Loq6jxF7goNa1OkzY
 E/YWOIHfsinAA5p0cyNI6apyjEIiqFoT/MBcFbbF2fLLQ+41969anEoibZpErA==
X-Gm-Gg: AYBFou0pj+P+y/Pj56KdDHo3NmEClh0KbLLBOVuslnpdU/fYyjVNU6D2wZcKRo3llG9
 iku7gybQDIXmpjjUdpuTWOeD+ofUJMsg9qUoAvEvDmrCFnVW6P20NmW1DyMgSDlzXAYFHtU8Qix
 5Y5yw+NGr5L+yFYk3XxcLyq6RQ0sMf7FhT2b2Xh+UR8AE7FsmOYiSUsPggV/lOm5KE6yDezbCLW
 SnQBuLkE6o7/F58qvWZr/7gz41Q8bxyyI6WeBG6SH+mD7gh8MEgWAQ55EXLA4rpzHaS+Hf544FE
 qBznHAsv0NuxCPFT9dlU4m3JSjVHus1cZme7KZKfRjvOpQNO2n5D+5bsto9lpjoa8dAFAdw+g1o
 +q/f7PACaFbv/IqXOBGA0oK+OUzEE04y+1nIaa5hzs9fVnWay6BPQ/MEaGajgFa+M5YM8SzBuHv
 u50Kvk4oPSbk8ddskuxts0LhoBdIYbzsBwf+I1wNeHZaH5bkAHvKUIsOU+uHzvPvLMFbzz1Mz+L
 cHR5cjojAUoBtqOa4csK7Lcgu+9eek1xMatGveq7KG1lOnTqF+bMkrCBSFXHtJ1IPNeY2gKNJEK
 OxJN1J83z7fA5/wAmOkIuAay6UsHdB4VnYknB/SaCKOKKhukVPIu8vdwsw5hx/lRZtwGcfQMld5
 1HRBMudo4YnQYLth9m8GOT9LRTZcB5jMSAvf9Xd3WLS/Qg47Q5O+R/so=
X-Received: by 2002:a05:6808:bc2:b0:4e7:d54b:1208 with SMTP id
 5614622812f47-50c532f48a4mr19137225b6e.15.1792101134242; 
 Thu, 15 Oct 2026 14:52:14 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-53874e0e65bsm145114b6e.0.2026.10.15.14.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 14:52:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:51:38 -0600
Message-ID: <20261015215210.3426895-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-dunamai: bump to version 1.26.3
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
 package/python-dunamai/python-dunamai.hash | 4 ++--
 package/python-dunamai/python-dunamai.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dunamai/python-dunamai.hash b/package/python-dunamai/python-dunamai.hash
index 87a591ec1e..97e3f89e69 100644
--- a/package/python-dunamai/python-dunamai.hash
+++ b/package/python-dunamai/python-dunamai.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dunamai/json
-md5  f9ab2ba10f2995f10abeeac80c9d0f60  dunamai-1.26.2.tar.gz
-sha256  84ea45eddf9bb4b40df7610b1b22a03137365e6257dbf9d7b72128fdccca564c  dunamai-1.26.2.tar.gz
+md5  0ea05213f91571a94f1e081d95615be9  dunamai-1.26.3.tar.gz
+sha256  fe2f732186710ee5048044fdbef6c76c6afbb9ee7de4f6d00cf34256e9ec2e7f  dunamai-1.26.3.tar.gz
 # Locally computed sha256 checksums
 sha256  cd75c5564078e3aadf662a9df3d23430f4705dfeedebbd0ebbeef53998ad94a8  LICENSE
diff --git a/package/python-dunamai/python-dunamai.mk b/package/python-dunamai/python-dunamai.mk
index 3051dd24a1..291c1a9861 100644
--- a/package/python-dunamai/python-dunamai.mk
+++ b/package/python-dunamai/python-dunamai.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DUNAMAI_VERSION = 1.26.2
+PYTHON_DUNAMAI_VERSION = 1.26.3
 PYTHON_DUNAMAI_SOURCE = dunamai-$(PYTHON_DUNAMAI_VERSION).tar.gz
-PYTHON_DUNAMAI_SITE = https://files.pythonhosted.org/packages/12/18/020d3b27a10450ddb11429f637404e8ea67ecf4d9fd999d4f1d553f25506
+PYTHON_DUNAMAI_SITE = https://files.pythonhosted.org/packages/c5/62/edf5352d8ce1371129ccfe971e6de3a1ce4dc7f9bdc80390fb79856b78d4
 PYTHON_DUNAMAI_SETUP_TYPE = poetry
 PYTHON_DUNAMAI_LICENSE = MIT
 PYTHON_DUNAMAI_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
