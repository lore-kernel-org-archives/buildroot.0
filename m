Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD69C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 07:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC22E4099C;
	Thu, 30 Dec 2021 07:50:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zT05Q0uDJvjy; Thu, 30 Dec 2021 07:50:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 165204097E;
	Thu, 30 Dec 2021 07:50:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C75A1BF39C
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 07:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AB8081425
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 07:50:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=inbox.ru
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Is7ksCtiUEKY for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 07:50:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6666980DA5
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 07:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=9vjaRE22ulQuXI9PUSrhLAPucUqw+wwohPOWi2P7yrA=; 
 t=1640850632;x=1641456032; 
 b=Xnshi1VdHE4lEphC0vUeza5uYVvx+XxbEdEH7DZJrKfgC84k4lACfLI+F9g9/vK2xxrWX3+lF1nJvYlU1xjax+/3vLx/tZqIN0bNzuUDC+8vC4SNPwdALJ61yG2ub7WS2EE3KNM1jUSgwfKxxXY0SMrw1gEqamt/lJcJ60CCfah1RVInjd838nvj6ysZTC2f0QcVap3ib43wqmE2lGKc+1EOzoDWUQeSWKz53eR41IJSWK5Gpzz+cLFU/FnO85PEBongJ/IKalexHD0Weq7H3QNve+OgCzo9ImpibepQi3E0BKTYUjEkJEHHhYKyb/e3Iy5AEoUVJ8Nn+U16VKiOLg==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1n2qCj-0005cF-TB; Thu, 30 Dec 2021 10:50:30 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 10:50:28 +0300
Message-Id: <20211230075028.534887-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: smtpng1.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD94D5EF110843E6A67CFD1AE5BAEA5D6B2A1F98ABF68DFDC63182A05F538085040685F2CD11FCBBFAE1352DF94B0687D5F8E992FD5233B08CDEEE2EA85675214E8
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7E50EC9128971FD6EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637DC5B68A43B0CFEA28638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8380F804FD96CDEDC846115AE18B475E96F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE72259174B9FE3C4009FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18CB629EEF1311BF91D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B8C7ADC89C2F0B2A5A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CD1D040B6C1ECEA3F43847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C98DCDA00E01585920DBB92B3DF09FCB9F20381C8A696741D9C2B6934AE262D3EE7EAB7254005DCED5A97DF525E989D7C1E0A4E2319210D9B64D260DF9561598F01A9E91200F654B069F8FEF10F1C2C2993EDB24507CE13387DFF0A840B692CF8
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D349320586B19AD2C721353281E1FA2087F0802C0F0601E1EF8F281C29AD0D08CAD396C9910EE31E2351D7E09C32AA3244CE6993009C9ECD6F2A98EA4345245A0A2795D98D676DD64D0729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj1qmHCAeuKqNtGgV/IcKfcg==
X-Mailru-Sender: 689FA8AB762F739339CABD9B3CA9A7D61A771043546905DE892509DB92BC942F98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Subject: [Buildroot] [PATCH 1/1] package/libosmium: bump version to 2.17.2
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/osmcode/libosmium/releases/tag/v2.17.2

Since commit ac5a20e64b: "Github actions: Use lz4 library in CI builds"
lz4 is mandatory dependency, so move it to permanent dependencies list.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/libosmium/Config.in      | 1 +
 package/libosmium/libosmium.hash | 2 +-
 package/libosmium/libosmium.mk   | 8 ++------
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/libosmium/Config.in b/package/libosmium/Config.in
index 9f002d3516..3a4c64e9d2 100644
--- a/package/libosmium/Config.in
+++ b/package/libosmium/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBOSMIUM
 	depends on BR2_USE_WCHAR # boost
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_PROTOZERO
+	select BR2_PACKAGE_LZ4
 	help
 	  A fast and flexible C++ library for working with OpenStreetMap
 	  data. Libosmium works on Linux, macOS and Windows.
diff --git a/package/libosmium/libosmium.hash b/package/libosmium/libosmium.hash
index ce3c7b6020..564b7c07d7 100644
--- a/package/libosmium/libosmium.hash
+++ b/package/libosmium/libosmium.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6faa7952aa1210dcd9ae4ef83e7653a4f8eb880e6a4e5b37f87a5d4835f6327b  libosmium-2.17.1.tar.gz
+sha256  f30e37c28f37ca3857b8107a12e6d138a0719831eca52a836692909801c8b0bd  libosmium-2.17.2.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/libosmium/libosmium.mk b/package/libosmium/libosmium.mk
index a969f2c4dc..82dd274bba 100644
--- a/package/libosmium/libosmium.mk
+++ b/package/libosmium/libosmium.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBOSMIUM_VERSION = 2.17.1
+LIBOSMIUM_VERSION = 2.17.2
 LIBOSMIUM_SITE = $(call github,osmcode,libosmium,v$(LIBOSMIUM_VERSION))
 LIBOSMIUM_LICENSE = BSL-1.0
 LIBOSMIUM_LICENSE_FILES = LICENSE
 LIBOSMIUM_INSTALL_STAGING = YES
-LIBOSMIUM_DEPENDENCIES = boost protozero
+LIBOSMIUM_DEPENDENCIES = boost protozero lz4
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 LIBOSMIUM_DEPENDENCIES += bzip2
@@ -23,10 +23,6 @@ ifeq ($(BR2_PACKAGE_LIBGEOS),y)
 LIBOSMIUM_DEPENDENCIES += libgeos
 endif
 
-ifeq ($(BR2_PACKAGE_LZ4),y)
-LIBOSMIUM_DEPENDENCIES += lz4
-endif
-
 ifeq ($(BR2_PACKAGE_PROJ),y)
 LIBOSMIUM_DEPENDENCIES += proj
 endif
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
