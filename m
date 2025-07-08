Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C03C8303C
	for <buildroot@archiver.kernel.org>; Tue,  8 Jul 2025 20:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15CEB80D80;
	Tue,  8 Jul 2025 20:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rNj8ZxxGrYGX; Tue,  8 Jul 2025 20:28:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DDAF80E84
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DDAF80E84;
	Tue,  8 Jul 2025 20:28:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5400812E
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 20:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38FC180E84
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 20:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lchd8qWcOvdj for <buildroot@buildroot.org>;
 Tue,  8 Jul 2025 20:28:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 533FF80D80
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 533FF80D80
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 533FF80D80
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 20:28:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 20E7313F88F;
 Tue,  8 Jul 2025 22:28:51 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 08 Jul 2025 22:28:50 +0200
MIME-Version: 1.0
Date: Tue, 08 Jul 2025 22:28:50 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250707152021.1275999-1-thomas.perale@mind.be>
References: <20250707152021.1275999-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <d2f1af544c40d5d85686d9258162fee7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752006532;
 bh=01dSKndXsjvRB5xm8g25WcsD95Dnv2xIWlUUtkKjy+8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=elrL92spgxtog4WVjNI/e3FKWq1GXoJFUwUJodYMLGbzlskmDrijQMbI2MxqfpUJ2
 2MQZfRHZJVTr3iiGVaVkMxZFqD39FiPNGQgMQ8r89cX8afgTIQzqcSatS9Y/J622+b
 MA0ATABcRpZTrbxjFli77iRX4j7QI1FXYBL9ioJ7E8BTg9KzhmpIDjtBWvnAqWk/nR
 MOpfPPS2sauxoCxnsuLuQzLMMJ6NksIWpQD1zsTpmuNiHbLQAlX98NQQuK/upuybww
 MK5vUcJ6Pee2vkdyH8dBfkTI2tT2TIrJKbAoVBOkFX06Q8d8EpKbrFv8o/pUNFXkIw
 d8z6TlP8sa+0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=elrL92sp
Subject: Re: [Buildroot] [PATCH] package/ustream-ssl: fix build w/ mbedtls
 v3.6
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 07/07/2025 17:20, Thomas Perale via buildroot wrote:
> Since the mbedtls bump to v3.6 [1] the ustream-ssl package is failling
> on the autobuilder with the following error:
> 
> ```
> In file included from 
> /home/buildroot/instance-0/output-1/build/ustream-ssl-68d09243b6fd4473004b27ff6483352e76e6af1a/ustream-internal.h:25,
>                  from 
> /home/buildroot/instance-0/output-1/build/ustream-ssl-68d09243b6fd4473004b27ff6483352e76e6af1a/ustream-ssl.c:25:
> /home/buildroot/instance-0/output-1/build/ustream-ssl-68d09243b6fd4473004b27ff6483352e76e6af1a/ustream-mbedtls.h:24:10: 
> fatal error: mbedtls/certs.h: No such file or directory
>    24 | #include <mbedtls/certs.h>
>       |          ^~~~~~~~~~~~~~~~~
> compilation terminated.
> ```
> 
> This error can be reproduced with the following config:
> 
> ```
> cat <<EOF >.config
> BR2_arm=y
> BR2_cortex_a7=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_PACKAGE_MBEDTLS=y
> BR2_PACKAGE_USTREAM_SSL=y
> EOF
> make olddefconfig
> make
> ```
> 
> This patch backport upstream commit that address the compatibility with
> mbedtls v3.6.
> 
>  - [2] rename the `_random` function used by the mbedtls functions
>  - [3] update `mbedtls_pk_parse_keyfile` function to support new 
> mbedtls
>      definition and use `mbedtls_pk_get_type`.
> 
> [1] 3481a9643f package/mbedtls: bump to version 3.6.3.1
> [2] 0001-ustream-mbedtls-use-getrandom-instead-of-dev-urandom.patch
> [3] 0002-ustream-mbedtls-add-compatibility-with-mbed-tls-3-0-0.patch
> 
> Fixes: 
> https://autobuild.buildroot.org/results/c20/c20dac7cbe5def2c6036d2e1d06de0bfea68b57c
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
