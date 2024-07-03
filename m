Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB43C2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 14:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2662840071;
	Wed,  3 Jul 2024 14:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EI9xQiEPT-Oc; Wed,  3 Jul 2024 14:17:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFEB94071C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFEB94071C;
	Wed,  3 Jul 2024 14:16:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B8F851BF21A
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 14:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0C7B844A9
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 14:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rtauWy7FdP11 for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 14:16:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 822B2811EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 822B2811EF
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 822B2811EF
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 14:16:57 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ec61eeed8eso67520611fa.0
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 07:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720016214; x=1720621014;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j6qLKoSV/54Oq1qvOg3oXd3GdZetnIZbIyoX2BweckE=;
 b=Bc6exiS2PRHXCYZnsMhAbz6nm33BH3vcJiaO5REO/OpByvfKZoXEJvElsB4Rzw8Mgi
 SpbMHYgPG/eouVK+rg0UQKd++b6RLNKLWWngEnGFXRbxl03Ixnuwpjy80Hvtb9ggyddT
 AkO9nwDNuq+abggGhO5MJ4Js3hgNfLYv9a+/cWDQ8p4VhOzWWcheCaoxfvz4/J3R02aP
 bjTSQXQoaFmx94xKbDWT55ZB8nw/aDP9OrQ0uvFmClyok4TpxMBCllp4aTY2PYX3EESl
 8N9EQ+CisurcDS33r1Mu9f3TVDer6pT8QU1r6/sNGgEJMmStEl+nrff/wjBpFEgaYD8Z
 3Bmg==
X-Gm-Message-State: AOJu0YzJxGng1gUGkvh6WD0ShJlMpeMD8Cjo4Vi+iUB1jxnumoZl+TEm
 +/OTp85bKRlJP6tMc3QLUqNy0SXDTmVxzxAlu94H43m3gcZZkwtndTDZTUlQtcE+3KcAsEttZw7
 LkRuQf8xMIPhpltKbtx0qUM8Wzc+zWEaF
X-Google-Smtp-Source: AGHT+IG2c7qHNKBIlNAkAkWOiDPvpZL1EOoWyIoZPZLU4TkWVdw6hUqVIVtIHuJSiwfTg/O3HRn4kVwbs3RzBscL9HU=
X-Received: by 2002:a2e:8709:0:b0:2ee:7e62:8886 with SMTP id
 38308e7fff4ca-2ee7e628e5fmr14101371fa.4.1720016214081; Wed, 03 Jul 2024
 07:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240703140054.3224869-1-heiko.thiery@gmail.com>
In-Reply-To: <20240703140054.3224869-1-heiko.thiery@gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 3 Jul 2024 16:16:41 +0200
Message-ID: <CAEyMn7YHDstch8UFzjqr0j01_164P7b8_pzn6btTyD4cZH7efA@mail.gmail.com>
To: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>, 
 Arnout Vandecappelle <arnout@mind.be>, Peter Seiderer <ps.report@gmx.net>, 
 Lance Fredrickson <lancethepants@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720016214; x=1720621014; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=j6qLKoSV/54Oq1qvOg3oXd3GdZetnIZbIyoX2BweckE=;
 b=cuzdGy0MqJHFYWU33Dlh1ZOz61mROf72MsOO2zbOle424CweF/ijI3Ql/SZdNJM+L1
 MLOH3hSGgjarS31DHXYPjJfkVw/A2dXWSzQxu2CQspYCwmHqDkxJa6ndHY3galRQ6dPx
 GLC9X6pknO5/VTwA2fEZCbVXurQGmZSeemCQ8bbteeRP2PF3D/QHxFx8C+Hsrylho/Bm
 j9jAfCYQsNa/KWyHnPq+OhU32d1R5/bTlhc6AvK0Ebmh++7tSTtWzOIdS2gvVOQvaqYH
 2DAHQcxO1jR6FeaDxXfakhYoEFoWTCw9cb/zWYzCZbV3weeS9UkAiKDogXnSrSsKSXaZ
 O1yA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cuzdGy0M
Subject: Re: [Buildroot] [PATCH 0/3] package/ccmake: bump version
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Damn .. this is about the bump of ccache and not cmake ;-/

Am Mi., 3. Juli 2024 um 16:01 Uhr schrieb Heiko Thiery <heiko.thiery@gmail.com>:
>
> ---- 8< ----
> /tmp/ccmQFw5y.s: Assembler messages:
> /tmp/ccmQFw5y.s:89386: Error: unsupported instruction `vmovdqu'
> /tmp/ccmQFw5y.s:89400: Error: unsupported instruction `vmovdqu'
> /tmp/ccmQFw5y.s:89464: Error: unsupported instruction `vmovdqu'
> /tmp/ccmQFw5y.s:89518: Error: unsupported instruction `vmovdqu'
> /tmp/ccmQFw5y.s:89525: Error: unsupported instruction `vmovdqu'
> /tmp/ccmQFw5y.s:123938: Error: unsupported instruction `vmovdqu'
> /tmp/ccmQFw5y.s:123953: Error: unsupported instruction `vmovdqu'
> make[4]: *** [src/third_party/blake3/CMakeFiles/blake3.dir/build.make:160: src/third_party/blake3/CMakeFiles/blake3.dir/blake3_avx512.c.o] Error 1
> make[3]: *** [CMakeFiles/Makefile2:406: src/third_party/blake3/CMakeFiles/blake3.dir/all] Error 2
> ---- 8< ----
>
> To solve the problem above I started bumping the ccache package to
> 4.10.1. While doing this I observed the problem that ccache tries to
> download xxhash by its own and fails.
>
> ---- 8< ----
> -- Downloading...
>    dst='/srv/storage/hthiery/buildroot-2/output/build/host-ccache-4.10.1/_deps/xxhash-subbuild/xxhash-populate-prefix/src/v0.8.2.tar.gz'
>    timeout='none'
>    inactivity timeout='none'
> -- Using src='https://github.com/Cyan4973/xxhash/archive/refs/tags/v0.8.2.tar.gz'
> CMake Error at xxhash-subbuild/xxhash-populate-prefix/src/xxhash-populate-stamp/download-xxhash-populate.cmake:170 (message):
>   Each download failed!
>
>     error: downloading 'https://github.com/Cyan4973/xxhash/archive/refs/tags/v0.8.2.tar.gz' failed
>           status_code: 1
>           status_string: "Unsupported protocol"
>           log:
>           --- LOG BEGIN ---
>           Protocol "https" not supported or disabled in libcurl
>   Closing connection
>           --- LOG END ---
> ---- 8< ----
>
> So I added support for the host package of xxhash and added this to
> the ccache dependencies.
>
> Heiko Thiery (3):
>   package/blake3: add new host package
>   package/xxhash: add host support
>   package/ccache: bump version to 4.10.1
>
>  package/blake3/blake3.hash |  6 ++++++
>  package/blake3/blake3.mk   | 22 ++++++++++++++++++++++
>  package/ccache/ccache.hash |  2 +-
>  package/ccache/ccache.mk   | 16 ++++++++--------
>  package/pkg-generic.mk     |  2 +-
>  package/xxhash/xxhash.mk   | 18 ++++++++++++++++++
>  6 files changed, 56 insertions(+), 10 deletions(-)
>  create mode 100644 package/blake3/blake3.hash
>  create mode 100644 package/blake3/blake3.mk
>
> --
> 2.39.2
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
