Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440B9C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 18:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDAC481CA3;
	Sun,  5 Nov 2023 18:30:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDAC481CA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PgnSdY36p6eW; Sun,  5 Nov 2023 18:30:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1828981CAD;
	Sun,  5 Nov 2023 18:30:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1828981CAD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B3A31BF4D6
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40EA641685
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40EA641685
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2fvzXK_JIUcR for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 18:30:33 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 053364150E
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 18:30:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 053364150E
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-543c3756521so6073170a12.2
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 10:30:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699209031; x=1699813831;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gFequVO6IshE6Q2xIL6To95b14zdR0A/QlwukSTH06I=;
 b=YfUAjfovGuPEVDd4vQj8XsWQ72u5o+Dj0pRDEv7Q/MywsIJZnC7zusGf4a0N1WHdib
 QdRr8RkurAOGNSHtS9ngpJTRefcER9szuvyXEThppZzX8H2fAxn04ehDSWqjk6mdGy6h
 /VdjpoEiYfw7iIFCgAUWU9mD672n1nOgMlHBqVlHQnhkZmUbsb5VcBJKLKmhy1K7Beq7
 YGYR9G7AuDgNZieb4ks2Yid6tgIb4Nr3TMt8WiRJ8I3iacXX/KBGCiejGU2f+vQrEim8
 ODFfiPOZWnThIrNxWIpCb1szhyi/hW1jPO/RXlxAIoEcpB5NBgNmBP7flXNWkwFiHZxE
 YCSw==
X-Gm-Message-State: AOJu0YxW+7o0oZO3GclJ4J6nL033JcpCG54kiMp9T/QJK43cr97c0H4C
 SJIbxigKkmS9QAbts6wacdyvNg==
X-Google-Smtp-Source: AGHT+IGrG8L2GnaSmpOljEqZR5akdTBlG9tIts1yPBlU93XfNvz4lvWG1MJep93s//sbAKQJnO+Qvw==
X-Received: by 2002:a17:907:2d93:b0:9c3:7510:e522 with SMTP id
 gt19-20020a1709072d9300b009c37510e522mr11003361ejc.63.1699209030975; 
 Sun, 05 Nov 2023 10:30:30 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 jw24-20020a17090776b800b0098e78ff1a87sm3260231ejc.120.2023.11.05.10.30.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Nov 2023 10:30:30 -0800 (PST)
Message-ID: <e2f95788-7508-45c7-94d7-664b2ee68d37@mind.be>
Date: Sun, 5 Nov 2023 19:30:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Reza Arbab <arbab@linux.ibm.com>, buildroot@buildroot.org
References: <20231009151729.2223963-1-arbab@linux.ibm.com>
 <20231009151729.2223963-9-arbab@linux.ibm.com>
In-Reply-To: <20231009151729.2223963-9-arbab@linux.ibm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699209031; x=1699813831; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gFequVO6IshE6Q2xIL6To95b14zdR0A/QlwukSTH06I=;
 b=Js4MJTC91tKQ0yq8XUfLYtkkyDuotBobnMyxuzPrFbrNxrRoiHS0cV3u8aqgQJ+bhU
 zDeMuXVV/7UIj4hFY38bmropEmh6H7drdaSSx4NWLdAVbYnMvwK24emExB7FY+U8F1Zg
 0U6a6m7FcJNVJZw0u1IX2t4KeFAtme2WgrEA7fhbTwn3jw8XAcGrEoaedH0rLzcRYmdZ
 lj9ZbxZmm6csw7sH/IZen1049ybSPt6pQO9OL2VPbhRd1rP4gEaCgomOxP+ROe7yIh8I
 iCovxjoVc49pVuprws6NJgiw4fu96EMYV1a+tEoxjERnzshNi5ptT6LiHRBuxPaKtVRj
 ufnw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Js4MJTC9
Subject: Re: [Buildroot] [PATCH v3 8/8] package/petitboot: prefer UTF-8
 support
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
Cc: Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/10/2023 17:17, Reza Arbab wrote:
> The petitboot UI looks much nicer in a Unicode locale:
> 
> * Items in the language selection submenu use multibyte Unicode
>    characters. In other locales, they say "Unable to display text in this
>    locale".
> 
> * The combination of TERM=linux with a UTF-8 locale is required to
>    trigger a special-case workaround in ncurses code[1]. Without
>    this, line-drawing characters in the menu look like q's.
> 
> Add a reminder that a UTF-8 locale should be generated for things to
> look right. Assume C.UTF-8 by default, allowing $LANG to be overridden
> (by /etc/default/petitboot or otherwise) if something else is desired.

  So, this improves things, but they're not really necessary. I think it's 
