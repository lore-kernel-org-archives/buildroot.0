Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D18CDC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 12:42:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9979D6108F
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 12:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9979D6108F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 587D8825B9;
	Sun, 12 Sep 2021 12:42:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gSf7q3tNCUcy; Sun, 12 Sep 2021 12:42:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C03A482560;
	Sun, 12 Sep 2021 12:42:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 886011BF47A
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 12:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85072607DB
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 12:42:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M_fNKGm6kg6V for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 12:42:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92D8260745
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 12:42:52 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id n10so9873523eda.10
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 05:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YiZEj181EODz4ZsGfBp2QuJFj2p+1ffHXOKMP864qKs=;
 b=ay6ukHho09Rc/H3qL5DEwXDc4li793PT26KbGCcqRpENH2ou4GUC/1bXk2lDaIZypZ
 /O3spjiura9ttzFIcBpSK+1lGsv9W8IhUHR8s1t+nuYCNCj8St6vempCB/Bf24YnD8Pn
 6YbXurlCGSJ4qKqZINzjobHSG6/bzQrAyNjm/qcQL0fBdi9ag7pvgMQkOSSL92seqmit
 CcOmmkQQF9DiCcsPrNo8slwcKODiOBLj9U5FBJg+I4NJoELhdX/AvtgZkpTmlwXoslWQ
 uaehW07SOKSxs/khYrOrRUP/oVkZrcApEgHH6Szs7cseDnGuS6voFy4KYm3OpvR31qlD
 Mb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=YiZEj181EODz4ZsGfBp2QuJFj2p+1ffHXOKMP864qKs=;
 b=sHpcn1ujvALze4B6VrIVIT+8V0ElOMMI7abcXG0pHsU1SzmSMY9tQGxyszlDh/2anp
 Rgmh+zHTWp1YQXJ8pkw1tYY3v9bdX1xjRCCW9tdDSZjfR3FcS6ZqWDt3uOcf+TkmDs2p
 sFNaKdhYywD0eY/kCFGo8pa/6XLMa3cX5xtYlSLleDOAyGehnYzyH2fERstSYIXeNFWy
 vb9UfV9jcwpafrWBZhtLAF/BlJfpX+JVpHQB/iMsIhAt99fXoya0sDDmW6KYEQPsxt0V
 PG8hoCQBdsjU9Z4rg7zL6AmGnVLzlHDSCeETQEpbvvIRrKxkXvfxbRvp6xVRXq9KjgxM
 1iOQ==
X-Gm-Message-State: AOAM5319gh456wI5CNMQyN0xla5lgEhAg42cq0zj92TcLEaTNGBpA2nm
 /O9VKWzmKG/uuHauPxKW8j8g6Q==
X-Google-Smtp-Source: ABdhPJwp8k7wcfv/CsbDDPBvmuSW76D1wM+LuipOBVLXFRnPupI1bV60A4jMgCQrjjbWkdFAeYlOBw==
X-Received: by 2002:aa7:dd4e:: with SMTP id o14mr7633613edw.104.1631450570826; 
 Sun, 12 Sep 2021 05:42:50 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q10sm1975800ejt.121.2021.09.12.05.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 05:42:50 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210905212339.1487248-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <e69f1ef0-a00c-69f9-9e2a-20a9d8a4f133@mind.be>
Date: Sun, 12 Sep 2021 14:42:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210905212339.1487248-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/uhd: needs boost math
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 05/09/2021 23:23, Fabrice Fontaine wrote:
> Lots of uhd components (e.g. examples, USRP1, USRP2) needs boost math
> (i.e. https://github.com/EttusResearch/uhd/search?q=boost%3A%3Amath)
> resulting in build failures since commit
> c577eac16eaae515973faf3013da197516bfd391
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/70f6db101c9d35cdd88da602a863ddf35706fd7d
>  - http://autobuild.buildroot.org/results/5b28591b4c4a7ae4cc6d428c42d96db138ef3ee7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/uhd/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/uhd/Config.in b/package/uhd/Config.in
> index 0d68fda171..248e309dd5 100644
> --- a/package/uhd/Config.in
> +++ b/package/uhd/Config.in
> @@ -21,6 +21,7 @@ config BR2_PACKAGE_UHD
>  	select BR2_PACKAGE_BOOST_CHRONO
>  	select BR2_PACKAGE_BOOST_DATE_TIME
>  	select BR2_PACKAGE_BOOST_FILESYSTEM
> +	select BR2_PACKAGE_BOOST_MATH
>  	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
>  	select BR2_PACKAGE_BOOST_REGEX
>  	select BR2_PACKAGE_BOOST_SERIALIZATION
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
