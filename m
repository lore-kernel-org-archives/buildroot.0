Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31798EE645E
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 18:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4F6780F0D;
	Wed, 31 Dec 2025 18:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YiZH-WdEPS-P; Wed, 31 Dec 2025 18:48:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1863580F1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767206913;
	bh=uhMWNdgCX3NmFLR1dHkzZovVepkk6atCeRyQ+85wN3U=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=EdqGomkIzdklLf/x+FG4HneF5pM6hFgrm7vhmbPmr9a5tZPQtZFG30sAt9ZcAXOM+
	 rzK2gX2UOFZZrCxMzuDobyA31or2lp+UxLpAXP0o7CK3NyqO/Bu+6hPpqloiE8TpBZ
	 /v+WaTE3jGLdER+OAo3rQkTvnn+qy84letFfoFf/syBIjyKSCCM1bL07jTuf9ACoL4
	 IUocMKDtScw8KUE6ZJ1yUQaa08RwJejm9dCe4CnWLeP6jPtq2qEz77rs9h1L1X/4s+
	 cZmEMTS31Bui3hZzhKITKvoQa7sfGL1mR5gSp7BpN739i8aehHg72bN2Nk7OLeS9Jp
	 pz8zo4Mhh064A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1863580F1C;
	Wed, 31 Dec 2025 18:48:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03525D8
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 18:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9843404AB
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 18:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vh7E6F2Y_0Cf for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 18:48:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0ECC9404E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0ECC9404E5
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0ECC9404E5
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 18:48:28 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-455dc1cf59aso6966894b6e.0
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 10:48:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767206908; x=1767811708;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rPHJxvbEQ/F57nj3j9w9m5U0x19J25e87d6A8XJnAro=;
 b=tSPUljdvMffqc5IgkpJOJxZNCLkbP1emIed/LjqIzG663GgZlPxdJESK8csO0FlM0F
 iNM64IoeRYWUAT0WLHlX8urTQh5sXFjCJWwIpXiiJotKQYdAerJ4wFgmxRNr2PSJM0p3
 1ywJ3fjETZ21F+2Mo4hYpcpq0NBRNftL6oFsEAGKYE7KXHUUWGjFlHFu8hTdimcSiLwY
 GqCIaleXqW9D6jXmT6TfUXgoaVZdpSzJGygoq0O8GGdq7GVetZxTgVNg20H5kToS2eWP
 gZdM0/lix0Mg5uLJm8yZqBhg5+6fQtrm2XQu8wIKPxV4R4UPE6FJTdQwnvFLlo4fcRfY
 2xHw==
X-Gm-Message-State: AOJu0YyUWcmMjhHYxZm6HHl3RGkNtypSGjHzepGHRDWfcrtZ4763+LvI
 RyQn7l5NKPNDXdJbxlyCQjoMNvIA+4yyaGdEyZGHg+LRXlr+RK2hp9DqAQOsyzUnTsQ=
X-Gm-Gg: AY/fxX4jj7ElRZ/IVMbjL9E0AhiexNMStv9dllhh6jbhgQwpReMRP91M04mOZFcvrRt
 +Uw6M6Lje2JLaWjEeLtFMnWQ+r5/rvYyVwm57z66zlAWHrSdPzY/0TD0njRB3WPkAk6XvG93a3U
 4L9cFI/3fcxEMLTWkTTzWsQR0Fpak5UMZlwSi3L5CoBbK9+TikHPng6a17O0cEDZ2YtJowVrUUd
 32HwagU1aEp1QC6kdRSwGTx8xzsC9Yx+64ELIWB2PC+y99epy+/fIc14c3MIgzOKp2ZvDW7wWSO
 A+6PKW5P0jtkSQ22dBKW1ysIaXJpRQg/D2fpmzfAhFz6S/E5sgsCWfxF7Ef2clRi+QIYB26B/w/
 KLSdFEoHajflIir32lkdSYXUX1HftYSXjHqCSl+y8bbcSrXg0Ynfov3HVzd1trK+ILuYIDDY1nH
 /KTeq12qRmgjH0g0BM/enujg62AAK713wgxBJ83GmmuqeEM1lTdvuUEWqKLb75Ug1RGLxEuxxDb
 iwXMaiW/1v5xuP6mQRBvAllyloA4+XK4rG9owI2qHNWEdQQg5+jZU4=