better then to just put in the help text that it looks better with UTF-8 locale 
enabled.

> 
> [1] https://invisible-island.net/ncurses/ncurses.faq.html#no_line_drawing
> 
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
> ---
>   package/petitboot/Config.in      | 8 ++++++--
>   package/petitboot/S15pb-discover | 1 +
>   package/petitboot/pb-console     | 1 +
>   package/petitboot/shell_profile  | 3 +++
>   4 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
> index 0f965e71e628..a449ed87872c 100644
> --- a/package/petitboot/Config.in
> +++ b/package/petitboot/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_PETITBOOT
>   	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS
>   	depends on BR2_USE_MMU # lvm2
>   	depends on BR2_USE_WCHAR # elfutils
> +	depends on BR2_ENABLE_LOCALE
>   	depends on !BR2_STATIC_LIBS # elfutils, lvm2
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils, lvm2
>   	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
> @@ -11,6 +12,7 @@ config BR2_PACKAGE_PETITBOOT
>   	select BR2_PACKAGE_ELFUTILS
>   	select BR2_PACKAGE_LVM2 # devmapper
>   	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_NCURSES_WCHAR
>   	# run-time dependencies
>   	select BR2_PACKAGE_KEXEC if !BR2_PACKAGE_KEXEC_LITE
>   	select BR2_PACKAGE_KEXEC_LITE if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
> @@ -20,12 +22,14 @@ config BR2_PACKAGE_PETITBOOT
>   	help
>   	  Petitboot is a small kexec-based bootloader
>   
> +	  NOTE: petitboot needs a working UTF-8 locale (BR2_GENERATE_LOCALE)
> +
>   	  http://www.kernel.org/pub/linux/kernel/people/geoff/petitboot/petitboot.html
>   
> -comment "petitboot needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, udev /dev management"
> +comment "petitboot needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library, threads, udev /dev management"
>   	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS
>   	depends on BR2_USE_MMU
> -	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
> +	depends on !BR2_USE_WCHAR || !BR2_ENABLE_LOCALE || BR2_STATIC_LIBS || \
>   		!BR2_TOOLCHAIN_HAS_THREADS || \
>   		!(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC) || \
>   		!BR2_PACKAGE_HAS_UDEV
> diff --git a/package/petitboot/S15pb-discover b/package/petitboot/S15pb-discover
> index a37e33521f1a..15b428ce0e42 100644
> --- a/package/petitboot/S15pb-discover
> +++ b/package/petitboot/S15pb-discover
> @@ -15,6 +15,7 @@ start() {
>   	# shellcheck disable=SC2174 # only apply -m to deepest dir
>   	mkdir -p -m 0775 /var/log/petitboot
>   	chown root:petitgroup /var/log/petitboot
> +	export LANG="${LANG:-C.UTF-8}"

  I think it's better to rely on the default locale being set to C.UTF-8. Hm, it 
seems we don't actually set a default locale though... Perhaps we should add a 
system menu entry to do exactly that. Though I'm not sure if it's even possible 
with uClibc (glibc has /etc/locale.conf).

  Regards,
  Arnout

>   
>   	# shellcheck disable=SC2086 # we need the word splitting
>   	start-stop-daemon -S -q -b -m -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
> diff --git a/package/petitboot/pb-console b/package/petitboot/pb-console
> index eea40163d02f..55e5462f0457 100644
> --- a/package/petitboot/pb-console
> +++ b/package/petitboot/pb-console
> @@ -13,6 +13,7 @@ start() {
>   	# shellcheck disable=SC2174 # only apply -m to deepest dir
>   	mkdir -p -m 0775 /var/log/petitboot
>   	chown root:petitgroup /var/log/petitboot
> +	export LANG="${LANG:-C.UTF-8}"
>   
>   	# shellcheck disable=SC2086 # we need the word splitting
>   	start-stop-daemon -S -q -x "/usr/libexec/petitboot/$DAEMON" \
> diff --git a/package/petitboot/shell_profile b/package/petitboot/shell_profile
> index 1ca5e6364dba..6bbe49e6d113 100644
> --- a/package/petitboot/shell_profile
> +++ b/package/petitboot/shell_profile
> @@ -1,2 +1,5 @@
> +[ -r "/etc/default/petitboot" ] && . "/etc/default/petitboot"
>   export ENV="/home/petituser/.shrc"
> +export LANG="${LANG:-C.UTF-8}"
> +
>   exec /usr/libexec/petitboot/pb-console
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
