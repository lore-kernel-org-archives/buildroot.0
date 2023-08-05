Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709A5C001DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 17:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D2FC415EF;
	Sat,  5 Aug 2023 17:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D2FC415EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GSyaoWXFCXHh; Sat,  5 Aug 2023 17:39:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8E1740200;
	Sat,  5 Aug 2023 17:39:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8E1740200
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 21DC41BF860
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E74CB60B09
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E74CB60B09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RIw7amSwVObo for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 17:37:54 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E35660E62
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 17:37:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E35660E62
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B11A7A4C0366;
 Sat,  5 Aug 2023 19:37:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58718)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSLDp-0001nw-0u;
 Sat, 05 Aug 2023 19:37:51 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Aug 2023 19:37:30 +0200
Message-Id: <20230805173749.1570940-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691257071;
 bh=D8hIK2i3nyfiG8pfgRJV7lFmPT0hswquwsAev4qOLsM=;
 h=From:To:Cc:Subject:Date:From;
 b=KndkuD17gPbbsJNFVeAi2NFSWXpZwmICt7e/hOuF0YcwomQ1w4B26vCTiF8UhxTfC
 AcN19hKfJ2xIlqTQwJirMtIPxWowaNz3JoqM7cliLG6eu9ZlH3G2uqgQ0wzj6uIn8w
 xmAg/zl8e5gis+m3qIZ/oVE5jUjkn4kmUlxKIiPuI0P1InPRFdqWhcYBsqZKtMZ3m9
 HVU63rMqqTVyIRxGWlRAM3X9SFgj8AeYzLuOCjL4c+Hl6OlUyrhkp4yKkiCXX43wXZ
 8Ey+n24CjOvmZ3uhaU+fyntRnU6U97Od53yMpLoVWZR2SgF4Bc6dbG7eD+CYCd91WI
 QybTRqSm7m6Kw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=KndkuD17
Subject: [Buildroot] [PATCH 01/20] package/python-aiologstash: switch from
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Steve Calfee <stevecalfee@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

distutils will be dropped with python 3.12.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-aiologstash/python-aiologstash.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-aiologstash/python-aiologstash.mk b/package/python-aiologstash/python-aiologstash.mk
index be1c40b714..de0ed820a0 100644
--- a/package/python-aiologstash/python-aiologstash.mk
+++ b/package/python-aiologstash/python-aiologstash.mk
@@ -7,7 +7,7 @@
 PYTHON_AIOLOGSTASH_VERSION = 2.0.0
 PYTHON_AIOLOGSTASH_SOURCE = aiologstash-$(PYTHON_AIOLOGSTASH_VERSION).tar.gz
 PYTHON_AIOLOGSTASH_SITE = https://files.pythonhosted.org/packages/1c/dc/382861d5d25ccc976d02118922598fc4547f74f3287793e270ed614d8176
-PYTHON_AIOLOGSTASH_SETUP_TYPE = distutils
+PYTHON_AIOLOGSTASH_SETUP_TYPE = setuptools
 PYTHON_AIOLOGSTASH_LICENSE = MIT
 PYTHON_AIOLOGSTASH_LICENSE_FILES = LICENSE
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
