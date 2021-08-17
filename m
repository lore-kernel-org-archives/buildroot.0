Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A882EC432BE
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 21:24:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6163A60F58
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 21:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6163A60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E3A460B92;
	Tue, 17 Aug 2021 21:24:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OgF-B2p01gco; Tue, 17 Aug 2021 21:23:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC1A260B93;
	Tue, 17 Aug 2021 21:23:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E61AA1BF396
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 21:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFCE8403A3
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 21:23:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4N1iMY9m3nYq for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 21:23:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E16740397
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 21:23:52 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id b10so357171eju.9
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 14:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4QLF9epQHpQaIy6v0/A/Ui91840kr0yqVyczZr+Ysk0=;
 b=AzJQptUYxYS09Mu1rEecX9IkAgetDMmNakUHfC0iT/yRZlMZ3IFRCdDTly8rZaY7m8
 osAtHiQA2trZHksZYonmfe79ghjhVplWwCMI+M+S+4h5RM7l3bN7Jbi1LyIOTMzmeaST
 vmvGgNY2fFIfZ9dvXv/jCD6Nis9BdNcJGSL9FoKqGe22tvhVkU7Ixxcwdm+iuA8haOFe
 roHz1XBBrUeKTjfeF7a4XHK/3qdhm0AhOf4zPImXBIAg/q41WCc8geciq2XAN8nA9rl5
 RXCiWhF3A1icz0HMHjU5oUfhhV/yUDXYNGrgoii0ucR3jOaZ88XqWzvEBfmDMEFklmGV
 DADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4QLF9epQHpQaIy6v0/A/Ui91840kr0yqVyczZr+Ysk0=;
 b=oPTCLUCxrDRxls0Wl/P61e8KYE/F7E1MiMoTMgtNxt67CuA+vLesWcVu9CkL1ntDO2
 jOgdlegjntHQsT4Cv8BGUKg/Joa/4sMSdE4S3MBHSc1XBD9XEZ7Xp4MNLH7Gab3yJ/7X
 J3+2OjxH6SeFlV6609GktHXgO7E3LpLN8AwXTCkwKx4cnBQDeB+4AC0WmGIhmoM+tpxS
 TCgGDaIOCm7wRU+sDk4d9qybFIr8o3Y0bpc+T94MZFna1fOlOk3MSWJTXPuC2cME6mit
 btAWc42wiw4BcO9i+w8W9I3qm1V9WBMcFCTbooZ6EegA1h2ZkwCXJvdyh+pIVt0rxlza
 Kvcg==
X-Gm-Message-State: AOAM5325kexcp8Ktou1E0wI3oMdWhtgAGWFiUV5HfLQY+8dFp1w5pYgc
 FWkJiXoBS5W/3Fm9qpHfolmY3M7zuQGOpQ==
X-Google-Smtp-Source: ABdhPJxWVTYWzAeYFxo3UjKFZppCHKJBAckHpX7HtArCdlcvSP6mEedqv80RXomyzXqZ/Hmr+KF2Dg==
X-Received: by 2002:a17:907:b13:: with SMTP id
 h19mr5916766ejl.38.1629235430474; 
 Tue, 17 Aug 2021 14:23:50 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id gb23sm705477ejc.119.2021.08.17.14.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 14:23:50 -0700 (PDT)
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20210813043555.35590-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <0cbfac17-a762-50ee-9d1a-eba90ba9ca2f@mind.be>
Date: Tue, 17 Aug 2021 23:23:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813043555.35590-1-bernd.kuhls@t-online.de>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: security bump
 version to 13.4
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
Cc: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 13/08/2021 06:35, Bernd Kuhls wrote:
> Release notes:
> https://www.postgresql.org/about/news/postgresql-134-128-1113-1018-9623-and-14-beta-3-released-2277/
> 
> Fixes CVE-2021-3677:
> https://www.postgresql.org/support/security/CVE-2021-3677/

 There's *quite* a bit more in that release than the CVE fix, but it looks like
bugfixes only. So applied to master, thanks.

 Regards,
 Arnout

> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/postgresql/postgresql.hash | 4 ++--
>  package/postgresql/postgresql.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
> index caa8a1f5e7..2dcc1823d6 100644
> --- a/package/postgresql/postgresql.hash
> +++ b/package/postgresql/postgresql.hash
> @@ -1,5 +1,5 @@
> -# From https://ftp.postgresql.org/pub/source/v13.3/postgresql-13.3.tar.bz2.sha256
> -sha256  3cd9454fa8c7a6255b6743b767700925ead1b9ab0d7a0f9dcb1151010f8eb4a1  postgresql-13.3.tar.bz2
> +# From https://ftp.postgresql.org/pub/source/v13.4/postgresql-13.4.tar.bz2.sha256
> +sha256  ea93e10390245f1ce461a54eb5f99a48d8cabd3a08ce4d652ec2169a357bc0cd  postgresql-13.4.tar.bz2
>  
>  # License file, Locally calculated
>  sha256  31ccadc0a70e8e0e8a35c5833567b64388dfe34987d962e1911554e271294105  COPYRIGHT
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index 143bcd895a..3b6c6e21e7 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -POSTGRESQL_VERSION = 13.3
> +POSTGRESQL_VERSION = 13.4
>  POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
>  POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
>  POSTGRESQL_LICENSE = PostgreSQL
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
