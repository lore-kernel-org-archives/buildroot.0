Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47663C25B0E
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7E0360DE5;
	Mon, 15 Aug 2022 09:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7E0360DE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wVN0Am2Y8WnM; Mon, 15 Aug 2022 09:52:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D11C060AF7;
	Mon, 15 Aug 2022 09:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D11C060AF7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 84FDA1BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6081B60AF7
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6081B60AF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dzB3NjOBqwyE for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:51:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 991066068D
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 991066068D
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:51:57 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id k26so12662277ejx.5
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 02:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=y43JPOadUvqv495nPE6VtaZwJd1skBGbUZZrU70y0r4=;
 b=H7++XQ3hII+rWGBAhvVAiAbWd5ygZZ9NnrQpp9KO4RJH84JVp0Sy9/9HEoYWVfuXQD
 js1gOF8zLCstDQ1gHaAzQkroTSRB/S9EQr1wq3bCuu352MkF5+sFEKCSyrQIfvjqJNxt
 ncSSxYa/q5QHBSVH6lSnsMflxB9dewwpFLvxVz2HTYK6HqLRQkI0Lhh/5AkuR2jn+Zx+
 lMl8vTrDkZxSnlOg64NR832UFLlEsyzkViw8npZ34Uf9RLRQZobypDLWx6pelx7GyC+Q
 wqWyvYft/WkSLQlkulpj8aUKgs8AK7JuM5mRE5x+teWZV70BgTRccqV5CXxiEhNQtbql
 uz2g==
X-Gm-Message-State: ACgBeo0CyYCSt50p36fQ4fdSWpCf02RswUi0oYhfvr+runKu5hC/ye6p
 f149nxLZibmJgc3UUByXNTY=
X-Google-Smtp-Source: AA6agR4KKFyQSkMMvLY9PgFuJ/vficbEYtxpHr2r6NoVhPEIJW0vqiWWO7K9iz46SWKxHP43pdSQsw==
X-Received: by 2002:a17:907:10d1:b0:730:7c7d:3869 with SMTP id
 rv17-20020a17090710d100b007307c7d3869mr9646253ejb.356.1660557115654; 
 Mon, 15 Aug 2022 02:51:55 -0700 (PDT)
Received: from localhost (tmo-096-168.customers.d1-online.com. [80.187.96.168])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a170906094100b007307d099ed7sm3847779ejd.121.2022.08.15.02.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 02:51:55 -0700 (PDT)
Date: Mon, 15 Aug 2022 11:51:46 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Message-ID: <20220815115146.1649c229@tuxfamily.org>
In-Reply-To: <20220814233845.2247022-7-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
 <20220814233845.2247022-7-ricardo.martincoski@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 06/33] package/kvm-unit-tests: do not use
 "select...if SYMBOL=y"
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

Am Sun, 14 Aug 2022 20:38:18 -0300
schrieb Ricardo Martincoski <ricardo.martincoski@gmail.com>:

> All other occurrencies in the tree simply do:
> select SYMBOL1 if SYMBOL2
> instead of
> select SYMBOL1 if SYMBOL2=y
> 
> So do the same here for consistency.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
>  package/kvm-unit-tests/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
> index 7658877ce9..02ea8dd58c 100644
> --- a/package/kvm-unit-tests/Config.in
> +++ b/package/kvm-unit-tests/Config.in
> @@ -20,7 +20,7 @@ config BR2_PACKAGE_KVM_UNIT_TESTS
>  	# x86-64 we use the host gcc (see .mk file for details)
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 || !BR2_i386
>  	depends on BR2_HOSTARCH = "x86_64" || !BR2_x86_64
> -	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if BR2_x86_64=y
> +	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if BR2_x86_64
>  	help
>  	  kvm-unit-tests is a project as old as KVM. As its name
>  	  suggests, it's purpose is to provide unit tests for KVM. The

Reviewed-by: Thomas Huth <huth@tuxfamily.org>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
