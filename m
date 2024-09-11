Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B94DEE57CF
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 19:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CACEE403E5;
	Wed, 11 Sep 2024 19:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fE3_Bo4RwKG1; Wed, 11 Sep 2024 19:40:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67D1940197
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67D1940197;
	Wed, 11 Sep 2024 19:40:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0442B1BF369
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 19:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E784B81415
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 19:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zr-UTBfhulfV for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 19:40:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 89C0281407
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89C0281407
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89C0281407
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 19:40:51 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-371ba7e46easo195829f8f.0
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 12:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726083649; x=1726688449;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=McxQCUzAGPmaQvpCnJHvWpof+PKh7VaL1Qq6T2Ui9bI=;
 b=Do8mEiOH0yJQxcg4Z6uTkRMcTFVZ5qewrw4HTjAPF08pf9jq4LmO78eihGSKelfd0O
 ALzKdRjtMDkqvSuFqTr9mpntwDcl0JeArifOh2RAsSzdZCQWDvaAFIWZtWvrbrmYRJPy
 ahmRnF3BDp7Bzm1XVXrmg94Xzs4m8kbXCBuKtaa6CeSjE360Mn+seRyivgxKqL08W/uV
 bP2sw+8hdtL3J7lN5cnbxxalNj4TcwVN6LDMLQ5i8+OOqHN34riXtw8LMccz7r3BxxUp
 quj9qk5rYK6Hd6cADfHm+ak6HdCKULHmtHXjeT+GP+CW7BkxwmA5RFpTVtZGxb/Q0AU2
 jW6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWh9nE4+3iPD+MwAIHZz46a6lv/1TmgO6RlQBFd5xvUrmTVvaGYS8nveUit5ooiFd1E9wksaX1f/2M=@buildroot.org
X-Gm-Message-State: AOJu0Yye+3aenDzpOUQ9fIYTdvk7nTmVwAFSkpcE7CJA6t7UJkQpVA5D
 Z8NBow8TFzsyUPnqLMFk4zD/2koEsM5LUSTQV6tc6zBKM8SFNZS8XJkSDCtkHSo=
X-Google-Smtp-Source: AGHT+IFzpLkcEBCoKL/GaMWPX4y54FgoeLGvmx08lfLATJeD1dEqHTJfckoFdjQILoeVXeV5xD5lQg==
X-Received: by 2002:a5d:4348:0:b0:374:af6e:b4d3 with SMTP id
 ffacd0b85a97d-378c2d034eamr180385f8f.35.1726083649359; 
 Wed, 11 Sep 2024 12:40:49 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3789564a067sm12330469f8f.13.2024.09.11.12.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 12:40:48 -0700 (PDT)
Message-ID: <ef80790b-14cc-40fb-866d-aa7f8ce05ec2@mind.be>
Date: Wed, 11 Sep 2024 21:40:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <Zr6t0edkFUlZULGn@waldemar-brodkorb.de>
Content-Language: en-GB
In-Reply-To: <Zr6t0edkFUlZULGn@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726083649; x=1726688449; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=McxQCUzAGPmaQvpCnJHvWpof+PKh7VaL1Qq6T2Ui9bI=;
 b=NjDXxwZ24mVcoSNhT5+uiXIAc+fAM3+R0h7684iGhn7zENouxTCWPwKGh3w7k+KGHb
 7qxbK4RwVUpb397jCcSUVYI/NR3gSGF4FluWIaCIB/J88PT+Ic66f8OWpkyztIWUBI1I
 t8hpsVHHu2cySLjhNIzIJbFq0v7NxwG5UauofS7UktTS/4XkZjTbVslVS17DmN9JHrtp
 bjjdxV/r0jSHuw0YivWqKgUKwzCHQj51PfxLYnAXXiIVfPJWlWkD7ug5Qemt3IiDls8h
 LYncYnlJE4K7nO/n2SsVAUAI4Vv04zEXUC9asl1DQrQOwgcjPG9SiSuaYp3O0m11RU6s
 GJrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NjDXxwZ2
