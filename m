Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCDEFF8855
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 21:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EAD460B8B;
	Tue,  5 May 2026 21:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pBmoJu13dzL5; Tue,  5 May 2026 21:29:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAA7460B6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778016570;
	bh=9n6wAEb381rVChmrjA/rGWD8PHQVL4sfiFDajTSC4co=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aZywAy3GcOZ8z+MAbvyPsf0RP9MmxqiafdsiMitK8EE71LlpJ0axugzJk65kZp+0q
	 EVHv2s8DwX8GE8XErDtrxJ15gewj3MwR29+C6iLckxMpidXkK14eIPyEoCAshJrIhV
	 D6HZwWOqraUHtLeSQzVi9vbRu7qhToiI3/HL74JImWcXBjoN4194wh3D+UHeceGTO0
	 s1XK44EZAaVPm6mimknsLMWJ1n1rTekVhxC3ZxkWekvbnygsPhTpfW2WZMF5YHPqYj
	 iFRIJvSDHQF3KG2TrmV7DjDrfJRTgJmYzaEAe0IqGsCN0pEDi8sKeE8bfW13hJ+W3W
	 okHGNI6zgRhoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAA7460B6F;
	Tue,  5 May 2026 21:29:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74EAF280
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6752A60B6F
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KVmdDxwTj4VV for <buildroot@buildroot.org>;
 Tue,  5 May 2026 21:29:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9D1FC60B6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D1FC60B6E
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D1FC60B6E
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:29:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 515262003AE;
 Tue,  5 May 2026 23:29:24 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 05 May 2026 23:29:24 +0200
MIME-Version: 1.0
Date: Tue, 05 May 2026 23:29:24 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Shubham Chakraborty
 <chakrabortyshubham66@gmail.com>
In-Reply-To: <20260505193712.2389858-1-bernd@kuhls.net>
References: <20260505193712.2389858-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <393ef66a90c3b6d7b7a513b68d78f84a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778016566;
 bh=USbZAf/zeMBj6448lWlJWwiOK8GuisOXFMsnq0sC+bM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HfqaJ2Nh0XXnPcas9bIxzfqdnHqUdOUKnvVFXvZkvFP8NkNeSMJVBzZRykC3nvGWY
 z5pOg+RZNKWxsCEyRdajHw6yvcFgtpVp6WzjI5tqQI6LiPUqfxLBcL1DGPrPsmvUKY
 80QIsMYTWriI1o1zc7RClWpF0+Pi3YhRsdQN0uspxW+tbSXeVR19+5uZxLbPimDht5
 3+6EGPqVm+P3nMaoMZMsnC85Lf87+MQCQOhiar/xA0xABJrWTaaiP8kAhRdgZaw/Ps
 sPblKUXrto8/thnFCvf44/TtdXmnoRVYbkVgV4QZxhS0T/RXqkol6s63Ez/hGDQchl
 uvcOCNlekKipA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HfqaJ2Nh
Subject: Re: [Buildroot] [PATCH 1/1] package/ccache: bump version to 4.13.6
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

On 05/05/2026 21:37, Bernd Kuhls wrote:
> https://ccache.dev/releasenotes.html#_ccache_4_13_6
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
