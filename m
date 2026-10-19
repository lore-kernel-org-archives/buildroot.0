Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896C1CCF2D6
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 07:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22B05406AC;
	Mon, 19 Oct 2026 07:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id re-Dkc0XDCvP; Mon, 19 Oct 2026 07:24:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D4A6240600
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792394654;
	b=T43AofH2ER3ANTMn75Ff1FwGEBdjXXI2c6qFOVlCNw6+NtnqX45wfic4iNPsGDFPOTzK
	 NQd9HqjH710PLf+7d87bS0Q/3KHDoY4ykB0WaR4NTVUl1rGw7IRsFf9Xa/1C4c6MG5C5x
	 6s+fKSL1tBRVHHQV/YfYYIF1nHcU6nXMVXAgrWKZdRTMTBOywJeNLeXo7B8GwJNuV/Omq
	 /Y8sz8RjQEkSMv+CPqAfTiUze28e2NaoRmTFibXVdaio7JV610NuT9dhdfqfDaDIqu4z9
	 NTqtRdWEQDyKkVCL39z72tmGBwPFavlSo7QohJOGmqVJwAls7ZnvKM9CEhAERuNQW9w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792394654;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-MIME-Autoconverted:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=WfWVXH1iTPgzZG6hKrhA4xFbty/RpY3i4Q4FQiWd8O0=;
	b=L3VLvog9jONDc8JcAnzQhyJupYkEju5iaTLX77F4YTK1umaO+CBPMQo2wp2pR1OuwqZ7
	 lHRc6Qj1oV/RK2jsILsaL9JEjseMMSZWyYSytRVJmYPwnwmeNyqxaVBwx818JEQl6sv6M
	 pwZhlRtZiGTUKRGbksS90oE8m8rvxxjWJnIUln6ztMlRpoSM+bbY8atIxwBCRnWdudNYx
	 1riizkHCAZd+oDCZWMf2/p0cuJ1IZTxSjhhhOv0kHMrRuF48AyOsR5/3Advbj4aw/wjvU
	 dIfMFEabR3XWvzdZOkwtck7Q3tsC/YNm24llReSwFsR91OTWAtkvK+EmGz9TEUpXtdg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792394653;
	bh=WfWVXH1iTPgzZG6hKrhA4xFbty/RpY3i4Q4FQiWd8O0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oGRhX0nVlhLsY7aHSWfZZQiystwAAO3evYgVjreUA5C7PFtcFgPl/guoYaF8hF3u6
	 4Pdslo6mrf/HQSFKTpr07VOgL8rEhZZLcuwWT9jCwRkQdkD8TybQ6cTW503prlIoBW
	 mvm62JjfgZTSHSiCJ7BcAj8d2fXy/fDrxXyMJnRqDBkIYUlrjg6AAWofbtk+4afB/S
	 4N51dE7NAGIkfcIA4svZeE47F/Ve7vRbv/yiVRVZqZlNvPyxgT9lM0xmgJyLPM0Wyx
	 gGt/CWnOtxGuoD4FhrSTWy8+Qqzck4elsPoJJt8uWY6iC5xOAGO1kkgk4PdFcI5xnp
	 dZlxCt+8OKe7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4A6240600;
	Mon, 19 Oct 2026 07:24:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AFEAC1AB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 07:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A22D7401D5
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 07:24:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1OWvfnuforiJ for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 07:24:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 266B2400D5
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792394651;
 b=UbgtDoBe0JmHBBIGLrGk2jZWQvPObn2IpbRfCsrro07Sb1IZ+2pmTM7K0AuPBhVCi8n3
 NoLRl9aZsOI4ZmSYNYQV6dSWzYyJsfTazAgTJD+lHBqaX1bZt57BeQXErviLJEjjcYuHt
 JMnE+8iEjSJlj/CWuFyky+azLG9XZYUtn/In4QGjHilSFrz/6phIWV3dnPSA0aTk77eH6
 X/gGS4wYgwMZaaZt8V28p1gi+CvveU7hBFo+ZiLJXOsMRn5hxCOTip1LAEXQZshK8WQWP
 LCtuqPMxodbQTT6pcTTkA/C6U/rZ16qUeR1h00vnQ620L/z6/yfwp4JNimYEWmYfLlQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792394651;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:
 X-MIME-Autoconverted:Content-Type;
 bh=M0muGTDKxaYSPmW4pVV/dpk6Vktr//nm6nST3zL6Zao=;
 b=DNHvvhzIpmNMfKVumtSRXUF5ClS3aeC/+bpAHxvq4KVzm4PTfQCUWA2VjtS9Tby8XeEG
 9qTjdIVBYMNhMSk6tiBTls2CgqzrmDffcNPLGkX1Bl18WH0bk+E7aiFCBc8Xfn1d4jrsV
 F9fZfgnF9MI2WC/XHguPa2g+x0Ud/Jk7XxiXbY561EOo/5f7N63l6xVtWjkD+zkBq3RsO
 wYFsPN1rdf+9x52R78jYEsBFOnySOyuFEdeE7lYVpkMhYFbiMRsxj2q7codBSvpIp6nGE
 JyNSgh1s/zlFk2U0isW9f+Ckb/Uv0+KkoarAE5we8oj8Rq7OGL5aht2vdlvF+Ly0amw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=YHzoIK+q; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=YHzoIK+q
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 266B2400D5
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 07:24:10 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=YHzoIK+qv5VhjHW/ady4wp0gtUpdtZ6xCkWORMvTJOc2usCarkzcttv+fco8/tVZR21JO+PtM8lgvZ8tUM42zUWdD4z9AC/Y8QpmJgEZZcZ8etE/U+jBAAP/hd/bjSHeNn1iRx6xa8lesfClN7Bc3xWa63JrXNpfRejCXX9rAGtXuK8Hx069VJvEe0AGuwulNE5naFEMPxqpTJguDPgxYcz5zoVqC92HXQgiYMFisww4ZYV0umV45JEya0Bf7ZT32gYcyRUeNPyKW+Uxu5XxHNKL+K2RwPcLp0tn4gHDSqzDTDJjpozGXIkIsIYI3P8npGfMeT4qKySuvTZSlCcriA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=qPi8+rAfOh1Xm6RQQUZPEslrt+H6+LbMgl9MY7m3ST0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1738015656; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 19 Oct 2026 07:24:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xIhj3-00000002Pda-0etL;
 Mon, 19 Oct 2026 09:24:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 09:23:33 +0200
