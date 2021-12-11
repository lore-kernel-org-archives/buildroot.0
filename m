Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD02CC433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 20:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F0AD60D7F;
	Sat, 11 Dec 2021 20:42:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OrbhzZETk7-J; Sat, 11 Dec 2021 20:42:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF3EB60D76;
	Sat, 11 Dec 2021 20:42:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 152891BF576
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11B9683F8D
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:42:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7gt5dgGxgdgP for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 20:42:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9E348308D
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 20:42:11 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id y13so39776836edd.13
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 12:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cjFo6JAEf5c4lGnxtbmCV+ixlqJv9UQctY26w90rhfw=;
 b=Kib1aikxx4in3Cms6hvsmJRCZCf5DJHJQuCao//EWec2HCUuHjlTwwEvbrHZnqgTVo
 zz+uwvJodWLEQ50zAGOvupNH1UO4XpZipbCUZoPLd4/UjF7wB3QpBy7jMCBwmfot3vn1
 yC9DRhKLoXdA8R1pPggOsivw/ZmWjHk0X8GdBZ+IF791Vb+8+KcAAa5MrcsTAyQ94zFn
 tVgjXA69BycL3ywvhjoPWCp+fb9fY+XPHj2IdjmDTtKGYE//dculklyMGYFRd251E3zY
 blT8UrWjWsO+RLNGkj1Dyc1OLmWSNlEg57UCXY03SSyHJsng2xgBQyLN9YxGbPk/6KFr
 b61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cjFo6JAEf5c4lGnxtbmCV+ixlqJv9UQctY26w90rhfw=;
 b=IRA61TZI+fj+NXAps/J9DHtEctNt5dBc6ROr77Tn/IweAOlLOjEUY2eaE+3ZQAo/Wh
 RZZvlwYrjDGvs0wL/RkDTB7QLujuca4Q+CdCVs9ENYkagT4XAHohTerhVARJrNA3qEd6
 w28MaPm9ZFu/K+BR01eoFKxedMHcBPW5WU8eZIhBwvNIAkm9tp8fwzpjKM1s4hMRuX6v
 fo74op082AhyzB8Tw8lBl2/ZKmRAoBkM4MCI7A/hzBJSPbEGOrP6XgugxBd+91u90krW
 lsyI+7HMAEWWYfvWXt/ckWFOIDq5v6t7z2TfiD0HYDo7tR8O+Nf8DrI0eMbV0KM38sH7
 7bGQ==
X-Gm-Message-State: AOAM5317WqzbxkR00+gNZ6+YLX79Fk/QYRTa/3uqMXzvzNCysD69gdfS
 jXiiu+HKTb7L/ezpJCXlFrabOw==
X-Google-Smtp-Source: ABdhPJzOOUMeRkvU8RDKlGPyhT1cI3Sqvtdd+U8NMaCNMxuhb4FGgVDRdqejFf/PzYkTcNutENaAxA==
X-Received: by 2002:a05:6402:2809:: with SMTP id
 h9mr49910498ede.351.1639255330080; 
 Sat, 11 Dec 2021 12:42:10 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id k16sm3572287edq.77.2021.12.11.12.42.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 12:42:09 -0800 (PST)
Message-ID: <b7e62d15-07c0-1896-444f-2e4a99ced085@mind.be>
Date: Sat, 11 Dec 2021 21:42:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
References: <20211205102907.2836980-1-troglobit@gmail.com>
 <20211205102907.2836980-4-troglobit@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211205102907.2836980-4-troglobit@gmail.com>
Subject: Re: [Buildroot] [PATCH next 3/3] package/inadyn: update inadyn.conf
 example
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
Cc: thomas.petazzoni@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/12/2021 11:29, Joachim Wiberg wrote:
>   - Comment out iface setting, usually not what you want
>   - Update DynDNS example, show use of multiple hostnames
>   - Add FreeDNS sample config, free and stable service
>   - Add link to syntax and examples
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/inadyn/inadyn.conf | 25 ++++++++++++++++++++-----
>   1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/package/inadyn/inadyn.conf b/package/inadyn/inadyn.conf
> index 1b29027606..3328ee2218 100644
> --- a/package/inadyn/inadyn.conf
> +++ b/package/inadyn/inadyn.conf
> @@ -1,11 +1,26 @@
> -# Basic configuration file for inadyn
> +# Example /etc/inadyn.conf
>   #
> -# /etc/inadyn.conf
> -iface    = eth0
> +# Remember to change this file to match your provider and credentials
> +# Username and password can be included from another file.  For more
> +# info, see https://man.troglobit.com/man5/inadyn.conf.5.html
> +
> +# Use IP address of interface instead of external checkip server.
> +# Useful when you want to register internal IP addresses
> +#iface    = eth0
> +
> +# IP address change check interval
>   period   = 300
>   
> -provider default@dyndns.org {
> +# Remove of change to match your Dyn account
> +provider dyndns.org {
>   	username    = test
>   	password    = test
> -	hostname    = test
> +	hostname    = { "my.example.com", "other.example.org" }
> +}
> +
> +# Remove or change to match your FreeDNS account
> +provider freedns {
> +     username   = lower-case-username
> +     password   = case-sensitive-pwd
> +     hostname   = some.example.com
>   }
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
