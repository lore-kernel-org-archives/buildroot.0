Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFAECC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 07:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4749F60B6D;
	Thu, 30 Dec 2021 07:55:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id flhzCPVZdC9L; Thu, 30 Dec 2021 07:55:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CC54607FE;
	Thu, 30 Dec 2021 07:55:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CF081BF39C
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 07:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED9FF40297
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 07:55:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=inbox.ru
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TUsJMWpVs6ST for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 07:55:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B08FA400E9
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 07:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=zSEpV30WwQ20wfuavkiHRytmZHa5syOeS29UkOJ4tQM=; 
 t=1640850913;x=1641456313; 
 b=NLK+i4CQpkZk7SqGzhwlbRr3jSaOGAY7nQKwHI0BHXtCBlWgnGF+xKIOKMpqu5aWDG+qi46FvChCbNI4CIU9gAFgkEgJby18TN/1LDpthYs/nJDEucCIslG9zSNC1gBazJSAetzoVFUoQS9cMUXYfZo3JPKkPKMa8wVPHlKQZXvHSAHLI1MQPd0p9GeHVeRtd+az+Qcu7D5mByFQFzCosLUg6jl/eSvOaA+vuCN7xx9DKTZBW0o+CPJcrWvT9O8KCztA6QsxvnLdM/91N83puMyvMmEBWYG1IzAoWHZxIA8GLrDalQubgGSmWtoJ0G3UZdVDfAxc/9qH2ParlrlpcA==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1n2qHG-0003ek-OP; Thu, 30 Dec 2021 10:55:11 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 10:55:09 +0300
Message-Id: <20211230075509.539197-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: smtpng3.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9059F52CFE4D0B70A0D0789D66AE6F473845B1BAF873ABAA6182A05F5380850404C228DA9ACA6FE2776D62F5DE2D30D9ACE0E2635EF57CB67CAB8994F89C3FC45021B7F27C9D7C6A9
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7FFA2A8BF6367A61CEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637DEEC83A7CF8598608638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8FAACEF8F083FBE3E65F03E0BA494D2076F9789CCF6C18C3F8528715B7D10C86859CC434672EE6371117882F4460429724CE54428C33FAD305F5C1EE8F4F765FCF1175FABE1C0F9B6A471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F446042972877693876707352033AC447995A7AD1828451B159A507268D2E47CDBA5A96583BA9C0B312567BB231DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B66F6A3E018CF4DC80089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C98DCDA00E01585920E780D260BCB246CF349A7C2878811099C2B6934AE262D3EE7EAB7254005DCED556CBE7F905700A49510FB958DCE06DB6ED91DBE5ABE359ADBCB5631A0A9D21FB936CB490224F2464EEA7BD89490CAC0EDDA962BC3F61961
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34A503FBFE8BE8FC49C47FB43F13ADFFC16E2CFAC40FFE566C23DF2E093C1605306AA075D023C7CDD31D7E09C32AA3244CEAFAFFAAF11DED03F3462983DAE55DD551E887DA02A9F7BF729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj1qmHCAeuKqNr0NmfcvP8mg==
X-Mailru-Sender: 689FA8AB762F739339CABD9B3CA9A7D62837483D80692D7224ED3E8E9C93449298CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Subject: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to 2.5.1
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

Release notes: https://github.com/timescale/timescaledb/releases/tag/2.5.1

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index 88390bc674..5690ce65b3 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9d67fe70aa01cea5feceb084adc01eca8a082d847f917e68e073ab67e497af76  timescaledb-2.5.0.tar.gz
+sha256  58a34a7a3a571339a019c0ae999b4ebb9f93e1e0cb828501e32bb073e0a25eac  timescaledb-2.5.1.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 39ba9e6ef4..b1e4342fe9 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.5.0
+TIMESCALEDB_VERSION = 2.5.1
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
