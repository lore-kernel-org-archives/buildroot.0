Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4E7CA0EFC
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 17:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 255FE60A64;
	Sun, 24 Aug 2025 17:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vnrJEz_QtnBv; Sun, 24 Aug 2025 17:20:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 769D260B24
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 769D260B24;
	Sun, 24 Aug 2025 17:20:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 196F8CA
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 17:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E789F416FC
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 17:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-xAPxkV_q93 for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 17:20:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3FE0E417E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FE0E417E7
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FE0E417E7
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 17:19:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 69BBA19F576;
 Sun, 24 Aug 2025 19:19:55 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 24 Aug 2025 19:19:55 +0200
MIME-Version: 1.0
Date: Sun, 24 Aug 2025 19:19:55 +0200
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250815182518.761210-1-angelo.compagnucci@gmail.com>
References: <20250815182518.761210-1-angelo.compagnucci@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <dee78bc8fb87d378f8ecf2372c13693a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756055996;
 bh=ZPvvVp9F3klRVgEVOeNaayO0Ho/rhbXtthKT7o9pNUs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QHsZGOK9uxVWNNo+WPiJa359zqBqyiEvnrMB6a15Iw933b08zaeJoVNLKVvaPs7BF
 6bF9tJMHUGVV/UB4SomiviwRiaDUDelSMNA4J7qGGCA3RxemWqezwR3lsy+2OoObFo
 dkUZD3bimljc+Ku+I5MVPneviqMOEJYH8on1tNbx2lH4HO7Fbguadg9uJIHB9dDvYn
 K8mmptXVKSPPOBYoWMr6GnRQ21/CfqROmFfPURsbRxrYaxFtPyeTtVVBu5NgBAG91b
 pP9w67AAGHtfXZBP4npbjhXa3tr/zDXLSEX9gB+m9LrvAyLgu3XCkvVchR3qfP5u/P
 BSDKJjTzYT35w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QHsZGOK9
Subject: Re: [Buildroot] [PATCH] package/apparmor: bump to version 4.1.1
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

On 15/08/2025 20:25, Angelo Compagnucci wrote:
> Updating also the companion libapparmor library and removing upstreamed
> patch.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
