Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47263CC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C01B406B3;
	Tue, 13 Oct 2026 20:52:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 55J9fPAbW2h2; Tue, 13 Oct 2026 20:52:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3A96340693
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924759;
	b=SrCPiXXF1f/LNEUdC3coVgMr2ssuCO+cP9UaBTsgRYjact6T5ATQ1xoL8MopJ0+blN5o
	 P9u1j/kpWdoEU9JsX4C573SWQ6f7OShwNtILPQQjqAGDzj0lX0jOu/cF2zGrFdkywI8+k
	 /UXpP79kL4eIw+BctIbqTMgjlR7kO3QbgXnoMlEeKfesEM7voNHVSF7AxDOalUOJB0z8K
	 6X6xq73HxUAXF15KWP/woKXKSJl8e3p7AjuS5ikUEUoQJZiXsFPmSkWdOnQ5d6QAiLBW2
	 HQQ+cT/pLFeTNsQ/yd37wl5x0CKSolC3Lhvm04Ct2WjbmuQJYl8+716/iRKE9MtlnpA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924759;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZRLr9vKKVK/MSvEuk0WGBmSo9m08L87nq5/f+oJiKpQ=;
	b=Gw7IrjlHoKZEH1uI+P5fC1yPN5YeEfCqgOZk7uhA6Z3hKQCYDUjUM5PUNIoSLpMsVJwL
	 ap359X7bFqb6oNA3v9S89htBXHs7iB95ka2c3ouLtRlBLsyS4udzoF7aSpiP4o6eSI8y/
	 6AmTmc6qYy6IJ5tzpMM7fbTn3Y0CgJonOEY6uJ3Paf4XsRBV3UHJoIOa1SJ5J1hIHym7O
	 UIcbYuU3vfM3RDuzDoW+aDcJ6kOmlChz1ZKlpyIxqd39MqcfVtkYfGveNCFmgLQexb75s
	 WEF7t6ijomaxJ2HutBnOAoxxqFpXXlS8yCK9XfnDDvz1wG6g34PxBqVVkPmvwb//eew==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924759;
	bh=ZRLr9vKKVK/MSvEuk0WGBmSo9m08L87nq5/f+oJiKpQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hL/o8H0kW/AndIk3lheGsdo2mfy1HAmBGppVT7S1ok5Pc5JOv9LKhMQAvwVoVcJII
	 Fi1PbUIMQGTifrvHn+oHaTSYj9E6wQ99XfEZxyixnkB26urnfFz9s5RhOh/7XtRsRg
	 xYh49rbO6LxCE2Z4Shrn5zizEktttxg5/un5GOkVPM3KegZ9sIDsFQ3hS9SBhw8d+2
	 SdfL/BD8YcHccQRZAAthRy0e69rerFniv4DI60mVLOIDysWbvqRr0cQOwwLs4XI3VJ
	 1ePW/5nM1cMbkpDWizJG19P11vCEFpXZtg3p6r2lZTra45UYHcEQKv2EIb/ABgTeC0
	 eeySimMW+O4Mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A96340693;
	Tue, 13 Oct 2026 20:52:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 811171494
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B93D405DD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yoQ_NzaYzw-2 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8CB514062B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924745;
 b=p1ioAwNnSN+/AjrN5ziiHvNR4umtZZxRndYqOIpz1Sb99rdKAIn0ThC7f5uyQgrF2k8Q
 dsT1IxprsSkK06n/+VIqwxaed5ABUqRZqAwagadXpIVxbXRCrtnUQGSphNEVMf+XlV9Gv
 LPQtL55AB8R7R2RqSJSt1v0xnuco5a8pq522qDbNGA6g09mpjZXYrKJMkw7I4FLveSlV2
 +t/d9vY/iNdhqGKKCgz1jmgR0tTK7WBCGqYKl1c/Yhl/pApF708ZgZvW1tNJ1pFxNqNJA
 NfgxXzcDsi4TaJeE8nI8KxFubkYxhWl4WL2RDUkAM6WHvu4G3mv7FQlY8OKOwsVG6nA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924745;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/Ir3WTrsKya0wj2TYpm75iKvHua6CvUIUOnoGhlJUIo=;
 b=s7moJz3RgMBcAYMsiNflOOPpDq/1dQCaCrRwGouB/71EcEBcc+cSoldJc5qL2S2iRchM
 5oIUqlr/XT9aJFaqLIK6XFW2JnF/iM69k14CjchlzOkv4ZATA8WrddsSZbBrzVi6A+7NO
 s5Rn/CExf1pua/qTk4OiAOTBadlIfyXrfDEueOofrGn6MzywLvKlZXswtY/mJOdMyatPs
 UWrUti3bNJcPmr90Z5aWKcOznQHwLvNLOyJKndlI3FPfyo625OjBMSWNcaqW7QHlyWM0v
 jHclU0O1w6tq56epvAlmrcLPFZWfpBuCKFnuUhgmz6xGuIFDtVALNs9xlItx0vReMwg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CB514062B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C652C957C3; Tue, 13 Oct 2026 20:51:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:42:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14cab37f94a34ae6cd1ead0896872699d954cfca
X-Git-Newrev: dbf237d4b5c55c249bbda61e425d0381966f7dfb
X-Patchwork-Hint: ignore
Message-Id: <20261013205105.C652C957C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cssselect: bump to version
 1.6.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dbf237d4b5c55c249bbda61e425d0381966f7dfb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cssselect/python-cssselect.hash | 4 ++--
 package/python-cssselect/python-cssselect.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cssselect/python-cssselect.hash b/package/python-cssselect/python-cssselect.hash
index e373b88d57..eb0ab6c8b6 100644
--- a/package/python-cssselect/python-cssselect.hash
+++ b/package/python-cssselect/python-cssselect.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssselect/json
-md5  465a7b6af9ea95fdefe5357301589b9c  cssselect-1.5.0.tar.gz
-sha256  3cbe82dd7acbee9ba9e5723b5f9e4749826912f1fb31cd7f92aabed5fde15b15  cssselect-1.5.0.tar.gz
+md5  49c5cb824fa52120931154f7a24bc904  cssselect-1.6.0.tar.gz
+sha256  8c83a7139e97b93aa5ebdc0f46e785f7056a08a8bf201e597a6a2629d7eb11db  cssselect-1.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5c8da9f744e0afba81a48c9b5dbe73048f798b3287d6f1af8a05ee08ebb10892  LICENSE
diff --git a/package/python-cssselect/python-cssselect.mk b/package/python-cssselect/python-cssselect.mk
index 283a00947f..4fc9bbd1ce 100644
--- a/package/python-cssselect/python-cssselect.mk
+++ b/package/python-cssselect/python-cssselect.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CSSSELECT_VERSION = 1.5.0
+PYTHON_CSSSELECT_VERSION = 1.6.0
 PYTHON_CSSSELECT_SOURCE = cssselect-$(PYTHON_CSSSELECT_VERSION).tar.gz
-PYTHON_CSSSELECT_SITE = https://files.pythonhosted.org/packages/8e/5a/6d6fcf922709391fac986f0a03ad4546f4f45b94d10aeb6c1ee041599993
+PYTHON_CSSSELECT_SITE = https://files.pythonhosted.org/packages/c8/8b/dc32df939ab541fca6ee8964d26aa231dbe231cdc2b2713228161441ba9c
 PYTHON_CSSSELECT_SETUP_TYPE = hatch
 PYTHON_CSSSELECT_LICENSE = BSD-3-Clause
 PYTHON_CSSSELECT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
