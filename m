Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE10BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 11:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82D8084075;
	Sat, 30 Apr 2022 11:44:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tQLLszuLXEzX; Sat, 30 Apr 2022 11:44:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83B6284060;
	Sat, 30 Apr 2022 11:44:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E40F1BF5E0
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 11:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BD7840103
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 11:44:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=inbox.ru
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6hwv53lpEGER for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 11:44:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4067B40022
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 11:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=6WS6M8HLu4q0Iz7s/5mohQdwSAVyxhTkPXLNE55I+uE=; 
 t=1651319051;x=1651924451; 
 b=AFp6L4Zrv4uS8SsOgdzFvLTpPMH/m9gF+QkoXdDb9wjHwbZ3b+zLifHsGALIwEv3BFQwbj0D3voroTPmcUXZvKNWfqpi9ZreKkl8QaHqYxBbKL1ZXaY05FPGEuufcocFDNzslbEP5hbeQnI9rgXuXRaE7yOWnWc751qmEH+KUBOumBB030OV+otKjw91AQlKZuPtMrDkpHpLzF4UfOz2wlWurZywabCwhRlDkeyeenef1692gurU72fln1AeUC/8Ld597pT5HKIRxrhzWB7Sw6jE6dUO9Lbd5trXuMpSjtjLw4LGnp7IosH2Y+RYhTydN2FTGbiSq6WiA7e7ar2EyA==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1nklWC-0003iL-3c; Sat, 30 Apr 2022 14:44:08 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Sat, 30 Apr 2022 14:44:06 +0300
Message-Id: <20220430114406.545127-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Authentication-Results: smtpng1.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9086B0A94CD1F151448582A4BE10ACC7C79FC887CBB8B2133182A05F5380850404C228DA9ACA6FE27EF5B885925869D862A68AC2F4D9D80E93F4BE18FED14EF47C8B3D5D5D8659232
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE782A779A89F7D69B2C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE77AA33865E80AF043EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BEBC5CAB6D411FFA6745E78764906BDBDD76A63DFDA3F0ABA20879F7C8C5043D14489FFFB0AA5F4BFA417C69337E82CC2CC7F00164DA146DAFE8445B8C89999728AA50765F790063735D2385A5E2B3AC3389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8FA486DC37A503D0BF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA7E827F84554CEF5019E625A9149C048EE9ECD01F8117BC8BEE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8B9C5AF73B5E338C8A75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C242CCBC298CA299AA938B147C72ACBA2F6B9898BF8446E9D9C2B6934AE262D3EE7EAB7254005DCED556CBE7F905700A4A71A35648BE338CE9510FB958DCE06DB58C12E6D310A6D53F1175FABE1C0F9B6DC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34E9B0C12ABED5513714E517E3810802C5F84763920E88135207C18C8A24ACCB39C4421E83BBBF8D291D7E09C32AA3244CCA16BA6CB1DA5596009393EB96F0FC4BA8CE788DE6831205729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojpu98ZoqON0YF+eUidfcyGQ==
X-Mailru-Sender: 689FA8AB762F739339CABD9B3CA9A7D677B0A9E9215AF117053CA37A8D47093998CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Subject: [Buildroot] [PATCH 1/1] package/postgis: bump version to 3.2.1
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

Release-notes: https://git.osgeo.org/gitea/postgis/postgis/src/tag/3.2.1/NEWS

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgis/postgis.hash | 2 +-
 package/postgis/postgis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
index 12ca18f84f..018e6523f3 100644
--- a/package/postgis/postgis.hash
+++ b/package/postgis/postgis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7ab9e154c6947c0cffb8fa12d70806add9aa060e62b6c86a2e206f9d4b507cfd  postgis-3.2.0.tar.gz
+sha256  fbab68dde6ca3934b24ba08c8ab0cff2594f57f93deab41a15c82ae1bb69893e  postgis-3.2.1.tar.gz
 sha256  55b69f22e1752830dd565852dc7ff242daf289dbd3a6bfede5db43f90d2e28c9  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index d9cda64730..b77071d03b 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGIS_VERSION = 3.2.0
+POSTGIS_VERSION = 3.2.1
 POSTGIS_SITE = https://download.osgeo.org/postgis/source
 # parallel build issues
 POSTGIS_MAKE = $(MAKE1)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
