Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7931CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FCC360DFF;
	Sat,  3 Oct 2026 07:24:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lLijAa6vEHKZ; Sat,  3 Oct 2026 07:24:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 986C760DF1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791012247;
	b=iWx5iyjWCE+DNI8PtrVeT9ggzE04S5McazrJMRDYV0tIRPZwVM6uWU31nbnHnwD3NYRm
	 reLksZzQIPrbYOjbdXB8EQdS58GMoTS1QSLsm6eCT7IM1gVfllXEBaflU337v7ZkROBZZ
	 RBRBJ9e0xtkBxfGWhlhG5BQD6tSJ7Y/Yx9VvfpOK5fbr0PmMEZJu+M5cxrecj7nzIAeCA
	 eKY5E6YNr15U+NwpcXuz4YVuYa5TId7BSFn6ZX06OnbxjBbe3fSxqfF0vT4ktUP9Uo0Nq
	 +ipqEWVBqYl8D1fCovi2B76gSKzHs6mdxP0TQIkAeEGNFBcvqE8RFUctm/CL8FUGAEw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791012247;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0nkwet3DLmFjRg4Q32zqA+KX8DU0xWyf1/1CMo0eoNo=;
	b=MHnqYGu3T1yUsxa6XhGCIMPxdx+DqgwHMHXOeDvZgfFugRh4TkbMDfN6LGax4gvpwL5D
	 UkKvnURKar9HkY+SAp+TWOmsN/hKpgCniNSr0hEICdDATafNQpi5ObpjtzxNIrWq8gGqf
	 EeL1saPHp9WftMcWH/9zfJGHwW1EhtFoVaVbvXdQE2OCjIhEh3l4ymtJW+cp2vI4hmC2A
	 2Frf0yzSELylVBsJFu7FcmaWA0+BVADsuRBoxvPsKEoYPAO+l8H7vBwsf9mqdIWSst0T3
	 ZKHqu56I01lg6QTRxRafoXvn0bqJxlxG5Jy3ovDfoPcT1gJNzopfyEjkrGgfc0cwUoQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791012247;
	bh=0nkwet3DLmFjRg4Q32zqA+KX8DU0xWyf1/1CMo0eoNo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bxOvtI6gl0fmnEnc+eXbredHmjTsItPzDhM29Db1w/ybQMPJyCxLQUGSwVHjwFIue
	 xxNKp9EpvjouMh9CPWU3MENBOjBXkMs13xy2WhtaQYKsy+YeP1132m8aclYqe8DXj/
	 uzesL4lpwgPAk6RUg7KHK6ewsYQ+2MbiSmg1xKdgMYHxRSv/hEBF9vqx4m4K0p38lF
	 RA5sS6s898s4RPHSufjUKS4KPHXSmxBhGI+m/ub9nnWtkMmK1jEDi/qtXVINTfCGUO
	 RmLZVsnCm+Nbrq2uSI6FMreyTV4qnVa91zCHVdpNi0Ow2qhmwM3O2T4xf01WxeS4zO
	 kFsBv4v1YBwYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 986C760DF1;
	Sat,  3 Oct 2026 07:24:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5436434E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4621140064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QmEsFoR78jrg for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:24:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 52B8740059
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791012245;
 b=lryPO8tLG3OfuLtON7mB2HCLzNjFnKLjlnUHFUILJNtx7TvAU40FSzZejoVjtMBQaxEF
 NsxC3zoCBnAf8q4wNlfh2toZOlFxg/dhtFjzfi3zuwAUSreQUQ0l0DR9QRSbi+It01pIC
 4NkFDLvUnL4zDqxwuhjkZhsIgv1itdqotbOkECyx21WJShzW1aJivQXGVEuI4Zm/ditDj
 1vWahAftGoPcqg/o0JmXQrEvq4WZP3cwe7/tNO0OTFA5mCEt7wiJJWvjdiaPfzdJOwCko
 6OSOlInOiIJYsX0EEe13PbuFodnDReLmExyn3kmlYNfPDFlMXycAYK0d1oWFQiULxbg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791012245;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ZcHjMLvcrzuwExMatW5oLuNMpVU8IbddMcOaosFfxN4=;
 b=E5l/gL03S4hgvIZp2X3dQONhEy4pdTEQtvT3eq8eadtrOXk3QONnC8BVaAegbpvvlFxd
 qPhlyU4PDzEXIlxUoKRxfSJkTLBK6z71T/Cr3g0MuYe9LaG/cZb4GpXFp/6ND3u8N2dIR
 7+hr/7eKT7kXetsbKck38TIbXVZqADs+gib++Hu8VmVkexvgQOtRttaV0ricPL6ITtwFZ
 2XtmX6i9npL5k68xaybCzx31+aslj4HOZtyau5O/5zxzMcR/FcwosFiJ1rTOZeatcsvFg
 Lp3NI6kp9ipnLBOj28ycS7tLSQ9K7Prc8qfKoQ9T6EFTX1qIGhz8Q6TPIOEcd35M0Eg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=sZtRWXkz; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=sZtRWXkz
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52B8740059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010942;
 bh=ZcHjMLvcrzuwExMatW5oLuNMpVU8IbddMcOaosFfxN4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=sZtRWXkzRSAvqEHTj7X8lOC1k2N6NmRKSfvgRDsooS4sf4In9b0WBUiEnjy+Upzy7
 WKEe8uGJ/3EyWCZJ936GArJxc0fRmB/jeFHNc7GiLq3RKjtMKNzCTwVre/otuNlWo3
 2j6OBXEWUwRfFGATPXgSLFsNHxJNCl1cWD2DCgXStFOxhsmOsBlYJtOCd1LrwmIHf3
 hGONz1YJwIA3hMBAZir15OKYVQD26QRNK5vcTB2BdqjvnVlkveHQme6uqOgvx76Wc8
 VAn67CJg7l2IX+Q5yYrJHS3tDjmJAf5qHJqTmPf1PiU0tK3oE3MM3cuIpWMdqejdAh
 6qr5fQNDdIlcw==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 hJcC9ExelhODxPZ32kB2uMWJgWCVZ2WaHt9ZSjYKK43VZyTOoHAAb+6aLyt6Hck17LXF9808RMw
 j3a18IvY2yGFLUisXj6D5rAmdaxisiNet9Tsy2ZTLqMndy/tO0dwZzHQSDJ7PzidqZIxw/Xwu6G
 xTW1yyVb6n+sf7P3Xtaz0nRQDxJLVp/i8LzNm+/Sze/JgdOoce9aoNDjNm6rQc3OpwZScs0bOh9
 LcSP7yrSzzqzGwPGRM4LYMaIKwpOgzY5JzpaFLg5GoG9ujY9l5qsUquN1z89E44RP+UBjhTd7YB
 5foi+McjqGH9SqypJPFmtKuHuUpjiNfefQ/V4wcNWqG8FJYu5GWH5nfqLgnhflXxCqvA17cHo5f
 Yv/ViXMdmxv76vNtQAj2vMXYAaExOhJowMZCq20L41srkI72CJ4oFrs10UbnsI/gjlICvgLSl9y
 6oOGPm55UONbcs/Rab7z2/82Q/qSl8MKO5vS05s8CTDdu8u3t+JNED3r8TQmvQnhjRrxMsnU1LX
 HBsvW8RReSpSydQ0i5BurzU7gM/Yj0YRmQFJAu55z+J2Y4rrkPDeR8YKj407Oww5fMxY5L16MDc
 tGecngfXmOZMTc3wKk38Ti3tlbJTxZkESZYoKv5t96aRAeySN1Et6W0ugF4zK+pQ
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B027CA4C5522;
 Sat,  3 Oct 2026 09:02:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtke-000000007Zo-3AgP;
 Sat, 03 Oct 2026 07:01:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:19 +0200
