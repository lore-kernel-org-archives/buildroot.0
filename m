Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A858CCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 02:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FC7781291;
	Sat,  3 Oct 2026 02:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MXpPKjhWBFcj; Sat,  3 Oct 2026 02:23:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6036D81289
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790994217;
	b=kqt0rdEOhAhVEP7jiikg/TKBQnTpK2s0jC3LHAvJcovxnjGKfqgBaJ3Sr7bdAQKPzrjT
	 JbpZB+XNGBYZu9RD+az7vNNxvCVkznbAEYil0usgfCRcZFsHIqoZKDvbXrWULC+TPcIsE
	 rCHN+8fqp7OiRz64Cs3MuNGU0IYBbmKaAjuZVptdodQMqTjxzLsdjUuwGLvrLSYKSMwx7
	 +OtjOZ0aj4XSJvATIXa8z9q66z+7N5Wgi/8Ynid7M/Ql9mDZSutmTMocidPfiPdV/Zc29
	 tjQZm3kDEpGxX+I5/MmCVbU/eSBRoT2VfPuVQjNy3t+mp5Y5hqoSurLEdQB9V42EkFw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790994217;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IHvW+bnkwZqwxxc68mvChnZmXPeVlNreZfNmQo1pY1E=;
	b=CRe/GmYC0FF+qIrfM3pLdpHf06yg4AdtAo1VzuK+gN85ey7Grqlqr/90LmjuVL501CZK
	 YGdVfVq8iEqj6cB1XBXW7auMAeh5cwHnxiG0LeWMfhVPwxXEGlhKyIduHf/ejcU2RjoZg
	 ODOptG9dMwcnjQ7bshhSXcJy0+rJVNbVM6xLL3VqN5vJftefUdwTIdPBamRORYCwJbe0Z
	 dZhSnxfO0oldu6I5yxVO/fqkXjheDeDshP2ovvlqK/SWkriNT03Nm5mrkILTHkpcd9IXL
	 +cQt0sL3Eg12cRFzKABvFVRCEYIu6TNWKKHSxLJgm1trHhK6Z8LCntErVtZSbdWtc4Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790994217;
	bh=IHvW+bnkwZqwxxc68mvChnZmXPeVlNreZfNmQo1pY1E=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=C87T5CJ1LrPZNyFUBWGo0pn2dlIxybi/t2EaB+qPICdlwCg4tpEbqjYe0yGbAa5h7
	 GAQGXhWWDGJCum5oOSVcSEh/k5aaUCH5nH1Sxmtj5JokRZM4/tEtwWY0fI682UdDvK
	 iQ1ha+ests/mhZfEWdtGt35yuazeltwGBsbBY4liW08qZMwPrfLmb9J5OYqRS3EP0j
	 kbPNU/JsM7v5wuSx/dAPbHGsMK9rc+/Uc9xofxP45t16fVwclZm2un8nndo1TFQS9w
	 DVC4JQ6a16gs7NcKuie/l0bePmgfVDik5c7nQByswGqDLTZKU+3gYjnDafBPQo7b2W
	 23HmYQf2xhaGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6036D81289;
	Sat,  3 Oct 2026 02:23:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 97E0434D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 02:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DC4740A2C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 02:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KbkH15GXIPc0 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 02:23:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9B32E40858
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::26"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790994214;
 b=QnDrPesyonIEJxuo7TL4UFyaOKogfiPyVU2x+MUn3qUe69YB6Ma3OoHyZnd4d4p45QKl
 eM97ViCNdmM+scyT4GT5dfA0M7PFqsUowbVwIyd1k8Mtrr1aaFXtbZDJ/UXOYII+mTpmE
 0c1u2eytdA20aylxYYi6yel4sDRmuDfibYX0Rrin3NbYy4/svVDWJIIq2uKiBD47m1pkV
 VVIOZzyCjaL288d6HnjH8UwkuPCo2z3V4a6+ieylBej4+9/H5sA6thAMEbjVQCoXTmXPW
 hSUp4OrkWYYqtms5KJ9ufnc5yWEneMJ9s4oXdvWZZhRWJISWpzIPGga583XN/cwfNfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790994214;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=tBVmWa5JaJVSsAEJtGBs29K3U3cTTETyWxis5X+lqXM=;
 b=d8tHoi3EWIZv82VZDEuD/EooUXq6Crjm5RYDFyAHlS+e1sZffZA4VHvfLeE70NNs/tvh
 0QQN641jrXgVWhv7mJBN0+i3GuNalHw+3e6MPIaWw3mnpueDZN1ptdq4b3fMOp1pTSA5r
 3sbDIuRyJHEHBbSTzjWcqD4p2+yPaiTi8ajSLbJmv+UcuvfA8Za9SIuIcKskafRO0Tyj9
 Ruh4m1/KWfssPlPKHd+ssnPjhdtOACmpqsHpk284/qXZJ9VW4JSFS5eiIdy7tOnYkgfNy
 kV49VuossxRdxDDMDTzMU/ZpKPna3yTjRh1oLJTuO70zhUTzjY++KLXL9GnPgZ07J3Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=d4XzL6al; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::26"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::26; helo=mail-oo2-x26.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=d4XzL6al
