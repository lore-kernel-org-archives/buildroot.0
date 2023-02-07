Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C26C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 15:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2DD581318;
	Tue,  7 Feb 2023 15:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2DD581318
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hNDvJ43m41WB; Tue,  7 Feb 2023 15:06:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EAA681306;
	Tue,  7 Feb 2023 15:06:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EAA681306
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 96B2C1BF275
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 15:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 701F560B8B
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 15:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 701F560B8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 67ZrQRlSYG6G for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 15:06:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D4B660AE9
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D4B660AE9
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 15:06:20 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id h16so13830921wrz.12
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 07:06:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PDaZXQYGGfABleIoBjn5AJqYCMmMKPezxoasKjlhUwU=;
 b=jGdE2emquk0B65zWnvNQoeP6MEbVMDfaPy/+mLaHkMp35UdEvfvQ5jsgH8j6TY10RU
 EeDTPcje+lmnSSz8ZFSluowf1+xMakLeALqRCl1soD8VpR0CYcSEbMBZlq+BfKM7xIo7
 Z/fMwN8tRLE37oNdXiSut2C5MNhNUN9tZy9wl/d/XCDM9YSK8ZjvJrewOoiLaeELLL4a
 xC0FdykYDocWRcpcfesgQqmsMWwE0BgaB6HXEdAbiBglaEmalOHhfRROumokGYt+WJcW
 zbQnE7DJG6GoFHM5+M+Q8WSqEQasazgmpWc3Nto28yTWPmmvJqcyh35Eox2PoaIL2405
 7oUw==
X-Gm-Message-State: AO0yUKW+x3LllT1bpXA+z2Y+g7z9cLNiVAbiykFHuC6oT0s0WBEh0XLE
 UvtxY6Pk+o3s2XAA3dsD6TN5yvSR8XAriLDy
X-Google-Smtp-Source: AK7set/Qqe2o0i/CWR07usdmkjyhJQs0gdqnhfBYHPGXjH060zU2m9VxHSCIDNvBt2iJO9DXUETsXg==
X-Received: by 2002:a5d:4149:0:b0:2bf:dd84:adf6 with SMTP id
 c9-20020a5d4149000000b002bfdd84adf6mr2943259wrq.60.1675782378433; 
 Tue, 07 Feb 2023 07:06:18 -0800 (PST)
Received: from [192.168.16.188] (cpe1150018.bra.be.verixi.net. [85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a5d6085000000b0029100e8dedasm11321510wrt.28.2023.02.07.07.06.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 07:06:17 -0800 (PST)
Message-ID: <f365639e-6baf-a8f9-5e89-4d02de2843ed@mind.be>
Date: Tue, 7 Feb 2023 16:06:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 buildroot <buildroot@buildroot.org>, Peter Korsgaard <peter@korsgaard.com>,
 Michael Fischer <mf@go-sys.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220420170326.1901572-1-Jason@zx2c4.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220420170326.1901572-1-Jason@zx2c4.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PDaZXQYGGfABleIoBjn5AJqYCMmMKPezxoasKjlhUwU=;
 b=HiPQ/t6M/i40IKbywmLZCNAjV57MsFdgUyJNzZxHT9iguX/Zn7QtfsxXhwi6Zmcv9h
 bmbRB1hESgG2lc7fK8TS1yUW03vJUww38F3Olt0URp9diWaT0o9IKznfumEfMbm6xwLZ
 CpcZsPo+jgSG8V2+ZR13rxta7QiHkA++XDU0J5nJU+RIcJJ97AlNOBOX7rfbCghyqDuz
 nj2Ryck27Idu9a2UU0scBr44434tMmKtlymSlc/zPaBURZ9UaTLhiUO+kRzVNf9R/gAO
 LHvpXhLuLvuuQeV+ewGiqwODcPDeccz+IbHye2IoUCWbnRkEndOioTp1k+tGgvTm5bqP
 Whow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HiPQ/t6M
Subject: Re: [Buildroot] [PATCH v5] package/urandom-scripts: actually credit
 seed files via seedrng
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



On 20/04/2022 19:03, Jason A. Donenfeld wrote:
> The RNG can't actually be seeded from a shell script, due to the
> reliance on ioctls. For this reason, Busybox now contains SeedRNG, a
> tiny program meant to be called at startup and shutdown (and at
> arbitrary other points in between if desired).
> 
> Since this is currently in Busybox's git tree, this commit adds it as a
> patch to the Busybox package. Then, it wires the init script up to call
> it.
> 
> This is a significant improvement over the current init script, which
> doesn't credit entropy and whose hashing in shell scripts is sort of
> fragile.
> 
> NOTE NOTE NOTE: While I've added the patch to the Busybox package
> directory, I don't really know how to wire this up and what to do about
> the various config entries. I was hoping that a Buildroot maintainer
> might have a better idea of the best way to do this, and could just take
> this patch as a starting point for whatever the real commit winds up
> being.
> 
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

  Applied to master, after some reworking and heavily rewriting the commit 
message, thanks.

     package/urandom-scripts: actually credit seed files via seedrng

     The RNG can't actually be seeded from a shell script, due to the
     reliance on ioctls. For this reason, Busybox 1.36.0 contains SeedRNG, a
     tiny program meant to be called at startup and shutdown (and at
     arbitrary other points in between if desired). Note that initially,
     the way seedrng was included in busybox broke things quite severely, but
     now it's been reverted to a reasonably acceptable version.

     This is a significant improvement over the current init script, which
     doesn't credit entropy and whose hashing in shell scripts is sort of
     fragile.

     Because seedrng is part of busybox, urandom-scripts now depends on
     BR2_PACKAGE_BUSYBOX. This can be removed again if later we add a
     standalone seedrng package.

     Add a decent explanation to the init script about the need for a
     persistent directory to make this actually work.

     Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
     [Arnout:
      - Remove busybox patch, it's now part of busybox 1.36.0.
      - Depend on busybox.
      - Fix shellcheck errors.
      - Use DAEMON and SEEDRNG_ARGS.
      - Don't bother with "seed_dir" and "skip_credit" variables.
      - Rename to S20seedrng.
     ]
     Signed-off-by: Arnout Vandecappelle <arnout@mind.be>


  Regards,
  Arnout

> ---
> Changes v4->v5:
> - SeedRNG is now part of Busybox, so we don't need to carry the source
>    in-tree here, which was the primary objection to earlier versions.
> 
>   ...eedRNG-utility-for-kernel-RNG-seed-f.patch | 309 ++++++++++++++++++
>   package/urandom-scripts/Config.in             |   4 -
>   package/urandom-scripts/S20urandom            |  78 ++---
>   3 files changed, 330 insertions(+), 61 deletions(-)
>   create mode 100644 package/busybox/0003-seedrng-import-SeedRNG-utility-for-kernel-RNG-seed-f.patch
> 
[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
