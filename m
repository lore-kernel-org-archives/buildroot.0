Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5370FC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 16:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A610D83F83;
	Mon, 15 Aug 2022 16:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A610D83F83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HS1NzDJsmnwI; Mon, 15 Aug 2022 16:27:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 614EC82486;
	Mon, 15 Aug 2022 16:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 614EC82486
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8EB4F1BF41C
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61ED340866
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:27:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61ED340866
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PlJgGmNZ59mN for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 16:27:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A88EB4085F
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A88EB4085F
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 16:27:19 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id gk3so14375140ejb.8
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=v+ctP3xt2llPsIEFgpe/5YQWNssvdAOFco+HW0wk6IM=;
 b=FFzyRiqJX6Q3Vl1MX2keA6ZQbKhBc/k1L+ISYIopkJsLZt3CIRucKG59uDgrvgYHX5
 Y0huxszevZe9f2LEvosRWAtZHGrtHtpthbo3ae830a7vLGhgtNRzF+T9g7QrPJpWhmS2
 aqTodSq0NttCe5/Bai7DPQK09ity+9Aet0pbVl+GfF2HhK0LagN43F+6n6lMgDTcRoox
 rjekaezG/5OGIiXPJqhU8ef6mI612Wh/slyytXSAnDJgLQpi0NU0AdrvZHCltu902ZGp
 QA7OKRIXE52PK6BLdLEuifDec+aKd32yJc8thVquOSu1EhEtKs30I2uV//g0J5Qp7TqO
 hBhw==
X-Gm-Message-State: ACgBeo2FR3THkBtXqxfPybMOptn8wfPrSxDsP7fyrXDkGvvU4UnDBh96
 OwMNkVw/DuFVQfuOT11goTz/JA==
X-Google-Smtp-Source: AA6agR75/Nxk0UrrIfxP9HKtyMoB5CfBmDDnSljAMCas0f0IAGYTGIac1iEJygfIIBa4jksLrhJGLA==
X-Received: by 2002:a17:906:9bfa:b0:730:cd06:ba3f with SMTP id
 de58-20020a1709069bfa00b00730cd06ba3fmr10775383ejc.224.1660580837837; 
 Mon, 15 Aug 2022 09:27:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 1-20020a170906300100b006fee98045cdsm4332542ejz.10.2022.08.15.09.27.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 09:27:17 -0700 (PDT)
Message-ID: <a9516439-e2b3-6b43-59fd-4d6e6b1ae167@mind.be>
Date: Mon, 15 Aug 2022 18:27:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220815111710.1459820-1-arnout@mind.be>
 <20220815123656.GW2854108@scaer>
Organization: Essensium/Mind
In-Reply-To: <20220815123656.GW2854108@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc;
 bh=v+ctP3xt2llPsIEFgpe/5YQWNssvdAOFco+HW0wk6IM=;
 b=EZcm8O4LDK8CHbu1H+n6nno5iJlv5Cw6eysBGO/3ArDBkfVjq2WdKszM/8QIQu7hKY
 5yhqOxQMsCQ+TKlW75+6pQsOjbAZbQQj5dU2pjmVTR/pobQWMQPBiF7IhoiA5tqRHsvH
 6h1AxQ9U5MLCBG48rVmCaE1E606PydLg5u9fc6bvdBlJj/rlj+TTHUF1HvS9zE7PY4Iz
 pJOUfSED9dj5RXTKEsekmb0M+23XIiQqiS1yVDO6LF2fG7NhPGMi5PNVaVMSqz0DTAOZ
 FiD9QbfsS+hlGJwcFSMVS8BlqAPAlwatECvetTrsn5xnBm7Q5OvoElrGDXes7kHXeOr/
 GpWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EZcm8O4L
Subject: Re: [Buildroot] [PATCH next v5 1/3] package/dracut: new host package
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
Cc: Adam Duskett <aduskett@gmail.com>,
 Thierry Bultel <thierry.bultel@linatsea.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/08/2022 14:36, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2022-08-15 13:17 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
>> From: Thierry Bultel <thierry.bultel@linatsea.fr>
>> Dracut is the tool used by desktop distributions to build initrds.
> [--SNIP--]
>> diff --git a/package/dracut/0001-dracut.sh-don-t-unset-LD_PRELOAD.patch b/package/dracut/0001-dracut.sh-don-t-unset-LD_PRELOAD.patch
>> new file mode 100644
>> index 0000000000..87083d2cef
>> --- /dev/null
>> +++ b/package/dracut/0001-dracut.sh-don-t-unset-LD_PRELOAD.patch
>> @@ -0,0 +1,29 @@
>> +From bb12f15856911d8532b569116da7dab4cbf107be Mon Sep 17 00:00:00 2001
>> +From: Thierry Bultel <thierry.bultel@linatsea.fr>
>> +Date: Mon, 10 Jan 2022 09:09:43 +0100
>> +Subject: [PATCH] dracut.sh: don't unset LD_PRELOAD
>> +
>> +LD_PRELOAD is needed to run under fakeroot.
> 
> We also need LD_LIBRARY_PATH to actually find our lifakeroot.so (as
> discussed on IRC).
> 
> [--SNIP--]
>> diff --git a/package/dracut/busybox-init-module-setup.sh b/package/dracut/busybox-init-module-setup.sh
>> new file mode 100644
>> index 0000000000..2667f866d1
>> --- /dev/null
>> +++ b/package/dracut/busybox-init-module-setup.sh
>> @@ -0,0 +1,62 @@
>> +#!/bin/bash
>> +
>> +check() {
>> +	require_binaries busybox || return 1
>> +	return 0
> 
> return 0 is not needed: a shell function returns with the exit code from
> the last command it ran. In this case, the previous command succeeded,
> or we'd have already returned with 1, so the return code would be 0.
> 
> Still, we can keep it if that makes it consistent with the rest of the
> dracut modules.

  Yes, other dracut modules all have an explicit return. Usually "return 255" in 
the check function though. That indicates that the module should only be 
included if it's depended on by something else.

>> +}
>> +
>> +depends() {
>> +	return 0
> 
> Here, a colon should be enough:  depends() { :; }
> Yet, consistency? ;-)

  Exactly.


