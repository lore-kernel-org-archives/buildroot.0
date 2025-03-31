Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F30C3600B
	for <buildroot@archiver.kernel.org>; Mon, 31 Mar 2025 19:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F46D81BF4;
	Mon, 31 Mar 2025 19:59:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cXgpdLd62nke; Mon, 31 Mar 2025 19:59:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DF5281E80
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DF5281E80;
	Mon, 31 Mar 2025 19:59:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CA4D5121
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 19:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9B5D406C3
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 19:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5252PJQ8T14a for <buildroot@buildroot.org>;
 Mon, 31 Mar 2025 19:59:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DF5BC4072F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF5BC4072F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF5BC4072F
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 19:59:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A4BD5B0053E;
 Mon, 31 Mar 2025 21:59:00 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50264])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 31 Mar 2025 21:59:00 +0200
MIME-Version: 1.0
Date: Mon, 31 Mar 2025 21:59:00 +0200
From: Julien Olivain <ju.o@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <Z-qD3_HeHh2U40Po@waldemar-brodkorb.de>
References: <Z-qD3_HeHh2U40Po@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.10
Message-ID: <71d1d2018132293de9d6652a73132fad@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743451141;
 bh=qBE/oq5ap16Mhr9QtmcY5rdDRFPi/E+Xr7eet11mbl8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PzoAhKFMCKHcFhGR4CNOmWTg265PP3JUKZ4wRU9MItVGuzCvOTP5ASfZL5n4PgK3t
 BjvHwsBfKtBQCSQPT1Swil28rILZMFDesuX8xFaW2AzD0oWquO9xYtBLB4XnPzoQBj
 qyBnjdqxtu8MLqfk7ZWLJiDBgYBo4OhU/UnL+xM0FxvXEViX0xRu5ZAhVLtHyurVB+
 yrrJ4ofk8VnI3Z29DvUlcN47/SlkPdOBIPlYELfszUaBvdOVvnbrALtDJHCC15HZce
 fDbDZYflR03h5FgPG9QcE3YG3Zp305nMh9XJOn/hVVa0x2M14npP98m4HdD/5Mtj2T
 UQ4JNbA7QNthg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PzoAhKFM
Subject: Re: [Buildroot] [PATCH] package/zabbix: update to 7.2.5
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

On 31/03/2025 14:00, Waldemar Brodkorb wrote:
> See here for a changelog:
> https://www.zabbix.com/rn/rn7.2.5
> https://www.zabbix.com/rn/rn7.2.4
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
