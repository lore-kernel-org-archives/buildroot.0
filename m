Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B47FC43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 22:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D0936115E;
	Mon, 25 Jul 2022 22:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D0936115E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ugcSjya_eh5Q; Mon, 25 Jul 2022 22:21:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A27C660D4D;
	Mon, 25 Jul 2022 22:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A27C660D4D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 53F381BF363
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B28140545
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B28140545
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O3KsuN8nzpHr for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 22:21:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 371D14017A
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 371D14017A
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 22:21:54 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id h8so17826773wrw.1
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=mM1kM+c9ySiW70PGFyn/v2et1W9YHVIH5F1+Hc45dW8=;
 b=z6I3I5wN/OOSaVlIWHG5lOPaB5AALQc73ns2fOWKZhl/+oiyapskXWToXN7iZzdLZ7
 vjpeueKGLaOux/K3mNnmd0VPrYo90OrD/8LZot2ifuWUfwn4CeyRqwXvppTsE+IoG6wM
 jQ9qkwonBkK1yJcZcausfG5rolO9V6H3bBjI/AymqiZv4yloTrL1k9rhK6rFBTRWXsDD
 UxpfS904lPv7IWevenXL4VKdA+pFBqn9fAk6HNGgvyxsaj2WWqfZzqWehcyZz5lJCo1w
 BtJu5G9TrirzUkMNTSvwUzwp64HVvu5Z6QzEkSnNsoL/rAv3VC0yVwZ0lKTY0wr0ySAq
 nTdg==
X-Gm-Message-State: AJIora9Zel7gdC6d3Oudmnt/L69YqKTHcpIrkLg25oGdZEg0aQchDjgl
 inRY6zUW+fF4ByCxJ7wLuEHQTm65rYEjPA==
X-Google-Smtp-Source: AGRyM1toxSkoxZdepV0nnzcKpSTMMo24MaY9XznZ8zYcKdZOdxOarcTeYR8UlybCBu+95y35qy1XUw==
X-Received: by 2002:a5d:490c:0:b0:21e:9c15:f677 with SMTP id
 x12-20020a5d490c000000b0021e9c15f677mr611342wrq.696.1658787712236; 
 Mon, 25 Jul 2022 15:21:52 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 a9-20020adfeec9000000b0021dfacfdf0dsm13238348wrp.33.2022.07.25.15.21.51
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 15:21:51 -0700 (PDT)
Message-ID: <f6e23db7-e49a-c228-1b43-4eaf745a4224@mind.be>
Date: Tue, 26 Jul 2022 00:21:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
References: <20220725203942.F2D3885DAB@busybox.osuosl.org>
Organization: Essensium/Mind
In-Reply-To: <20220725203942.F2D3885DAB@busybox.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=mM1kM+c9ySiW70PGFyn/v2et1W9YHVIH5F1+Hc45dW8=;
 b=LdCSQ8rHg3h0reVDFB3LZuQiBV511X8+JkrzxGtlPNFETZ58VMUgw13wY/8mkKTmHk
 LFZ/M7l+q86ddCBMEGjvRaYm6g3YQw3stEYBd5p7TVJuZCe3/8tIZgPaHzuJ3xGi1+BF
 hznIiwdsylIufzuPbcJjLtty/uXXbbEJJVWlEZvoiW44uE6OZejsEBdSmrqwBb8TL+fn
 xy4JCku9NHVdobe3T+oo9+U5gDBaRuDgcbkhLkS9Mowl/4WmnHZSuujbrXsac1O+5wki
 4Cinhi5VSqjOu//6FWD7w7l01hdZW1iym+NRSbK3jxqQGZhQmnAdpLtUsi8hfU5IY1jN
 KpEg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LdCSQ8rH
Subject: Re: [Buildroot] [git commit] package/beaglev-ddrinit: update to
 latest 8d6318
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



On 25/07/2022 22:52, Arnout Vandecappelle (Essensium/Mind) wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=fdd0260d4b5802f1d57832b29b8621cb9ecaf1cf
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Update to latest "master" version:
> 
> 8d6318acfe71e790c983b34448c9abfcfcec3ed8
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   boot/beaglev-ddrinit/beaglev-ddrinit.hash | 2 +-
>   boot/beaglev-ddrinit/beaglev-ddrinit.mk   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/boot/beaglev-ddrinit/beaglev-ddrinit.hash b/boot/beaglev-ddrinit/beaglev-ddrinit.hash
> index 2aaab53a3b..d4235904d1 100644
> --- a/boot/beaglev-ddrinit/beaglev-ddrinit.hash
> +++ b/boot/beaglev-ddrinit/beaglev-ddrinit.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  2d491f64bd77de9dfd4b8ae6c00e83670e80c205cc20917fefa6194b1dc1fe4e  beaglev-ddrinit-c0839f25246d9e308c23498d344ca13d8a7ad6ed.tar.gz
> +sha256  08a49355f89fc2cb4f5101183339c9c6f86b722545d0abbc319aab26a511dad7  beaglev-ddrinit-8d6318acfe71e790c983b34448c9abfcfcec3ed8.tar.gz
>   sha256  284d26192537710910ec1f112ec5f4c981601ae23702391986d6ce0b8ba90813  LICENSE
> diff --git a/boot/beaglev-ddrinit/beaglev-ddrinit.mk b/boot/beaglev-ddrinit/beaglev-ddrinit.mk
> index 76406ed4c5..d9707de610 100644
> --- a/boot/beaglev-ddrinit/beaglev-ddrinit.mk
> +++ b/boot/beaglev-ddrinit/beaglev-ddrinit.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   # Commit on the 'starfive' branch
> -BEAGLEV_DDRINIT_VERSION = c0839f25246d9e308c23498d344ca13d8a7ad6ed
> +BEAGLEV_DDRINIT_VERSION = 8d6318acfe71e790c983b34448c9abfcfcec3ed8
>   BEAGLEV_DDRINIT_SITE = $(call github,starfive-tech,beagle_ddrinit,$(BEAGLEV_DDRINIT_VERSION))
>   BEAGLEV_DDRINIT_INSTALL_TARGET = NO
>   BEAGLEV_DDRINIT_INSTALL_IMAGES = YES
> @@ -15,7 +15,7 @@ BEAGLEV_DDRINIT_LICENSE_FILES = LICENSE
>   
>   define BEAGLEV_DDRINIT_BUILD_CMDS
>   	$(MAKE) -C $(@D)/build \
> -		CROSSCOMPILE=$(HOST_DIR)/bin/riscv64-unknown-elf- \
> +		CROSS_COMPILE=$(HOST_DIR)/bin/riscv64-unknown-elf- \
>   		SUFFIX=buildroot \
>   		GIT_VERSION=$(BEAGLEV_DDRINIT_VERSION)
>   endef
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
