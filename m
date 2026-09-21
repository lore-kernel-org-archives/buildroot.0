Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91893C982DA
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 05:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05C3D60629;
	Mon, 21 Sep 2026 05:52:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SIU0-fHv6jLS; Mon, 21 Sep 2026 05:52:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 809FB605EE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789969939;
	b=ncybCBMzztHnpsZkdlcMdkCANC9RTWW1MUwYAlPL/fSt4Bc4Kxk5IaFNwM1zG2fmhNR6
	 JCG4TD0eTMYNm88Z2N+BcxWXe4UCQNXLjJmPsDShvrhDCsVasxzbI54kZdxLOIcqel/wZ
	 NmUjhjq/iGtrUQblv3G/qYee7wc07ewz43Y1v5yMmMMgny2T3sy3eYoawhMFXeG2/yPEy
	 q76gxMawNjKg30L8uRdIWlkvuWyhfiEzJ9fjVnFGdkLP9SSH21TfCah2DyQvUOeOMbX4e
	 parB9bQc4V1NkCUQFir/53Eowcj3wpr577SUn2CCyexmJskI3fV2uS4MIReE7YumKRA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789969939;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LuKfqbQdW7FL5Fankf0hL7Y0DRhWYmDPphDir9vwFpk=;
	b=PUS39eaTowLXux/t36KIyoYENuLUOrTPdVFWjOMxur7eYSxU+iz9i4fNstj5TozOkyIt
	 0dkryNTPHPieAZUl3ecQSVp3Nuq6D0we03i5530a8LOC2KNAUTYpxvPUuHNAhT2SOnc/e
	 u73twAzw6oIwDGe0KzUEUu3eK8YHuwfPrkWHjYnwUk44f2bl5XSyQDo25H6HUNZruobxI
	 jPOiY3tkyrzABzjXoEBEo10Wg/DBuldSAXNQ31XV5wo1KwiGTyPunxa8mzvOMCMwbU8rh
	 el4C7Rq5eKFjahhcT06gGCbzLVIXWmO2G/FbqfjJKqsItQ5obkm2hdluPik5jL43PrQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789969939;
	bh=LuKfqbQdW7FL5Fankf0hL7Y0DRhWYmDPphDir9vwFpk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AaboA0dFBLAtrzIR/DNBOMsH+r4Fi8y9M0EnhfuqKY/lKh6e4kC9hG+i6OEMJVngz
	 W281R/9oR6M6bqiilx5nT9XrhByOoDNkrrlSwOm3bPITpqFnTIKN1j+/+Uu2V1ynjV
	 0M4NxV+td/JGhbGHvcfHBWJC/K0nMB6P3oiO0rVZOK2mu1m/MbePGY6zytyC9D/ThY
	 hKoDZBS6G3joxXAMm+X+3oxqcAqlKryyQvkkQ5g4qWvQW8laENjEvpY1N/6YMZYc/6
	 CTRGNyojwJymq/FOt0jXRLpX/d87CKNPA5CBiq8dphj/7SBhhjnBxE/1Au1QbAbCxD
	 FkfvRndmrbHRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 809FB605EE;
	Mon, 21 Sep 2026 05:52:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 48EB0FEA
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 05:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EFC740C8F
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 05:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ko_YNVP_8gDT for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 05:52:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EEAC340BC5
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789969937;
 b=Gbavm4rQ6Im0B4SeZm/eaRW/zrB4gKuOinSxEEE7CTpVDhqtLU0cCj/eMVbqa386XXdF
 shnDtgB3QrNyicTIgNwApmie2IvzYVZZeq3+Q92ZbgQSOoiK6HE8hZIIV5LdB1FzwGb9H
 9sC7qekNlkt3Z+N9HwAb/3sOM56evw0+iAFIaoXxgzTKyHm3ytKxJYZptTLnhvFLUbo9I
 EaicqhCOMQv/Y6kd/jF6eCCmX7G76FDCMujbV5XDEJb2pvj9aQZzLtF02IvZeuhLTqmNB
 Bu8JDLJE3ilUlHzwfkWjFxSqDNIjsPJ9k8IR/nx7T3v8JmOHaRWtE9yPzN9LjmVjMKg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789969937;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5H4h2tuOi8amaLVJMASNSIEfG9vvenyuNHMAyng6R1k=;
 b=GcKIHWrxiK9WWaIRlo7hLcsk54JpHcuWUmBnWrOutD+74eMMbw6TCPbSFNLiqEHK3d4m
 KMwk8I/Jbngdx/TwuOCP1ny8x9CEZbG61oh4SgKZJrzX63bcgyA01WRD/WnPKolePI/xn
 Cjpijb5hGbWlbdbwybzRlttagc8fh49gXW96pvfBl1Cv196iUkUiRiRJafdCevsdpIb6w
 yq3GWAolqg8IgcABsNApqbU0kdWwXZPzKap1W6ED9NmxzFz92/jnZHBsVqY1i1UBa1kYG
 ITRMs7KnewIDnK/yJNIKxkdn7FgjQOozqUI5I7KX+yefkTwx/Vnrwm0ea/B/qw6iQ8w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=CibrAzrv; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=CibrAzrv
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EEAC340BC5
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 05:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789969931;
 bh=5H4h2tuOi8amaLVJMASNSIEfG9vvenyuNHMAyng6R1k=;
 h=From:To:Subject:Date:From;
 b=CibrAzrvKcdFL0PLoO2WrSPY5Q9jpc6B40fhgsW0lZHJ7jLxT1KgrhoBzBslfyOoP
 5Yf5ZZ/Uq8pCMqCjPaUqDbkVJFCcfOSKoKynQFy9Ojy2D55Ofx+sj3wsE0Pgd9fOBv
 16GPqUFH1TZ1a3bmh67PXTz3Hxx7F1CtJKpRkGF/YLlpTS9iUnLdEx+MCDQ6/Kx/7U
 mly9hC8jlFwcdx4sLzCAp54OifZ9Y2pQsXVpnDl+dznz0glh0UgexvaapnBNS19Gfq
 SxxZiDiv9J5JNtsiYprXTejusudxoXj89tqCEG/EhOX5x84wnKha5YCKGFVtHjyCSh
 2+UyVFxAbjgnA==
