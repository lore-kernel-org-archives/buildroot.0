Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77032CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42B346079F;
	Tue, 13 Oct 2026 16:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uecdB9aXnxF6; Tue, 13 Oct 2026 16:43:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 44601607B7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909838;
	b=K+7Ls59CkxoQIgAMuCBV/HfH9Um696KSLfBvW5gOJxT8HHvytwxrzggnEzt9ZClbTlos
	 N1cSGsCYjn4t2yJUmXOtwjikC+PBQs1dPAGtQssODpujQ3rik46t1CaDN+lUW0l5FjJMG
	 H7zJj6osZ7eLsVj1fYtwUPOLzSCD/a2pBUJG7yp6yoO2GoaSZf8lPIcnZ9o+Ok9d8xFt9
	 BgRxcpUm/rvIOTSvGeZ1TmK0KKuqnoQ3G1wmG0WiEtVw8yuHjfkQTvByjrAuWBOpg6gm1
	 dwAcLnjfBDtfF1we0pu5M4y9ZSWIkp33boEMiSk0+URtLhc8lgVeWPRPnrR1iDXGDlw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909838;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=WSa1gtJ15NYT19dRLwGs9+TtjbXKBGpS2qH0/LSRSKI=;
	b=VcqaD0lJwoCiKPPczRvIer2w7/tlEyAWQ8Khp9SGJrmBNv6nn9RstgkU/LeblglW67vh
	 CocZy95Ve1dhsMb04JslR2UgFuAhIkuIGWeBC2pCler9+RvhVSjqCJaxwR+VzrVb05boS
	 7no7zx4QCleYZwz+UgfuOoUeHMrLTMfszzZAjqloIMzSqgpCR0Sv72xq5XhmT8iZ7/rj1
	 OHnH6ZEHi1iQG683OoAZhhACoKUJb0qOoZPu2uNesBbQxN5n2+WCYkxrHGHN4Ikp54BCi
	 0w56cdJvqKG0vxu1WvIhwC4NMEG52COJbXUTYtNaMh20LuQPc/FrEQ1DyC/zkaWwXsw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909838;
	bh=WSa1gtJ15NYT19dRLwGs9+TtjbXKBGpS2qH0/LSRSKI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=TlPlvH+OdqMmvP+gy6Me39q9IrXYalNKiS2dTYOUSQ5QItkC4HPmygbp5kA6VgT04
	 ANYbJ17axL4POx0EVIGLiRy82EmYv+rgXhbuUQCl+P5Su12UbBm2jKz7NfU1TR7cCC
	 woqsks/Rr8qvwCbrXNWv0L3pe6lMysZi3RIjOxIjfROI7GoKNx2KzPy6E1UgLzfIeV
	 3L2r6iib4DEMSn1MO0k3Q31S5dB81i1a49utjsVmO0CFes1ZWsTRgSuAnCMnkxoFVs
	 QuDo4oZ0ryXgTMpIGINSI7NZt6bVdltltiGysPrG+6Q2W5yXorHDv1jtrPAUTJfFiD
	 YDreeypWLPGqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44601607B7;
	Tue, 13 Oct 2026 16:43:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F1B3DE0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FF0A80C3B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d_HNuMcNvRnX for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0848980EB9
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::2e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909829;
 b=COMCsSRE9N/nzgmiKlbsyoT9TWlloMX6gho76abpY/k4zAetQGsatRUmg+76a6eXxNQd
 32jS13nWOLJXm00wtyLFlbimoxce5NxmjloRLIvPzZt5oMIWPpNo8R+URDXsk0LMlyA2u
 vD6X1kYO3KK/JYMMM1/AeShVhh2hNEWwaV3iRV8RgnM642qC14HBzdvfMzbNPaDUFtRY0
 hTqRSeb30UKsPvBk3FWGghhVJuevl88HhPiYms6zMkJ1vW8z9pObqFGGnAzezUiGE//th
 8/dONEg9aT7wD++rL6VpisOElkpZnYfzsuZ2WqMxtCy9vjFlpxrUNdVL4e1WBbrFu8g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909829;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=LmzkTx1eXXJT4GmAgJ/Ev+Ffyw346lBmaVIUVyXGA90=;
 b=bGTT9pbbClUoNvPSqGdrwcPpsUC4csEDvE+7TpSnUbQ9VeQdmZ8FveO7hgiask068SxY
 XCwjGDLJG2xKbHatQ9u1VCplY/nnGO2bFuR3AWCZsxT/Z1IcJ0jSBQmj+73Hk87f4iejc
 MbBKG8JmZxq6ryIraBe0gg0vwJ1lDFRwWyc3gYxNOlNFKFm7LLqnBdJcK8HmZTI1ntC1t
 +qDGy2CJ5uvj68q+N/q4u09gPnkuTvelPb5daKxrZexr01CPI/51Q/p9DYDjmvWaTIZ0K
 5fylIG8vMLW2khtUHZFCGHN+XufqdsBPcbDJ9himHBFoPa94syMrHlM4rUqCX2dSXvQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=LBPj6Imp; 
 arc=none smtp.remote-ip="2001:4860:4864:20::2e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2e; helo=mail-oa1-x2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=LBPj6Imp
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0848980EB9
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:47 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-43bf9548df4so2828037fac.0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909827; x=1792514627; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=LmzkTx1eXXJT4GmAgJ/Ev+Ffyw346lBmaVIUVyXGA90=;
 b=LBPj6ImpBQdM278mjM4ZTp6FRBe4dnFob1XdmaezARBQVt4y61TNEdsl+F7yd1XdcG
 RZ/pri31nd3ZgSusAoJaUXbL1HCqEa/vBlWZ/1F0Lg56Bacf3t5rLaOQG97C0Cqlievs
 izM8nyp5D6MGsffocPI1pPdZl6tr6D4x6nMB5C9F1ViELs5+bKUcaE3J8DIDmBh+DUsV
 uGVqG03HzIUq51QuLkFgM3u3wIj3gXshB0zA+6mT4dg74fE4pe+J4PppuDu/ielEPck4
 +LZnxeKdacPjy8aHclFo8YE7X+D4XbkcuUGQXZX/lX4S6uT96cPB6o6nFDVeHcff9QW4
 pzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909827; x=1792514627;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LmzkTx1eXXJT4GmAgJ/Ev+Ffyw346lBmaVIUVyXGA90=;
 b=1q6E4IVJPp4YYi+aH2FDv+pAknCVM+Fx/z/1dTamEKnmB+pRsAl0SDTXJYn9lW17CR
 fyxsTiZ7zxUBIdqpvFzxFQSBkfMqkBvaI782+kThTsdmZdU139V3lgGRwOlFJLtVnYVo
 TFgvS780KguM3Zi2KYHi0KHLjBqYW6pCi3M25xHGmKiF09AZn+BinZGNiWwZVUp4tutT
 +kUE29vxSEvu2i6JxGVso+Cw1pehOIRFZxMeDbH6vhyBRBtURo/AwdXWHNmZv7guMOzU
 HYICmJhudjXxCvAdxcapkMzCqQl1anOd6LAfz6oYRj5aZzD3wPf1ONHbvyy3ueTBMo7K
 wDDw==
