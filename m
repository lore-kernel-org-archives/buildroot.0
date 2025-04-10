Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9317CC3601E
	for <buildroot@archiver.kernel.org>; Thu, 10 Apr 2025 20:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C005606DC;
	Thu, 10 Apr 2025 20:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zAk5qTnEOz8G; Thu, 10 Apr 2025 20:43:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74B1B607AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74B1B607AA;
	Thu, 10 Apr 2025 20:43:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12A70108
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 20:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00B45407DA
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 20:43:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4TDhJest1cGg for <buildroot@buildroot.org>;
 Thu, 10 Apr 2025 20:43:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0E54F40741
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E54F40741
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E54F40741
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 20:43:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id D083213F86A;
 Thu, 10 Apr 2025 22:43:50 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 10 Apr 2025 22:43:50 +0200
MIME-Version: 1.0
Date: Thu, 10 Apr 2025 22:43:50 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250410201801.1150764-1-thomas.perale@mind.be>
References: <20250410201801.1150764-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <5a824d3fec042813e01e1fc1a07a681b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744317832;
 bh=uuqt7SNhHvcoI22keJs+as8JTI6brIXslScUgmgZjcU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J26jx/aV0/yUkyNHFg/nZgdMpHTm3HJtVCCr+AHkdqmGQUMG34yVFHy3b7J3l7nq3
 QWZvQnvkfyon0pGXuLc9NFCkJk5T7qifMY2Nq1YeJZWX5Vdnw2EOOfbHE3V9P+d5cQ
 4vJAgp+B0gLru4pPdv1eQhyZcn2fWu5bALteq6UPEgqv7jVNPr7kRCUJrk1TAOL2xI
 ob8zYJOV4TfzsI1QSutpfVN5ihGA8k2WyL6EJq7BEKfTFDcYj47K5jW5tjmd6+p5O8
 PL4J2bRHw/JklVb0WfwfbG1B/h1ZJaoPB5IgHLbAIIiRJRiN6TdUBAe9loKsVsKG9x
 yEiBZpL/kcC7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=J26jx/aV
Subject: Re: [Buildroot] [PATCH 1/1] package/augeas: add upstream security
 fix
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

On 10/04/2025 22:18, Thomas Perale via buildroot wrote:
> Fixes the following security issue:
> 
> - CVE-2025-2588: This vulnerability affects the function
>     re_case_expand of the file src/fa.c. The manipulation of the
>     argument re leads to null pointer dereference
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-2588
>   - 
> https://github.com/hercules-team/augeas/commit/af2aa88ab37fc48167d8c5e43b1770a4ba2ff403
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
