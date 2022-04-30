Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56B6C433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1C26404D5;
	Sat, 30 Apr 2022 18:52:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hip2uknxRECq; Sat, 30 Apr 2022 18:52:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A537B4032A;
	Sat, 30 Apr 2022 18:52:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 55B1E1BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 520C960B58
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:52:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gSmj00ptGKLI for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:52:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59BEF60B4D
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:52:17 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id be20so12467166edb.12
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 11:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=EKhIC7oEAwkqCgrtLjs+jJepvMBIEAukZH/dAImtZqU=;
 b=O4jisihE4kA1QAtGAqOvGEobggk8K1kkb+iLTpqtewvCJrL5Kpjux0MZbIUkI1b32T
 BnqgZb8kQJpg4lePUSZi/pjy15J9UkHz/+tfJJgYq62BfFuJwv7emCtBCqN1MVlD3Hbw
 /rKD3PXqQYzVUfs9nARYfc97ySEP2uOluT9/A4RUucqJcKujl5Xn20eTWrATBswLXHQs
 vEZ25zq+IC+YVkdEcvy88EmzGjvIRjKjnnSB5XnfQDgI/HWNbH/KiXphhcCXTPDX3m1M
 WAs934TsyY8l/ecOl0nth7skYNEP0Zpyja6ojVNPvMj/RZOztAjTSg1c7rQ4xnWGyYyi
 9M1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=EKhIC7oEAwkqCgrtLjs+jJepvMBIEAukZH/dAImtZqU=;
 b=il+gp8sq0cxctMBuIroJAG6G70KsYfQlDzjFNjpDBQ8FyzoZAYhKRhMyIq4yUdKV3l
 Tuj+3G/sBq3YZnm5eo7dE+JVAkEHlF2hqAAdJr2wDg2aD3Z7MbN333Zo5KqI7u6HTXll
 U0k38iL7jZ5i2RDRLNoktfxXAuvL83JcCuWb3Q1r67IIL+jGlZ9AtDqKL2ANg7HWyc1L
 JFZagsMGRZINXoEo72oZZk6afrkk0CzxopqyXq1faK0Jj9F36As+4/wQSc3/T2U5cD1V
 RKr0kSoxmbx+KZUGY2sCAh8DT8aTtXZ3QwhrIVAeu3gfMPLR5JkowAusVJ/RKZXdilJa
 mtRg==
X-Gm-Message-State: AOAM533zsSvdpGr/TyuUZcJlUWP4nI1gAnPmlWTy1DFlQlYADHzrjC+R
 YuvKRyBxwk7OrDerbb0VoXNagw==
X-Google-Smtp-Source: ABdhPJylzAHQJ+x6dCVzymF+lZEho9JDn7oGjuS3/egnTeOBQsCIacLAGiKN9LpmpmJ0vRmFeqo/og==
X-Received: by 2002:a05:6402:51cf:b0:424:494:e240 with SMTP id
 r15-20020a05640251cf00b004240494e240mr5515729edd.135.1651344735575; 
 Sat, 30 Apr 2022 11:52:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 qp24-20020a170907a21800b006f3ef214df9sm1859229ejc.95.2022.04.30.11.52.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 11:52:15 -0700 (PDT)
Message-ID: <db85cbd8-a9d2-aeb7-77cc-935e77f08f30@mind.be>
Date: Sat, 30 Apr 2022 20:52:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220429191531.4173116-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220429191531.4173116-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: increase default
 target rootfs size to 5G
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



On 29/04/2022 21:15, James Hilliard wrote:
> Since there isn't a way to reliably compute the required size lets
> just set it to what should be a high enough value to not run out
> of space.
> 
> Fixes:
>   - http://autobuild.buildroot.net/results/a3c68cdc515353c0d2650ee743aa3bd8ab99a418
>   - http://autobuild.buildroot.net/results/ad426ff903d78a92de8f0208876e2196136a09a8
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  I verified that both create sparse files (they do), mentioned this in the 
commit message, and applied to master, thanks.

  What about btrfs? Not needed?

  Regards,
  Arnout

> ---
>   utils/genrandconfig | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index adefb8f502..ab1f6f43b1 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -200,6 +200,8 @@ def fixup_config(sysinfo, configfile):
>       with open(configfile) as configf:
>           configlines = configf.readlines()
>   
> +    ROOTFS_SIZE = '5G'
> +
>       BR2_TOOLCHAIN_EXTERNAL_URL = 'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/'
>   
>       if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not sysinfo.has("java"):
> @@ -441,6 +443,16 @@ def fixup_config(sysinfo, configfile):
>           configlines.remove('BR2_TARGET_OPTEE_OS=y\n')
>           configlines.remove('BR2_TARGET_OPTEE_OS_PLATFORM=""\n')
>   
> +    if 'BR2_TARGET_ROOTFS_EXT2_GEN=y\n' in configlines and \
> +       'BR2_TARGET_ROOTFS_EXT2_SIZE="60M"\n' in configlines:
> +        configlines.remove('BR2_TARGET_ROOTFS_EXT2_SIZE="60M"\n')
> +        configlines.append('BR2_TARGET_ROOTFS_EXT2_SIZE="%s"\n' % ROOTFS_SIZE)
> +
> +    if 'BR2_TARGET_ROOTFS_F2FS=y\n' in configlines and \
> +       'BR2_TARGET_ROOTFS_F2FS_SIZE="100M"\n' in configlines:
> +        configlines.remove('BR2_TARGET_ROOTFS_F2FS_SIZE="100M"\n')
> +        configlines.append('BR2_TARGET_ROOTFS_F2FS_SIZE="%s"\n' % ROOTFS_SIZE)
> +
>       if 'BR2_TARGET_S500_BOOTLOADER=y\n' in configlines and \
>          'BR2_TARGET_S500_BOOTLOADER_BOARD=""\n' in configlines:
>           configlines.remove('BR2_TARGET_S500_BOOTLOADER=y\n')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
