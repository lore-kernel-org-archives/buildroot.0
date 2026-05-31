Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCE4CD5BD1
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 07:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFA0384E45;
	Sun, 31 May 2026 07:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39FlWMapry0F; Sun, 31 May 2026 07:15:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17CEE84E48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780211714;
	bh=LMAzL1Aicya2qsE1WvIJ7fSXsetc4/eT80S6JWvVKHU=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=qX8ofAK9aWjcM9MxFigS8skIqBu742sy02z6luS3IGbifkmUxtyVWCZSOAjbqXVrC
	 9Hwg+O9/KF3aH6A4kO5i7diCTibWOyiBFlqYYykzhWOgvgk0rhzE7pclQuX/CIK8cc
	 hNX/mVR3+J5/UasuSGSGVlyV8bqYWD1MCsgYfK5QbdQ5w/2E8ryEumJ3yjIc9Ge+Zp
	 JoQBianUbmvv3Ib/W0dkrijcavkhvHsmgMCxcDW7fCB8wdZgYLpvhb3G4yvpoDT2V2
	 JrZy1G8oZ+GLeVUAUeFF6oFMmhhAjQFs5f1xUwQSLnUfT/aiqNHa/iLE4Gh0t+2a4s
	 BYQm5vHXFuikg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17CEE84E48;
	Sun, 31 May 2026 07:15:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44B27389
 for <buildroot@buildroot.org>; Sun, 31 May 2026 07:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F28A84E45
 for <buildroot@buildroot.org>; Sun, 31 May 2026 07:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a7AefG0B7xk0 for <buildroot@buildroot.org>;
 Sun, 31 May 2026 07:15:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 50C0F84E44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50C0F84E44
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50C0F84E44
 for <buildroot@buildroot.org>; Sun, 31 May 2026 07:15:11 +0000 (UTC)
Received: from [192.168.1.80] (82-65-127-30.subs.proxad.net [82.65.127.30])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 1EE5A2C846B2
 for <buildroot@buildroot.org>; Sun, 31 May 2026 09:15:09 +0200 (CEST)
Message-ID: <7de37875-9a2f-4931-88da-a492364f6223@bubu1.eu>
Date: Sun, 31 May 2026 09:15:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20260531071309.480A68734A@busybox.osuosl.org>
Content-Language: en-US
In-Reply-To: <20260531071309.480A68734A@busybox.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1780211709; bh=pVUKm1Fy0MnVabTSbjW0Lnt4LX2YRR2g1SmUsiOEqnE=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=h0EOTBAlBRe4jApp5YOtuBGZpIKXDxNVAakFb0PqzCXaJDVIpIaqKtMDmGpMLomwm
 8qeCiQJY64qEpq029pyYRDPbhS4BeIC48HE4q5/Rcgj2qQhGaRnq1MDAmkq4ZHoFpn
 N5bhaVV6q54LpzjjoH9KBZyGMDB1Zy3Cet/FwNQ5WY3I+PwvS+er0TaPun8fp+Etl3
 nWNIb/HNmLe7TmMAkrQRuKgMKMf+7//aw5i+Y5GVcBkncgjR8GPYq/pmxeEomfhH8j
 yna74Aawck34EL5tW1DEYFSAzx+7TmtFuO4xCVpF+r0Icz8+SXRiXcGBjVmtsJ5ob4
 xqPihFsBO5MYw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=h0EOTBAl
Subject: Re: [Buildroot] [git commit] package/samba4: fix build on uclibc
 with GCC 14+
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 5/31/26 09:13, Marcus Hoffmann via buildroot wrote:
> commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e136494e918090296284214ca06736e2dafb83fe
> branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master
> 
> iconv types are defined differently in glibc (as pointers) and uclibc
> (as integers). With changes in GCC14, -Wint-conversion has now become
> an error, which shed some light on the issue.
> 
> The actual fix for that problem is released in uclibc 1.0.58 [1].
> However, because these type definitions are in toolchain headers,
> this means that the toolchain used to build samba must also include
> uclibc>=1.0.58 (either an external toolchain that includes the uclibc fix,
> or a Buildroot toolchain after the uclibc fix is merged in Buildroot [2]).
> 
> Until then, provide a workaround for samba itself.
> 
> No autobuilder failure on this (yet). It can be reproduced with
>      > ./utils/test-pkg -p samba4 -T bootlin-armv5-uclibc
> 
> [1] https://github.com/wbx-github/uclibc-ng/commit/328e14e55f35ee333e5a19c5717cb4bbf426c3f1
> [2] https://lore.kernel.org/buildroot/ahPrm_0gVDGw5B5-@waldemar-brodkorb.de/
> 
> Assisted-by: Claude:claude-opus-4.8
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>   ...arset-iconv-fix-build-when-iconv_t-is-not.patch | 98 ++++++++++++++++++++++
>   1 file changed, 98 insertions(+)
> 
> diff --git a/package/samba4/0002-lib-util-charset-iconv-fix-build-when-iconv_t-is-not.patch b/package/samba4/0002-lib-util-charset-iconv-fix-build-when-iconv_t-is-not.patch
> new file mode 100644
> index 0000000000..b270deaf98
> --- /dev/null
> +++ b/package/samba4/0002-lib-util-charset-iconv-fix-build-when-iconv_t-is-not.patch
> @@ -0,0 +1,98 @@
> +From aab0668cc358e443b243528939947c3eea93ca27 Mon Sep 17 00:00:00 2001
> +From: Titouan Christophe <titouan.christophe@mind.be>
> +Date: Sat, 30 May 2026 00:30:00 +0200
> +Subject: [PATCH] charset: fix iconv_t int/pointer conversion on uClibc
> +
> +The iconv handles cd_pull, cd_push and cd_direct are stored as 'void *'
> +in struct smb_iconv_s, but iconv_open() returns and iconv()/iconv_close()
> +take an iconv_t. On glibc this is harmless because iconv_t is itself a
> +'void *', so the implicit conversions are between identical types.
> +
> +On uClibc however iconv_t is a 'long int', so storing iconv_open()'s
> +result into a 'void *' field (and passing those fields back to iconv()
> +and iconv_close()) is an implicit integer<->pointer conversion. Since
> +GCC 14 -Wint-conversion is an error by default, this breaks the build:
> +
> +  iconv.c: In function 'sys_iconv':
> +  iconv.c:166:38: error: passing argument 1 of 'iconv' makes integer
> +    from pointer without a cast [-Wint-conversion]
> +  iconv.c: In function 'smb_iconv_open_ex':
> +  iconv.c:403:30: error: assignment to 'void *' from 'iconv_t'
> +    {aka 'long int'} makes pointer from integer without a cast
> +    [-Wint-conversion]
> +
> +Add explicit casts between iconv_t and void * so the conversions are
> +intentional and the code builds on both glibc and uClibc.
> +
> +Upstream: not applicable to samba, because uclibc has already released
> +          a fix, but this isn't included yet in Buildroot prebuilt toolchains.
> +          The problem is therefore to be patched in Buildroot itself.
> +
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
Applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
