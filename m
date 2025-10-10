Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DECCCA476
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 16:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A25B8042C;
	Fri, 10 Oct 2025 16:26:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ygl3JpmdeQdX; Fri, 10 Oct 2025 16:26:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D87F8042D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D87F8042D;
	Fri, 10 Oct 2025 16:26:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1845B14B
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 16:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07292400D2
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 16:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HlMU7WK9ZYvv for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 16:26:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0E8A8400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E8A8400D1
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E8A8400D1
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 16:26:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 1BCCB60129;
 Fri, 10 Oct 2025 18:26:50 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Oct 2025 18:26:50 +0200
MIME-Version: 1.0
Date: Fri, 10 Oct 2025 18:26:50 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
In-Reply-To: <20251010125430.1253718-1-thomas@devoogdt.com>
References: <20251010125430.1253718-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <522b908727b2ea24683bab14512b7c28@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760113613;
 bh=Yz2VPnG7tHrb9ASqVdm3tH0hoef5NqIQE6uCgSdilyQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H3AoqdocvgXWsAeQrU9Z7fMYU8V7uvSPSc8sp0/xW9cbJ8WLjZmuFrKhEOZVCWLSY
 D4W407lmy9U4IYrYhNSR3lNKECFtfoUy7M1wFii5SoGER9dG+bZTwC0WZDvU8LjxDd
 deFDZPGnZB2MpS7snOse/qN7wlf8bV4+qMtQ5wCdkCzLRbERCwDBjA6sivBnaS/FQT
 q+Cc9j878RLopxgY6ZfOQZmlH/irEqjBaHCRGppdzPuYOSW46kgDyr5DzVIGkr93n7
 Uq7pgtjXwWkxeOyrnR1VlRVAUJcKZDOSZiDVuKdnebSZh79Ar6nH3SxyYittmKlB7V
 p4hnY6Iw2i3Ow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=H3Aoqdoc
Subject: Re: [Buildroot] [PATCH v1] package/webkitgtk: bump to version 2.50.1
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

On 10/10/2025 14:54, Thomas Devoogdt wrote:
> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> Release announce:
> https://webkitgtk.org/2025/09/17/webkitgtk2.50.0-released.html
> https://webkitgtk.org/2025/10/10/webkitgtk2.50.1-released.html
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
