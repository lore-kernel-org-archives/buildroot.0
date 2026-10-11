Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE238CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8844C60616;
	Sun, 11 Oct 2026 13:03:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pRNuQz_OvVxM; Sun, 11 Oct 2026 13:03:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A6A0F6060C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723784;
	b=POaZfkIheACwVqJH6wgSo/Laczejpf0eeJIvnfxrtZ7uPBJDxnOm2RZbxHiO42imM5Uv
	 2pqbRUyOsG0HvAOWTmzz/ebRfzIPHxwKhJV4aCZ+Ods7MSyvMVEnRC34YIWeaDmu/jAcM
	 fal0b/dVkqouGKC9sbi21eM2ZRL84BXroAXZwsT8WJst3cqeo8fUkfGOe1/ujj0kzheS8
	 9h1WUcvQ9Gs0YbtXYFoNkO1374rdindM+f6baB+nKWXFqNwz7HVLGYRMmDtSrhuhnCD51
	 x/4Q31n04vOHzlpdQjkAvsQJjRBZNO+7dcdnkh+Q14we+d62UdSlZjddmgO6Dq2188g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723784;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FnuJF4SLToGPMhS14w50us7G5Sa9h/6x9+6TFsoonH8=;
	b=d8z4XtZBni9F14QhGbRp0OpcU9Cy5gEOaY98aps1YWXW1PB4tyFZKi8obFfYq+iuYa92
	 AU/LmVlvJwAdMxzSoOZ89VUQj6hsoezsUnZ/1tTJn9Sx5zzegPTE+4zEHDyv/y8CdvOr0
	 JxYlqdHae7JyQirLOYnctYff9sRhRzaMR/arU9KrhwtS0dwvR+OcfqLxYb6cdVZnLBM3H
	 um8vlbFksZC2mdSNIIistYO2fTx4V5S7LVzCTE17KCtsvPiHIQaR6cibkgPNNNIIwGjz3
	 UZMqdRPqkVCGOON8GB/8K3LiWgye2C7IagqJaXhwwlEVPWX4WJUSTP3+J+VXP4hXi7Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723784;
	bh=FnuJF4SLToGPMhS14w50us7G5Sa9h/6x9+6TFsoonH8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OhRD+Y/A7AlJ+/Oafcz/Qkv939Xhda5+7oc8Zv3o0OHNoUSpOQgLrn9ZQdMS231KV
	 C5HFAzrpDD5QUIKBPZafBd6Du5sAzemnDc1s61Xbe3gtMYYOqLPRUVJFREVKVA77zd
	 yFaC34qZYnyTlEMyX9sVJu9KSAXKY/8xM6ZQwNpHKV5ZERaU3b4COEzvaMxbuzD/ku
	 dNvtS2hPpUAqBfpPpUr+UvbzU5RmbogHVtwcv9BmIjeevx17XEWP78n4T2FyNKrfC4
	 xz898bAEQhD4Kp0yh4MZT+LRPcgXkMEp6rLysY9vZvNwo46dXe2lALeo/YPtwxbBVH
	 1/TphYFUdNadg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6A0F6060C;
	Sun, 11 Oct 2026 13:03:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AC63194
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00D1B80D29
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7oJugSp0KG_k for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:03:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2892880D1F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723782;
 b=Uv1+C3mwOmhzDIoomKwiWntY/ke8eV6A9b8ZgKNV01feQ7b5m5+bJ5il7HEntSUXymvL
 dEt69VMgy8vBbK38dFt/pnPIxAS0h681QoFMD8u9R2MpIPXgXG7qN7cO44Jq0WRtLVVOR
 1rEcYwRghO/4LbIutXtBkfIRhvJQKCE8QFrdfSyloMyudRS+ygA5dY5BnOdK1IUEBS+DE
 yUSlr/ktK1fq7t53OAUSNzRwicHndvcbjKKa5a4tGKlmmEtnAP0CCT/tyFRwFMr8QP3ZI
 DiViPhcUaLBe5KR9Vto0/e0WPg+h19MEp4gea2Q7S3XDexqasO0PdRP5OYaQbtM5I4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723782;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=NrcHwJteL3n+JSmnZTtuGF8Ru+su/xyu88Kn2SVwme4=;
 b=AfjoDLeYFfOmi9WTOKMinaLlUq/f6GOa8l44CJ4yTjpToeT1N2h0dSj/GbSauliVu6Pn
 Mj7jZukEPQHJM4UO2ebXANRwQ+1DdqrgHBmG+Z+yn0sIPYgUedwkrN1BC29yM4kMVv7Pp
 yfAKjGK7t24mQklv6VoWWwWZl7v/7NRJfCz6LUC2Hm4nOTWab/L6MJbHoteumGIbw3hHK
 mL7awlsk3wdfVnxR0i2o1w4DkwYawd+T1+8ndEu0P9TAGutbEmlgTbVrwAT7DnSJMbXjZ
 tCuYknvljkS/2p9ydAZJtv597Y9CFaTV3I3E9pMNcmwT+h3nfRBC1LfGTgxyOeBADTQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=V8BUIDMN; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=V8BUIDMN
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2892880D1F
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723662;
 bh=NrcHwJteL3n+JSmnZTtuGF8Ru+su/xyu88Kn2SVwme4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=V8BUIDMNWLJWhWR9FolsADWqG2D8aklNGHD0/qAiw/P6gLdwORGaWYhdj0i+o1iUW
 CmL2LYkXqBm1jmuJ2/sGcXpdyC10yv5cxPbLpCaaIUkCgEl8MUFSD1Ktk4t/f8Ugfw
 YOni9vqW2ZoXsLuBH9XpeXKgrHLyGT1DLzk77NOPNh681wF4jFNTOO8P5JUbF4Xoqp
 A16vHXpXo/ckdHZ+19IPXF1TSKaJtxGrW69NBXgmQB7Os6FWBjO743u0MnBxrfMxUM
 vsEdoCmG1CNYSNRQ7FB3J3XCXFhAtRTj4yI5IeD+TM2Kaj8foNIRBckyK8mCZObmKI
 mIqwN3B/v+4Iw==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 vQUPOBxnQ1QxLxePsmjuCgm7b/QBfLovN1WQEfXfcOgLqD3FAmZFJ2t9D5iEOsB6PQbH5gigbYi
 TRg4WMkYwPKaAyyXfqw8zOhX5P7kvWb66zHZy7SBgdnf6lh4eJ2mQ0f2Ng1MC3ZIDy1/l3yY/o8
 fM5utO5N8rDLCxt7arGKm3puAkv5ADx0dPe3GGkOsFQr9ZilJxMMMErRZQemX45HUC2h1tAjFx0
 dRXUyZkmRgmr9qAOXP1GPTZLy/54oMtC3ndKfb4Bhlb063HA+zwMzoxpAfQ2jWuKzwmUUTw4r/a
 nInjyva5wKw9C0UbNEjbjj9+u/pIAlwjcE/9kiQfxHAfL5iUh4niBM+k4R8lCOFUeTJT0CW3lqz
 66SQDkhVsSGYwjOg2pFt/5lGSYpFd+wus3S9vqygrw1P7XErUnZ2BB6cYx6lCCWbemZW68VudXG
 Ezm9ZEQNaSKiQLhRgHlYoNDOlZpwZSv/aqcFncKjjs7IPVmc/uGTqMEQDYcYhscNLQ+3HWEDvGX
 v76n7jWbDCBaBOyjqxGZcIF1FAqSdjTY7HdwNRoRqp9aVzxpT1l70crBu6Zv5Pb+Yhyjnh6ul38
 ne+sjDzfPlCgXtNOu1xNF+KRyCPvT0ELWc5tD+L31TpnSno=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1D743A4C584E;
 Sun, 11 Oct 2026 15:01:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAj-000000007Fz-0yt8;
 Sun, 11 Oct 2026 13:01:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:15 +0200
Message-ID: <20261011130058.3443432-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v9 10/52] package/boost: contract needs thread
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

From: Michael Nosthoff <buildroot@heine.tech>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 70e99aef11..929a9c3869 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -90,8 +90,9 @@ comment "boost-context needs a toolchain w/ C++11, gcc>=4.8"
 
 config BR2_PACKAGE_BOOST_CONTRACT
 	bool "boost-contract"
-	# pthread_condattr_setclock
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_condattr_setclock
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread -> atomic
+	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  Contract programming for C++.
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
