Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EB9FDEE45
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 20:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4543411F0;
	Thu, 23 Apr 2026 20:22:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cWiRtjCGp9x4; Thu, 23 Apr 2026 20:22:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 490D5411E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776975775;
	bh=f6+KnXpSRP1XdhSFLuKQm1be+ewWrS7F4iAJ/VMvJ5c=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pti2GhJF6pIxWjWsdzijtWLXVM8+S5H93hjmtSJLrsPqiJu9k8gAf9o5uTIq5L96u
	 PrioMoXXemW7Ql6PCfeWjTHk/s6p8UtoLccgj9lwzvLH1vLkfIk2J16vdQMrznUysS
	 T1tcebdsMbkl8hAIpIYFXUHuuAWVloLVc2BkwQOsGIGL93uqdUHMC1UgJ1fEPlRrBR
	 PlDm/Y5bHGsSUhHUtmqWODUBZYRFDI4urfaUjTgRxREz6/hCx5lgjafnX55DaqdBl6
	 +WVhNJXMlc5u7heIr0pWQzVHTiczDHDBApElbeiXrK254auJwdX53M4KHOS8kRSSZ7
	 j/YFyLY8HUdYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 490D5411E1;
	Thu, 23 Apr 2026 20:22:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E51FD231
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CACB7408F2
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VrvxqxuudHlx for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 20:22:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8D2CE40108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D2CE40108
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D2CE40108
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:22:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 27BA9780371;
 Thu, 23 Apr 2026 22:22:48 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Apr 2026 22:22:48 +0200
MIME-Version: 1.0
Date: Thu, 23 Apr 2026 22:22:48 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Robert Rose <robertroyrose@gmail.com>
In-Reply-To: <20260421190348.2722591-1-bernd@kuhls.net>
References: <20260421190348.2722591-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <9c70d218b8d8f642ae85026cad6174ec@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776975770;
 bh=AUbrkn9fXE2HJ26PwPMVTbEUufdsp6QmoDpNzEmdeFg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FBbpEVyT0RkUAw73fpENoYyUiRdm4JoApWhQ3Ak2hYBhGEEETytQK1PzgqkG9aeRl
 v22u+E535ykrMEXtXWQ64RRYWFSAZwDiLOa/j4E7IvZOOjLdQLFoLByad7yVfF1aVu
 EnD+VxhOGO17b2C1vpiJNtX7wUcwWM5KhZd3T+spLuD5ApZdiok86bkRSAGezIE9y4
 64a2K+DhlGAxA1gQD4n+VtyjiPXdzNAdwU47ezmvSQoTf/wad3qbgs1+jUIfqOODp1
 huhCjcTPWgFFvPVMJ5gRgbR6z2x82EAbBk8L565Uzh2v37p81jaz9EOvVg+vkPohgo
 FvRkuBiT9gSBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FBbpEVyT
Subject: Re: [Buildroot] [PATCH 1/1] package/grpc: bump version to 1.80.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 21/04/2026 21:03, Bernd Kuhls wrote:
> https://github.com/grpc/grpc/releases/tag/v1.80.0
> 
> Rebased patch 0002 due to upstream commit:
> https://github.com/grpc/grpc/commit/4c3996f0da7041ca7d3b4265d9e0299baa0ed4eb
> which added a new configure option.
> Added this new configure option -DgRPC_BUILD_GRPCPP_OTEL_PLUGIN=OFF to
> HOST_GRPC_CONF_OPTS.
> 
> Updated license hash due to upstream commit:
> https://github.com/grpc/grpc/commit/fb53717dfa6b264e7f930bb5e9a7e5c86a31ed9e
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
