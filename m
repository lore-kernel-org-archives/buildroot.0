Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30C3C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 15:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7870842960;
	Thu,  6 Jan 2022 15:54:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cMfMPdWDvnSE; Thu,  6 Jan 2022 15:54:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8B2C42961;
	Thu,  6 Jan 2022 15:54:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 50AEE1BF3F6
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 15:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C896832D8
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 15:54:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fax4-AMr6NxO for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 15:54:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B6BF82BED
 for <buildroot@busybox.net>; Thu,  6 Jan 2022 15:54:54 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id w20so5627044wra.9
 for <buildroot@busybox.net>; Thu, 06 Jan 2022 07:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wEpbU52bLuhUEXJMEjoAIVRbUm/psLBr+VZw8y79adg=;
 b=S5kR2I2H/MOoNXLrvhtC3YP4Y2ERK4o0NFg0Et5vhO1Sy9iCYyWixR+k4TUxd2tq6E
 zk1rT9rGytusvouxVFCDb0ALPWLUZSAuzRCwppSTbrUHpViwqwysQb7l4EVxKudRPZfv
 DZe8r3+VuNUmN3/V0Q0CeCEFVNNqBWcWlkBE1Yl5ysUq4NK4y4u4y7GGM5mdRkMYVsgg
 KuHouJ/loRWDgLO6fLkVcJvPUQB6pRPJkDD0wdjJsgAXoTScyt4fGIvlO1wELnglVLHH
 y4lCi6GhkAzSpZiZ4B9nsX7pl/M7L0pwsRBKNUlc4r2wtlBzYX6ZQDjO2nOpO3Z6BXt6
 tJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wEpbU52bLuhUEXJMEjoAIVRbUm/psLBr+VZw8y79adg=;
 b=5eyFLXIeAda38VSxNvv/mMbesR0xrxo3UWoutIo4wXOnDsMf8U/5h0EG0GTJ/QB8Ko
 zzMIh3XFBEmkoD2Ur1n0CyGVcZj+njFjbf38SIg26ZP34nvubZYJea/BqZuXzZ17UygV
 9z72w4o9CYde3VnzuoWbR25w/Lr067sb1v7r3PsX/eYy6owsffMCFWFYkf7ND2Qg9ybT
 9EE85cVtqQli6PudSyWq2JsJwyxs/ef6+4nqiUjtMidp7IXs3lXJE6SCiunHLIvc5XQ9
 TvRPdKpW93y9RMqsbCocG0FwkYbM980g+Y4CWKh4C6bhhd7459HhXbc4831yYKvMWKny
 TDzw==
X-Gm-Message-State: AOAM530bwgcHh3NH6k9sClDrVs9CnC5ZBpDqmUQKi0FUIVWt9cMkPDpr
 kjmb29B4xqsgR+Z8zmUhRs4tWg==
X-Google-Smtp-Source: ABdhPJzcpfkz23beOWs1gEdB/R/6fMFSw5MJHLryxUOT6PsVRDOEZEo4g1i9d5MtG6HRyylp4ZreRA==
X-Received: by 2002:adf:fc50:: with SMTP id e16mr6933880wrs.554.1641484493134; 
 Thu, 06 Jan 2022 07:54:53 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id o3sm2778440wry.98.2022.01.06.07.54.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 07:54:52 -0800 (PST)
Message-ID: <835d05ab-20ed-8445-a2ef-285760b215a3@mind.be>
Date: Thu, 6 Jan 2022 16:54:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Changming Huang <jerry.huang@nxp.com>, buildroot@busybox.net
References: <20200207083857.28058-1-jerry.huang@nxp.com>
 <20200207083857.28058-7-jerry.huang@nxp.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200207083857.28058-7-jerry.huang@nxp.com>
Subject: Re: [Buildroot] [PATCH v5 7/9] package/qoriq-rcw:Enable IIC5_PMUX
 and CLK_OUT_PMUX for GPIO
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
Cc: michael@walle.cc, matthew.weber@collins.com, thomas.petazzoni@bootlin.com,
 geomatsi@gmail.com, heiko.thiery@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/02/2020 09:38, Changming Huang wrote:
> From: Jerry Huang <jerry.huang@nxp.com>
> 
> Because GPIO is used as interrupt for eNETC PHY and Micro-bus,
> IIC5_PMUX and CLK_OUT_PMUX are enabled for GPIO.

  This sounds like something really board specific, which should be applied 
upstream first and lacking that, it's IMHO better to use BR2_GLOBAL_PATCH_DIR 
and do it in the board-specific defconfig instead of patching qoriq-rcw package.

  In addition, qoriq-rcw has been updated so the patch maybe doesn't apply any more.

  Therefore, I marked this one as Rejected.

  Regards,
  Arnout

