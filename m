Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0686C87FCF
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 16:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A261C8378C;
	Wed, 13 Aug 2025 16:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id otuLiPceg3dZ; Wed, 13 Aug 2025 16:57:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B97FF82023
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B97FF82023;
	Wed, 13 Aug 2025 16:57:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FF581C9
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5606A41A4B
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UdPpab3T3ghN for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 16:57:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 601F841A3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 601F841A3A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 601F841A3A
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:57:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id CA293780331;
 Wed, 13 Aug 2025 18:57:14 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 13 Aug 2025 18:57:14 +0200
MIME-Version: 1.0
Date: Wed, 13 Aug 2025 18:57:14 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250811120851.543585-1-titouan.christophe@mind.be>
References: <20250811120851.543585-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <47226bdd664992862569c952de9a634f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755104236;
 bh=hr7wQ0eNZfZc9vW6H+IMi7rec5Soy4YHhR6C2tkcB1c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=py+pqFn5xT5EfVSivB6xYoKs/w/icgL8Vq9KlpBPIziRXFjNv4wTp8QUp3tYmvjwd
 ab+XFdVxgtOPhJb6fsLOGvO1XSO4DpIDdC/SRyZqakmzbB6zSSPE+0SslY1wYBb+M7
 +lxmRACrMCPESpol80e0b31YQulRS5Jwj2u9MWGfKNY/McVi87izFaFVz3bYKVbHFK
 l7A2ABNecOk9bxFV8JzeTYA3tVBuuyutrYP9n/BVKZyjtMqQI5ijPC+PiNXnNMVShI
 5oeerYNKiks8t0zvbBSFIuOUxcpCfqpoI+hgINIhbhCUcRGqnAlFlT4II4FYbUzOn5
 NgT29l74kWRSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=py+pqFn5
Subject: Re: [Buildroot] [PATCH 1/2] package/ofono: mark CPE as valid
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

On 11/08/2025 14:08, Titouan Christophe via buildroot wrote:
> The default ofono_project:ofono is a valid CPE, see
> https://nvd.nist.gov/products/cpe/detail/734A0A32-DA21-49B8-86BD-1A60C7CDF864
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Series applied to master, thanks.

For info, I removed the ofono package patch entry in 
.checkpackageignore,
to fix a check-package error. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/611a795cfc3c39c5603be467ff98ca0839721ea6

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
