Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED0BCD4F26
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 07:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46D4A60B55;
	Tue, 12 May 2026 07:28:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ODbgxwEZO2Cw; Tue, 12 May 2026 07:28:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99A4C60BBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778570923;
	bh=gC0InSgSwqiKJ9O9vLAunbc84SgI0Bp7tgUUtZ4jUF0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=sn2fl2AOGkiqNMLVoJmLE/FlPyudMMl2Oy1yJbTZlWGvxTA0uiYxEhVHmA1o3G4/o
	 FFDIMh9SW7PNrv082N3N9YtakDa0uV3dxTbdgwt/3ZLuNrV5jI5GuTUxtryb/xuK0Z
	 2Gvc+cGrfsXrMmAAhnlvqDu2MAWzhYCZA9Ls8McRg5rHtnrZoYdil3AsBSxx8NlSSY
	 cqvQAkZ5tNdJy3Jc9qtpwlq0t96ZgP8d7QUiQK14Dt1rO8XEd98e7iZeKeQ+kaFN5c
	 rJrk1B7Riueg4qKqhL31fz1YNmVG724w4Ct2V7kNQa19WE8MeQ7Dma1cMOBjky58IH
	 1EpWRyRoOkr7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99A4C60BBC;
	Tue, 12 May 2026 07:28:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C84DB15F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 07:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C38EA81E35
 for <buildroot@buildroot.org>; Tue, 12 May 2026 07:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m2VxnZTiWEaW for <buildroot@buildroot.org>;
 Tue, 12 May 2026 07:28:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com;
 envelope-from=daniel.crowe@maxmine.com.au; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 99FCC81E33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99FCC81E33
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99FCC81E33
 for <buildroot@buildroot.org>; Tue, 12 May 2026 07:28:39 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-3653cb9c6f8so4268481a91.0
 for <buildroot@buildroot.org>; Tue, 12 May 2026 00:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778570919; x=1779175719;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IlrbzxUcdOJapG6Xz4PNQlNYWmVFo+EhCW01LMU6crk=;
 b=FYxGETPdYHhaWIV0DBhNUu0uBP6w4GCtUXV2hLpIUcChYsiiThVGbrubFG3TVrypOw
 AmTuntMOZxDhx9MMtXlaVMOS5rpcD4dt4XUZOV9tyGZDMv20VLHdysv9XiUByt+bUNnv
 NHH2Wrd4J5OWqqvga1X9yKi7bq81Ronhb4r013H/6uL3PR0kwCTXqKzRDqx3S8uvDtHE
 UeTGQUm1RgRsddwDdEtEbHSyEL55Ceku0FzdIS0XebPpXEebKWwE1u/sWdIqUSU9Xt1g
 WG6g/Jx8Id6IMJtk41TK6BSiIF0+3HYENlK1lzwkAokfobJN4VSIdxewAK6XOQgbBsU5
 OK5Q==
X-Gm-Message-State: AOJu0YzcrhFih5C/cS+6pJz6qsptfOmIFxGM1TuIHINPfogAl76ZkDkh
 bmSedG33zKyDxN7KEdheiHG8nong7/AX52IA0PCRc68E1uyROx2IhITd4gRXGD47iq4NtSuIEsF
 G+z6gNEE=
X-Gm-Gg: Acq92OFHydmo/IP3izNyPsiyQ229222Wfu397adnvje+5xpZCmIQt1yYN3p/Rn58cN5
 CVrIv9h+MwTGiFN0ipyp896YiLNi+shXlM20K7x+Ngk8cim+/JoeB79WHcUVR9duNVo9MxdCOGx
 gjFEmVnf4NJjpzRTHCwuGCeVUrziEjPVtiKr9usNw3oa116yrkpYSCabVQDg/xIk0LJB3fU1S9G
 94XF2NMp2su8Vg55MX632CB4HFI/cztJaClj6Yabm95oA22Fld8w/QzIXEaRLGxHm6MM2FkR9WD
 RPIgnkBjJYIEzlcaY3BCqMiMooAYIWhL4TB9OowJNchNCjV16fKKaRfqLcyPSLrDD6nxX5EXKNj
 kNsEnqxMv4UzliwOTJnWRQRGBEgTBofOiSpHUIFbvo9O09RL7zRLgbYDSCAX6lBg1JVup5QsWuk
 hPLDxSHb7QcPr8kLJ1/1j6s87vYyMhXGFBLHuvD6sknRw5BTRihPaLChjjddL2IDEtYusyw+s=
X-Received: by 2002:a17:90b:49:b0:368:147b:536c with SMTP id
 98e67ed59e1d1-368b2664c08mr2089801a91.13.1778570918694; 
 Tue, 12 May 2026 00:28:38 -0700 (PDT)
