Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71ED3C433F5
	for <buildroot@archiver.kernel.org>; Fri, 31 Dec 2021 09:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D056540951;
	Fri, 31 Dec 2021 09:45:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ENLVvqbgf-8R; Fri, 31 Dec 2021 09:45:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09B1B40936;
	Fri, 31 Dec 2021 09:45:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C061A1BF426
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 09:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4B65404FB
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 09:45:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yz-ZEPoJHPGK for <buildroot@lists.busybox.net>;
 Fri, 31 Dec 2021 09:45:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC34E4033F
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 09:45:22 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id o12so59512511lfk.1
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 01:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:references:from:subject:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=0xHpv7G/VG9DylGwWYcNcZUjt36T2aGTutnHONDL/nQ=;
 b=gkwND/HbIxqF8mjbzGS7e0IvGQBlGo59s/jkoUpYguAffBfb646886ac2AdvPyzMZ2
 +4luwtP+CqXVsBdX49tum7c2aMxZSWKqlyn3Q4elX0ObYtUfmVagsN0oqJ55d0sm+iAp
 O/4+//Lpy8Zofq04h1zJt4xng6uDhhJE79cUK7dRAA3OX4KVqS2oB3be9MHzV4FFiWew
 CoUMpMnq2yv4WZBxKzOMTotq11BBO/qcjFPEfMi16oTX6dBTKiXZrX6AU0og6r2UM2Rm
 ElqvWRFHfrmW8mcD4rmE6/5QNVzZsiCON0J2kg0uq9qcvSzEHB9sWYz5ZIbd6nkOOqvB
 1XKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0xHpv7G/VG9DylGwWYcNcZUjt36T2aGTutnHONDL/nQ=;
 b=bw3nISgRozeJVibWzzvZ9ic3spCP0NYa1IPbLQ2HWafLBnmgCNWKXLYhid1XkzeIpa
 kL9WI4CACXVHddAQd7TIUrakzxo5V8N3vUZIpM4yVCq/JXGCVT083ouXQTmBy83sWoKa
 UgUGx3ntyLjSyu/uf33A/Pb2HGftTc4s2sn0FccmSpPvRzC/nJt6IBIfIHuf/aW4PCPX
 7jahc42MxtaRy8ThpGYolrsETn0LAxuW796W0pKtt0vJCLTSIKTP5R4sQnm3izWdFGhX
 2HKEu9ld7stSmkmgDaa8WFg1i6YG0vlUNkFTRnxirXs75+/zSTbjzmTZEHG7gKJwZxzy
 H+Qw==
X-Gm-Message-State: AOAM530tMFD9oXXeEvN0FiIGr3KtfBLqrIjsX7kl92W1XqFVqp74U/Ok
 uYU+PT2Dbfi2f6y9cZiemaP0uhME8NI=
X-Google-Smtp-Source: ABdhPJwqMFCbmdA8adpKM5a8/ojRyoJRvSt0CIYKuHHMcbrS6zVeCDrgZFF6fUXyJ26jr49vL79/nQ==
X-Received: by 2002:a05:6512:22ca:: with SMTP id
 g10mr29801226lfu.244.1640943920421; 
 Fri, 31 Dec 2021 01:45:20 -0800 (PST)
Received: from [10.0.196.136] ([176.10.248.201])
 by smtp.googlemail.com with ESMTPSA id e11sm1239461ljn.73.2021.12.31.01.45.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Dec 2021 01:45:19 -0800 (PST)
To: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
References: <20210124102241.1207866-1-christian@paral.in>
From: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <87d2f33b-08cc-6b84-35d4-11e5140bb222@gmail.com>
Date: Fri, 31 Dec 2021 10:45:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210124102241.1207866-1-christian@paral.in>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 1/1] package/daemonize: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

sorry for the late review:

On 1/24/21 11:22 AM, Christian Stewart wrote:
> Daemonize is a command line utility to run a program as a Unix daemon.
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---

Missing entry in DEVELOPERS.

>  package/Config.in                             |  1 +
>  ...de-setpgrp-to-enable-cross-compiling.patch | 55 +++++++++++++++++++
>  package/daemonize/Config.in                   |  5 ++
>  package/daemonize/daemonize.hash              |  1 +
>  package/daemonize/daemonize.mk                | 12 ++++
>  5 files changed, 74 insertions(+)
>  create mode 100644 package/daemonize/0001-configure-override-setpgrp-to-enable-cross-compiling.patch
>  create mode 100644 package/daemonize/Config.in
>  create mode 100644 package/daemonize/daemonize.hash
>  create mode 100644 package/daemonize/daemonize.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index f42cc01032..b335aa4dd8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2413,6 +2413,7 @@ menu "System tools"
>  	source "package/coreutils/Config.in"
>  	source "package/cpuload/Config.in"
>  	source "package/daemon/Config.in"
> +	source "package/daemonize/Config.in"

How does this program differ from the already existing daemon(1) we have
in Buildroot?  Are there programs that depend on it perhaps, or does it
offer more functionality than daemon(1)?

