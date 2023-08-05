Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EA7C001DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 17:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A09441684;
	Sat,  5 Aug 2023 17:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A09441684
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2HlIsCp1xalJ; Sat,  5 Aug 2023 17:41:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A549416E2;
	Sat,  5 Aug 2023 17:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A549416E2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83DDA1BF860
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52778820EC
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52778820EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wTx559Rwucep for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 17:40:20 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A8C281DF9
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 17:40:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A8C281DF9
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 59A47A4C10C6;
 Sat,  5 Aug 2023 19:37:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58718)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSLDs-0001nw-0w;
 Sat, 05 Aug 2023 19:37:52 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Aug 2023 19:37:46 +0200
Message-Id: <20230805173749.1570940-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230805173749.1570940-1-bernd@kuhls.net>
References: <20230805173749.1570940-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691257072;
 bh=a0qNL5PMJ1PpLJwKllSVD/Sit09KC5mVfwgCUfl9nLA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vMTQniSY5yEUziUfb/FjC7xbYv3n3yRJotKN04mQdB4oBS9lDPJ0gMXJzAbivGUQU
 /RwjySuIVUhJXQ+vwSmgW3n7mkK6aswX9TIdZtS22cMnbmicExKPdx5g/mVuoas8h1
 tZLNl32xX6gh+RCmCG/k6HDPvPMlv5g5vIj6dpHGbxT5ZGVP3DOhXMVy/v/PT3THdJ
 kbLadlYMmvWcTXO4UCiuyibLaRdZz8XfDcZNKUQCi5/N+eeJH9iH6YSchH2dEsAabP
 iLD+zCO86YReQSmNfuRCrgcjVNRw+DvOzEI/Y6OnVGP81INWIV5VgbkZfF4MCo9PKO
 7biAGSi+JqnZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=vMTQniSY
Subject: [Buildroot] [PATCH 17/20] package/python-pyratemp: switch from
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
 package/python-pyratemp/python-pyratemp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pyratemp/python-pyratemp.mk b/package/python-pyratemp/python-pyratemp.mk
index 055fb3049c..6429729a7b 100644
--- a/package/python-pyratemp/python-pyratemp.mk
+++ b/package/python-pyratemp/python-pyratemp.mk
@@ -9,6 +9,6 @@ PYTHON_PYRATEMP_SOURCE = pyratemp-$(PYTHON_PYRATEMP_VERSION).tgz
 PYTHON_PYRATEMP_SITE = https://pypi.python.org/packages/source/p/pyratemp
 PYTHON_PYRATEMP_LICENSE = MIT
 PYTHON_PYRATEMP_LICENSE_FILES = LICENSE
-PYTHON_PYRATEMP_SETUP_TYPE = distutils
+PYTHON_PYRATEMP_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
