Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B57E85388
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 18:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80517831A5;
	Fri,  3 Apr 2026 18:21:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BV-_7pFd4Z0l; Fri,  3 Apr 2026 18:21:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6F328318C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775240460;
	bh=8xd72o+MMqX0lofW8DycVgRYJ5Sz46QRLqsqqnRXz60=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VKzOEUbnaVfQvTge8f/k9m4Pu1gFvvxF3w+OpFHOGfelDC4K19to1BdgkzHmqGdlc
	 yaqXSG4t3qZXpYZjrObmagNZhycPuJfAJKqxBfhBH8bj+4k/xjQBghoTxbJ1baKK7J
	 BXq4++sPU0MR+K3LxSURXpuZeVedP9V4uhkUq7mOy4zVWD5j+bm5HXB2/hhqtkSR+l
	 kA3FYhfApNcAKRQnzpHEgGtupi8HypPkS+fUo48Voj3FMj9FRqK+gx0uUAYMy9f0Ix
	 SlH4F10DZl4QbOK7zIL0e2TE3mtkTpAqx2GT9d6u1kWjD77YRnH/9fyYFP/2KC4Es1
	 gdGsw4IeijJ6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6F328318C;
	Fri,  3 Apr 2026 18:21:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E75B1A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 18:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F355883192
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 18:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kj3JvkNeNrBO for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 18:20:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 426DF8318C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 426DF8318C
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 426DF8318C
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 18:20:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 84A92780371;
 Fri,  3 Apr 2026 20:20:55 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Apr 2026 20:20:55 +0200
MIME-Version: 1.0
Date: Fri, 03 Apr 2026 20:20:55 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260403134130.675035-1-bernd@kuhls.net>
References: <20260403134130.675035-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <5dc0282afec2d1c99faf15d2b98a09f7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775240456;
 bh=4SmrRwxCXEuv+VbUR3xZIpNMiAwJndeZ3MSBTB1+1Uk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KB9xx07k0sb4NbVkHTV/R3U0Eeae80RY+5Cukwvn4YoKph2gVaibeovILRT09CYuT
 vlWJQs2XJv5A2cLo2socuMG+6NtJXVFzZYR3myxIb0K8c3u4iiOzGirOWm4h/FFIER
 q+8MvBnpxeiVocJszMmbDdduqQ6D0malaQgWmTTIHcgAIBHRgm7fw7x+qSNYm7ednV
 Z8uy9JpYOa4fUZGlzXpr2wH5DckS6DTrtxYU3Qbnqw95VV7c2tB31Ld44+YNWNPv6Q
 YlvGg+lKRGqVO5x8EgH7yP5knMOIR41Va1MutCT0V3plY5vGrW/vhyMZY/UjuMQa7O
 j5Wvjsk8DMYQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KB9xx07k
Subject: Re: [Buildroot] [PATCH 1/1] package/cppcms: Remove dependency to
 pcre
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

On 03/04/2026 15:41, Bernd Kuhls wrote:
> Upstream allows to replace pcre with std::regex since version 2.0.0:
> https://github.com/artyom-beilis/cppcms/commit/731bc83a980211a704e59a7049957ad579ca7c2f
> 
> We switch the package to the new code path to prepare for the removal
> of the unmaintained pcre package.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
