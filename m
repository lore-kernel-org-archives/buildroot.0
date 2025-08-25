Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49999CA0FE7
	for <buildroot@archiver.kernel.org>; Mon, 25 Aug 2025 20:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11864612BA;
	Mon, 25 Aug 2025 20:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3b0wvzZBy5_T; Mon, 25 Aug 2025 20:00:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44577611F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44577611F8;
	Mon, 25 Aug 2025 20:00:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8292CCD
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 20:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 747F841256
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 20:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7V7j1aniRsRA for <buildroot@buildroot.org>;
 Mon, 25 Aug 2025 20:00:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 90312413A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90312413A5
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90312413A5
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 20:00:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 49C3D780504;
 Mon, 25 Aug 2025 22:00:23 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 25 Aug 2025 22:00:23 +0200
MIME-Version: 1.0
Date: Mon, 25 Aug 2025 22:00:23 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250824212502.4134787-1-romain.naour@smile.fr>
References: <20250824212502.4134787-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <86ad126b92a7f032d0e6b41dbd8ab4f4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756152024;
 bh=I4ChzXe3+mI30d3fs5WSAEh5R8P/4U2O7GAKd4IxQkE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bjEyXtlGHwA8cbEONLtQA42dcuXIVnMXRW4n0ioZs7GmRocbnUsAVJSdeZPCbtzgH
 Cx0FCSFhj5zfAI0weJAfWT+xlMD9RDhNzUQUkjnXqhjUDK4y+UIIOXD/3j/nMcVzlH
 ZXjzof1pQKBl/zMWQ8agpwXmlyrVzVNAKfzPMHbGPw3X39qL/8uCL/0QVKTZ8BHErw
 h9VQMePSHtg1+J//2ON7u1CUvwaL5+qLp/JTF3+aRO71MhAJnKFNZ5/EzC5qq/jVJf
 cNEfSfqIvi3WBqcUF3EvTeM1hAOyUzYjuZrjqjA3InQZUiADqSXc1HCIqee6tu8jY9
 0n82T6+Mrh4GA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=bjEyXtlG
Subject: Re: [Buildroot] [PATCH] package/python-aexpect: backport Python
 3.13 port
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

On 24/08/2025 23:25, Romain Naour via buildroot wrote:
> The module pipes is no longer part of the Python standard library. It
> was removed in Python 3.13 after being deprecated in Python 3.11. The
> last version of Python that provided the pipes module was Python 3.12.
> 
> A new 1.8.0 version that include this patch has just been released few
> weeks ago [1].
> 
> [1] https://github.com/avocado-framework/aexpect/releases/tag/1.8.0
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294894 
> (TestPythonPy3Aexpect)
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
