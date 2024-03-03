Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F359FC48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 09:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B793410B3;
	Sun,  3 Mar 2024 09:17:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FjOu8s73jh0v; Sun,  3 Mar 2024 09:17:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B72A410BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B72A410BC;
	Sun,  3 Mar 2024 09:17:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D28541BF2BF
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0726606DF
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:17:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z4afTfR5uBJh for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 09:17:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AC21D60647
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC21D60647
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC21D60647
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 09:17:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D6EDE13F899;
 Sun,  3 Mar 2024 10:17:42 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Mar 2024 10:17:42 +0100
Date: Sun, 3 Mar 2024 10:17:42 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZeRANiTB3lbbJ5MB@landeda>
References: <20240303083314.156042-1-thomas.petazzoni@bootlin.com>
 <20240303083314.156042-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240303083314.156042-3-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709457466;
 bh=Mty51L/WlQrvX5M+9xTShwmfg1JoVUzaUH1xL5TV508=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dbmjOwPrCvfvloKAl8ZhOvb6cxlLBDDValu93rL6DpIk7zjqu9nv5hSuOuhg1/YFt
 7cqY7es4DwDR9ubIhiwdj6nP5dEcqKFdiL1Lb2isp9ONGf5Qnpxdg7jzGEL43Xbcin
 XceuDXdEZZHNnq8DXnatMy7o8sWAE+iuNJ+Z078NiVb68r/xUdX+c7Vy9ih9Jo5wxb
 n627GJC4BWZM8GAqyKYuBX7tqAPyBSBBn76a984FE4ZjqmeC2cLWcs1/6gXgqAeyXq
 siORHyYrqfx3A7LjCGHmFYuJOImgaAs0hp1ZGVjMuBSWSmdK4op8ZiXNwnV2QQid6P
 8DjGb5VdFxiDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dbmjOwPr
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

Thomas, all,

On 2024-03-03 09:33 +0100, Thomas Petazzoni via buildroot spake thusly:
[--SNIP--]
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index d198d6f04c..96a850516f 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -7,7 +7,7 @@
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>  # When updating the version, please also update localedef
                                       ^^^^^^^^^^^^^^^^^^^^^
You forgot to ------------------------'

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
