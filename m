Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631F0C4345F
	for <buildroot@archiver.kernel.org>; Mon, 22 Apr 2024 01:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5F1F8131E;
	Mon, 22 Apr 2024 01:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3WT0_PZ9eeKB; Mon, 22 Apr 2024 01:24:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC76080EC9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC76080EC9;
	Mon, 22 Apr 2024 01:24:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 968C51BF48B;
 Mon, 22 Apr 2024 01:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82DC9605BD;
 Mon, 22 Apr 2024 01:24:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bYIOVws_hIh6; Mon, 22 Apr 2024 01:24:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.210.172;
 helo=mail-pf1-f172.google.com; envelope-from=kidovate@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9EABA605BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EABA605BA
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9EABA605BA
 for <buildroot@buildroot.org>; Mon, 22 Apr 2024 01:24:11 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-6effe9c852eso3166352b3a.3
 for <buildroot@buildroot.org>; Sun, 21 Apr 2024 18:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713749050; x=1714353850;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D9DQ3hi6XhSyYIEtoXOJDlOyy+AgW5cy8Axa2waVyXY=;
 b=NKtQyH9Eax2lKr+hu5uNx6jIuAiWcumADuCdIpRlxI/ufLv0itvQLtR/58I2MOJwEr
 EwZ23EMl7AtCsRiEf6SZpz3Yq3VF09woTgWsfcrtlQnaMf18L6qv5Y/pKIXqJPoBG9FF
 g/TppkvVDGiCp2/emg6xf/bHvzbsL6MrRFz3EOt3ovy97XrNGr3s5jApgvyEbrEmd/6v
 5K9ElB/dn0kkUEO4hsWcBIfV2veq59eYdw2oS1USbD6KddDEVIojFXcTIo66Y07vTiXo
 QagBCks8F3yI2AZeI9Lfza2SwvlsBCglJ1OoBFPUL6/+YR6k+OK41eL6Tzs2r1dcX0Kv
 0q3w==
X-Gm-Message-State: AOJu0YwfrPnBdxubu0Nd9ykD6VvY41o5wnXYmkbq4CZAaQ0cPtuSN3Dc
 2qtp5DEAW3GsrP9mLeGgVMoxnqNQkm7oePHF1IGtEmjHYlWnrKSnPzE3nQ==
X-Google-Smtp-Source: AGHT+IGt2J8SMBCkYjnSpgBrnf40Fbarxzkw3yLPIP7DC/ITAcUrgIGWf2reBevcdOvtiEIjiH98ow==
X-Received: by 2002:a05:6a20:2594:b0:1a9:eeef:f6b3 with SMTP id
 k20-20020a056a20259400b001a9eeeff6b3mr9608026pzd.53.1713749050138; 
 Sun, 21 Apr 2024 18:24:10 -0700 (PDT)
Received: from flame.local (ip184-189-231-225.sb.sd.cox.net. [184.189.231.225])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a170902e54f00b001e512537a5fsm6908702plf.9.2024.04.21.18.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Apr 2024 18:24:09 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240418135615.457970-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Thu, 18 Apr 2024 15:56:15 +0200")
References: <20240418135615.457970-1-giulio.benetti@benettiengineering.com>
Date: Sun, 21 Apr 2024 18:24:08 -0700
Message-ID: <m2zftmyytj.fsf@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=reject dis=none)
 header.from=aperture.us
Subject: Re: [Buildroot] [PATCH] package/elfutils: fix host build failure
 due to missing demangle support
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Hi Giulio, all,

> When building on hosts with libstdc++ without demangle support this error
> shows up:
> checking for __cxa_demangle in -lstdc++... no
> configure: error: __cxa_demangle not found in libstdc++, use --disable-demangler to disable demangler support.
> make[1]: *** [package/pkg-generic.mk:273: /home/giuliobenetti/br_reproduce/c2524c7580d97f7387ec22da62be71d77f2ed8ec/output/build/host-elfutils-0.189/.stamp_configured] Error 1
> make: *** [Makefile:23: _all] Error 2

> So let's disable demangler for host by default.

> Fixes: still not showed by autobuilders. Reproduced on Ubuntu 22.04 with
> Ubuntu APT g++ 11.4.0

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/elfutils/elfutils.mk | 1 +
>  1 file changed, 1 insertion(+)

> diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
> index 87b51aa5b5..4d8cc43342 100644
> --- a/package/elfutils/elfutils.mk
> +++ b/package/elfutils/elfutils.mk
> @@ -27,6 +27,7 @@ HOST_ELFUTILS_CONF_OPTS = \
>  	--with-bzlib \
>  	--with-lzma \
>  	--without-zstd \
> +	--disable-demangler \
>  	--disable-progs
> 
> ELFUTILS_LDFLAGS = $(TARGET_LDFLAGS) \

A user encountered this issue and reported it:

https://github.com/skiffos/SkiffOS/issues/311

Thanks!

Reviewed-by: Christian Stewart <christian@aperture.us>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
