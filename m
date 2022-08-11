Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4199FC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 21:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98BB2417C9;
	Thu, 11 Aug 2022 21:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98BB2417C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p9SGJ2bQ9X7F; Thu, 11 Aug 2022 21:37:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50324417A4;
	Thu, 11 Aug 2022 21:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50324417A4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3DAB11BF215
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 21:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26203404AB
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 21:37:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26203404AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KbZSI8RpTeMP for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 21:37:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFB3A4018E
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFB3A4018E
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 21:37:24 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id f14so14528779qkm.0
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 14:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc;
 bh=zqHck8ctSnTog6RMzv4Iatn2BZ0ejWXbxMynBId1FSQ=;
 b=lLfcXZ7LXoK+S0bwnLe7BOxh583vRGnPNlUko+KiiT/JtnCRgssTbG42hDQfB7wKoM
 Q1TAGVwB1IojeEeeBKrachTFo2YwLECvFhdKgFIxVDTdHNI6QbItkE4gFoL+Sy/dfOcD
 5t5fKukQhIPkdjrScAsT4q/Rg98ACbp03WkSABA0JU3ReOiJoA6fV4mmgj+OzUSBuMWz
 Pggy/3637F3N2bvtKpjG1SunbVLkDjt7zUW1V5VZoYlPMa337MldGJODmHUqQU9UE76U
 ++VMm3YM4h3JvWnBV6g8H1yP/xW1hWc5983tCrLZk48vG+yfY1r7z6vgLoQZb6ZUfGXa
 /d7g==
X-Gm-Message-State: ACgBeo2cfFSEm3daOGwCFgXN4oFugASZs8yhyX341aRNcmic5zVSRvZW
 QhUHz3ect1PeXwdXnDgbHJoOwg==
X-Google-Smtp-Source: AA6agR7rMFOzDmv3eJQzLAeeCPfLDwnvb3qZqSL+osM/AGrYssA8cqhQWInRkE2vfXFcKxm33rx/Gw==
X-Received: by 2002:a05:620a:4054:b0:6b9:9764:b91c with SMTP id
 i20-20020a05620a405400b006b99764b91cmr771429qko.261.1660253843804; 
 Thu, 11 Aug 2022 14:37:23 -0700 (PDT)
Received: from hefring ([50.212.55.89]) by smtp.gmail.com with ESMTPSA id
 f8-20020a05620a15a800b006b928ba8989sm291267qkk.23.2022.08.11.14.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 14:37:23 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
X-Google-Original-From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Date: Thu, 11 Aug 2022 17:37:21 -0400
To: Vladimir Murzin <vladimir.murzin@arm.com>
Message-ID: <YvV2kelJpRw6erhZ@hefring>
References: <20220802133009.1282520-1-Ben.Wolsieffer@hefring.com>
 <b71a7617-3e26-14ef-6fe6-45e766924270@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b71a7617-3e26-14ef-6fe6-45e766924270@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc;
 bh=zqHck8ctSnTog6RMzv4Iatn2BZ0ejWXbxMynBId1FSQ=;
 b=12MHe9Inxoi+EOGHkv0CCQGX2DgLQPEo79tWBRSzaBaiCj53KNDfdYXMaq3rGAAFhf
 W6maLncfM3FDajVFqZxqIh3fdjcc0mptGB0Y/5bJSI6ZQA5kZvQEXItCqW9Zp+L00R/s
 SctP+6f2I19B+eFXKmyWlTpMdpdRclBpML6TFRhoZpV/aXMPEDqHdTisTEoODEK/OunX
 +E9ZDGc/qVliLT7lGfdcKqES46/HJSaaGek7jXk1Hk4PLrx1fqrBjStidhb6M84kzlV+
 Fd+AKkYntJ0KoAG+rNMdKA0VLuOeE0hxVuEbT5+eQSX5FHOxe2BlPXpTiWnsL2hBF9hD
 7LvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20210112.gappssmtp.com
 header.i=@hefring-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=12MHe9In
Subject: Re: [Buildroot] [PATCH 0/2] Add support for FDPIC binaries on ARM
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Aug 09, 2022 at 12:26:14PM +0100, Vladimir Murzin wrote:
> 
> You might also want to allow uClibc to use NPTL thread library instead
> of old(-sh) LinuxThreads with something like
> 
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index ba8b5885ec..30a154531a 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -76,7 +76,7 @@ choice
>  
>  config BR2_PTHREADS_NATIVE
>         bool "Native POSIX Threading (NPTL)"
> -       depends on BR2_USE_MMU
> +       depends on BR2_USE_MMU || BR2_BINFMT_FDPIC
>         select BR2_TOOLCHAIN_HAS_THREADS
>         select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  

You mean I could have just used NPTL and not wasted hours fighting
LinuxThreads...

I'm not sure how I missed this before, since I immediately found the
relevant patches when I searched for them now.

I've been playing around with NPTL and FDPIC and it doesn't quite work
perfectly out of the box. Static libraries (linked into a dynamic
executable) crash when attempting to use TLS. In addition, the reason
static libraries are even being used is because libtool doesn't recognize
the target name and therefore thinks it can't build shared libaries.

There was a patch [1] submitted a few years ago to add the target to
libtool, but it looks like it was ignored. Unfortunately, we can't just
apply it in Buildroot, unless we want to run autoreconf on every
package. I'm working around this locally with a hacky hook to patch
configure scripts, but I'm not sure it is appropriate to upstream.

Although the situation is not ideal, things basically work with
LinuxThreads and the libtool issue, so I'd prefer to get this patch set
finished without expanding the scope.

Thanks, Ben

[1] https://lists.gnu.org/archive/html/libtool-patches/2018-05/msg00000.html
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
