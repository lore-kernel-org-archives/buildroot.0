Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC92C433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 20:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A42F0401E1;
	Wed, 26 Oct 2022 20:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A42F0401E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YPyqwbUsdqGf; Wed, 26 Oct 2022 20:59:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15C13401F5;
	Wed, 26 Oct 2022 20:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15C13401F5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 474AC1BF23C
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 20:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22A878131F
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 20:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22A878131F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ed_Tpn7vUXF for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 20:59:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 630FC812DE
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 630FC812DE
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 20:59:17 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id o12so31364807lfq.9
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 13:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d3e/xSYl19sidoGtiGQAggcEZa1LNpDb8e7Kzcjzt/Q=;
 b=ZBgObJBkY6VQSkZOB2cHmVPcIvY+j69LBfml7s5GGQDbQJvJxqJ4UQxJQ6REL8GQMA
 dsZYwiyoA0tA/Rq452ipf1x0T8dRq0rMSiFsc66Men5IXIg66H+gtgfD7vLwjw1RfOUf
 j8yqLJXNcQuDr6WkA5TQooVv2C0/aMg0O+9eMA5azxOKoSSz5eCHz3YukrMJq57uw81y
 rsOlgZWtgATZOETiHCa4hCgZgAioi5mEQg9UicduzJ/SSXAKBRw3QYA5bkwCJxidNz+7
 8cHOee73Z2Q33+7ECcnQZFDaSA0wZLFXNb0Bg9uC7o6lzaAZzvVSbYN3KiSDyX5Hja0v
 dgMQ==
X-Gm-Message-State: ACrzQf3gKaDSvTV2hgo2pss/s6RWJdZzLCb2+1rAWQZUC3/vYaSTOddJ
 vwCtL6iCMtup/898HJPgLnNMkKmBlpDCnA==
X-Google-Smtp-Source: AMsMyM711txOPEyabcWX03MgHtPSEZSZLm5tUmxYBs6DiM4nhRtQ1lcxXGsUkr3kTomnxFn78a2Xhw==
X-Received: by 2002:a05:6512:3b8a:b0:4a4:798c:7c6e with SMTP id
 g10-20020a0565123b8a00b004a4798c7c6emr16467947lfv.223.1666817954741; 
 Wed, 26 Oct 2022 13:59:14 -0700 (PDT)
Received: from wkz-x13 (h-98-128-229-186.NA.cust.bahnhof.se. [98.128.229.186])
 by smtp.gmail.com with ESMTPSA id
 w23-20020a197b17000000b00497a61453a9sm959672lfc.243.2022.10.26.13.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:59:14 -0700 (PDT)
From: Tobias Waldekranz <tobias@waldekranz.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20221026220009.12ec01ee@windsurf>
References: <20221020141412.346992-1-tobias@waldekranz.com>
 <20221020141412.346992-2-tobias@waldekranz.com>
 <20221026220009.12ec01ee@windsurf>
Date: Wed, 26 Oct 2022 22:59:13 +0200
Message-ID: <878rl29u8u.fsf@waldekranz.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=waldekranz-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d3e/xSYl19sidoGtiGQAggcEZa1LNpDb8e7Kzcjzt/Q=;
 b=BFVo7qmO0KCPK3h0/tpUGYfT0A71JbIoMEnqF62wrcmYw6n5TF2QK4GLrQF8oECNBx
 E5xlwJAgaE0GZn+xcagYtV9IhVkVjCFJr+sDfOEMIcNCkWephH4P5s487ICg+L8bVU2/
 Vft9rzjDWVoZ7jgPXHAHvld6E3VxO6GskFOr4fb2CFI7kEQmnd9wqTpcdVposZQJu/M3
 6hYoRxpKTAfO203CyNhgPcQ97iDb/sYAcX1a9PTdb9f2anmlr/nwACjwchr+45LYTsZ3
 4bkB6qDWS6MozZaghGrMpSkqcUl2UqWtnC1z39v3zloguiXQQz6+91UM8l9n606Zo8kp
 j+OA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=waldekranz-com.20210112.gappssmtp.com
 header.i=@waldekranz-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=BFVo7qmO
Subject: Re: [Buildroot] [PATCH 1/4] package/libbpf: fix cross compilation
 for 32-bit targets
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On ons, okt 26, 2022 at 22:00, Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:
> Hello Tobias,
>
> Thanks for this patch!

Thank you for reviewing!

> On Thu, 20 Oct 2022 16:14:09 +0200
> Tobias Waldekranz <tobias@waldekranz.com> wrote:
>
>> Add upstream patch that sources the library path (lib vs. lib64) from
>> the compiler rather than from uname(1).
>
> Could you copy/paste the details of the build failure that was
> occurring, and provide details on the context it was occurring?
>
> Indeed, when looking at the results of our autobuilders in terms of
> failures when building libbpf, I don't see anything relevant:
>
>   http://autobuild.buildroot.net/?reason=libbpf%
>
> In recent months, we only had build failures on the S390x architecture,
> that don't seem related to this.

