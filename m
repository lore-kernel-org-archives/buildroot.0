Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8EFCF394B
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 16:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D095041146;
	Wed, 19 Nov 2025 16:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TkgicN4AB-DB; Wed, 19 Nov 2025 16:47:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D425D4114C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D425D4114C;
	Wed, 19 Nov 2025 16:47:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C7412A9
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 16:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 439FA83E3B
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 16:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DpuCDY_FPSu6 for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 16:47:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 672C883E35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 672C883E35
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 672C883E35
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 16:47:36 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 3D3812C893AC;
 Wed, 19 Nov 2025 17:47:34 +0100 (CET)
Message-ID: <5a529d9d-6a06-42cf-a1e5-0c8f16a51967@bubu1.eu>
Date: Wed, 19 Nov 2025 17:47:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>
References: <20251119154819.3416176-1-nolange79@gmail.com>
Content-Language: en-US
In-Reply-To: <20251119154819.3416176-1-nolange79@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1763570854; bh=KhnfXOu6Apv12Bi2qIRng+FX+zFfz7bfgX+ydu+6x2M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=JHp2GMYg8abcg9QU9QoS12bPo4ugJs0I3pCO4Pvwk3eEWXM0GoBkQZIa95+hHARh7
 QHhVTdhEZayF+NazLHxU/NSeBEx7Mh1TvhsJEOaBs6DsbWC1+QtULetpU0a3mv3yyz
 jivXRtyQc8uMPk+hbZT0kymIh6f9TJ8xtKGBhYR4Pcj8YwlW9IEpNpVOkKLhQqb+NU
 bC7RaFx/NONXCOjrgiqnj4aKJ+iCRPZ6+RUUdBT1QNDEEc+FVz9rLEh8rLcX2n8PM2
 kmsJcB4Kj33kVsJkbqdfaFYxcJHpgeJCZtrfO0qmy1tWON8lFT1lr8nzGfOdC4N+sT
 7wxPCTtnZuJAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=JHp2GMYg
Subject: Re: [Buildroot] [PATCH] package/systemd: remove several Kernel
 config options
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Norbert,

On 11/19/25 16:48, Norbert Lange wrote:
> All those features are optional and prevent customization of the kernel.

For the record, the list of kernel options required and recommended for 
the currently packaged systemd version is here:
https://github.com/systemd/systemd/blob/v257.10/README

And I agree that we shouldn't force these optional (even if strongly 
recommended) features. A link to this readme file should probably be 
added to the Config.in help text instead of trying to replicate the 
content there as well.

This still doesn't remove all options that the above document classifies 
as optional though. Any particular reason to keep these?

CONFIG_DMIID
CONFIG_NET_NS
CONFIG_USER_NS [1]
CONFIG_AUTOFS_FS
CONFIG_AUTOFS4_FS
CONFIG_TMPFS_POSIX_ACL
CONFIG_TMPFS_XATTR

[1] There's a note here: "systemd-localed.service and other systemd 
units use PrivateNetwork so this is effectively required." Not exactly 
sure what that means for a buildroot system.

> Forcing IPv6 is particularly nasty.
> 
> This reverts parts of "package/systemd: bump to version 256.4"
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>   package/systemd/systemd.mk | 19 -------------------
>   1 file changed, 19 deletions(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 126ce7716f..0ee680e55e 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -863,35 +863,16 @@ define SYSTEMD_LINUX_CONFIG_FIXUPS
>   
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_DMIID)
>   
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_BSG)
> -
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_NS)
>   
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_USER_NS)
>   
>   	$(call KCONFIG_DISABLE_OPT,CONFIG_SYSFS_DEPRECATED)
>   
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_AUTOFS_FS)

>   	$(call KCONFIG_ENABLE_OPT,CONFIG_AUTOFS4_FS)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_POSIX_ACL)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_XATTR)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_SECCOMP)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_SECCOMP_FILTER)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_KCMP)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_SCHED)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_SCH_FQ_CODEL)
> -
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_SCHED)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_FAIR_GROUP_SCHED)
> -
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_CFS_BANDWIDTH)
> -
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_EFIVAR_FS)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_EFI_PARTITION)
> -
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_DMI)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_DMI_SYSFS)
>   
>   	$(call KCONFIG_DISABLE_OPT,CONFIG_RT_GROUP_SCHED)
>   

Marcus

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
