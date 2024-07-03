Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C8BC30653
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 10:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 883BF41A62;
	Wed,  3 Jul 2024 10:13:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z7CXM4lH-plB; Wed,  3 Jul 2024 10:13:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DC5141A64
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DC5141A64;
	Wed,  3 Jul 2024 10:13:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D51941BF308
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 10:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CECEB6069E
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 10:13:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h2bCQq7ocXLt for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 10:13:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8EA05605A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EA05605A2
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8EA05605A2
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 10:13:26 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-79d5d14fa8bso42611685a.0
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 03:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720001605; x=1720606405;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4heKaZEuHvyzVIJt6ndzVX48wdCu+ozAMXZK9r5ayP4=;
 b=s+IFnGOXCDn1gw4x2KA/8xTUMGP1+eLaYXBNVpcfYHIGzB9Cl0hds9fBv8iJfoJv27
 G/okZ5ca18791YY8g6ncFOYXJufeAEzuVlhVaZqASyqIIfL/HwTrAz5x2yTbGkKCJmu3
 g77fD84X2+oEdnBAYDN99QKpLPrLgzGrA2aLzvkjKROem/pg83DjMYfAUN2tjFn6GFWR
 MFxn6u0AwcotU78wJYc7BwOUK4JHyTOoS2as6bcTNfDj1vMYl99779c+aOvjF7zpviNr
 Y8oakmnjZ2cLRtYSdxx94b/cT/Qd6YsKJblSiszpr4UjWIUT85qDzvCbnbEn/XFYjbgB
 Aflg==
X-Gm-Message-State: AOJu0YwPs3MLhH+zhAEiQ4hYHUMwSTCITT2XFPoEHhfRIKwd7CX2N0xk
 gALYbZ+TFTh5tP4Zx2RPL0k9SCAEYESfYEyN00gRPphkypOKyQDIPAb7bb+NdgVnU3aOZ+1mKZg
 TPC7yFH/v35FEdDZpo4xLZ8igP0I=
X-Google-Smtp-Source: AGHT+IGt0cqfP2y+4Z4PX3KcyEFtXIBIgOMQbAMwGHDbKrmO5pnV3gZ5ygdRbdkVm/gXbt0GE+UyaqTv1/yAZ0AvUVA=
X-Received: by 2002:a05:620a:4c4:b0:794:fd5f:3b8c with SMTP id
 af79cd13be357-79ee31b1488mr166244285a.39.1720001605252; Wed, 03 Jul 2024
 03:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <5e6129b8-9672-efd0-32c7-18d0defcad21@gmail.com>
In-Reply-To: <5e6129b8-9672-efd0-32c7-18d0defcad21@gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 3 Jul 2024 12:12:48 +0200
Message-ID: <CAEyMn7bdo1UPCxy5pRi-SXsTgjy_o9wYkPZ+CgYrh7CPDgUd0w@mail.gmail.com>
To: Lance Fredrickson <lancethepants@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720001605; x=1720606405; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4heKaZEuHvyzVIJt6ndzVX48wdCu+ozAMXZK9r5ayP4=;
 b=GM6fj7Ie2sCi3kTgcKfSCbTAw6z9jHHUnqTNSefsmpDWstst7uSRGIMgH/cRD0UXnf
 PICVSoLjxdDKFOBTnP8gnett7pIA7k62mHx5b1ZiDG79daNGpDtuef928D9EtCpL+4Lx
 0bc/LWPBzyf2ooSsIns36S0WXUad/0rVJB7shkm4gjXEHLSbk4tvPhM+bz8s1XmOqFfb
 a316BBvnd4PgHa3yrv3dfFGZ9mDlSNfQP2pmisCMvmY6AsppMkP9cDgFlvU5VSuZuEW/
 8jeBI69XDgnAhXKE8s3ozTxayobfaqjkb1yYsADEULipNs4V9drL6/pEUJoWckA7T8sC
 8ynA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GM6fj7Ie
Subject: Re: [Buildroot] 2023.05 host ccache detects avx512 and fails to buld
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
Cc: James Hilliard <james.hilliard1@gmail.com>, yann.morin.1998@free.fr,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Lance,


