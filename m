Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7D1C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E10F41A27;
	Fri, 12 Jul 2024 14:40:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_ZfDh8hPkaI; Fri, 12 Jul 2024 14:40:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2D4C41A3B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2D4C41A3B;
	Fri, 12 Jul 2024 14:40:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9922F1BF424
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85C8440185
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:40:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J-LtQ8_itLqY for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:40:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 639CC4043E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 639CC4043E
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 639CC4043E
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:40:46 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-367aa05bf9dso1204993f8f.3
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 07:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720795244; x=1721400044;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NN7/RzrbWN7F3tVNcTdsU2h3rLu34fOEMftBSVpnKO8=;
 b=IsvqCwMgGivDGMo1qIOgeFPFbgskbsQPJ6lLIAtz1fO+iKYbdc59iXNX77+FJFdW4+
 1KQ+H8pxDBpsQubiQaSoIO32zYgicDV+SNv09usvZAig028yzvUE+rlT00AGWL3QMeGW
 MuzEGoGbV7y9q+HPq7S6NweXSdzMRMnnad0EpcCnXzZRyhw+DgwbC1Q/vPnCDZxT2DHT
 xUQgG472LlsdJu/Hi24v/hTA9xFYoQKWfxDBMMiXNBPfAPDpgZV0C2jIv/5xwj75bWWq
 MFU7Jq8rZBhD0VVvKm0gAE2eLhhVWJNaBsllomQyYxC5hq+r8ixTuM8DVXHa5DQ/jCFb
 vvBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT39zDU/c0qaVPKx3Rk2iRxgd+mKMSilx1J6obTt1AN2J7A38kgdLfh1dchRw0Orx6WRvATbtshCFXUh6B4Bq9y2R4dago8g==
X-Gm-Message-State: AOJu0YzstfcSr7lJMyE2wEKNMcBN3GElmZ2B+jNS4V4Y0o2ilTgvskOO
 rjnusLFT3bLoAW3s8nsc3RwFB+4aD+N52Sk8LdQIOWQ4OgGp4bRdj7rlVxPREEk=
X-Google-Smtp-Source: AGHT+IFu+2mWbR4ueF0yGdHTzcZ3iBjQ418IkW+yT4SleYHchpLgIQunq1oe+w2Znkix715Kq8Chog==
X-Received: by 2002:adf:f990:0:b0:367:89fd:1e06 with SMTP id
 ffacd0b85a97d-367cea966f2mr7744650f8f.36.1720795244365; 
 Fri, 12 Jul 2024 07:40:44 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfa079asm10294438f8f.68.2024.07.12.07.40.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 07:40:43 -0700 (PDT)
Message-ID: <eb4af76e-16a0-456c-a0d5-3e058527ff9a@mind.be>
Date: Fri, 12 Jul 2024 16:40:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
 <20230101233653.487175-26-ricardo.martincoski@gmail.com>
Content-Language: en-GB
In-Reply-To: <20230101233653.487175-26-ricardo.martincoski@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720795244; x=1721400044; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NN7/RzrbWN7F3tVNcTdsU2h3rLu34fOEMftBSVpnKO8=;
 b=GHDqZ4k4yalTBXlaVKoYuEB0t+TC24jQI0U/ltdGqtRarhPFsj0+HaFhjcrICSJpRX
 tLfbRMsU4NBPIIo1ze2T0RYOY2YBRB9QweKWqlREyTD3mJadCb4pUsK2hD41vii5molw
 uthPLAfc95G0LlQlyyJE7MiF9i9MBl6gVCKf7PcOgcFaQrCuSgku2juaYUXIImKiwUSd
 JCweZnx/xgP8m8mb3EqdiIpOPHNI6cJ+mg20qWp2xxphdfjZOJDQNvmSIVbGJ1/BvCBK
 N1bK+loxfaz/bo0+NFsP3+U552NWiipx9sqX7njKHncbGsMdt5g8Swe4yPiWDcBNXUZn
 rV6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GHDqZ4k4
Subject: Re: [Buildroot] [PATCH 25/29] utils/check-package: fix check for
 <pkg>_REDISTRIBUTE
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



On 02/01/2023 00:36, Ricardo Martincoski wrote:
> Commit "8e87d76c12 check-package: check *.mk files" added a typo that
> prevents check-package from checking <PKG>_REDISTRIBUTE default value.
> 
> Fix the typo: _INSTALL_REDISTRIBUTE -> _REDISTRIBUTE
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Running on current master generates no warnings.
> ---
>   utils/checkpackagelib/lib_mk.py      | 2 +-
>   utils/checkpackagelib/test_lib_mk.py | 8 ++++----
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
> index b50a19ac62..b0bd52bdf6 100644
> --- a/utils/checkpackagelib/lib_mk.py
> +++ b/utils/checkpackagelib/lib_mk.py
> @@ -296,7 +296,7 @@ class UselessFlag(_CheckFunction):
>           r"_LIBTOOL_PATCH\s*=\s*YES"])))
>       DEFAULT_GENERIC_FLAG = re.compile(r"^.*{}".format("|".join([
>           r"_INSTALL_IMAGES\s*=\s*NO",
> -        r"_INSTALL_REDISTRIBUTE\s*=\s*YES",
> +        r"_REDISTRIBUTE\s*=\s*YES",
>           r"_INSTALL_STAGING\s*=\s*NO",
>           r"_INSTALL_TARGET\s*=\s*YES"])))
>       END_CONDITIONAL = re.compile(r"^\s*({})".format("|".join(end_conditional)))
> diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
> index 49fa216fcd..5f5663377b 100644
> --- a/utils/checkpackagelib/test_lib_mk.py
> +++ b/utils/checkpackagelib/test_lib_mk.py
> @@ -531,13 +531,13 @@ UselessFlag = [
>       ('generic',
>        'any.mk',
>        'ANY_INSTALL_IMAGES = NO\n'
> -     'ANY_INSTALL_REDISTRIBUTE = YES\n'
> +     'ANY_REDISTRIBUTE = YES\n'
>        'ANY_INSTALL_STAGING = NO\n'
>        'ANY_INSTALL_TARGET = YES\n',
>        [['any.mk:1: useless default value (url#_infrastructure_for_packages_with_specific_build_systems)',
>          'ANY_INSTALL_IMAGES = NO\n'],
>         ['any.mk:2: useless default value (url#_infrastructure_for_packages_with_specific_build_systems)',
> -       'ANY_INSTALL_REDISTRIBUTE = YES\n'],
> +       'ANY_REDISTRIBUTE = YES\n'],
>         ['any.mk:3: useless default value (url#_infrastructure_for_packages_with_specific_build_systems)',
>          'ANY_INSTALL_STAGING = NO\n'],
>         ['any.mk:4: useless default value (url#_infrastructure_for_packages_with_specific_build_systems)',
> @@ -547,9 +547,9 @@ UselessFlag = [
>        'ifneq (condition)\n'
>        'ANY_INSTALL_IMAGES = NO\n'
>        'endif\n'
> -     'ANY_INSTALL_REDISTRIBUTE = YES\n',
> +     'ANY_REDISTRIBUTE = YES\n',
>        [['any.mk:4: useless default value (url#_infrastructure_for_packages_with_specific_build_systems)',
> -       'ANY_INSTALL_REDISTRIBUTE = YES\n']]),
> +       'ANY_REDISTRIBUTE = YES\n']]),
>       ]
>   
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