Received: from mail-oo2-x26.google.com (mail-oo2-x26.google.com
 [IPv6:2607:f8b0:4864:31::26])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B32E40858
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 02:23:34 +0000 (UTC)
Received: by mail-oo2-x26.google.com with SMTP id
 46e09a7af769-821c01c2fc5so522036a34.3
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 19:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790994213; x=1791599013; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tBVmWa5JaJVSsAEJtGBs29K3U3cTTETyWxis5X+lqXM=;
 b=d4XzL6alCEygaW/drVtrmDiuJlbbWcrtKUd7C1EsfIKhG3iQPlZXD4VzgizC0je6Am
 ClsTCOrGN0Cti5byBckdKXyBxw2LbChCEUaqk7ZgxhON3co2ShW2z5rQCNp4LniGHCWd
 7amPqKpXRcRETIrw6M9biVPE1wOERQHy6n3WREGHdROKlfycj1xSZsHltVQ++V25bF5w
 0QKgfh9bpk/7J2auayWX5d14eTMVJRTEJEwwf1tv4VmVqsvEZRY7bLBLbfjV3Tu3mlmt
 qrQK25D+7Ye32TxFw4hA1QpgU/UI7MSlQp6qxfULcXkqOUNGnrgiNDEE4OsbUJU8wl2Q
 SvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790994213; x=1791599013;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tBVmWa5JaJVSsAEJtGBs29K3U3cTTETyWxis5X+lqXM=;
 b=J4tXrVUBBzg9QMVSx7zEERGdOE6wWbiQbfNahsvkP/ATglee8xyc1XkAUZ2A4bd4Q1
 C8rIbJsrj7puUG6m5T+Mujiu3/8rhbd1fSN749L5ZlndcNWpkQzIAgPcFk7/fKaGiafS
 WBstkKE5L7WKYZk19jI8pw1jqzSKpu7poU27NFglSEMeh1JRCFdAZv9ZRsGTLYHnyUjK
 GpYv6Xrmi83G5i/tWqfczcof8mhRafT96H2V8ZI866mFxLOly/1HScGXYNKdJXhrWSMv
 5atpu8tVSkX+9yscexyS6G24i6Exj27hQN8S3lwFLMmp+VhRxaSgkkSy/T401wlvSX84
 GUjA==
X-Gm-Message-State: AFuF++mbEdbPmGi0sfr5lEAbZWwnImlJNoOLlNrZcnnOiU1yb6EdCO6K
 gke6DXgM7t3k2Evl16Lu2/qAWvmxEncoAJdGnTwmq3rTMFSxvxVFYCM+K8vb0w==