Am Fr., 9. Juni 2023 um 20:11 Uhr schrieb Lance Fredrickson
<lancethepants@gmail.com>:
>
> Migrating my project to 2023.05 I'm encountering an issue when enabling
> ccache compiler support.
>
> In the cmake build invocation I see
> -- Performing Test HAVE_C_AVX512 - Success
> and then blake3 fails to build
>
> [  9%] Building C object
> src/third_party/blake3/CMakeFiles/blake3.dir/blake3_avx512.c.o
> /tmp/ccyNm1NA.s:3844: Error: unsupported instruction `vmovdqu'
>
> I've tried both in VM (12900k using virtualbox) and on ancient corei5
> bare metal.
>
> The funny thing is I can manually compile it fine with.
> cmake \
> -Wno-dev \
> -DCMAKE_BUILD_TYPE=Release \
> -DZSTD_FROM_INTERNET=ON \
> -DREDIS_STORAGE_BACKEND=OFF \
> ./
>
> Then I try adding -DHAVE_C_AVX512=no to ccache.mk and it then succeeds.
>
> So seems like some option or combination of options is making cmake
> think avx512 is supported when it is not.


Since the problem is still present in master I suspect you did not
find a solution for this?

This is what I currently see on my machine.

 [7m>>> host-ccache 4.8.2 Configuring [27m
:
:
-- Performing Test HAVE_ASM_SSE2
-- Performing Test HAVE_ASM_SSE2 - Failed
-- Performing Test HAVE_C_SSE2
-- Performing Test HAVE_C_SSE2 - Success
-- Performing Test HAVE_ASM_SSE41
-- Performing Test HAVE_ASM_SSE41 - Failed
-- Performing Test HAVE_C_SSE41
-- Performing Test HAVE_C_SSE41 - Success
-- Performing Test HAVE_ASM_AVX2
-- Performing Test HAVE_ASM_AVX2 - Failed
-- Performing Test HAVE_C_AVX2
-- Performing Test HAVE_C_AVX2 - Success
-- Performing Test HAVE_ASM_AVX512
-- Performing Test HAVE_ASM_AVX512 - Failed
-- Performing Test HAVE_C_AVX512
-- Performing Test HAVE_C_AVX512 - Success
-- Performing Test HAVE_NEON
-- Performing Test HAVE_NEON - Failed
-- Configuring done (16.0s)
-- Generating done (0.1s)
CMake Warning:
  Manually-specified variables were not used by the project:
:
:

 [7m>>> host-ccache 4.8.2 Building [27m
:
:
[  1%] Building C object src/third_party/blake3/CMakeFiles/blake3.dir/blake3.c.o
[  2%] Generating AUTHORS.html
[  3%] Building C object
src/third_party/blake3/CMakeFiles/blake3.dir/blake3_dispatch_ccache.c.o
[  4%] Building C object
src/third_party/CMakeFiles/third_party.dir/base32hex.c.o
[  6%] Building C object
src/third_party/blake3/CMakeFiles/blake3.dir/blake3_portable.c.o
[  7%] Generating LICENSE.html
[  8%] Generating MANUAL.html
[  9%] Building CXX object
src/third_party/CMakeFiles/third_party.dir/httplib.cpp.o
[ 13%] Building C object
src/third_party/blake3/CMakeFiles/blake3.dir/blake3_sse2.c.o
[ 13%] Generating ccache.1.tmp
[ 13%] Building CXX object
src/third_party/CMakeFiles/third_party.dir/format.cpp.o
[ 14%] Building C object
src/third_party/blake3/CMakeFiles/blake3.dir/blake3_sse41.c.o
[ 16%] Generating NEWS.html
[ 17%] Building C object
src/third_party/blake3/CMakeFiles/blake3.dir/blake3_avx2.c.o
[ 18%] Building CXX object src/third_party/CMakeFiles/third_party.dir/url.cpp.o
[ 19%] Building C object src/third_party/CMakeFiles/third_party.dir/xxhash.c.o
[ 22%] Building C object
src/third_party/CMakeFiles/third_party.dir/getopt_long.c.o
[ 22%] Building C object
src/third_party/blake3/CMakeFiles/blake3.dir/blake3_avx512.c.o
[ 23%] Building C object
src/third_party/CMakeFiles/third_party.dir/xxh_x86dispatch.c.o
[ 23%] Built target doc-html
[ 24%] Generating ccache.1
[ 24%] Built target doc-man-page
[ 24%] Built target doc
/tmp/ccmQFw5y.s: Assembler messages:
/tmp/ccmQFw5y.s:89386: Error: unsupported instruction `vmovdqu'
/tmp/ccmQFw5y.s:89400: Error: unsupported instruction `vmovdqu'
/tmp/ccmQFw5y.s:89464: Error: unsupported instruction `vmovdqu'
/tmp/ccmQFw5y.s:89518: Error: unsupported instruction `vmovdqu'
/tmp/ccmQFw5y.s:89525: Error: unsupported instruction `vmovdqu'
/tmp/ccmQFw5y.s:123938: Error: unsupported instruction `vmovdqu'
/tmp/ccmQFw5y.s:123953: Error: unsupported instruction `vmovdqu'

I did a bisect and found that commit
7087e5286d8419f4625f5f6e52aa84567c6b7ed0 introduced the problem. It
was a bump from 3.7.12 to 4.7.4 and it uses the cmake infrastructure
instead of

-- 
Heiko

> Lance
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
