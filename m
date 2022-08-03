Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9462AC19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 20:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F1674018A;
	Wed,  3 Aug 2022 20:05:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F1674018A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lFMDMuDx7uPu; Wed,  3 Aug 2022 20:05:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33EB640167;
	Wed,  3 Aug 2022 20:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33EB640167
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B49D71BF3CA
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 897C440167
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 897C440167
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gWFP5SZKJmhl for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 20:05:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4E0540156
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4E0540156
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 20:05:53 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id i4so13719138qvv.7
 for <buildroot@buildroot.org>; Wed, 03 Aug 2022 13:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f19sZBlQrfbK5Qysh9pnPK5EJKgQp1OD62+JYWzBfoU=;
 b=V31Nh0eaRAyzlPJ7cEfVAN4j2LY5F4Bw6Z7zXGjamBFiUNx8nN68+QmFZ8IMHJ1YRz
 PT4tetX7rCeUVcgof+PP/KzBD6i5Nqi9jcaLwpHBTNJ4mY4Qv+I0w50G0z95CJQhE2Og
 wSj3UEwj2F6vI3/HnneHCGhOb/Uz02R8TlpAU8867AFQxiqC3cjlgHDzKpMqrgIlnf79
 3kVTkmo1hU6EyE+6ncommJOg3zYmTVjsbT0Dwm3wp45iWPxOCl4LhxR7umjH3cYUtcbw
 jdasJ01cuIV+4y3ykllrA2SCFVHrdt7nLbASZkIzVCEfNv9rGbS7YAQFPC2kCxyb7ecG
 Kyfw==
X-Gm-Message-State: ACgBeo1mN152md1JnOHThuVn94YQuYnidAOMXnmQK0gy2BHpeG2AqTmn
 2iEhLOcNpfNDYtsiauVs34jwzA==
X-Google-Smtp-Source: AA6agR7eDcRsdcYcEupu9jEKVhBCoRpAvBwfOu5EbrKKUJJk6DA2Ds0gthRxWTr2+OB6KzolPIqlpw==
X-Received: by 2002:ad4:5ded:0:b0:472:f1e0:9562 with SMTP id
 jn13-20020ad45ded000000b00472f1e09562mr23088642qvb.85.1659557152452; 
 Wed, 03 Aug 2022 13:05:52 -0700 (PDT)
Received: from hefring ([50.212.55.89]) by smtp.gmail.com with ESMTPSA id
 bl2-20020a05620a1a8200b006b63679a433sm13319402qkb.133.2022.08.03.13.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 13:05:51 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
X-Google-Original-From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Date: Wed, 3 Aug 2022 16:05:49 -0400
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YurVHdu+AIRC3eoy@hefring>
References: <20220802133625.1285283-1-Ben.Wolsieffer@hefring.com>
 <20220803002933.0e959c3b@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220803002933.0e959c3b@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=f19sZBlQrfbK5Qysh9pnPK5EJKgQp1OD62+JYWzBfoU=;
 b=o+7E4DtwFVcZsjXCciCzH+dyBJJdAATWfcV3TPsa//y0gkISUezBGAghXW6kqZGu1Q
 65sFp/CoAJDzmvI0rsuUBZFS1PGqQ2yeQv/2OY53tQ2g/g7qnz2SwRIDxQiwrqRTehPV
 AMk4cu+kr+WnUdIls105LY9x2h886SRNYfQiE9xGccd+fOpHofTR+ePU3BD2ajvkZUb+
 kpMsenXNb+5hH0dD9qU+M8I++LI3DCY1iW8pm7SP4jG0Ia9W3BZU67FA2NOqFaNHfDhX
 wi76yUe+iCSybxmlcIjdQEqR4kYu9cN7fde2zK/Rl7lXHUdzocS38E2nuuujq41qPnIH
 1JPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20210112.gappssmtp.com
 header.i=@hefring-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=o+7E4Dtw
Subject: Re: [Buildroot] [PATCH] package/uclibc: fix usage of DODEBUG option
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thanks for the review!

On Wed, Aug 03, 2022 at 12:29:33AM +0200, Thomas Petazzoni wrote:
> > The DODEBUG option passes -O0 and -DDEBUG to the compiler, which has a
> > significant impact on runtime behavior and performance. Currently,
> > DODEBUG is enabled by BR2_ENABLE_DEBUG, but it makes more sense for it
> > to be enabled by BR_ENABLE_RUNTIME_DEBUG.
> > 
> > This patch implements the above change, and also disables the DOSTRIP
> > option when BR2_ENABLE_DEBUG is set, allowing debug info to be retained.
> 
> We want to disable stripping unconditionally. stripping is done by
> Buildroot on the $(TARGET_DIR) when stripping is enabled. Ideally,
> packages should not themselves strip binaries.
> 

Ok, I will make this unconditional in v2.

> > Lastly, this patch passes all of $(TARGET_CFLAGS) to make, instead of
> > just $(TARGET_ABI). This enables debug symbols when appropriate.
> 
> This has a bit more impact:
> 
> TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) $(TARGET_HARDENED)
> 
> TARGET_CPPFLAGS means we will now be passing -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> 
> TARGET_OPTIMIZATION means we will now be passing -Oxyz, perhaps
> overriding the optimization level chosen by uClibc? We have seen that
> causing problems with glibc for example, I don't know if we need to be
> careful in a similar way with uClibc.
> 
> TARGET_HARDENED means we will be passing -D_FORTIFY_SOURCE=1/2 if
> BR2_FORTIFY_SOURCE_1=y or BR2_FORTIFY_SOURCE_2=y.
> 
> I'm not saying no to this change, but again we need to consider the
> impact.
> 
> One more careful option is perhaps to do:
> 
> UCLIBC_EXTRA_CFLAGS = $(TARGET_CFLAGS) $(TARGET_DEBUGGING)
> 
> This achieves the same goal of having the debugging symbols, without
> risking of introducing extra flags.
> 

I haven't experienced any problems due to these flags, but I can't prove
they won't break things for others, so I will use your suggestion for
v2.

Ben
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
