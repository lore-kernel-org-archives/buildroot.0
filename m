Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE11DCD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 08:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91382404EE;
	Sun,  7 Apr 2024 08:52:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bhSv1Oc5eIoz; Sun,  7 Apr 2024 08:52:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95DCA405D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95DCA405D5;
	Sun,  7 Apr 2024 08:52:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 346EC1BF57C
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 08:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21C71605EC
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 08:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kmoSMJN517n5 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 08:52:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 25C9D605E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25C9D605E8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 25C9D605E8
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 08:52:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6620113F8AE;
 Sun,  7 Apr 2024 10:52:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Apr 2024 10:52:49 +0200
Date: Sun, 7 Apr 2024 10:52:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZhJe4XNcXLFkvHCQ@landeda>
References: <20240404204241.1784136-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240404204241.1784136-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712479971;
 bh=tPxcUBi0cUnF82yplGwqxnOcvtnrzRWSNeJBGto2JZM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LFPpJcDz/ICztCBJTTu5ZHBdpPuze62gMo+DnsDwZ6Ss/DjsC6M8PdDAVwNcE+tKq
 HPSQdfFemIrFhuxzEdtf5+NBg3u5wKeaMbxqmBuTxDmdFBecAB/B8YnpOczfQSRRWT
 rRYxT+sz2Kybb9UOzDtdiOpkIezIJOZemOEQSKE+Vt7ZiyQXLtUG5328f4+1/He/UB
 SyNWLgXTaoDmQ3gUXnjw1t76II2AbN2AqfERhEr8SkHXcu/LDG0TqPLSLpQGGo3j7L
 Vpp8szZBkxXJN+R+vYnuwGN+AVZOQ3HNmgXycRRy5QGzBXaS+wbkhpq7qxRmIABQsP
 DCK+9hhyXpZpQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LFPpJcDz
Subject: Re: [Buildroot] [PATCH 1/1] package/dante: add libxcrypt optional
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-04-04 22:42 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump of glibc to version
> 2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:
> 
> /home/autobuild/autobuild/instance-5/output-1/per-package/dante/host/bin/../lib/gcc/sparc64-buildroot-linux-gnu/12.3.0/../../../../sparc64-buildroot-linux-gnu/bin/ld: auth_password.o: in function `passwordcheck':
> /home/autobuild/autobuild/instance-5/output-1/build/dante-1.4.3/sockd/auth_password.c:126:(.text+0xc4): undefined reference to `crypt'
> 
> Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
>  - http://autobuild.buildroot.org/results/c817caa1e9ad91a1c0f61d92f24d35612cc3a5d5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/dante/Config.in | 1 +
>  package/dante/dante.mk  | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/dante/Config.in b/package/dante/Config.in
> index 41a89990d2..bd0ddb236d 100644
> --- a/package/dante/Config.in
> +++ b/package/dante/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_DANTE
>  	bool "dante"
>  	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
>  	help
>  	  Dante is a product developed by Inferno Nettverk A/S. It
>  	  consists of a SOCKS server and a SOCKS client, implementing
> diff --git a/package/dante/dante.mk b/package/dante/dante.mk
> index ae60252bed..bae46c5a71 100644
> --- a/package/dante/dante.mk
> +++ b/package/dante/dante.mk
> @@ -22,6 +22,10 @@ else
>  DANTE_CONF_OPTS += --without-upnp
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
> +DANTE_DEPENDENCIES += libxcrypt
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
>  DANTE_DEPENDENCIES += linux-pam
>  DANTE_CONF_OPTS += --with-pam
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
