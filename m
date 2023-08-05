Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520AFC001DE
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 17:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C16BD410CB;
	Sat,  5 Aug 2023 17:38:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C16BD410CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16H8vs9UAv_2; Sat,  5 Aug 2023 17:38:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A7C14062E;
	Sat,  5 Aug 2023 17:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A7C14062E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 618341BF860
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A434640382
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:38:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A434640382
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oQ8ppFHTew9i for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 17:38:18 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C31A84036A
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 17:38:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C31A84036A
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C7589A4C1043;
 Sat,  5 Aug 2023 19:37:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58718)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSLDr-0001nw-1k;
 Sat, 05 Aug 2023 19:37:51 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Aug 2023 19:37:31 +0200
Message-Id: <20230805173749.1570940-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230805173749.1570940-1-bernd@kuhls.net>
References: <20230805173749.1570940-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691257071;
 bh=a0Q17qN7R9UjDQgFgZo+9Yh1f/FWaFSzrbjiFfdh5YE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Yv3NLaxTNMzmfDHk/OUZ50iCz8JYnS7BqaycMtK/qTfL8pD6OCT1Xw+mQh4mVHsr4
 V5re65vRiJxFklJs4OV2HsYK0mTOo1Y22iyq9jSXgln0GAx9+jTWFNpycXxgvy/Dc1
 MCCGi9ofNdvNuLMGkGY1/wpKxhzYvJEeOtqXglXh34o+2+0zUtM7yICt198gAI8nGa
 5C3+Xza9qIdX3SKsFwRJNrfwb61rZPN8din5NPeWW5UBlvYwrTJbX694earHOYnRDS
 TmkEDGTKv0reCW6rdbFTTvsivQ+FF886an8unOGOPv6pZQsAio036YDggI14z6GEid
 Ph1U8sLdO0BQw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Yv3NLaxT
Subject: [Buildroot] [PATCH 02/20] package/python-backcall: switch from
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
 package/python-backcall/python-backcall.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-backcall/python-backcall.mk b/package/python-backcall/python-backcall.mk
index 2ead3421a8..ea9ffb863c 100644
--- a/package/python-backcall/python-backcall.mk
+++ b/package/python-backcall/python-backcall.mk
@@ -7,7 +7,7 @@
 PYTHON_BACKCALL_VERSION = 0.2.0
 PYTHON_BACKCALL_SOURCE = backcall-$(PYTHON_BACKCALL_VERSION).tar.gz
 PYTHON_BACKCALL_SITE = https://files.pythonhosted.org/packages/a2/40/764a663805d84deee23043e1426a9175567db89c8b3287b5c2ad9f71aa93
-PYTHON_BACKCALL_SETUP_TYPE = distutils
+PYTHON_BACKCALL_SETUP_TYPE = setuptools
 PYTHON_BACKCALL_LICENSE = BSD-3-Clause
 PYTHON_BACKCALL_LICENSE_FILES = LICENSE
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
