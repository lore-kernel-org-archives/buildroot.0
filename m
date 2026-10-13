Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FECECC6B1E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C13080C3B;
	Tue, 13 Oct 2026 20:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nmSfp-N1QN_T; Tue, 13 Oct 2026 20:52:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3235D80CB1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924770;
	b=benFXLGjf41u3nRtiw04MeHyxcbVC3rwEUrgeJmrbqdNDrYsHF3ohKEFTHqqdByO2Ww9
	 k9jCeyfuA5HMbMJ9GP+7EwHWI67+2kZEGaERJ8LwPlwryYm5ge+WTNdQFXeY5bkes0L2t
	 H2qo94XYLwo91QAOWZDiK1lkfgsKu+1GpEofOYilNYVvUadfBCIXRi+Z0Y/p1iKmRP1vU
	 i+0WR7/zeihCocEW5sQL5Svb4eNDvFquJNdTaJiiloOOpCAVB2FIrEvfju69/8BXxR+xA
	 eRrmZlY8gWFhEmPHH6c4ePmpSVAITYkdaXPb8+/OHkKfbu8vdHQsyfkkl2WK3wHhO6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924770;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=r9E6xBtUHySHeVkH6VxyD1R61QFio1EQpwNhD7bafRM=;
	b=JPU9CcsYg1u0twBX+P0lWhYXSKgcg91l5hxCzqfVOXTBONlyyV7eplV+tJ6+ewjIPTci
	 /KWfvs+x70HdSXzDfQiJoClWYxsKDLzo5zjLOOxaqZ4T9JnNlXXvVf6l9xq2pDvdZsM4o
	 VMS+VDU/abuF0+EhQ+e6hvwylWVW2XtfWDMr98kI6O1KBuu2d7cSzv12cN6YTNb5QHmbR
	 EFTHf9fe0+tr1V2HYk+d7/bnwgsOcTtv7ULjcfWnqQuzEaXRfNUUDa4h+O7c+u9zZug7e
	 FNI5979W8B7cXiIK0cgUsFgAek6M1K4+i15tMzoyPw+WcAC5Xy98Nvy9QMVrHX1czvw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924770;
	bh=r9E6xBtUHySHeVkH6VxyD1R61QFio1EQpwNhD7bafRM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EklsoxyhU5KNRWphrYEJ20evJr1ZpowycLKyXXt4XFEZY/WZhzQu+v3vEs1iVgcF6
	 fq01U4IizFP03Ow/xhrWq8sTmWoGRTRZ+w7Nm+OBMGko9JOSR0i5ycF6KvSzPu7r/y
	 YofTtUPFG56Wvu7yPE4IXkPOrXdnfujrHCGsluVpCSGTsdG5UqcXMpoEBCtsxU2VZD
	 AIaoVEgQIt0kIxO7oSwh2GBA38tALem+rwEltGn0lz3TCAlgO/vo0LnNeRUI1wsHjw
	 1c8m03OciuKrYMU3b0ypRhovTYRhgW7wji6LOjAIkxk/jiFokFhbUfxmhhKlQaT2Ad
	 yQEWlv+RQhX6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3235D80CB1;
	Tue, 13 Oct 2026 20:52:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E874A1494
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D62A940666
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FSnW8rc-rkLr for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2A55840661
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924746;
 b=jAXuMn8orIK1JLmRS8rAL+jCtaCDIAox7ffR17YviffaPLIUBm8VptWE6+W8VlMGTbYq
 8WsbTjUJ+3kQpYEfEqJS0Z71QC3sUk+B67xGO+F7veSgtqxXh+WDTxxzcEdUn/aAoWLe6
 MHTxWI4l7Sxck6vaSdFoHIFQ71geRixSgM/f7CPlioYA4Mni+u6Uy0yfefFuXlcCoHBDQ
 H2NK6GFzvgOGTMSUWElcNxQUBGvcQrm2ZMBYYcNGDLvxU4PokV50pMrDEFiAiUt3ZLMrr
 CfW2XvBDebHfgGKXq+l53FHcIwzWide1zRuJsr2y6WKZT2atUh6q77r59vtS2m25IYQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924746;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=E8O0FrO4ZvezbEBLmqmtHCCVszOkieiEgc0xsLox8U0=;
 b=OBMZ0et4rYt+YY932cSMTb1Of3vF5v4jjbpTEc64IcFrhLJSQnurSC+mxHwb4zjdwHuM
 0uwyJ6ohWY/Vy+11eI22FbP3AZwA1Yf7a48emRLvyZQEJspyMTlkSlZtPVw44htwDYsay
 LlPiEX1U3UOoOy2gXOO+h0AJF0i/D1kPcJ45+4zbn1KVS7I9DsBk+tk48K2ah/qGRPxiO
 YABFIg+sGeFHdaBy4g0LOI+ADPb14I+bQ267pkzmihSSnE5jcZpOP+RmuB8EGvWUk7b7K
 Kz4WC4CRBa1BSCHwTBLXSfNaCb+Wzc5gKwoQhOK0qau/bvGJ1F4uXY0L8ijdZxiZyzg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A55840661
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64764956E1; Tue, 13 Oct 2026 20:51:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:43:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 23d83ada473dca86b1c53542f3e5ac439b90c211
X-Git-Newrev: 60bf7245b53d0acb942ea8e118f76b3d0d63ae51
X-Patchwork-Hint: ignore
Message-Id: <20261013205106.64764956E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-opentelemetry-api: bump to
 version 1.45.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/60bf7245b53d0acb942ea8e118f76b3d0d63ae51
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-opentelemetry-api/python-opentelemetry-api.hash | 4 ++--
 package/python-opentelemetry-api/python-opentelemetry-api.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-opentelemetry-api/python-opentelemetry-api.hash b/package/python-opentelemetry-api/python-opentelemetry-api.hash