X-KAS-Sym: v3:f51bdf72230551df:a82fPWY1TYErq3Ivi0kLL2NXX/TsqRePlud9Q3zpuJJKCBSTAh0dD/mu3HIAFt9rfhfxK0qJf3yOt1H9vEVLPS4RIqLbaVc7udn/5Bh4IhHvuca3Ny5QsSIK7+WR/XAsIx0/+JUGUq71rgHknnSKGjzvXtCUmjV2SdvTyJLpvQ4vkM0wzj3HNsHP0G/CBTdpYr2pDQbOB2nuQUg3RORHswe6+WBC9KV/iaMdubz3CEhHnRmJBrIdqCoWxDbZEFpKuuI/J4Vc104qRlXAwibnGZYXNnkKz5R3NvTssAlfJYiUb0X1aSXaAYOefeB6aznFoPIWX9suwQBh5dFUClwh6Q==:QhCFCsUgZ78NcdwUy/4T/ceBrFpK8xhESKgWkC461S2pvoOtgnbt5z9JYmaUAOhABM7afyoru0e08tAAgWaA8doLjmhbvlhLKGcmikumZvGicN4v0WlchFe7y9lv16xH4SyvhWQLnyKwygr05As4WZ0wsR475KYX5h0cLG/xdNp/1vcffKSkkSXtHArfNEzFo4t8HAUv+ZPfCrk/AJz7CYypsNb2zPmhPzL0Roup50J5YGOQXUcl5f0z2rPX5kgk8IF21lYZ/iLCGfaHKHHQhoBl7no0ozMA0fQdeFeQofJVxRbAB6Yjwa76rQbn8CgbCceWrkRrgP/CP1dFOnkmWCjpwexH0mdVccUH5mXobFDf14JNNNhKVvkOqRqJuOVN2PzLXsIUUx9EcX3qfu6Fn34ZaYFxBMzhYh0bjrimMcnG6jMwMajjYfSlP8MGo3keQFLxHwPJ+4IrilNhTPxyapHw/fwJwMUw+bUkHiBzXeSennI9Fi6JS2zquOuNjIo+pzDVvpgxbIMWrHfp4DVOYElM0lqviXNhdaVN5+X5rmzj+yixeDi42SRKBCIEnC5iqKs33eCr9PZqIaHkbJRN3zY7TRn9ctMyaJpn2UwP6q6uzp
 MVmAzoKtJqzv6GExpn8w==
Received: from fli4l.lan.fli4l (p54a1b329.dip0.t-ipconnect.de [84.161.179.41])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3BEE2A4C2164
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 07:52:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60896)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Wwk-000000005hO-3LIp
 for buildroot@buildroot.org; Mon, 21 Sep 2026 05:52:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 21 Sep 2026 07:52:10 +0200
Message-ID: <20260921055210.4489-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/libde265: bump version to 1.1.3
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

https://github.com/strukturag/libde265/releases/tag/v1.1.3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/3927a5160d1ad7bf5bf3e26dc4a0ea7ec366345a

 package/libde265/libde265.hash | 4 ++--
 package/libde265/libde265.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libde265/libde265.hash b/package/libde265/libde265.hash
index 6f6d33840d..3195e46bc4 100644
--- a/package/libde265/libde265.hash
+++ b/package/libde265/libde265.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libde265/releases/tag/v1.1.2
-sha256  eaacd1943ab0c452c19f6136a36ca227e6b761b39a81eaca8454d48c147e1f67  libde265-1.1.2.tar.gz
+# From https://github.com/strukturag/libde265/releases/tag/v1.1.3
+sha256  554228bd17788c99a7e63b37ab5634722190e6e2bf60c1dcb01cef328e133905  libde265-1.1.3.tar.gz
 # Locally computed
 sha256  02cc1585a20677992e0ba578fa692635dc193735f2691dc81de924b51c4e8020  COPYING
diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
index eabdd45939..698f8be8da 100644
--- a/package/libde265/libde265.mk
+++ b/package/libde265/libde265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDE265_VERSION = 1.1.2
+LIBDE265_VERSION = 1.1.3
 LIBDE265_SITE = https://github.com/strukturag/libde265/releases/download/v$(LIBDE265_VERSION)
 LIBDE265_LICENSE = LGPL-3.0+
 LIBDE265_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
