Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8440BC19F32
	for <buildroot@archiver.kernel.org>; Wed,  5 Mar 2025 20:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B31040C82;
	Wed,  5 Mar 2025 20:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K60YDnosefG4; Wed,  5 Mar 2025 20:02:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 192A140805
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 192A140805;
	Wed,  5 Mar 2025 20:02:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BFDC3E2E
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 20:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DC5A409FD
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 20:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0d8BmG2OvKbj for <buildroot@buildroot.org>;
 Wed,  5 Mar 2025 20:02:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6E9AF401FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E9AF401FB
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E9AF401FB
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 20:02:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 6678F2008E5;
 Wed,  5 Mar 2025 21:02:40 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 05 Mar 2025 21:02:40 +0100
MIME-Version: 1.0
Date: Wed, 05 Mar 2025 21:02:40 +0100
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Michael Walle <michael@walle.cc>, Niklas Cassel
 <niklas.cassel@wdc.com>
In-Reply-To: <20250221225529.441084-1-romain.naour@smile.fr>
References: <20250221225529.441084-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <71bc39ac04b174cbfc4f89494cd2baa8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741204963;
 bh=24/6fyCjHz/mvF6TSpAAWk8lcgEfaUzKX0rG3o1Rd6c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=liZ5Zu2J3QvQgSWd+/zl8YByacf10MAu6u3g7BVLBHyXyDj0LEQh1JvBuMrVLWwc4
 FBJggfsWYISYbEwEYstkQcF5hbD1qTODvF/MEdP3IzUJ45N+nZIgikJaDUMONFnqgS
 Hjr4i8d7jYBYzVuhVbsusSLJ0paD7Z0Bzu6Fmg6FRT9YDtzlBVAaPCwXyMpsFIhNqN
 +nvBxIW/Shha6ztwhy+WMn445lqKydEyfyYI9ddMskygZFXYTk/O2ogIJR2jyBmJ2t
 qzSvT+pWJo2PBBqulxdVsmuDGfBXGaHkcr/UmRaA6bBMU6Evx+TJFxiwQFMErACBq9
 i7WOp760ejSJQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=liZ5Zu2J
Subject: Re: [Buildroot] [PATCH v6 1/5] linux: add support for device tree
 overlays
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

On 21/02/2025 23:55, Romain Naour via buildroot wrote:
> From: Michael Walle <michael@walle.cc>
> 
> The linux kernel can build device tree overlays (.dtbo) itself. Add
> support to build and copy them along with the actual device trees.
> These can either be in-tree device tree overlays
> (BR2_LINUX_KERNEL_INTREE_DTSO_NAMES) or they can be provided outside of
> the kernel (BR2_LINUX_KERNEL_CUSTOM_DTS_PATH). In the latter case, the
> overlay source files will be copied into the kernel tree first.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> Reviewed-by: Niklas Cassel <niklas.cassel@wdc.com>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
