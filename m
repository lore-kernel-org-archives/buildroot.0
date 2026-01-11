Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BC7D2502F
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 13:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1B9D8136A;
	Sun, 11 Jan 2026 13:49:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O8TJc9lxH83q; Sun, 11 Jan 2026 13:49:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 876508126A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768139365;
	bh=59gC0e9p9czl9UvKkLEG8UG2bTUAS/CnCmX5xn1UElo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=mwLysL2pdhKlLZ5mBIOGPqmf9bVTzKL8iq2v+pa84zX/gacjCgay8smwz4g0yL7SN
	 pjjTll8emLDgyl8BhDtjVyxf0TxXf3UVuSgPfCcZi+CjFtoFpD97CpD0mBfjxZnI5J
	 HcA82U5NmyRWA7kw/N9O5aqjeN07ISBHAF17OyvepD0RbpSgzrDYj7P316FZlatGW7
	 YDgbbF7Engf2iPIQXsfv7F/7VZL6o0LKYFPNbcmJLZSYzOKy0E/zX9+sNEYDfwD71k
	 kUcXIsTkzn5Q6GMHGYwHlMk/NGJpXLMe9vcGCNN+6GDZUAftBsPiVmBznDc+XW47Cy
	 a0Z7NbVTal1Zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 876508126A;
	Sun, 11 Jan 2026 13:49:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BF2B212E
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 13:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FF9840251
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 13:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uN_WHROn7gnI for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 13:49:22 +0000 (UTC)
X-Greylist: delayed 1449 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 11 Jan 2026 13:49:20 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 20C97401FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20C97401FC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.223;
 helo=send128.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
Received: from send128.i.mail.ru (send128.i.mail.ru [89.221.237.223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20C97401FC
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 13:49:20 +0000 (UTC)
Received: by exim-smtp-7b4fb89df9-8h54m with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1vevoi-00000000Ldt-1BkA; Sun, 11 Jan 2026 16:49:16 +0300
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Sun, 11 Jan 2026 16:49:14 +0300
Message-ID: <20260111134914.393727-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD979975AF0D777FEBDBAA859A04FD0C80461902D7FCE839B0E182A05F538085040BF30542AA5394D7D3DE06ABAFEAF6705E03DFFC5877BCD4AE2F29BA9CCE9AF158B97B0CC26E8F007
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78887611F2F2455C9EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB55337566E85E34C3A196925491FAAB5079BDB79977780B37F7727DFBE3656D35943DA0D98EEF46B7454FC60B9742502CCDD46D0DEDCF5861DED71B2F389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C018974E66F091C0F58941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B62610E1DCEBCBDF8FCC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB86D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE7588D3C263EAE74EA731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5B90435297296851C5002B1117B3ED6967634477F37403464B48B7A7F94616420823CB91A9FED034534781492E4B8EEAD528DE7AA5F2BD788C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34C77DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D6593BB1D25227C8FB0F21F1ACDAC9CC3D985B727FE0B550E630E36BEDE290202A8CF54C601C5E4F112AB8341EE9D5BE9A0A0353F0A6F597A9331D2C6F8B302048097AABC21AA382D70F8CD93680B12512CF4C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVVt0N+pdRHOZszO8IYMOufM=
X-Mailru-Sender: 689FA8AB762F7393DDD5FD59B456EAD2216A7515FE2FB9D076597E2CEE8838B99B2843D7D33813C490DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=o86KSe5y8VWN9fuxUuIHeW/m6FoTXJpv+zztyPQlApA=; t=1768139362; x=1768229362; 
 b=QHM2wx00BH7VdQk+VeA9CoZZLIW+DmUYYsOfQUuiSSMfOQra6ng8E4+flXLv5zdmkoWF6WNGrba
 lMT0xcGeZPndTjpqLx3ApGPpQPwWFJqYaefCIKeUOZOwHtFRMXl/LJvaXsbjaD5d/ecHpy9xx7bFF
 QoQbiNf6V9c1qHpQ6cvhgSO/7CGOg43PnQ47eVC85ev8AjDfOSh1PrihM09Ob6/l740nMQSBeWorb
 nEXlyg58RJZQShA5ukckgRW3yxmXKh5ZfL0SzqPuvdrDJW+MPva0K1G+IdzWIaon/nfyi/43kqCWL
 FOLemlWFXSz/mOE400pa39U27fhJlRnp48PA==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=QHM2wx00
X-Mailman-Original-Authentication-Results: exim-smtp-7b4fb89df9-8h54m;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/osm2pgsql: bump version to 2.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release-notes: https://github.com/osm2pgsql-dev/osm2pgsql/releases/tag/2.2.0

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/osm2pgsql/osm2pgsql.hash | 2 +-
 package/osm2pgsql/osm2pgsql.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/osm2pgsql/osm2pgsql.hash b/package/osm2pgsql/osm2pgsql.hash
index 9f119d9c7d..6c04d4e989 100644
--- a/package/osm2pgsql/osm2pgsql.hash
+++ b/package/osm2pgsql/osm2pgsql.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b9d5c95ccc928aafc3c6caccb8b5bc19c4d48a5d1640cada07388d0dbf171ecc  osm2pgsql-2.0.1.tar.gz
+sha256  567dad078f8a66d6d706ac1876b5251b688109d16974909d89ce2056d6e9f258  osm2pgsql-2.2.0.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/osm2pgsql/osm2pgsql.mk b/package/osm2pgsql/osm2pgsql.mk
index f968a159d2..10e64e75a6 100644
--- a/package/osm2pgsql/osm2pgsql.mk
+++ b/package/osm2pgsql/osm2pgsql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OSM2PGSQL_VERSION = 2.0.1
+OSM2PGSQL_VERSION = 2.2.0
 OSM2PGSQL_SITE = $(call github,osm2pgsql-dev,osm2pgsql,$(OSM2PGSQL_VERSION))
 OSM2PGSQL_LICENSE = GPL-2.0+
 OSM2PGSQL_LICENSE_FILES = COPYING
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
