Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2155C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 14:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 739CC605DD;
	Tue,  4 Feb 2025 14:37:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7kq8QfB4Nkgy; Tue,  4 Feb 2025 14:37:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6347860663
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6347860663;
	Tue,  4 Feb 2025 14:37:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CB3B312A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEB434117D
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id umChPSRrvvfi for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 14:37:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2B53441172
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B53441172
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B53441172
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:37:08 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43625c4a50dso39253735e9.0
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 06:37:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738679827; x=1739284627;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FwB+XmIsg3YnWyJMGdt6bWwH4OsxpGH3jfJfKyZRmqQ=;
 b=iHCk4H1MpCCmvWfVeZsqw9PSWpEsGg7FjHDl/uoY1FVMlWY9iwThZmNnCKpfitjbpi
 WwHdwz0qqfHrI2O+maWtU5qkc4HLTDEk+5dHeu0lgdpgr9fWqK16tc8W/hShm7riPs4I
 qCmBhh+h/To/LvXdMzLCtXTDdcQrBqY1rx//W5zOTdMu5aj572A/9RyqPebRHSQOT8Ac
 qqUL4TISG/P5z22BdTYcjWIrmZusm1PWl0ZfGULrNeofgdh6A4pqfBlwkZuKnBGi6bw8
 5QP8cXEajO1JXFirbXqCEoGieivBgcWFfKiOY0XOygujQiRM3KwhECXklP2NUHuIbjhR
 zsvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMvKhqxugOzlSuTMgh8kI59NE5bkgwoGh/Lm8f866M3DEYUIkdHiVgQzdw/HZdO0RytqSCRm6AG1M=@buildroot.org
X-Gm-Message-State: AOJu0YybVpR6M5+9yZ6nEMqfgsGbvbCFJtJMYAUPn5oc9UeEndQNSpD+
 N7vhzfPtLYS2s/Zby3jRUkbpfpThf+tpaq9B6VVhCOW+B6DoI9/RQldXr9/keIWClaFKrkkvCyn
 E
X-Gm-Gg: ASbGncvaIcYyw5VVGd1QydX/LJEPw1c11SqxVA4zFotvI9YFFeu4kUemsGxTKGSpcQT
 79xr8hwWRquVHt5W/fWjtuRNOXd8xSZ9dl4K2YQ5kHE7R52wWcdknLKrVx1UZcqJnHXfkZLVbxW
 sau3d2CTz3rythwgJeyOYzUe03b6tKmpaIPpS/dzkKQyJxTVxHhhppSFtsdJydnSJpvmqIWZs/A
 RiDbJqVxqlYKCeq/VJ5tcF8Z1omihcOodbzALf4j50eZ0dfIrL6QaN1PHgRP5cc//Mq7Led9e4P
 HC1nY5B711sttwCYP7E9M869sUCE2fXyb5x5r2ddgG8AmJw=
X-Google-Smtp-Source: AGHT+IG6eofKxmmkMQwRls2TZ3NIzxhKJgwWYU9yEA75W4HNFGDN2QiqIC49bZYBk8tSH1ESs7p+2w==
X-Received: by 2002:a05:600c:5488:b0:434:a29d:6c71 with SMTP id
 5b1f17b1804b1-438dc4223aemr189257945e9.27.1738679826926; 
 Tue, 04 Feb 2025 06:37:06 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23de016sm196088525e9.9.2025.02.04.06.37.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 06:37:06 -0800 (PST)
