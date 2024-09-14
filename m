Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C77C021AF
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 20:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1F29817FD;
	Sat, 14 Sep 2024 20:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UxtKdMZxt5XX; Sat, 14 Sep 2024 20:08:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAFB781753
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAFB781753;
	Sat, 14 Sep 2024 20:08:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A0D61BF3A4
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 20:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EBA881768
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 20:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qi6JIpMS3hhJ for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 20:08:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B1AA81384
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B1AA81384
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B1AA81384
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 20:08:14 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3780c8d689aso2462121f8f.0
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 13:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726344493; x=1726949293;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pwI5ktuaWd68w9ok/URg3njpZetowa0ufhDG2bd6byY=;
 b=hwDX06/oyIdfuPwnIi06FwbWyhfGCMR2xfHae5wHrJw0xtoHXcYZwvS/ifD6nsRYe/
 5X8RdocV4BAvLHsmjfnDixVzPC4k2kMDT8fb/1NetSmtF8QY4FGZ2mmoMaJYTCIgPIPJ
 SojAMEFoVxp1ls7H0dwyZZLk+ePY0/2K6ShTcPFnTRNKAo8YffLyWOYvpNOsJFLV4XkN
 meP0UG1I1yRKNIahNFyRk2dUG7wYZxhdN2yYJ+MvhACduzF2fL2f3n1SbMZDmzz6zMt7
 Zout7XB7hf2RBG97nXk9OiJ+p/rPT8VKqOqCEbC1IKhOe3iZPlqEGudiKWAjf8yCbVsx
 C3/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXilMRKpLWgv+foOzG9mieCQVzP8UZyYsuMyYBpe/p4MCOJGG6TE3gs7K9LvISk05n/vHpXLS3N/uM=@buildroot.org
X-Gm-Message-State: AOJu0Yy3rk6rsflP2+jHDiwR6fkEMUBKSnNKppikNaQZm3FIrXcTpfhG
 ilgaNNWeLWNMREOXUI3GCBH6aidznkpjiA0plz563g+gr9Qk7GZS95SzU7l9r+E=
X-Google-Smtp-Source: AGHT+IH/NrapnzoSlQP9eZwGj2P1I37RpuYCIwlUlqrhgycsb/nrVmRvkA4/0l8a+9tW28aWbXXfjQ==
X-Received: by 2002:a05:6000:1816:b0:374:c7a3:3349 with SMTP id
 ffacd0b85a97d-378c2d7274cmr6257764f8f.51.1726344492832; 
 Sat, 14 Sep 2024 13:08:12 -0700 (PDT)
Received: from ?IPV6:2a02:61:a2::9b5? ([2a02:61:a2::9b5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e7800374sm2761593f8f.79.2024.09.14.13.08.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Sep 2024 13:08:12 -0700 (PDT)
Message-ID: <6ddad61f-c191-4454-9a12-03588ff6ba5c@mind.be>
Date: Sat, 14 Sep 2024 22:08:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20240911105436.854798-1-adam.duskett@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240911105436.854798-1-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726344493; x=1726949293; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pwI5ktuaWd68w9ok/URg3njpZetowa0ufhDG2bd6byY=;
 b=Ui8reNX9utx2Pe5NKj1ha795tHqiF+3g8uzSXAgBVGoRfdHTX0cXfoIY/+SAXMHkah
 Sht3lmXjzgOQ1NhNOsVib9YmCpak54K8IseYG8W7wuyxITtDnNoqgpot3qOXwMeBrvRQ
 u+kf3aKLzjTPzBc+9ylqDW/HblVeZNdX4hRIekGEsYRTXx2+ISjG83bFYEhyTOxTiGWF
 LgR6XatdotOTH/pwtydOslcT8gRsKzv6szgwhIAMKIxKAtkGnc7jVc8ahVr6lflb0JKU
 iN7V1PJczg2pEQZ1LjPH0zpEenBu5yArEl890W6DY3+vsvGI2D7SYjMu8lnpo0p8OCCK
 H5vQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ui8reNX9
Subject: Re: [Buildroot] [PATCH 1/1] package/boost: revert commit
 4349746dac6f55b0b0faca21a7e609fb67d1471b
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Adam,

On 11/09/2024 12:54, Adam Duskett wrote:
> Commit 4349746dac6f55b0b0faca21a7e609fb67d1471b states:

  I've slightly reworked the commit message: the subject line should state what 
is done with the patch, and "revert commit <sha1>" is not really helpful in a 
oneline log. So I changed it to "install cmake files" which IMHO explains better 
what is happening.

> ```
> commit 4349746dac6f55b0b0faca21a7e609fb67d1471b
> Author: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Date:   Thu Apr 18 11:13:50 2019 +0200
> 
> package/boost: don't install boost cmake files
> 
> Since version 1.70.0, boost installs its own cmake files which are
> utterly broken so don't install them otherwise all cmake packages using
> boost (host-thrift, domoticz, i2pd ...) will fail because
> BOOST_INCLUDE_DIRS will be empty
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/4ada26bab5c1e6504c7d8c92672326ced1d336df
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ```
> 
> However, this has sense been fixed in the five years this change has been in
> Buildroot. Furthermore, having --no-cmake-config breaks packages expecting to
> dynamically link to boost::log with a multitude of
> `undefined reference to boost::log` errors.
> See: https://github.com/mendersoftware/mender/pull/1663 for one such example.

  Weird that there's no autobuild failure that shows this... Or perhaps it would 
be in a dependent package? Then it's difficult to find :-)


> As the --no-cmake-config is no longer needed because the original problem has
> long since been fixed upstream, it is safe to revert the change.
> 
> Tested with the following packages as a smoke test:
> 
>    - host-thrift
>    - domoticz
>    - i2pd
>    - libcpprestsdk
>    - log4cxx

  I'e added mpd and libcamera-apps here which you tested later.

  Applied to master, thanks.

  Regards,
  Arnout

> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>   package/boost/boost.mk | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index bb73edfda6..61284b967a 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -103,7 +103,7 @@ BOOST_TARGET_CXXFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MA
>   BOOST_DEPENDENCIES += python3
>   endif
>   
> -HOST_BOOST_OPTS += --no-cmake-config toolset=gcc threading=multi \
> +HOST_BOOST_OPTS += toolset=gcc threading=multi \
>   	variant=release link=shared runtime-link=shared -j$(PARALLEL_JOBS) -q \
>   	--ignore-site-config --layout=system --prefix=$(HOST_DIR) \
>   	--user-config=$(@D)/user-config.jam
> @@ -116,8 +116,7 @@ else
>   BOOST_ABI = sysv
>   endif
>   
> -BOOST_OPTS += --no-cmake-config \
> -	toolset=gcc \
> +BOOST_OPTS += toolset=gcc \
>   	threading=multi \
>   	abi=$(BOOST_ABI) \
>   	variant=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
