Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8390DC982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 21:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C54D4076A;
	Wed, 16 Sep 2026 21:04:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EdcxQVLyA31H; Wed, 16 Sep 2026 21:04:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 136A44062C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789592661;
	b=KSKFmuEmFy4eE/SWi5TaqQve7LxsOhFChbhBo9/IMRmSbYtnJ4WbuZIhLT3OAGLh4V9i
	 GxGTHgnpCO2WHohomAeAorQ2pvDTxd8wkFDCU8KnkJqyz/nfD/NrXdjJp+iNTnu9+X+RO
	 O7EcReuuW0TUoYefjyb0IOBfDQlIC0xEso4T2JutW2XepqCGYoSb4PrJH1KBlaUjwsyvb
	 xBJVxcJalwK8eW12oTPHpjHnX5a6lfDo6tXJmYyjPMwKC/mdpjYs7o/QZUQLprS4PHuNC
	 zrpodioRQBXWR2hBvjgpIiYpVrxg5z26j1PdEnypeepHVzOEZwAd0fvFAABo9NnNN7g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789592661;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=niWRvW6R/QggOvaOtB4Zn8F2pZK9KB8z0ubOCohhD1k=;
	b=US3MAQ0zYXaQVxeue/MUoO6ODL8Cesr8NC8phdhHIAJ6+v74/WyMrVKBDEZPiQLE/+Ny
	 jJGr4qWmGBPQl5yJRLmHB4vSeA5CVmwg68lCJxhh/sZVlvNKzMHB1uJ9mo5Oz9civv1vJ
	 08fVRcYx1f4+89L3Rkzv+bRmJUMG4NjgQD3tEawOZBAOTVzqaoyrB/P0R4FBT3SsYBHpS
	 k8L/XZq0XB0n5S9KHuon7XlOUnJKjGUWYVybF/JyYZGezAxGzXGbl9JD8H47hg4EZfSMo
	 VsTWVjWUFdb34QGTcGSeb9FUi/ywQLzzJwA9z1wXTDNN9y8JM6nT3eqBwH9Kycf1j6w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789592661;
	bh=niWRvW6R/QggOvaOtB4Zn8F2pZK9KB8z0ubOCohhD1k=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lQpokXL9JnYQBarMIXT1QnzY2Lin++zUsi0HZSpMFiBRLmxN3gHrx/dZyDIRhR2BV
	 ZibjkoWH2nCwsUpPwwCwkVc0VAw+8Twkh+v0AFcPWvmBAXvrjPit1w3uX3eZjuZ7bS
	 Ul5pZhzmVDNH2iEjjOjvFAr21WvJk7uL6CMNbzZYjFapr6T+F4e9WssMCF+jCktkdN
	 TOuaE6YUWQ8elGqYN0CWmLUQdD6ElvWhQzSt55v+T7sqDlDabZIKVV5MMLHpfqmUGw
	 T+IgAc4k4g0P7txJhHq0pATW7KcddGyiBWEXqCKh2xScRVcGnix5m1ZaWCz3BOoJiM
	 C0NmOLXEMae0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 136A44062C;
	Wed, 16 Sep 2026 21:04:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E01F424D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C655C400F9
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ugFV2PDjvrZx for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 21:04:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2EC40400B0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789592657;
 b=QNPnPOJGLwlY3ry8LjmrS09lqZXlZWc64XghooAVsKdPmK/6gm1G6ekuk85vKmjuiNNW
 wutP+UvRd3KS1S02N3Jd6TrgzBFSfq1wa8IRlWwTCVzgrFarnDuWLxdElCf/jAS7qJmIK
 QeJVqvsiBea1zPfAaXV0FrazXjl/Fs+3F4fV5k/m1iQ2NoTwjCb23RaQ1p0Jcz4C2+xva
 ZO+UkNwffYyJrkHC15j/Uyt2SiWWskkwi10/LiqRJ7PCzvsBmfWC9jYE1ZxY+G7fBz13B
 fXM0Z9IGQyJEISi09v6tm2PQtHUV6nf50qcO0IGUnYHF3z6YqSdiCUMj2cptQlp/nTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789592657;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=5T6OQO0fulnubhd8+4NYkhjtllNbkJb218f6b0Ksrmk=;
 b=JMgZ/Inx2vxhkuavwNgmCK5n5XB1yYzAvAlOVlfZ9Z/qzRrjxmURj7s7WW+LfYZqk5wc
 XqZ1HJfnPZxVhO/dhwTjUN956jeEygyMkvYdH5EIoaII2M37lOWuYS7eJiHWdQ9oRApoO
 PIvRZLVh6W45Fp+cU5/3OfV6ye7G8bJFjLyripv4eC8diTxQE5sgBKf9l3zEz5Ky0x0Gi
 6duf780lTU/OmjQofDK6821e3M26DQbJ1Bd+VWvBiS84xbJf3SqjX/7uvezQ8PCUxHMvB
 oVrdPBMhwQShdoPpbvptit6JBHriwRQ9qGfegndIicwr5ERCsu5h8Byc75YiKSZDcbA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=0iQ0V027; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2EC40400B0
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:04:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 51273C5CD6B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:04:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1A9CC60337;
 Wed, 16 Sep 2026 21:04:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0C5DC11C79EA0; 
 Wed, 16 Sep 2026 23:04:08 +0200 (CEST)
