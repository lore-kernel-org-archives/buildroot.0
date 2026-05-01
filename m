Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49EB1CCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 220EE42674;
	Fri,  1 May 2026 12:41:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DQMyT8BNZ2P6; Fri,  1 May 2026 12:41:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 472A9427FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639298;
	bh=FNbTbcVq01xewBPnfzt7OS/mmIVl/2bTlTsf8IDzW9I=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=V2FiXcUs8zCvkrjm2y6k3MZcRdLUBsQIxyCD7Epx5NPSuL5MWKmVSpY8xLc95ybHf
	 cohAzmgbx86uwyyb8WCooiFLaZ39QyIclJZ2YPYWiphkcCzMNn8wvDi+HY72bm4IG3
	 zoUTEslM9M8/s1XyqDbi7D/BrROu6HMtwOtyZyz6V0F+UPGZcR6LHKYkAloDsEtyPW
	 B7dr9E0C30G5/n/wnJaAMFMTyfx26XuM6RmdkLfUgAERy4TZHUl54Sjjvy2Raa7wc0
	 wQhIoODnNfI0cHAIl4uecYpOtNCYlL+femcQV/8FOGO3xIk5JODQkBHOLMKLLq4//O
	 C8ArUi8gt6OzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 472A9427FE;
	Fri,  1 May 2026 12:41:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D8E85127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D61F66F791
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xwu5t8t_Zq1c for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:41:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BCEAF6F77C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCEAF6F77C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BCEAF6F77C
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:41:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EBC4EA4C2F0A;
 Fri,  1 May 2026 14:31:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1N-000000008NC-1aG0;
 Fri, 01 May 2026 12:31:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:39 +0200
Message-ID: <20260501123100.1918951-54-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638668;
 bh=euSe8A56wJypvTYVxzlFzUth6zdKFkhqjvFtg7CBAMY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=vk7aaIAajMP1fKp1YMJ6yDugrh0DU8vHsWyw7j7sYhEFVLQ7oqzhU9QDpEK5xJk+k
 1XjhUEkq7C6pSg287Pbn6eRQGxZPSNHRWec2ACb8t5/I9VgGx0Qra0NV4xK+isggaE
 rXqwgvWgC6yOR1c+DZhgl9CwsxQDKJLNvkKMWoPbziWhFH0vstROIb4N4Xa6jLKDdF
 aJBw0OPUiZt/AjVU2fLuNNjAjzoJdauH0mNhbIhJIzSgFNIT1/YVyAG8gQYxuqYspd
 nu2fpizVK3FEhJNibP9VQrz/lrmLn4QIhIEaGweH7JU+/n4Z7zFEtbhB9OfADuNtUY
 KLp0AVFKBekhw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=vk7aaIAa
Subject: [Buildroot] [PATCH 54/75] package/python-sentry-sdk: bump version
 to 2.58.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/getsentry/sentry-python/blob/2.58.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index 8ec550c4e9..f1d47352c2 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  e8e3d9ea3aa3c7fdc465b33b10505aa3  sentry_sdk-2.54.0.tar.gz
-sha256  2620c2575128d009b11b20f7feb81e4e4e8ae08ec1d36cbc845705060b45cc1b  sentry_sdk-2.54.0.tar.gz
+md5  05b3bf19415d54f831e52d83e4371ce9  sentry_sdk-2.58.0.tar.gz
+sha256  c1144d947352d54e5b7daa63596d9f848adf684989c06c4f5a659f0c85a18f6f  sentry_sdk-2.58.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2a140d660f462812fa290bc740d04633126c5ec45d84b79b569e127b0eeddd0b  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index 21795bf449..585a1c2cda 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 2.54.0
+PYTHON_SENTRY_SDK_VERSION = 2.58.0
 PYTHON_SENTRY_SDK_SOURCE = sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/c8/e9/2e3a46c304e7fa21eaa70612f60354e32699c7102eb961f67448e222ad7c
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/26/b3/fb8291170d0e844173164709fc0fa0c221ed75a5da740c8746f2a83b4eb1
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