>  	source "package/dc3dd/Config.in"
>  	source "package/dcron/Config.in"
>  	source "package/ddrescue/Config.in"
> diff --git a/package/daemonize/0001-configure-override-setpgrp-to-enable-cross-compiling.patch b/package/daemonize/0001-configure-override-setpgrp-to-enable-cross-compiling.patch
> new file mode 100644
> index 0000000000..fd544f0441
> --- /dev/null
> +++ b/package/daemonize/0001-configure-override-setpgrp-to-enable-cross-compiling.patch
> @@ -0,0 +1,55 @@
> +From db172f4d7028c648f66f3c1db6202e6a5d62636d Mon Sep 17 00:00:00 2001
> +From: Christian Stewart <christian@paral.in>
> +Date: Sun, 24 Jan 2021 02:16:36 -0800
> +Subject: [PATCH] configure: override setpgrp to enable cross-compiling
> +
> +Signed-off-by: Christian Stewart <christian@paral.in>
> +---
> + configure | 30 +-----------------------------
> + 1 file changed, 1 insertion(+), 29 deletions(-)
> +
> +diff --git a/configure b/configure
> +index ab7c0d4..209e165 100755
> +--- a/configure
> ++++ b/configure
> +@@ -4147,36 +4147,8 @@ fi
> + 
> + { $as_echo "$as_me:${as_lineno-$LINENO}: checking whether setpgrp takes no argument" >&5
> + $as_echo_n "checking whether setpgrp takes no argument... " >&6; }
> +-if ${ac_cv_func_setpgrp_void+:} false; then :
> +-  $as_echo_n "(cached) " >&6
> +-else
> +-  if test "$cross_compiling" = yes; then :
> +-  as_fn_error $? "cannot check setpgrp when cross compiling" "$LINENO" 5
> +-else
> +-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> +-/* end confdefs.h.  */
> +-$ac_includes_default
> +-int
> +-main ()
> +-{
> +-/* If this system has a BSD-style setpgrp which takes arguments,
> +-  setpgrp(1, 1) will fail with ESRCH and return -1, in that case
> +-  exit successfully. */
> +-  return setpgrp (1,1) != -1;
> +-  ;
> +-  return 0;
> +-}
> +-_ACEOF
> +-if ac_fn_c_try_run "$LINENO"; then :
> +-  ac_cv_func_setpgrp_void=no
> +-else
> +-  ac_cv_func_setpgrp_void=yes
> +-fi
> +-rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext \
> +-  conftest.$ac_objext conftest.beam conftest.$ac_ext
> +-fi
> ++ac_cv_func_setpgrp_void=yes
> + 
> +-fi
> + { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_func_setpgrp_void" >&5
> + $as_echo "$ac_cv_func_setpgrp_void" >&6; }
> + if test $ac_cv_func_setpgrp_void = yes; then
> +-- 
> +2.30.0

We don't usually allow for patches in the tree that are not submitted
upstream, i.e. only backported patches.  However, issues like these are
usually better solved by instead overriding the autoconf cache value
(ac_cv_foo) from the .mk file.  There are lots of examples of this in
the tree, e.g. package/mtools/mtools.mk

> diff --git a/package/daemonize/Config.in b/package/daemonize/Config.in
> new file mode 100644
> index 0000000000..f7f3288d9a
> --- /dev/null
> +++ b/package/daemonize/Config.in
> @@ -0,0 +1,5 @@
> +menuconfig BR2_PACKAGE_DAEMONIZE
> +	bool "daemonize"
> +	help
> +	  Command line utility to run a daemon.
> +

Here would be a good place to mention any added value in this package,
as compared to BR2_PACKAGE_DAEMON.

> diff --git a/package/daemonize/daemonize.hash b/package/daemonize/daemonize.hash
> new file mode 100644
> index 0000000000..8bf58e96f4
> --- /dev/null
> +++ b/package/daemonize/daemonize.hash
> @@ -0,0 +1 @@
> +sha256  20c4fc9925371d1ddf1b57947f8fb93e2036eb9ccc3b43a1e3678ea8471c4c60  daemonize-1.7.8.tar.gz
> diff --git a/package/daemonize/daemonize.mk b/package/daemonize/daemonize.mk
> new file mode 100644
> index 0000000000..9a86ae95d5
> --- /dev/null
> +++ b/package/daemonize/daemonize.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# daemonize
> +#
> +################################################################################
> +
> +DAEMONIZE_VERSION = 1.7.8
> +DAEMONIZE_SITE = $(call github,bmc,daemonize,release-$(DAEMONIZE_VERSION))
> +DAEMONIZE_LICENSE = BSD-3-Clause
> +DAEMONIZE_LICENSE_FILES = LICENSE.md
> +
> +$(eval $(autotools-package))

Other than my comments above, the packaging looks fine to me.

Reviewed-by: Joachim Wiberg <troglobit@gmail.com>

Best regards
 /Joachim


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
