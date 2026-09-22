Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EC0C982F1
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 06:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 787D160657;
	Tue, 22 Sep 2026 06:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3EO1WseryahV; Tue, 22 Sep 2026 06:29:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 210EE60665
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790058565;
	b=U8hUgTV7cZgS6egsCjYmt2ZgnQ0XD8qeiUXtUAeq0bwVjeEPZTtEqVEVVQF7SPB7V0ir
	 QjG8/YnhUFHLUDa4FtohgcOXHEUzKiL58JuqCy0Nl5S65zFxsPaqMqeeLJtp4KVXuLS1B
	 PYElKTlzNjK2mein1bZwpGv9SwzznNhkkORp/uIe4YiXazN1G6AFFqrTTJGcRnnZ5VQXJ
	 sc/zmkxzMR5o0ynHoXqC03azgEVB/BbsZm34BIsnWQ/4jeCqXCi/JakIX2pWowSQ8tWM/
	 lpnMRHlZXhRKZnYFDEvNQuLE7xIWv0iGGMnBZC6GtwB94zEhpJ+mBFnKBpj9nSDDSGw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790058565;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=e/9lRKLHgswTIt2O3LdJasAJDIHD85reb8yImwHBVqY=;
	b=Jl+tpK22QybONwqqur4rH4ZBCVnWmFsyxquhF+Z0G3LOzGzVyUHs44YVbB+sC3SHvorD
	 3oEEDh2GqE6CsYoGZzd9TTx6DG1ovSt3jLnTqRtcYQ4PMbu1xSt/dRaKBn801u+9ikdiU
	 jCVvYBvFsHwFNMQnR3i5CSufyHDbcvNwrbBJCjVb18Gs2rFc00vOYU1WY5HPzOXgWY+dS
	 6NH+W+lzAEmE3y1yR2p9XyUkqcmQpw2Vr+nZLG+ue1IIHbA/NhrfbrgXYtxmOFqe4LgpE
	 fbAyHWl9O1zYR0wTP/mZIjgQ600XjFrOG6uXT0OyZo6dRz8L7PLvR4vQOWN6RTtCZnA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=YgNEdK23;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790058565;
	bh=e/9lRKLHgswTIt2O3LdJasAJDIHD85reb8yImwHBVqY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JiY+mN+4Ul4uMfmE6jlyIR9FHsj535UsED/nV37O0vWgBi8jvnTLfMxn2QwgsyQqy
	 y9eizgBqN3A8jnOKukEJDZF1YdON4mDtJgu7dMlKeU4pZSvy+IFwn8JiHF1EEiglV+
	 pjYbywOKG6fV1s+gi5nKr0l+vD8RtXUfPTE7GoWJ2ebHJDgbACKoPG4gB5pgiWAZj5
	 SVKPWi2zPbRM1oRtfC+4Jsk0mCihhetrviv5RdWTlacDH758JEZ/iXkAgok6aINg1B
	 bI2QxdedIpAocn2Vtox9EIjq7mHxbRM9Th5BX0PoGP5kgRpVQIsNjfR0FvIeRy1+5I
	 ywtn1cgJofYKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 210EE60665;
	Tue, 22 Sep 2026 06:29:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 67600472
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 06:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DCDA60665
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 06:29:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0OnpVQxKreN for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 06:29:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C1B7360657
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790058562;
 b=M5jAzPGIH1z+ae04EaG0Kb5N7wDMZZyiIJdUsprz0J0RvMUgISW72foUG/WCBY/vWapo
 IVHs4UqIEo+Yu7fDLxqoZXX5qszWkpAdtxbxXDGCG+16D1wi50ofb/v/Qa2ky7O9VIV/U
 Sc6XiTXxC9wdGdOSGprL1IOS0Q9NtoyXLJQObxLNkohiI31eJ8jFQDt30DNcLrgDXSnBU
 M52pFNr/7R03N/8S4vr9z8SPNrdEKRJzDpnyhEenMF0vCbXAG/p+E76u9FORi0XFX8gQY
 PlB3SD1baj9XYaf1qX0Xm9VXkugGpoovgRI3hmu0dWANArN1FtOLoccIqMewfnxVUCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790058562;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=w2v9Ys8KwYOIGHLotSPHUw9O9827oU7KXulF1B9R0tk=;
 b=cVBpixxmwtKrwYp8bo1uC6sLxKyMkyjcEC+RB7y3Az1CjsifH5RXWdYUrSR4VNrHn7n7
 TK8SOROSoi71LJLLvHaF5qe3RLAaaRRUi+M5NqyVqBLVy+RgM6KNV/8ZANwkJog0HQ+X3
 2ra+Hz4tbtTB6pcVxneuj0XoE1yszcMsiRfMtMGWn+rw/w+5mZ5/swz1oaUu4rhmFbYYC
 7W6IzmpOJ9trCQ4LjCJNOwfNMfPAj8kJ4AZNyvlFqyLEsh3YJJ919y67nxOHsIyJBBsMW
 qORJKnL+mg7ZL/u3aYLw5VjeiB63Ot9USl8AacvLyP9i5vo+l1uJLSm5JrgNEZqB9RA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=YgNEdK23; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=YgNEdK23
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1B7360657
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 06:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790058556;
 bh=w2v9Ys8KwYOIGHLotSPHUw9O9827oU7KXulF1B9R0tk=;
 h=From:To:Subject:Date:From;
 b=YgNEdK23SEqT1Eq/wsXh1E+PFB8duo9GUFlflo75eOyGIQE9f3K6qr+ryaBS0AJ0d
 k5JwP3yA32bVQviNqm8ZKr/TjMCdutEf4aaz8B58idQRMiYc6jUVZ58mw5lppQX6ye
 f4zkx2YAWu2xBnlSrfmQECNZuH97zHeiYHfwdDGzPPCdxsZf/6H4xv88ceGyyUR3Nt
 8ydr+ScJXmNvFw8edDsDjesljN27tayCn4d1AUs0jGk/l8rzmQ+hZut1hzbuBGquzh
 +tCNGSRiuaq5Gt5xpCbvCVZ0ucuoex17EpLrbLj31bn5ExOwLL9QOv6ICV/bhcJCLL
 JxlFb047u6xsg==
