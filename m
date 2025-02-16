Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993CBC02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 15:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BA40404B0;
	Sun, 16 Feb 2025 15:46:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gzO9p7Ux42wP; Sun, 16 Feb 2025 15:46:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A391406EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A391406EF;
	Sun, 16 Feb 2025 15:46:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A822F72
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9889682142
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCDX36MhfyAO for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 15:46:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7ACCE82138
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ACCE82138
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7ACCE82138
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:46:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id B7D76B00535;
 Sun, 16 Feb 2025 16:46:17 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Feb 2025 16:46:17 +0100
MIME-Version: 1.0
Date: Sun, 16 Feb 2025 16:46:17 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250216135013.2068727-1-bernd@kuhls.net>
References: <20250216135013.2068727-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <45834532fca1ae3877e10787408e636b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739720778;
 bh=qSrYY5+51087YCENWjnnSXGPamXk3I8rKClVCV+VBcU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XM52DQwegurjX0d6xO7DZmm7/A3EgfG7LcF94gHW7a4QJkvQ/tNehuYf5DERk17iq
 0XjNSFi3yFgAOM1TbHeVkyFab7MLriB/NT9BEpQbmeaP9mIlzsWP7SDDLjKUX1SX81
 wfQg+mIeSGJvb85RfOaMkMlQnCP/HUUHeswA/sM1pQyPpclJV7aRiL694fKVRGjTc/
 j1t5uuviVKkI8OR5TQW5G53Pw6SAkHZH9/4gu4Z3L/c4qJLy7xEWsGljkexdDhFDWd
 5PQ8um2ozi6NreAnxWICxLxcvf3KGKlhecGyuLSaDIiNaIJ56UjHcuy04BZqVci7LH
 eItZfni/bbMIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XM52DQwe
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20250211
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
> Updating the hash of the WHENCE file, due to firmware additions and
> firmware changes, but no changes to the redistribution/licensing
> conditions.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