>> +}
>> +
>> +install_busybox_links() {
>> +	dir=$1
>> +	linkname=$2
>> +
>> +	(cd "${dracutsysrootdir?}${dir}" &&
>> +	for x in *; do
>> +		if [ "$(readlink "$x")" = "${linkname}" ]; then
> 
> Always expand between curly braces, even single-char variables.

  We don't do that consistently at the moment, so I didn't realize this was a thing.

  Is it something that shellcheck can verify?

>> +			ln -sf "${linkname}" "${initdir?}/${dir}/$x"
> 
> Ditto.
> 
>> +		fi
>> +	done
>> +	)
>> +}
>> +
>> +install() {
>> +	inst_multiple /bin/busybox
>> +
>> +	# wrapper script for early console; will launch /sbin/init
>> +	# after having mounted devtmpfs
>> +	inst_multiple /init
>> +
>> +	ln -s ../bin/busybox "${initdir?}"/sbin/init
> 
> Isn't that already covered by the second install_busybox_links call,
> below?

  Ah, yes, it should be.


>> +	if [ -e "${dracutsysrootdir?}/lib64" ]; then

  BTW, I should probably have mentioned in the commit message that the ? here is 
to indicate variables that are pre-defined by dracut and that shellcheck errors 
out on. dracut itself completely excludes the check of undefined variables, but 
I prefer not to do that.

>> +		ln -sf lib "${initdir?}/lib64"
>> +		ln -sf lib "${initdir?}/usr/lib64"
>> +	fi
>> +
>> +	if [ -e "${dracutsysrootdir?}/lib32" ]; then
>> +		ln -sf lib "${initdir?}/lib32"
>> +		ln -sf lib "${initdir?}/usr/lib32"
>> +	fi
>> +
>> +	install_busybox_links "/bin" "busybox"
>> +	install_busybox_links "/sbin" "../bin/busybox"
> 
> This one should catch the /sbin/init -> /bin/busybox symlink, no?
> 
>> +	if [ ! -L /bin ]; then
>> +		install_busybox_links "/usr/bin" "../../bin/busybox"
>> +		install_busybox_links "/usr/sbin" "../../bin/busybox"
>> +	fi
>> +
>> +	inst_multiple \
>> +		/etc/inittab	\
>> +		/etc/init.d/rcS \
>> +		/etc/init.d/rcK \
>> +		/etc/issue	\
>> +		/etc/fstab	\
>> +		/etc/group	\
>> +		/etc/passwd	\
>> +		/etc/shadow	\
>> +		/etc/hostname
>> +}
>> +
> 
> Spurious empty line at EOF.
> 
>> diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
>> new file mode 100644
>> index 0000000000..7afec80c0e
>> --- /dev/null
>> +++ b/package/dracut/dracut.mk
>> @@ -0,0 +1,47 @@
>> +################################################################################
>> +#
>> +# dracut
>> +#
>> +################################################################################
>> +
>> +DRACUT_VERSION = 055
> 
> 056 is tarball-released, and 057 is github-tagged now. We can bump in a
> later commit, of course.
> 
>> +DRACUT_SOURCE = dracut-$(DRACUT_VERSION).tar.xz
>> +DRACUT_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/boot/dracut
> 
> So, what is the canonical source? Kernel.org has 056, but not 057. Their
> README.md hints that github is the official source:
> 
>      Currently dracut is developed on [github.com](https://github.com/dracutdevs/dracut).
> 
>      The release tarballs are [here](https://github.com/dracutdevs/dracut/releases).

  I hadn't seen that.


>> +DRACUT_LICENSE = GPL-2.0
>> +DRACUT_LICENSE_FILES = COPYING
>> +
>> +HOST_DRACUT_DEPENDENCIES = host-pkgconf host-kmod host-prelink-cross
>> +
>> +define HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
>> +	mv $(HOST_DIR)/bin/dracut $(HOST_DIR)/bin/dracut.real
>> +	install -D -m 0755 $(HOST_DRACUT_PKGDIR)/dracut_wrapper.sh $(HOST_DIR)/bin/dracut
> 
> There is no reason to add the '.sh' suffix to any executable shell
> script, since what matters is the shebang line, especially since it
> is eventually installed as a non-suffixed name.

  Well, I hope that we will at some point extend check-package to run shellcheck 
on everything that ends with .sh (in addition to the init scripts).

>> +endef
>> +HOST_DRACUT_POST_INSTALL_HOOKS += HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
>> +
>> +# When using uClibc or musl, there must be "ls-uClibc.so.1" or
>                                                ,^^
> s/ls/ld/ ------------------------------------'

  Oops :-)

> 
> [--SNIP--]
>> diff --git a/package/dracut/dracut_wrapper.sh b/package/dracut/dracut_wrapper.sh
>> new file mode 100644
>> index 0000000000..3f58b0907e
>> --- /dev/null
>> +++ b/package/dracut/dracut_wrapper.sh
>> @@ -0,0 +1,33 @@
>> +#!/bin/bash
>> +set -e
>> +
>> +# Find the --sysroot argument
>> +sysroot=
>> +next_arg=
>> +for arg; do
>> +	if [ "$next_arg" = 1 ]; then
> 
> For such a situation, there is a construct that I started to like and
> use, is to use 'true' and 'false' instead of markers in variables, so
> that we can actually test the variable directly:
> 
>      sysroot
>      next_arg=false
>      for arg; do
>          if ${next_arg}; then

  Oh yes, better. Note that shellcheck will probably want you to add quotes.

>              next_arg=false
>              sysroot="${arg}"
>              continue  # not break, in case there are more than one

  And thanks for the comment :-)

