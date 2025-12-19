Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C49E6689C
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 22:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EC8083DEA;
	Fri, 19 Dec 2025 22:35:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HagMt3ECnhWb; Fri, 19 Dec 2025 22:35:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B374883DE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766183708;
	bh=HlXe09T8C7qOwDOtWNSbwBlvC94lAhvs0kJieoTPKRY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XAon5oUcUWdk55rtllrjPlWb82x1kEDbmhrXaVtrxaTm/nyRI68XcJ05H3i5B6dA/
	 ev2SOgouNadJ/I0/AvA7vzqsbCTwv+pv6OGFXkr3vD4JGaFh8zl7RtIseILYq+zdui
	 KSBSYDa1tJd6Fa5XCgNeUFy4ka9yQ6VKaYItSVnU7vN2QVg5fiC+7yMYFmkGIJ6vbt
	 +uUrDWAmtMnq0mEfiMZae6pXkeeW4M1R63CrDGMqhvccJ6wIsO3JfpDtGV0JvQNQpZ
	 YpYGCgzEqmJI5ADg0RDZ4oLQAgTBNPUuT/zr8nIgYyT6CVWMK9X5q4qykZRfxczfPJ
	 yxRcWcUqxAKkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B374883DE1;
	Fri, 19 Dec 2025 22:35:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CB247119
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD7624007F
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TA2dcbGvdvUl for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 22:35:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D56D74006E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D56D74006E
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D56D74006E
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:35:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 9E3E22003B4;
 Fri, 19 Dec 2025 23:35:02 +0100 (CET)
Received: from 2a0d:e487:418e:8c09:857b:bc67:c232:7cba
 via 2a0d:e487:418e:8c09:857b:bc67:c232:7cba by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 19 Dec 2025 23:35:02 +0100
MIME-Version: 1.0
Date: Fri, 19 Dec 2025 23:35:02 +0100
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Daniel Price <daniel.price@gmail.com>
In-Reply-To: <20251217223750.119857-1-titouan.christophe@mind.be>
References: <20251217223750.119857-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.12
Message-ID: <8d1ad59165eb889db0af0bd8e53203e9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766183704;
 bh=u31JHC558U6hjYOkx8r/T9lFYWrBIWnSDbq3NERfDe0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=j7LvxF/BHHarPa3pG/JVLnDl7yu7VxKJOTwMU51I3fhpS4KMyan4nieqm4Dg+ViBb
 dbRdAuo5BjEfqDTbbi5T4q0QdCnQUavqfdq3cGBvmviUDTjrUs2eZsfxzSyydpESwR
 8QtT+aN0KZM5nHY6uL6AydxihRN+n9LfpFmHIah4IHtmt8dCpzyJwb7u7VYa7+j8Ge
 I2p6Hi5Bsfz4jFKr8iRfrulXikqlLE/QRocvhknG1BDhMMyqh35Rj1qP0h/U8bBdmc
 G9ZXUDyiejBnSidG36AsL8pmjfLv3CR41J8fb7QpREDJdzs9eb7BsTyk5mq6RaaAlk
 HfeHHNeS9UksQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=j7LvxF/B
Subject: Re: [Buildroot] [PATCH] [PATCH 1/1] package/redis: bump to v8.4.0
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

On 17/12/2025 23:37, Titouan Christophe via buildroot wrote:
> See the release notes: 
> https://github.com/redis/redis/blob/8.4.0/00-RELEASENOTES
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