Sorry, I should have explained the issue better:

Building libbpf "works" without this patch, so I'm not surprised that
there are no autobuild errors. It is just that shared objects and
pkg-config files are always (assuming a 64-bit build system) installed
to /lib64 in target & staging.

If you then try to build something that _depends_ on libbpf, pkg-config
won't be able to find it since /lib64 is not in its path. Hence why I
stumbled upon this - kmemd was the first package to depend on libbpf.

Here's a log when building kmemd for 32-bit PowerPC without this patch:

~/src/buildroot/x-ppc$ make kmemd
>>> kmemd 1.0.0 Configuring
(cd /home/wkz/src/buildroot/x-ppc/build/kmemd-1.0.0/ && rm -rf config.cache && PATH="/home/wkz/src/buildroot/x-ppc/host/bin:/home/wkz/src/buildroot/x-ppc/host/sbin:/home/wkz/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin" AR="/home/wkz/src/buildroot/x-ppc/host/bin/powerpc-linux-gcc-ar" AS="/home/wkz/src/buildroot/x-ppc/host/bin/powerpc-linux-as" LD="/home/wkz/src/buildroot/x-ppc/host/bin/powerpc-linux-ld" NM="/home/wkz/src/buildroot/x-ppc/host/bin/powerpc-linux-gcc-nm" CC="/home/wkz/src/buildroot/x-ppc/host/bin/powerpc-linux-gcc" GCC="/home/wkz/src/buildroot/x-ppc/host/bin/powerpc-linux-gcc" CPP="/home/wkz/src/buildroot/x-ppc/host/bin/powerpc-linux-cpp" CXX="/home/wkz/src/buildroot/x-ppc/host/bin/powerpc-linux-g++" FC="/home/wkz/src/buildroot/x-ppc/host/bin/powerpc-linux-gfortran" F77="/home/wkz/src/buildroot/x-ppc/host/bin/powerpc-linux-gfortran" RANLIB="/home/wkz/src/buildroot/x-ppc/host/bin/powerpc-linux-gcc-ranlib" READELF="
 /home/wkz/src/buildroot/x-ppc/host/bin/powerpc-linux-readelf" STRIP="/home/wkz/src/buildroot/x-ppc/host/bin/powerpc-linux-strip" OBJCOPY="/home/wkz/src/buildroot/x-ppc/host/bin/powerpc-linux-objcopy" OBJDUMP="/home/wkz/src/buildroot/x-ppc/host/bin/powerpc-linux-objdump" AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as" CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc" CXX_FOR_BUILD="/usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld" CPPFLAGS_FOR_BUILD="-I/home/wkz/src/buildroot/x-ppc/host/include" CFLAGS_FOR_BUILD="-O2 -I/home/wkz/src/buildroot/x-ppc/host/include" CXXFLAGS_FOR_BUILD="-O2 -I/home/wkz/src/buildroot/x-ppc/host/include" LDFLAGS_FOR_BUILD="-L/home/wkz/src/buildroot/x-ppc/host/lib -Wl,-rpath,/home/wkz/src/buildroot/x-ppc/host/lib" FCFLAGS_FOR_BUILD="" DEFAULT_ASSEMBLER="/home/wkz/src/buildroot/x-ppc/host/bin/powerpc-linux-as" DEFAULT_LINKER="/home/wkz/src/buildroot/x-ppc/host/bin/powerpc-linux-ld" CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 " CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1" CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1" LDFLAGS="" FCFLAGS=" -Os -g0" FFLAGS=" -Os -g0" PKG_CONFIG="/home/wkz/src/buildroot/x-ppc/host/bin/pkg-config" STAGING_DIR="/home/wkz/src/buildroot/x-ppc/host/powerpc-buildroot-linux-gnu/sysroot" INTLTOOL_PERL=/usr/bin/perl ac_cv_lbl_unaligned_fail=no ac_cv_func_mmap_fixed_mapped=yes ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes lt_cv_sys_lib_search_path_spec="" ac_cv_c_bigendian=yes   CONFIG_SITE=/dev/null ./configure --target=powerpc-buildroot-linux-gnu --host=powerpc-buildroot-linux-gnu --build=x86_64-pc-linux-gnu --prefix=/usr --exec-prefix=/usr --sysconfdir=/etc --localstatedir=/var --program-prefix="" --disable-gtk-doc --disable-gtk-
 doc-html --disable-doc --disable-docs --disable-documentation --with-xmlto=no --with-fop=no --disable-dependency-tracking --enable-ipv6 --disable-nls --disable-static --enable-shared   )
configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --disable-nls, --disable-static, --enable-shared
checking for powerpc-buildroot-linux-gnu-gcc... /home/wkz/src/buildroot/x-ppc/host/bin/powerpc-linux-gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... yes
checking for suffix of object files... o
checking whether the compiler supports GNU C... yes
checking whether /home/wkz/src/buildroot/x-ppc/host/bin/powerpc-linux-gcc accepts -g... yes
checking for /home/wkz/src/buildroot/x-ppc/host/bin/powerpc-linux-gcc option to enable C11 features... none needed
checking whether /home/wkz/src/buildroot/x-ppc/host/bin/powerpc-linux-gcc understands -c and -o together... yes
checking for stdio.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for strings.h... yes
checking for sys/stat.h... yes
checking for sys/types.h... yes
checking for unistd.h... yes
checking for wchar.h... yes
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... yes
checking whether _XOPEN_SOURCE should be defined... no
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for powerpc-buildroot-linux-gnu-strip... /home/wkz/src/buildroot/x-ppc/host/bin/powerpc-linux-strip
checking for a race-free mkdir -p... /usr/bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether make supports the include directive... yes (GNU style)
checking whether make supports nested variables... yes
checking dependency style of /home/wkz/src/buildroot/x-ppc/host/bin/powerpc-linux-gcc... none
checking whether make supports nested variables... (cached) yes
checking for powerpc-buildroot-linux-gnu-gcc... (cached) /home/wkz/src/buildroot/x-ppc/host/bin/powerpc-linux-gcc
checking whether the compiler supports GNU C... (cached) yes
checking whether /home/wkz/src/buildroot/x-ppc/host/bin/powerpc-linux-gcc accepts -g... (cached) yes
checking for /home/wkz/src/buildroot/x-ppc/host/bin/powerpc-linux-gcc option to enable C11 features... (cached) none needed
checking whether /home/wkz/src/buildroot/x-ppc/host/bin/powerpc-linux-gcc understands -c and -o together... (cached) yes
checking pkg-config is at least version 0.9.0... yes
checking for libbpf >= 1.0.0... no
configure: error: Package requirements (libbpf >= 1.0.0) were not met:

Package 'libbpf', required by 'virtual:world', not found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables libbpf_CFLAGS
and libbpf_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.
make[1]: *** [package/pkg-generic.mk:283: /home/wkz/src/buildroot/x-ppc/build/kmemd-1.0.0/.stamp_configured] Error 1
make: *** [Makefile:23: _all] Error 2

And this is the source of the problem:

~/src/buildroot/x-ppc$ find host/powerpc-buildroot-linux-gnu/sysroot/ -name libbpf.pc
host/powerpc-buildroot-linux-gnu/sysroot/usr/lib64/pkgconfig/libbpf.pc

>>  ...cross-compilation-for-32-bit-targets.patch | 37 +++++++++++++++++++
>>  1 file changed, 37 insertions(+)
>>  create mode 100644 package/libbpf/1.0.1/0001-Makefile-Fix-cross-compilation-for-32-bit-targets.patch
>> 
>> diff --git a/package/libbpf/1.0.1/0001-Makefile-Fix-cross-compilation-for-32-bit-targets.patch b/package/libbpf/1.0.1/0001-Makefile-Fix-cross-compilation-for-32-bit-targets.patch
>> new file mode 100644
>> index 0000000000..3730b2fa41
>
> Please put the patch directly in package/libbpf/. Putting it in a
> 1.0.1/ sub-directory is not needed. We only do that for packages where
> multiple versions are used (like package/gcc, package/binutils for
> example).

Will fix in v2.

>> --- /dev/null
>> +++ b/package/libbpf/1.0.1/0001-Makefile-Fix-cross-compilation-for-32-bit-targets.patch
>> @@ -0,0 +1,37 @@
>> +From 68e6f83f223ebf3fbf0d94c0f4592e5e6773f0c1 Mon Sep 17 00:00:00 2001
>> +From: Tobias Waldekranz <tobias@waldekranz.com>
>> +Date: Fri, 14 Oct 2022 21:14:14 +0200
>> +Subject: [PATCH] Makefile: Fix cross-compilation for 32-bit targets
>> +
>> +Determining the correct library installation path (lib vs. lib64)
>> +using uname(1) breaks in cross compilation scenarios where word widths
>> +differ between the host and target system.
>> +
>> +Instead, source the information from the compilers '-dumpmachine'
>> +option (supported by both GCC and Clang).
>> +
>> +We call this the "host" architecture, using the same nomenclature as
>> +Autotools (--host configure option).
>> +
>
> Please add:
>
> Upstream: https://github.com/libbpf/libbpf/commit/68e6f83f223ebf3fbf0d94c0f4592e5e6773f0c1

Sure thing.

>> +Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>
>
> Could you send a v2 with those changes? I was about to do the changes
> myself, but I really don't know which build failure this patch is
> fixing so I couldn't fix that up myself in the commit log.
>
> Thanks a lot!
>
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
