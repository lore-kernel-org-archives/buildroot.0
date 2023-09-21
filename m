Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2F6E7D0A4
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 18:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5E6E83C7F;
	Thu, 21 Sep 2023 18:26:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5E6E83C7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MAmqyIaIGmHg; Thu, 21 Sep 2023 18:26:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12C0383C7C;
	Thu, 21 Sep 2023 18:26:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12C0383C7C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C84E1BF3EE
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 159FC83C7C
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:26:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 159FC83C7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IOmgH8hcULYq for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 18:26:48 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2146583C7A
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 18:26:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2146583C7A
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5310a63cf7bso1539466a12.1
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 11:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695320806; x=1695925606;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aX9Bx8CWNcjnQyzG3ZPaq7OJ80XNs4F7T2/f2Ep4qpg=;
 b=dpEkf2Bxyf65JiQmUExE2tc1ebShIWSpx66Jpz+6fD/5nRAobZ30JqrGrXNunX9aAS
 z2qrvJ/82/9rzGxw1v+Thx7TMORrx/tjbUT206F/u6wffGgRqqq/ZQJvnRnpPEtEBYxS
 QkDog6b5+pzvWq4kmvYfwQUYxGY6PiLOcPzj2pvGe9RKbYBFB3z2D1kIyTzsDoSEmPVk
 hD/TsyWWIXKmwS5E2OMcJ6L7BJoFmsYL6QlzeDXPiHICTYIgEkiEKSWweEgYxhQLrBAc
 PKC9PtIbpSQD+pQDAPEYYOkSCqDpNJlrcvJKemvTB0uVlXnvtWmizo9G+NbfW05e8++5
 cKew==
X-Gm-Message-State: AOJu0YysoTpXmGosXyez6qPYVwGHmwnj/uqTysAr/Hxbk3mYYtXpP8zp
 pZArTC+kSfQGlikdflUHLp4uptoa7EyfeiwbQsQ=
X-Google-Smtp-Source: AGHT+IF3zd0Yq4zwc6BgDZtBl43q8cVb0X2cL1kt43EVk4s9NSy9B5sinJ+2Ncy0LohX1ZKf8lupPA==
X-Received: by 2002:aa7:c54c:0:b0:523:47b0:9077 with SMTP id
 s12-20020aa7c54c000000b0052347b09077mr5759289edr.38.1695320806281; 
 Thu, 21 Sep 2023 11:26:46 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 o12-20020aa7d3cc000000b005259dd903e5sm1168724edr.67.2023.09.21.11.26.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 11:26:45 -0700 (PDT)
Message-ID: <fdad6b65-936b-0496-a4f6-e193fa6c4f0f@mind.be>
Date: Thu, 21 Sep 2023 20:26:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20230921102857.375294-1-thomas.petazzoni@bootlin.com>
In-Reply-To: <20230921102857.375294-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1695320806; x=1695925606; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aX9Bx8CWNcjnQyzG3ZPaq7OJ80XNs4F7T2/f2Ep4qpg=;
 b=hxzsMsWOhvuFjlwl48Iz/PFPM+Yan0JiyLd+RTNTbXkb8nW+tXVdO9sM7laz+3ZPo9
 aNmcWe02x+aV224Ibmj7uF1KAJ1VFxueIuV9N1qpsHPnRgpZRTgUSNaZJmI/F3Jn4Owk
 Q3lhKcZ1anOTN2YcbUeny6Sy7ImRUIvWHduydytU2S3dIb32Nuww74y/30gjY7jU7Xip
 kO8kr4Ev1/lIkLu1NcCMQ6Db8goXOwdIJvMfcERdd4uokBqaxgKgXlcDfybiX0V/+lkP
 i6zefQBSIyBDxu1uhAt+iZmG/74TsV28ftNNmCZgSf7ngGbukqu0kf45AsT/UUzV27tA
 ocWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hxzsMsWO
Subject: Re: [Buildroot] [PATCH] package/ne10: install shared libraries only
 when built
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/09/2023 12:28, Thomas Petazzoni via buildroot wrote:
> The install to staging commands of the ne10 package are careful to
> install the shared libraries only if they are built, but we forgot to
> use the same care for the install to target commands, causing a build
> failure on BR2_STATIC_LIBS=y configurations as no shared library was
> built:
> 
> cp: cannot stat '/home/autobuild/autobuild/instance-15/output-1/build/ne10-1.2.1/modules/libNE10*.so*': No such file or directory
> 
> This commit fixes this by guarding the target installation commands to
> BR2_STATIC_LIBS being empty.
> 
> The problem exists since the package was introduced in commit
> 318f3db0dcc052aa770ca57c143b5f7bc40cdaf3 ("ne10: new package"), a good
> 10 years ago. Most likely it was not seen for many years as this
> package is only available for ARM with NEON and AArch64, and we were
> not testing fully static builds, except for ARMv5 that don't have
> NEON. Now that we are doing more random testing, the problem started
> being visible.
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/45b2c1af052271bc2f1bb96544f138d29e4f7dfd/ >
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/ne10/ne10.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/ne10/ne10.mk b/package/ne10/ne10.mk
> index 3946605556..ce0f7e7b77 100644
> --- a/package/ne10/ne10.mk
> +++ b/package/ne10/ne10.mk
> @@ -42,8 +42,10 @@ define NE10_INSTALL_STAGING_CMDS
>   	$(NE10_INSTALL_STAGING_SHARED_LIB)
>   endef
>   
> +ifeq ($(BR2_STATIC_LIBS),)
>   define NE10_INSTALL_TARGET_CMDS
>   	cp -dpf $(@D)/modules/libNE10*.so* $(TARGET_DIR)/usr/lib/
>   endef
> +endif
>   
>   $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
