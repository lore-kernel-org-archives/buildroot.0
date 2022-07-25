Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44139C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 16:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE61E4161B;
	Mon, 25 Jul 2022 16:24:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE61E4161B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id StP4Ucz_iveH; Mon, 25 Jul 2022 16:24:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31CC64162D;
	Mon, 25 Jul 2022 16:24:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31CC64162D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 61E0E1BF215
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 16:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D75361B85
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 16:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D75361B85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oEK3mjQ1RBPN for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 16:24:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBA67610A7
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBA67610A7
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 16:24:25 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 ay11-20020a05600c1e0b00b003a3013da120so9748419wmb.5
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 09:24:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZHeUTrsVFzZBmwHOG1x7GYAuP6VL5/h8S4ejkYPLdpQ=;
 b=BJ7prl+Lqug+zMp9ket50XGS6tE20yv++V8lV3kRfk+lTkUR1Nmg1HFYKcGV/GvldI
 JsX5hzRMz/yqJckDyuboLIvoQEElla7YSZE4kKSdqWaiwRQTtkJctsK49CzfQXqtqF8W
 oRInsU0cdzz2eaiGFQw1b/2j04EF2qYAh29u6fONeA4FE0UiWPK6SbGs4xWmlQRgvXAz
 sS03yYeeoUXLljG4ziCqRuivgR1YkfjjaBGSZk9XpP6zuxcY5uexpaYqoEVnfFOQt6aG
 Tks7ATidrGJgwIzeVz0h03p/4cVZdTPSSm+meya5EYx7SyI5embo+FnpSbPoRytSvdp2
 Qmog==
X-Gm-Message-State: AJIora+lEXjb3QBODqRdoVK/dVVcp1veoAoBJ+jsN3L1sAa5fhH9Uz81
 ynQp/C9RUG5PtYJuK/Z+9Oae1SzwaqSA0w==
X-Google-Smtp-Source: AGRyM1vAc+Ggumbl7lxgPxZwOfcJdArYgcUB60d3qxDrCHHSphzZstfNQrJeREiUp8uVEB1uQO29mg==
X-Received: by 2002:a7b:c7d1:0:b0:3a3:1890:3495 with SMTP id
 z17-20020a7bc7d1000000b003a318903495mr21642399wmk.18.1658766263812; 
 Mon, 25 Jul 2022 09:24:23 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 f11-20020adfe90b000000b0021e43650e6asm12463750wrm.86.2022.07.25.09.24.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 09:24:23 -0700 (PDT)
Message-ID: <98d28576-4f8e-92a6-02b9-d200d21644b4@mind.be>
Date: Mon, 25 Jul 2022 18:24:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210904153735.1760686-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210904153735.1760686-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=ZHeUTrsVFzZBmwHOG1x7GYAuP6VL5/h8S4ejkYPLdpQ=;
 b=gO9qe56HgW72jn4UzOhqoMAcCRSjxd5nPVILYMflJ7Yj/2yb60cXxka9d8HAf3JC/V
 3PtF+GPtlRm7N4QU07Fpl7kpBoPbgOzDlQJNVibOhcE94AAtKY1/Zp3tocQ1P8sTFOMk
 MxLX1JeOQUKR+3yXLH1OgbVC1OOqq4YH3VZyMXrPsJGK/FIFz+WVCVZln45GhTkThjru
 +IkKS3esNyVY6ypUkfeAgTULPdWI+86IYa4ZgGo3vpN2kZ096N8wR/dldgjv2594s1K3
 vHjy5DKs4oH0cAS76lGdGJf+aDJmBYfaLcE1YR3QAqIKhn52aLvNoZLlnwQm3PI21Hh8
 fp0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gO9qe56H
