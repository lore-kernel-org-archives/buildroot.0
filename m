Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B5DCD1283
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 09:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 469D681E13;
	Mon,  1 Apr 2024 09:31:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fpUQiGtrk3lm; Mon,  1 Apr 2024 09:31:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B21A181D9F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B21A181D9F;
	Mon,  1 Apr 2024 09:31:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14D531BF38A
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 09:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AE3B4057A
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 09:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7g-l73voxeJQ for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 09:31:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AC3F940337
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC3F940337
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC3F940337
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 09:31:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id ED0CA13FA34;
 Mon,  1 Apr 2024 11:30:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Apr 2024 11:30:56 +0200
Date: Mon, 1 Apr 2024 11:30:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Zgp-0HKXYQEN0fbr@landeda>
References: <20240303083314.156042-1-thomas.petazzoni@bootlin.com>
 <20240303083314.156042-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240303083314.156042-3-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711963860;
 bh=j6BSt3jiF+WE8e8GMGMhF6h515PcoUlLHePgjjnbThA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mK7l+tgB6v9D+UUS3Mn6MBvLFl2CZrUKmMqImnUwHu9eCTjY6OODzNdE+ragUQASu
 JrEctt397kpHlef1ZTljyqTHNwisqIZr3N78+jN2YdxKoFfE30w/5bzo8eAjQBjXIY
 ezOBpe4xTXQT9YpebCiwqkP4N5ijXUBY/5TZdzgiTNwV2jMk0uA5bR2RahCAIpkeCG
 dpz86FbVezU9eShzEdjTIKcf/Q0k29AoDKzLrL93UM50X1337U7Pmcakrn8BVnx3zg
 zRL5iT3iLmwWUuuLSH4Xbg3okbljwUwlTVoqaG3/N2p4/FgXm6bQE+WZsMJsMbyrlD
 ApMwdwSMRC2dA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mK7l+tgB
Subject: Re: [Buildroot] [PATCH next 2/2] package/glibc: bump to 2.39
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-03-03 09:33 +0100, Thomas Petazzoni via buildroot spake thusly:
> The 3 patches we had have all been merged upstream as of 2.39, so they
> can be dropped.
> 
> The libcrypt library is gone from glibc, and therefore the
> --enable-crypt option is also gone.
> 
> The LICENSES file has changed with the addition of a copyright notice
> from IBM (some files contributed by IBM have been relicensed), and the
> license is MIT, which is already listed in GLIBC_LICENSES, so no
> changes are needed on our side.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[--SNIP--]
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index d198d6f04c..96a850516f 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -7,7 +7,7 @@
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>  # When updating the version, please also update localedef
                                      .^^^^^^^^^^^^^^^^^^^^^
As already mentioned, you forgot to -'

So I did that, which needed rebasing the localedef patches.

After a little build-test with a few locales enabled, it looked like the
new localedef still works.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> -GLIBC_VERSION = 2.38-44-gd37c2b20a4787463d192b32041c3406c2bd91de0
> +GLIBC_VERSION = 2.39-5-ge0910f1d3278f05439fb434ee528fc9be1b6bd5e
>  # Upstream doesn't officially provide an https download link.
>  # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
>  # sometimes the connection times out. So use an unofficial github mirror.
> @@ -195,7 +195,6 @@ define GLIBC_CONFIGURE_CMDS
>  		--without-gd \
>  		--with-headers=$(STAGING_DIR)/usr/include \
>  		$(if $(BR2_aarch64)$(BR2_aarch64_be),--enable-mathvec) \
> -		--enable-crypt \
>  		$(GLIBC_CONF_OPTS))
>  	$(GLIBC_ADD_MISSING_STUB_H)
>  endef
> @@ -206,7 +205,7 @@ endef
>  #
>  
>  GLIBC_LIBS_LIB = \
> -	ld*.so.* libanl.so.* libc.so.* libcrypt.so.* libdl.so.* libgcc_s.so.* \
> +	ld*.so.* libanl.so.* libc.so.* libdl.so.* libgcc_s.so.* \
>  	libm.so.* libpthread.so.* libresolv.so.* librt.so.* \
>  	libutil.so.* libnss_files.so.* libnss_dns.so.* libmvec.so.*
>  
> -- 
> 2.43.0
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
