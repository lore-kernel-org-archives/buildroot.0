Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFE1C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 07:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19689412A7;
	Fri, 12 Jul 2024 07:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id evToL-bOYB98; Fri, 12 Jul 2024 07:06:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98DF0412AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98DF0412AA;
	Fri, 12 Jul 2024 07:06:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D0DCF1BF48C
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB352607C2
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYTSCIyOa4M0 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 07:06:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C86CA607BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C86CA607BC
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C86CA607BC
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 07:06:49 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4266f344091so12962795e9.0
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 00:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720768008; x=1721372808;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sJt+TSPmyIQQhWOkitAuAd6zPurz8kSv3j/uhGPkOiY=;
 b=uK/En9KD7K+6ylnGqwcrAHgcS/imehAR9A3Uyfd5K+IjOnYyvfBgWtzEh7IYWWsu75
 WWoguTk5Hg685v0CDjMXDHVOKlOfvDsbFm1FLFy4Senx3HbSXLkocqAcBqL1gPG1uGu3
 H3yvMk87YNh13L6Bm07aEOrNSMeorp29J+DRf21NtetV1zEqAYVPf1wptX3TxygiQdUU
 R5jEHMLsLsjnhMDywR+n+XoGTWk4gPXISJmgE/HpM7eScP+WsgVlzwYDdCsGROVliCvc
 SLaaTj3SIGsoMEcvnd/AVWryP5XMl4860e1ueCVi2EnTJH6Lr/Mr4N/jAgroQWHSmwLf
 A0XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIhGkeSp8D5tw7NTADf6THMr7VQHvL+Viea0fBiea9NisV7jCe/dkbSNC/gTmlfP6n0sLMGZrKOh/U3V4LLl30LTnttYhNVw==
X-Gm-Message-State: AOJu0YyD8T3tM4LdpBktKPEi3JRmlMvKE2x1lkm/cV//kqtQuSC6X2V+
 kWdOscbsrqNvgZAhijtfwRLd7DsA9KA3gE61b9OqStkalkdte/Bk5r0x4J9y1EQ=
X-Google-Smtp-Source: AGHT+IFvispkgB1LlSBoRSi1P930EKvYt8d+atL9jALLaocir5682DRomsUkcq1eBNcVV0ajjmidwQ==
X-Received: by 2002:a05:600c:4930:b0:425:5ec3:570b with SMTP id
 5b1f17b1804b1-426708f1f07mr65367355e9.35.1720768007624; 
 Fri, 12 Jul 2024 00:06:47 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f23a000sm12491785e9.5.2024.07.12.00.06.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 00:06:47 -0700 (PDT)
Message-ID: <0587aae9-0c5f-464d-8a59-3ef81e8add87@mind.be>
Date: Fri, 12 Jul 2024 00:36:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chris Dimich <cdimich2188@gmail.com>, buildroot@buildroot.org
References: <20240611180007.2127244-1-cdimich2188@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240611180007.2127244-1-cdimich2188@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720768008; x=1721372808; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sJt+TSPmyIQQhWOkitAuAd6zPurz8kSv3j/uhGPkOiY=;
 b=XC9dphEDtHw/4ibbWiRd9Tx4z9LhqDXNsP4C0OMDQKiQdepkqIYMUDpx2AuG/ElW8+
 cNkKAg6OahxZwJRfe9Dwc2djtFw/XbOgDOU8VuvZFTDYFjQBGJVusBNMIxii6L614XyU
 QhvyE0P/RoCiihySv9mDhx5tPzZc94Gkd1YMZT+X8x39MisRs577KPVf2tYnXM2bTbK3
 KlqlskgmwhK1Q2yi4EpHxA/pt2bkSbpZlFXxRKGJ6150Ig2ZSrVQ7TjSo1warBqB69SL
 3S3mqIEQH8hxFLsAYB2OQyQtmURe6BIPdrqo2kzT7ly4XBznXi4iSsfUpptLW640x6Vj
 kiPw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XC9dphED