Subject: Re: [Buildroot] [PATCH 1/1] package/luasyslog: fix build when host
 root directory is /usr
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/09/2021 17:37, Fabrice Fontaine wrote:
> Fix the following build failure when host root directory is /usr which
> is raised since bump to version 2.2.0 in commit
> caa32ac237909999eb6e0bd3616ef4440190970a:
> 
>   /usr/bin/install -c -m 644 syslog.lua '/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/target/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/usr/share/lua/5.3/logging'
> libtool: install: /usr/bin/install -c .libs/lsyslog.so /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/target/usr/lib/lua/5.3/lsyslog.so
> libtool: install: /usr/bin/install -c .libs/lsyslog.lai /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/target/usr/lib/lua/5.3/lsyslog.la
> libtool: warning: remember to run 'libtool --finish /usr/lib/lua/5.3'
> /usr/bin/make  install-exec-hook
> make[3]: Entering directory `/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/luasyslog-2.2.0'
> rm -f /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/target/usr/lib/lua/5.3/lsyslog.la
> make[3]: Leaving directory `/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/luasyslog-2.2.0'
> make[2]: Leaving directory `/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/luasyslog-2.2.0'
> make[1]: Leaving directory `/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/luasyslog-2.2.0'
> luasyslog: installs files in /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/target//usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1
> 
> This failure is raised because lua script directory is "found" and
> "fixed" to
> ${prefix}/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/usr/share/lua/5.3
> because of the following test in ax_lua.m4:
> 
>         dnl Try to find a path with the prefix.
>          _AX_LUA_FND_PRFX_PTH([$LUA], [$ax_lua_prefix], [package.path])
>          AS_IF([test "x$ax_lua_prefixed_path" != 'x'],
>          [ dnl Fix the prefix.
>            _ax_strip_prefix=`echo "$ax_lua_prefix" | sed 's|.|.|g'`
>            ax_cv_lua_luadir=`echo "$ax_lua_prefixed_path" | \
>              sed "s,^$_ax_strip_prefix,$LUA_PREFIX,"`
>          ])
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/09fa6dd9844d6d4694801ec59434dad7a56bf290
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  This one got a little bit snowed under...

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...uild-ax_lua.m4-fix-cross-compilation.patch | 45 +++++++++++++++++++
>   1 file changed, 45 insertions(+)
>   create mode 100644 package/luasyslog/0002-build-ax_lua.m4-fix-cross-compilation.patch
> 
> diff --git a/package/luasyslog/0002-build-ax_lua.m4-fix-cross-compilation.patch b/package/luasyslog/0002-build-ax_lua.m4-fix-cross-compilation.patch
> new file mode 100644
> index 0000000000..ac7c1d97e2
> --- /dev/null
> +++ b/package/luasyslog/0002-build-ax_lua.m4-fix-cross-compilation.patch
> @@ -0,0 +1,45 @@
> +From aed16d13d881492e8558f9da21be2dffc4ab2c33 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 4 Sep 2021 17:23:58 +0200
> +Subject: [PATCH] build/ax_lua.m4: fix cross-compilation
> +
> +Don't try to "find" and "fix" the script and module directories when
> +cross-compiling as this will give unexpected results such as using
> +${prefix}/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/usr/share/lua/5.3
> +instead of
> +${prefix}/share/lua/5.3
> +if the host machine root directory is /usr
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/09fa6dd9844d6d4694801ec59434dad7a56bf290
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + build/ax_lua.m4 | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/build/ax_lua.m4 b/build/ax_lua.m4
> +index 23ca774..7c25cfd 100644
> +--- a/build/ax_lua.m4
> ++++ b/build/ax_lua.m4
> +@@ -291,7 +291,7 @@ AC_DEFUN([AX_PROG_LUA],
> +
> +         dnl Try to find a path with the prefix.
> +         _AX_LUA_FND_PRFX_PTH([$LUA], [$ax_lua_prefix], [package.path])
> +-        AS_IF([test "x$ax_lua_prefixed_path" != 'x'],
> ++        AS_IF([test "x$ax_lua_prefixed_path" != 'x' && test "x$cross_compiling" != 'xyes'],
> +         [ dnl Fix the prefix.
> +           _ax_strip_prefix=`echo "$ax_lua_prefix" | sed 's|.|.|g'`
> +           ax_cv_lua_luadir=`echo "$ax_lua_prefixed_path" | \
> +@@ -318,7 +318,7 @@ AC_DEFUN([AX_PROG_LUA],
> +         dnl Try to find a path with the prefix.
> +         _AX_LUA_FND_PRFX_PTH([$LUA],
> +           [$ax_lua_exec_prefix], [package.cpathd])
> +-        AS_IF([test "x$ax_lua_prefixed_path" != 'x'],
> ++        AS_IF([test "x$ax_lua_prefixed_path" != 'x' && test "x$cross_compiling" != 'xyes'],
> +         [ dnl Fix the prefix.
> +           _ax_strip_prefix=`echo "$ax_lua_exec_prefix" | sed 's|.|.|g'`
> +           ax_cv_lua_luaexecdir=`echo "$ax_lua_prefixed_path" | \
> +--
> +2.32.0
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
