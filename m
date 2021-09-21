Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D50D5C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:38:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A819C61186
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A819C61186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8092460ECD;
	Tue, 21 Sep 2021 20:38:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WijZTlOkvjKI; Tue, 21 Sep 2021 20:38:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E72A260ABF;
	Tue, 21 Sep 2021 20:38:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 99F911BF47E
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96BEC82EAD
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:38:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QlyjxjLU39mS for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 20:38:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D964282D49
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:38:20 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id v22so1070567edd.11
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 13:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=gr+2197gPsULo73mKHpzC0ECnu+8n3kvxSAd77+oBtE=;
 b=eVRx5WrzFEr9bJloAel8M5GqS0Xxj+/57a18afCOYicsOcGgDMKWU/dsxT/ursPdoj
 58I15/xBF/NeZ/YS4x8iptBbu2v3Ox4OhFOS8VX+BQcmZC9JCDfnQ7u+IV1oSx6i/j4y
 QGtq62WJopY3dOhe4ASY33gFUFYu8rOdG7u2D1Sr0YNt4ZjjgItQxl0iuUW742Uf00aW
 RTnP4uxwSSntTyxpAt2RN5AA7/urlYv2YGMJzG52eFjreEfbpsSrCodbqXj0pAbRcNk3
 EV8T4oXFhQgZKhgHVNl9texg2ZsBYaLUNuXhnL0gMjVPXyGT/G/qx45P+ZG/Ho2QNCyb
 6Rwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=gr+2197gPsULo73mKHpzC0ECnu+8n3kvxSAd77+oBtE=;
 b=LFq66BwFzxGn2o+IATjSF4K5F8fwwayp7DTCppDXtDbFc4sYQSfEFJgX+cVHnrtlkT
 gRYBOXMX5B/5tHQR/1M1B7rmqoh+iUUT1KVcMd6dolVAmTqK1jmRnVB9B8Aw5G0G85rv
 LwFlbPIfogf6wCmRHuUEnF+RV5fRyi+b38pHmT1ZFqlgPRYdutcIn+J0mqbD3Ls0lr5s
 O/WLRVljS0A7BDYNMrkUQfmwPiZQQlv3eI8mQMFuFPepR9CNfcI4h3rf2sa+V6jnZ6mF
 NqbUoNVhH0ZSir64gB/ev2tGVaKbg/PG1XOUSnKdWOkzabiym8FywqfPGyDBzOBw+eGF
 D2cw==
X-Gm-Message-State: AOAM53336uOb9cFhned+DGtIOF6Gilwxnc7Len8fA8giZ9s/pFpyMQnz
 L+28oRTuL0pjot+x7z1IKkmr4x3pKbA3lQ==
X-Google-Smtp-Source: ABdhPJyA9pA4AAL0ybPGR/iqaJBdPCnyiBKA153Fxo1QO5HpaKw+pMNZfiREdB/Ml80PAZeVUyKGxg==
X-Received: by 2002:a50:e0c7:: with SMTP id j7mr12372520edl.245.1632256699005; 
 Tue, 21 Sep 2021 13:38:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ml12sm6481ejb.29.2021.09.21.13.38.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 13:38:18 -0700 (PDT)
Message-ID: <00bb9a07-faac-c8f3-000f-73c7c203cd75@mind.be>
Date: Tue, 21 Sep 2021 22:38:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20210912204741.995864-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210912204741.995864-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: add option to enable
 media-session support
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



On 12/09/2021 22:47, James Hilliard wrote:
> The example media-session pipewire session manager requires
> pipewire to be built with examples enabled, add support for
> enabling this while depending on examples being enabled.
> 
> To simplify adding support for additional session managers in
> the future such as wireplumber we pass a comma separated list
> to the -Dsession-managers meson config option. This also will
> ensure that systemd services that depend on media-session are
> only installed if media-session support is enabled.

  Very nice approach!

  Applied to master, thanks.

  Regards,
  Arnout

> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/pipewire/Config.in   | 6 ++++++
>   package/pipewire/pipewire.mk | 6 ++++++
>   2 files changed, 12 insertions(+)
> 
> diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
> index b15bbfa8d3..506b85e856 100644
> --- a/package/pipewire/Config.in
> +++ b/package/pipewire/Config.in
> @@ -19,6 +19,12 @@ config BR2_PACKAGE_PIPEWIRE_EXAMPLES
>   	help
>   	  Build pipewire examples
>   
> +config BR2_PACKAGE_PIPEWIRE_MEDIA_SESSION
> +	bool "pipewire media-session"
> +	depends on BR2_PACKAGE_PIPEWIRE_EXAMPLES
> +	help
> +	  Build pipewire media-session support
> +
>   config BR2_PACKAGE_PIPEWIRE_GSTREAMER
>   	bool "pipewire gstreamer plugins"
>   	depends on BR2_USE_WCHAR # libglib2
> diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
> index e4ea60c39c..f4f7f487cb 100644
> --- a/package/pipewire/pipewire.mk
> +++ b/package/pipewire/pipewire.mk
> @@ -150,4 +150,10 @@ else
>   PIPEWIRE_CONF_OPTS += -Decho-cancel-webrtc=disabled
>   endif
>   
> +ifeq ($(BR2_PACKAGE_PIPEWIRE_MEDIA_SESSION),y)
> +PIPEWIRE_SESSION_MANAGERS_LIST = media-session
> +endif
> +
> +PIPEWIRE_CONF_OPTS += -Dsession-managers='$(subst $(space),$(comma),$(PIPEWIRE_SESSION_MANAGERS_LIST))'
> +
>   $(eval $(meson-package))
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
