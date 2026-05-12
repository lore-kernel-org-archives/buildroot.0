Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D93CD4855
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 07:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 364B760B7B;
	Tue, 12 May 2026 07:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ABTI4NzLwmK; Tue, 12 May 2026 07:01:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42F2760B7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778569286;
	bh=gC0InSgSwqiKJ9O9vLAunbc84SgI0Bp7tgUUtZ4jUF0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=T6zlnP3oyWxQrcjZFcp4RRdzINNYkvGK2JMwf59m8S+8hrH0dHfsLURjgKpT9mIN/
	 nsyqnWoM5I4ENdqZkpn92aM0VQNHZxu0mrpsruRdPMQbl5vK3twZcb1TYiDYDx+Rcw
	 /fQbzUsNhD9r+mj4amlgVYJM2Ll4tu5umab06WOdIBlkjRt5wZCrXLfCMko+UJUUVS
	 vaSFy6e0Nk3QE1qc+KyaMh8nOTOjpkTOQ/IRvO5aPj6u0Xp8Q6Yx1e8vDoqg96/Emv
	 ReV1NyCpgtBPRkELwxlC4efPcXdLbxKnOuHis348gfURWAam2SbePyHbDYrOZ/zLPO
	 6devDKdV2x28A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42F2760B7D;
	Tue, 12 May 2026 07:01:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CD24B15F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 07:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB3D540D95
 for <buildroot@buildroot.org>; Tue, 12 May 2026 07:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ic_79ZAKPUZn for <buildroot@buildroot.org>;
 Tue, 12 May 2026 07:01:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com;
 envelope-from=daniel.crowe@maxmine.com.au; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F2A9240CB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2A9240CB8
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F2A9240CB8
 for <buildroot@buildroot.org>; Tue, 12 May 2026 07:01:22 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-36627a0ea23so2020177a91.0
 for <buildroot@buildroot.org>; Tue, 12 May 2026 00:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778569282; x=1779174082;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IlrbzxUcdOJapG6Xz4PNQlNYWmVFo+EhCW01LMU6crk=;
 b=hNOzlxp4ylpoIOUBJ5djSWNQyNQLv511bTQq2oR/tcdjv+y5JyAzLM0wIQfGNIR14S
 i7vlBg7Ohl+PV3B+51zA2Pz5F3a4VYH36NM5+SHgFFeL0kKED8XuwuiiJ5fnT408JgMY
 FgGVfCWxsCMJG7N0r6OyNWqFFqW9kTB7ZVxns/Dwy+AeJpHJqAg5Nk478lUTgjwS2A0z
 gBWQzor3lIIh93g6d38nI8mEjexH/1EAYRo+ZMye7z83k0Vs3vuPRpq0eV10VIk6LUey
 t+hcpxupa6XvMgb/gONg6v5GB8xrJH4fEBZCd1qu3qR1FR9ga5DEU3XZdw6INZn865GO
 Uwfg==
X-Gm-Message-State: AOJu0YwIL7cKbN16HIiBLJ7XND9G1LC1zu8EUR4Fw2ISG6KMLyXCuz0f
 ho7kLz/2SLdQ7kj00iXJScEI6hieo2QSN537US29hjtBaj9fAv1Ug/u+pvheBjwR9OFEuEhrkgr
 BlgoQOhA=
X-Gm-Gg: Acq92OELL/NIhtUSTYnZInzJE6DbIVoo5zx+92HPA9LTnQ/J6a3Eq4OPNuB3aUAVree
 oFG6wHeXWSLOrerwe2w23OQ2DXRDzSZ1j0Bb1nMo0+eY1884i4LJct8Bbwgj5UwXsMuuVQzCx8K
 6o8Drcda4fcFkdahahj0NFfSwCM28KwJkb0RKDDL6vPce9oTxrdxFnSt90P+9Q8x5/qnzxDiL8g
 EED9XSbNNJIiXl9Gcz2zfEx2jlo4B+RnriAcuicinWSviPu3IIQJvN1UBXOmv6DNE68Kv3T3n3H
 8rqu71AEviSajzhcG2pJ7SWWA3UUHZd69kz6dfSOjbZ47Xhpslv614v0EDN1lVIcx8cIxIl5Is7
 msWX76eqRXd5gFUUhWQdgYaxAnB4o5lYgkIt2svWHD80hkvyMPt42Mr1H8p5IHtOvleb56Vd2Hd
 ZnjItXo8q1uwSPfkb4XAQj1B2HLP0JHN+9gcVSo48a/qJVOG33K44ib+6+iV19v5heev5ixJA=
X-Received: by 2002:a17:90b:53c7:b0:35e:3103:d4d8 with SMTP id
 98e67ed59e1d1-3664c8db78emr18495594a91.6.1778569281650; 
 Tue, 12 May 2026 00:01:21 -0700 (PDT)
Received: from res-0346.adl.internal.resolution.systems ([103.211.209.15])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-367d623fa47sm10162464a91.3.2026.05.12.00.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 00:01:20 -0700 (PDT)
From: Daniel Crowe <daniel.crowe@maxmine.com.au>
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 16:31:14 +0930
Message-ID: <20260512070114.782163-1-daniel.crowe@maxmine.com.au>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maxmine-com-au.20251104.gappssmtp.com; s=20251104; t=1778569282; x=1779174082;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IlrbzxUcdOJapG6Xz4PNQlNYWmVFo+EhCW01LMU6crk=;
 b=cWMyD8QPxWBqj5ic00bb5RrVZv+KVBGyLsX2rLiYaxjKzwEYLlndzmrnhInxZCJc11
 JZQOqp0Fb0D53mkIPqGULcaMlSt74IOdkDWijs4HVFg3BTATMJdqMMA5et7ldBeY/ijv
 mq8AFaRUQTdnlC0+S3n/RzItSYsvsl0c+Dcj8sPTPMovTzQa71ztBiyVlSFi8Cvnjk1O
 /iE2NmF1YMmBbeNkzRVFwAq9n9Ys4sSU0Et1xxc6q3a3dal3q35KLx9hVvwALknzoRhr
 QYXLeVZaKn5yjcPwugTTlv6Eb3KwrdzHDmz7aMB5RQXOKUyeKFicweUa+gr9mxn9bsIK
 5CEw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=maxmine.com.au
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=maxmine-com-au.20251104.gappssmtp.com
 header.i=@maxmine-com-au.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=cWMyD8QP
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
