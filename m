Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86742CA0EE6
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 14:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5378E81266;
	Tue, 19 Aug 2025 14:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sYDGpnEt4HJM; Tue, 19 Aug 2025 14:51:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7119F811E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7119F811E3;
	Tue, 19 Aug 2025 14:51:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 359E2E0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 14:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C34C60AC9
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 14:51:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yp33AQYI_3ZI for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 14:51:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 462A360A4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 462A360A4A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 462A360A4A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 14:51:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 47FAB13F88D;
 Tue, 19 Aug 2025 16:51:19 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 19 Aug 2025 16:51:19 +0200
MIME-Version: 1.0
Date: Tue, 19 Aug 2025 16:51:19 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250818083826.2770186-1-thomas.petazzoni@bootlin.com>
References: <20250818083826.2770186-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <cf46da4964dddab7f78d62bef3eaa5c7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755615080;
 bh=wLZRzm+ZFRnFvuMGci1NTGhfwn8RW0ENLyHysbFfN0w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uoK76kgzTgP1OM11WgRaZZlhxsX7qFdwNzMQjRVj4Wv2ruY/wuWAW2fN/dFeQC9Yv
 jvhXTO4OnOJQ+CzBTK7HjacPZC/wg0Y6edqY74zfjwkshs1mtm/N7SViHV4YhCQGqx
 h3fcCpX9gLS8Q9B7eiknGUTtdccOBTpixx3HgC9i9XJsxFXpT9QS/7PmqlD4QCwhaq
 J1UCX9UlCi/IjlUjmneIco3gONoQJsLnDqyyD2zC0KqxU0sjC7ZISWfY0w0ArauQ8K
 0l1DYVRn1EFOT3a/LXHThXwgR1QPyAozkGXyDrekUvEk6TCIDf5bfltg7QE5qfOX7O
 gwguhLLZwvhaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uoK76kgz
Subject: Re: [Buildroot] [PATCH] package/elfutils: fix build after 0.193
 version bump
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

On 18/08/2025 10:38, Thomas Petazzoni via buildroot wrote:
> The 0.193 version bump done in commit
> c7508a23242aae7a80f22acc4473da25f7f9e96d broke the build on numerous
> CPU architectures. Let's take a patch from upstream's main branch to
> fix the issue.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.net/results/3b005f7afec386f6fa4237f427f73367d55bb211/ 
> (sparc64)
>   
> https://autobuild.buildroot.net/results/a6b1d5078abdd6c8def93aaffa2e67573250da3e/ 
> (m68k)
>   
> https://autobuild.buildroot.net/results/45305cc2be3b255740808ee1f3486d1a10abfbb4/ 
> (microblaze)
>   and a bunch more
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