>          fi
>          case "${arg}" in
>            (--sysroot)
>              next_arg=true
>              continue
>              ;;
>            (--sysroot=*)
>              sysroot="${arg#*=}"
>              continue  # not break, in case there are more than one
>              ;;
>          esac
>      done
> 
>> +		next_arg=
>> +		sysroot="$arg"
>> +		continue
>> +	fi
>> +
>> +	case "$arg" in
>> +	--sysroot=*)
>> +		sysroot="${arg#*=}"
>> +		;;
>> +	--sysroot)
>> +		next_arg=1
>> +		;;
>> +	esac
>> +done
>> +if [ -z "$sysroot" ]; then
> 
> Curly-braces for expansion.
> 
>> +	echo "$0: --sysroot argument must be given." 1>&2
>> +	exit 1
>> +fi
>> +
>> +topdir="$(dirname "$(realpath "$(dirname "$0")")")"
> 
> You can avoid a call to dirname, with just: ${0%/*}

  Since we anyway need the outer dirname, I prefer to use dirname for the inner 
one as well.

> 
> Also, always expand variables with curly braces, even positional
> arguments.
> 
>> +export DRACUT_LDD="$topdir/sbin/prelink-rtld --root='${sysroot}'"
>                         ^^^^^^
> Always expand variables between curly braces, especially since there is
> already such an expansion on the same line (also valid below).
> 
>> +export DRACUT_INSTALL="$topdir/lib/dracut/dracut-install"
>> +export DRACUT_LDCONFIG=/bin/true
>> +export dracutbasedir="$topdir/lib/dracut"
>> +exec "$topdir/bin/dracut.real" "$@"
>> diff --git a/package/dracut/libc-links-module-setup.sh b/package/dracut/libc-links-module-setup.sh
>> new file mode 100755
>> index 0000000000..e15b216e6e
>> --- /dev/null
>> +++ b/package/dracut/libc-links-module-setup.sh
>> @@ -0,0 +1,27 @@
>> +#!/bin/bash
>> +
>> +# Adds the missing links for uClibc or musl, if needed
>> +
>> +check() {
>> +	return 0
>> +}
>> +
>> +depends() {
>> +	return 0
>> +}
>> +
>> +install() {
>> +	# Despite of the fact that the listed dependency (reported by readelf -d)
>> +	# is purely /lib/libc.so, the musl symlink is needed anyway.
>> +	musl_link="$(find "${dracutsysrootdir?}/lib" -name "ld-musl-*.so*")"
>> +	if [ -n "$musl_link" ] ; then
>> +		ln -s libc.so "${initdir?}/lib/$(basename "${musl_link}")"
> 
> Besides the usual curly-braces expansion comment, you don't need to use
> basename here: ${musl_link##*/}

  Yes, here it's definitely better to do it in the expansion itself.

  Regards,
  Arnout


> 
> All of those are minor and can be fixed when applying, but there are a
> few where a reply/confirmation would still be welcome.
> 
>> +	fi
>> +
>> +	# Same for uClibc, the listed dependency
>> +	# is ld-uClibc.so.1, the loader needs the ld-uClibc.so.0, too
>> +	uclibc_link="$(find "${dracutsysrootdir?}/lib" -name "ld-uClibc-*.so*")"
>> +	if [ -n "$uclibc_link" ] ; then
>> +		ln -s ld-uClibc.so.1 "${initdir?s}/lib/ld-uClibc.so.0"
>> +	fi
>> +}
>> -- 
>> 2.37.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