X-Gm-Gg: AYBFou2eIoUlTy6hmoh9M2g5VWd4bfAKfNcMdBSvt6VknUvjnRM9k+0VVrtRtZKjfH6
 z6g0hDAkC/Ku5z3UArbIROkjXwqSYUREh8g4zYbWyO7rNH+Tu4sae4hnXWwHfwjs7APbiSigkZp
 bgL5T72LCzMTM75PilCvKGDr8eaL/D5MG2uSPEqgaLNubm5isLUZwCxeNuBKIUSZOu3hvu29Ec6
 UZ/FFr+dLVRaMA2zKOm5dlyyEfHw8SzVkegzhy+SW5+RW23wFT0sB734XZrzvZEbTkgYDLC6AoC
 CR1CHTGL/VtXJvoaFUS1/AUcQmAIUHpOfg9Q5JOkoMEWnx/I1FlyCSvZ2FysN0x/k7WN7tyjEv8
 PkeEXLjVktPb8R7OLyy5H37qbvXFB1ffF6oATovAIGOwfoQLgiv1QKMnmfNKry1CpcJXGYcN5Gx
 /2VHdQz00CEaxbdyJICE8twStfocxOrreq7Gx4kbtWoGr2JM49R6hbC4bUUSO76JOahBGjACUdq
 vJFWsmB5Znl33p+u9MjsYKEWPsXWBfjh6UC/p1Xvz9ft7bFnVDtHf2JYD1nh4+IwEDRpGjs5mfx
 qcO21sCL9J3307VuigZ3LCCKc5FftYmX/lRykgkWZP0tsZ5jyhJMcQBpv3MPd4Lq4EvJiA4RJXW
 uzNPFojwlUZs0/hLMiVCTdWy9q/tNQ0ygnaQfbkldcY4=
X-Received: by 2002:a4a:e913:0:b0:6dc:6e90:f649 with SMTP id
 006d021491bc7-6df304cfb4dmr3749896eaf.3.1790994213191; 
 Fri, 02 Oct 2026 19:23:33 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82279d738bbsm4956061a34.15.2026.10.02.19.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 19:23:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 20:23:29 -0600
Message-ID: <20261003022329.417669-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aiodns: bump to version 4.0.4
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

Skip dependency checks to avoid requiring pycares on the host.
Setuptools reads the version statically without importing aiodns.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiodns/python-aiodns.hash | 4 ++--
 package/python-aiodns/python-aiodns.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-aiodns/python-aiodns.hash b/package/python-aiodns/python-aiodns.hash
index 4cde1c4b1d..8230f2b6e6 100644
--- a/package/python-aiodns/python-aiodns.hash
+++ b/package/python-aiodns/python-aiodns.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiodns/json
-md5  c69a64f09c0999f63ed759f5046d5bb4  aiodns-4.0.0.tar.gz
-sha256  17be26a936ba788c849ba5fd20e0ba69d8c46e6273e846eb5430eae2630ce5b1  aiodns-4.0.0.tar.gz
+md5  7ae651ddf081635d3b83bf4366947850  aiodns-4.0.4.tar.gz
+sha256  cb10e0c0d2591636716ad2fe402e977c16d71bdaf76bb8cb49e8a6633596f736  aiodns-4.0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  3e91cfa76821ab70d22998136d674d20ae888463a7e8a7f377166cfe1ee64feb  LICENSE
diff --git a/package/python-aiodns/python-aiodns.mk b/package/python-aiodns/python-aiodns.mk
index 6befbff203..ea07ce72c7 100644
--- a/package/python-aiodns/python-aiodns.mk
+++ b/package/python-aiodns/python-aiodns.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_AIODNS_VERSION = 4.0.0
+PYTHON_AIODNS_VERSION = 4.0.4
 PYTHON_AIODNS_SOURCE = aiodns-$(PYTHON_AIODNS_VERSION).tar.gz
-PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/10/da/97235e953109936bfeda62c1f9f1a7c5652d4dc49f2b5911f9ae1043afa9
+PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/9b/22/a2d928e0e42baad0471d12ec44c71152ac870486e8298dddb2893b888c29
 PYTHON_AIODNS_SETUP_TYPE = setuptools
 PYTHON_AIODNS_LICENSE = MIT
 PYTHON_AIODNS_LICENSE_FILES = LICENSE
+PYTHON_AIODNS_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
