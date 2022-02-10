Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C27C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 13:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7863F8291D;
	Thu, 10 Feb 2022 13:47:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o5Wbsppw_Nju; Thu, 10 Feb 2022 13:47:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C67B782907;
	Thu, 10 Feb 2022 13:47:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 023BF1BF356
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 13:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E445260B68
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 13:47:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kjk6bkZIeWIj for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 13:47:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B81860AA4
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 13:47:48 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id I9nWnT5uYNVvLI9nWnK64A; Thu, 10 Feb 2022 14:47:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644500866; bh=IyuImVNrd7hkE12yY2WgcqeMbbhLXsBn0feh0tZvDSU=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=BcYgdBMLEW7v+EZTvlHJAj8ND5m59gnrjpSZ52xgfMp47dORiFFjk18N+BScjNWSh
 il/d/+WAoK1uDGf3KnhGgm7OinXZbZGcXAgNcHttGy0lla3RpTOTnSdOJUnNg88gXE
 iZPAix7CuhQ0wIIaM/kxX+141UVQXfNTb2GS0zqkOTylq7ZvbiofYQ/hAlRDe37E//
 dD1r5fCjSjhHY3mNJGRsI06gKIt3dI/xyAoToytXl4Dciaq+sQUzIabps0ZFAqxuyj
 0CtDpyR04LXFmIu2U7B2C64CdFBq5t/3JyxVfiT+LR1P5lxjt5JdPBEBtRN22AHi3a
 A/fiG8Lc7QuSQ==
Message-ID: <eec4fc17-e588-64a7-f700-ebcc3eae5f0c@benettiengineering.com>
Date: Thu, 10 Feb 2022 14:47:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Neal Frager <nealf@xilinx.com>
References: <20220209180306.2629180-1-neal.frager@xilinx.com>
 <C2A6170C-3951-42C0-A6B0-FEFD74238480@benettiengineering.com>
 <SJ0PR02MB7758493F336639F00D599770D72F9@SJ0PR02MB7758.namprd02.prod.outlook.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <SJ0PR02MB7758493F336639F00D599770D72F9@SJ0PR02MB7758.namprd02.prod.outlook.com>
X-CMAE-Envelope: MS4wfADm9Bo8uDg+QhKbddGxPpn7i1XZ+Qk5SGU+Ztm5AuALIDDlarNfabs1mOu7xsIS7wiI8pxtQ0RURIIip2LJmxbzmLzei5q9d5Hfe4dH+ol2eCuAw+dk
 aUj0XmGuMtDe2hXiyHAEBkFsCy4HZgUyFwwbC4aN/q8BTOPlGA0UiWYn8Zs7tRJ8j/9P1bmC70ZmZwwx1AKmnsDLq1GvnQhrdxdRh0pDxvHt5kTS6yLLFFJj
 6mHubh/EwSSCF5nog1KNWkXGbimB5WuDaKtfIQjD+t4taikiPOJrt9jzgnQcXP2i
Subject: Re: [Buildroot] [PATCH v3 1/2] configs/zynqmp_zcu106: bump
 ATF/U-Boot/Linux to Xilinx 2022
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 Michal Simek <michals@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 10/02/22 09:24, Neal Frager wrote:
> Hi Giulio,
> 
>> As other patch please send V4 and add my
>> Reviewed-by and Tested-by
> 
> I have submitted v4 of the patch set including your feedback.  Please let me know if you find anything else.

I've rebuilt both of them and now they have my tags so they are ready to 
be committed!

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
