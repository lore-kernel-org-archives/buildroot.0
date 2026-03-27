Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D0D10ED640
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC119414E0;
	Fri, 27 Mar 2026 10:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GyERk6njh7Ma; Fri, 27 Mar 2026 10:02:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C25EB416E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605771;
	bh=EE2rbS3XDgj/OPxIEf/wyHvzDMyPhJYR6B1jOAi1wJg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S8QU1+4VRZ2UZkoX3FHax7mXl7JEjzr1jg6r2HnmLKi6tywvHzeHrFUB26klRVcgv
	 14IiKTfFGoGTVSUmoRStuCwJ9UXL6T8jwKuZJAdOueL3fkxEGn/Ex5/VqkhB2VqyQ2
	 9/EtXEvDnYYfJAOGm/b7cwMx11IC7qFuT5PIm6hWH/t0b3qu0E39wN0bJLvmvWy9uB
	 6JHRyVbl2mdQVC67bM0o+T7rG3A0INTd22g+oj+H9V/3BZ6ijb4qAIMhcMWiZmrsFb
	 hKV7rjraz73Y9nLKA54V10FgwcXflr0jqk9HyP1deEYETCi860YUiJHiwz5u1sHon3
	 dUd/bi6SR2bvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C25EB416E3;
	Fri, 27 Mar 2026 10:02:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 51EBA249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43818613FB
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Juu4nIvYq3s for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:02:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 211FE613E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 211FE613E4
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 211FE613E4
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:45 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-486ff201041so17070735e9.1
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 03:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774605763; x=1775210563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IYqr2yMquoXGx/98dNDKW5rbTzernjOhnEI+PS3huEw=;
 b=DFlTy0/ZOMQxagOBjZqDj1pfyw5Do1qbNXwb/EuRYZXAjhoe5Xj7iXS1exmmmULSFJ
 mtPaBsXcD6BgBx4ZMrTdqkbUjrZ5ZiZJSq2wr5R36Y4mVhEovNeU3YV55iwDSr+N9wwm
 +58PBhBg7LO0I9L2b+iSozVeUw6+1iVgWoYbvbw6VgRwCyuw3FcvA8uF7e8PT0JM14GO
 fhWRx8gw52DHuCSr3XKNIdudaL979JpUrL8iPRnJNlKHB+f639xDeVrChECZu/u/rd2/
 YIl4EdNhhwCXhiSZDxXPqF6wmbm8mXksRvanVKseRkD/wYAukhd3+PpfFiWMfY/Sm9fK
 mWPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQKgxSPe6Db2e58n6cT7lpF0bersGjmQfP5SEksnc+jYGiDbCooEae8aeJYQc9M9KgXiNFiYFUV3c=@buildroot.org
X-Gm-Message-State: AOJu0YzBRITngoEsjbpHK17i0lox3LyWfa9E2zFlRqv9tOWiOOd8wZa5
 Fgzmj9SwsqkSpoVdmFGEJJW1ctyfXJu38nv/1i/H9EZClYvOqeohSb+Ot0mWFGXs6EA=
X-Gm-Gg: ATEYQzxYJnGv94ttqN1DWpe+14QwDnvwBlFryNjjI5XrXujqWfIuPLhL+Gji9fB4Fda
 +6Io9Kfc9FfioffWnxTHv/8/hsqZ7RR6Ii+syDArkI148xHmmz1pktLrEl2C0qwmkmVxLupezF5
 8GDV10ZxSqYvs7QinICDk1FM/Z/MLp/FIagB4KjWVM0SQ3uVO04oHySFe9LT5Zr63cEYpfHwZ6u
 grhZ5+xAsXoC797unv3R4+X2F6ZFP84m7bTURhMqaqU9dtZCgysVlQVF2pbCaOVCtTRff7nxGxv
 ycrHVlCw1uaGdfn6jkU9i3KvNn2dBt5i/jyWlEf2O9f4CezdNpAP+5lRz/15qU5Pk+yzZEUsuaK
 iW9E6orbUGHiIKOK4inq+33LSyG7qi3TeYbq1tGguDIeeqYI9kAAX4phkQZiH97c92vAiQVDzB3
 0aCijwfRHjwgRdfg2T
X-Received: by 2002:a05:600c:3505:b0:485:4135:5c92 with SMTP id
 5b1f17b1804b1-48727c7c6e0mr27584085e9.0.1774605763146; 
 Fri, 27 Mar 2026 03:02:43 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487270e7248sm20417955e9.6.2026.03.27.03.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 03:02:42 -0700 (PDT)
To: Andreas Ziegler <br025@umbiko.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 27 Mar 2026 11:02:41 +0100
Message-ID: <20260327100241.46367-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260314061837.9425-2-br025@umbiko.net>
References: <20260314061837.9425-2-br025@umbiko.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774605763; x=1775210563; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IYqr2yMquoXGx/98dNDKW5rbTzernjOhnEI+PS3huEw=;
 b=UBWekwOPPVVpb1X3VbXLH3pU8lovJTxZm4QP8G3y6q/2tJXtAJ6+mhZqT3whk5fS/4
 IufY+KiGcX231RBLIcUjzPcVddFEk/ILNG4Bk4S97EhAFLBmzloQXBg9ISSpN0643FVW
 2YeAQxcxtVWcZFPhv3OWZ+YPn1YlN/lG85K8zIOMyqa4rjOMEvOdZomQPhUI+sQbj5dn
 KKiiS54t8UHocT96gyuh6s2FTtqYiE5u4luXBkaExjyuhDXa1IwxDX3uh66E5fypqDUY
 qTjERb0c6mCGeMh41xhl2wRYIzjzH2T9OGxJPjni5ASSedQS835F6tOYg6OWcXKR7TxU
 ELHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UBWekwOP
Subject: Re: [Buildroot] [PATCH 1/3] package/mpd: enforce tcp for options
 using http
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Prevent disabling of TCP if some option is selected that uses HTTP.
> 
> Fixes:
> https://autobuild.buildroot.org/results/59b0be79b1ca1469477e7634205f3eaaebef7d5f
> 
> Signed-off-by: Andreas Ziegler <br025@umbiko.net>

Applied to 2026.02.x & 2025.02.x. Thanks

> ---
>  package/mpd/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/mpd/Config.in b/package/mpd/Config.in
> index d8ce930cc5..1b6815e904 100644
> --- a/package/mpd/Config.in
> +++ b/package/mpd/Config.in
> @@ -204,6 +204,7 @@ config BR2_PACKAGE_MPD_CDIO_PARANOIA
>  
>  config BR2_PACKAGE_MPD_CURL
>  	bool "curl"
> +	select BR2_PACKAGE_MPD_TCP
>  	select BR2_PACKAGE_LIBCURL
>  	help
>  	  Enable curl streaming (http) support.
> @@ -258,6 +259,7 @@ config BR2_PACKAGE_MPD_AO
>  
>  config BR2_PACKAGE_MPD_HTTPD_OUTPUT
>  	bool "httpd output"
> +	select BR2_PACKAGE_MPD_TCP
>  	help
>  	  Enable httpd output support.
>  
> @@ -341,6 +343,7 @@ comment "io_uring support needs a toolchain w/ headers >= 5.1"
>  
>  config BR2_PACKAGE_MPD_LIBMPDCLIENT
>  	bool "libmpdclient"
> +	select BR2_PACKAGE_MPD_TCP
>  	select BR2_PACKAGE_LIBMPDCLIENT
>  	help
>  	  Enable libmpdclient support.
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
