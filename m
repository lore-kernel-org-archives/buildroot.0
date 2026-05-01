Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28BCCD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7694D4107E;
	Fri,  1 May 2026 12:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CO0bIjwLgzYd; Fri,  1 May 2026 12:45:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D97240EBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639503;
	bh=+uJcElf4FkQmb7O63sREIQcZVk8u1jWBL7I9ipw7eJg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=aS7AAf1lLGLX4pjmnWHIkTz3hAP1tUjtrmblAdJf5eyLd59fSvYVtq4T+atz/jTIg
	 leLNIqJ3jXV0d1IV6nuitmNz5aoJBSc9+tOciZiIQ8uzUAU+MLCSz16VZsL5FW1jmi
	 55A8CYWKhn2R8/pQZ0nUodDzo+r7N8etsJdEE5xF5HxZKphTevmuoSrosuV7/YIRtu
	 mPsud8SWEI1JQQQP/AY08iFLZ0rGUOpCmQi8scwLjUiPV/fkbJQKUALMC/tbJVfDv6
	 f7SMdFAqOUqAM9uSiWZM11X/afQ5aRoNvu+7C9zdKl7L0h06ynzwaPc6nF7mGUHela
	 MG8IuConQA9cw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D97240EBA;
	Fri,  1 May 2026 12:45:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 089D3127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0647A83E53
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Laud43uQTU7t for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:45:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E137883E2B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E137883E2B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E137883E2B
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:45:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 66E89A4C307E;
 Fri,  1 May 2026 14:31:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1O-000000008NC-3qbu;
 Fri, 01 May 2026 12:31:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:56 +0200
Message-ID: <20260501123100.1918951-71-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638670;
 bh=UCbROT4jGnKFATe9/n6YxJG5+2lVt0otjuK7rizSGM0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hDWVvwsCxVQj2n5CLcDueCcbZUTtsU5YlZ6oMvGSdzyXszguS8FUMjTYJnMNdBrZU
 CAR8bOrUg17Rv+7o85P/Esn36gjRHlo/S95wh5ROz/eGVwmz7ABz8S4Whk+9IskU56
 PCRSjbRlv3gYLX/LUHI5zkognYfDc58jg93tSrpP7Dw1+raMOIoj1SePZzvfeOZKNA
 6pE1qvHegbiG0wejyYtVVi6LeM2PWZ9Fbzpusl+s0chlpCRUCxesspG0Sai8PuL5jB
 vPxedzolx9zBPGGNbrRgVQbUjcVHiiZZJd+mj6bDND+ShtBhWhAmYULcP0GfxMSTuL
 s+l3IaRV0MFzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=hDWVvwsC
Subject: [Buildroot] [PATCH 71/75] package/python-wheel: security bump
 version to 0.47.0
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

https://github.com/pypa/wheel/blob/0.47.0/docs/news.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-wheel/python-wheel.hash | 4 ++--
 package/python-wheel/python-wheel.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wheel/python-wheel.hash b/package/python-wheel/python-wheel.hash
index 7ec38ec86b..4f0640bcd8 100644
--- a/package/python-wheel/python-wheel.hash
+++ b/package/python-wheel/python-wheel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wheel/json
-md5  61fb0c9633fe7492933a8f338db23508  wheel-0.46.3.tar.gz
-sha256  e3e79874b07d776c40bd6033f8ddf76a7dad46a7b8aa1b2787a83083519a1803  wheel-0.46.3.tar.gz
+md5  3e73dfac6b3b47a7d1cd52e81885618f  wheel-0.47.0.tar.gz
+sha256  cc72bd1009ba0cf63922e28f94d9d83b920aa2bb28f798a31d0691b02fa3c9b3  wheel-0.47.0.tar.gz
 # Locally computed sha256 checksums
 sha256  30c23618679108f3e8ea1d2a658c7ca417bdfc891c98ef1a89fa4ff0c9828654  LICENSE.txt
diff --git a/package/python-wheel/python-wheel.mk b/package/python-wheel/python-wheel.mk
index b68a1c102b..ae379b7ed6 100644
--- a/package/python-wheel/python-wheel.mk
+++ b/package/python-wheel/python-wheel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WHEEL_VERSION = 0.46.3
+PYTHON_WHEEL_VERSION = 0.47.0
 PYTHON_WHEEL_SOURCE = wheel-$(PYTHON_WHEEL_VERSION).tar.gz
-PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/89/24/a2eb353a6edac9a0303977c4cb048134959dd2a51b48a269dfc9dde00c8a
+PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/39/62/75f18a0f03b4219c456652c7780e4d749b929eb605c098ce3a5b6b6bc081
 PYTHON_WHEEL_SETUP_TYPE = flit
 PYTHON_WHEEL_LICENSE = MIT
 PYTHON_WHEEL_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