Message-ID: <bf1a6076-63ef-478f-bad8-87c474420454@mind.be>
Date: Tue, 4 Feb 2025 15:37:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
References: <20241224101920.532063-1-aduskett@gmail.com>
Content-Language: en-GB
In-Reply-To: <20241224101920.532063-1-aduskett@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738679827; x=1739284627; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FwB+XmIsg3YnWyJMGdt6bWwH4OsxpGH3jfJfKyZRmqQ=;
 b=Ddpk7lGbQwKvZ9ca2mbGqfhnzNASkRtxqxCTzjTuLxTGeVAhc0ny9527RCzV/T9wQf
 yqpqqr/VOUDD5NaXEYVePjXWnqYtmK+iOi2+3XJalHLxmbToCxYZ5W9mv/7o8H+HqjmY
 9Z/zHha252OtnUlDbzaVCX1+KLDCXwJdJ3ytEuGe5r8Ug6Efmc+gP2SvLLI39xtcJV6D
 FecCmUlWpvk0y/mIDVCbvxnB99lnp1pGOAKplqhfTwPbqq1Jz7Cscoh8MC+rQmSwp+Um
 SuXMTY0WWi2tPsFvFLfYcKIdMzosXNHt001v4NFg/lh1LopzpnYbWCwCNcX53JomEYUF
 d+fQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ddpk7lGb
Subject: Re: [Buildroot] [PATCH 1/1] package/mender: Add warning text
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

  Hi Adam,

On 24/12/2024 11:19, Adam Duskett wrote:
> Because updating mender is a complicated package, and maintainers have their
> hands full with other packages, existing efforts to update the package may sit
> for months at a time before being addressed or responded to. As such, the
> version sitting in Buildroot is out of date by two full years!

  I'm not sure what you mean by that... The last update to package/mender 
(before the big update that I just committed now) was applied 22 hours after you 
submitted it. You can definitely claim that it two years out of date, but in 
this particular case it's not due to maintainers having their hands full, but 
rather due to lack of contributions.

  You _can_ safely say that it is more than 4 months out of date. Or even more 
than half a year, because 3.5.3 got released in June 2024.

  But OK, that's the case for a lot of packages in Buildroot, or for any other 
distro. If I look at mender-artifact, for example, the version in Debian and 
Ubuntu is 3.9 which is also two years old (and we're at 3.11 already).

> Much like the
> mongodb package, one option would be to remove the package entirely.
> 
> Luckily, the official mender organization on GitHub hosts a buildroot-mender
> repository with an external tree that contains up-to-date mender patches.

  ... Which have never been submitted upstream, so what is the message here? 
"Mender prefers to avoid working with upstream"? I don't think that is what we 
want to convey.

  What you really want to say is "mender tools are evolving faster than a stable 
distro or build system can follow. To get access to cutting-edge mender tools 
and features, you can use the BR2_EXTERNAL at 
https://github.com/mendersoftware/buildroot-mender".

  I was going to add that text, but it turns out that that text already exists 
in the readme.txt...


  So, my conclusion is that this patch is mainly meant as a way to communicate 
your frustration with the abysmal slowness of the Buildroot maintenance flow. I 
think it has achieved that purpose. I don't think that applying this path to 
Buildroot is going to actually help anyone. I have therefore marked is as Rejected.

  I do hope that you continue your great efforts of mender support in Buildroot!

  Regards,
  Arnout



> These patches offload the effort of the official Buildroot maintainers while
> allowing users to use the latest version of mender. A win-win for both users
> and maintainers of Buildroot.
> 
> Change the prompt in Config.in to direct the users to read the help text,
> and in the help text, direct the users to the external tree provided by
> mender.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>   package/mender/Config.in | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mender/Config.in b/package/mender/Config.in
> index c9b9d0b757..e254ae6f80 100644
> --- a/package/mender/Config.in
> +++ b/package/mender/Config.in
> @@ -1,5 +1,5 @@
>   config BR2_PACKAGE_MENDER
> -	bool "mender"
> +	bool "mender (Caution! See help text!)"
>   	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>   	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
> @@ -10,6 +10,10 @@ config BR2_PACKAGE_MENDER
>   	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4
>   	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160
>   	help
> +	  WARNING: THIS PACKAGE IS VERY OLD AND OUT OF DATE! PLEASE
> +	  REFER TO https://github.com/mendersoftware/buildroot-mender
> +	  FOR THE LATEST VERSIONS!
> +
>   	  Mender is an open source over-the-air (OTA) software updater
>   	  for embedded Linux devices. Mender comprises a client
>   	  running at the embedded device, as well as a server that

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