Subject: Re: [Buildroot] [PATCH next v3] package/bind: update to 9.18.28
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/08/2024 03:39, Waldemar Brodkorb wrote:
> Bind 9.16.x is EOL since April 2024.
> See here for what version should be used in production:
> https://kb.isc.org/docs/aa-01540
> 
> Remove patch 0001 as CC_FOR_BUILD is used in upstream code
> to compile host utility gen.
> 
> Use BIND_AUTORECONF = YES to avoid a Debian 12 libtool bug.
> Otherwise rndc linking fails. See here for a bug report to
> bind9 project:
> https://gitlab.isc.org/isc-projects/bind9/-/issues/4840
> 
> See here for a changelog:
> https://downloads.isc.org/isc/bind9/9.18.28/doc/arm/html/notes.html
> 
> COPYRIGHT file has been updated, following Copyright holders were
> added:
> Copyright Joyent, Inc. and other Node contributors. All rights reserved.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> ./utils/test-pkg -a -p bind
>                               arm-aarch64 [ 1/41]: OK
>                     bootlin-aarch64-glibc [ 2/41]: OK
>                 bootlin-arcle-hs38-uclibc [ 3/41]: OK
>                      bootlin-armv5-uclibc [ 4/41]: OK
>                       bootlin-armv7-glibc [ 5/41]: OK
>                     bootlin-armv7m-uclibc [ 6/41]: SKIPPED
>                        bootlin-armv7-musl [ 7/41]: OK
>                  bootlin-m68k-5208-uclibc [ 8/41]: SKIPPED
>                 bootlin-m68k-68040-uclibc [ 9/41]: OK
>               bootlin-microblazeel-uclibc [10/41]: OK
>                  bootlin-mipsel32r6-glibc [11/41]: OK
>                     bootlin-mipsel-uclibc [12/41]: OK
>                       bootlin-nios2-glibc [13/41]: OK
>                   bootlin-openrisc-uclibc [14/41]: OK
>          bootlin-powerpc64le-power8-glibc [15/41]: OK
>             bootlin-powerpc-e500mc-uclibc [16/41]: OK
>                     bootlin-riscv32-glibc [17/41]: OK
>                     bootlin-riscv64-glibc [18/41]: OK
>                      bootlin-riscv64-musl [19/41]: OK
>                   bootlin-s390x-z13-glibc [20/41]: OK
>                        bootlin-sh4-uclibc [21/41]: OK
>                     bootlin-sparc64-glibc [22/41]: OK
>                      bootlin-sparc-uclibc [23/41]: SKIPPED
>                      bootlin-x86-64-glibc [24/41]: OK
>                       bootlin-x86-64-musl [25/41]: OK
>                     bootlin-x86-64-uclibc [26/41]: OK
>                     bootlin-x86-i686-musl [27/41]: OK
>                     bootlin-xtensa-uclibc [28/41]: OK
>                              br-arm-basic [29/41]: OK
>                      br-arm-full-nothread [30/41]: SKIPPED
>                        br-arm-full-static [31/41]: SKIPPED
>                     br-i386-pentium4-full [32/41]: OK
>                        br-mips64-n64-full [33/41]: OK
>                   br-mips64r6-el-hf-glibc [34/41]: OK
>                 br-powerpc-603e-basic-cpp [35/41]: OK
>                 br-powerpc64-power7-glibc [36/41]: OK
>                         linaro-aarch64-be [37/41]: OK
>                            linaro-aarch64 [38/41]: OK
>                                linaro-arm [39/41]: OK
>                           sourcery-mips64 [40/41]: OK
>                             sourcery-mips [41/41]: OK
> 41 builds, 5 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> ---
>   .checkpackageignore           |  1 -
>   package/bind/0001-cross.patch | 34 ----------------------------------
>   package/bind/bind.hash        |  8 ++++----
>   package/bind/bind.mk          |  9 +++++----
>   4 files changed, 9 insertions(+), 43 deletions(-)
>   delete mode 100644 package/bind/0001-cross.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 81e48bf859..31e05843e1 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -338,7 +338,6 @@ package/benejson/0001-c-std.patch lib_patch.Upstream
>   package/benejson/0002-Use-print-as-a-function-for-Py3-compatibility.patch lib_patch.Upstream
>   package/berkeleydb/0001-cwd-db_config.patch lib_patch.Upstream
>   package/berkeleydb/0002-atomic_compare_exchange.patch lib_patch.Upstream
> -package/bind/0001-cross.patch lib_patch.Upstream
>   package/bind/S81named Shellcheck lib_sysv.Indent lib_sysv.Variables
>   package/bird/0001-configure.ac-fix-build-with-autoconf-2.70.patch lib_patch.Upstream
>   package/bmx7/0001-Fix-schedule.c-378-36-error-SIOCGSTAMP-undeclared.patch lib_patch.Upstream
> diff --git a/package/bind/0001-cross.patch b/package/bind/0001-cross.patch
> deleted file mode 100644
> index f39be2f837..0000000000
> --- a/package/bind/0001-cross.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 505cc9fcadda5607dc4c5bacb03928c0b35162a8 Mon Sep 17 00:00:00 2001
> -From: Gustavo Zacarias <gustavo@zacarias.com.ar>
> -Date: Wed, 4 Nov 2020 17:51:38 +0100
> -Subject: [PATCH] Use host compiler to build 'gen' since it's run when
> - building.
> -
> -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> -[Fabrice: updated for 9.11.10]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ----
> - lib/dns/Makefile.in | 6 ++----
> - 1 file changed, 2 insertions(+), 4 deletions(-)
> -
> -diff --git a/lib/dns/Makefile.in b/lib/dns/Makefile.in
> -index 8fc4e94f26..4ac92857e0 100644
> ---- a/lib/dns/Makefile.in
> -+++ b/lib/dns/Makefile.in
> -@@ -184,10 +184,8 @@ code.h:	gen
> - 	./gen -s ${srcdir} > code.h || { rm -f $@ ; exit 1; }
> -
> - gen: gen.c
> --	${BUILD_CC} ${BUILD_CFLAGS} -I${top_srcdir}/lib/isc/include \
> --	${LFS_CFLAGS} ${LFS_LDFLAGS} \
> --	${BUILD_CPPFLAGS} ${BUILD_LDFLAGS} -o $@ ${srcdir}/gen.c \
> --	${BUILD_LIBS} ${LFS_LIBS}
> -+	${HOSTCC} ${HOST_CFLAGS} -I${top_srcdir}/lib/isc/include \
> -+	${HOST_LDFLAGS} -o $@ ${srcdir}/gen.c
> -
> - timestamp: include libdns.@A@
> - 	touch timestamp
> ---
> -2.29.1
> -
> diff --git a/package/bind/bind.hash b/package/bind/bind.hash
> index 482b046c8d..feb3430a73 100644
> --- a/package/bind/bind.hash
> +++ b/package/bind/bind.hash
> @@ -1,4 +1,4 @@
> -# Verified from https://ftp.isc.org/isc/bind9/9.16.48/bind-9.16.48.tar.xz.asc
> -# with key AADBBA5074F1402F7B69D56BC5B4EE931A9F9DFD
> -sha256  8d3814582348f90dead1ad410b1019094cd399d3d83930abebb2b3b1eb0b2bbb  bind-9.16.48.tar.xz
> -sha256  13491a682dc0f5ee2273cebd3949e2be62f9470fe659419a03a308d4f444773b  COPYRIGHT
> +# Verified from https://ftp.isc.org/isc/bind9/9.18.28/bind-9.18.28.tar.xz.asc
> +# with key 706B6C28620E76F91D11F7DF510A642A06C52CEC
> +sha256  e7cce9a165f7b619eefc4832f0a8dc16b005d29e3890aed6008c506ea286a5e7  bind-9.18.28.tar.xz
> +sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index 0d81ffabd6..217c9916fd 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -BIND_VERSION = 9.16.48
> +BIND_VERSION = 9.18.28
>   BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
>   BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
>   # bind does not support parallel builds.
> @@ -24,13 +24,14 @@ BIND_TARGET_SERVER_SBIN += lwresd named named-checkconf named-checkzone
>   BIND_TARGET_SERVER_SBIN += named-compilezone rndc rndc-confgen dnssec-dsfromkey
>   BIND_TARGET_SERVER_SBIN += dnssec-keyfromlabel dnssec-signzone tsig-keygen
>   BIND_TARGET_TOOLS_BIN = dig host nslookup nsupdate
> -BIND_CONF_ENV = \
> -	BUILD_CC="$(TARGET_CC)" \
> -	LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
> +# avoid potential Debian 12 libtool 2.4.7 bug
> +# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=929396
> +BIND_AUTORECONF = YES
>   BIND_CONF_OPTS = \
>   	--without-cmocka \
>   	--without-lmdb \
>   	--enable-epoll \
> +	--disable-doh \
>   	--disable-backtrace \
>   	--with-openssl=$(STAGING_DIR)/usr
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
