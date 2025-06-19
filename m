Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DC4C7115B
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 18:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24B6660DE9;
	Thu, 19 Jun 2025 18:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eUPkwRuBLMDf; Thu, 19 Jun 2025 18:52:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0600B60D97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0600B60D97;
	Thu, 19 Jun 2025 18:52:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 140DAE2
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 18:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0575E4076F
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 18:52:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y4PwG9bltOCc for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 18:52:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 34E4040767
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34E4040767
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34E4040767
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 18:52:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 430467803A2;
 Thu, 19 Jun 2025 20:52:05 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 19 Jun 2025 20:52:05 +0200
MIME-Version: 1.0
Date: Thu, 19 Jun 2025 20:52:05 +0200
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250618212357.189395-1-romain.naour@smile.fr>
References: <20250618212357.189395-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <9fb09648474702a0aea83a7dcc1424a8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750359126;
 bh=u4pnXbhggvLLW2MvQCiQvoAXaILZHJ8XjeEZ6TMsGHU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aLuLBcnzvrTArKSz6QZTw/0crtND6HEqLGd5dnrwa4D1/QMS51hdvN51x+K07/NlN
 8meXfUjOfodhYj96yFskWzUVh4exVrYhg/LIfkIUi1qEf6oL0d/tHEt2y5XcGwRG+f
 M5I7KIm/nxeQnCaZEEy6BCr9J4+FnAEoKC1AVF06nRDFumxCjxO2s6izkvT+CR8BTq
 Px5gaCPIgnfI1ZcDXLLl5PkQdBnI4aHheoBVx7tpJRZt8nNkGXrMh9+Kjd0WHIhlzq
 WSiRQQDP3oPVxUOWiZt9ge/HBX4QIhGnTJanEkIw63guv09iMgwBqqu6QniXN/k4TP
 5H9H9EF35mMTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aLuLBcnz
Subject: Re: [Buildroot] [PATCH] package/squashfs: update URL to source
 archive after Github changes
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

On 18/06/2025 23:23, Romain Naour via buildroot wrote:
> The squashfs 4.6.1 archive hash has been changed suddenly two weeks
> ago by Github without any intended changes from the squashfs maintainer
> [1].
> 
> The orginal squashfs 4.6.1 archive has been manually uploaded again.
> 
> Update the URL to download the archive that match the expected hash.
> 
> Since we don't use the github download helper anymore, the squashfs
> archive name is changed from squashfs-4.6.1.tar.gz to
> squashfs-tools-4.6.1.tar.gz.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448207
> (and many more...)
> 
> See:
> [1] https://github.com/plougher/squashfs-tools/issues/313
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
