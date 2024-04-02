Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6283FCD1284
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 21:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 342F96058F;
	Tue,  2 Apr 2024 21:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id haDeKM1Oiygc; Tue,  2 Apr 2024 21:28:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34D02607A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34D02607A8;
	Tue,  2 Apr 2024 21:28:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 53A7A1BF295
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 21:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D6E640570
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 21:28:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2b3pbTIhBehz for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 21:28:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E9DD940544
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9DD940544
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9DD940544
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 21:28:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 11B8513F81D;
 Tue,  2 Apr 2024 23:28:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 02 Apr 2024 23:28:26 +0200
Date: Tue, 2 Apr 2024 23:28:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Zgx4emXI7NgZPSBI@landeda>
References: <20240401234013.3570820-1-james.hilliard1@gmail.com>
 <20240401234013.3570820-2-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240401234013.3570820-2-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712093313;
 bh=M6A3V8/zUvbDgCCLjXc6ZEGmJ7iytGA+m93Fzpcv5sU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N90VVA/GZhmVYdGxFvjMmGFuR/Z2pZveJBDZkcJW+H6WOSo+BvlD95AoMUdX89XnC
 AEbxbV1xMDkRUW8WgVl1Cp3ezzlnziOjUzdgWXJOPZZrTgu0KNPdOB05G/x4+uPfH8
 GVXDwtivPdg9jaGYREfMhC+IF7WA61Lvu0z2XhcTryuAUAks+J4Jd6NMA5pcVMTH9e
 4gZVf0Tkq3EECz9rrR8eQjV2DPpLrmxcTinlfUdPfujQES1pRxoJwy69eSDlbhpy2n
 OA8OfWy/WYQZVl7y18V+6/r++Q/cv2DGfSAbs7mCUud0Lkmza7xQ4ms0i3l5vi9B33
 WnXQqUJLpI1OA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=N90VVA/G
Subject: Re: [Buildroot] [PATCH 2/2] package/systemd: fix build with glibc
 2.39
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2024-04-01 17:40 -0600, James Hilliard spake thusly:
> When glibc was bumped to version 2.39 in commit
> b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
> libcrypt support.
> 
> As glibc's libcrypt was providing systemd's libcrypt dependency this
> broke any systemd build using glibc version 2.39.
> 
> To fix this add the libxcrypt dependency to systemd which is the
> preferred way of providing libcrypt support in systemd as the glibc
> variant is only used as a fallback due to being deprecated.
> 
> We should also have host-systemd depend on host-libxcrypt in case
> the host system does not provide glibc with libcrypt support.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/36e/36efcfc76c015c9b4c955c13afa0f81a98b529f4
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/systemd/Config.in  | 1 +
>  package/systemd/systemd.mk | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index aa5143d484..a94e9b73b8 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -28,6 +28,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
>  	select BR2_PACKAGE_HAS_UDEV
>  	select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER # runtime
>  	select BR2_PACKAGE_LIBCAP
> +	select BR2_PACKAGE_LIBXCRYPT
>  	select BR2_PACKAGE_UTIL_LINUX
>  	select BR2_PACKAGE_UTIL_LINUX_LIBS
>  	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index c6b006d1fb..8987dc19a6 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -55,6 +55,7 @@ SYSTEMD_DEPENDENCIES = \
>  	host-python-jinja2 \
>  	kmod \
>  	libcap \
> +	libxcrypt \
>  	util-linux-libs \
>  	$(TARGET_NLS_DEPENDENCIES)
>  
> @@ -882,6 +883,7 @@ HOST_SYSTEMD_DEPENDENCIES = \
>  	host-util-linux \
>  	host-patchelf \
>  	host-libcap \
> +	host-libxcrypt \
>  	host-gperf \
>  	host-python-jinja2
>  
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
