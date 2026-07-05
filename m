Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8C4C43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 08:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42D96606D9;
	Sun,  5 Jul 2026 08:35:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-DXWynFJwGQ; Sun,  5 Jul 2026 08:35:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34EF76067D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783240541;
	bh=1BUcI//NNvcrtCYIwPeJfShU4w/KH9f9JqFP/M6qhV8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SkQMr6rLY6xOmHTWgqY1EwKqMe8HNirUUTX8QCJTb2NDR9SMCvbBxRkIPLF5NBVl6
	 rC0UgdpLeBnFJKS2rYw+Or1HDfbiZxNgheQp8Xzrx/e2MvMwTwvTRDKxZ2JHis5XmF
	 e8lN0tyt2FkdFV3vwxp54dSvoe+yo0PfDK8QMda9X1sLCojPG6zslTCydJeWh5+4hM
	 /dBdFT5xsiPQgnPSe0DCBqiKf47HTVVZFtNiAJRe8HAbFoyL/BKTjWDRCQxDqHPWPg
	 yZ0YYrbrSt/NuteFrhuhxBxtnUJbpL3/nMYvfl2870Bn/M9Kw8vWhZqAwqS0AcLTwM
	 G2cdKjgrjOu4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34EF76067D;
	Sun,  5 Jul 2026 08:35:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AEC1316
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 08:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CE938109F
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 08:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ENHDjR72plEi for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 08:35:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 885B080FF2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 885B080FF2
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 885B080FF2
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 08:35:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 847A913F879;
 Sun,  5 Jul 2026 10:35:35 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Jul 2026 10:35:35 +0200
MIME-Version: 1.0
Date: Sun, 05 Jul 2026 10:35:35 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260705075847.3525517-1-bernd@kuhls.net>
References: <20260705075847.3525517-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <c19b6b741e6835dce466bc7ba15cff52@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783240536;
 bh=dNIEJ3LMbkbRbZju5DuLfVh+5aAevQyK7dXBLqdd6HM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Bf4flPURMYlq4R+f2m/uRJKYHAJgFTL4gerYTfOhqHgrg/5gCj0m6/LUJO6fAN93q
 k8VEwYgrpwofb/tMzvVcYUwZ+YTwru8atsCKitim5CtX2BmxINNgEZA9arCQ8AJCgA
 TGaIlfwgq074XJGPWikplNqPIl31ZF3PintgFA+nL3u5H5PbgX3c03RZ1dxspkAps7
 RyhjTQGuegq0Kzvuw0abJShVKUTzIgnyQ37GdsYpMI3kY+G2f0uWvaHqFuZ1GaSqWo
 OLrODwFJAbVDrPkT9Si9TPPoG62rH7jDClCY/GzMhgvuaAJ73WifdywiNl/ux267Iz
 6COEZ8yKAYQ8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Bf4flPUR
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.12.x,
 6.6.x, 6.1.x, 5.15.x, 5.10.x, 7.1.x, 6.18.x series
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

On 05/07/2026 09:58, Bernd Kuhls wrote:
> Update the latest kernel releases to:
>  - 7.1.2 -> 7.1.3
>  - 6.18.37 -> 6.18.38
>  - 6.12.94 -> 6.12.95
>  - 6.6.143 -> 6.6.144
>  - 6.1.176 -> 6.1.177
>  - 5.15.210 -> 5.15.211
>  - 5.10.259 -> 5.10.260
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
