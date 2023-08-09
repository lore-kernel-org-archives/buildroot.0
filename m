Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C42C001E0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 17:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 109F94086B;
	Wed,  9 Aug 2023 17:15:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 109F94086B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MDeBxONGgEnQ; Wed,  9 Aug 2023 17:15:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE794418DD;
	Wed,  9 Aug 2023 17:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE794418DD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBDB41BF3B9
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A53D040525
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A53D040525
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3KTSkkdz1XVM for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 17:15:18 +0000 (UTC)
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.154])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB2CA40280
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 17:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB2CA40280
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id D39E0E8D
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 19:15:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out001.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Syz2aohEP72 for <buildroot@buildroot.org>;
 Wed,  9 Aug 2023 19:15:15 +0200 (CEST)
Received: from int-mx002.mykolab.com (unknown [10.9.13.2])
 by mx.kolabnow.com (Postfix) with ESMTPS id 53433B15
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 19:15:15 +0200 (CEST)
Received: from ext-subm003.mykolab.com (unknown [10.9.6.3])
 by int-mx002.mykolab.com (Postfix) with ESMTPS id F3AA1369A;
 Wed,  9 Aug 2023 19:15:14 +0200 (CEST)
From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 19:15:01 +0200
Message-Id: <20230809171501.1329182-3-zgyarmati@zgyarmati.de>
In-Reply-To: <20230809171501.1329182-1-zgyarmati@zgyarmati.de>
References: <20230809171501.1329182-1-zgyarmati@zgyarmati.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kolabnow.com; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:date:subject:subject:from:from:received
 :received:received; s=dkim20160331; t=1691601315; x=1693415716;
 bh=HcZNMKc0G5aab5Yt4UJ73VweQNTUzBv0fuwxyxMBh9A=; b=QLhl2tDIrLH1
 ldkov5BjFa5QTM0jUDTCv7F2Ivsu5gf23FyIrLorSyACBln4yVXigQcHeQ2jizzU
 XDSrJu5fleRwQT0Arqt94rsDSGQ0rG4yy3EYxTvQ3uHo447kK8oekNXwMVcN1Z5w
 dpv+zwBmvOqw2PCqLD8pBXh0d8w7s+igGugwGpfrRixLSXu4L8S+NcbdIKDj4BNx
 yynBvhUkuG34GH711lZY7nbrCxzG1hnqGX4hyJrxDdt3GEoCrQBsQX5DHp8iEMKY
 FmKUkdrda1BX0E1ArI9GkOBtFZ9L+Wzkq56+dcSPrM2uZYC/1TiWMHgUUYVF4hxN
 eTctRc1bz84Kv2bk0a5z1cEsLjNeqk4/hAhtCk2hLxIe2sEagR837d7LGqBqhhWC
 1400lfqFLWibF/hcfP0elwWh5PBJxraBiN1kCoSCnJAegnqs1ecqhOkB17z/Qv+s
 y/0qUDQLK4Wi0wDtgo/K/RwuGJTZRxQq72SJi58ga6q7BVWsPFG65ifQ2RADra6U
 Ip7XUnXM6tm58ZaPUnhYcCCU3BEFX/sTPncwnNEqeuszN9Gp3v4DNuIKy3zuLz4J
 i9iFdED2iHag6+uYsfhg7uYqEXPKj7nXAUjsxaLDFrJvPnvQ8+DnuN26p3Jz5eJa
 bEqNVH0vG5uX3ekkOkRMQNJjT4QvD2I=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (4096-bit key) header.d=kolabnow.com header.i=@kolabnow.com
 header.a=rsa-sha256 header.s=dkim20160331 header.b=QLhl2tDI
X-Mailman-Original-Authentication-Results: ext-mx-out001.mykolab.com
 (amavisd-new); 
 dkim=pass (4096-bit key) reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
Subject: [Buildroot] [PATCH v1 2/2] package/quazip: also enable for qt6
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
---
 package/Config.in        |  4 ++++
 package/quazip/Config.in |  3 ++-
 package/quazip/quazip.mk | 12 +++++++++---
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 1617f7488a..4715be25dc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -385,6 +385,10 @@ comment "QT libraries and helper libraries"
 	source "package/simple-mail/Config.in"
 endif
 	source "package/qt6/Config.in"
+if BR2_PACKAGE_QT6
+comment "QT6 libraries and helper libraries"
+	source "package/quazip/Config.in"
+endif
 	source "package/tekui/Config.in"
 	source "package/weston/Config.in"
 	source "package/x11r7/Config.in"
diff --git a/package/quazip/Config.in b/package/quazip/Config.in
index bba5eddf3d..4c7a187571 100644
--- a/package/quazip/Config.in
+++ b/package/quazip/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_QUAZIP
 	bool "quazip"
-	depends on BR2_PACKAGE_QT5
+	depends on BR2_PACKAGE_QT5 || BR2_PACKAGE_QT6
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_ZLIB_FORCE_LIBZLIB
+	select BR2_PACKAGE_QT6CORE5COMPAT if BR2_PACKAGE_QT6
 	help
 	  QuaZIP is a simple C++ wrapper over Gilles Vollant's
 	  ZIP/UNZIP package that can be used to access ZIP
diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index bf3b844624..665058d890 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -7,9 +7,15 @@
 QUAZIP_VERSION = 1.4
 QUAZIP_SITE = $(call github,stachenov,quazip,v$(QUAZIP_VERSION))
 QUAZIP_INSTALL_STAGING = YES
-QUAZIP_DEPENDENCIES = \
-	zlib \
-	qt5base
+QUAZIP_DEPENDENCIES = zlib
+
+ifeq ($(BR2_PACKAGE_QT5BASE),y)
+QUAZIP_DEPENDENCIES +=  qt5base
+endif
+ifeq ($(BR2_PACKAGE_QT6BASE),y)
+QUAZIP_DEPENDENCIES +=  qt6base qt6core5compat
+endif
+
 QUAZIP_LICENSE = LGPL-2.1
 QUAZIP_LICENSE_FILES = COPYING
 QUAZIP_CPE_ID_VENDOR = quazip_project
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
