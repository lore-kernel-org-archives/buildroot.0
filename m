Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224E2CC6B1D
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFE7380A8C;
	Tue, 13 Oct 2026 20:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wfF-Qq5Y5p5k; Tue, 13 Oct 2026 20:53:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E5B3680DB5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924791;
	b=F/0jO4P7f8vFoxaCprwPG0x+N75v/+B7aR0vT7iEZUIyy0KaPk20ASTpJuPKBAE1t5QR
	 GNNpDB2nT4MVtx3w18pih19aNnV+//sR8fXs6RbzUo20bXN10616u9jt5SNSpk10cc0rS
	 BSRlLc0OmvxSpXIBUQD/7LpLucZ9jVdXIIb4oaV0TH9FCwd1iFMv5Sju2gzYd3ftNe3qc
	 RranVFSHz1VLtBKXGlUS52O0+zFBJLqKr1Gx/pWsvD7NURTIZAn1heV/Wl4428jxAhm21
	 vIgEjb26QOevG3NDphMJ8esUfDHm83yWwggRUS3/Y4WxCCPhrCVlehFsZzvev+UW8HA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924791;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=R42XpDQ9acjDVKo8qjGmUBOSuoc/WnShA3HnkD+Bbug=;
	b=AL/mV3j/ZJP9clUj+3fol50LjpLGAoKiXe5C99ZWk228cNM2BDu16Ju542ejPyp6VkPf
	 N6NIAtzf/SqLkv8nHWVMxOXz4au7ybz/IJQkyjQmRPH3CmNRBW19GBRYa8BRZW3Eq+JuB
	 oJ8aWiGKG3jzjxNqPSa9cQpnZ2GD4Cw9iwf32OsX63EaFphkOdfiV/MQvejVZ98McowpM
	 G6FCvt3/BI6Sw8XWrSHPAkyO/DQ8gfhZlWP/zHbo9+dtcpcSXd+cbbbaEtARx5pMID6Xb
	 cdOlCGNveFWjNa4W3WCv3dl8up9C3ufFLrer/Cq0N4ntr5a4jQE9s0FkoV5y5sXvBxw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924791;
	bh=R42XpDQ9acjDVKo8qjGmUBOSuoc/WnShA3HnkD+Bbug=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sTvjK74StNWl2fJTZ/FAaoVlgNZiYj8aHUogEoZEJfcfj5SJikM7AGBIco6snW+0z
	 aFvZla3MDkntLPnlP7jfofHYZfHmEsLUgeKfe8q9DbAr/g5b9cgBBaf1uIOte8rOMf
	 Pj/dBg9oCxQy/wJxJi1Wo0jLAsnLjiZeWnevDbPybByfpdVGUVPDFGFcb1mzL+i2/k
	 Nt4L9YeKL1+XoqBvBJ1QqmeyHdvjY1WIvW3IrWNSNDjeOWC4pub7M2FWO0RqPKWY22
	 qK6s/VhJKURm3wObTzONLM24CM7TBJRjiccjnzdxMkMA42X8vznOgSDIB9lbFOPAGd
	 47/Vtslj6j9UA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5B3680DB5;
	Tue, 13 Oct 2026 20:53:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C92232AE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADFAA405DD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id moAPjTkeTfRw for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EA5D34065F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924747;
 b=lvNzuSBxKWbAwBauUnxiv86v767kVRVC1nhiFCt+4pvRwFcI70Q7JSMG420YGco6fPV5
 57CCaelw0NCTCKwv2niRN1O0sA7N6D9ioO268X3h+BNKcsQq8dHqQTLwzVPS/cUaJfIEW
 BpFKAxrSn7A4OpBvn3rPKfUaA1+FIss1sFNUS2ddMjOYds70v3p6fzzI5IFT7nS+DEgYb
 0VF9CBOaf+UtQVYRgZlZYn0WKMfWBerxxuzw2d6Pf254JRyzCrEIEF4Ww2caWnBCsEveD
 IXz4zAYMB/LNAFnJosldl2/g/5AFGn19gjYeZGlrLI5qjYcxxi35K27oeV+pq8vnRvw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924747;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=nlGWzZQ+XJeRE9WNdtrFjhIl67bUiTu1gOWVzWpZ/go=;
 b=stwm6ZPuT/bzGvKulf0hPK/OiQsQ5LBPpnvz/jp1HoFKDz4/Q4zKe5WyujvMh7J9gXpg
 CulV9yZLJX3lt2XrMB+SC9hF4zqAvy7/QqADOf+/P6q2FjR9hkOnJ4FHYAEk77oF0H/Hr
 xtZCcaXMaRFR6DqT3Ngw9hkr5zDvASpdaGt6bDQnqOV0GNAtuOWeQom8LC/MaEO1fT2j2
 QoYgo2TxfZMMPISmmlhoLCh7iFR7veWv+W5fcrFZ587JbM35WbKBFSnk1KmrmFR4YXO1j
 pt5dC4VLmoqQVVv/pS7O3s07OZr84IC0MI1zli9S2QSyI8VLXoHfQ1bkDxu//OBBRhw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA5D34065F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 306A8956D0; Tue, 13 Oct 2026 20:51:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:46:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 76785a3f6c7baa5689a2fc691a9ceb2e0914e964
X-Git-Newrev: 8c01db167d2ad84ddd74a55472b1f5c3f957dbf4
X-Patchwork-Hint: ignore
Message-Id: <20261013205107.306A8956D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-soupsieve: bump to version
 3.0.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8c01db167d2ad84ddd74a55472b1f5c3f957dbf4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
