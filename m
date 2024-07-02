Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8EEC3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3F8681EF2;
	Tue,  2 Jul 2024 07:56:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id plCXXNGlGvs4; Tue,  2 Jul 2024 07:56:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E642F81F75
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E642F81F75;
	Tue,  2 Jul 2024 07:56:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6ED6D1BF365
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A28D81FC3
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NOqePMuZz_SU for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:56:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 51B6681FBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51B6681FBB
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51B6681FBB
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:56:24 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ec408c6d94so39743761fa.3
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719906982; x=1720511782;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bC6LCLqTWIcwC6QzcaihqL1ddmFPP7HtLhMuY62VSv4=;
 b=lto1RIU8lgYRC2uhosLxws3ZZStfi6QfMNaFLRXuap80qjGn/GlxDvZfM1JGkQs3bn
 7yhfCSvqR6X3epq+cgZfxFqivCFhIGzW4zAMDjy11Y4NmJ9wAuAbHt+n/MVVlcOOV8se
 wy7z3TRmWRYVa+02IHgqoXHUxOqf43dvvK1N2JDOK9P8pAYMBE/PiwURcFummCIv9n/V
 +x/SK3KzJ5UEFl1w5cfi6EUfM6uHLgZ/bkOlFRxxb5Q74R1CfYdvqa8ezSNYqyL3zO62
 dMWjREeq7CZNDvCDhbQ2q6B6LhannFg/bNVkrnrpmHiMuQ6zSVy9tEyJ14BfFpff+LUJ
 8wZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD26HoPmz1NNxd+8jEYBs0LvTgxSG1zOyL7VCd1V+bCvbiwaDwtkFZ7WptYjFR2s3lOiS5enD6Okh+en6cS0H6Rs+Jf9z3HQ==
X-Gm-Message-State: AOJu0YynGe/CLON1wklnCukc5pNR3y9NMARTbtT0GUMdSNiNosN8BTvz
 nNGWqTZCMZYbUr2ePpv/97aTDp8WJfebCmeqEFX38CRzIBLoDXWhaAgZPJivrc7qHMjWpg7xii3
 p
X-Google-Smtp-Source: AGHT+IEVjHZq0lrMWDEFakUAK5VvpMMwzHS/zVNnzUzptZ4feLEaX6oa1R82w01buXzAGBgfgkIXbA==
X-Received: by 2002:a2e:a549:0:b0:2ee:4a63:e927 with SMTP id
 38308e7fff4ca-2ee5e6f2be5mr65448091fa.39.1719906981618; 
 Tue, 02 Jul 2024 00:56:21 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4257f44c730sm92570905e9.39.2024.07.02.00.56.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 00:56:21 -0700 (PDT)
Message-ID: <81fa7d85-c3d9-43cc-8a7d-4bf50fbcb94c@mind.be>
Date: Tue, 2 Jul 2024 09:56:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240702072856.2376924-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240702072856.2376924-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719906982; x=1720511782; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bC6LCLqTWIcwC6QzcaihqL1ddmFPP7HtLhMuY62VSv4=;
 b=bTVzolDR7OlGk27J1mAQdJOw6w6k8FcecS0DIhU8SqYTS9ucG43bhCrydWRYJjpNYl
 JXv/TFpCA9kq5YTd/k8sLvN1Azg4aXGrS4ijJ1UfJHkqYRpi3aAb3KBgQwznBu+SA3Ok
 6zqQKSn0fkkAmQ9ouxFvMgDia8M67ARFNFMjQwEOQtOkR8vdN2tOYR65kBh9W4CrKwwg
 hj/8Cb2J1aiGKviKBDeSmOCKl3Nuz8lh11R+9ixTiKCHnUxNRUn371f81JjyjqFhXYyv
 bwHKs2xY8+ruzyAc65lHvQ4G/e8tOQlT+b3PFPYS8ZAP8b4NOj2dnqr15+BY2R70NzRN
 ZBMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bTVzolDR
Subject: Re: [Buildroot] [PATCH 1/1] package/flite: update the patches to be
 applied with fuzz 0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Samuel Martin <s.martin49@gmail.com>, linux-amarula@amarulasolutions.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/07/2024 09:28, Dario Binacchi wrote:
> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, flite fails to build with output:
> 
>      Applying 0001-fix-alsa-static.patch using patch:
>      patching file configure.in
>      Hunk #1 FAILED at 275.
>      1 out of 1 hunk FAILED -- saving rejects to file configure.in.rej
> 
> This commit refreshes the package patch on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/flite/0001-fix-alsa-static.patch | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/flite/0001-fix-alsa-static.patch b/package/flite/0001-fix-alsa-static.patch
> index 7ed4899cc4f7..83f0a86e4d14 100644
> --- a/package/flite/0001-fix-alsa-static.patch
> +++ b/package/flite/0001-fix-alsa-static.patch
> @@ -1,12 +1,14 @@
>   Use pkg-config to determine alsa link flags. This fixes static linking.
>   
>   Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> +[Dario: make the patch to be applied with fuzz factor 0]
> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>   
>   diff -Nuar flite-1.4-release.orig/configure.in flite-1.4-release/configure.in
>   --- flite-1.4-release.orig/configure.in	2009-08-14 23:46:38.000000000 +0300
>   +++ flite-1.4-release/configure.in	2014-04-30 18:52:33.253297236 +0300
> -@@ -275,7 +275,10 @@
> -                 #endif],
> +@@ -383,7 +383,10 @@ AC_CHECK_HEADER(sys/audioio.h,
> + AC_CHECK_HEADER(alsa/asoundlib.h,
>                  [AUDIODRIVER="alsa"
>    	       AUDIODEFS=-DCST_AUDIO_ALSA
>   -               AUDIOLIBS=-lasound])
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
