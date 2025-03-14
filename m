Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8679AC35FF1
	for <buildroot@archiver.kernel.org>; Fri, 14 Mar 2025 18:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37F1B84797;
	Fri, 14 Mar 2025 18:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DO2d_GCjGaEh; Fri, 14 Mar 2025 18:08:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CE1F84798
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CE1F84798;
	Fri, 14 Mar 2025 18:08:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AB5E761
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 18:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6A6984798
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 18:08:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NdO5k2-uYag6 for <buildroot@buildroot.org>;
 Fri, 14 Mar 2025 18:08:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A2B584797
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A2B584797
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A2B584797
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 18:08:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 540F178050C;
 Fri, 14 Mar 2025 19:08:12 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 14 Mar 2025 19:08:12 +0100
MIME-Version: 1.0
Date: Fri, 14 Mar 2025 19:08:12 +0100
From: Julien Olivain <ju.o@free.fr>
To: Brandon Lumbra <brandon.lumbra@sense.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250313173557.517844-1-brandon.lumbra@sense.com>
References: <20250313173557.517844-1-brandon.lumbra@sense.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <2bf529d0f54fcd6bb9c0f13797f0a13b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741975694;
 bh=DaQOoSzyYxQo7lwvOHwrfl9f9xiFHW2Dc10jW/mxyQY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZoTnDOKYc7kH8zyu1x2sGWnIB/+1i9iH2W/zhOa/jdF56ifQwDTy7LFXPDvgIP7G7
 zaC5OkJWsUZySVtJkCMSMrr3Swdj8BCOAfJwpPQEx7xWeZe8RygfMDjf93XgQ/Q3sB
 hGcietE0tBU6A1HfZRiMbNqEvlmwzwmFikqoW8LEpdmZX2Li9CtMYa8zpGgUKsodZj
 X9zPIgK0qDg8WSGooWEco6x0VSsd7B90WEChbQjuv81WZOsw/kKBvhMnGXybtHyLUA
 AQe+FhroIRTxQELsDAGH5O3NJSAvGZLY7ZN0oAjRhdStun2H0P3r7HbTK8etY9B07j
 aC+UO6u7VG+ow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZoTnDOKY
Subject: Re: [Buildroot] [PATCH] package/rt-tests: fix build with glibc 2.41+
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

Hi Brandon,

On 13/03/2025 18:35, Brandon Lumbra via buildroot wrote:
> glibc 2.41 adds sched_*attr, conflicting with rt-sched.h in the 
> rt-tests
> package. This commit resolves the conflict by applying a patch from
> upstream which excludes the conflicting code when using glibc >= 2.41.

I applied this patch to master, thanks.

I also added extra info in the commit log and the missing
"Signed-off-by:" lines. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/9f60aa973d1fb3905eb3f655b32ec368419e2bf6

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
