Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9769C25B77
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 06:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68D2C605C6;
	Wed, 22 May 2024 06:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id onKjsitzIX5H; Wed, 22 May 2024 06:44:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6351E60810
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6351E60810;
	Wed, 22 May 2024 06:44:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 960321C57E5
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 06:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82C4440BC1
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 06:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OQSNisvMYiqA for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 06:44:10 +0000 (UTC)
X-Greylist: delayed 920 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 22 May 2024 06:44:08 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4A18140181
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A18140181
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.41.74;
 helo=smtp33.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
Received: from smtp33.i.mail.ru (smtp33.i.mail.ru [95.163.41.74])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A18140181
 for <buildroot@buildroot.org>; Wed, 22 May 2024 06:44:08 +0000 (UTC)
Received: by smtp33.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1s9fhl-0000000HXIM-49gq; Wed, 22 May 2024 09:44:06 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 09:44:04 +0300
Message-ID: <20240522064404.461657-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD99EF2330544E8CB05C63CBC338F1BCC9C43DD7B9A92E97C7E182A05F538085040225347A28F04C72B89CEA9C911D0999540D3D92F045C7D574DFCB0C448B13E5E0500D44FB07FD8B9
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7C2204D4F9A221771EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063703E3935C5A8197E98638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D845C8853723A64B223EC87772CDC1B3523F8A13C851C8292720879F7C8C5043D14489FFFB0AA5F4BFA417C69337E82CC2CC7F00164DA146DAFE8445B8C89999728AA50765F790063778FF21EF0A487A47389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC83E12B096E30173B4F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA7E827F84554CEF5019E625A9149C048EE33AC447995A7AD187441229DB5CFFAA63A03B725D353964B062BEEFFB5F8EA3E35872C767BF85DA227C277FBC8AE2E8BDAE3FA6833AEA0C275ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A5D6524ED0077807EF5002B1117B3ED696880C2E9F676EC29E47A99E6294EE8661823CB91A9FED034534781492E4B8EEAD81B3E0F64AD3EF57C79554A2A72441328621D336A7BC284946AD531847A6065AED8438A78DFE0A9EBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF9325AD4AB654EF28F96E00AE3BA7F20CDA386946786066B17DA116CC32810DAF1F616861E982FD8FA82CB81CB2FB284AF0C35E200F4FCCD6A4AE5738F013DF247549DFC6E04E59EC111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioji7oPwb/+WNDdcbNIpjLamw==
X-Mailru-Sender: 689FA8AB762F7393C6D0B12EA33CAA9BB85A7569247BF7424BA6B16D7D40578CCAE57EDF2DFD8E2B90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=cdo+NAEPm2ZMLodzl1ZWBP6Lmz8DIUgawWPjr8J0PIQ=; t=1716360250; x=1716450250; 
 b=XRec5PnJmm5hXpjwhEpB9fNqW87vPQWH/Llce1c9MT6Wn4LDTBVpMvQSAOSP0lN9EKIJ49Og6mA
 fMO/epJiVhN7bUhOhUk5PqlLGnbZrF90xPCSMReSnRIJKBkIoDkmqMl+n6Uq5lW3lTxdb3+5Hixmg
 8QDE3AGTFRn2h0xxBkdrOd8LZr5Ss6Pf7OM+QjUhzlXR3rlRfue1Pgm2UFZau+1dV+M4fA3D36hig
 O0SgliGNT26XnzDIC31SJ0fxkV0HrzoyTD6UjC3NYduCcb2rTDfR3/ieTpTev98otBZ5hqgkHpI1W
 wuGZC9qx6VxZbVwf7SOr/Gb9l1guI3+1v31A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=XRec5PnJ
X-Mailman-Original-Authentication-Results: smtp33.i.mail.ru; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/postgresql: security bump version
 to 16.3
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

Release notes: https://www.postgresql.org/about/news/postgresql-163-157-1412-1315-and-1219-released-2858/

Fixes CVE-2024-4317.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 6c3f561f7e..d917a03ebb 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v16.2/postgresql-16.2.tar.bz2.sha256
-sha256  446e88294dbc2c9085ab4b7061a646fa604b4bec03521d5ea671c2e5ad9b2952  postgresql-16.2.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v16.2/postgresql-16.3.tar.bz2.sha256
+sha256  331963d5d3dc4caf4216a049fa40b66d6bcb8c730615859411b9518764e60585  postgresql-16.3.tar.bz2
 # License file, Locally calculated
 sha256  9bf20ee493926a7e17a74bc7f05089fbc014269667b1540bc35a6b194a40c9de  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 0448e71892..0a1d98079a 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 16.2
+POSTGRESQL_VERSION = 16.3
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
