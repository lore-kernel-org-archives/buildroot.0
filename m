Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE71F55110
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 22:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F31983E7E;
	Sat,  7 Mar 2026 22:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SMZnkTWAKw8z; Sat,  7 Mar 2026 22:45:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05DB783CCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772923525;
	bh=tF1uNXvsnNxUkZNnGMr9N2d2r6vykdufvEUTEUD8xxo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KE09xJ90dDdmE3nBjV8pjFZeXW2O8fHCdS7Dr0Ioq6IMpQwCWfDqyqUixu1ZjtD/O
	 SuO536NLCJOQkvhNYOpUpfPVpnUf3/qMgM6+ZF9T5O1FLTNeaetpn1NY6DjsE3oNLL
	 A+vkpIHoMhHQy9TIkqw6Yvc3ZhA0dM8ms1Q4puYII25oDQ8aQuTgCtJVhvixC0rHrM
	 iGkzl9G2igQZg/tJlnJtjI8JTzLkrPWo4RQNEeA/8yEikeSJtYCIxD/SOunCikztnK
	 V+9ttHfOQpgBhqNIoOf4qeLEw9syShwjzt0JGubNWGzuYxtL2LMCNGggb11mC2mbLx
	 xIQoeHU3YDqcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05DB783CCE;
	Sat,  7 Mar 2026 22:45:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A568169
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 22:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4797860C0F
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 22:45:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r3nDa0801b0G for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 22:45:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3FF1660B97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FF1660B97
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FF1660B97
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 22:45:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id F29055FFAF;
 Sat,  7 Mar 2026 23:45:17 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Mar 2026 23:45:17 +0100
MIME-Version: 1.0
Date: Sat, 07 Mar 2026 23:45:17 +0100
To: Gilles Talis <gilles.talis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260117173024.1589737-1-gilles.talis@gmail.com>
References: <20260117173024.1589737-1-gilles.talis@gmail.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <ca8e43e8420500bc602595b92a890738@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772923519;
 bh=fK6bKy0FlPxrCaMRqhuOU8EyBs2o1tur7zW6qVMZD2w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YLkCycAXbVyjcLxLNgKyonXxl9mtSlsIWqvlgzVDIL2/im9ijbd9+za8ofqNZLMpM
 57fO6dMcG5p8CcPSdQt4zjjokVns/Rlsr+gSwrQ1t6o51NtgK2qU/5u0r1eiQrhYEw
 ReQQ+LTr8x2Q/Krgs5FAZgi8+i4CbcGuolvBzK5RStSR8Ycs9CAiQk+rWkMgvQNvJ8
 yHo3uNx6JlaWQISK5Uvblcsp0r3RanxGzctt/civ24lNv9tKDI8PPZ++UZaJ774NDd
 ch95HbChtZrmeGISAlJzbAGs0p2A9HZengpKg9TiMHOD4RReoI4BhJkP9NVfeayH6r
 7EWrux3oOde2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YLkCycAX
Subject: Re: [Buildroot] [PATCH] package/ftxui: new package
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

On 17/01/2026 18:30, Gilles Talis wrote:
> FTXUI is a simple cross-platform C++ library for terminal based user 
> interfaces
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Applied to master, thanks.

For info, I removed the "FTXUI_SOURCE = source.tar.gz". Since it has
no distinct version, this would have introduced issues in download
caches later. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/f983411b57a0be2c34b0b03a33a3750fa5b77c95

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
