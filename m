Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BD0C52D6F
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 19:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B35B402EA;
	Tue,  6 Aug 2024 19:33:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yXujBj0zWLtV; Tue,  6 Aug 2024 19:33:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AD4B40303
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AD4B40303;
	Tue,  6 Aug 2024 19:33:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB5C01BF2EB
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 19:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D956680E65
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 19:33:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCQQJWmXK8y1 for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 19:33:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AA6B280E64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA6B280E64
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA6B280E64
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 19:33:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id B31FCB0037C;
 Tue,  6 Aug 2024 21:33:00 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:59786])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 06 Aug 2024 21:33:00 +0200
MIME-Version: 1.0
Date: Tue, 06 Aug 2024 21:33:00 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20240806194340.2e542192@windsurf>
References: <20240207225100.1320837-1-ju.o@free.fr>
 <20240806194340.2e542192@windsurf>
User-Agent: Webmail Free/1.6.7
Message-ID: <01746f497e80b9a6b6efd1f50276a8cc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1722972781;
 bh=zwtgybAzErHtl+Vd103ofeFun+RtmitQX/VQL74zcww=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JRAG+8uZRnHL7rSP1O90mRKDBjhLndC0c4Rv+KOpykMJpHEgPHqsw+Hedio7XzaXc
 lxuiCcjfbZN4bzzCygqMpXUDcB7QHXMqSfUduvF5XZjd6gQH1oEBNFW2RGl+ULi8K6
 VITC6hA5UTV6PTBYFNp9w1i+LYhJJANwCWS8L/+ZgWF9MWpLXGMmWR3A8BQhgBEP1p
 I6f+nEP8Uj6qqieSlNJpmdgFlYZ9fQhO6oc3adE5Wl89SpoKrHwgJKQ3hwpx3Ms8F6
 edhuX5ohQpdC9TMEl3P+fvpESea6QIP61ADn37IFdn/XBdkGjvEZVNj5+jPKb7OCay
 VACootD9+p3PQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JRAG+8uZ
Subject: Re: [Buildroot] [PATCH v2 1/1] package/swipl: new package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 06/08/2024 19:43, Thomas Petazzoni wrote:
> Hello Julien,
> 
> On Wed,  7 Feb 2024 23:51:00 +0100
> Julien Olivain <ju.o@free.fr> wrote:
> 
>> SWI-Prolog offers a comprehensive free Prolog environment. Since its
>> start in 1987, SWI-Prolog development has been driven by the needs of
>> real world applications. SWI-Prolog is widely used in research and
>> education as well as commercial applications.
>> 
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
> 
> I've finally applied, with some minor changes.
> 
>> diff --git a/package/Config.in b/package/Config.in
>> index 91a6f1de00..b1a9d74af1 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -1443,6 +1443,7 @@ endmenu
>>  endif
>>  	source "package/quickjs/Config.in"
>>  	source "package/ruby/Config.in"
>> +	source "package/swipl/Config.in"
>>  	source "package/tcl/Config.in"
>>  if BR2_PACKAGE_TCL
>>  menu "Tcl libraries/modules"
>> diff --git a/package/swipl/Config.in b/package/swipl/Config.in
>> new file mode 100644
>> index 0000000000..f0fb2d786d
>> --- /dev/null
>> +++ b/package/swipl/Config.in
>> @@ -0,0 +1,38 @@
>> +# swipl supports arch for which libc fenv.h provides all four macros:
>> +# FE_DOWNWARD, FE_TONEAREST, FE_TOWARDZERO, FE_UPWARD
>> +# See for example in glibc https://sourceware.org/git/glibc.git
>> +# git grep -E 
>> '^[[:space:]]*#[[:space:]]*define[[:space:]]+FE_(TONEAREST|UPWARD|DOWNWARD|TOWARDZERO)' 
>> sysdeps/
>> +config BR2_PACKAGE_SWIPL_ARCH_SUPPORTS
>> +	bool
>> +	default y if BR2_aarch64 || BR2_aarch64_be
>> +	default y if BR2_arceb || BR2_arcle
>> +	default y if BR2_arm || BR2_armeb
>> +	default y if BR2_i386
>> +	default y if BR2_m68k
>> +	# BR2_microblaze has only FE_TONEAREST
>> +	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
>> +	# BR2_nios2 has only FE_TONEAREST
>> +	default y if BR2_or1k
>> +	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
>> +	default y if BR2_riscv
>> +	default y if BR2_s390x
>> +	# BR2_sh has only FE_{TONEAREST,TOWARDZERO}
>> +	default y if BR2_sparc || BR2_sparc64
>> +	default y if BR2_x86_64
>> +	# BR2_xtensa supports only uclibc which does not have fenv.h
>> +
>> +config BR2_PACKAGE_SWIPL
>> +	bool "SWI-Prolog"
>> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # __has_attribute()
>> +	depends on BR2_PACKAGE_SWIPL_ARCH_SUPPORTS
>> +	# swipl needs fenv.h which is not provided by uclibc
>> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC
>> +	select BR2_PACKAGE_ZLIB
>> +	help
>> +	  SWI-Prolog offers a comprehensive free Prolog
>> +	  environment. Since its start in 1987, SWI-Prolog development
>> +	  has been driven by the needs of real world
>> +	  applications. SWI-Prolog is widely used in research and
>> +	  education as well as commercial applications.
>> +
>> +	  https://www.swi-prolog.org
> 
> The Config.in comment here was missing, about the gcc >= 5 dependency
> and the glibc or musl dependency, so I added it.
> 
> 
>> +# swipl uses cmake macros try_run() and check_c_source_runs(), which
>> +# are not suitable for cross compilation. We add results in cache to
>> +# avoid running those tests. The SWIPL_NATIVE_FRIEND variable, is
>> +# meant to point to build directory of a host native swipl, rather
>> +# than the binary itself. The Cmake macro will append "src/swipl" to
>> +# the path set to this variable. Therefore, we cannot use the host
>> +# "swipl" binary installed in $(HOST_DIR)/usr/bin.
>> +SWIPL_CONF_OPTS = \
>> +	-DBUILD_PDF_DOCUMENTATION=OFF \
>> +	-DHAVE_WEAK_ATTRIBUTE=1 \
>> +	-DLLROUND_OK=1 \
>> +	-DMODF_OK=1 \
>> +	-DQSORT_R_GNU=1 \
>> +	-DSWIPL_NATIVE_FRIEND=$(BUILD_DIR)/host-swipl-$(SWIPL_VERSION) \
> 
> I've used $(HOST_SWIPL_SRCDIR) instead.
> 
> Applied with those changes. Thanks!

Thanks for applying (and the adjustments).

The test files from my original submission at:
https://patchwork.ozlabs.org/project/buildroot/patch/20240207225100.1320837-1-ju.o@free.fr/
were not applied.

Running: utils/get-developers -v
outputs:

     WARNING: 'support/testing/tests/package/test_swipl.py' doesn't match 
any file, line 1966
     WARNING: 'support/testing/tests/package/test_swipl/' doesn't match 
any file, line 1967

Do you want me to resend those?

> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
