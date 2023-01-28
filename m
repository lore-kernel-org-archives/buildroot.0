Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98893C38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 06:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F98F822BE;
	Sat, 28 Jan 2023 06:31:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F98F822BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kJOu7JM7u9Ba; Sat, 28 Jan 2023 06:31:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7229382049;
	Sat, 28 Jan 2023 06:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7229382049
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC4D61BF424
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 06:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 865AE40117
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 06:31:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 865AE40117
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KMGyUUJ21pB9 for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 06:31:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86892400BB
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86892400BB
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 06:31:53 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id m12so6532457edq.5
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 22:31:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FxAdmG2xp4FC9lYxmqVFoo/sxwdZw/7xzxhbEl/g1Q8=;
 b=Zr9z2qrLh+RUmZzCMAMWYKNlSWoZl3sbGIw4TyKZ+wCW+6+lkMNpOsxc46fPGQYwUR
 piEvTjbGqdMycpcRlWnlpDXsU5pr3P0+t7nEIO27EOM4r4cQXz7hEYXLHZM6xMg+IpG7
 TdVWI4zTlyrf8BpWSnlxc+mU/x1IHCFDqDH9AKZZfiy3Qr606JV6gfxcbpYswdKFYftk
 uyH7+gyClznHyWRtT6cOO0/velbdhgELqR1XkmY1Es43R0foVWHy0lyq29mlezOMsb74
 pLLEzjpev/ilIp8tegHGaCzuVr1bgfo5b8Hev3EvWrZYDHN8VNrTLzmlCdSTl+hEs4Cu
 hJXg==
X-Gm-Message-State: AO0yUKV/vCbDB8ppGkztfMZa3HkVJL17YvgUKD6Wo4xqP0GuCnhOPfqY
 3bZhnjlsjSSGriPs0q7LPaif382jl8U=
X-Google-Smtp-Source: AK7set8so+SfK2jyIvSpUSyAk/CPBZSqzWspPBw7eGdKvik+/5X1hStVovKSsU37pUAYKenRRH8WZA==
X-Received: by 2002:a05:6402:1946:b0:4a0:bb2e:3af0 with SMTP id
 f6-20020a056402194600b004a0bb2e3af0mr10704181edz.1.1674887511791; 
 Fri, 27 Jan 2023 22:31:51 -0800 (PST)
Received: from localhost (tmo-064-101.customers.d1-online.com. [80.187.64.101])
 by smtp.gmail.com with ESMTPSA id
 dm23-20020a05640222d700b0049eea46c909sm3524978edb.37.2023.01.27.22.31.50
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 22:31:51 -0800 (PST)
Date: Sat, 28 Jan 2023 07:31:46 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: buildroot@buildroot.org
Message-ID: <20230128073146.513031cc@tuxfamily.org>
In-Reply-To: <20230108165438.1250779-2-laurent@vivier.eu>
References: <20230108165438.1250779-1-laurent@vivier.eu>
 <20230108165438.1250779-2-laurent@vivier.eu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v8 1/3] package: add petitboot
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

Am Sun,  8 Jan 2023 17:54:36 +0100
schrieb Laurent Vivier <laurent@vivier.eu>:

> from https://github.com/glevand/petitboot--buildroot
> 
> Updated to work with m68k architecture rather than PlayStation3
> (focused on qemu-system-m68k virt machine)
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
...
> diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
> new file mode 100644
> index 000000000000..fdcb26ccc924
> --- /dev/null
> +++ b/package/petitboot/Config.in
> @@ -0,0 +1,23 @@
> +config BR2_PACKAGE_PETITBOOT
> +	bool "petitboot"
> +	# petitboot needs udev /dev management
> +	depends on BR2_PACKAGE_HAS_UDEV
> +	select BR2_PACKAGE_ELFUTILS
> +	select BR2_PACKAGE_LVM2
> +	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_NCURSES_TARGET_PANEL
> +	select BR2_PACKAGE_NCURSES_TARGET_FORM
> +	select BR2_PACKAGE_NCURSES_TARGET_MENU
> +	# run-time dependency only
> +	select BR2_PACKAGE_KEXEC_LITE if !BR2_PACKAGE_KEXEC
> +	# run-time dependency only
> +	select BR2_PACKAGE_POWERPC_UTILS if (( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le ) && ! BR2_PACKAGE_PS3_UTILS )
> +	# run-time dependency only
> +	select BR2_PACKAGE_NVME if (( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le ) && ! BR2_PACKAGE_PS3_UTILS )

BR2_PACKAGE_PS3_UTILS does not exist in upstream buildroot ...
so unless you are planning to submit that package, too, I think
it would be better to remove the " && ! BR2_PACKAGE_PS3_UTILS"
part in above two lines?

 Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