index 914a0f830d..934c47ffe0 100644
--- a/package/python-opentelemetry-api/python-opentelemetry-api.hash
+++ b/package/python-opentelemetry-api/python-opentelemetry-api.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/opentelemetry-api/json
-md5  7ad5b73590259f0da66c9d9314f1af80  opentelemetry_api-1.45.0.tar.gz
-sha256  711ede81773c8025c2c03dac0450bc89f3d30aea6eabcc815c570d4e35a963f7  opentelemetry_api-1.45.0.tar.gz
+md5  54bb20b0cb8b4d0ef8a3389cebc4a81b  opentelemetry_api-1.45.1.tar.gz
+sha256  aa38ed19bcc084ba42782a73255b3582283eced7ad6dddbd6695189e69adfb75  opentelemetry_api-1.45.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-opentelemetry-api/python-opentelemetry-api.mk b/package/python-opentelemetry-api/python-opentelemetry-api.mk
index 84af11bfb8..46029d9f62 100644
--- a/package/python-opentelemetry-api/python-opentelemetry-api.mk
+++ b/package/python-opentelemetry-api/python-opentelemetry-api.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OPENTELEMETRY_API_VERSION = 1.45.0
+PYTHON_OPENTELEMETRY_API_VERSION = 1.45.1
 PYTHON_OPENTELEMETRY_API_SOURCE = opentelemetry_api-$(PYTHON_OPENTELEMETRY_API_VERSION).tar.gz
-PYTHON_OPENTELEMETRY_API_SITE = https://files.pythonhosted.org/packages/1f/dc/e12c1fe1ed8a7b7149777127b1a0e12ce5bd5a81d97408bedc2128c260f5
+PYTHON_OPENTELEMETRY_API_SITE = https://files.pythonhosted.org/packages/2e/02/6e0ae9cc61bd3169d401077b507b3ebc344745171e1051ab430be012dcd9
 PYTHON_OPENTELEMETRY_API_SETUP_TYPE = hatch
 PYTHON_OPENTELEMETRY_API_LICENSE = Apache-2.0
 PYTHON_OPENTELEMETRY_API_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