> 
> Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
> ---
> changes since v4:
> no changes.
> 
> changes since v3:
> no changes.
> 
> changes since v2:
> no changes.
> 
> changes since v1:
> 1. change to unconditional for these two patches.
> ---
>   ...b-Enable-IIC5_PMUX-for-GPIO-function.patch | 42 +++++++++++++++++++
>   ...nable-CLK_OUT_PMUX-for-GPIO-function.patch | 40 ++++++++++++++++++
>   2 files changed, 82 insertions(+)
>   create mode 100644 package/nxp/qoriq-rcw/0001-ls1028ardb-Enable-IIC5_PMUX-for-GPIO-function.patch
>   create mode 100644 package/nxp/qoriq-rcw/0002-ls1028ardb-Enable-CLK_OUT_PMUX-for-GPIO-function.patch
> 
> diff --git a/package/nxp/qoriq-rcw/0001-ls1028ardb-Enable-IIC5_PMUX-for-GPIO-function.patch b/package/nxp/qoriq-rcw/0001-ls1028ardb-Enable-IIC5_PMUX-for-GPIO-function.patch
> new file mode 100644
> index 0000000000..21c6c84cbd
> --- /dev/null
> +++ b/package/nxp/qoriq-rcw/0001-ls1028ardb-Enable-IIC5_PMUX-for-GPIO-function.patch
> @@ -0,0 +1,42 @@
> +From 33b403cee1fa215927bc65dc14baf35a2fdbe7b3 Mon Sep 17 00:00:00 2001
> +From: Jerry Huang <jerry.huang@nxp.com>
> +Date: Thu, 19 Sep 2019 12:12:20 +0800
> +Subject: [PATCH 1/2] ls1028ardb: Enable IIC5_PMUX for GPIO function
> +
> +Set IIC5_PMUX = 1 to enable GPIO function.
> +
> +Signed-off-by: Jianchao Wang <jianchao.wang@nxp.com>
> +Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
> +---
> + ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw | 2 +-
> + ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw   | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw b/ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw
> +index b46ea2e..5466a63 100644
> +--- a/ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw
> ++++ b/ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw
> +@@ -26,7 +26,7 @@ SYSCLK_FREQ=600
> + IIC2_PMUX=6
> + IIC3_PMUX=2
> + IIC4_PMUX=2
> +-IIC5_PMUX=2
> ++IIC5_PMUX=1
> + IIC6_PMUX=2
> + CLK_OUT_PMUX=2
> + EC1_SAI4_5_PMUX=5
> +diff --git a/ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw b/ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw
> +index 04e2208..1908d8c 100644
> +--- a/ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw
> ++++ b/ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw
> +@@ -26,7 +26,7 @@ SYSCLK_FREQ=600
> + IIC2_PMUX=6
> + IIC3_PMUX=2
> + IIC4_PMUX=2
> +-IIC5_PMUX=2
> ++IIC5_PMUX=1
> + IIC6_PMUX=3
> + CLK_OUT_PMUX=2
> + EC1_SAI4_5_PMUX=5
> +--
> +2.17.1
> diff --git a/package/nxp/qoriq-rcw/0002-ls1028ardb-Enable-CLK_OUT_PMUX-for-GPIO-function.patch b/package/nxp/qoriq-rcw/0002-ls1028ardb-Enable-CLK_OUT_PMUX-for-GPIO-function.patch
> new file mode 100644
> index 0000000000..4f00541d69
> --- /dev/null
> +++ b/package/nxp/qoriq-rcw/0002-ls1028ardb-Enable-CLK_OUT_PMUX-for-GPIO-function.patch
> @@ -0,0 +1,40 @@
> +From 4a3c9ea5d0c7bf8eec8cb6276d6f4d940f3946db Mon Sep 17 00:00:00 2001
> +From: Jerry Huang <jerry.huang@nxp.com>
> +Date: Thu, 19 Sep 2019 12:13:48 +0800
> +Subject: [PATCH 2/2] ls1028ardb/rcw: Enable CLK_OUT_PMUX for GPIO function
> +
> +Signed-off-by: Jianchao Wang <jianchao.wang@nxp.com>
> +Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
> +---
> + ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw | 2 +-
> + ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw   | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw b/ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw
> +index 5466a63..a5ed4d4 100644
> +--- a/ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw
> ++++ b/ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw
> +@@ -28,7 +28,7 @@ IIC3_PMUX=2
> + IIC4_PMUX=2
> + IIC5_PMUX=1
> + IIC6_PMUX=2
> +-CLK_OUT_PMUX=2
> ++CLK_OUT_PMUX=1
> + EC1_SAI4_5_PMUX=5
> + EC1_SAI3_6_PMUX=5
> + USB3_CLK_FSEL=39
> +diff --git a/ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw b/ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw
> +index 1908d8c..c930b83 100644
> +--- a/ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw
> ++++ b/ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw
> +@@ -28,7 +28,7 @@ IIC3_PMUX=2
> + IIC4_PMUX=2
> + IIC5_PMUX=1
> + IIC6_PMUX=3
> +-CLK_OUT_PMUX=2
> ++CLK_OUT_PMUX=1
> + EC1_SAI4_5_PMUX=5
> + EC1_SAI3_6_PMUX=5
> + USB3_CLK_FSEL=39
> +--
> +2.17.1
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
