Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBED0C83F10
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 11:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD54D820BF;
	Sat, 12 Jul 2025 11:36:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EbPDUiqHOGEO; Sat, 12 Jul 2025 11:36:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DDF9820C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DDF9820C3;
	Sat, 12 Jul 2025 11:36:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A76F106
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 11:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C2FF820C3
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 11:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jOUINfdhJsTg for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 11:36:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B551820BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B551820BF
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B551820BF
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 11:36:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8CD272003BE;
 Sat, 12 Jul 2025 13:36:28 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Jul 2025 13:36:28 +0200
MIME-Version: 1.0
Date: Sat, 12 Jul 2025 13:36:28 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250711134338.2817791-1-aperez@igalia.com>
References: <20250711134338.2817791-1-aperez@igalia.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <bda2ad456ee8472a445850912eeee5fa@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752320189;
 bh=4D4yBxG5vZBghUiaWTn14FnXsOciktMZ34KV9eBT9MQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=T3C0bwP0G1mXtbR1tLRKQh3svTZWXuZpNy05YzT2WMaatdfR9Ap1h5g1KoHHHUijA
 rzp2grkj4eSAx0hpXNaKn85eQJ++VMN6cdSLaQaj+PBnT8YMSzmtJYxbsf8zcyEZw0
 e5YaGQslVm8xZgjaE0xS8G5WG7cfGIgkmDnLemltHup7RX74BbTcS3rVq+1nfaEY4w
 FVuCT584q0RDswD5Y0Zn+xLL44GeViQ7tzXBzNARlI0nT9At5epk2n7Apnd3VZKYPf
 958D80OTIYyrzYk6HRD6IsEvL1d+YTPH1DpiG+Clr+xUKGbMJDJ+XP2xoR7pFh7KHa
 DfnzAMJlZe3MA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=T3C0bwP0
Subject: Re: [Buildroot] [PATCH 1/1] package/wpebackend-fdo: bump to version
 1.16.0
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

On 11/07/2025 15:43, Adrian Perez de Castro wrote:
> This maintenance release solves build issues and memory leaks.
> Release notes:
> 
>   https://wpewebkit.org/release/wpebackend-fdo-1.16.0.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
