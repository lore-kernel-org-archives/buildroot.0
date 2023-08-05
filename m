Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B07C001DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 17:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E58824168F;
	Sat,  5 Aug 2023 17:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E58824168F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fNX75k_N9AqM; Sat,  5 Aug 2023 17:40:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9029404CE;
	Sat,  5 Aug 2023 17:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9029404CE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3A6451BF860
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFC6960C2D
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFC6960C2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mzkyDZXiE1eY for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 17:39:31 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3B9160E58
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 17:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3B9160E58
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1D4D4A4C10B6;
 Sat,  5 Aug 2023 19:37:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58718)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSLDr-0001nw-2n;
 Sat, 05 Aug 2023 19:37:51 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Aug 2023 19:37:37 +0200
Message-Id: <20230805173749.1570940-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230805173749.1570940-1-bernd@kuhls.net>
References: <20230805173749.1570940-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691257072;
 bh=jAYBYlB+fsYmtGEn8m4gQNxNK/xUoQ7AvjV7X1LapHM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yrOAGjNY1PN9BSQhqj/qMAYjJ9fXyRIflsGJ19UMoRswY1cCTeK2tbvZaDdETuKGJ
 vz0cN05r7dmZOUieizxFa4QMcJJul5HfNVmDJ055Gzsp958DfHzR7GhJR945MSvNuh
 lHLupV0mNYNgfBoqKcmx/Cm+vKumlipQ1oOs/FjynpNi0lyS62+x+gEhEQXdh2Angn
 9dQiiCgZxFLkNeDN7b0xCrVbOUp6qMYNsCD4tdZfLUxot/Aa8haHT5EnB6w1zY4cCv
 BkZW9DNcDZic8D/NC4o0xfNYYC8F9BW7g8Bu3V/lYpzFaX9sXoU5pMlOHV4eerCdac
 kRUm19pQnYq2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=yrOAGjNY
Subject: [Buildroot] [PATCH 08/20] package/python-ipy: switch from distutils
 to setuptools
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
 package/python-ipy/python-ipy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-ipy/python-ipy.mk b/package/python-ipy/python-ipy.mk
index 2a01daf4ca..ec03adcb60 100644
--- a/package/python-ipy/python-ipy.mk
+++ b/package/python-ipy/python-ipy.mk
@@ -9,6 +9,6 @@ PYTHON_IPY_SOURCE = IPy-$(PYTHON_IPY_VERSION).tar.gz
 PYTHON_IPY_SITE = https://files.pythonhosted.org/packages/64/a4/9c0d88d95666ff1571d7baec6c5e26abc08051801feb6e6ddf40f6027e22
 PYTHON_IPY_LICENSE = BSD-3-Clause
 PYTHON_IPY_LICENSE_FILES = COPYING
-PYTHON_IPY_SETUP_TYPE = distutils
+PYTHON_IPY_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
