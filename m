Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE2CC2D0D1
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 13:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D67CF81457;
	Mon, 24 Jun 2024 13:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AQZc-RPQ7vzv; Mon, 24 Jun 2024 13:42:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB0618144E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB0618144E;
	Mon, 24 Jun 2024 13:42:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 649C21BF479
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 13:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AA418144E
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 13:42:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rAxKosxGVdlU for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 13:42:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 28AC18144A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28AC18144A
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28AC18144A
 for <buildroot@busybox.net>; Mon, 24 Jun 2024 13:42:44 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3645e9839b3so3352515f8f.3
 for <buildroot@busybox.net>; Mon, 24 Jun 2024 06:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719236562; x=1719841362;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sS9w+YRYJFS2KdMMtseU3kbqhQzXvfCH3IcxG9IMMZ4=;
 b=F+cnTvjhjFyKYcbT871egYO/Bk6oisZLAN6sYYidsmkydsIl/9wKQK29f9FxPWg97C
 OS8dTAy9yV+uCXx2+VVFOwxe+J53biYcVVo3S8ghYaQ/e0OyZbBOzyGvXLJbHM9zwjMi
 HbtOQ8lWDYjOjiv9Lpg1Ll3DVH0eE5SHYr2tPekll5bnh7A2oBs97i6TgIjYpY4/IWkA
 0DvR6jGRnXyjp/4g1NHVWu8zfZJ8wsLVZ8ieAICynI3OwiRrcA5qbTaY93FSa18aQYKU
 bekxADeFeG8PMGVZxLpS2HwBZYhlijtL0brlJDF3AFaQ8p9vJaMKl4ibfLsvKg/WDZaZ
 YIoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5SyluwIdeWno79EJgf8/62iUV+2Qn3jvr3E7yEjaJOiJW0T9NKmWkQIHvZMu9QrjG92rxAADhKuBroQpbmVJ2Q5SGT+E=
X-Gm-Message-State: AOJu0YyMPX8MuO8FARZc7cOpyk6ctnqZrYN842reraJBHokpyl258Q2N
 1zaPwHaGg5d1drZLuJewtaCW0e3tmmHthKqIwQr4zH83PpU/C3H/Av10ZvZIw3M=
X-Google-Smtp-Source: AGHT+IEJYdophiDMF4/1krNmwxQegF3NqQKicuRZrAbB0f+RWfgocxmfrSRO/sZNmAY6mUqcp+6Ajg==
X-Received: by 2002:a05:6000:1ac7:b0:366:e838:f5d4 with SMTP id
 ffacd0b85a97d-366e8390b2dmr4241985f8f.3.1719236561919; 
 Mon, 24 Jun 2024 06:42:41 -0700 (PDT)
Received: from [10.1.0.155] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366383f6769sm10248313f8f.5.2024.06.24.06.42.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 06:42:41 -0700 (PDT)
Message-ID: <273443bc-cb50-44bf-bfb5-393e8cfbd3bd@mind.be>
Date: Mon, 24 Jun 2024 15:42:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Seiderer <ps.report@gmx.net>, buildroot@busybox.net
References: <20240612135727.11811-1-ps.report@gmx.net>
 <20240612135727.11811-2-ps.report@gmx.net>
Content-Language: en-GB
In-Reply-To: <20240612135727.11811-2-ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719236562; x=1719841362; darn=busybox.net;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sS9w+YRYJFS2KdMMtseU3kbqhQzXvfCH3IcxG9IMMZ4=;
 b=LNSGoirUKyUGTT41gqUm6E1cjUx7dVX8qkFrzIFUaJ3ez4DHtMqrNa8ITVi2dXqa4x
 khs39/5xU2bbhOs+azeBHyhlo8YQK5rpzi5cJ/9gchZ/6BznOwhKzgMdVkuQFujnLYgB
 eDCIunOsRZV8EK0G3gAohcU6bXvNe8odDgpYImGof2SkBDImee+FsUtenCZe+3Ry4AyX
 ii1U+x/Tqk6ODUfzQNUjgNIihbO20Ixubp7glcyh7+7T1/ajxyftdk+jTvKszBZlROTv
 uvilPizW8la6ImUpjhDc/8y1DXJrhoBUC+u93k8L46k9XSy4tL8meYEMZE9SmSIjGhOe
 mPdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LNSGoirU
