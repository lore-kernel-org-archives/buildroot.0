Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAE6C001DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 21:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B540060BDD;
	Sat,  5 Aug 2023 21:53:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B540060BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KW6D0woc2xxj; Sat,  5 Aug 2023 21:53:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF85C60D8E;
	Sat,  5 Aug 2023 21:53:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF85C60D8E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 153C51BF2C2
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 21:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A057400C6
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 21:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A057400C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OQo3Md-_LGeP for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 21:52:50 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 430E3403C0
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 21:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 430E3403C0
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 055F0A4C1099;
 Sat,  5 Aug 2023 23:52:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53572)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSPC0-0003mb-2N;
 Sat, 05 Aug 2023 23:52:12 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Aug 2023 23:52:12 +0200
Message-Id: <20230805215212.3637412-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230805215212.3637412-1-bernd@kuhls.net>
References: <20230805215212.3637412-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691272333;
 bh=lo6Vb5Ip/8Q9v9/+5FX8dIr9CTw8iqA/pqjaU/MSffE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K4N9r/EvxCKwB1W7z6q1BGkcIwjSDZ92qM3qw4xskxF+FNfd3OlGY/Vt+nBa/2Fwt
 hr119IivPdZSwhMBRlLPk+E3gL/d9cVmncgLfSPnmcLaVkFfKiUg8smwew7N3i4SuH
 BczH1m9qPLg7ZZ/ZACu3ObcP89O5w8OU99XWFCfJYkXR48dv9JtCACMFrVFg+MsVKL
 94eU2047eXxiTRPHJKoQaIz9+1DqBZB84IuWYic6iUHu3VBmzK/fVybDzt20DO0UB0
 HRTdvOtaL+qDGBxZ30nz6oxnsvEM2gHT0/qWZ9wKxwzxqyDnQsAQkM/IfS5gk/v3Sv
 GEUA+Y4xRSSOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=K4N9r/Ev
Subject: [Buildroot] [PATCH 4/4] package/python-pycups: switch from
 distutils to setuptools
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
 Thijs Vermeir <thijsvermeir@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

distutils will be dropped with python 3.12.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pycups/python-pycups.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pycups/python-pycups.mk b/package/python-pycups/python-pycups.mk
index 41da3641a0..bf61400afe 100644
--- a/package/python-pycups/python-pycups.mk
+++ b/package/python-pycups/python-pycups.mk
@@ -7,7 +7,7 @@
 PYTHON_PYCUPS_VERSION = 2.0.1
 PYTHON_PYCUPS_SOURCE = pycups-$(PYTHON_PYCUPS_VERSION).tar.gz
 PYTHON_PYCUPS_SITE = https://files.pythonhosted.org/packages/0c/bb/82546806a86dc16f5eeb76f62ffdc42cce3d43aacd4e25a8b5300eec0263
-PYTHON_PYCUPS_SETUP_TYPE = distutils
+PYTHON_PYCUPS_SETUP_TYPE = setuptools
 PYTHON_PYCUPS_LICENSE = GPL-2.0+
 PYTHON_PYCUPS_LICENSE_FILES = COPYING
 PYTHON_PYCUPS_DEPENDENCIES = cups
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
