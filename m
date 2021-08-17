Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED7FC4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 21:04:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D368E60EE0
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 21:04:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D368E60EE0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E70160B92;
	Tue, 17 Aug 2021 21:04:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cO6pSqmyvINe; Tue, 17 Aug 2021 21:04:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20B1960B93;
	Tue, 17 Aug 2021 21:04:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE5A11BF2EB
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 21:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC324401DE
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 21:04:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GJDuBboo6HYN for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 21:04:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34A7D401B8
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 21:04:46 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id lo4so284440ejb.7
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 14:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4jOmiKZ4MYdmRWGsbt/vbjHJu3fgxmbjeKBmWtUdnMQ=;
 b=O46C/cXN6tDsQoEmsZL3tDiPJxo2DCdSg+qnseurHJ0+x4PTBotC6OXNAMvyK28tyS
 ahj+dDSFr554jiAJROkKqlGa4YEgBKPspsCPiJuknuCRo3xenGnrICVXVMBSkzXE6tnO
 XbJ120liQJv3b40UhQ2xbYNGj8BaNYdT/6XbjJz1LjNU0+BFiWcdF4MRx/5Nm0oyTLbh
 uGYiCp/wsIjlG3ioVtxJxm+EZgF/mYeyR3NNNNnHtFf0V9H+or29JPO8QY69xeDzXHuh
 Ku+4Z59P8T+N+5ppOq0lC0rIi6Tcvlu0q4A4gbZVmMYeRR23uhKCj6yR2cZRU3uOaaS9
 Xc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4jOmiKZ4MYdmRWGsbt/vbjHJu3fgxmbjeKBmWtUdnMQ=;
 b=qiu0gwvzIwUnGN1WaUmdDp+/0ki/l3tp5Wo8C09s4JRQmdlvWRXpK3/XKtUPtcB+5d
 Bv24uf1xN69Gjp5x0K284agrPsxHwZC1OxmqLtc79FrVemG9V17MxJMnNHrAa/amT8KH
 ED+ocyDY1jW9sCSWkDo8oeIE9m0fm95Oak+CiQvm8SdMSqi5uP4JcVhps1UHkhLSIxsQ
 pco/ax5cBro2piQQbawP3OaFOoguFKPl864VXdtmfmkI4i3+fIMpKKKdGfQqWatEfzmX
 s4GlbIjui+koPec1LUWxR9VRcJIK8zAsekvElNQTv61JmzatE2p/Bkl9DXiyBTRRvEvK
 4z7A==
X-Gm-Message-State: AOAM531ZIcf01qnZnoTUvwYBqmYaY4S2FQ2ZU2RWXgWGYLkzVq1+Grlw
 JUQ4l5YiDySPzNDnvFLZ2C3+PA==
X-Google-Smtp-Source: ABdhPJxMGiVAw0G7IvHYs8hBv95+zHGKKdqJgpnvMEsXx59Tv2tMa5Cb2REUi1bcDPYUjoDRQeV6Zw==
X-Received: by 2002:a17:906:5909:: with SMTP id
 h9mr5866069ejq.329.1629234284460; 
 Tue, 17 Aug 2021 14:04:44 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u23sm1541595edx.29.2021.08.17.14.04.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 14:04:44 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20210726235656.1df4ddeb@windsurf>
 <20210726223435.2906458-1-giulio.benetti@benettiengineering.com>
 <20210726223435.2906458-2-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <c5580997-9132-2baf-09e6-7c116f0b44f8@mind.be>
Date: Tue, 17 Aug 2021 23:04:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726223435.2906458-2-giulio.benetti@benettiengineering.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2 1/3] package/libgeos: fix build failure
 due to missing -mcmodel=large
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Michael Nosthoff <buildroot@heine.tech>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 27/07/2021 00:34, Giulio Benetti wrote:
> When building libgeos for or1k -mcmodel=large is needed to link, so let's
> add that gcc option in case we're building for or1k.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

 Applied to master, thanks.

 I've added a comment to the commit message to explain that this option is from
a Buildroot patch.

 I've also applied the second patch with the same comment.

 Regards,
 Arnout

> ---
>  package/libgeos/libgeos.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
> index a355732af8..43211d0434 100644
> --- a/package/libgeos/libgeos.mk
> +++ b/package/libgeos/libgeos.mk
> @@ -23,6 +23,10 @@ ifeq ($(BR2_arm)$(BR2_armeb),y)
>  LIBGEOS_CONF_OPTS += -DDISABLE_GEOS_INLINE=ON
>  endif
>  
> +ifeq ($(BR2_or1k),y)
> +LIBGEOS_CXXFLAGS += -mcmodel=large
> +endif
> +
>  LIBGEOS_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(LIBGEOS_CXXFLAGS)"
>  
>  $(eval $(cmake-package))
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
