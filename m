Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	URI_NOVOWEL,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB70C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 18:53:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 365BB61051
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 18:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 365BB61051
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5C9E400AE;
	Fri,  3 Sep 2021 18:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S6G88xE2vrYF; Fri,  3 Sep 2021 18:53:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83C7940160;
	Fri,  3 Sep 2021 18:53:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 45ADF1BF321
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 18:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 334BA400AE
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 18:53:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4SkneJLqfEG1 for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 18:53:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65BF140160
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 18:53:01 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id mf2so13861622ejb.9
 for <buildroot@buildroot.org>; Fri, 03 Sep 2021 11:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BtDGViI1OtK+3r0bHKmn8rQ3gdCc4r4H07KwAR/ojhc=;
 b=fVDbH5sCzuO4jEWaiWmnFJb3DM2oGd365FDz3Gr/ZMTLnzLSOi+1pHkGQZljD9GJgj
 SH9WN/CTYLbmnlJcAKxYqfgJDnGi6R2C46unfF4spn+5noXzaud9/guewgh9ToS1Fp3J
 /jdRW6kHY05ZLW6f2RmdgZ3GJVtt1xbJOIadiN8mTc1L+9l7q45RtqvbPZHQ07pNY9N9
 gZNkCzhfDto3UyD9dqKjK/AjRbJCCH5y0PEwbZKqJFsh2xhj4Q0D0T0eKCERjkKfz02z
 blvJWyVQTAcv464tevav03mJCWjgxbsj+EMwAQpQEaL1YcaBv5zrVLihPUg8Q2gFmllb
 MwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=BtDGViI1OtK+3r0bHKmn8rQ3gdCc4r4H07KwAR/ojhc=;
 b=e/wmaou3cqu8YFQAo47xw8fpaI4fL2OEGOh+8NfwnrUy7tnL2h/o6pmd96u2uA+RH9
 7o7QTzFTkakzVnigrIWl3hD74kgVHB8ZRh54xKAOcLR/Frkp4EykGb7Y43GLEmz12QON
 OA+eSBo05TISm97Kk3rUf2Fn1K1fpVrHhgJPK9aU8Hx0OaYX57k2Hum7+86MSEmGNeP0
 6zcCaoRF77O9zQhg/KdAYtrj2Ul3RSS+kNRaYsyCsUeoJfePiuTE/sDO5lBwsAlckunc
 D7Wnd5K6JuxYjVzq6iUzMk9DI9VpHGJgYqu4dWpF1wHyf6Ha9D6Cz2sXAx/vXBSJG0cF
 sl7A==
X-Gm-Message-State: AOAM531cTbG+iZRseVxb8/WtWr69eEup60lsRsqqpqj4EqVfxFszatnH
 VO7bzQaYzaLTIJXNoeHsIdUtlQ==
X-Google-Smtp-Source: ABdhPJwTyLOCxgnCLUzBBAnB73G1/BNwGrlGRlN+1WXmuRhc0wjEXw0QaD3QI4BM91ulTGwlx/oxjQ==
X-Received: by 2002:a17:906:48d0:: with SMTP id
 d16mr314986ejt.562.1630695179591; 
 Fri, 03 Sep 2021 11:52:59 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s23sm102095eds.12.2021.09.03.11.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 11:52:58 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210902162024.2201056-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <93396db0-96b3-faa4-2b62-2301b14300df@mind.be>
Date: Fri, 3 Sep 2021 20:52:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210902162024.2201056-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/fstrcmp: fix musl static build
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 02/09/2021 18:20, Fabrice Fontaine wrote:
> Fix the following musl static build failure raised because host libtool
> is not patched to manage "-static" as "-all-static". So instead of using
> host libtool, patch configure.ac to add a call to LT_INIT which will

 Wouldn't it make more sense to just apply our buildroot-libtool-v2.4.4.patch to
host-libtool?

 Regards,
 Arnout

