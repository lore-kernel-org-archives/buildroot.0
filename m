Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D50C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 18:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDDD3415C8;
	Sun,  3 Dec 2023 18:24:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDDD3415C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ksVPm7dv9lvW; Sun,  3 Dec 2023 18:24:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F7B9415A7;
	Sun,  3 Dec 2023 18:24:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F7B9415A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 85DB01BF408
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 18:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 579AC4156C
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 18:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 579AC4156C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bB0kJ3Y-_QQS for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 18:24:52 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 085AE4155F
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 18:24:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 085AE4155F
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8543240002;
 Sun,  3 Dec 2023 18:24:47 +0000 (UTC)
Message-ID: <a239b638-8c8b-47c1-8ff5-7d760e5ecb43@korsgaard.com>
Date: Sun, 3 Dec 2023 19:24:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
References: <20231026115034.2924408-1-neal.frager@amd.com>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20231026115034.2924408-1-neal.frager@amd.com>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v4 1/1] configs/zynqmp_kria_kr260_defconfig:
 new defconfig
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
Cc: Bradley.Gamble@entrust.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, thomas.petazzoni@bootlin.com, david.evans@ebv.com,
 dylan.bespalko@amd.com, michal.simek@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 26/10/2023 13.50, Neal Frager wrote:
> This patch adds support for Xilinx Kria KR260 starter kit.
> 
> KR260 features can be found here:
> https://www.xilinx.com/products/som/kria/kr260-robotics-starter-kit.html
> 
> While the Kria SOM is based on a ZynqMP SoC, there are some key
> boot config differences from the other ZynqMP evaluation boards.
> 
> 1. There are no boot switches on Kria SOMs. The boot mode is thus
> hard configured for QSPI flash. A pre-programmed boot.bin comes
> with every Starter Kit. U-Boot can then find the Linux kernel and
> file system on the SD card.
> 
> Optional instructions for updating the boot.bin in the QSPI flash
> can be found in the readme.txt file and the link below.
> 
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+K26+SOM
> 
> 2. Kria SOMs use UART1 for the console instead of UART0. For this
> reason, Kria Starter Kits will use a separate extlinux.conf file
> from other ZynqMP evaluation boards.
> 
> 3. The KR260 has a USB to SD card bridge, so the Linux kernel
> and file system are found on /dev/sda1 and /dev/sda2.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
>   - Submitted tri-state patches upstream
> V2->V3:
>   - Formatted upstream patches to remove all of the mail server messages
> V3->V4:
>   - Bumped to xilinx_v2023.2, so that board specific patches no longer needed

Committed to next after fixing the kr260.sh shellcheck warnings, similar 
to how I did for kv260.sh, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
