Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31275CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 17:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D10B2853C7;
	Sat, 30 May 2026 17:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EC6cB4Jk8De2; Sat, 30 May 2026 17:21:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9BA5853C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780161685;
	bh=z5gW6PD6Hrdd5q1t0BEkjzXQVIdBI2ha+K97fb0VqF4=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Evy7wD3CuW5gnBEa1FjiZfpa1xETiB1cF0zEnApnN68eoLN7qOCg/dr0R8JOEuT2A
	 nXu+8e/OyAuxix4l8s4Y8e3cle37vwHf6fFcuZjOmxzbx30wifmmhvxKkcLIV7sxEy
	 F9+JKQszNTPK55zaYFZ+N4m7mu3gQ3JzPnPnty6eoCHpAMu2iqeIA4Hharw3SxrKSo
	 p8VxXILiz3aRljpZqd5UDjbs10PMcp412fm7FdD3oKR6JUbiEW3ilgccNCYKfdHL8i
	 cIOfYPHBL7OnTES3K2fsIt0H1ewoxWOoDKJLhJA2lffoZHjsZxL0ea/QwhuS+8OAMq
	 u2+tI6r4nDDtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9BA5853C9;
	Sat, 30 May 2026 17:21:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15CBAF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF2BA853C9
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HSDiBFu3CvK8 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 17:21:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 04D52853C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04D52853C7
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04D52853C7
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:21:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ADBA8B97C654; Sat, 30 May 2026 19:21:21 +0200 (CEST)
Message-ID: <8c75b10a-5e8d-4985-a58b-2fae1b10b5a3@rnout.be>
Date: Sat, 30 May 2026 19:21:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260530121047.637834-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260530121047.637834-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780161681; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Z/8wOz7VrunphxSrKM161A6mQgqNk3NzaCMqlnu1DG8=;
 b=HG/rJhi0D4PAJl5wKkE3lS/eeC7jRAFztX5NTEZBSFi5v9MvE/Qtqy8HNJJynuWoLaM8NQ
 vc+RESQ+oz24RLyLzRVfF4HALnxbqiwhtWwco5sIMP+WRhixqop+vlfQHX0ee7OSW62Mij
 uboebIuSIJFIvdwKWRAyW5ghV8hryRKv5uO33WP+7h10cK9P4IeiQzxIC7i3NjpVN1Z9Ue
 +ATaDNaDrUzMDVWI+S6NssAc+IL1TqmAmKoEa/WVgF1/FWZ89mpKBXINlwL2aRckA2r/FW
 Raa3qABDGQVZamTKWUz7iwmRVJHp15XNGZx0UhENZUVh+PsJ+qrvARZCvkfZew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=HG/rJhi0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/xerces: fix build with
 recent versions of ICU
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/05/2026 14:10, Bernd Kuhls wrote:
> Since Buildroot commit dcee99507c6767230fd1faeeefe95f5662eb03a3 that
> bumped package/icu to version 77-1, the build of xerces with ICU
> support enabled fails:
> 
> In file included from /home/bernd/buildroot/output/host/i586-buildroot-linux-gnu/sysroot/usr/include/unicode/uset.h:38,
>                   from /home/bernd/buildroot/output/build/xerces-3.3.0/src/xercesc/util/regx/RangeToken.cpp:40:
> /home/bernd/buildroot/output/host/i586-buildroot-linux-gnu/sysroot/usr/include/unicode/char16ptr.h:271:55:
>   error: 'is_same_v' is not a member of 'std'; did you mean 'is_same'?
> 
> Indeed, ICU now requires C++17. Instead of using a patch from Gentoo[1]
> we use a backported upstream commit, limited to CMakeLists.txt, to raise
> the c++ version.
> 
> The build error was not recorded yet by the autobuilders but can be
> reproduced with this defconfig:
> 
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_XERCES=y
> BR2_PACKAGE_ICU=y
> 
> [1] https://bugs.gentoo.org/931105
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.
  Regards,
  Arnout

> ---
> v2: Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/986777fa7aba97eca6c0be1b669efdefaf7ea7de
> 
>   ...-C++17-C++14-or-C++11-when-available.patch | 32 +++++++++++++++++++
>   1 file changed, 32 insertions(+)
>   create mode 100644 package/xerces/0001-XERCESC-2141-Enable-C++17-C++14-or-C++11-when-available.patch
> 
> diff --git a/package/xerces/0001-XERCESC-2141-Enable-C++17-C++14-or-C++11-when-available.patch b/package/xerces/0001-XERCESC-2141-Enable-C++17-C++14-or-C++11-when-available.patch
> new file mode 100644
> index 0000000000..24f7aef6ef
> --- /dev/null
> +++ b/package/xerces/0001-XERCESC-2141-Enable-C++17-C++14-or-C++11-when-available.patch
> @@ -0,0 +1,32 @@
> +From 6883e346fa88f48022edf84328a09a4653b8c2fe Mon Sep 17 00:00:00 2001
> +From: Roger Leigh <rleigh@codelibre.net>
> +Date: Sat, 10 Mar 2018 21:27:27 +0000
> +Subject: [PATCH] XERCESC-2141: Enable C++17, C++14 or C++11 when available
> +
> +Upstream: https://github.com/apache/xerces-c/commit/6883e346fa88f48022edf84328a09a4653b8c2fe
> +
> +[Bernd: rebased for version 3.3.0, limited to CMakeLists.txt]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + CMakeLists.txt              |   4 +-
> + configure.ac                |   9 +
> + m4/ax_cxx_compile_stdcxx.m4 | 982 ++++++++++++++++++++++++++++++++++++
> + 3 files changed, 993 insertions(+), 2 deletions(-)
> + create mode 100644 m4/ax_cxx_compile_stdcxx.m4
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 4254f89bb..f5cdb55cc 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -32,9 +32,9 @@ if (POLICY CMP0067)
> +
> + cmake_minimum_required(VERSION 3.12.0)
> +
> +-# Try C++14, then fall back to C++11 and C++98.  Used for feature tests
> ++# Try C++17, then fall back to C++14, C++11 then C++98.  Used for feature tests
> + # for optional features.
> +-set(CMAKE_CXX_STANDARD 14)
> ++set(CMAKE_CXX_STANDARD 17)
> +
> + # Use folders (for IDE project grouping)
> + set_property(GLOBAL PROPERTY USE_FOLDERS ON)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
