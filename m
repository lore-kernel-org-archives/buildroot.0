Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C75CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EFB84097C;
	Sat, 10 Oct 2026 12:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XxS2dgzaFIvZ; Sat, 10 Oct 2026 12:11:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D331B40981
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791634270;
	b=b5ZSD5HA9koTKUj8B/KNIVxAq+hM/2KjzNloHqaURi8babM0/CXmYxRJXwkqj6DI6kfC
	 mjrkt3+eOlLpybz84ide2RPtJ9gVr95diVTyqCbGTxaz9LuhW16I0HX9krYjZNnvb583R
	 NLT9voAHLdvINeI9C6PG6a1QlGsFmEvGH4ceY5J1zUP6JZZ89eotDMtXr9dl0FX8h1caV
	 mlwV0MMzOTiL6NUS08PZYJqi1cfKUyPuPeJVg2vB/tnu/a1l48BQptwIwTh8KRuPgAKRr
	 VWWCJ1dqSP1+pkRTQK3ExaBUvRAYUkL2cQJN0dIaRCGxIJ1JPPgrpzKh0shB+mbErkQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791634270;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RteRkZ1pV+ml1GWXusIb2og7oN6+ALAH65rs/PXK2hk=;
	b=UaoixUTpgrpgVh6OoMp9J0+1hvVVfz43NfGO2NHqqE6dF7EZRxuesdR/Kc1xsDGeqYFG
	 /H+8zYPGi89kAtfadEtc6gAfJKyy2YmG3tUJ1oR07WC2FBuqqb9QIikNOnRnukSace4KN
	 FEN9tdgZeEnIb4A8VGT8n/B19QdDoIqUrU6odGMjrGOaaPbaohYVrwXG2JQiLplZEIUFV
	 nsVp2CDmL1i2nDUXV6FZzpL9uGj6D+MDsh5/wy6ivMg93AA4ylhWNAVWNi1Yww9PRJ2vs
	 pCdfqskdTcmWpxa3Lfbg8bK/YEy/846I662xFFyxwGuo/LG1zyjy+JHbn/NXdU8702g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791634270;
	bh=RteRkZ1pV+ml1GWXusIb2og7oN6+ALAH65rs/PXK2hk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XffW6kkmG9QrqDNUKSFNbfoXRWNLmy+fpUNXAGuqkgL46i0OcbVq2E1fb4vDyX2et
	 JWjFvh2O6Rew9GkswzxHNKslHZmEatbfNeaqTBt+WCiv4ivbRcwaKnRUIOcB9zDWst
	 a1Ci6MaGLi/WmbIxyOLf5UqVqyIVnxrjG27MgmNrpnfxnS/6IvdL3WfHVk6JP51OwP
	 T0MDbTCW9QAEQnQWhZ3zPqNyAadPJ0c5QCt65m/8Kljeh7mU/2XAOa0XuUsR6ZN56F
	 qNGEoVKKC6r+0uXsZBYuaZ3WkR2Pdmwh1D5QkVqai+me6DMkqanMC97I3MSjhRCBlw
	 qRNVlJoOKuC8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D331B40981;
	Sat, 10 Oct 2026 12:11:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F3957E11
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E27EE812F9
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UJnleDB5HiJL for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1B2A081283
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791634254;
 b=h8UkHZ0OGzpbC5vGh7rG7UdgmxdT3cV6bsvxsB1QPl8Zf4pHzYMLC6jHrAstQhrcO55+
 Y0yIThw94n5y1bC1MuHCAEpeb7AfKnXGUF7Jz467TyM9Pb7Hqs8xH3TS6CUvrz29xZe+S
 3BdOU+d3IrE4Wc1/IaJFsAOp1rOYh+ZP+13vxl8E7TLq+H9ni953H8QAmfyP5agJoPbUz
 DKa1Wv+tc0DJ1bd3OUPt/7FitZ8jHxJsC705LexUG2MbECbP3Kx0XhUQkFztIf2N7KeSp
 JtAFcCuoKkmZDk71qUkcIVAzom0E8HS8HmuaNGdu4+wAXdd2GjqPD5Pwl7gUwvrDD2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791634254;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=AaHRHqrjzbcv0XqnHBkPXadQPn+TYi9ttdbMx4Kj+bM=;
 b=irK/HCpYitEoYWoUmVzrXSdcnyPtDwWdvNSIbxgaQehooNb6Daq21oQDClxtNANuIGtS
 zeIzU90I0PHi7c/waujgMgCecEULP6WdvCqmO46Gueoxd6NkciSsZIKNv4tQjcM6Qmjff
 G9w5eJIrt4HzDsGSqmWR0RRfsZPSXDwffiP4tzC8kWbXPWKJgaK+uz4KgJhKDvv2VZqdq
 6Rr1ExDaxpRHwN80mDkxZaDprvFdPDZo+50KN8xVxCbMp7rkJRTgfCkI/Rfd55VQSh85H
 032aBPhaphuu/4pTOGPixBaYUknkP4og7bANDd0LTDJ88qrMEH9P4otfJcpIui+Zqkw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B2A081283
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF87691A93; Sat, 10 Oct 2026 12:09:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 14:08:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e40296d38326a9e9e754bae7f5cacfa7d586d1e
X-Git-Newrev: 80fc1472e69671759eb6d047b3b9b1a1388710e4
X-Patchwork-Hint: ignore
Message-Id: <20261010120935.DF87691A93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fastapi: bump to version
 0.142.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/80fc1472e69671759eb6d047b3b9b1a1388710e4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add new python-opentelemetry-api runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-fastapi/Config.in           | 1 +
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/Config.in b/package/python-fastapi/Config.in
index 01163c60f5..dcb403e385 100644
--- a/package/python-fastapi/Config.in
+++ b/package/python-fastapi/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_FASTAPI
 	bool "python-fastapi"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
 	select BR2_PACKAGE_PYTHON_ANNOTATED_DOC # runtime
+	select BR2_PACKAGE_PYTHON_OPENTELEMETRY_API # runtime
 	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
 	select BR2_PACKAGE_PYTHON_STARLETTE # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 3882212eed..df667dca2e 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  5e22f728ab9ea5c99a29a0137b4b8b55  fastapi-0.136.3.tar.gz
-sha256  e487fae93ad408e6f47641ee4dfe389864fd7bec92e547ea8498fc13f43e83ab  fastapi-0.136.3.tar.gz
+md5  8cfa79d6d32628b35a90ad95d4ae14aa  fastapi-0.142.2.tar.gz
+sha256  06366626f2e70576367714d9ab2fe8472e6c8456dba69b399f9f797ab5e92570  fastapi-0.142.2.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 60e0a83369..aeed93022f 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.136.3
+PYTHON_FASTAPI_VERSION = 0.142.2
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/81/2d/ff8d91d7b564d464629a0fd50a4489c97fcb836ac230bf3a7269232a9b1f
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/56/4f/f7c30a73127e0a8bbffe788369b8359e530b01ae06e2757936fa35bc5e6d
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
