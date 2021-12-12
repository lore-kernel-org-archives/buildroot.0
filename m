Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57CEC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 678EC4299E;
	Sun, 12 Dec 2021 12:17:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lMQTvYyjrtWs; Sun, 12 Dec 2021 12:17:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 881F341E40;
	Sun, 12 Dec 2021 12:17:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B05E71BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D1654053D
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:17:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UygGA7wqyfhP for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:17:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4832F4052F
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:17:16 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id x10so26319764edd.5
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 04:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1fsjmOUFgEMMzjMRNZAMPHCt/roxpMmQykv62W6De7Y=;
 b=UbrzTmVZYFdwtYp8wAD+QlnyNKfM6FZYxUt/s+wMune6F+nXsY9xLMh6msZC4b9RPm
 pQM86F12NLPZ1wUDmg7oLps2YUskWtSjqS3+ie3MgAxNVBczVwjpAYP1f5Hr03te9fab
 fWLOdh4QzRNifIMjESjGpiA9czKEI4EIoDCedKOuhIqxyFeiKg2AxwTrFjISWQF9OPyc
 oIRRqePzXPATbBmLOIze/xxNpcCbPzrNSRQGG8ShO38ICNSM6MXqrdFYT41oRwI/zHGh
 fV5CCOH0UlZbHTncDffG69SqpeSENrnVX90LtAv0dcfy1vuZrI/xZgYKo/RyXuc7pnZx
 JEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1fsjmOUFgEMMzjMRNZAMPHCt/roxpMmQykv62W6De7Y=;
 b=jxPU1oACqepK8LVetR6OI/S/KhBER/rohBKpwER+YXhtfdWFxPrF1tkOLpAyBfVKce
 Qyoqp3I95mvWpaG3xCTh+xQSG9uc1N5xIsBOv7ghzaUZEtg9dLl6/vmTKA6ibL4+0agv
 +OX1kEDDeV2eRiAyxqr2YcT8YGCZOL/Nn/8lMmYO4nScEinNnKkIdUV+w8D2grPbTasf
 JGC2DKzN8xr4qdJ43Koova4TLESVim3FCnVkRJ5BGRDXZo34RxFe6OkPrRD99vW7/+LX
 BYtftCiG3gTGnXVtWqeNV0N3Iu1RPFZ/SvqhFLHgtdbo//zELX7GBYHizD3Z36HBSFA9
 roNw==
X-Gm-Message-State: AOAM530q3pXgHmcCt9+9iwKzSjZ5eOx4NC8xNqlq2Usz3XQPpmAbKAyA
 C9XJZOodNCGiCCgmU2cJr50dsg==
X-Google-Smtp-Source: ABdhPJzbiZ49Cut5yJDjcoewdtjoBT0r8p2+uvxy1356TV+kozo7SwgxkQl/V+4cylfLmPOKVwtO4g==
X-Received: by 2002:a17:906:7310:: with SMTP id
 di16mr35734105ejc.92.1639311434514; 
 Sun, 12 Dec 2021 04:17:14 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f22sm4662161edf.93.2021.12.12.04.17.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 04:17:14 -0800 (PST)
Message-ID: <e3cfa3f8-2ec0-5737-42b7-ffb27182982c@mind.be>
Date: Sun, 12 Dec 2021 13:17:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211207171424.2857299-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211207171424.2857299-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/frr: bump to version 8.1
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
Cc: Vadim Kochan <vadim4j@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/12/2021 18:14, Fabrice Fontaine wrote:
> - host-elfutils is mandatory since version 8.0 and
>    https://github.com/FRRouting/frr/commit/5609b3af497c44d980aad2bc7d6332dedd7974e7
> - This bump is needed to fix the following build failure since bump of
>    libyang to version 2.0.112 in commit
>    2a3edc5e00b38f4f927894d0911990c9060e4415:
> 
> In file included from lib/northbound.c:20:
> lib/northbound.c: In function 'nb_node_check_config_only':
> lib/northbound.c:97:22: error: dereferencing pointer to incomplete type 'const struct lys_node'
>     97 |  if (CHECK_FLAG(snode->flags, LYS_CONFIG_R)) {
>        |                      ^~
> 
> - Update indentation in hash file (two spaces)
> 
> https://github.com/FRRouting/frr/releases/tag/frr-8.0
> https://github.com/FRRouting/frr/releases/tag/frr-8.1
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/bd779ee960ba2181bc60313569c77c1e60b4e726
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/frr/frr.hash | 4 ++--
>   package/frr/frr.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/frr/frr.hash b/package/frr/frr.hash
> index 3a044d4c2a..bb6c32b7bb 100644
> --- a/package/frr/frr.hash
> +++ b/package/frr/frr.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256 030d4e66f577726dfea13bd3a9c669fd41d8fd89b25953a36b5b0966d406ff28  frr-7.5.1.tar.gz
> -sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> +sha256  9d82c11b304ab89a30627fcbb4150f51e639f473f8563976e14101e796240599  frr-8.1.tar.gz
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/frr/frr.mk b/package/frr/frr.mk
> index d1ca6e0b18..e707f50ca1 100644
> --- a/package/frr/frr.mk
> +++ b/package/frr/frr.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -FRR_VERSION = 7.5.1
> +FRR_VERSION = 8.1
>   FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
>   FRR_LICENSE = GPL-2.0
>   FRR_LICENSE_FILES = COPYING
> @@ -15,7 +15,7 @@ FRR_AUTORECONF = YES
>   FRR_DEPENDENCIES = host-frr readline json-c \
>   	libyang libnl c-ares
>   
> -HOST_FRR_DEPENDENCIES = host-flex host-bison host-python3
> +HOST_FRR_DEPENDENCIES = host-flex host-bison host-elfutils host-python3
>   
>   FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
>   	--sysconfdir=/etc/frr \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
