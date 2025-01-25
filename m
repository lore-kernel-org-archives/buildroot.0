Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A80AC0218D
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 14:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2514760C2E;
	Sat, 25 Jan 2025 14:36:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1NCcpNm71tQb; Sat, 25 Jan 2025 14:36:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DE0C60B3B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DE0C60B3B;
	Sat, 25 Jan 2025 14:36:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AAEA4941
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8873840C24
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:36:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WTf1q3LRqdQq for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 14:36:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A8D9240C13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8D9240C13
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8D9240C13
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:36:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id C5E7D2003BE;
 Sat, 25 Jan 2025 15:36:05 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47700])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 15:36:05 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 15:36:05 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250124192247.3813308-1-james.hilliard1@gmail.com>
References: <20250124192247.3813308-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <19d8ef2fc549fc60af2eb8a3bdff7e34@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737815766;
 bh=LtUvKqOBXtXZy5f5S4e06WAz4ETR8FsFGFO9erDqOsc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cNgF5vrTQP6uomIMj43aTGysotUGGntiNCKNnjokQXz1GVzXZKFEkXVddJC1i8Du3
 p7oHZ+DGRXqXnMXLstuMINM2asY8RbNQ//kic2CAodML2hefVFbzbG4ZF2niv+1sDI
 X/oOuchXhkUr13iG1hXO/SpR5Cqn9epsh+dFT5OQ1K0engkghCz7yxe+a7G9k4N+8v
 cLkxy13v0EciJi2crsocJvwANRIM175ecsTcK5qDbXN3+67OJfOvfxBc8/OsY9269R
 HMMx2EYF2hZDX6W1IhwMH4YB2Y7p+dWhG06E10x2NYITw1+nc76tweI7kC4sqiNho+
 tTgNMRzMxahmQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cNgF5vrT
Subject: Re: [Buildroot] [PATCH 1/1] package/python-grpcio: bump to version
 1.70.0
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

On 24/01/2025 20:22, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
