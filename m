Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C97AE63F12
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 21:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D385F40AA5;
	Sun, 15 Feb 2026 21:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T5TVq4nix5Yc; Sun, 15 Feb 2026 21:39:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8484840A90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771191586;
	bh=kyCW9PuiE0+2w1QoGBHB4giSkcbFLrn8A4OLTvNVHZs=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=hQ3ghje6dR07OeSx3R89ux10z8u7sTDZzRA8tva8QEayJx6AaS3FsVo+lngHXDXM1
	 KRkBBNXNgnFwbu/tOiCnk2DlPBEy6kzEemDyVi77YBr4PASWuNnhdnhPtGt989sRPr
	 YChejepaRCLJMlBBD9lV7dm58HDvE5I2ymfalsXUmjfGtUEIMSMTl/QgNpDOPxyeyK
	 C11NqW+BOw79PK26pEWQ6GAaT9wvBlUWOnEW4lEhiyn7K+fn4DVY+rMCoTOsrpHePd
	 1tIKPXTR0t79Hm/G1/HQn5ecv9G4Y1EN+Ud9gOxubapgD3rjq5ux5f/oEWkoRd53tV
	 aXqi0WHymL5CA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8484840A90;
	Sun, 15 Feb 2026 21:39:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E6A02270
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 21:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8163608B3
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 21:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qocGsvw9YvYC for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 21:39:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4494B607DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4494B607DB
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4494B607DB
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 21:39:42 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.18.229]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N33Il-1vmfl008WD-016c0r; Sun, 15
 Feb 2026 22:39:39 +0100
To: buildroot@buildroot.org
Date: Sun, 15 Feb 2026 22:39:13 +0100
Message-ID: <20260215213913.713705-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260215213913.713705-1-fiona.klute@gmx.de>
References: <20260215213913.713705-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:PHu09z5oBSY8xYIE2xdQhihKs3dTOFxGQrEJOCfet99aChnnbXw
 oRitBUpiRzB15OP2YB4G+K6PJN2Sq7UwfvwG0JSAGltnG0Rw2/RNoWT8EbMbLGeyy4eyvp4
 14Ds9pPYP2gh244dz4XTT3qIWVn35UYDCO6cq8bCMcLzHve7p0zQuIYf3Nz0Tm505Dy5Aou
 obmtBh0JZsPWI2RFd3Ojw==
UI-OutboundReport: notjunk:1;M01:P0:yHNdybuj1eU=;Csw/u2E7YGckLY0PhTZU4HdkU6s
 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
 Gp+j6bm02UMfgyQ7D3TRlNxJlk3lj
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1771191579; x=1771796379; i=fiona.klute@gmx.de;
 bh=wu60epWNRRSqP1worp9JYfOXdTqppjFwoFHletpWhtQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Ku8AOgujwsuWyGc1mMMYjOMCaRPX1EyMYXctsgL7mZNXPFDoRE7GozO+JFkExnXh
 ctvkweHZVfXF/UCgX3yjmO+YS4hNsqEodvtE78OWIxHG7Mi9UwnjKSSLoqwGjnpuU
 N55XyLIo2oppcHl3jgvi4Ti9x+SrwvgtqbbTmkfjVLKSlW9bEgYrVsgr7qd/0Zec0
 oKxyv+RCLuRf4MjeqVScvlGwC3czcUsjB8D2anuq7MGQy1xbjDPKkTvqIscM2CyWI
 K4Qw38O4a9n03b/UjZOQLfEBRyAjeKEg/v9EjJgDdf81vJQFsQhYdatRYHmcBrcJQ
 MQpbb7tTTC3MZ5L3Fw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Ku8AOguj
Subject: [Buildroot] [PATCH 4/4] package/python-pyasyncore: bump version to
 1.0.5
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-pyasyncore/python-pyasyncore.hash | 4 ++--
 package/python-pyasyncore/python-pyasyncore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyasyncore/python-pyasyncore.hash b/package/python-pyasyncore/python-pyasyncore.hash
index ee4665fe5e..21c72176b9 100644
--- a/package/python-pyasyncore/python-pyasyncore.hash
+++ b/package/python-pyasyncore/python-pyasyncore.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyasyncore/json
-md5  f97e2b69f1fa11470867b395c2fabf84  pyasyncore-1.0.4.tar.gz
-sha256  2c7a8b9b750ba6260f1e5a061456d61320a80579c6a43d42183417da89c7d5d6  pyasyncore-1.0.4.tar.gz
+md5  2ad79027ce567b5c899010a7258de6b9  pyasyncore-1.0.5.tar.gz
+sha256  dd483d5103a6d59b66b86e0ca2334ad43dca732ff23a0ac5d63c88c52510542e  pyasyncore-1.0.5.tar.gz
 # Locally computed sha256 checksums
 sha256  f4f80c98161f5632004d44713b5cb95e400145b40cbc0297f1f50c27b54befdb  LICENSE
diff --git a/package/python-pyasyncore/python-pyasyncore.mk b/package/python-pyasyncore/python-pyasyncore.mk
index d86ac2cad8..a6d0fce13e 100644
--- a/package/python-pyasyncore/python-pyasyncore.mk
+++ b/package/python-pyasyncore/python-pyasyncore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYASYNCORE_VERSION = 1.0.4
+PYTHON_PYASYNCORE_VERSION = 1.0.5
 PYTHON_PYASYNCORE_SOURCE = pyasyncore-$(PYTHON_PYASYNCORE_VERSION).tar.gz
-PYTHON_PYASYNCORE_SITE = https://files.pythonhosted.org/packages/25/6e/956e2bc9b47e3310cd524036f506b779a77788c2a1eb732e544240ad346f
+PYTHON_PYASYNCORE_SITE = https://files.pythonhosted.org/packages/4e/43/035dfe0cb01687c1940fdc008f46a43c41067e226e862df49327469764a0
 PYTHON_PYASYNCORE_SETUP_TYPE = setuptools
 PYTHON_PYASYNCORE_LICENSE = PSF-2.0
 PYTHON_PYASYNCORE_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
