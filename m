Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A77EB26F7
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 18:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21C3F60A65;
	Tue, 10 Feb 2026 18:35:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KE9mtAXRt0JU; Tue, 10 Feb 2026 18:35:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C1DA60903
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770748500;
	bh=OKvZycHjbQ9SFf+pt3UrWa5r4f+TAj2LRzl1toygx2c=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=mC8wXZly4HEoIVCeMWShBKUEQhpNt/CTvhWQ2Tj6J/waBmdBX42EICUpeliEPgAKX
	 j9HXZlUDVM88I1WH44vIP/qVkGnoI/B67XKIvhgFFv7y2KWCxYwUl8qJPRa6hJbrQT
	 K8soXf8HiaViSLAYqL+i7Y7XGxoVZKuI828jg1osvbRV5vsDghidk/8xdP/gCGfU8j
	 ZgDIDQJUglTp37k4zdZMYA1hC0qO+pZEeUTaLhWiKqcQIGmCFPoQttOFmopVZDb99x
	 6lZp1/68Mf2zD6fB3CnOpJWXzz7/BY4CQmNn/m6hyx7JP1nWGE8x7O7xyvyGq/RwH8
	 lbVhDnF2HFAPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C1DA60903;
	Tue, 10 Feb 2026 18:35:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E94123D
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 18:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 090CF4117B
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 18:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NDzn4jqpMpSj for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 18:34:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E47F141163
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E47F141163
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E47F141163
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 18:34:55 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id C41962C801B0;
 Tue, 10 Feb 2026 19:34:53 +0100 (CET)
Message-ID: <e690380e-98da-4d95-bcc6-3a8684131ca2@bubu1.eu>
Date: Tue, 10 Feb 2026 19:35:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20260209232901.2915903-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
In-Reply-To: <20260209232901.2915903-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770748493; bh=iZpsa/lYkNXldH3jUUK4AnIOY6H4Gp2bRZ7GPJU50X4=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=KzkoBJgLNIHds6zoBlv2Ur2PRsYvdS3cUbPfKS7JNBAqPRCxonN/KGdEi7X5srAM1
 pyFmKOVX0FoqR4jG143ElOq6AvNa6jElK6rZR/2WPnf4SJevLCaJYNUv6rXI8RbUhg
 ItpSq8X/31/i0ZmP1pAQO9GarB6vnRnGEGJABJHnt0brzHY3FL/2ukB0Gq8nSiPbXS
 H3SIuJ4YlmNnSYjlHLkWrDvT/PpCw51+rVCro5hXtzjKEgKaiDen8fwPneOuoxHN4c
 YembYoqF+Mv0gufPWkKLldiFgabaYtiDdClC/0nsLjabxSY9Ya/ZyNYtXQ0LtAbq6l
 K9kxJo9BiOQYA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=KzkoBJgL
Subject: Re: [Buildroot] [PATCH] package/zlib-ng: bump to 2.3.3
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2/10/26 00:29, Giulio Benetti wrote:
> Release Notes: https://github.com/zlib-ng/zlib-ng/releases/tag/2.3.3
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---

Applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
