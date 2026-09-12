Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9124C88E5A
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 14:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96EAF406F2;
	Sat, 12 Sep 2026 14:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V1oVwk5oCdqK; Sat, 12 Sep 2026 14:57:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B7764406EB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789225056;
	b=kNrch1M2xKSXBGzQXaN9iv5Qswn2SpSlsXVl8xtwNHJOXtQY4yJ8p1zE6VzL39JPGk4C
	 +qxou7Uvpadw7jZLyMo8WZgAIT6nRT55kS7EPf/1frGKg2qI8bfcY7Ozaks2xoq1RBx7j
	 pH5zbrtlTllXycPtyim2bgede9BWSOKDzQvRA9uGydY0sxkRtfFlR/arHXEQ3EqSOitPD
	 /QKHeQ3O/SpLQNw5e4bGDK3oREH6xPgEpW6SdK9XUQdjxuCfciEGokWegIHJtoGYeSQCd
	 x1wtYAY/qSE+HMXc4oOQ+Xebf7ifOFs3I7uVxPwnqCbKON1TOh+LstLd1qgzArs59GQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789225056;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7+qjYPs5orG32mazEkpYOTut0fTL0TTO61BLkHpPEso=;
	b=VJRfhad+AHU4fQ5pP3i5+ypU2aiwgKF53JcSNKNgeNJvc9h5CgMcmQ6ou43YyBaFMK2K
	 Lu9E1OhR65OuvqS1KMN/jrmPnC+LlriGfbBf7MejncrHHIQGFIDzaUIlEuC6guszRsvts
	 +hGymNKOyMIfiLU5N94uVJiIUd2F5L+nfsdnOHBl/AFWNYOCGlkYnTngJWQrpzJXZ8OaL
	 T2c817CoPsdkUmtPMAV8nZnu/rBsV0a//dkpRh9cd4gL3iGhsEuAV4EeKaS/a/jvkl9z7
	 BG3+izBVXjJMSOCc1s1dYwh2C5q3jNQ/0KKAb+BnyPEb7ZrdIyMAuVXvvnpSEMas9Cg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789225056;
	bh=7+qjYPs5orG32mazEkpYOTut0fTL0TTO61BLkHpPEso=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PTpd1wxH6nnL6l6YOm6uz734iUPacptO/DA4Ja+8wJ7UhNN/FXTpHbXIcgD5pWapC
	 B6TmgyiFSbpzjLrRsW3PivXob+E3zibcB6Uq4L/tCpbOGKfBGX4Sn2IwP9XinBAwvS
	 zUF6gKkdl5UaHH2MkQgIQhySBjn2Q9fihK/Lq2mflLJMD3NOkkDqgHKvIVTzq96MtU
	 DHbTz7ysduA8szJQgfbP4Thffjzi4BbFh+GBaE8rqxt1yymB6K3akP/+RYg4KelM5p
	 YBI6rn7Uqoy18cFDxAochqSbWrd49ZqNumAiiVHJB1UZALa4TN6z7BudjUEvFXwudF
	 GYnECOi6FbM0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7764406EB;
	Sat, 12 Sep 2026 14:57:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 37DC1EB
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D4D180E4F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l4ah3OAKJ24Q for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 14:57:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2B39F80CAF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789225053;
 b=qKJMgAhi0NIoVlx3wCmw2ZjizJFuKYzwki4Rls/zZ7+NAiG5AKL5xH0RyPv8ddxEXjBa
 uxRV0MF+b29yVVfNS42rjtrSHHwwQFtOJFCfJcx1GtmY57qnLRxe45z5CksL/nlS+vW/+
 QS3TUUWhqFqu6xKzfmau/TUIblKBv7Z1Hmiui3ahdfS8Wz/woSJx1Lq721nkIL5uMkkwH
 kr7jF2+YFIzVYlB/VfhTPqjGMCQQY9sR03+eGJr/l/8gSd5fXqaHxdXb09AK5btqhKZ5o
 nuW/dLH0HQ7leNaRBktRW23Tw1znr5iO0W9ZseUUvI5lGgheNob2K1tMtgHGzNkKQ2Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789225053;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xpNhY296J0ucW0Qmc8ISYrZYdOlsrHlbJC9lXpaAPPA=;
 b=jtqppfP5egqcqdMS2JH0Tk+j1pj/sVfgm0nDkRqc78zjZM1aT/kQW2wiIi6pS8beaeuf
 e6lgnpNgfe5921jlX6wyXBt8ILukWvbiEdpwjeSPypFvNtyqjeapsPpEz+UuLHQ3l0deC
 hTGbm8ORoKvZRXXtaItwcR/PDpd10WkxC3W3uxydRBcnh02S7m+2vv+PyeJWGSao2X9c3
 TDC1yoEsog2x8fZUYN9KSKwD9Ttpfl9gmBmD4HxSGg+X0fz0R7BtSY97/33f1K+nHxPod
 UReiDBtFPgbPzsQkqRJgfNpMiPKN6brorOhZ790qi3/NaMnYMlZXOud94rml4GQ9F/A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B39F80CAF
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:57:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA5D09599A; Sat, 12 Sep 2026 14:56:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 16:22:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17be3c2dcd33a57e1a606416146e1f110c09bba2
X-Git-Newrev: 4a63b6269ea4702ee4c239ff77f5425b23b4ef30
X-Patchwork-Hint: ignore
Message-Id: <20260912145628.BA5D09599A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tpm2-pkcs11: bump version to 1.10.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4a63b6269ea4702ee4c239ff77f5425b23b4ef30
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/tpm2-software/tpm2-pkcs11/blob/1.10.1/CHANGELOG.md

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tpm2-pkcs11/tpm2-pkcs11.hash | 3 ++-
 package/tpm2-pkcs11/tpm2-pkcs11.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.hash b/package/tpm2-pkcs11/tpm2-pkcs11.hash
index 5f5abfbbe8..5cde9f01c0 100644
--- a/package/tpm2-pkcs11/tpm2-pkcs11.hash
+++ b/package/tpm2-pkcs11/tpm2-pkcs11.hash
@@ -1,3 +1,4 @@
+# From https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.10.1
+sha256  f3315d17811f918779a1046ba20e49060a40b2b586a06ab013ff8c8da53752e4  tpm2-pkcs11-1.10.1.tar.gz
 # Locally computed:
-sha256  ce24aa5ec2471545576e892b6f64fd873a424371bbf9be4ca3a0e689ea11c9b7  tpm2-pkcs11-1.9.1.tar.gz
 sha256  793aa007f793458434d7cc60b1c827053a399308658b32fcaa6023802adc22e1  LICENSE
diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.mk b/package/tpm2-pkcs11/tpm2-pkcs11.mk
index b26f53de27..7652df94cd 100644
--- a/package/tpm2-pkcs11/tpm2-pkcs11.mk
+++ b/package/tpm2-pkcs11/tpm2-pkcs11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_PKCS11_VERSION = 1.9.1
+TPM2_PKCS11_VERSION = 1.10.1
 TPM2_PKCS11_SITE = https://github.com/tpm2-software/tpm2-pkcs11/releases/download/$(TPM2_PKCS11_VERSION)
 TPM2_PKCS11_LICENSE = BSD-2-Clause
 TPM2_PKCS11_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