X-Gm-Message-State: AFq9FYKLJSa6+piSuo0uincLOUyR+BpLtyNCHpj1JZbuxDilJBHiyQRC
 dqwsKh92cJuRzZncY0IPyFA83sCPHrFY5+8c8hzR+jPZip+3s4ooEFOw0M9wjQ==
X-Gm-Gg: AYBFou0qhyjJSktNGuRMdv9XdNBqZUIlnJul8YrIqFWzYfuE2gfYXYrL7ONhlR6iGMj
 W/g+NeLZZrJ9mn/7/33Bh5Yt3ylE+9VlpiVDPvUheublPu0rrY+Xooy0ZH3XKxy7i8oz16Of0Dy
 U1F/mS74P8qJZEs+g29K3xgCDbP1KyZecnZ6BDFOB66bcv5UnDuz0CiUq/Af4SwGuZsvuzkTk9Z
 NngTggJdjkVRu4BGz7WYUH4wA6c/Nx6cUV8oynVbyTk/qZi2g8BvG2sXb/mZOqxVF31QmLA8BkZ
 6T5tQiVxKjSSgWngSIMmYn3Kqc9Sj3OM/VQ9TkJb6x/fQwXvyh8ypOReyfKRgNqjqaQM+5bzF+o
 k2bF65m+qV8010SJ8TfpnHRnWreGPKewgVrg7rbXKRbarU9qlz0Nts5V5XKI7DOtwgHmQ/LmIAv
 xeFlUSrqgSEGJixZXbQEEHoOQJYl2D7I/52f821zK+iQH43bz/6fJTWkLlUCoQap/F2G2sH7eDM
 KA5yfmxoYR913wxaxbl2dvNXBRii93yuniN7FFAyHCwkZ5dG6WoHp5RGSLqQMKp+qtUtizwYUiZ
 r82olGtNOI2kegJkmrWnWHOQd+U5eJCDCjmR88cd+WO9KESMSrDWiAOyXs/INL6VY62CacyndE8
 FF/ZhehFPEuK2Csh1EW/YFfrzV3p4ZgG1HcdCeu3tDQFR
