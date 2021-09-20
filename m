Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13988C433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:22:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAD9D610A0
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BAD9D610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FC2A60ACD;
	Mon, 20 Sep 2021 19:22:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m5vIgImB8e9x; Mon, 20 Sep 2021 19:22:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAF91608FA;
	Mon, 20 Sep 2021 19:22:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 966641BF955
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 921D9401B6
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:22:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fIng9wuoUhx5 for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 19:22:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B4304012E
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 19:22:29 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id eg28so42728663edb.1
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 12:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WsoMB18pJA6xPqxKBzPSQF7xt0r2YyzexSP8LiaE2F0=;
 b=U8jXQN+lSCUql8hnaCaWa7+nZynHwU+q7aASorQxONgugDjRr8knqp8126WToyULOE
 TzHlSdoXQgNyUIy6dcQHcm2yhN5mXmXID5VrXxHNi5icgEwRddY3FKr5WR5gMyIPPuLS
 z43J2QurpI8aq+pCYRv/njzie8vwfQ4d/U3kGaOJfmulHP+Z/SwROKESIhDcnVchTbX4
 OaeOvlMjwc5/LlnPnQZhFEtPUx73A/9u41mfuP3N8XOcWWYv1HhTY0LqAtR2IXzFTBmy
 12ZX0kyEygRaCBCCGOLYclnVEFIcvQs5Sq2wGSO5IuqJjQPEbeI+WYFuRVAo/wF08nuE
 EKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WsoMB18pJA6xPqxKBzPSQF7xt0r2YyzexSP8LiaE2F0=;
 b=vDkJjluLLIexHO2165Wz0tekrZ8hZ9K7LNU4L0wp2dbbTNkqmt4TW+gBifpmV8BttU
 nby2LkPFIFL8TzMItBzBqu2Aimg0PyQluMRByVSn+W2WgOLfK1HrcrhvajRDUusqyPfc
 /8hbkMUVE0WCDgmQ23FsQhUkSDTp5eDzQKBeUnW4+jARjtItZURAWXZqIrSBV6/D14I7
 Fnfqbt6BJFE0qam+LwGyY5MqN+gZX5eAiSpZjx+zpGFiKuvYn9jDIOlJzGm7gVHQ6oeO
 vyEYpLXEapMhFccJtObrl+wQ1Wo/ywFXAP8BmoiSHU8znbf8PTzIh+hK+JeX9yqoKkRF
 IYgA==
X-Gm-Message-State: AOAM532kvl1yTLXPjvtORs0JMrHfy9FamDpVcDh8YLIFgwmgEMiXm9t4
 p4mxXFkH5EkfALaGhQ0FAZrLWQ==
X-Google-Smtp-Source: ABdhPJyraS81TZpczY8LTc1ZGvldJFP5xCDX8eew+gdSFRh0wB62/vz/zvXFry/becrPlmmxgJDdwQ==
X-Received: by 2002:a17:906:2505:: with SMTP id
 i5mr30038359ejb.450.1632165748219; 
 Mon, 20 Sep 2021 12:22:28 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id k15sm6383652ejb.92.2021.09.20.12.22.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 12:22:27 -0700 (PDT)
Message-ID: <46f94abf-34f1-3b12-6e32-79b9b57dd4aa@mind.be>
Date: Mon, 20 Sep 2021 21:22:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210908202752.925823-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210908202752.925823-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gupnp: bump to version 1.3.1
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
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 08/09/2021 22:27, Fabrice Fontaine wrote:
> https://gitlab.gnome.org/GNOME/gupnp/-/blob/gupnp-1.3.1/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gupnp/gupnp.hash | 4 ++--
>   package/gupnp/gupnp.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
> index d7868b99b9..9eb1eb467b 100644
> --- a/package/gupnp/gupnp.hash
> +++ b/package/gupnp/gupnp.hash
> @@ -1,5 +1,5 @@
> -# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.3/gupnp-1.3.0.sha256sum:
> -sha256  df8279293aae45ea6bb6de1b13bf1988285c8f2f4f25569fb0d79325a8471666  gupnp-1.3.0.tar.xz
> +# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.3/gupnp-1.3.1.sha256sum:
> +sha256  df70fe8321bfc53cadb6860edcff2e0dc456ec81899b463f41723684803d1408  gupnp-1.3.1.tar.xz
>   
>   # Hash for license file:
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
> index 421d12d3d2..bbba9ecf32 100644
> --- a/package/gupnp/gupnp.mk
> +++ b/package/gupnp/gupnp.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   GUPNP_VERSION_MAJOR = 1.3
> -GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).0
> +GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).1
>   GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
>   GUPNP_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp/$(GUPNP_VERSION_MAJOR)
>   GUPNP_LICENSE = LGPL-2.1+
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
