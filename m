Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CA5C05027
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 23:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AD3840B9C;
	Mon, 23 Jan 2023 23:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AD3840B9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6FhNa8gw-_oB; Mon, 23 Jan 2023 23:06:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 707D740B99;
	Mon, 23 Jan 2023 23:06:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 707D740B99
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3BEBD1BF332
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 23:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 167D640B9A
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 23:06:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 167D640B9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XlPEp1yOcAmP for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 23:06:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B05D40169
Received: from box.stevenhay.com (box.stevenhay.com
 [IPv6:2a01:7e01:e001:325::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B05D40169
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 23:06:47 +0000 (UTC)
Received: from authenticated-user (box.stevenhay.com [172.104.133.13])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by box.stevenhay.com (Postfix) with ESMTPSA id 4530122CDB
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 18:06:40 -0500 (EST)
Message-ID: <74abb8d2-4e0e-6898-2f14-052af864445b@stevenhay.com>
Date: Mon, 23 Jan 2023 18:06:38 -0500
MIME-Version: 1.0
Content-Language: en-US
References: <20230122234309.2111129-1-me@stevenhay.com>
 <20230122234309.2111129-2-me@stevenhay.com> <20230123072013.GC2632@scaer>
To: buildroot@buildroot.org
In-Reply-To: <20230123072013.GC2632@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=stevenhay.com; s=mail; t=1674515202;
 bh=WQIr0nGOSKw1qN66ASc7lD6cfx7dbEdqYVj6qqSmNJI=;
 h=Date:Subject:References:To:From:In-Reply-To:From;
 b=KYEddpF6qHcYUYm9ISWYf6kDriykj/DF6Pvy53vUcvHk+nqnmdH8VqwixF+TPfJeA
 I5LqGtekBsXKVyCd8gclWSNjq2ckza/vYMcxCZInRLf3fTai/BImXgyeVTt9k5VeWy
 zHsnvfXgc56SX/r5FQIhef1pgBATtyv2pXY4SsqZux1jVct0Dv/TzSuvOH8CFZyori
 LSr9jrJv/PzG5pYyLyX+gBHxXa4obc4ouH5LcuKSmD2Tj/ohCt7++BCR8GdM1ZOKFM
 DcdSNHh1AG6GRzK9fS8f0gAJWY4nUb9XCRS0cZ4A+gpUL3usN0fxm2xEJKZHXQkJm8
 F9tiigx9pFXdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=stevenhay.com header.i=@stevenhay.com
 header.a=rsa-sha256 header.s=mail header.b=KYEddpF6
Subject: Re: [Buildroot] [PATCH 2/2] support/scripts/graph-depends allow for
 forward and reverse depends on same graph
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
From: =?utf-8?b?yo7JkEggx53KjMedyodTIHZpYSBidWlsZHJvb3Q=?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?yo7JkEggx53KjMedyodT?= <me@stevenhay.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann, All,

On 1/23/23 2:20 AM, Yann E. MORIN wrote:
> Do we really need to have two different options for the direct and
> reverse depths?
>
> If so, then be sure to modify the <pkg>-graph-rdepends accordingly (in
> package/pkg-generic).
I think it is nice to have the "control knob" available for both, but 
the current API to this script uses default values of 0 (no limit) in 
all cases--so no change to <pkg>-graph-rdepends is needed. I've added 
the ability to specify depth to the makefile.
> I am not very fond of this: if one were to call:
>      $ graph-depends --direct --reverse --check-only
>
> then one would expect to have both checks be run, but here only the
> direct one will be.
>
> I think we need to change check_circular_deps() to return False (no
> circular dependencies) or True (circular dependencies) (or it can raise
> an exception that we catch) and store that for later concumption.
I agree that it should check both and have updated the script so that it 
does, but I'd rather the enhancements you're talking about be handled 
with a separate patch.

Revised patch forthcoming.

Steve

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
