Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A6FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 20:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4936640A8C;
	Thu, 14 Apr 2022 20:05:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id URMEIhuhLLfV; Thu, 14 Apr 2022 20:05:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47FF240286;
	Thu, 14 Apr 2022 20:05:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 07D901BF393
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DEAF81B60
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:05:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 149vOgtDh-Cb for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 20:05:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 38AEE81C2F
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 20:05:10 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id c64so7698062edf.11
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 13:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VcweGtiDwjEGKewSAuqChoThyNukFQBPWNCEfbbkF5k=;
 b=AI2zoJ2ZZsZu277+wXqf0Rp6SdIlBX3ylQXo/r0QUMKxIFcbbrfye5W4C7YMPuGqPW
 MM+VOLTpeIFhNBaSZmiyNrQ8XDCY2TpaHm3bRucHEO+sPeXIc9PcDEIQbupcCmF4SCG4
 zNYT9Y8xC4u5y6AMnVhjtBJrjAJuM6T6g6t9ZphunX5DwmB+nM9isiG+6uNt3r3C1JOD
 M5fzNyPbozA+ckm6hyXmqnk+3/OU83bPoBSYMhu/+3UYDMjOxRP6T1Y2pV36xLiu5o2Y
 6gXsy09bfuNHgb3Pa3MGH6PIqc9vlzZbBsIRaOal4j42HGvU/H4vSU5PO73iUTgICitz
 +BLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VcweGtiDwjEGKewSAuqChoThyNukFQBPWNCEfbbkF5k=;
 b=cJ4pTFr1Qe2lWfiA61hOjQ4hQx3bqSfiBVKARKjiKYtOiSCYsbxrbd0d2AzDTTME4m
 YWJ7zVtjPKDRQNWLuXRgfkYMJkYa9zkuk2Rp/9Ec7ODzLCVSNBIGZfJ87kTNb9TYPFiw
 MpPq/wdDTMWSSpnTsGREK2joilEOtH8+B33Ets81pd4qzTSNzrjmJ/JDZuJ+8Prxi7OJ
 noSrMev1Bg4bcjWXpJAOaQvEAjHiDouWvk1tMDOChOG7pN99VJqKw3qukKJpCgIcVBuy
 tQWiGXxIBeBFMDSYzPpO1KExLX1n8vSbQ6RDRCehiT+ek1KhwX6jZTkd7l17tcD3Qy9o
 L/nQ==
X-Gm-Message-State: AOAM5300hW8HCSMVu4Fc0TI1QAJZ5lzCj1nQGnUeIhME2x7yGE54rCRx
 fIVzI71taKmqUNXNkx5E71HzVSZCgh1D9g==
X-Google-Smtp-Source: ABdhPJx+3UlAzmQVzoeKblkET/NWALN5mB5SQndCwHqm7KIwwHJdksLfnCmVcSaxg+go4M/ZmHayzQ==
X-Received: by 2002:aa7:d497:0:b0:41d:6fed:9f90 with SMTP id
 b23-20020aa7d497000000b0041d6fed9f90mr4844034edr.325.1649966708221; 
 Thu, 14 Apr 2022 13:05:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 jr16-20020a170906a99000b006e4c05e8919sm956399ejb.35.2022.04.14.13.05.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 13:05:07 -0700 (PDT)
Message-ID: <6119a03e-24d5-c988-f483-1c3efccda300@mind.be>
Date: Thu, 14 Apr 2022 22:05:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Danilo <mail@dbrgn.ch>, buildroot@buildroot.org
References: <20220410010640.1fdc8ada@c3po>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220410010640.1fdc8ada@c3po>
Subject: Re: [Buildroot] [PATCH 1/1] package/janus-gateway: Add systemd
 service file
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
Cc: Gregory Dymarek <gregd72002@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/04/2022 01:06, Danilo wrote:
> 
> Signed-off-by: Danilo Bargen <mail@dbrgn.ch>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/janus-gateway/janus-gateway.mk      |  5 +++++
>   package/janus-gateway/janus-gateway.service | 13 +++++++++++++
>   2 files changed, 18 insertions(+)
>   create mode 100644 package/janus-gateway/janus-gateway.service
> 
> diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
> index 84ca0bc116..381843a0af 100644
> --- a/package/janus-gateway/janus-gateway.mk
> +++ b/package/janus-gateway/janus-gateway.mk
> @@ -131,4 +131,9 @@ else
>   JANUS_GATEWAY_CONF_OPTS += --disable-systemd-sockets
>   endif
> 
> +define JANUS_GATEWAY_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 644 package/janus-gateway/janus-gateway.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/janus-gateway.service
> +endef
> +
>   $(eval $(autotools-package))
> diff --git a/package/janus-gateway/janus-gateway.service b/package/janus-gateway/janus-gateway.service
> new file mode 100644
> index 0000000000..6e6bc7f017
> --- /dev/null
> +++ b/package/janus-gateway/janus-gateway.service
> @@ -0,0 +1,13 @@
> +[Unit]
> +Description=Janus WebRTC Gateway
> +Wants=network.target
> +StartLimitIntervalSec=0
> +
> +[Service]
> +Type=simple
> +ExecStart=/usr/bin/janus
> +Restart=on-failure
> +RestartSec=5
> +
> +[Install]
> +WantedBy=multi-user.target
> --
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
