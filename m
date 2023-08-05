Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07D1C001DE
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 17:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8061B41600;
	Sat,  5 Aug 2023 17:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8061B41600
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2bdrXcedhZjo; Sat,  5 Aug 2023 17:42:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69E70416B0;
	Sat,  5 Aug 2023 17:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69E70416B0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39C551BF870
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E06F60A8D
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E06F60A8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wh75rdELbU-l for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 17:40:07 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5F3460BAB
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 17:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5F3460BAB
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 488B9A4C10C1;
 Sat,  5 Aug 2023 19:37:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58718)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSLDs-0001nw-0d;
 Sat, 05 Aug 2023 19:37:52 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Aug 2023 19:37:44 +0200
Message-Id: <20230805173749.1570940-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230805173749.1570940-1-bernd@kuhls.net>
References: <20230805173749.1570940-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691257072;
 bh=3di1bVN/dYm9nEwvHMx5KQsDovBY9mVb32Ikg5C3DjI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eMjr8TcWTJHRumTcIb3GuIMCpx0AeBGsjaBnVq5f6PR1N75yVnyFtLkBIf/YURjlw
 PevOaDbGXxWtxnEEAryJ2PqffGhaY5jpCkXjvK8lH/9VG6kxQt/pxwAvzwdFGeEpY9
 8i5y9tTaczTb1Ubg0NFEPM9DNQs7oh02KTTyb1vwOGRSMy1QKPX8nAAf3mzGI8aEke
 qcKyNyoaGKZW5eRqzUg8tt0wQ1rAWUIKC/5GLYLmtHnnWeaX1bDNWes7tBspxJokhS
 ysC/34nlZvhBTapvQo73qr7nAmnQTM06SgnPqXe1d5+b5SV1QIfuBcQon8/NcFsHOC
 iGqJrqJxov8jA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=eMjr8TcW
Subject: [Buildroot] [PATCH 15/20] package/python-pyaes: switch from
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
 package/python-pyaes/python-pyaes.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pyaes/python-pyaes.mk b/package/python-pyaes/python-pyaes.mk
index a738d3c76a..77ec100058 100644
--- a/package/python-pyaes/python-pyaes.mk
+++ b/package/python-pyaes/python-pyaes.mk
@@ -7,7 +7,7 @@
 PYTHON_PYAES_VERSION = 1.6.1
 PYTHON_PYAES_SOURCE = pyaes-$(PYTHON_PYAES_VERSION).tar.gz
 PYTHON_PYAES_SITE = https://files.pythonhosted.org/packages/44/66/2c17bae31c906613795711fc78045c285048168919ace2220daa372c7d72
-PYTHON_PYAES_SETUP_TYPE = distutils
+PYTHON_PYAES_SETUP_TYPE = setuptools
 PYTHON_PYAES_LICENSE = MIT
 PYTHON_PYAES_LICENSE_FILES = LICENSE.txt
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
