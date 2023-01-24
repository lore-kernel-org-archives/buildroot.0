Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D028DC38142
	for <buildroot@archiver.kernel.org>; Tue, 24 Jan 2023 05:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A44E4090C;
	Tue, 24 Jan 2023 05:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A44E4090C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 55nfvL_liTPi; Tue, 24 Jan 2023 05:48:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 557C540912;
	Tue, 24 Jan 2023 05:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 557C540912
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 188DB1BF2AA
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 05:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6F5740143
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 05:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6F5740143
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d4FdGbeP1iYM for <buildroot@lists.busybox.net>;
 Tue, 24 Jan 2023 05:47:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44113400C8
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44113400C8
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 05:47:57 +0000 (UTC)
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1pKC9y-0001Cm-Sn; Tue, 24 Jan 2023 08:47:55 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Tue, 24 Jan 2023 08:47:48 +0300
Message-Id: <20230124054748.13980-3-fido_max@inbox.ru>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230124054748.13980-1-fido_max@inbox.ru>
References: <20230124054748.13980-1-fido_max@inbox.ru>
MIME-Version: 1.0
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD9A6D6F5724DD3A0B68C669C2C04C2179C32C43728262E8EE2182A05F5380850403DE62F91BAC25D8E1994AD965E311297CEDC7E7F1B1D639C003FE4D2132CEA13
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE755BE8F535441E38CEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637389D8DDD54F43F7A8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D88727A30AD7F2A99CCA50200F45F215A46F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE74A95F4E53E8DCE969FA2833FD35BB23D9E625A9149C048EE1E561CDFBCA1751FF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637436E42DEDF9DC02F9FA2833FD35BB23DF004C906525384302BEBFE083D3B9BA71A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89FB26E97DCB74E6252156CCFE7AF13BCA4B5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A5884B5A721D8093B47EB448325F2526013CB60D02ED74B3664EAF44D9B582CE87C8A4C02DF684249CC203C45FEA855C8F
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D348F1757F8DFBC5C33A7C7AB7A3A71C013AC6028E47E4541243767018786182B4C1755EEC85FC351821D7E09C32AA3244CADBA4C164C6A51F00F83F2FEAD3F40C54DBEAD0ED6C55A80729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj4ukhBIi/0FBY/rlqir6fcA==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF5F59BF52EAC2010BF0EE4F5139211CC2D98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=XxaxP0mcXFroZMKomEkDKDuLApzVjw5kV/+H8c1tBIM=; 
 t=1674539277;x=1674629277; 
 b=RIztZ3uxJwr8DRBlR4inqjAgKwVPhmMP8rsnY4Et3uuoMUlVx4ZuL5Jlvg7x9CYmont+9FRO3H47ImE4WGPMTOnXctUA6OqhrLhiZD3/Wzok6zW0blfMQbET+VSmVXZf/ViJS/h4+/ZIYtpmdQVEVvs7+6C8kV10he+wPoh9ALNcUY9neQYmpHSZnRyIYMKWVUgqA1Su/ZK7lEkN5yNpHdQ3pB0cRN5UEskzuURd7kRGWMoMTRxAgjo/s1CoTd4BmIEVTh/nYWsY4kOqQ/5/8BHOjjippJ4bKlu+3bZ4Qbt07rt/VdB9wu+u04b4KDDESs+P2rmIgx6HtYlgjWBgUw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=RIztZ3ux
X-Mailman-Original-Authentication-Results: smtpng3.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 3/3] package/postgresql: add lz4 and zstd support
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

PostgreSQL has optional compression support (LZ4 and Zstandard).
So enable it if libraries are available.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgresql/postgresql.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 5313e03b12..1f787231f8 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -58,6 +58,16 @@ else
 POSTGRESQL_CONF_OPTS += --without-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+POSTGRESQL_DEPENDENCIES += zstd
+POSTGRESQL_CONF_OPTS += --with-zstd
+endif
+
+ifeq ($(BR2_PACKAGE_LZ4),y)
+POSTGRESQL_DEPENDENCIES += lz4
+POSTGRESQL_CONF_OPTS += --with-lz4
+endif
+
 ifeq ($(BR2_PACKAGE_TZDATA),y)
 POSTGRESQL_DEPENDENCIES += tzdata
 POSTGRESQL_CONF_OPTS += --with-system-tzdata=/usr/share/zoneinfo
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
