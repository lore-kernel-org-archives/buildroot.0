Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37653C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 14:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6646607F8;
	Fri, 16 May 2025 14:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WEim7QYb_uO0; Fri, 16 May 2025 14:44:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E405608B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E405608B0;
	Fri, 16 May 2025 14:44:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 41EDC1AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2806E607F8
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzgabkAN0iYz for <buildroot@buildroot.org>;
 Fri, 16 May 2025 14:44:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 55DBB6069A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55DBB6069A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55DBB6069A
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:44:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6F2756014A;
 Fri, 16 May 2025 16:44:42 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 16 May 2025 16:44:42 +0200
MIME-Version: 1.0
Date: Fri, 16 May 2025 16:44:42 +0200
From: Julien Olivain <ju.o@free.fr>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250515091640.2914921-1-mika.westerberg@linux.intel.com>
References: <20250515091640.2914921-1-mika.westerberg@linux.intel.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <00dc518efffafdab8f7cbfaf716f33af@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747406684;
 bh=pbVBWrEUbvuk9DqhFrXvUfXz3POc/r/rW5fDT7igrvg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DqSAVl3oK+xWLB4yaMBH6TIDjORq9TdAV7EXkQvtD+cvsE7D3LVWZQaO6XfGBTz5w
 MgFCCAFIzNl2s3vA3IcI73bPBjCNzjjNHLeycZ3PZ2qSMJ7uuCXMMThypw1weflnZ8
 OLjDDyMRgSgDDC2Ry62c+2C56uwfKzViof/c72sJALQm9BPKrTZvcJ/w14630Jr3p9
 CRfz3n8uJp+gIxWvXTXBJ2FCAkeXmneU0/jCxYVpqruzTIA3XpkTsY1ydUAtANEx9S
 SW0L0SzALyDwCN/UbhMNuNxVFXmPc3fbLE7E4RMalxXaUWdle8FKC98EUZbiLQ4mXe
 cuObX5Jt8B83Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DqSAVl3o
Subject: Re: [Buildroot] [PATCH] package/tbtools: bump to version 0.6.0
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

On 15/05/2025 11:16, Mika Westerberg wrote:
> Update to the latest release of tbtools. For change log, see:
> https://github.com/intel/tbtools/compare/v0.5.0...v0.6.0.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