X-KAS-Sym: v3:f51bdf72230551df:onXrCvt6O+RZVg2ReGYdLj19e0oLZxy6KWoOMhaLvdvnb7ISOlxnZEYsKexc9Xz5xqkTTuys7cFKx4PKB+2b73OjQd1WSRSsbuTWSy78gZwcrBSGtQCkjVb/PZ8x9OslYJ+SC8WdIXAjtrDGFCiO7aSb6E17Z6MVAjxUtdJR8pKY5yR+RnvcdNb7w2v1Y1vO4ZMqalVJswSRQhP08RU7ShC0hyOnhjgfLiB2jYkHppO0flkwCDWCSEjV7v0DN++zuk0euJqdKdivRIWy3lqTpvT8cUsfNVTGJjHpWJpHjsYU7dAjapD1tFrvF83wLweX0w7aO2ImuLs2Q0kjuwf3Iw==:eU9yv+9RHBoSqzWelhFZUA/yPJUv2fbOzDnTt8pdsBNcrfDv9rYfHNLzEARtNDsQg7NGtXldxCvLtp3O9dfuBq3Uhi0WysVWyAggwH5+Vq+jQoXpYSgWvEaiwW+X3xmyTh27YwekrZx0t0BDBCnP42qhrwq34KdoTMhABtWE1YHf3ETt2kHKTpidMbaFb6xPHTwPNpclniZupqmXTTF4f0EHTh/Rq/MBq4dppceJtZNwQrpbkbR4HFQuaji19jBhgkFn5/QeobqssDxqYzMl6i79AjIF1+qtSuZHsQauZWgtTWDkM4xwPNSiUPgS4pic79AWEvW4msfA05kfGucs4S2ov9p8ns8FxYC6qWrsgGcXJiEUBbg3ZydNEWrSo5qPwl0qpIssh584rTYmk0lBetA1u4ZjOObdxKbWKn+0VME/AsxqJw27gjeJhdDAu6lOtTikB2QJJHFPYA5CgDI6ICkF4W+3/cXCEz3IM1uF5rJb3lSr2OpUG5VmAK6spzpJ3sL/ZiWVLeDI59NdXiOsWRaUWT5Re+2wzAJGtmgVl8/6JEm2hqJvYebC7hRZVeAu60DpEIvAxU+9kA/HPByaZ241tVM=
Received: from fli4l.lan.fli4l (p54a1b329.dip0.t-ipconnect.de [84.161.179.41])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7BBE4A4C46FF
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 08:29:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37778)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8u0B-0000000070U-3jWI
 for buildroot@buildroot.org; Tue, 22 Sep 2026 06:29:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 22 Sep 2026 08:29:15 +0200