> result in lt-main.sh being copied (and so libtool patch being applied):
> 
> /home/buildroot/autobuild/instance-2/output-1/host/bin/libtool --mode=link --tag=CC /home/buildroot/autobuild/instance-2/output-1/host/bin/arm-buildroot-linux-musleabihf-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static -Wall -Wextra -Wshadow -o bin/test_user \
> 	test_user/main.lo lib/libfstrcmp.la -static
> chmod a+rx bin/test_prelude
> libtool: link: /home/buildroot/autobuild/instance-2/output-1/host/bin/arm-buildroot-linux-musleabihf-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 -Wall -Wextra -Wshadow -o bin/test_user test_user/main.o  lib/.libs/libfstrcmp.a
> libtool: link: /home/buildroot/autobuild/instance-2/output-1/host/bin/arm-buildroot-linux-musleabihf-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 -Wall -Wextra -Wshadow -o bin/fstrcmp fstrcmp/main.o  lib/.libs/libfstrcmp.a
> /home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-musleabihf/10.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: /home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-musleabihf/10.3.0/libgcc.a(_dvmd_lnx.o): in function `__aeabi_ldiv0':
> /home/buildroot/autobuild/instance-2/output-1/build/host-gcc-final-10.3.0/build/arm-buildroot-linux-musleabihf/libgcc/../../../libgcc/config/arm/lib1funcs.S:1499: undefined reference to `raise'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ffbee12f13e3d6c180d8891a428c6c490163083d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/fstrcmp/0002-add-LT_INIT.patch | 28 ++++++++++++++++++++++++++
>  package/fstrcmp/fstrcmp.mk             |  4 ++--
>  2 files changed, 30 insertions(+), 2 deletions(-)
>  create mode 100644 package/fstrcmp/0002-add-LT_INIT.patch
> 
> diff --git a/package/fstrcmp/0002-add-LT_INIT.patch b/package/fstrcmp/0002-add-LT_INIT.patch
> new file mode 100644
> index 0000000000..cc55ae48c9
> --- /dev/null
> +++ b/package/fstrcmp/0002-add-LT_INIT.patch
> @@ -0,0 +1,28 @@
> +add LT_INIT
> +
> +Add LT_INIT so lt-main.sh will be copied and patched to fix musl static build
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +
> +diff -Nura fstrcmp-0.7.D001.orig/configure.ac fstrcmp-0.7.D001/configure.ac
> +--- fstrcmp-0.7.D001.orig/configure.ac	2021-09-02 15:20:38.033208084 +0200
> ++++ fstrcmp-0.7.D001/configure.ac	2021-09-02 15:37:08.625837688 +0200
> +@@ -53,6 +53,7 @@
> + dnl! AC_ADD_CFLAGS(-Werror)
> + dnl! AC_ADD_CFLAGS([-Wl,--as-needed])
> + 
> ++LT_INIT
> + AC_CHECK_PROGS(LIBTOOL, libtool)
> + 
> + if test -z "$LIBTOOL"
> +diff -Nura fstrcmp-0.7.D001.orig/Makefile.in fstrcmp-0.7.D001/Makefile.in
> +--- fstrcmp-0.7.D001.orig/Makefile.in	2021-09-02 15:20:38.033208084 +0200
> ++++ fstrcmp-0.7.D001/Makefile.in	2021-09-02 15:38:38.622832929 +0200
> +@@ -34,6 +34,7 @@
> + #
> + # directory containing the source
> + #
> ++top_builddir = @srcdir@
> + srcdir = @srcdir@
> + VPATH = @srcdir@
> + 
> diff --git a/package/fstrcmp/fstrcmp.mk b/package/fstrcmp/fstrcmp.mk
> index 9c42159afb..9b6419ae3f 100644
> --- a/package/fstrcmp/fstrcmp.mk
> +++ b/package/fstrcmp/fstrcmp.mk
> @@ -10,8 +10,8 @@ FSTRCMP_SITE = https://sourceforge.net/projects/fstrcmp/files/fstrcmp/$(FSTRCMP_
>  FSTRCMP_LICENSE = GPL-3.0+
>  FSTRCMP_LICENSE_FILES = LICENSE
>  FSTRCMP_INSTALL_STAGING = YES
> -FSTRCMP_DEPENDENCIES = host-libtool
> -FSTRCMP_CONF_ENV = LIBTOOL="$(HOST_DIR)/bin/libtool"
> +# We're patching configure.ac
> +FSTRCMP_AUTORECONF = YES
>  
>  FSTRCMP_MAKE_OPTS = all-bin libdir/pkgconfig/fstrcmp.pc
>  
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
