Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C751C433F5
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 08:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3829D41866;
	Thu,  5 May 2022 08:47:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UtT0ySrmNfKe; Thu,  5 May 2022 08:47:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EABC341814;
	Thu,  5 May 2022 08:47:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC49F1BF35B
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 08:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8DB4401B7
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 08:47:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AIIcBz3EhSgX for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 08:47:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96913400A4
 for <buildroot@buildroot.org>; Thu,  5 May 2022 08:47:36 +0000 (UTC)
Received: from [77.244.183.192] (port=62432 helo=[192.168.178.75])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nmX93-000EpF-Tq; Thu, 05 May 2022 10:47:33 +0200
Message-ID: <58490506-19b4-081a-8240-cdbda33aa92f@lucaceresoli.net>
Date: Thu, 5 May 2022 10:47:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
References: <20220504140417.1204631-1-neal.frager@amd.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <20220504140417.1204631-1-neal.frager@amd.com>
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
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_zcu106_defconfig:
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
Cc: giulio.benetti@benettiengineering.com, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 04/05/22 16:04, Neal Frager wrote:
> This patch adds a u-boot patch that fixes the DP audio and video
> PLL configurations for the zynqmp-zcu106-revA evaluation board.
> 
> The Linux DP driver expects the DP to be using the following PLL config:
>   - DP video PLL should use the VPLL (0x0)
>   - DP audio PLL should use the RPLL (0x3)
> 
> Register 0xFD1A0070 configures the DP video PLL.
> Register 0xFD1A0074 configures the DP audio PLL.
> 
> This patch was build and run tested on a zynqmp-zcu106-revA target board.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  ...zynqmp-zcu106-revA-Fix-DP-PLL-config.patch | 39 +++++++++++++++++++

I haven't seen this patch on the U-Boot mailing list. The best practice
for fixes to packages is to send a patch to the upstream project (in the
U-Boot case it would be a patch sent to their mailing list) and then
integrate it in Buildroot with the addition of a line such as:

Upstream-Status: submitted (https://.....)

To have the topic traceable and mark that the patch is probably ending
in a future release.

This is not a major bug, it is rather an annoyance, thus it's worth
spending a little extra time and have a clean patch here.

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