X-Google-Smtp-Source: AGHT+IHGoacWpBhyRsxTX0DgZsp8X2O2rVU3ef3OzS0363eFXDMTM3KmJscjcJkBqcS7OGGMSawMcQ==
X-Received: by 2002:a05:6808:30a9:b0:43d:365f:be86 with SMTP id
 5614622812f47-457b20c9c3amr14930299b6e.33.1767206907710; 
 Wed, 31 Dec 2025 10:48:27 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc6673bc05sm25147301a34.8.2025.12.31.10.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 10:48:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 11:48:24 -0700
Message-ID: <20251231184824.3951137-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767206908; x=1767811708; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rPHJxvbEQ/F57nj3j9w9m5U0x19J25e87d6A8XJnAro=;
 b=C06xMnIvlCyvO3CCb3d+cshjlJE55BCi+3BVY81jyG1f5xQ8q4IS7RZu/2y5AEcpiY
 NNlHZiKgVkiGN7cd6v5bNEViGwSpkCIPPVWGe7tqCej5VL6ira8mgrc1rpZ5e1kMqwix
 C/hvVrAR9eA6uEQkgw8c+lmPyLEClVR1LrDM7W6uAuW+A9zZTr2R29+slC/mp1rs0+T6
 GAEpxYJkJFj1lUejoW5pF4YPiHhzRrsVM4d1o8P+3adZEJcSDL3wYzH/y70hgeXaZKmv
 3nrQURghOtA6pE4wrBSzmmKYq0PGnyACGR2ORPqqM6HV1Lt1zhyrzV08xaQDmPzm/1Ay
 GhMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=C06xMnIv
Subject: [Buildroot] [PATCH 1/1] package/python-tftpy: bump to version 0.8.6
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
 Colin Foster <colin.foster@in-advantage.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tftpy/python-tftpy.hash | 5 ++++-
 package/python-tftpy/python-tftpy.mk   | 5 +++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/python-tftpy/python-tftpy.hash b/package/python-tftpy/python-tftpy.hash
index 3a040a456a..93fb32621d 100644
--- a/package/python-tftpy/python-tftpy.hash
+++ b/package/python-tftpy/python-tftpy.hash
@@ -1,3 +1,6 @@
-# Locally computed
+# md5, sha256 from https://pypi.org/pypi/tftpy/json
+md5  8f81c101961282c965086fc3cd123a40  tftpy-0.8.6.tar.gz
+sha256  f616f6a43a36d481c266573608597b9dd3c7c63818415d72aa04f1d1795480ea  tftpy-0.8.6.tar.gz
+# Locally computed sha256 checksums
 sha256  fc1460bf698c4207a255fffb446ce21d44cb0d9a8f2ee5ad705cd40969800050  python-tftpy-0.8.5.tar.gz
 sha256  4616f0c71e62ce2e0f6cdd3aef6d3c285f8730c9304b88a9f3ce3f14c2e6f756  LICENSE
diff --git a/package/python-tftpy/python-tftpy.mk b/package/python-tftpy/python-tftpy.mk
index 322d514f1f..5b31b4a5cf 100644
--- a/package/python-tftpy/python-tftpy.mk
+++ b/package/python-tftpy/python-tftpy.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TFTPY_VERSION = 0.8.5
-PYTHON_TFTPY_SITE = $(call github,msoulier,tftpy,$(PYTHON_TFTPY_VERSION))
+PYTHON_TFTPY_VERSION = 0.8.6
+PYTHON_TFTPY_SOURCE = tftpy-$(PYTHON_TFTPY_VERSION).tar.gz
+PYTHON_TFTPY_SITE = https://files.pythonhosted.org/packages/68/7a/15a01d67184aa855e07eac08bfd514e008027ff198b32274f7657d8368ad
 PYTHON_TFTPY_LICENSE = MIT
 PYTHON_TFTPY_LICENSE_FILES = LICENSE
 PYTHON_TFTPY_SETUP_TYPE = setuptools
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
