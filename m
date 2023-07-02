Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D339EB64D9
	for <buildroot@archiver.kernel.org>; Sun,  2 Jul 2023 10:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDD0E41624;
	Sun,  2 Jul 2023 10:31:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDD0E41624
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id raRW8r10umV1; Sun,  2 Jul 2023 10:31:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4C41414FA;
	Sun,  2 Jul 2023 10:31:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4C41414FA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 148531BF28F
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 10:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF2E2812BD
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 10:31:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF2E2812BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e9h-Zg57ePvv for <buildroot@lists.busybox.net>;
 Sun,  2 Jul 2023 10:31:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50B188128D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50B188128D
 for <buildroot@buildroot.org>; Sun,  2 Jul 2023 10:31:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 198A9A4C00B7;
 Sun,  2 Jul 2023 12:31:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44582)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qFuMT-0008Op-2d;
 Sun, 02 Jul 2023 12:31:21 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  2 Jul 2023 12:31:21 +0200
Message-Id: <20230702103121.289122-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688293882;
 bh=MeuOt3l5QcyE0w1v9tjwV1Wv9ViYc1l28ZLPDnxlEqc=;
 h=From:To:Cc:Subject:Date:From;
 b=ZijGNyjhh9jauk5faj3nguyQAPU/fHP8JqYsG+SLmh2Wrd181ZlFVZC1W5VgJbZOg
 RYXudzeRy40NJ42LqNsQBeTMgOLg5wBYeTWml1mvhj0Cgq8DzcS33B8FiX12yAWWvY
 Exo0JJfDBeoBZxmlE89wTGg/f4Ifq2KN2VRc2xbR6R31rULohmphn2APnQ0PG1GAZv
 o8PO9gaOOp1SJloFsP0kX8ZTPyDzkXUO2g5fT9AHqFY0fBrudNogqELe7BG6PCuSsU
 Q//r82IMAk8Q+Eaze+WADV8yryZi9iYulFmQMZLh3ItcXkUjJCCS9EZrHAdWwCTPYH
 6jiAPxWh/ws5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=ZijGNyjh
Subject: [Buildroot] [PATCH v4 1/1] package/python-pyicu: fix build
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/977/977c043615603dd3541e23b81c5f11374606aff6/

Set environment variables to cross-compile friendly values, this prevents
icu-config picking up host libraries:
https://gitlab.pyicu.org/main/pyicu/-/blob/main/setup.py#L89
https://gitlab.pyicu.org/main/pyicu/-/blob/main/setup.py#L179
https://gitlab.pyicu.org/main/pyicu/-/blob/main/setup.py#L216

This follows the upstream build docs:
https://gitlab.pyicu.org/main/pyicu#building-pyicu

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v4: removed variable ICU_BASE (Thomas)

 package/python-pyicu/python-pyicu.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/python-pyicu/python-pyicu.mk b/package/python-pyicu/python-pyicu.mk
index 090ed51bff..213c099d07 100644
--- a/package/python-pyicu/python-pyicu.mk
+++ b/package/python-pyicu/python-pyicu.mk
@@ -12,4 +12,10 @@ PYTHON_PYICU_LICENSE_FILES = LICENSE
 PYTHON_PYICU_DEPENDENCIES = icu
 PYTHON_PYICU_SETUP_TYPE = setuptools
 
+PYTHON_PYICU_ENV += \
+	ICU_VERSION="`$(PKG_CONFIG_HOST_BINARY) icu-i18n --modversion`" \
+	PYICU_CFLAGS="`$(PKG_CONFIG_HOST_BINARY) icu-i18n --variable=CXXFLAGS`" \
+	PYICU_LFLAGS="`$(PKG_CONFIG_HOST_BINARY) icu-i18n --libs-only-L` \
+		`$(PKG_CONFIG_HOST_BINARY) icu-i18n --libs-only-l`"
+
 $(eval $(python-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