Message-ID: <20261003070128.1295458-47-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 047/114] package/python-more-itertools: bump
 version to 11.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-more-itertools/python-more-itertools.hash | 4 ++--
 package/python-more-itertools/python-more-itertools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-more-itertools/python-more-itertools.hash b/package/python-more-itertools/python-more-itertools.hash
index f19c07f278..a469ac3905 100644
--- a/package/python-more-itertools/python-more-itertools.hash
+++ b/package/python-more-itertools/python-more-itertools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/more-itertools/json
-md5  cce8548e1d2882b00d83b4b436c7e47c  more_itertools-11.0.2.tar.gz
-sha256  392a9e1e362cbc106a2457d37cabf9b36e5e12efd4ebff1654630e76597df804  more_itertools-11.0.2.tar.gz
+md5  93ea38a66c1727add887f84eb2ea88ea  more_itertools-11.1.0.tar.gz
+sha256  48e8f4d9e7e5878571ecf6f2b4e57634f93cd474cc8cfbd2376f2d11b396e30d  more_itertools-11.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  09f1c8c9e941af3e584d59641ea9b87d83c0cb0fd007eb5ef391a7e2643c1a46  LICENSE
diff --git a/package/python-more-itertools/python-more-itertools.mk b/package/python-more-itertools/python-more-itertools.mk
index 9fd9da10e4..fa3d859905 100644
--- a/package/python-more-itertools/python-more-itertools.mk
+++ b/package/python-more-itertools/python-more-itertools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MORE_ITERTOOLS_VERSION = 11.0.2
+PYTHON_MORE_ITERTOOLS_VERSION = 11.1.0
 PYTHON_MORE_ITERTOOLS_SOURCE = more_itertools-$(PYTHON_MORE_ITERTOOLS_VERSION).tar.gz
-PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/a2/f7/139d22fef48ac78127d18e01d80cf1be40236ae489769d17f35c3d425293
+PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/de/1d/f4da6f02cdffe04d6362210b807146a26044c88d839208aec273bb0d9184
 PYTHON_MORE_ITERTOOLS_SETUP_TYPE = flit
 PYTHON_MORE_ITERTOOLS_LICENSE = MIT
 PYTHON_MORE_ITERTOOLS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
