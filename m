Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056FEC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 14:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BF9683183;
	Wed,  6 Apr 2022 14:29:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pc3LpaJMY26R; Wed,  6 Apr 2022 14:29:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E5DC82FE4;
	Wed,  6 Apr 2022 14:29:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D92811BF300
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 14:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C225E41851
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 14:29:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LjJrv_vPv0C6 for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 14:29:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 581624187D
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 14:29:06 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id a6so4768689ejk.0
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 07:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=lwpzoya7FkFdJprnRjcE9tam5GXnLO9aKB6jGJIVsxk=;
 b=P6Rz9n1GZs0iWhq2HgfztOND7oxGYNhJWCIbNAfBpmT44sxFcqCqRoIu0PfLcuTSGP
 h2WHzNaJoyMYckbmyPmchAM57giC/LJzLgym273UyojJV/9UoeTzioEiBAI4GCONe6xH
 QMgazuZZ1hbEgXFMEwrbl9wfJ/VOJMoGcWXFVRE04v3tavlrdFyNuMXDbH5ApWYWgEqe
 Ljlm7oK4hwUeQm/iftCd8Rbc1DsSIavUMxhhDD7GFWA1Zpa07nmgbXu44Ep40uaK2AIo
 DpQxto8o6ns0q8MBb4UUFUOl93aOPV+rUusrkzweF7UqZJsrJtr9a0BsPKDwI+YPQie3
 sNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lwpzoya7FkFdJprnRjcE9tam5GXnLO9aKB6jGJIVsxk=;
 b=YmBl+MUCZ0PMGWIHWH9Oeh1T4UDGUn41Gc2e/lWT0i+7UCZCa5rsNowTgQrWpxA2Fg
 Pe9oWqKS+ZvWITJMSIIoi5paw1L6jtCXdW9DMe279ZY8PvYXiaWEq3FqG95OE62b6xos
 DvQa9ktczSBEwa1rHfMadyTAmWLpm6iZiUOcEy/q/NotoZQ8HL8mQYAAho055h9ufFst
 yB5/EvpgnNPZhDT/GmT+g2McxwTwC7uVgGXH6W6x/8qiKB2QcetakaAEyNYgPScOrRQz
 Y/sR2wNd54Bsk9fTwf19KUfILUEG1aZmTCiSFVzMCul0WAFCuW+fAaejkyUuYPclmXel
 2RTg==
X-Gm-Message-State: AOAM533nDMEZ0s3H8XvMEDdlGJyNYKP6xmN+UXKExsMqSLIB+bq0p8Fd
 q5eZxVdtWin6kAKItQy+74i/+Q==
X-Google-Smtp-Source: ABdhPJxkk815UubpKoMAzYxcUbqbj4pHVENa3PUwMc39Ne+kuQjk7dXaVUhcbYIkApS8ronJupYskA==
X-Received: by 2002:a17:906:65d5:b0:6ba:3133:dfb9 with SMTP id
 z21-20020a17090665d500b006ba3133dfb9mr8701954ejn.56.1649255344338; 
 Wed, 06 Apr 2022 07:29:04 -0700 (PDT)
Received: from [192.168.0.179] ([83.217.130.159])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a170906708700b006da8440d642sm6725363ejk.113.2022.04.06.07.29.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 07:29:03 -0700 (PDT)
Message-ID: <a4724812-eafb-0ffc-b14d-df9ed04aac80@mind.be>
Date: Wed, 6 Apr 2022 16:29:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Emile Cormier <emile.cormier.jr@gmail.com>,
 buildroot <buildroot@buildroot.org>
References: <CAM70yxCknY7qH9uiqNpDhynxAdsjw1zM9AH=UaiAzET+f7treA@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAM70yxCknY7qH9uiqNpDhynxAdsjw1zM9AH=UaiAzET+f7treA@mail.gmail.com>
Subject: Re: [Buildroot] [Feature Request] Host cmake built with the
 --system-curl option
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



On 06/04/2022 04:06, Emile Cormier wrote:
> When using cmake while running a post-build script, the ExternalProject_add 
> command fails when the URL option is used to download a source tarball via 
> https. This is because the host cmake is not built using the --system-curl 
> option (https://github.com/Kitware/CMake/blob/master/bootstrap#L660 
> <https://github.com/Kitware/CMake/blob/master/bootstrap#L660>).
> 
> Without the system-curl option, the cmake build will use its own bundled libcurl 
> without OpenSSL support, and thus downloading tarballs via https fails.
> 
> Adding the --system-curl option would entail that libcurl also be built as a 
> host library. I don't think it currently is.

  Not only that, we'd need to configure host-curl to pull in host-openssl as well.

  That is not really great. It means that cmake (which in many configurations is 
a very basic dependency) would pull in two more packages, which significantly 
increases build time.

  And the only added value is that it allows you to build something outside of 
buildroot. If you need to do that, simply install cmake on your build system and 
use that instead of the buildroot-built cmake.

  Regards,
  Arnout


> 
> I use CMake's ExternalProject_add in our project to download and build the 
> static library dependencies that our embedded application needs. I know that 
> buildroot provides various packages for cross-compiled libraries, but I have no 
> control over the versions (and compile-time options) of these packages.
> 
> Cheers,
> Emile Cormier
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
