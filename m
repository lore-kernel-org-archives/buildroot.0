Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAA9CCD1A5
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 09:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EDB14037C;
	Tue, 21 Oct 2025 09:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADHDnK6FbQe5; Tue, 21 Oct 2025 09:40:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5EDE4039B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5EDE4039B;
	Tue, 21 Oct 2025 09:40:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 07CE670A
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 09:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E15E380C2A
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 09:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qJBwiPNqw0wr for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 09:40:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2D49880C2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D49880C2C
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D49880C2C
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 09:40:52 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id ACCB32C80CE3;
 Tue, 21 Oct 2025 11:40:49 +0200 (CEST)
Message-ID: <84230543-ed77-4f4a-a85c-faee139416d3@bubu1.eu>
Date: Tue, 21 Oct 2025 11:40:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
References: <20251021093500.744569-1-buildroot@bubu1.eu>
Content-Language: en-US
In-Reply-To: <20251021093500.744569-1-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1761039649; bh=yBP/yLHRjU4CSfHd7HbgsYyN2seFqjkm5vM8sQm6hqk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=gz5v7nMwzNvo1FkqUIxV0SXv7B/296/9V1wQkb6oZ4K/3oV+uhLxEPo/GPp0msWW7
 +YeRutshNubz8cExLWg2fXRPwQX6PQMrh4oaam6EtDskB0ZK6RSgiMvyd+D1gIhFVK
 nKT9nLQ/C5zXn611lo1sdj5pWYF6b1DYKlNxGxUYaKstqajRVOLYq9G/k11l279ZJP
 JsgXGB1ovHTsQBgzPJXbpsB8gAOnI/TGxnMqex30fdzPY1tIJbcMCTGGl1y0pKIf5s
 aFsP/L0NL6bN/ntGimA5K7KSPWX33SJCQ65OqT27Dz2QQpR5XGK5cpBw4+eRZpibFq
 c/DZQdZ5akGBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=gz5v7nMw
Subject: Re: [Buildroot] [PATCH v2] package/python-diskcache: new package
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

Hi,

On 10/21/25 11:35, Marcus Hoffmann via buildroot wrote:
> The package imports itself in setup.py to get the package-name and
> version number. This doesn't work during the buildroot build, so we
> replace this by the hardcoded package-name and the version number stored
> in buildroot.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
> Changes v1 -> v2:
>    - Rebase on current master

This is actually v4 already, I just found out, previous changelog:

Changes v2: remove accidentally commited .swp file
Changes v3: fix python-diskcache.mk lint errors

> ---
[...]

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
