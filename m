Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED20AC02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 16:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2E604070A;
	Sun, 16 Feb 2025 16:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpGO6yy50iY3; Sun, 16 Feb 2025 16:27:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C43240638
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C43240638;
	Sun, 16 Feb 2025 16:27:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BBE7F1BA
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 16:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5F0440638
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 16:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r-w9FomqO9E0 for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 16:27:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E88CB4070A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E88CB4070A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E88CB4070A
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 16:27:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id DE715B0055A;
 Sun, 16 Feb 2025 17:27:52 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Feb 2025 17:27:52 +0100
MIME-Version: 1.0
Date: Sun, 16 Feb 2025 17:27:52 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250216135052.2068813-1-bernd@kuhls.net>
References: <20250216135052.2068813-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <3035d0b04ea14338982c4a2b4babdea7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739723274;
 bh=g51Q7c9c8L97C1E1ckgPqk0ifeiI3K5Evd7T/YyOhQM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XGZLjtoRhgevUoZFWEba6R5Jyp3+X9FWb/AhEyzAnFgCLkFjqQuUwHahx8HKQ9Xg3
 bBNIwOwvH75a2XXxIX/thEkTZQxWoP3tfw6uWBomQxUB05zStCK051v2g1VancqWOL
 iXNrFvASrpBv11yhjE2zUjdxSBYc2c2cEMddGX9vKHY67Efw7yEHzkMuUORbWRsXWH
 6Pe5qa3C9Scqkmher/VpPM3aNyVMisqc0i935r4MjeM3/gEK36uEYlBuDII5KSsXO5
 Wwm0kOr0vqoKEiViSGqL7Y3UsVqXjBM00suPBumxXfsyMiEZoKcnnLFzR/iZK3IEnr
 3U3rb27cXvt2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XGZLjtoR
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version
 to 25.1.2
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

On 16/02/2025 14:50, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
