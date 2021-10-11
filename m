Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DFBC433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 20:51:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A083260462
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 20:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A083260462
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7049340491;
	Mon, 11 Oct 2021 20:51:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1XqBBTUggeCM; Mon, 11 Oct 2021 20:51:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA7EC404A7;
	Mon, 11 Oct 2021 20:51:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 054581BF279
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 20:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8E2760856
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 20:51:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rLFpGvATa2QE for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 20:51:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA6FF60709
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 20:51:47 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id z20so72358876edc.13
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 13:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=fUwYSLD/T60HH1T3WH5/Jpb+oAckacY+9dl/pv011Bo=;
 b=BxvVhVr2ESD+kSNsNohGFdXdIQTQoMZpP1lDqZLvjRcX1kCq8ZGZgN6y+/gnHAhcvm
 j2n1Hb9vo2fAXxm7Y01gFKGP9elC73N4Q2OEsZdbIQcnNfuTArpg63JDWqm6C7qhfGoa
 q8AOn47r28aIpyaYmIHobmJ+Y12jlkiYaQOwk4aDbrFU2eAYh7si6DAFChLjdGBfh45+
 iokNzyKQh0yVOfaz09QjK++EgJQ7YTtrLXaR0DysuhiXLDkqh+TC/HdpoxRPLc7N55Iv
 LR1BMQYq+TwGKOW0FAOu5Qx/IpLKmLhny4HqUvJEuve5PcSdVmc58tCY2DNDbYQ7vOjX
 8q+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fUwYSLD/T60HH1T3WH5/Jpb+oAckacY+9dl/pv011Bo=;
 b=vP0QgqwRmY7p8K+uKtRf+n9d3H41QssD60jWNOnAAUC+GWmo8WL1+s2Qx/GlAwz38O
 oZL5TBOe0lPiR/LhFW7r8Ez8s1aVRvwYoKtyaDZO2FXSrA3T1YUoHXBaq6Cj4orZ0fca
 unSFq3JroDsxaWsRwsRDfuTc2+9pMqohYwsWj2zfDp5ogew9K3T/0GERAIpjADXv5wWM
 EK+KcpgVbvea1gzI3ALpPqpfsBH+9CZAMzuZmQpJViKWvY7b3dT5nVG5Q3gH7KMUTUDK
 GSGG4ALhqkRnU8QP2Cce7dwQdMUBH5Fp9ka/A4Eh7cL5Akp1bP7z3KOdw6YU42hsv1tU
 A3kQ==
X-Gm-Message-State: AOAM533IcmJGuY+9Xg3wZu60LsnRu/qcccb84/waHimw6NRUvcGfaRz+
 5k5Rgs2H6AAU30LuT+C2X8VXyA==
X-Google-Smtp-Source: ABdhPJyO+dDsXOlmxRBZagTpokas28EOKifo9b2vB4WTYvAfYQfQGoqbXjROfYfVIljbcXBvngu/HQ==
X-Received: by 2002:a50:e005:: with SMTP id e5mr44804645edl.211.1633985505672; 
 Mon, 11 Oct 2021 13:51:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id k10sm3978672ejo.117.2021.10.11.13.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 13:51:45 -0700 (PDT)
Message-ID: <ae3b2201-88c4-7d72-af3e-d62553e1d101@mind.be>
Date: Mon, 11 Oct 2021 22:51:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
References: <20210928160042.1618453-1-fido_max@inbox.ru>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210928160042.1618453-1-fido_max@inbox.ru>
Subject: Re: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to
 2.4.2
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



On 28/09/2021 18:00, Maxim Kochetkov via buildroot wrote:
> Release notes: https://github.com/timescale/timescaledb/releases/tag/2.4.2
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/timescaledb/timescaledb.hash | 2 +-
>   package/timescaledb/timescaledb.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
> index 4b6d6f77a8..4e3e91e152 100644
> --- a/package/timescaledb/timescaledb.hash
> +++ b/package/timescaledb/timescaledb.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  1adbff3ae7f8f39d1b5ac2189d60b9bd0a8154c0c3603e53b030a204f72d86af  timescaledb-2.4.0.tar.gz
> +sha256  b206a376251259eb745eee819e7a853b3fbab9dc8443303714484a0fef89a2a4  timescaledb-2.4.2.tar.gz
>   sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
> diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
> index 900bac5a7e..4adf2bdbb3 100644
> --- a/package/timescaledb/timescaledb.mk
> +++ b/package/timescaledb/timescaledb.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -TIMESCALEDB_VERSION = 2.4.0
> +TIMESCALEDB_VERSION = 2.4.2
>   TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
>   TIMESCALEDB_LICENSE = Apache-2.0
>   TIMESCALEDB_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