Subject: Re: [Buildroot] [PATCH v2 2/5] package/xz: bump version to 5.6.2
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/06/2024 15:57, Peter Seiderer via buildroot wrote:
> - bump version to 5.6.2
> - add BSD-0-Clause and update license file hash accordingly (see [1], [2], [3],
>    [4], [5], [6], [7] and [8])

  As suggested by Julien, I added a statement to explain that this is not 
affected by the backdoor.

  Applied to master, thanks.

  Regards,
  Arnout

> 
> For details see [9].
> 
> [1] https://github.com/tukaani-project/xz/commit/b1ee6cf259bb49ce91abe9f622294524e37edf4c
> [2] https://github.com/tukaani-project/xz/commit/689e0228baeb95232430e90d628379db89583d71
> [3] https://github.com/tukaani-project/xz/commit/28ce45e38fbed4b5f54f2013e38dab47d22bf699
> [4] https://github.com/tukaani-project/xz/commit/17aa2e1a796d3f758802df29afc89dcf335db567
> [5] https://github.com/tukaani-project/xz/commit/bfd0c7c478e93a1911b845459549ff94587b6ea2
> [6] https://github.com/tukaani-project/xz/commit/fd7faa4c338a42a6a40e854b837d285ae2e8c609
> [7] https://github.com/tukaani-project/xz/commit/62733592a1cc6f0b41f46ef52e06d1a6fe1ff38a
> [8] https://github.com/tukaani-project/xz/commit/6bbec3bda02bf87d24fa095074456e723589921f
> [9] https://github.com/tukaani-project/xz/releases/tag/v5.6.2
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>    - bump version to first one after the backdoor incident
>    - omit homepage URL change (reverted upstream)
> 
> Notes:
>    - while searching the history, detected an previously/alterantive patch
>      for the initial version bump by Julien Olivain, see
>      http://lists.busybox.net/pipermail/buildroot/2024-February/371577.html
> ---
>   package/xz/xz.hash | 8 ++++----
>   package/xz/xz.mk   | 6 +++---
>   2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/xz/xz.hash b/package/xz/xz.hash
> index ff070f6775..6012e1001b 100644
> --- a/package/xz/xz.hash
> +++ b/package/xz/xz.hash
> @@ -1,11 +1,11 @@
>   # Locally calculated after checking pgp signature
> -# https://github.com/tukaani-project/xz/releases/download/v5.4.7/xz-5.4.7.tar.bz2.sig
> +# https://github.com/tukaani-project/xz/releases/download/v5.6.2/xz-5.6.2.tar.bz2.sig
>   # using key 3690C240CE51B4670D30AD1C38EE757D69184620 Lasse Collin <lasse.collin@tukaani.org>
> -
> -sha256  9976ed9cd0764e962d852d7d519ee1c3a7f87aca3b86e5d021a45650ba3ecb41  xz-5.4.7.tar.bz2
> +sha256  e12aa03cbd200597bd4ce11d97be2d09a6e6d39a9311ce72c91ac7deacde3171  xz-5.6.2.tar.bz2
>   
>   # Hash for license files
> -sha256  72d7ef9c98be319fd34ce88b45203b36d5936f9c49e82bf3198ffee5e0c7d87e  COPYING
> +sha256  ee3b35b82f7bb0ba5fd9f13ca34ebbe757a59c05bfde5ab9d50ff4188ed33396  COPYING
> +sha256  0b01625d853911cd0e2e088dcfb743261034a091bb379246cb25a14cc4c74bf1  COPYING.0BSD
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
>   sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING.GPLv3
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPLv2.1
> diff --git a/package/xz/xz.mk b/package/xz/xz.mk
> index d5dceb0eae..10590f6be8 100644
> --- a/package/xz/xz.mk
> +++ b/package/xz/xz.mk
> @@ -4,13 +4,13 @@
>   #
>   ################################################################################
>   
> -XZ_VERSION = 5.4.7
> +XZ_VERSION = 5.6.2
>   XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
>   XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
>   XZ_INSTALL_STAGING = YES
>   XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
> -XZ_LICENSE = Public Domain, GPL-2.0+, GPL-3.0+, LGPL-2.1+
> -XZ_LICENSE_FILES = COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
> +XZ_LICENSE = Public Domain, BSD-0-Clause, GPL-2.0+, GPL-3.0+, LGPL-2.1+
> +XZ_LICENSE_FILES = COPYING COPYING.0BSD COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
>   XZ_CPE_ID_VENDOR = tukaani
>   
>   ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
