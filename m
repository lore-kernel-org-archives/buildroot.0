Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BFACFC50F
	for <buildroot@archiver.kernel.org>; Fri, 21 Nov 2025 23:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2218784C57;
	Fri, 21 Nov 2025 23:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AWHCqDe1Ffjm; Fri, 21 Nov 2025 23:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93B0584E18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93B0584E18;
	Fri, 21 Nov 2025 23:01:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB8201CD
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 23:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1B2860B9D
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 23:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pT2a83e2lTVn for <buildroot@buildroot.org>;
 Fri, 21 Nov 2025 23:01:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CE20560B9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE20560B9C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE20560B9C
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 23:01:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 177E32003C6;
 Sat, 22 Nov 2025 00:01:37 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Nov 2025 00:01:37 +0100
MIME-Version: 1.0
Date: Sat, 22 Nov 2025 00:01:37 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251119201950.472729-1-bernd@kuhls.net>
References: <20251119201950.472729-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <2b2316148ff12538263bbb69f7f45cba@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763766098;
 bh=1APimawMmCdjZFHseXq+z2R1anDKVjWFSabSyqKMa3k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZNLypeSNYp5jc/6RXZS4BNQCuqpgi7prY1IhRUAO1eDOS9ZBkdqeGa9iH22l/roVI
 hPsCH3QFceeHLmoB/+TCZZZ6C7MFzW/nG8teI/9QHreXneRC+eVTF6rXBAzvv9VCri
 up3/jZdFwERpsh9hllTHnc3kpVKZbKcEFxF8A0OrZIdUaD0bVlrgOpa0EDIyTOURtb
 o0d/ubMBvfyGSDsT5Qk58drHn74e1p8MddmvwST1Jvk5z/LQJHJEiPMrf2LySDY5QB
 TbN+7wvnTuv+21vK+ZaTgx5U0eqSbs/XxfXrWm9967i2VtGs7WPCb7qe6L2B9gXqpi
 uIohJ8ZLs8s4A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZNLypeSN
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version
 to 25.4.4
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

Hi Bernd,

On 19/11/2025 21:19, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I added links to release notes in commit logs.
Since those updates are minor bug fixes, I applied this series to
master, thanks.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
