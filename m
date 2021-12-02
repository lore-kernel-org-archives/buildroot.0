Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A95AC4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 20:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1FC16F4F1;
	Thu,  2 Dec 2021 20:57:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mTy2SCur3PsX; Thu,  2 Dec 2021 20:57:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E2F86F4E5;
	Thu,  2 Dec 2021 20:57:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 508CB1BF343
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 20:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 411D083FA8
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 20:57:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=inbox.ru
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K0qnXh4TPnEY for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 20:57:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A2EB83FA6
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 20:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=cd7m96JloHXqIjCDtGAoI5KJzLtHw/qOfZfyIfe1PwY=; 
 t=1638478657;x=1639084057; 
 b=dJjhjiVXyaB+9cXaFh/14EJ8dEAlip8st4SO/DhvcUbqRxSXYhK1mpQm+/5Sghfk5Nf6Zz307+Qr0+F/CJWdZVO+WBotG6oiC1zMY02UUgj1oXMAgHilxJtYPCCt9gsWGm5tHiYk11eafIYB0X1XoPvIUKdzpjDyiTkYUiWcozB55R7xT28ZtRrnvCjLXTbWezwMkn0LDUWjiBY3gUZLHIephf67JuuH0f4FvkPGJ3leg6zGld/uMhJmN29On4iybRMEguOAubMymbWRYgoV5uCRunWuMo/BO3DdXSmVzKbX7F9z0xc6KzeSHcz8rjuon3+Or4bmIY0NMUESYP4fXQ==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1mst95-0004RH-9B; Thu, 02 Dec 2021 23:57:35 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Thu,  2 Dec 2021 23:57:27 +0300
Message-Id: <20211202205727.3572777-2-fido_max@inbox.ru>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211202205727.3572777-1-fido_max@inbox.ru>
References: <20211202205727.3572777-1-fido_max@inbox.ru>
MIME-Version: 1.0
Authentication-Results: smtpng1.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD93822B471089FF64DFA455658C3104DE9A8FD3EA0957DD338182A05F538085040776A744CDE31334405333FD58D47487BFD8D41480FB7FDC6F1690EDA16D5562B
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7227E4400968B082FEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006376CE4E8B6A85920B98638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8ADD9449802C1CBB2F745B1811E1906916F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE745AB435BC3F971989FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD1828451B159A507268D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B3733B5EC72352B9FA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CE31A2885C41F97C443847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CBD1FC2C1415E7E9D65DE53A4671B60D51F0487AAE24CEE6E9C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EF197FFA0EFC27E0ACDC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3430FC2BC1B917F018B9221CFAAA0D57E3744F6B263175FEE469B8C3A0B3F0B5021CEBC3F9604D59B31D7E09C32AA3244C95E32C05F5E827899CCC5D651E4BF092795D98D676DD64D0729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojMMFVqzO9sR3QpbcrDsVzxg==
X-Mailru-Sender: 689FA8AB762F7393C37E3C1AEC41BA5DDCB584D5440E206D377961DA8558FC7298CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Subject: [Buildroot] [PATCH/next 2/2] package/postgis: adjust libgeos
 dependency coments
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

Since 3.10.1 libgeos needs toolchain with threads support.
So add it to BR2_TOOLCHAIN_HAS_THREADS comment list.

libgeos depends on BR2_INSTALL_LIBSTDCPP, so add it to
BR2_INSTALL_LIBSTDCPP comment list.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgis/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgis/Config.in b/package/postgis/Config.in
index 04705f7e16..2642115026 100644
--- a/package/postgis/Config.in
+++ b/package/postgis/Config.in
@@ -2,9 +2,9 @@ config BR2_PACKAGE_POSTGIS
 	bool "postgis"
 	depends on BR2_PACKAGE_POSTGRESQL_FULL
 	depends on !BR2_microblazeel && !BR2_microblazebe # ICE
-	depends on BR2_INSTALL_LIBSTDCPP # proj
+	depends on BR2_INSTALL_LIBSTDCPP # libgeos, proj
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
-	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libgeos, proj
 	depends on BR2_USE_WCHAR # libgeos, proj
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 # libgeos
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597 # libgeos
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
