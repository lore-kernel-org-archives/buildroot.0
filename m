Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432E7C433F5
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 14:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D52EF41000;
	Wed, 25 May 2022 14:25:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YlTp6YM3ZOG1; Wed, 25 May 2022 14:25:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 420AB40FEC;
	Wed, 25 May 2022 14:25:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 86FFB1BF2CA
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 14:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73B9C41C29
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 14:25:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id svjT99rPZPqF for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 14:25:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F21041C19
 for <buildroot@buildroot.org>; Wed, 25 May 2022 14:25:38 +0000 (UTC)
Received: from [77.244.183.192] (port=63512 helo=[192.168.178.75])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1ntrx9-000C25-IM; Wed, 25 May 2022 16:25:35 +0200
Message-ID: <16f0674d-b933-730c-7600-45453d1d21f7@lucaceresoli.net>
Date: Wed, 25 May 2022 16:25:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: it-IT
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
References: <20220523053921.4076488-1-neal.frager@amd.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <20220523053921.4076488-1-neal.frager@amd.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_xxx_defconfig:
 uboot dp pll patch
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
Cc: giulio.benetti@benettiengineering.com, michal.simek@amd.com,
 wesley@sonifex.co.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On 23/05/22 07:39, Neal Frager wrote:
> This patch fixes the DP audio and video PLL configurations for the zynqmp-sm-k26-revA som.
> It needs to be applied for both the kv260 and kr260 starter kits.
> 
> The Linux DP driver expects the DP to be using the following PLL config:
>   - DP video PLL should use the VPLL (0x0)
>   - DP audio PLL should use the RPLL (0x3)
>   - DP system time clock PLL should use RPLL (0x3)
> 
> Register 0xFD1A0070 configures the DP video PLL.
> Register 0xFD1A0074 configures the DP audio PLL.
> Register 0xFD1A007C configures the DP system time clock PLL.
> 
> This patch was build and run tested on a zynqmp-kria-kv260 target board.
> 
> Upstream-Status: submitted (https://lore.kernel.org/all/fa7e9abc419c9d7648405d1c62367dbe701d09b8.1652709736.git.michal.simek@amd.com/)
> This patch will be removed from buildroot in a future release when no longer necessary.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