Message-ID: <20260922062915.83688-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.12.x, 6.18.x,
 7.2.x series
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the latest kernel releases to:
 - 6.12.110 -> 6.12.111
 - 6.18.52 -> 6.18.53
 - 7.2.6 -> 7.2.7

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/{7.2.6 => 7.2.7}                       | 0
 linux/Config.in                              | 2 +-
 linux/before-6.17/linux.hash                 | 2 +-
 linux/from-6.17/linux.hash                   | 4 ++--
 package/linux-headers/{6.12.110 => 6.12.111} | 0
 package/linux-headers/{6.18.52 => 6.18.53}   | 0
 package/linux-headers/{7.2.6 => 7.2.7}       | 0
 package/linux-headers/Config.in.host         | 6 +++---
 8 files changed, 7 insertions(+), 7 deletions(-)
 rename linux/{7.2.6 => 7.2.7} (100%)
 rename package/linux-headers/{6.12.110 => 6.12.111} (100%)
 rename package/linux-headers/{6.18.52 => 6.18.53} (100%)
 rename package/linux-headers/{7.2.6 => 7.2.7} (100%)

diff --git a/linux/7.2.6 b/linux/7.2.7
similarity index 100%
rename from linux/7.2.6
rename to linux/7.2.7
diff --git a/linux/Config.in b/linux/Config.in
index 19c845a608..be3fa803cb 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.2.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.2.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index dea492b9b5..fc203c9097 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  8cee19e1839bb6ff4d5254d761933ae6ab670492d5ed030e09a80538320d5c4c  linux-6.12.110.tar.xz
+sha256  9e59dc67624188fa12a6601f9598499cd6662a9066be572b59f935e3d7849810  linux-6.12.111.tar.xz
 sha256  b74a43d0630809b7871cc906ac155e956cbc0b2e78a7451f5e6c8bfcb1208c30  linux-6.6.157.tar.xz
 sha256  ed4d0acb1307c235230c89efc094e210e6290593f94a7e617f28b1001101a33a  linux-6.1.188.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 9b4e1eafed..7ed646686c 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  039aef84f2b0994aeda3f4fcfc3d02ec9d7a9bbb9020ea264c43f446c860f606  linux-7.2.6.tar.xz
+sha256  4ac34c47db2540ffb2713943f8d891ff1702e0ba6934525a493b7d1cad43145a  linux-7.2.7.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  2b69564f7d4fea0c859b1959ba33709ee6e9139bd100e30a853b57159a8221b8  linux-6.18.52.tar.xz
+sha256  4d6fba95c2244b08a7b4144a4d38b9be4fb31abb5e7682ae40bb5cb11374cfe0  linux-6.18.53.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.12.110 b/package/linux-headers/6.12.111
similarity index 100%
rename from package/linux-headers/6.12.110
rename to package/linux-headers/6.12.111
diff --git a/package/linux-headers/6.18.52 b/package/linux-headers/6.18.53
similarity index 100%
rename from package/linux-headers/6.18.52
rename to package/linux-headers/6.18.53
diff --git a/package/linux-headers/7.2.6 b/package/linux-headers/7.2.7
similarity index 100%
rename from package/linux-headers/7.2.6
rename to package/linux-headers/7.2.7
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f855af4a79..dfad885f1a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -480,9 +480,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.221"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.188"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.157"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.110"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.52"	if BR2_KERNEL_HEADERS_6_18
-	default "7.2.6"		if BR2_KERNEL_HEADERS_7_2
+	default "6.12.111"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.53"	if BR2_KERNEL_HEADERS_6_18
+	default "7.2.7"		if BR2_KERNEL_HEADERS_7_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
