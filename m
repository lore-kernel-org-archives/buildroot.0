Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EDCCD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 12:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76039608DF;
	Sun,  7 Apr 2024 12:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AkYW6nRpcVmQ; Sun,  7 Apr 2024 12:19:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CEAE608F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CEAE608F7;
	Sun,  7 Apr 2024 12:19:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB9091BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 12:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5B67608F7
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 12:19:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6CQ4pgfqASA for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 12:19:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B097E608DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B097E608DF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B097E608DF
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 12:19:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8B52113F8CE;
 Sun,  7 Apr 2024 14:19:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Apr 2024 14:19:00 +0200
Date: Sun, 7 Apr 2024 14:19:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZhKPNIPj5G0qUxNJ@landeda>
References: <20240407094935.562389-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240407094935.562389-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712492344;
 bh=nyFYEI/hQf/b8dF38pYtLEjltN+IvlOO0psQUFvD+sQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rnz0dimfAgverxi9KkF/0066vAUk2SDDXhn6aLeZ0goo0QcK++QsaX/pbsQ2H160T
 5ZnoWODaRfHe59amzi8X4iINXagzltRNsbD0pCm7B6bUq6tzge/qONjbxaezlihIBi
 c6Y143ksQ0PE0eGhinRoHG9s4DLLeHwHhsXXCQ4TSapkIJRP4ZOIBihsflDDbI3NQ4
 U1NfV0pjPY9gYwpLMQDZH2mkcpfh4hvhxD2FvoForn2qLq4WMsQrOHvH+XqvRWMwEZ
 421Ipm2Eh8DLUzTSraU8c5UUkURqnNBi6ABPLkJzgdo/Qlb9FbUbVsfgXIl/Juyxow
 WzIikuxK1ANOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Rnz0dimf
Subject: Re: [Buildroot] [PATCH 1/1] package/libcli: add libxcrypt optional
 dependency
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
Cc: Steve James <ste@junkomatic.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-04-07 11:49 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump of glibc to version
> 2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:
> 
> /home/autobuild/autobuild/instance-10/output-1/host/lib/gcc/nios2-buildroot-linux-gnu/12.3.0/../../../../nios2-buildroot-linux-gnu/bin/ld: cannot find -lcrypt: No such file or directory
> 
> Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
>  - http://autobuild.buildroot.org/results/3a5cc2a90d58f39a6c9f27ad87e0d54e705f0c84
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libcli/Config.in | 1 +
>  package/libcli/libcli.mk | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/libcli/Config.in b/package/libcli/Config.in
> index b2829cad3f..a5a8872d41 100644
> --- a/package/libcli/Config.in
> +++ b/package/libcli/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBCLI
>  	bool "libcli"
> +	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
>  	help
>  	  Libcli provides a shared library for including a Cisco-like
>  	  command-line interface into other software. It's a telnet
> diff --git a/package/libcli/libcli.mk b/package/libcli/libcli.mk
> index a18daa911c..f3f68f780a 100644
> --- a/package/libcli/libcli.mk
> +++ b/package/libcli/libcli.mk
> @@ -26,6 +26,10 @@ ifeq ($(BR2_STATIC_LIBS),y)
>  LIBCLI_MAKE_ARGS += DYNAMIC_LIB=
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
> +LIBCLI_DEPENDENCIES += libxcrypt
> +endif
> +
>  define LIBCLI_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
>  		$(LIBCLI_MAKE_ARGS)
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
