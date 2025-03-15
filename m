Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E94C28B28
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 23:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F917605ED;
	Sat, 15 Mar 2025 23:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SM2yKjqfdezB; Sat, 15 Mar 2025 23:43:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DE8A60830
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DE8A60830;
	Sat, 15 Mar 2025 23:43:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B9F1C8
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 23:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 801CB6082F
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 23:43:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q5inadYj5Qcv for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 23:42:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E29E605ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E29E605ED
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E29E605ED
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 23:42:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id F3A4FB0053E;
 Sun, 16 Mar 2025 00:42:50 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Mar 2025 00:42:50 +0100
MIME-Version: 1.0
Date: Sun, 16 Mar 2025 00:42:50 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Vincent Jardin <vjardin@free.fr>, buildroot@buildroot.org, Ioana Ciornei
 <ioana.ciornei@nxp.com>, Brandon Maier <Brandon.Maier@collins.com>, Romain
 Naour <romain.naour@smile.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
In-Reply-To: <20250315171101.qcng2f6rsice3a4n@skbuf>
References: <20250302215219.1276480-1-olteanv@gmail.com>
 <20250302215219.1276480-6-olteanv@gmail.com>
 <7ppsoggazufebwywfwqqlkmssypneyqtmbg4tr4dx76o5dx7q7@iyndbkzeo2zl>
 <616d3621a153da86972c8b1497f71c53@free.fr>
 <20250315171101.qcng2f6rsice3a4n@skbuf>
User-Agent: Webmail Free/1.6.10
Message-ID: <fc010781aca9965029fefa404da84c6b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742082177;
 bh=8oqjlBdfd0/LX7ikEtZIkxHAVPwADhA2aAoOwbxfr3I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=p3ef7w/Qn1FiuEqKdyZoEKw6J1cE6VLvaRJOhOwu4LsN/BDaX9L9cquiVlK6cTL0V
 NxpiPxagRmg7CxYvDWTYiCQ9pta5KIDSwPmc9cYBWnQ4FtOlGZx8nri7O0XchlZMLH
 1PY1z7K8SUBRi0JYKM7YaX1aq2JcDZqrl9y7sP9mhgCo97ni1+5KNiYaqVLYPQo4wJ
 aBhUxtOg+mB+CzM8/PgedvcekFm6Nlga63Gxoa+V4wEeLcOckreA9a1tJ1bLeJEHzn
 2wET/k634ADeJf8i7Zr/r9dLYOcddBXZGe5lySEsD6ki215kqgIXXeRivD8/G05utw
 55hDUaa4UoIMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=p3ef7w/Q
Subject: Re: [Buildroot] [PATCH 05/15] package/qoriq-mc-binary: new package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vladimir,

On 15/03/2025 18:11, Vladimir Oltean wrote:
> Hi Julien,
> 
> On Sat, Mar 15, 2025 at 01:47:55PM +0100, Julien Olivain wrote:
>> Vladimir: could you add a comment describing how to find the
>> "best" version? And also, describe to what other components version
>> it should be aligned.
>> 
>> To keep track of that, the way we're trying to do it on i.MX
>> components, is to add the tag name of the nxp bsp it's coming from,
>> in the commit log.
>> For example:
>> """
>> qoriq-mc-binary version 10.39.0 is aligned with
>> nxp-qoriq yocto bsp lf-6.6.36-2.1.0.
>> """
>> This helps further debug, when some components are misaligned.
> 
> So, if I understand you correctly, a sentence in the commit message is
> sufficient?
> 
> "The API exposed by the MC firmware respects backwards compatibility
> principles, which means that the latest firmware version can always be
> (and should always be) used on a platform, irrespective of the Linux,
> U-Boot, RCW and restool versions, even though the latest features might
> not be used by older API consumers.
> 
> In terms of forwards compatibility, old MC firmware versions can be 
> used
> as long as the qoriq-restool package is built with a 
> MC_VERSION_COMPATIBLE
> variable (located in its Makefile, signifying "minimum compatible
> version") older than, or equal to it.
> 
> If the use of qoriq-restool is not desired (networking objects are
> statically created by the DPL), old MC firmware versions are supported
> by U-Boot and the Linux kernel with a limited feature set. Thus, it
> is still possible to an extent to use firmware versions older than
> MC_VERSION_COMPATIBLE.
> 
> According to the upstream maintainer, the latest MC firmware version
> is identified by the fact that it is always located at the HEAD of the
> "master" branch:
> https://lore.kernel.org/buildroot/482493f17e63d2b4cb285b50049ed8e6@free.fr/T/#m62c3ec04ba546ac9b0a194d13bc35fedeaa9deb0
> Currently, the latest MC firmware version is 10.39.0. This version
> should be in sync with the qoriq-mc-utils package.
> 
> At this stage, the latest lf-6.6.52-2.2.0 NXP BSP has qoriq-restool 
> with
> an MC_VERSION_COMPATIBLE='10.32.0', which means that it supports this 
> MC
> firmware version.
> https://github.com/nxp-qoriq/restool/blob/lf-6.6.52-2.2.0/Makefile#L23"
> 
> Should I resend with the above paragraphs appended to the commit 
> message
> in this way?

Yes, please.
Having such a description in the commit log would be great!

If you plan to send an updated series, please consider rebasing
on the branch -next instead:
https://gitlab.com/buildroot.org/buildroot/-/commits/next

I applied today few qoriq component updates from Akhilesh Nema.
Some of those patches seems identical to some included in this
series.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