Message-ID: <20261019072335.575107-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019072335.575107-1-peter@korsgaard.com>
References: <20261019072335.575107-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH 2/2] package/freescale-imx/firmware-ele-imx:
 bump to version 2.0.7
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To match the NXP BSP version LF6.18.37_2.1.0.

License hashes changed because the LA_OPT_NXP_Software_License changed from
"v63 May 2025" to "v64.2 May 2026".

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../freescale-imx/firmware-ele-imx/firmware-ele-imx.hash    | 6 +++---
 package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash
index f064ef1830..ea2405cf52 100644
--- a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash
+++ b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  c3ae4a1e1a41da441bd61483ef011ac24bf624aa6bad36f879b5dfa435647b4c  firmware-ele-imx-2.0.4-93492e0.bin
-sha256  3001cf84018c5cb10d183a678f6ec8a928c797616ba06b398d7ca93c0779aaa2  COPYING
-sha256  a829b109a0a406a6a2fec19975a332feca225098ce66bfab2220c6608db8fce5  EULA
+sha256  a24f0e6be783a09281d44b0c2fb26ed719038387441e7ef325b9d4c514592b1d  firmware-ele-imx-2.0.7-0265375.bin
+sha256  09fc7cbaffd4b91cb3b464be0a71f420bc84c2b674de9c1895a292dbb326b3c6  COPYING
+sha256  402244fa32bbd3d061688096049229c224b296a294c147984bfd2de306755340  EULA
 sha256  8721a617a5d4c7f366aaf857ebda21eb4c9fc9175dc92b70f627c611d403ec8e  SCR.txt
diff --git a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
index a844ca0d94..5756b422ba 100644
--- a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
+++ b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FIRMWARE_ELE_IMX_VERSION = 2.0.4
-FIRMWARE_ELE_IMX_REVISION = 93492e0
+FIRMWARE_ELE_IMX_VERSION = 2.0.7
+FIRMWARE_ELE_IMX_REVISION = 0265375
 FIRMWARE_ELE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_ELE_IMX_SOURCE = firmware-ele-imx-$(FIRMWARE_ELE_IMX_VERSION)-$(FIRMWARE_ELE_IMX_REVISION).bin
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
