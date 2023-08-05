Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FBCC001DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 17:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 386B5416CA;
	Sat,  5 Aug 2023 17:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 386B5416CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fJ5NGKncZ3OF; Sat,  5 Aug 2023 17:44:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF988415FB;
	Sat,  5 Aug 2023 17:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF988415FB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 13A0B1BF860
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F99460B13
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F99460B13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aiysGidZM4pV for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 17:41:20 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37A0360F1F
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 17:41:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37A0360F1F
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7F39DA4C10D0;
 Sat,  5 Aug 2023 19:37:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58718)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSLDs-0001nw-15;
 Sat, 05 Aug 2023 19:37:52 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Aug 2023 19:37:47 +0200
Message-Id: <20230805173749.1570940-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230805173749.1570940-1-bernd@kuhls.net>
References: <20230805173749.1570940-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691257072;
 bh=jjwdJQvduR3Enmcnyxwv83UZiEIURXgC1/4g3Qk+pyA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ActwKTkDpT7Rv64A5t2pUQPSOkKjvCEV6yb5MM69If5q6CrQEWl3606HIwjQbooZO
 aEwZeuAoOb+Sz5t6gcg77wI+7LQOxGYz4MzcsrBqkLm3IRiw2j3SsvGWGpB/rkVSPd
 1/zDPVpMtDTxp9fLuIiXTxF32prK34KVgjKN7ZsCPg4rVpbVftGdJCrItEcWfzGw11
 zuhF6dQDZYOhOrMHRpD23b6Ntcd2gieYa+bera1E+UvPKMvsLGE4E9yOB5K7RlH5ra
 4U15KVWWNTzwTL74nrEQAQ/sEbKayXkefwMPh7waLGCFK7/Xz3BY7K0btLCCvSsoJG
 CYAkKaRiksbcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=ActwKTkD
Subject: [Buildroot] [PATCH 18/20] package/python-sdnotify: switch from
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
 package/python-sdnotify/python-sdnotify.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-sdnotify/python-sdnotify.mk b/package/python-sdnotify/python-sdnotify.mk
index 1b0f2276dc..4e250eee95 100644
--- a/package/python-sdnotify/python-sdnotify.mk
+++ b/package/python-sdnotify/python-sdnotify.mk
@@ -7,7 +7,7 @@
 PYTHON_SDNOTIFY_VERSION = 0.3.2
 PYTHON_SDNOTIFY_SOURCE = sdnotify-$(PYTHON_SDNOTIFY_VERSION).tar.gz
 PYTHON_SDNOTIFY_SITE = https://files.pythonhosted.org/packages/ce/d8/9fdc36b2a912bf78106de4b3f0de3891ff8f369e7a6f80be842b8b0b6bd5
-PYTHON_SDNOTIFY_SETUP_TYPE = distutils
+PYTHON_SDNOTIFY_SETUP_TYPE = setuptools
 PYTHON_SDNOTIFY_LICENSE = MIT
 PYTHON_SDNOTIFY_LICENSE_FILES = LICENSE.txt
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
