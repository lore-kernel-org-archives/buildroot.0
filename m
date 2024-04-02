Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6BBC6FD1F
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 19:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8FDD400C1;
	Tue,  2 Apr 2024 19:45:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YiuhCeQFiVx2; Tue,  2 Apr 2024 19:45:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8C204012F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8C204012F;
	Tue,  2 Apr 2024 19:45:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B770E1BF369
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 19:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0486407DD
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 19:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cTvAbvAO6bXk for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 19:45:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1FDF340772
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FDF340772
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1FDF340772
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 19:45:28 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-415446af364so1319725e9.0
 for <buildroot@buildroot.org>; Tue, 02 Apr 2024 12:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712087126; x=1712691926;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=edl3jS936fvatMhq5ItkXpQ3cAvCuMYlJX4yLSvqPBs=;
 b=Gwexwicy4yd11V4vYGaQoInnEhQ2RDGed3I3ovNggh1kPFyRcORq63tDzswoybF7jE
 sjtrSC/3/BmJG9wDBooKcrX43f2QQHpUBHTtT7ae3YReK+SidJyJKcDi83qs2vwn0Eg0
 KqUVC8sEWTjgkCRqLJ/sZ5KHy5zi96IA0ncqsK4ZbU/fZIlG0qF4JDPrcYB0FZxf2nDW
 nGR1QKyezsCAsIoJ3lyvh9sO0Bzotu+e6Cs0mhQxpRgpGHtnnMDueY4EIkGKwYW1bxZV
 Z2Npcgtsec3nJOF4qv7S8iMnmrV3iIifUvN1M4LSBT/1a8ZTPnYxCPVKdl3CI0lZgrE/
 dbzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0cAWtPSZiXY9GkXo9dTF2hWgA8HomTvB7aQnEVIgGs1lXBLWi6fevzAnTOhELOFBqFzGhoC2m4za8B/dMOVMA9M/MG66JqA==
X-Gm-Message-State: AOJu0Yy5GplZCfLwbhNHWGbf1eLoJSroCU4mqepVv9hoHbV/zAqV+sPc
 Cs1p6t/6mtVetVJEfD1kRStaOjrI4xZke7BnVoljvWhIgCOd6cB6S9L3WFlNooTSc42PLrhvKxF
 a
X-Google-Smtp-Source: AGHT+IFljLGrwmsRXXFjoD5XOp5rHuZ0ZS3NIjvNwmb7BpqRpnhp+kIstiYNSx/nQRkorYIe5QEMnw==
X-Received: by 2002:a5d:44d0:0:b0:343:49a7:3b03 with SMTP id
 z16-20020a5d44d0000000b0034349a73b03mr386022wrr.32.1712087126441; 
 Tue, 02 Apr 2024 12:45:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 u22-20020a05600c139600b004148d7b889asm22201370wmf.8.2024.04.02.12.45.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 12:45:25 -0700 (PDT)
Message-ID: <a65e0f54-9de6-44c5-b8aa-4bf366b3273d@mind.be>
Date: Tue, 2 Apr 2024 21:45:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
References: <20240213204240.105047-1-thomas@devoogdt.com>
Content-Language: en-GB
In-Reply-To: <20240213204240.105047-1-thomas@devoogdt.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712087126; x=1712691926; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=edl3jS936fvatMhq5ItkXpQ3cAvCuMYlJX4yLSvqPBs=;
 b=eB/9G05X0T1XsRpMgS6+Z/BU5k6DPT1aIMZrizZz2Kp9UNbpQzOXXhSWz4dv3LogPX
 G/5tvHR9p54oN62y8wXvKFyiVcGgGfGYoDIhbMiC3q7ehX3GliFRoX0T8SYhCHobKsQt
 9jDkclYJmvgW9sCC7wqkSsO8njyhI8fZ5bRCVKt6EgoZ8iOpQz5SbpZcR3nOCQWdqTIx
 BOEke0xbq8y8bsv6hDsz6prVCH06XPHHyYWgj5lPr23aV84bMeaYlpbNB3Vu9MeY9WMz
 t1EqoUXFairFQXrGFT3bprxu1WXsmVfAD5+EOhkIvTjoAH0XMLk8S/Lxso9J8zlnG4rq
 bGgg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eB/9G05X
Subject: Re: [Buildroot] [PATCH v2] package/wayland-protocols: bump to 1.33
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



On 13/02/2024 21:42, Thomas Devoogdt wrote:
> Announce:
>    https://lists.freedesktop.org/archives/wayland-devel/2024-January/043400.html
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> v2: fix wrong announce version in git message
> ---
>   package/wayland-protocols/wayland-protocols.hash | 6 +++---
>   package/wayland-protocols/wayland-protocols.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
> index d039cd6fba..58c432e365 100644
> --- a/package/wayland-protocols/wayland-protocols.hash
> +++ b/package/wayland-protocols/wayland-protocols.hash
> @@ -1,4 +1,4 @@
> -# From https://lists.freedesktop.org/archives/wayland-devel/2023-July/042836.html
> -sha256  7459799d340c8296b695ef857c07ddef24c5a09b09ab6a74f7b92640d2b1ba11  wayland-protocols-1.32.tar.xz
> -sha512  90bbd52daf342b98823ddeed04e349ae242d2eaf925ab8d603cceb36c980c83b5681bb890961e0d49584cb5c2e60a33abf8821770c6ab87956383630bd5b7966  wayland-protocols-1.32.tar.xz
> +# From https://lists.freedesktop.org/archives/wayland-devel/2024-January/043400.html
> +sha256  94f0c50b090d6e61a03f62048467b19abbe851be4e11ae7b36f65f8b98c3963a  wayland-protocols-1.33.tar.xz
> +sha512  4584f6ac86367655f9db5d0c0ed0681efa31e73f984e4b620fbe5317df21790927f4f5317ecbbc194ac31eaf88caebc431bcc52c23d9dc0098c71de3cb4a9fef  wayland-protocols-1.33.tar.xz
>   sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
> diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
> index 2cfaa830e5..50a08d1988 100644
> --- a/package/wayland-protocols/wayland-protocols.mk
> +++ b/package/wayland-protocols/wayland-protocols.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -WAYLAND_PROTOCOLS_VERSION = 1.32
> +WAYLAND_PROTOCOLS_VERSION = 1.33
>   WAYLAND_PROTOCOLS_SITE = https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/$(WAYLAND_PROTOCOLS_VERSION)/downloads
>   WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
>   WAYLAND_PROTOCOLS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
