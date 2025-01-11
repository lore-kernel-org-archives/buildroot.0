Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2A5E7719C
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B3614123D;
	Sat, 11 Jan 2025 16:25:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wjq7TA0xmd5h; Sat, 11 Jan 2025 16:25:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FCA44125D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FCA44125D;
	Sat, 11 Jan 2025 16:25:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FF98940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1DAA60F79
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_uJdQcQU746 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:25:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5C44060E0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C44060E0A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C44060E0A
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:25:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8536919F72F;
 Sat, 11 Jan 2025 17:25:48 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46358])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 17:25:48 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 17:25:48 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111140114.2509238-1-james.hilliard1@gmail.com>
References: <20250111140114.2509238-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <6363cc4169fb9f81b6a6b4de306f6c54@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736612749;
 bh=ETlES6oA+LDu52qp1GP6TNefJ6FObMUXoh95BJppekI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lrU+gnKYnocg98z7NoVG2IgE8Cb0dmp+w3uOPQ3kMPlsz6YVnxMohemn/Ll2k/I7D
 islbb5oSh2Jo847gQuGNrp4yMl0egSpOsmvr1AtsDKRs8WTtRG+mKmzzPN2+BIm/5J
 rgb1gzsdpSLIjuVdkjs08WxOHKXKZG58DXrTK4lhft9RiDBJKi8cYrew9xGQIBJnSp
 8wyDGCpqSfBTWsIpQPda8RXVRKl8errJB6CO5ilhXhAJ/90jBErhACC0uvVdrhh9qT
 aErU3G1EX7jPYlZv9lESQIoAxyxSuLqJXpDHiKDB4S/STqwyeQYTDwWItQUgyvMIXF
 hDUF2fwvhsbMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lrU+gnKY
Subject: Re: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 1.8.1
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

On 11/01/2025 15:01, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
