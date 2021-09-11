Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD1A3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:54:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E8236113A
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E8236113A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0207A60807;
	Sat, 11 Sep 2021 14:54:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SJrpSmyg91gq; Sat, 11 Sep 2021 14:54:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47108607F9;
	Sat, 11 Sep 2021 14:54:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 84ACF1BF834
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 711924025E
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:54:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dBRUpGx37DkN for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 14:54:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3843540142
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:54:18 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id kt8so10499030ejb.13
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 07:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=59+9m+LIUT8qzNkmhUA4MYQ8MDEpPku7I98/Bwd+lKI=;
 b=XlqeiDwyREVJK4oySULbfVznA2Y2UAN0ZUOld9Qfn9mF+w9C46r6Jj2IOqoG6gdDtr
 YqrcwBKi1rVOi57uFyJBZWI1GjukDVm9I3b1g7IFz8cK8sUJ2M89Q+QrIMnALd17NmMx
 E9yALC/YkhqIjjdsttKL5qFnN3Zv2hv+4xV+XRy14R2dK67AzXjdWln6uh9gvz0XjZ6P
 fkI4tI+U3YqVqQkK/bYHLm2tfAicp1KfQoX0QZ9SjHfpva7WeMRAxvliXDXVH4Uxl4gP
 FxFlUnXQGryjJhQb6qSqCw6aDSstI2L6jK4mwe8mWfeZyfJxXSDZdk+kJfKBB8Tyz51U
 5Ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=59+9m+LIUT8qzNkmhUA4MYQ8MDEpPku7I98/Bwd+lKI=;
 b=2vzYmkh36rMoNXxNFE4duX6BV3y+qaGgj6Zeu4Lmi1bcYLazgNN6cH7h/5KuoO1Hnn
 sZr14Udv0jS9rKpPbTcz3Pq9cTasqRCjM8gW8Yuwav055N3Kv4JqqGxbwVmjKBlpEdQu
 2IcNaYbbXExNsrn1SVNlfzbzo9lEU0CVFoeoM71LQBU5QHfPAsN5rQXKZoWOsayZh2Gc
 FoQBVMbATWWxNkcSGXqAzuhW+MW8yab5rZZxJ7SOtlHJAR9H7DdJ2bmjL9adr4BDfJvj
 qGtgGJoxfDFOxyhLoV2s83/AxwiIax1uLRZVpvMFW1J0+RLHn3q2smt9jQ0lFp+yaGps
 2NDA==
X-Gm-Message-State: AOAM5322TAaHLvF8YU5PkLTs+4ADK8ylpDd2q6GzrIZaujUQR09FGsVY
 SuPlKR8fWiuikLHjWuMLxPMl2YlNFCLP3w==
X-Google-Smtp-Source: ABdhPJyJTV13uA/iCQSx5uY8ArmyAHcxOpJoOetvqI1oGN+mRW216wlNPJI8WUHUqIdypqui1u9n4g==
X-Received: by 2002:a17:906:4758:: with SMTP id
 j24mr3274163ejs.46.1631372056395; 
 Sat, 11 Sep 2021 07:54:16 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id i26sm1025617edt.62.2021.09.11.07.54.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 07:54:16 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210901191306.2507431-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <12cec190-6021-abc0-ed09-6df8f44e0109@mind.be>
Date: Sat, 11 Sep 2021 16:54:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901191306.2507431-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/gobject-introspection: fix
 --includedir
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
Cc: Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 01/09/2021 21:13, Fabrice Fontaine wrote:
> Set includedir to $(STAGING_DIR)/usr/share/gir-1.0 instead of . in
> Makefile.introspection or g-ir-compiler won't find .gir files resulting
> in a build failure for autotools-based based programs such as gconf
> since bump of gobject-introspection to version 1.68.0 in commit
> abc110e3624aa4e8a9bd8595b3fdc0aec60845e0:
> 
> Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
> error parsing file GConf-2.0.gir: Failed to parse included gir GObject-2.0
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8180d893cbd27512915a7f8a3adb232b93a98ceb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/gobject-introspection/gobject-introspection.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
> index 81938b14df..f34dca7278 100644
> --- a/package/gobject-introspection/gobject-introspection.mk
> +++ b/package/gobject-introspection/gobject-introspection.mk
> @@ -133,6 +133,12 @@ define GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
>  
>  	$(SED) "s%typelibdir=.*%typelibdir=\$${prefix}/lib/girepository-1.0%g" \
>  		$(STAGING_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc
> +
> +	# Set includedir to $(STAGING_DIR)/usr/share/gir-1.0 instead of . or
> +	# g-ir-compiler won't find .gir files resulting in a build failure for
> +	# autotools-based based programs
> +	$(SED) "s%includedir=.%includedir=$(STAGING_DIR)/usr/share/gir-1.0%g" \
> +		$(STAGING_DIR)/usr/share/gobject-introspection-1.0/Makefile.introspection
>  endef
>  GOBJECT_INTROSPECTION_POST_INSTALL_STAGING_HOOKS += GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
>  
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
