Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4225BCD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 23:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02D8F42868;
	Fri, 29 May 2026 23:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I4OGPIsSChTy; Fri, 29 May 2026 23:06:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1345842818
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780095996;
	bh=r89PCLoI+DtgA+MFLGTeyYFuiJXNwgoX22TnsqR8fo8=;
	h=Date:To:CC:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ijVzZ4PYduaxza40luSZjU0DfU+ah2dzUsjG3vpEnzpvZM3Kw6vkwdXHIhxoh7TFc
	 PZeDVggT5JxktfoXApQjGi2JcgM+qyTBLfzOwRXtBjZRHOCVaQfNtWEJVypB/w/gEK
	 4v2oz4qlh+bAfhGGr9HGuXZIQImffkA0PLEyBu0eRx3LGyf7+VwWhDbsHY69XfjBBY
	 mVlC7H6Qdib9muQ6GJgn9B8OHxskDew+xsvdy4ylvVL/mUKAv+TUThxW69POshzABI
	 h3IFEQ2u8Wfq4BVo/OvAnOahsuzy5Odmrn7oW/1Op/S+DTyiJTEvFXT4u1hgslrW+u
	 Ay4jZ32NxZL3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1345842818;
	Fri, 29 May 2026 23:06:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6ACEAD3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 23:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DFCC4059B
 for <buildroot@buildroot.org>; Fri, 29 May 2026 23:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 42Aj_xOYF-PZ for <buildroot@buildroot.org>;
 Fri, 29 May 2026 23:06:34 +0000 (UTC)
X-Greylist: delayed 4310 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 29 May 2026 23:06:32 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 80C82423F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80C82423F4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.25.8;
 helo=smtp-1908.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
Received: from smtp-1908.mail.infomaniak.ch (smtp-1908.mail.infomaniak.ch
 [185.125.25.8])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80C82423F4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 23:06:32 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:4:17::246c])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gRxwJ2xw5zJy;
 Fri, 29 May 2026 23:54:40 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4gRxwH4RGDzKxX; Fri, 29 May 2026 23:54:39 +0200 (CEST)
Date: Fri, 29 May 2026 23:54:37 +0200
To: Arnout Vandecappelle <arnout@rnout.be>, buildroot@buildroot.org
CC: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <7539aa42-be40-4ed4-aac7-2de8a53b9d31@rnout.be>
References: <20260413-linux-werror-v2-1-e29e45398c56@cherry.de>
 <7539aa42-be40-4ed4-aac7-2de8a53b9d31@rnout.be>
Message-ID: <EA0B9F90-EFC1-45B7-BC7A-AD261C75BE87@0leil.net>
MIME-Version: 1.0
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1780091680;
 bh=3KnEdunRvK5tzEnxdPr9QABwlwe91nvMXS4P7YSdOeg=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=HHnHKHvO//J0BjVxRE9ahx7aN0V6IO525X/8J88L3u/8prHglotw1iqIk7Re9fRJE
 xZ0WxNOaIk2Ck85zLYDrG0s0nQsw/76sCwGtp0lFZ9W/didLVVExjZt3ATtO5jnJKo
 XUM0jje9va2Ro5c85h4FppSAl/xrixT6ddoR5Pe6i76xT95KsyT82XZFHD44qey01B
 EqjY8cFjF0UqoipG1GnpiUQmZMqfcTr3es1VSVJTVtLZ+3F55vxRjHE5lJKWZoP/MI
 Sr5QllmGpQh42h8de1/UwXJViQ+sfZ2u0e1wFfjfy7wlICvon7snpazSTz1oSc4AmR
 /2oSLxkafEArQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256
 header.s=20231125 header.b=HHnHKHvO
