Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9125FFA1FEB
	for <buildroot@archiver.kernel.org>; Wed, 22 Apr 2026 19:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2C578077E;
	Wed, 22 Apr 2026 19:33:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xnpEpHSenvSK; Wed, 22 Apr 2026 19:33:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3895A80779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776886404;
	bh=1FCZeOh5ezlfV8fPqVr6jPs0nkd1qqESk4QVA9nu/mY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=H84O1reJ493dOAfvq+ZT06w3SK2xqt2y7vWR7JANVPwK4ST6nFOLZRYzp3f40leC6
	 NV7ZXfOzfj0VObptFlXgzXVIESxEXMdTuEgxVI7UTQ6cFM/K367hZ5qnZgpnM8As/V
	 mvm1g9nO04K+5gvXdSTEwXbOfvA05sGFN/zMMVlfvpVUG3EmiJM7ieocYhpkZZ2YB+
	 QpFyDx5IpJoJhFPyarAyQsLPoKm2Bs3GLSMuXohrZbZ/6f2ZGjuChE+ii5/6tab5sV
	 Bm+P9zxG9aI8A83H24FTl/lUFjtap1fuijzs64d9LMorZHYbOR6hcBB+G3RaEzphk9
	 ZHAIqQa8CWllA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3895A80779;
	Wed, 22 Apr 2026 19:33:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AE3724D
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 19:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FC3D60608
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 19:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O6QaQEDxy-WL for <buildroot@buildroot.org>;
 Wed, 22 Apr 2026 19:33:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E7616060B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E7616060B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E7616060B
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 19:33:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 7863C2003B4;
 Wed, 22 Apr 2026 21:33:18 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 22 Apr 2026 21:33:18 +0200
MIME-Version: 1.0
Date: Wed, 22 Apr 2026 21:33:18 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260422171252.3200023-1-titouan.christophe@mind.be>
References: <20260422171252.3200023-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.14
Message-ID: <e8928cc01af2b41c78ddacfe8f5c9c69@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776886399;
 bh=kF49IdksQfGNKild8yVNVPV36gPENgx9/L5cs721gUo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C3DPZZRAeTvO5JqQTgkLCiRDDIpKfXqZ8lItWrsA2LMXqFhltAKopxvNNXPt2J/AU
 3DAOsgLpiEDv//c+izW6F+sYknpg5m5Vao0eX9jcbRa70vZ1x/hlFyub2hkpG1SDA0
 o46KEn/8GLpboyTVNhIMqTwriuSj6qdUqhcEhM4lzvi5FsWggmRQjbH1KEpUEVIzrg
 N4y/jHw6tJ7GkTOqqyt+gSKg/53w98A0YrsaEykYPhCPZABH6TXkcUFFxQpJZajwOG
 KmgYUh0u12NYIdsMaPyv6hIHk/oF+f1ZX96B4LUWVWAXdIDvnQYzH316WZytILGGSg
 IaxaJnmb6cbVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=C3DPZZRA
Subject: Re: [Buildroot] [PATCH] package/imagemagick: security bump to
 v7.1.2-19
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

On 22/04/2026 19:12, Titouan Christophe via buildroot wrote:
[...]
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
