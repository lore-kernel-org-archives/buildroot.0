Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B37C369C2
	for <buildroot@archiver.kernel.org>; Sun, 20 Apr 2025 17:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38C7060773;
	Sun, 20 Apr 2025 17:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YuphNd8hhYL8; Sun, 20 Apr 2025 17:47:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 805AB607B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 805AB607B2;
	Sun, 20 Apr 2025 17:47:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 695D41C0
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 17:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65E0180F7B
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 17:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V3COClECkE-h for <buildroot@buildroot.org>;
 Sun, 20 Apr 2025 17:47:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 867F080F7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 867F080F7E
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 867F080F7E
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 17:47:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 96C2619F5AF;
 Sun, 20 Apr 2025 19:47:13 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Apr 2025 19:47:13 +0200
MIME-Version: 1.0
Date: Sun, 20 Apr 2025 19:47:13 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250417195012.300118-1-thomas@devoogdt.com>
References: <20250417195012.300118-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <7934665f5528b2018b9706009fa64fdf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745171234;
 bh=TauYTYu2+5+7pzfqnXeuR9K5/B/yrMYHPFw+dw2vLZE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=a9censcw/CT7mN7b4dGCvLjlOJFgGM/lKIPZG4uudbuMmU55sUBmE1+FMQ0udYocd
 8PyycL8gPpK3pQsrNl3RmX5vNsxroSEUEciRtqQOxCGUiqLy9lH66/pumcpbKmVXPF
 Cwrh0sQ62nM1qJeMUJwNBMRJTcL9X8QAO4hpX10g1O4tD24HQBpklASrMfbO95fJSL
 wWOqxv78a/tn1zi7mJXuq3O8i2liuMy4paCwIdDZlJaMwb3OojpkNezuwzNEx3Fkiq
 bquiX73rBV6HLTrvHpumDeczNA99WmwAzUEnxYT+GNLqTD3ZoNUUFWZutS9tpPd4bG
 mawNebgXnE2zg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=a9censcw
Subject: Re: [Buildroot] [PATCH] package/fluent-bit: bump to 4.0.0
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

On 17/04/2025 21:50, Thomas Devoogdt wrote:
> News:
> - https://fluentbit.io/announcements/v4.0.0/
> 
> FLB_UNICODE_ENCODER was added, and enabled by default in commit [1],
> which requires LIBSTDCPP, disable it if BR2_INSTALL_LIBSTDCPP is not 
> set.
> 
> Also add two more patches to drop the LIBSTDCPP requirement.
> 
> [1] 
> https://github.com/fluent/fluent-bit/commit/3b04755e99fa500e98dcd1318f9b12f6863d31e4
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