X-Received: by 2002:a05:6871:710:b0:479:7931:cd6a with SMTP id
 586e51a60fabf-4a2a8a00ea9mr10680514fac.32.1791909826740; 
 Tue, 13 Oct 2026 09:43:46 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:42:18 -0600
Message-ID: <20261013164254.1476592-32-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-soupsieve: bump to version 3.0.3
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
 package/python-soupsieve/python-soupsieve.hash | 4 ++--
 package/python-soupsieve/python-soupsieve.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-soupsieve/python-soupsieve.hash b/package/python-soupsieve/python-soupsieve.hash
index f2c11f1315..443885b389 100644
--- a/package/python-soupsieve/python-soupsieve.hash
+++ b/package/python-soupsieve/python-soupsieve.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/soupsieve/json
-md5  411ed4ba0a31ea6cd7025bda680b0834  soupsieve-2.10.tar.gz
-sha256  49e9380d7d2905463583bafe285e818c7366a9ed7b3aee221c1ac79c905d8bc0  soupsieve-2.10.tar.gz
+md5  85e7244b0b5d685ccff8ae034bdb6909  soupsieve-3.0.3.tar.gz
+sha256  7dcf6022eed0399eb9934a75e020148f7a2024c37b7dfcd3cf2c5505d69c364e  soupsieve-3.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  76a0acdb98c3a63681e20b6f096699ef8cad5fb35d56eef8387e0fa71d797a9a  LICENSE.md
diff --git a/package/python-soupsieve/python-soupsieve.mk b/package/python-soupsieve/python-soupsieve.mk
index 1c4279ce06..c29fb74c52 100644
--- a/package/python-soupsieve/python-soupsieve.mk
+++ b/package/python-soupsieve/python-soupsieve.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOUPSIEVE_VERSION = 2.10
+PYTHON_SOUPSIEVE_VERSION = 3.0.3
 PYTHON_SOUPSIEVE_SOURCE = soupsieve-$(PYTHON_SOUPSIEVE_VERSION).tar.gz
-PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/71/c3/1b817965ac12dc002d7c9cd7dfffdd7d4fbf9b45763ef2ffe7b86ee94670
+PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/5e/77/2dcfa996b01702ab8fd0763d84098f6a640d6162a328f1c04c2697579a1a
 PYTHON_SOUPSIEVE_SETUP_TYPE = hatch
 PYTHON_SOUPSIEVE_LICENSE = MIT
 PYTHON_SOUPSIEVE_LICENSE_FILES = LICENSE.md
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