Subject: Re: [Buildroot] [PATCH v2] Revert "linux: disable -Werror"
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <foss+buildroot@0leil.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On May 29, 2026 10:58:19 PM GMT+02:00, Arnout Vandecappelle <arnout@rnout.be> wrote:
>
>
>On 13/04/2026 11:08, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>> 
>> This reverts commit 6b56e0b4f09b36140e2cb9e41072d5ac6074f375.
>> 
>> commit 6b56e0b4f09b ("linux: disable -Werror") said we needed to disable
>> CONFIG_WERROR in the kernel because it failed to build the esp-hosted
>> kernel module. This was very much the hammer approach because a) it'd be
>> better to fix the warnings in the kernel module or b) disable the
>> kernel's CONFIG_WERROR *only* if esp-hosted is to be built, via the
>> ESP_HOSTED_LINUX_CONFIG_FIXUPS variable in
>> package/esp-hosted/esp-hosted.mk.
>> 
>> This is a simple revert without making any change to any kernel module
>> (including esp-hosted) because all upstream Buildroot defconfigs with a
>> kernel module enabled build fine today (albeit with warnings). The two
>> defconfigs that were pointed at by the now-reverted commit all have been
>> (updated for and) run on master without failing the build.
>> 
>> Suggested-by: Arnout Vandecappelle <arnout@rnout.be>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> Applied to master, thanks.
>

Thanks!

>> ---
>> I've rebuilt the kernel of all 307 upstream Buildroot defconfigs which
>> selects the Linux kernel with:
>> 
>> for defconfig in $(git grep -l LINUX_KERNEL configs/); do
>>    d=$(basename "$defconfig")
>>    make O=build/$d $d | tee -a log.txt
>>    make O=build/$d linux | tee -a log.txt || break
>>    rm -rf build/$d
>> done
>
> That is some serious testing!
>

Could spend some time building stuff on an idly server :)

>> 
>> and the loop didn't exit early and log.txt didn't contain any error: (or
>> even warning: or ^^^ lines, which is surprising...).
>
> But, the commit message says "albeit with warnings"... Or does it mean that most of those configs anyway don't enable CONFIG_WERROR so this revert has no effect on them? Perhaps it would have been a good idea to identify those explicitly - who knows, maybe CONFIG_WERROR isn't enabled anywhere and your test didn't actually prove anything...
>

"Albeit with warnings" apply to "defconfigs with a kernel module enabled" that I list below. There aren't many kernel module packages (out-of-tree) that are in Buildroot upstream defconfigs. It is thus proved that for at least a few of the Buildroot defconfigs which build both the Linux kernel and some out of tree modules with warnings that the Linux kernel defconfig doesn't have CONFIG_WERROR enabled (otherwise the build would fail).

I mentioned that building the Linux kernel from all 307 upstream defconfigs selecting it didn't output any warning or ^^^ line in the build log, though I noted this was odd. This means that I either missed the warning with my poor grep-fu or that there are none. What it proves though is that disabling the forced disabling of CONFIG_WERROR didn't trigger build errors on any of the 307 upstream defconfigs building the Linux kernel. Whether they actually enable CONFIG_WERROR is a different topic, but this proves no regression is introduced (at least when I wrote and tested the patch :) ). I did test with a custom defconfig that this flag is now respected and fails the build if there's a warning.

> Anyway, it's applied :-)
>
> Regards,
> Arnout
>
>
>> 
>> I also built the kernel modules of the couple of upstream Buildroot
>> defconfigs that build some modules, identified with:
>> 
>> for module in $(git grep -l --full-name kernel-module package/ | xargs basename -a | grep '.mk' | xargs basename -a -s .mk | sed 's/-/_/g' | tr '[:lower:]' '[:upper:]' | sed 's/\(.*\)/BR2_PACKAGE_\1/'); do
>>          git grep $module configs
>> done
>> 
>> which returns:
>> configs/orangepi_lite_defconfig:BR2_PACKAGE_RTL8189FS=y
>> configs/orangepi_pc_plus_defconfig:BR2_PACKAGE_RTL8189FS=y
>> configs/mangopi_mq1rdw2_defconfig:BR2_PACKAGE_RTL8723DS=y
>> configs/sipeed_lichee_rv_dock_defconfig:BR2_PACKAGE_RTL8723DS=y
>> configs/sipeed_lichee_rv_dock_defconfig:BR2_PACKAGE_RTL8723DS_BT=y
>> configs/orangepi_zero_defconfig:BR2_PACKAGE_XR819_XRADIO=y
>> 
>> and while there were warnings, they don't fail the build of the kernel
>> module(s) for those defconfigs. No available updates for all kernel
>> modules I built, as far as I could tell.

^^^^ this is the part which relates to "albeit with warnings".

Thanks for the feedback, lemme know if there's anything I can do if there's some desired improvement or follow-up to do.

It's late here and I'm tired so hopefully what I'm saying makes sense.

Happy hackathon!

Cheers,
Quentin
Hi Arnout,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
