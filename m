Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CA3CA0EE4
	for <buildroot@archiver.kernel.org>; Wed, 20 Aug 2025 15:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E1F0611A3;
	Wed, 20 Aug 2025 15:10:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ESH8BUgQ7SCZ; Wed, 20 Aug 2025 15:10:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E359D60E53
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E359D60E53;
	Wed, 20 Aug 2025 15:10:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7227FE0A
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 15:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 646F06112F
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 15:10:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fyIbZ7kVvyHQ for <buildroot@buildroot.org>;
 Wed, 20 Aug 2025 15:10:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9933160E9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9933160E9C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9933160E9C
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 15:10:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id F2CF36013F;
 Wed, 20 Aug 2025 17:09:56 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 20 Aug 2025 17:09:56 +0200
MIME-Version: 1.0
Date: Wed, 20 Aug 2025 17:09:56 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>
In-Reply-To: <20250819204443.3155790-1-peter@korsgaard.com>
References: <20250819204443.3155790-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <a12078dc9f53e6138d224e91ec4b614f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755702600;
 bh=Oswgp8mGs+hdA62hVF6ZNiwR0TpBJFtNQd1C1Jjf/JQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZsHj1Fiu+Yb7ybRhYYBmmrs8eUgLac1w+GZFCszYdgiBXmvTGipznE6Kal+gpUTMa
 whWJqi0Etx1ZyN8LaHfMxMTxyItVTRx2/z8XIOm1xH0OaGoZ97z8oo2DLypb6gO8yH
 PbWvqRP9BL5NR+nFzU6pZeFGQX/TvJJCAVUQW/dkWEfMjaE7JTdt58o9yBUgIumNSD
 1H0/XMNeQscxNqLPW9TYibE1kJHer6SdB60abxki7FiMco07stjqp7yWG68SZ+5xQ1
 DEliqfRavWm55CvED9V9IqcPb9LObr+sA3PpgnTLenyPI5X7dKuu3YmrUxDJ71jcgC
 NVm28ReAYufqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZsHj1Fiu
Subject: Re: [Buildroot] [PATCH] package/go: security bump to version 1.23.12
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

On 19/08/2025 22:44, Peter Korsgaard wrote:
> go1.23.11 (released 2025-07-08) includes security fixes to the go 
> command,
> as well as bug fixes to the compiler, the linker, and the runtime.
> 
> go1.23.12 (released 2025-08-06) includes security fixes to the 
> database/sql
> and os/exec packages, as well as bug fixes to the runtime.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

For info I added links to fixed issues and CVEs. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/84276c0449b3c902ec73247bf74a1104e4c4b1fa

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
