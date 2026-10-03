Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C40CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4120814C9;
	Sat,  3 Oct 2026 13:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HYMTg2idgCny; Sat,  3 Oct 2026 13:57:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 92F2E815D1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035875;
	b=QswRREEdcjPO6Mp1Ar98/ajzauj6EbbM7Wic2J6QfW23ODF9NKWvWVcZ+KXAToJAOuOV
	 gh03EY5ECJJeZw/7Mq3tsjbfSkVlEtdSqCJS5QoCwtYW0+wREhZqj9mEeltaM7xtWqFMo
	 tnxkAVirrCxuvNay4JhlZZIGlkFtq2l+jMlqghBThjmSmkYkXJQ9q6nlEzAndyhcfCifO
	 tXwjjtEoBtxd+zGYOZcDr3bhoDeBpVmopLNxLOpeJ6fms0Hz1eikvTqpzK0fsSRAFRVxq
	 jcFWqgHBAjuwoNla9CmUoTUOqMMhNY7NPCxRWAV+Hbl0XNHPOOCNPwokSRgp37Yjxtw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035875;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sHtFKKff6OyFKA8y2iPJd9C9oC/+AW2JO3PFy4i+lXI=;
	b=enrFMpOou3EsSXs6OjS5C18kntbKDBsNliQPPcoLpkjaCXVvPrsKC0Nf4GoxUp3pRj96
	 TscYRG65EjkvoBlAQ4JbV0qWvaMeLoN9+iF/imCkT8LRqRwlZNuJbLGi5sIZt3adihw5J
	 c4tLVLlGJuvfkszd2ISSKjlcl5RLeHGIJF/bYdqa6XbCwNiF5dZZqRYNXLDlGJyQ8ePOU
	 tGIsEfdCgkbnNp9z4N84VmxrECVzqqDTH07mnEwm3RNn4gCYFz6w6gOufn3BNGxlqO5BU
	 Qpmn/73Qji6epJs3+p8XFVhTloV9ydplh2o4siK5d1hgxpopcbpJH5SsXGGscU11qag==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035875;
	bh=sHtFKKff6OyFKA8y2iPJd9C9oC/+AW2JO3PFy4i+lXI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z7A6PnY8lVAwd1A7uPI7Wqrv5xRj55/0GOSa94DiCo+km2HJvwO1MxBvgG78firLM
	 oXUD6xwUounN2ZVDyBoyO5YLY6+XeLGJMXeqZrxbvb2PREKjHMvqLNwWcYG0n6G05v
	 qwpcLR8D40eH/cH61R5IlJkFh8cHp9EXxcMantZaaie3unqXSh4PuNMUckbkLzzgkD
	 Y7hlu8QgmmE7yXr/cJ1CYE6U5zHg1m+Uo5zkd7X/Ct1oLSKpVD0CSK2ZFMzRX6EP9H
	 C0d9yjapB7LElZG/3pdfAAEFN/tGeGRgxWtWBbEO7Mhng9GIXsjWmtYBZgUuivpgc1
	 6LoUrr5PdvAPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92F2E815D1;
	Sat,  3 Oct 2026 13:57:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 396C29DF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E988941503
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V2Ej-UMEJjDb for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 21F36414EC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035816;
 b=kP4CDEZ/415hURyv1wJpN96WQu61BN3x6cJPjsdDByNHo8ErfZWX0sAMURhbu/zFSh5M
 ncvW48pZ0swGKUbfB9VqLFLTYcEeASYNecBJrIQM7N/vheiOcouRRBfYMeg/AEm8366AS
 d5JZJIV5n6QOsQVivu9ciQUe4ijHdobxzCMpho7aTQUDfaD1EO+PNOmA4dhnKnHRmzMxZ
 80Iff9AIQ0I+1ztrmKo6aU29NEBgblfGxzRvwua46PuLNBb/BscUoP7gnUSbpBhmATiAX
 Ae6gZupZXHw5tSfBsn941KNHdI6MHP0jDpRQLNoWs1eAl39miDVPND/1myQdXfrIJqA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035816;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=AtWN9ewr9cZks2qcxl3L8W8OSO6vyjvL1M8kjtRED7k=;
 b=J+Wp1FKQ5r3LhDYioJpDt6EweJ3QJ9ii4prZ90eRaYaS3sRFrGiwILmSOKWuFoULG1jX
 KyozoQJhq9VbMuTrpo44ROzgBWdBz1uE0la0eiMKcaEYt/LLIKFr0qU0QihmAhytE6dGF
 VwroiiyvLS+/sCSziUDREPyJnm6WJjX1ZktUCeXmeL26BZLlat433u3V4R/tAO0yjtSE+
 gmfESbTJosA4WSIccO4XqyeIApj5704aqVVhUOQQBOeM8ccjFuk2LVWAmTtHpeVfBBwzK
 pgHHx2DP9egVqNTG1GTuVQcmvvaUcFwaNRiC/FAF1v/Ex34BKSoeSEDSPtz+um7+3WA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21F36414EC
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D7EB88EF8; Sat,  3 Oct 2026 13:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2cada09f9a3a47e49d1bbdcc5775896b276dc13
X-Git-Newrev: ed36bce744d66b6392adfed64f8e01c03b95ff48
X-Patchwork-Hint: ignore
Message-Id: <20261003135541.6D7EB88EF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sentry-sdk: bump to version
 2.71.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ed36bce744d66b6392adfed64f8e01c03b95ff48
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index f1d47352c2..322dd2cefa 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  05b3bf19415d54f831e52d83e4371ce9  sentry_sdk-2.58.0.tar.gz
-sha256  c1144d947352d54e5b7daa63596d9f848adf684989c06c4f5a659f0c85a18f6f  sentry_sdk-2.58.0.tar.gz
+md5  079f53404c6f8059a7ae6e39842548d0  sentry_sdk-2.71.0.tar.gz
+sha256  7beb27a22f06396f3a05510c3da6ea10e1c79e02e859993c27ce4ff074e296d6  sentry_sdk-2.71.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2a140d660f462812fa290bc740d04633126c5ec45d84b79b569e127b0eeddd0b  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index 585a1c2cda..645b2665a0 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 2.58.0
+PYTHON_SENTRY_SDK_VERSION = 2.71.0
 PYTHON_SENTRY_SDK_SOURCE = sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/26/b3/fb8291170d0e844173164709fc0fa0c221ed75a5da740c8746f2a83b4eb1
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/67/93/9ef70bfb7346c778caf09b7cd10c17c33f601f2d17019fa1aedcda738b5f
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
