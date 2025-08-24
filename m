Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FD2CA0EFC
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 15:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4965A84596;
	Sun, 24 Aug 2025 15:12:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3KbXPqz6HVg4; Sun, 24 Aug 2025 15:12:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B8958457F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B8958457F;
	Sun, 24 Aug 2025 15:12:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D11919C
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 15:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03E4260BD7
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 15:12:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d0rG4MhxPS3G for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 15:12:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EBFD560A63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBFD560A63
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBFD560A63
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 15:12:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6E7145FFC0;
 Sun, 24 Aug 2025 17:12:31 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 24 Aug 2025 17:12:31 +0200
MIME-Version: 1.0
Date: Sun, 24 Aug 2025 17:12:31 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
In-Reply-To: <20250816091300.3104974-1-thomas.perale@mind.be>
References: <20250816091300.3104974-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <8c0fb6962394afe4f11b74f3501f1981@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756048353;
 bh=QM8X7mHzmi05szJoT2vfoRZl61XHzV1OR1TDC6PRKEo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ixROgmx1rW0kIdxLximLbrS9ZnSoc6rpl/2WdEgfyaAovmHh0kBnZ9/iYzqhyFVg4
 syHMwBNmvGl1vpk61PNSj5t4Cx5q923wV5n5RaOxiGD6VOFSYfUSqda1w/AKXvrivx
 5rCqn0UKxz/VNPcfENOABBU5w8JL+/yMscmX5j+2qtVHULZIGXyLM9TMx5nSD/omdn
 tI0vAYJ9r0UlDTgbM488tVkt1+phCgjOWjLd1Tz2CV2J8JODO6TtjJPJxDaXk3NmTQ
 J919m1i8xZCfoWD0iSjYJPV673T8YtWb0fWF1Iu5SEHRS1bux8PDEBqmfgBmM7NFt1
 QCnS2bXdm23rg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ixROgmx1
Subject: Re: [Buildroot] [PATCH 1/2] package/cpp-httplib: add patch for
 CVE-2025-46728
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

On 16/08/2025 11:12, Thomas Perale via buildroot wrote:
> Fix the following vulnerability:
> 
> - CVE-2025-46728
> 
>     cpp-httplib is a C++ header-only HTTP/HTTPS server and client 
> library.
>     Prior to version 0.20.1, the library fails to enforce configured 
> size
>     limits on incoming request bodies when `Transfer-Encoding: chunked` 
> is
>     used or when no `Content-Length` header is provided. A remote 
> attacker
>     can send a chunked request without the terminating zero-length 
> chunk,
>     causing uncontrolled memory allocation on the server. This leads to
>     potential exhaustion of system memory and results in a server crash 
> or
>     unresponsiveness. Version 0.20.1 fixes the issue by enforcing 
> limits
>     during parsing. If the limit is exceeded at any point during 
> reading,
>     the connection is terminated immediately. A short-term workaround
>     through a Reverse Proxy is available. If updating the library
>     immediately is not feasible, deploy a reverse proxy (e.g., Nginx,
>     HAProxy) in front of the `cpp-httplib` application. Configure the
>     proxy to enforce maximum request body size limits, thereby stopping
>     excessively large requests before they reach the vulnerable library
>     code.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-46728
>   - 
> https://github.com/yhirose/cpp-httplib/commit/7b752106ac42bd5b907793950d9125a0972c8e8e
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Series applied to next.
Patch #1 applied to master.
Thanks.

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
