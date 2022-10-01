Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55FBC433FE
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 11:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17E644197E;
	Sat,  1 Oct 2022 11:36:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17E644197E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jnlgSiaW6Ojr; Sat,  1 Oct 2022 11:36:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F83041939;
	Sat,  1 Oct 2022 11:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F83041939
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 418741BF5AA
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 11:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CBE8402E7
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 11:36:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CBE8402E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pR6SlVy7jXz7 for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 11:35:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 575DA40159
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 575DA40159
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 11:35:59 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id bk15so10445066wrb.13
 for <buildroot@buildroot.org>; Sat, 01 Oct 2022 04:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=Wz4RRJY0pM1puy7PZmICr4TLt1AVOsJhnHvwVxqEGlE=;
 b=l8AjzEj/j/HJYVOcHtgOKZ3FxzlcPv6QDXRnLmXlK7AjmSORGx3yfgmX1wUkZLHBUz
 cmxXuRtmbiT3FvdpVtEWPWtpnd4ABDy9HVs5MHK3hfQUovV9rosHD2w+bp0ZoEsyTuqH
 /Tmz5rTec7IM5JQxwADTeZFDi8ZwDXQP30ylZqOd0r/L7+PcJ41KMysFaCvJj3PIgTjx
 zezpGgsvxsll4MQGfRcRc9sy1WZUexnr2aRyf6HK1OuSCMrQ02SnwsjfF2gAvX/+3SDY
 0B7NvOchQY54Ok58ksXpDuTrYjug9VwBby3KVKzMgdCM0Qpplg0Lld6d/B/2UaEsJvQ6
 btWA==
X-Gm-Message-State: ACrzQf1Swb2wkd9d0EDfZwyhocveD5wDiPS/2w0f02rCSjGtbQ8Z2XqU
 cHmXOmFjahQteRii+5koK8c=
X-Google-Smtp-Source: AMsMyM64ctalizvFuDs0j3MfeBVVnHO15wJ2mtaQ322AH2hi2ofx1qwPGU/2g5WATQNwR2fqsGHjrw==
X-Received: by 2002:a5d:47a1:0:b0:22a:2979:4899 with SMTP id
 1-20020a5d47a1000000b0022a29794899mr7961356wrb.349.1664624157165; 
 Sat, 01 Oct 2022 04:35:57 -0700 (PDT)
Received: from localhost ([2a03:b0c0:1:d0::dee:c001])
 by smtp.gmail.com with ESMTPSA id
 w7-20020adfde87000000b0022afedf3c87sm4780898wrl.105.2022.10.01.04.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 04:35:56 -0700 (PDT)
Date: Sat, 1 Oct 2022 11:35:55 +0000
From: Stafford Horne <shorne@gmail.com>
To: gcc-patches@gcc.gnu.org
Message-ID: <YzgmG9Ihqt6xC7CA@oscomms1>
References: <20220929145740.4846-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220929145740.4846-1-shorne@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=Wz4RRJY0pM1puy7PZmICr4TLt1AVOsJhnHvwVxqEGlE=;
 b=ZphsxuD8lHIQHZ/fKsTPvEWxQnO3Qrkv8GkN0g5jk+nULFzLG9mKHZN2BXZHTKukVr
 MXUZ2+c3XwFoJPWfXCm3iRsOIz0mJeVnPm4eOpkzeeMPU0ByBYQxtXsy3XtFIiZ97MkK
 TAac6gEW2xBGZtx5CNvd1zvHHgU1ameGIaGf4eg/PO6FjpE7CQAlehV60vElgM4W8J8i
 huL6wP/yunllXQE42rA6pQTvlvAdpm3ZyZkc9adSSHp/HtjbMo+CdBVY8k7lLM8SZYIZ
 LVfsaOy2gWVgL7PX8Yfp8Pclw8NBMy6Bcv3koa2gePsb9045rOLsL6VY8ZuIxYTdpGNB
 4pSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZphsxuD8
Subject: Re: [Buildroot] [PATCH] or1k: Only define TARGET_HAVE_TLS when
 HAVE_AS_TLS
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
Cc: openrisc@lists.librecores.org, Yann Morin <yann.morin@orange.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Sep 29, 2022 at 03:57:40PM +0100, Stafford Horne wrote:
> This was found when testing buildroot with linuxthreads enabled.  In
> this case, the build passes --disable-tls to the toolchain during
> configuration.  After building the OpenRISC toolchain it was still
> generating TLS code sequences and causing linker failures such as:
> 
>  ..../or1k-buildroot-linux-uclibc-gcc -o gpsd-3.24/gpsctl .... -lusb-1.0 -lm -lrt -lnsl
>  ..../ld: ..../sysroot/usr/lib/libusb-1.0.so: undefined reference to `__tls_get_addr'
> 
> This patch fixes this by disabling tls for the OpenRISC target when requested
> via --disable-tls.
> 
> Tested-by: Yann E. MORIN <yann.morin@orange.com>
> 
> gcc/ChangeLog:
> 
> 	* config/or1k/or1k.cc (TARGET_HAVE_TLS): Only define if
> 	HAVE_AS_TLS is defined.

I have pushed this upstream now.  Adding buildroot patches should be easy to do
now.

-Stafford
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
