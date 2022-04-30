Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D0BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 11:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13AB640390;
	Sat, 30 Apr 2022 11:35:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EGgq22e5mLWu; Sat, 30 Apr 2022 11:35:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 237FC40250;
	Sat, 30 Apr 2022 11:35:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB2D01BF5E0
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 11:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C973A83466
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 11:35:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=inbox.ru
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8RI97Vi5ZRgH for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 11:35:53 +0000 (UTC)
X-Greylist: delayed 00:12:14 by SQLgrey-1.8.0
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB0F981902
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 11:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=9HS5ap61OF2cmH4shBuKiWoyXVmv/QEvenZDMQPLpG8=; 
 t=1651318553;x=1651923953; 
 b=C+NRmSsCkOBwFWirEdtKwNmy6Bf6fYUOv6nGHWNZEMuBdYCtEApDD+OjijxsZU83ErOUFBkojq7CbIf6wIdqh9/BlkGTKUOmHRVAZ3+un1gMcsyxnaAzTblTka9LZ0cBOCy/tp3B66LV/xPsTtUsh0pX/vIhdZ6rFugSTz/AsHjndgQFs2HkJLRyj0/vG3w3lushqJ1LFiZR1TnLCwSf5b1XPzJvgKLBGm/10ZtcpNUjFUNTbpnieP1im7LJzEGpc/uaZMQrNv5m14Vxx6Jc/qgL/LUoUzbS8Yutx9kb0RUkUNZBQepqKpB7xY06kjf7jovD6UkAskmNiDTcK/z2AQ==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1nklOB-0002Cy-4i; Sat, 30 Apr 2022 14:35:51 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Sat, 30 Apr 2022 14:35:48 +0300
Message-Id: <20220430113548.461720-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Authentication-Results: smtpng3.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD977B76FDA87AFA8B9B2D519EC4797FF089ED4AF1ABA776EF6182A05F538085040DA1CF1E2F0F8DB6DAD3AC91AA206A61C05CC24C32B90E796034AB23CAA75CDB0
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7FBCED7D376B82B5EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637BFD6B3F1638522B88638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D801216776B37C7ACD709AA27A1CB71F736F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE78A0F7C24A37A3D769FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD1828451B159A507268D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BECADA55FE5B58BB7A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CA5583D5FF21A78E543847C11F186F3C59DAA53EE0834AAEE
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C242CCBC298CA299A2E885E01BC2C274403FF330B10A4B8579C2B6934AE262D3EE7EAB7254005DCED556CBE7F905700A4A71A35648BE338CE9510FB958DCE06DB58C12E6D310A6D538C7ADC89C2F0B2A5DC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34C264B329661203DAFFA7277DB0A093955A39177318A5EE30422BE374CB2AF0BA3DDB910B645550F01D7E09C32AA3244C75EBDCFAFA1E6AA1A96E487EA27AB59039C99C45E8D137E9729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojpu98ZoqON0YG9KZ2v0gm5g==
X-Mailru-Sender: 689FA8AB762F739339CABD9B3CA9A7D64099EA2CF454A77E4B7D701CD02506CB98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Subject: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to 2.6.1
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

Release notes: https://github.com/timescale/timescaledb/releases/tag/2.6.1

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index 556cdaf329..f186684339 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b1a20832189c22ce378f009f9a24ef1db61d7131f7f79bde74fdcde87bcf2d7c  timescaledb-2.5.2.tar.gz
+sha256  226af207105cc9e2d1744b303e475204a947047103f0e5697de4e8949e4dde75  timescaledb-2.6.1.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 1d8b2a69a7..16fba11e21 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.5.2
+TIMESCALEDB_VERSION = 2.6.1
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
