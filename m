Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABB8C54791
	for <buildroot@archiver.kernel.org>; Sun, 10 Mar 2024 05:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FAC640571;
	Sun, 10 Mar 2024 05:58:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MlNNyOjQTzFV; Sun, 10 Mar 2024 05:58:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED4C940789
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED4C940789;
	Sun, 10 Mar 2024 05:58:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3398D1BF407
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 05:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B4B640789
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 05:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pyMWL9DzWFwG for <buildroot@lists.busybox.net>;
 Sun, 10 Mar 2024 05:58:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.41.75;
 helo=smtp34.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4F8E640571
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F8E640571
Received: from smtp34.i.mail.ru (smtp34.i.mail.ru [95.163.41.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F8E640571
 for <buildroot@buildroot.org>; Sun, 10 Mar 2024 05:58:14 +0000 (UTC)
Received: by smtp34.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1rjCCJ-0000000B326-2Zpm; Sun, 10 Mar 2024 08:58:12 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Sun, 10 Mar 2024 08:58:06 +0300
Message-ID: <20240310055807.442035-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD987C0EE6E7F0A597DDF776407DD463AED7AC1984F64828CE8182A05F5380850402AB8CB3C89354F9133594132A326AF8BBBDD663ACFE70C655B12244B3E127E666837A08AC964547F
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7AED985C8E545F588EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637457C2806CBF873EDEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B73AB1701401CD871E7012A315A1BDD7417A6A2DD7487549F581D362593D9AD821DF9E95F17B0083B26EA987F6312C9EC9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B5278DA827A17800CE7C01153734DE5588D9FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C32423FB45EA749E71117882F4460429728AD0CFFFB425014E868A13BD56FB6657E2021AF6380DFAD1A18204E546F3947C2FFDA4F57982C5F42E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F83C798A30B85E16B156CCFE7AF13BCA4B5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A54B5F8FBA1FAAF5405002B1117B3ED696E1808F588DC260FE33EE06AFCD964888823CB91A9FED034534781492E4B8EEAD303003AC7AA20DD0C79554A2A72441328621D336A7BC284946AD531847A6065AED8438A78DFE0A9EBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF7B6132BBEC938FABAD7E88E6AE7C27604AAD6EC88520FF58D35195578EC35998A54F0D539447C58B748ED927723DE83F9ADC12241D990AA4EB2C9F104A2434CB2FD0AEA910546310111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojuV2YtZBbGDwLPPyZWORnsA==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE334113DC76DD7A972E37AEFD1039BFFCD468BD3D1E9FE4E74A90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=5Vxf0i5dOBTEOBBAzX3/Nrw/VgSzuGhN0CJ6xNbWAfY=; t=1710050296; x=1710140296; 
 b=q8GPZ6g+exCzD0SK5tkaY+h5cSYkoq2/cUjTPNqv8R8wJZ2r1cozpCXvyQrhivnhc65K522hX5N
 oQeMtBkARWKfAUlvZIg1Hom5h2hmrudYauR1gle6WhYXutzzJMG/mbqEhoJaSLHayH1cOo8Uz/8tC
 TAeopyFA5KLHVJsKy9abbDg+UMzVYVsP45DEuZ1Xup73t0efpbTa3NOob+Yty32d11neVvassovC3
 ttSb2AUhMOkLtDeAi6liaVhK+Kela2HXVSbswVCnGdgwjZPxf7KbjzO3QMofpUOksjXxJJ8x/QrHj
 j8d0L5PKL4neLW7Ri4U+YNsSIs7Rq4XNG8yQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=q8GPZ6g+
X-Mailman-Original-Authentication-Results: smtp34.i.mail.ru; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/postgresql: bump version to 16.2
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

Release notes: https://www.postgresql.org/docs/release/16.2/

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index cf859e3505..976b3e6ff9 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v16.1/postgresql-16.1.tar.bz2.sha256
-sha256  ce3c4d85d19b0121fe0d3f8ef1fa601f71989e86f8a66f7dc3ad546dd5564fec  postgresql-16.1.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v16.2/postgresql-16.2.tar.bz2.sha256
+sha256  446e88294dbc2c9085ab4b7061a646fa604b4bec03521d5ea671c2e5ad9b2952  postgresql-16.2.tar.bz2
 # License file, Locally calculated
 sha256  1a7d13c3ab31961b91ba256f77d6e82e0b54bf992253060fe93bdb5466df416a  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 644f93d88a..0448e71892 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 16.1
+POSTGRESQL_VERSION = 16.2
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
