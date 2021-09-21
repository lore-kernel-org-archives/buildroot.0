Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36641C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:16:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B14AE6126A
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B14AE6126A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C37A406D2;
	Tue, 21 Sep 2021 19:16:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qC7CwkGUOLrZ; Tue, 21 Sep 2021 19:16:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8D1B406CC;
	Tue, 21 Sep 2021 19:16:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 406381BF578
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CD60406CC
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:16:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8bvWFGBl9AZQ for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 19:16:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F0EA40694
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 19:16:15 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id g8so406549edt.7
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 12:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=y6pFD2ltMKnNfveeeSvFmYz+lfOOmZlDfigLdMNKggk=;
 b=QD3RfIzMyY1pdZKzbUQTG/2sloomFTv70IYqvkrCt7v/UWi69EraUf7d4WEFlCHtF5
 liL9F7MK4OtH3N28BnAOVS6U2ZNWKPby8kf6zVlP56TFI1UIpgYLO0EetjdaRWh5TPwI
 dfvYYilbddfe0k/yRTD42eKvJiOP4VjRdTuzRoNQjr5DWlQfx1PqF1Z5u/cj322/S994
 SGqFJcRTSjqmIa/t0TURhtMe7wwVTxkyhizfm3LTGbSkdOSRF8U6UAoof5VdYwQyGAki
 9UqwwqfqXyPLsH9xCiDGHFSHjhdhXHJ9Ldq09rWeWjAND17WTRgCUiOSJk5p3NsoI5hH
 b1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=y6pFD2ltMKnNfveeeSvFmYz+lfOOmZlDfigLdMNKggk=;
 b=FUXF+v6ZuwUQC6SYDfegVrDt9xWIFIPWD1egDuGbVZON+rD3+L7lRMjiR7o4fe9+jU
 Uj97C+jK97V5TY2Fv30NvLNGf7IOrWS1ZIZKt7tSiTQc3pRShhkqxJe2R85i7VyVISBf
 ND2qEO3SM1e35GpHF/62GBUVeGJ2AyFNC0jenynRfqewiT57LLJr9bKZote7NWSgMtxX
 ZMTncFDLZNKqPd4GnZxAcUdQBMHW9NBZrqXQ91Tu+gUugp3cwQYF7ciLQkFGO6WOPv/d
 JDECjYdeFuT9d4ZZ2E6G3i1cYBKRwQqBcm0HPr1i0SiU0ho8vLp1keF/n1MjYPt8DhcS
 aXQQ==
X-Gm-Message-State: AOAM533rfTSxTrX/dUb9AjsekG/qfkYwX6PeQXWxfObRpzlDZmuXUt8F
 OednxZmBb/oFj/UARMAsp1/X6g==
X-Google-Smtp-Source: ABdhPJwVz/ilNBCzAxZcc3W6al5wKGdjN5NrIxqEcvTBAi0hEFphcAVC7FpnnnJ+K1aHZbt3fpGDpg==
X-Received: by 2002:a17:906:6b0c:: with SMTP id
 q12mr37012430ejr.0.1632251773548; 
 Tue, 21 Sep 2021 12:16:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u19sm6326501edv.40.2021.09.21.12.16.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 12:16:13 -0700 (PDT)
Message-ID: <5df6e2ea-4fab-f0cf-b43c-a57f3dbd2c1d@mind.be>
Date: Tue, 21 Sep 2021 21:16:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
References: <20210910081030.518977-1-marcus.folkesson@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210910081030.518977-1-marcus.folkesson@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/libostree: bump to version 2021.4
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 10/09/2021 10:10, Marcus Folkesson wrote:
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libostree/libostree.hash | 2 +-
>   package/libostree/libostree.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
> index 928e4fbe1b..f281e1593c 100644
> --- a/package/libostree/libostree.hash
> +++ b/package/libostree/libostree.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  0fa5a39f0c3e58c2040133e4229cb28660c61b978cd4a2a3d2f6e97ef4c8d0b3  libostree-2021.3.tar.xz
> +sha256  db5ce01a1606af3466ec77236700f53a63ce20e4984a549d0eaba3f66a3d9361  libostree-2021.4.tar.xz
>   sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
> diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
> index 94ea08664a..b202b54d85 100644
> --- a/package/libostree/libostree.mk
> +++ b/package/libostree/libostree.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBOSTREE_VERSION = 2021.3
> +LIBOSTREE_VERSION = 2021.4
>   LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
>   LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
>   
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
