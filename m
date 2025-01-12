Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0CCE77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 11:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B71EB400D3;
	Sun, 12 Jan 2025 11:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJuVgpnbgP48; Sun, 12 Jan 2025 11:37:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA1F8400FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA1F8400FF;
	Sun, 12 Jan 2025 11:37:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 176A468
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05891400FF
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cHDmGDXojUn0 for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 11:37:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 33F2A400D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33F2A400D3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33F2A400D3
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:37:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 7C7BD5FFC0;
 Sun, 12 Jan 2025 12:37:36 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41924])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jan 2025 12:37:36 +0100
MIME-Version: 1.0
Date: Sun, 12 Jan 2025 12:37:36 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111190345.2961575-1-james.hilliard1@gmail.com>
References: <20250111190345.2961575-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <491c206031dc774171b684d92b8e5126@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736681857;
 bh=vlY25eb72pl2jnVhXa5BfetDSHDWF9mkn7nekoDrYM8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IW/BBSNckE3E30vk9j3MWMdl1w0U6aK/dUv6b0kj5VUcmFqtXFKac4R4dMLSVazIp
 OYHhf7kj072d21RZAZDWmJ7BufDWDIx5YWfIr4A7GKli9NV0Azdn2YUVgL61EzYjk0
 J2z2fRXqBnaSoAp0E46oG8jwfaBO7v27UpzICkuOtqabztPC62q5SHGJBBbRlwzAo/
 AMH5hQCnVgJFgHbF+8M299VAiUFsbsv6S+eT8GDtD58KIrnA0X0lYXVhHMKZpCnrXd
 YgyTADsMCi2T+bNnShYpVpaE88JtNXSMpHmmKOlnjoZ95sgbrzgAUT5aR75+HWWzXI
 X6zCV2mT+v6Qg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IW/BBSNc
Subject: Re: [Buildroot] [PATCH 1/1] package/python-wrapt: bump to version
 1.17.1
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

On 11/01/2025 20:03, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