Subject: Re: [Buildroot] [PATCH 00/12] freescale-imx: update/add various
 packages as per NXP 6.1.55-2.2.0 release
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/06/2024 19:59, Chris Dimich wrote:
> This series updates various freescale-imx packages as per
> NXP 6.1.55-2.2.0 release. Also includes i.MX 8ULP support addition
> as well as a new package: firmware-upower.

  Series applied to master, thanks!

  Two comments on two of the patches, which I'll mail separately.

  Regards,
  Arnout

> 
> Chris Dimich (12):
>    package/freescale-imx/firmware-imx: bump to version 8.22
>    package/freescale-imx/imx-codec: bump to version 4.8.2
>    package/freescale-imx/imx-gpu-g2d: bump to version 6.4.11.p2.2
>    package/freescale-imx/imx-gpu-viv: bump to version 6.4.11.p2.2
>    package/freescale-imx/imx-seco: bump to version 5.9.2
>    package/freescale-imx/imx-vpu-hantro: bump to version 1.31.0
>    package/freescale-imx/imx-vpu-hantro-daemon: bump to version 1.1.9
>    package/freescale-imx/imx-vpu-hantro-vc: bump to version 1.9.1
>    package/freescale-imx/kernel-module-imx-gpu-viv: bump to version
>      6.4.11.p.2.2
>    package/freescale-imx: add i.MX 8ULP support
>    package/freescale-imx/firmware-upower: new package
>    board/freescale/common/imx: add support for i.MX 8ULP
> 
>   .../common/imx/imx8-bootloader-prepare.sh     | 19 ++++++++++
>   package/freescale-imx/Config.in               | 36 +++++++++++++++++--
>   .../freescale-imx/firmware-ele-imx/Config.in  |  3 ++
>   package/freescale-imx/firmware-imx/Config.in  |  1 +
>   .../firmware-imx/firmware-imx.hash            |  6 ++--
>   .../firmware-imx/firmware-imx.mk              |  2 +-
>   .../freescale-imx/firmware-upower/Config.in   | 22 ++++++++++++
>   .../firmware-upower/firmware-upower.hash      |  4 +++
>   .../firmware-upower/firmware-upower.mk        | 27 ++++++++++++++
>   .../freescale-imx/imx-codec/imx-codec.hash    |  6 ++--
>   package/freescale-imx/imx-codec/imx-codec.mk  |  2 +-
>   .../imx-gpu-g2d/imx-gpu-g2d.hash              |  8 ++---
>   .../freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk  |  4 +--
>   .../imx-gpu-viv/imx-gpu-viv.hash              |  8 ++---
>   .../freescale-imx/imx-gpu-viv/imx-gpu-viv.mk  |  4 +--
>   package/freescale-imx/imx-seco/imx-seco.hash  |  6 ++--
>   package/freescale-imx/imx-seco/imx-seco.mk    |  2 +-
>   .../imx-vpu-hantro-daemon.hash                |  2 +-
>   .../imx-vpu-hantro-daemon.mk                  |  2 +-
>   .../imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash  |  6 ++--
>   .../imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk    |  2 +-
>   .../imx-vpu-hantro/imx-vpu-hantro.hash        |  6 ++--
>   .../imx-vpu-hantro/imx-vpu-hantro.mk          |  2 +-
>   .../kernel-module-imx-gpu-viv.hash            |  2 +-
>   .../kernel-module-imx-gpu-viv.mk              |  2 +-
>   25 files changed, 146 insertions(+), 38 deletions(-)
>   create mode 100644 package/freescale-imx/firmware-upower/Config.in
>   create mode 100644 package/freescale-imx/firmware-upower/firmware-upower.hash
>   create mode 100644 package/freescale-imx/firmware-upower/firmware-upower.mk
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
