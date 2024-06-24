Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8C4C2D0D1
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 13:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A792281145;
	Mon, 24 Jun 2024 13:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zbJo6UOVdYxB; Mon, 24 Jun 2024 13:52:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 699E2817A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 699E2817A3;
	Mon, 24 Jun 2024 13:52:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 542871BF479
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 13:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2795C817A3
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 13:52:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xX6j6ffsmW27 for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 13:52:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B8E528169F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8E528169F
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8E528169F
 for <buildroot@busybox.net>; Mon, 24 Jun 2024 13:52:38 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4217990f997so32517555e9.2
 for <buildroot@busybox.net>; Mon, 24 Jun 2024 06:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719237156; x=1719841956;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GiQSKus+7A7SG8gsXk17a2ZMw3y403aiKyNSehJ1H6w=;
 b=GaUZljNlQW349L6pwxBHngWwz7y8vbS2bB+pGyfERedYzUK5gIA0Zpgo2PAiCJsqdY
 gdV+/qff3yjXMWEIE78TqVksaueL4I3PeetxzN5WfRfmJkHQzlX6q/jHPFhRfct8mSVF
 eriQtm439hncx5p8GL+MqOQB2nIg6iB7U/Wx9kJ83bUsdEd7eFDHZx9YfVzb+UDi4BXt
 6HOtO9KRs21WnleVLZjR0ZZWkJVvlBDY+aYELj+ZhptY+kNYv/ii0PJ2XzLpe8KPpDPT
 vJEX7uB3OGJHyMbVQfmMrvI77RFyKSGDy3VPb4Fu3v3u0Yf1nOZW4dDwxmoMnSDGwwfd
 asew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaWf3jq7XGCEuADdDtJN2dIDcAgo9NQu3IwAKG7X+7NW02yp4Mk+qvQMHXpdGTkhobXW7ejNarqdRrUDRUe2XjuYcNnGE=
X-Gm-Message-State: AOJu0YxdG/qeiv2WyE1RPuuOftDxYrPOCTacPMLPksCC5BcAXTe1K0pH
 kuH8B9mbkKi1a1Op40pp3wq/aoMWhZkk524LtkcPfKRtmQ7EeDOE8ZoAIsuncU0L/7dE7E34UhO
 +
X-Google-Smtp-Source: AGHT+IFs8tALCcJ904uCj9E5t/6DMPGhWi63t1gGI1OKQC6RUiaQMkWaBfGcPguG0NOPCXMYjv+O6g==
X-Received: by 2002:adf:f011:0:b0:362:a575:52f3 with SMTP id
 ffacd0b85a97d-366e4f0cd5dmr3786752f8f.60.1719237156333; 
 Mon, 24 Jun 2024 06:52:36 -0700 (PDT)
Received: from [10.1.0.155] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366388c41b0sm10089098f8f.44.2024.06.24.06.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 06:52:35 -0700 (PDT)
Message-ID: <799082ae-dc88-498b-8c5f-41d9b766383e@mind.be>
Date: Mon, 24 Jun 2024 15:52:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Seiderer <ps.report@gmx.net>, buildroot@busybox.net
References: <20240612135727.11811-1-ps.report@gmx.net>
 <20240612135727.11811-5-ps.report@gmx.net>
Content-Language: en-GB
In-Reply-To: <20240612135727.11811-5-ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719237156; x=1719841956; darn=busybox.net;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GiQSKus+7A7SG8gsXk17a2ZMw3y403aiKyNSehJ1H6w=;
 b=XPCOzj63xA0QX1WDz7znItrLBEgLHenNhZpvdKspnZ5Y3LDcbvP77y2vVLTo7lFoii
 kg3P1LXLnPb6KDGF+ndg55croIe5c6egJkR2BtxF0A/2RXzxK6Js30JR6NWdL3emV9qO
 45M9dz5TH5o2f5LXtUdAKoHkPWFyHI7Xi6nN1dh1leN2uITvxJVZsd1geXFW32lEglqG
 EOG0Bv4k5/2AeTKFzIvWoook/+7ukNe4JtEseDOMb807GLoeKS/KHQxo4PqHIXFTjOgk
 Z/2BsN29+I0pY7wxDKoQkc0bkwJwcj+r59KWYjvL4Xa0cZ0s2r4aPe1uYVw7yZ7g2a3N
 SQDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XPCOzj63
