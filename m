Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2559BC02181
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 19:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78D62606BF;
	Mon, 20 Jan 2025 19:34:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1MZPazfapbfd; Mon, 20 Jan 2025 19:34:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F6A0606CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F6A0606CB;
	Mon, 20 Jan 2025 19:34:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DF4CD7
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 19:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BC14414FA
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 19:34:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UOB52nOrGYix for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 19:34:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 56F47414F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56F47414F8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56F47414F8
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 19:34:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5342A19F54D;
 Mon, 20 Jan 2025 20:33:58 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:36118])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 20 Jan 2025 20:33:58 +0100
MIME-Version: 1.0
Date: Mon, 20 Jan 2025 20:33:58 +0100
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250119231058.715229-1-romain.naour@smile.fr>
References: <20250119231058.715229-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <396a866dc85af156d162eb7800243aab@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737401639;
 bh=lms1soGHJB28OL988PDkZT14cg/l0z0UXynxB8DAeyI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WheAmApxpZshTtHAygFkCfShAZ3W5G9VKVY6+g9+xVcWn8dQa+qLGwrkmK7B9jFL/
 a/74OcXdJfqCJJG0T8heV2v8QO+eHPfjVSOWk7Zqf/C1ZH2uA8dHk6R7fSTxFgcYeT
 VDRXEc11llVNQ8darsAgr48t0Ot8hH+3guZfb2lZgO10el9TK/Kh9ofKgrDhbx0A1A
 GkunWMZuBJzNhM63PpnxjbhfVqYCl8nHt02NrR684M+bBGrJNnQe9ol0cabmZhkRZv
 /RFKeTg278xnDQnxKzqY9iA+KV/2AYtwB/yFfxza4W2xT4+dM4pN5RDHVEB53o7F/g
 boeQ1MvFRwP6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WheAmApx
Subject: Re: [Buildroot] [PATCH] configs/qemu: update defconfigs to Linux
 6.12.9
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

On 20/01/2025 00:10, Romain Naour via buildroot wrote:
> Update all qemu defconfigs to the latest Kernel LTS version.
> 
> Runtime tested locally (on a build server).
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
