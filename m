Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C457C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 13:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAD6860AFB;
	Tue,  4 Feb 2025 13:02:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uAxTuK71bmr9; Tue,  4 Feb 2025 13:02:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA5B160BB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA5B160BB4;
	Tue,  4 Feb 2025 13:02:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 282F7185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CA9740493
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:02:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRoK620MqQLa for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 13:02:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AEE4F403F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEE4F403F0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AEE4F403F0
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:02:33 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38da586ef14so522733f8f.0
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 05:02:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738674151; x=1739278951;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jd8cB/xWp0h3l02fXPMawkAnGLaFuiS6S8u8SH/ygAY=;
 b=tvJ4tXHtAmWgnEmkOnAjCAee9RuS+PlEh9+0go06GfQoje/KYgIYeAHJ0YJH7c8sVk
 XNyNHlDmKAlIuMZvG70Ip0PwJVOpMjdc9Cd5gymPMmi9pJ6s0L8WHrreW9y40jQy3O+z
 OZxuaw5GR4hg5IBuD0aO+uYnWYhZfdB4Nhyme0kPmQdKSz6jtHhJsXsS4uOD2e5bAUQ9
 jxap8oV9+zR9KpTzWcDfSpIAbc3A38zOKTSKTtKKOKWPGf5yQl7xURMy7VftIy33PhFz
 uKQ/GVJhjqK7hsq/Oj/LOB/pv9Pw2QuDXJvD30QQWdCz62sK6tmWnOwk9cdhekNXWVZf
 qXNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9xoFNz6GG5LxiTTGIkKLUA2g159/PE5qaO6iCY+vqw/PMVgJ5wYKa7Qodgj9wSyv2nFXwD87QCr8=@buildroot.org
X-Gm-Message-State: AOJu0Yx9+ThPIv4e0o4egeEfNkD/VwDY/dN2GerMvJImVf21NRfo+9py
 KA1RwPYMTf1mkE+/lniuCV5Csq2OQerZ2mwtJkFLpexfMD6sYYUPqrnvMRqljajbQz4OEP/tu47
 Y
X-Gm-Gg: ASbGncvEt75JaxXzFbOvLcRiiIced44idWEZDhBin2OQTe2nkYMXkYu8VMgl/WONJwY
 4ALoXnfZq3F/2F2GV+xd477NdicvkC34t6mYNdZA/XKopnnwC+Atp2ZEW+pCD5vI8NF53uajlw+
 Y0u8w9i7YGyf8You8kHoDImyHJsONx/8JfSJaAS2CuaAb+GKMhLf0siYc6qvaRnIN2w1vhH230W
 7h94Ea2DCTA7vC7DM8HqhP9YU82FDVDu8iodf3G7TPNXhXm41Wk+AU6bu1cA/Cf6nHrsc8In4s0
 30MW6Vrp+y4LDgE4T+NQ0tHeK8iKu4A3eMAbmAUW0u791rE=
X-Google-Smtp-Source: AGHT+IEzvEb13EEtxLDx8moJKm2A0rVGkrtDvkxGwYlUjpTH2kgAdKcP3IZLzVzes4mcjE/ZB0DLqw==
X-Received: by 2002:a05:6000:1fab:b0:386:416b:9c69 with SMTP id
 ffacd0b85a97d-38c5194a58cmr22105346f8f.16.1738674151092; 
 Tue, 04 Feb 2025 05:02:31 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc12f28sm223087815e9.7.2025.02.04.05.02.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 05:02:30 -0800 (PST)
Message-ID: <287b51b1-5c1a-4048-99e5-42a53cd949cc@mind.be>
Date: Tue, 4 Feb 2025 14:02:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
References: <20241014102123.3727883-1-adam.duskett@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20241014102123.3727883-1-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738674151; x=1739278951; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jd8cB/xWp0h3l02fXPMawkAnGLaFuiS6S8u8SH/ygAY=;
 b=iCmO8Q+RiB/3bv7ziJjU0l5PLGCsx5yqVNPioLJjH7q6OuuVAOf1DQWDYbOOmOE3ni
 k7DM89H3zon2/Lmyz7osLvJV5rbCzbHJnlBJ6ua20HMNuWWW2OFdSk93jTX8j7Sv5yq+
 jSAAahOTbfitzwOhGFJCNDrvLAFIyAIrjjn0AV/AvmPDPVur1IwRSekgb8jlxcmu76mf
 Mh6d2GiwfUROT9tPEdPNcIBFFO/+qmz+xGHnNZW2bX2Tb0TqfttyO0EwG7OqR+9l4a1b
 +JAg7talAWNX0t5JWP9/0ukq6V7knAwQu4i/5dV0ncWEDNyj4EIMikxRpxWvZTFn8z2z
 mnzQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iCmO8Q+R
Subject: Re: [Buildroot] [PATCH 0/6] mender cleanup and intermittent update
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



On 14/10/2024 12:21, Adam Duskett wrote:
> Instead of updating mender directly to 4.x, which is far too large
> of a change, update it to 3.5.3 which is the last of the GO version.
> 
> This not only provides security and bug fixes, but it makes the
> transition to 4.x when someone picks that up much easier. This is based
> off of previous work found here:
> 
> https://patchwork.ozlabs.org/project/buildroot/patch/20231219172446.498409-6-adam.duskett@amarulasolutions.com/
> 
> With the addition of more tests, cleaning up documentation, and adding some
> information in the migrating.adoc file.
> 
> Adam Duskett (6):
>    board/mender/x86_64/post-image-efi.sh: re-arrange write rootfs-image
>      args
>    package/mender: remove /var/lib/mender symlinking
>    support/testing/tests/package/test_mender.py: Add RO fs test
>    support/testing/tests/package/test_mender.py: Add a systemd test
>    package/mender/readme.txt: update readme

  Patches 1-5 applied to master, thanks. There was a flake8 error in one of the 
patches, but otherwise it looked great!

  Thanks for continuing to work on mender integration in Buildroot! And as 
usual, sorry that it takes so long before things get applied.

>    package/mender: bump version to 3.5.3

  I haven't applied this one because you have sent the bump to 4.0.0.

  Regards,
  Arnout

> 
>   board/mender/x86_64/post-build.sh             | 12 +---
>   board/mender/x86_64/post-image-efi.sh         | 25 +++++++-
>   docs/manual/migrating.adoc                    | 15 +++++
>   package/mender/S42mender                      | 16 -----
>   package/mender/artifact_info                  |  1 -
>   package/mender/mender-client.service          | 11 ----
>   package/mender/mender.conf                    |  1 +
>   package/mender/mender.hash                    | 10 +--
>   package/mender/mender.mk                      | 10 ++-
>   package/mender/readme.txt                     | 60 ++++++-----------
>   support/testing/tests/package/test_mender.py  | 64 +++++++++++++++----
>   .../tests/package/test_mender/post-build.sh   | 25 ++++++++
>   12 files changed, 148 insertions(+), 102 deletions(-)
>   delete mode 100644 package/mender/artifact_info
>   create mode 100755 support/testing/tests/package/test_mender/post-build.sh
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