Received: from res-0346.adl.internal.resolution.systems ([103.211.209.15])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-367d65f116csm9591741a91.15.2026.05.12.00.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 00:28:38 -0700 (PDT)
From: Daniel Crowe <daniel.crowe@maxmine.com.au>
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 16:58:32 +0930
Message-ID: <20260512072832.801739-1-daniel.crowe@maxmine.com.au>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maxmine-com-au.20251104.gappssmtp.com; s=20251104; t=1778570919; x=1779175719;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IlrbzxUcdOJapG6Xz4PNQlNYWmVFo+EhCW01LMU6crk=;
 b=f1SJPUI1xZzieW/WPNkXXvJwJUE54QAK+PdCxMgTz0HOWyHJ7P2PI3GgdjzPJBRT7S
 qhDlUvRqct2uQPShMesI8zIAgKuTPpRBI3NuzaDsgTJbiXewwcjuHeWiHqwVAahBftjB
 NU3T/HaRUkLoAoCslUS4aDCVRiUY1yX92vfO95s6gMgiVyMcTYUR/yage43+Lx+1otw8
 NslFFFN7tNggExZp77IeOVSZkieKSVK96cFDXxnBAMfyoiFzTHG81nClqOXJsdW23d9m
 NsD0KC5ivY11WLxp6sgMuT77SQ7hKoC7jkGDn3HVRRCdWV6ekdKNE6w4hWN6GJEkBIjh
 bUzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=maxmine.com.au
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=maxmine-com-au.20251104.gappssmtp.com
 header.i=@maxmine-com-au.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=f1SJPUI1
Subject: [Buildroot] [PATCH 1/1] package/python-cachelib: bump version to
 0.14.0
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
 Daniel Crowe <daniel.crowe@maxmine.com.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
---
 package/python-cachelib/python-cachelib.hash | 8 ++++----
 package/python-cachelib/python-cachelib.mk   | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/python-cachelib/python-cachelib.hash b/package/python-cachelib/python-cachelib.hash
index 6a50350aa18..0ae8e5f10ee 100644
--- a/package/python-cachelib/python-cachelib.hash
+++ b/package/python-cachelib/python-cachelib.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cachelib/json
-md5  fc25e9c9165cd5fd42ce282c2ba540fd  cachelib-0.13.0.tar.gz
-sha256  209d8996e3c57595bee274ff97116d1d73c4980b2fd9a34c7846cd07fd2e1a48  cachelib-0.13.0.tar.gz
+md5  4159f620b8800fbe104f20ea4702e16b  cachelib-0.14.0.tar.gz
+sha256  73fedcadd0ba818fb2bb9f3c7cd5fcc2a71e86286f1842f55f28d500faee17f1  cachelib-0.14.0.tar.gz
 # Locally computed sha256 checksums
-sha256  cd418120812dc2626281ae027e81b648229d166b5aca7472cecd510038d36e7d  LICENSE.rst
-sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
+sha256  cd418120812dc2626281ae027e81b648229d166b5aca7472cecd510038d36e7d  LICENSE.txt
+sha256  1e07e9c25f2618a040560b70e63f42259eab24e558d0f3532e6163d751cb4eea  docs/license.rst
diff --git a/package/python-cachelib/python-cachelib.mk b/package/python-cachelib/python-cachelib.mk
index 7361a21f4f0..937925e1e3c 100644
--- a/package/python-cachelib/python-cachelib.mk
+++ b/package/python-cachelib/python-cachelib.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_CACHELIB_VERSION = 0.13.0
+PYTHON_CACHELIB_VERSION = 0.14.0
 PYTHON_CACHELIB_SOURCE = cachelib-$(PYTHON_CACHELIB_VERSION).tar.gz
-PYTHON_CACHELIB_SITE = https://files.pythonhosted.org/packages/1d/69/0b5c1259e12fbcf5c2abe5934b5c0c1294ec0f845e2b4b2a51a91d79a4fb
-PYTHON_CACHELIB_SETUP_TYPE = setuptools
+PYTHON_CACHELIB_SITE = https://files.pythonhosted.org/packages/66/a5/5eb041dbee71766704d44cf5dfb6950ab018be0fd02cd763ade09869e33c
+PYTHON_CACHELIB_SETUP_TYPE = flit
 PYTHON_CACHELIB_LICENSE = BSD-3-Clause
-PYTHON_CACHELIB_LICENSE_FILES = LICENSE.rst docs/license.rst
+PYTHON_CACHELIB_LICENSE_FILES = LICENSE.txt docs/license.rst
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