Date: Wed, 16 Sep 2026 23:04:08 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Message-ID: <aqsEQ_NEq8wdi1Ly@windsurf>
References: <20260916205022.2349080-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260916205022.2349080-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libest: needs OpenSSL engines
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Sep 16, 2026 at 10:50:22PM +0200, Bernd Kuhls wrote:
> Fixes build error:
> 
> In file included from client.c:14:
> client.c: In function 'JNI_OnLoad':
> ./../../src/est/est.h:834:10: error: implicit declaration of function 'ERR_load_crypto_strings'; did you mean 'ERR_load_CRYPTO_strings'? [-Wimplicit-function-declaration]
>   834 |     do { ERR_load_crypto_strings();      \
>       |          ^~~~~~~~~~~~~~~~~~~~~~~
> client.c:88:9: note: in expansion of macro 'est_apps_startup'
>    88 |         est_apps_startup();
>       |         ^~~~~~~~~~~~~~~~
> ./../../src/est/est.h:836:10: error: implicit declaration of function 'ENGINE_load_builtin_engines' [-Wimplicit-function-declaration]
>   836 |          ENGINE_load_builtin_engines();  \
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> client.c:88:9: note: in expansion of macro 'est_apps_startup'
>    88 |         est_apps_startup();
>       |         ^~~~~~~~~~~~~~~~
> client.c: In function 'JNI_OnUnload':
> ./../../src/est/est.h:860:40: error: implicit declaration of function 'ENGINE_cleanup'; did you mean 'EVP_PBE_cleanup'? [-Wimplicit-function-declaration]
>   860 |          OBJ_cleanup(); EVP_cleanup(); ENGINE_cleanup(); \
>       |                                        ^~~~~~~~~~~~~~
> client.c:101:9: note: in expansion of macro 'est_apps_shutdown'
>   101 |         est_apps_shutdown();
>       |         ^~~~~~~~~~~~~~~~~
> ./../../src/est/est.h:862:10: error: implicit declaration of function 'ERR_free_strings'; did you mean 'ERR_load_EC_strings'? [-Wimplicit-function-declaration]
>   862 |          ERR_free_strings(); } while (0)
>       |          ^~~~~~~~~~~~~~~~
> client.c:101:9: note: in expansion of macro 'est_apps_shutdown'
>   101 |         est_apps_shutdown();
>       |         ^~~~~~~~~~~~~~~~~
> client.c: In function 'est_client_raise_exception':
> client.c:122:17: error: implicit declaration of function 'ERR_print_errors_fp' [-Wimplicit-function-declaration]
>   122 |                 ERR_print_errors_fp(stderr);
>       |                 ^~~~~~~~~~~~~~~~~~~
> 
> seen with this defconfig
> 
> BR2_PACKAGE_OPENJDK=y
> BR2_PACKAGE_LIBEST=y
> 
> The failing code was added upstream on Jul, 6th, 2020:
> https://github.com/cisco/libest/commit/ab998c0918d1d46e1d8664a89b249cac08606e53
> and included in version 3.2.0.
> 
> Buildroot commit 5bbb1834a412f2fb2d9692cdc40c99097fb8a46d bumped the
> package to a tree including the aforementioned upstream commit on Jul
> 24th, 2022 so a backport to LTS branches should be considered.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
