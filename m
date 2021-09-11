Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC409C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 18:57:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84360610A3
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 18:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84360610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B6C54028D;
	Sat, 11 Sep 2021 18:57:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hsncpBZkBVrU; Sat, 11 Sep 2021 18:57:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61170401B0;
	Sat, 11 Sep 2021 18:57:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46DF11BF2C2
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 18:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43D0840526
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 18:57:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pz00AtX1tYh3 for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 18:57:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9096B404FD
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 18:57:46 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id n27so11391858eja.5
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 11:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h+t0QJqFomz/9lcmaA9FdFoLRAgwz6/7Kyp8D2E5ItE=;
 b=PC0kEcmnPzUWZVLz++w6+2T6QJrMarGeVlPTCvI4oDVG1nmK3cHq7go0nGsLRGlReV
 hTKA+ucypgYl9Vazhip3JnfK1xentxfj3A9s5RiBU2vWritw+ODQja4LrqoDtN5z/07g
 0+xpETAkldA8QSIJlla8L0gONLuLwFbnsbXSzrkQkBQznuqn+U00EOAmXPFWgwxvaCDv
 9tDTrU+UipFxivOGxbkpEgAFTDEm4uRsd/4q5a+BrqPbZiji09gVAQ3S9tMyFcPlpUdm
 GET5/EvUqsQlWX9i9ABvX39TlgFCi+keVBuMN50BH89EJGauLqZzpJSCoed5gf8UFP4x
 lQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=h+t0QJqFomz/9lcmaA9FdFoLRAgwz6/7Kyp8D2E5ItE=;
 b=GgOtxworw2s+3vQvaiRRqGa2xey/M53/lGf15N3RKqdwUnd6eouVBjOtIrJS7Ja/rf
 rBVY56jkFNvMqxXbumfDd++uVcdzyCVv4MM5ugjPVH0V79prPJPQ3ZOI2kVQNpbAPCmL
 9zJZyWPaKhyiSFh8Wb8SmJ69TywY4pV4g6+vFdLyif48NsWgdrSl0utluxF/MPyYy6kj
 Hibb9jiCUzn75g8h/H8l1EZZUzalUk/GKNT6VrZyonOcVUIFRPeQo5EdiFIKCenNAAyd
 /P44glfpZUu6qg3QnJbLeWQ4OGhdjU2y6lk5U+zyQFeA2ooTmfm8ftpAUyNgi9jgl3G/
 /9Ng==
X-Gm-Message-State: AOAM5306A7ukv5xUvaNhlnkkobDpr/FUjG/PdlwQudkP/rxNTXEqWs/x
 Rz0U8hXwLPo8riqvj/YNht2N25doQ4VFHw==
X-Google-Smtp-Source: ABdhPJxX3a1OTeulgEyI6NiL6TjxgVnZoVYWoELr4k5p0Zu9eqbwGSqX19LCcD/ndAklPub7MrP9mA==
X-Received: by 2002:a17:907:76b0:: with SMTP id
 jw16mr4080630ejc.193.1631386664696; 
 Sat, 11 Sep 2021 11:57:44 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id br21sm812690ejb.112.2021.09.11.11.57.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 11:57:44 -0700 (PDT)
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20210903103924.2907009-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <ad0eee15-2378-12e3-2ac5-81e28491e6ef@mind.be>
Date: Sat, 11 Sep 2021 20:57:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210903103924.2907009-1-james.hilliard1@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: bump to version 249.4
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 03/09/2021 12:39, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/systemd/systemd.hash | 2 +-
>  package/systemd/systemd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
> index b419dce445..baab5304e6 100644
> --- a/package/systemd/systemd.hash
> +++ b/package/systemd/systemd.hash
> @@ -1,5 +1,5 @@
>  # sha256 locally computed
> -sha256  69ca802ff87e316a216f4bf5e5fd787dd9810c8c8c5076917ee817e52bd6c3a9  systemd-249.1.tar.gz
> +sha256  f3df809bbe777fcb5ffe2b29aaf6f871de764ef22706940960f88b8a850e9278  systemd-249.4.tar.gz
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
>  sha256  f5645b4b846479859d6618fa7a5a1722681aa7fc43c1e45f8bf8e1fe5738d618  README
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 8bfd407f81..5a76f2f246 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SYSTEMD_VERSION = 249.1
> +SYSTEMD_VERSION = 249.4
>  SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
>  SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README), BSD-3-Clause (tools/chromiumos)
>  SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README tools/chromiumos/LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
