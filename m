Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E189C2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 07:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE37D41A1C;
	Wed,  3 Jul 2024 07:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ABfSSGOordBP; Wed,  3 Jul 2024 07:08:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7F7A41A44
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7F7A41A44;
	Wed,  3 Jul 2024 07:08:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A15DF1BF980
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 07:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F15581FDA
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 07:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M6QZ6ZnYr7Uk for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 07:08:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 61F7981FA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61F7981FA6
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61F7981FA6
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 07:08:41 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ee794ec014so13571341fa.0
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 00:08:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719990519; x=1720595319;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CLVVnKLY+w7D0UGqHEZ3Hn+KZavVGO2qqu8toSgyUzY=;
 b=Dlok9YuC/qTDBDrxXI2cHd15WKfItiwNsTGiT8h3lf5J8TEsaXDsLI7M2Jh4A7z65Z
 rpf8qEV7LIJOm/64rVF9wbyEp6DaXz9J5QmsnDddtEP8s2V1WF4WvR7GzxxJOg7Tfkia
 Pd4Lb5xMFlpCntsuZ9lTqTSTkg3tDg83FAkUCeTQXwaqObu+aTY2JUKx3Hf9Au5F/0sY
 1SoEeOoyqbNp8sNLZZHgo6j/wVDhtlVj2QFAyP3NtAdHhmgRr78tQmw/KGoq12MkF/F8
 IlJbRvlGk8JDx42fHyCfuspARnkv0v5RxdIba+sImqnKCe51dyZxmE03isYlBYysDm+M
 zQyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlspAGOJUc/kptSk8joQ4jXDHah0CZ0BYV7rzmFbjG0arLeCJwXVKUzX8D7DIsR3PWVRogFWioub53PiURRyWOmXQVtt5cPA==
X-Gm-Message-State: AOJu0Yy1keP39DmxsRDtEms7ZmFxClZ1Qm4Cow8qePM9Ic6FYnak/bN8
 FrfAl0wZWPzRN3f9v0xJ/d3plzsYUhtm1s1g+8oY+HXyef/pTLjp9kOWCc/iCKHbnaBSnJ/MyUQ
 D
X-Google-Smtp-Source: AGHT+IEqVoGFC1QgiBXikgtKSfasUYAVqK8OoGNcNRjb1rurTzO6SJg6fl0hB7YGg+i707noXtfxdw==
X-Received: by 2002:a2e:bcc1:0:b0:2ee:6b86:b098 with SMTP id
 38308e7fff4ca-2ee6b86b263mr63164201fa.8.1719990518954; 
 Wed, 03 Jul 2024 00:08:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4257c4e10d6sm154472465e9.30.2024.07.03.00.08.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 00:08:38 -0700 (PDT)
Message-ID: <c6940b68-5fc2-4f4a-bccd-c654f510a3ce@mind.be>
Date: Wed, 3 Jul 2024 09:08:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20240701194846.3032793-1-giulio.benetti@benettiengineering.com>
Content-Language: en-GB
In-Reply-To: <20240701194846.3032793-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719990519; x=1720595319; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CLVVnKLY+w7D0UGqHEZ3Hn+KZavVGO2qqu8toSgyUzY=;
 b=CXaKYSH6aht8q1EQ2Ayu33mjN5AB/3s77mBRQNYUgTO4IWgAhXQcfLi29SgpjupxwV
 ZZlvALmQer7geJOj3rfdyhNffACSibj0QIgaeI5Mno0MVlOpFU6CI+PKITuaofNcApOR
 Bxi7jnx5ans0+6sNS3A71mxqdYyhQ5U2dAJ3hBsXfAVO8uMpXPQyzBX0I/bW2zgeTX2m
 u2vle6xqb4dnxezDKv6f+285UgCH/DdwLcK4vInLouq2bPljDIYK3rl+sISLC20tWOm+
 eVeyDhozy2SDLFVcOt6AX7PqimSr6VJf90VZ7CHVcWZahM08kHMQLr7wOd7fNhEbO/sh
 cuwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CXaKYSH6
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump to version 9.0.0
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

  Hi Giulio,

On 01/07/2024 21:48, Giulio Benetti wrote:
> Since the major release changed all the packages that have direct
> dependency to harfbuzz have been succesfully built:
> - efl
> - libass
> - mupdf
> - pango
> - qt5base
> - qt5webengine
> - qt6base
> - sdl2_ttf
> - supertuxkart
> - vlc
> - webkitgtk
> - wpewebkit
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/harfbuzz/harfbuzz.hash | 2 +-
>   package/harfbuzz/harfbuzz.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

  Doesn't apply cleanly to master, can you have a look?

  Regards,
  Arnout

> 
> diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
> index d5fc1ae096..fa4ee16a9f 100644
> --- a/package/harfbuzz/harfbuzz.hash
> +++ b/package/harfbuzz/harfbuzz.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  77e4f7f98f3d86bf8788b53e6832fb96279956e1c3961988ea3d4b7ca41ddc27  harfbuzz-8.5.0.tar.xz
> +sha256  a41b272ceeb920c57263ec851604542d9ec85ee3030506d94662067c7b6ab89e  harfbuzz-9.0.0.tar.xz
>   sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
> diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
> index 3beac5e836..946b2b0f70 100644
> --- a/package/harfbuzz/harfbuzz.mk
> +++ b/package/harfbuzz/harfbuzz.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -HARFBUZZ_VERSION = 8.5.0
> +HARFBUZZ_VERSION = 9.0.0
>   HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
>   HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
>   HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
