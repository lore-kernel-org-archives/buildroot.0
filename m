Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7F3C43458
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 13:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B76C960763;
	Mon, 13 Jul 2026 13:00:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yOUEEc-_P_QJ; Mon, 13 Jul 2026 13:00:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E05256067C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783947600;
	bh=CIU4J5kYypaUSCxUNxsuoSRQQuyT6A91OlJ8Mn4oB60=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=JOtCutYUbulLJaW6aMybgKjdt3kg5llP1izF26DNWI/SzsU6eIAvxyIf55FEkvmG3
	 NPHx5Evlzk7EW6l+zq15dEoA2f5dbwh4GGmENcj/LucvQwBcDQaSoODlSyBFAqxJcK
	 BIbmF40dGM1pogwYjd1pNXOj5lA4LfnfXMlFQONaM7yZnU3glDvCvbLqzHgTgYwfM1
	 keTc6viT2e5gG+uk7nJ5kxirfZXpK0vvqSfBE+ixIFJNcteZ2IVWY1XUK1PRqMOfLq
	 z/5gbk3pUoRKCSlNFWhFv7n3ME2nF7mibWZaCa6MH51diXQiR+NYxenfLyW58JPUOV
	 7f3w7fVIwrFJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E05256067C;
	Mon, 13 Jul 2026 12:59:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 21ADA28D
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 12:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1321660649
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 12:59:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1xLIca2Kj-N1 for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 12:59:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.10.208.47;
 helo=mout-b-107.mailbox.org; envelope-from=manuel.diener@oss.othermo.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D1E976067C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1E976067C
Received: from mout-b-107.mailbox.org (mout-b-107.mailbox.org [195.10.208.47])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1E976067C
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 12:59:56 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
 (No client certificate requested)
 by mout-b-107.mailbox.org (Postfix) with ESMTPS id 4gzMwS1J98z3wvY;
 Mon, 13 Jul 2026 14:59:52 +0200 (CEST)
From: Manuel Diener <manuel.diener@oss.othermo.de>
To: buildroot@buildroot.org
Date: Mon, 13 Jul 2026 14:59:19 +0200
Message-ID: <20260713125920.1637369-1-manuel.diener@oss.othermo.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.othermo.de; s=MBO0001; t=1783947592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=k7dLlW7raFvzJl9/regPWpjvTLj1AHJLu+ugDfBFFjg=;
 b=WmY4UOUtvgRNP69yIUNVZkC1siZJ4ZPUfiXc4T21ALZ+bAymk7X50Zf2Okay/YHlLykHmm
 LYH/icnDnQCW0x66C9gDLYZQ1jrvb34CCw0wQDciYx9VurfspmP807dBY8dcDo3UeMiPyZ
 LFtpEpnV92sjhwhqaf1n0ol6AWQFksiwszfxHAI2vieIgzgTsK3ta2Mn4Jzp+crk8VkJB3
 1ZmP9c4iJJ7YVFGZwBVVQDf113/OnL1AwUEUXfopouOKVR8ObzLiepB/ICw45A/bKEjPmS
 bhwis2Wg11LcFElOUDNq9p0sbQ4DKpGZfWjIp/jUKMTmSwsO0va3Gx+0dTGwuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=WmY4UOUt
Subject: [Buildroot] [PATCH] package/python-click: bump to version 8.4.2
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
 Manuel Diener <manuel.diener@oss.othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes here (also including versions 8.4.0 and 8.4.1):
https://click.palletsprojects.com/en/stable/changes/

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
---
 package/python-click/python-click.hash | 4 ++--
 package/python-click/python-click.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-click/python-click.hash b/package/python-click/python-click.hash
index f203312073..81fcefa4a9 100644
--- a/package/python-click/python-click.hash
+++ b/package/python-click/python-click.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/click/json
-md5  7ac811bcb2bdd53ae85afe7e7f9224c2  click-8.3.3.tar.gz
-sha256  398329ad4837b2ff7cbe1dd166a4c0f8900c3ca3a218de04466f38f6497f18a2  click-8.3.3.tar.gz
+md5  e35da284dc6420c59c1885ccb22d9879  click-8.4.2.tar.gz
+sha256  9a6cea6e60b17ebe0a44c5cc636d94f09bd66142c1cd7d8b4cd731c4917a15f6  click-8.4.2.tar.gz
 # Locally computed sha256 checksums
 sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.txt
diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
index 6f63a4df8f..88fc66bc6c 100644
--- a/package/python-click/python-click.mk
+++ b/package/python-click/python-click.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CLICK_VERSION = 8.3.3
+PYTHON_CLICK_VERSION = 8.4.2
 PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
-PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/bb/63/f9e1ea081ce35720d8b92acde70daaedace594dc93b693c869e0d5910718
+PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/76/d4/81420972a676e8ffea40450d8c8c92943e7218a78fe9b64359836cc9876b
 PYTHON_CLICK_SETUP_TYPE = flit
 PYTHON_CLICK_LICENSE = BSD-3-Clause
 PYTHON_CLICK_LICENSE_FILES = LICENSE.txt
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