Subject: Re: [Buildroot] [PATCH v2 5/5] package/xz: convert to cmake build
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/06/2024 15:57, Peter Seiderer via buildroot wrote:
> Convert to cmake build with the following autoconf options without
> direct equivalent cmake option:
> 
> - '--disable-external-sha256'
> 
> - '--enable-assembler'
> 
> - '--enable-assume-ram=128': hard coded in the CMakeLists.txt file
>    1732     target_compile_definitions(xz PRIVATE ASSUME_RAM=128)
> 
> - '--enable-scripts' (see [1]: 'CMake: xzdiff, xzgrep, xzless, xzmore, and
>    their symlinks are now installed')
> 
> - '--enable-symbol-versions': hard coded in the CMakeLists.txt file
>    1297     target_compile_definitions(liblzma PRIVATE HAVE_SYMBOL_VERSIONS_LINUX=1)
> 
> - '--enable-rpath'
> 
> - '--enable-largefile': see CMakeLists.txt
>    245 # Check for large file support. It's required on some 32-bit platforms and
>    246 # even on 64-bit MinGW-w64 to get 64-bit off_t. This can be forced off on
>    247 # the CMake command line if needed: -DLARGE_FILE_SUPPORT=OFF
>    248 tuklib_large_file_support(ALL)
> 
> - '--enable-unaligned-access=auto': see CMakeLists.txt and cmake/tuklib_integer.cmake
>     250 # This is needed by liblzma and xz.
>     251 tuklib_integer(ALL)
> 
> - '--disable-unsafe-type-punning' see CMakeLists.txt and cmake/tuklib_integer.cmake
>     250 # This is needed by liblzma and xz.
>     251 tuklib_integer(ALL)
> 
> - '--disable-werror'
> 
> - '--enable-year2038'

  I've extended these explanations to cover _all_ the configure options. Here is 
the full commit message:

     Use direct equivalents where available. The following autoconf options
     don't have a direct equivalent in CMakeLists.txt.

     - '--enable-checks=crc32': CRC32 is always enabled; the equivalent CMake
       option is therefore calles ADDITIONAL_CHECK_TYPES.

     - '--disable-external-sha256': external sha256 is not supported with
       CMake.

     - '--enable-assembler': No direct equivalent, though there is an option
       ENABLE_X86_ASM which must be enabled explicitly (no auto-detection).
       Since this only works on x86 and we're not sure if it works on all x86
       variants, leave it disabled.

     - '--enable-assume-ram=128': hard coded in the CMakeLists.txt file
       1732     target_compile_definitions(xz PRIVATE ASSUME_RAM=128)

     - '--enable-xz', '--enable-xzdec', '--enable-lzmadec',
       '--enable-lzmainfo', --enable-lzma-links': The decoder programs are
       always enabled if they're enabled in the library. The symlinks are
       controlled by two separate options: CREATE_XZ_SYMLINKS and
       CREATE_LZMA_SYMLINKS.

     - '--enable-scripts' (see [1]: 'CMake: xzdiff, xzgrep, xzless, xzmore, and
       their symlinks are now installed')

     - '--enable-symbol-versions': hard coded in the CMakeLists.txt file
       1297     target_compile_definitions(liblzma PRIVATE 
HAVE_SYMBOL_VERSIONS_LINUX=1)

     - '--enable-rpath': There is no CMake equivalent for this.

     - '--enable-largefile': see CMakeLists.txt
       245 # Check for large file support. It's required on some 32-bit 
platforms and
       246 # even on 64-bit MinGW-w64 to get 64-bit off_t. This can be forced off on
       247 # the CMake command line if needed: -DLARGE_FILE_SUPPORT=OFF
       248 tuklib_large_file_support(ALL)

     - '--enable-unaligned-access=auto': see CMakeLists.txt and 
cmake/tuklib_integer.cmake
        250 # This is needed by liblzma and xz.
        251 tuklib_integer(ALL)

     - '--disable-unsafe-type-punning' see CMakeLists.txt and 
cmake/tuklib_integer.cmake
        250 # This is needed by liblzma and xz.
        251 tuklib_integer(ALL)

     - '--disable-werror': There is no option to _enable_ -Werror in
       CMakeLists.txt.

     - '--enable-year2038': There is no option to enable Y2038 support in
       CMakeLists.txt, but we anyway do that globally.


> [1] https://github.com/tukaani-project/xz/releases/tag/v5.6.0
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - remove '-DUSE_ATTR_IFUNC=ON' (upstream removed)
>   - adjust CMakeLists.txt reference line numbers
> ---
>   package/xz/xz.mk | 57 +++++++++++++++++++-----------------------------
>   1 file changed, 22 insertions(+), 35 deletions(-)
> 
> diff --git a/package/xz/xz.mk b/package/xz/xz.mk
> index d81d0cf4ce..6f8a564887 100644
> --- a/package/xz/xz.mk
> +++ b/package/xz/xz.mk
> @@ -8,54 +8,41 @@ XZ_VERSION = 5.6.2
>   XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
>   XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
>   XZ_INSTALL_STAGING = YES
> -XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
>   XZ_LICENSE = Public Domain, BSD-0-Clause, GPL-2.0+, GPL-3.0+, LGPL-2.1+
>   XZ_LICENSE_FILES = COPYING COPYING.0BSD COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
>   XZ_CPE_ID_VENDOR = tukaani
>   
>   XZ_CONF_OPTS = \
> -	--enable-encoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
> -	--enable-decoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
> -	--enable-match-finders=hc3,hc4,bt2,bt3,bt4 \
> -	--enable-checks=crc32,crc64,sha256 \
> -	--disable-external-sha256 \
> -	--enable-microlzma \
> -	--enable-lzip-decoder \
> -	--enable-assembler \
> -	--enable-clmul-crc \
> -	--enable-arm64-crc32 \
> -	--disable-small \
> -	--enable-assume-ram=128 \
> -	--enable-xz \
> -	--enable-xzdec \
> -	--enable-lzmadec \
> -	--enable-lzmainfo \
> -	--enable-lzma-links \
> -	--enable-scripts \
> -	--enable-sandbox=auto \
> -	--enable-symbol-versions \
> -	--enable-rpath \
> -	--enable-largfile \
> -	--enable-unaligned-access=auto \
> -	--disable-unsafe-type-punning \
> -	--disable-werror \
> -	--enable-year2038
> +	-DENCODERS="lzma1;lzma2;delta;x86;powerpc;ia64;arm;armthumb;arm64;sparc;riscv" \
> +	-DDECODERS="lzma1;lzma2;delta;x86;powerpc;ia64;arm;armthumb;arm64;sparc;riscv" \
> +	-DMATCH_FINDERS="hc3;hc4;bt2;bt3;bt4" \
> +	-DADDITIONAL_CHECK_TYPES="crc64;sha256" \
> +	-DMICROLZMA_ENCODER=ON \
> +	-DMICROLZMA_DECODER=ON \
> +	-DLZIP_DECODER=ON \
> +	-DALLOW_CLMUL_CRC=ON \
> +	-DALLOW_ARM64_CRC32=ON \
> +	-DENABLE_SMALL=OFF \
> +	-DENABLE_SANDBOX=ON \
> +	-DCREATE_XZ_SYMLINKS=ON \
> +	-DCREATE_LZMA_SYMLINKS=ON \
> +	-DBUILD_SHARED_LIBS=OFF
>   
>   HOST_XZ_CONF_OPTS = \
>   	$(XZ_CONF_OPTS) \
> -	--enable-nls \
> -	--enable-threads
> +	-DENABLE_NLS=ON \
> +	-DENABLE_THREADS=ON
>   
>   ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
> -XZ_CONF_OPTS += --enable-nls
> +XZ_CONF_OPTS += -DENABLE_NLS=ON
>   else
> -Z_CONF_OPTS += --disable-nls
> +XZ_CONF_OPTS += -DENABLE_NLS=OFF
>   endif
>   
>   ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> -XZ_CONF_OPTS += --enable-threads
> +XZ_CONF_OPTS += -DENABLE_THREADS=ON
>   else
> -XZ_CONF_OPTS += --disable-threads
> +XZ_CONF_OPTS += -DENABLE_THREADS=OFF
>   endif
>   
>   # we are built before ccache
> @@ -63,5 +50,5 @@ HOST_XZ_CONF_ENV = \
>   	CC="$(HOSTCC_NOCCACHE)" \
>   	CXX="$(HOSTCXX_NOCCACHE)"

  This part no longer works with CMake. Instead, it should be done by overriding 
CMAKE_C_COMPILER_LAUNCHER. I did that and added the following to the commit message:

     host-xz is itself a dependency of host-ccache, so we can't use ccache
     for building host-xz. For autotools, this was handled by setting CC and
     CXX in the environment for the configure script. This doesn't work for
     CMake, however. Instead, we must override the CMAKE_C_COMPILER_LAUNCHER
     option. Xz doesn't use C++, but for completeness also override
     CMAKE_CXX_COMPILER_LAUNCHER.



  Applied to master, thanks.

  Regards,
  Arnout

>   
> -$(eval $(autotools-package))
> -$(eval $(host-autotools-package))
> +$(eval $(cmake-package))
> +$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
