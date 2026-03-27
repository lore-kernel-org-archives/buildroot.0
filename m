Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5485110F2865
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 19:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57024827AA;
	Fri, 27 Mar 2026 19:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rB1f1joLj-V2; Fri, 27 Mar 2026 19:10:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29032822F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774638628;
	bh=zTYaSGAgIzBdobgo8qLgqfIPC61FbTvvbFiCrEmHAO4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rTnCh+FayeC7NzAtcrbfWY6UQ9FC9TwTjGsmSV8twSeW/nXR3aR5NpVMopSIhvfoK
	 iPCc++FxOx7N9NQS7kL6L98QgmF0p0Vx7titl80GfnhtWWc49oJRvKKbYhMeUVWJ7S
	 NC6V7IsFijTCok+iSn0R8cwroVS4amFGOW9qVIIk6LdjMJhTncIDFrl6RabSXO2Vfk
	 bogvg6xdRrpgCGrc42rvqq9Sa0+jSy7wSK8+b+/BqK7tqc2scTbxs20r9q+dUtub4n
	 VON7ZXZKqDMnFzZmLFF4BzsV9DWRqKcNHq2nef+j7M8XNTu6U7ebxQvUq8IvZbSr2o
	 74J4GhihY3mpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29032822F6;
	Fri, 27 Mar 2026 19:10:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 375F110F
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 19:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C400822F6
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 19:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fJ6y4-gTLli2 for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 19:10:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4AF0282258
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AF0282258
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4AF0282258
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 19:10:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 01D875FF95;
 Fri, 27 Mar 2026 20:10:20 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Mar 2026 20:10:20 +0100
MIME-Version: 1.0
Date: Fri, 27 Mar 2026 20:10:20 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Heiko Thiery <heiko.thiery@gmail.com>, Andrey
 Yurovsky <yurovsky@gmail.com>
In-Reply-To: <20260327182155.192855-1-peter@korsgaard.com>
References: <20260327182155.192855-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <f7edf630673560c018de0fe1cf4f3541@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774638624;
 bh=nZrU5KhriWpaDgDM7Z964tEf7lBwCPm/wh/fdYob95g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GNCK6qIy034vHpaTNg+XXkkQ+4i/N/sAcDcqq3RSw/X4oQMi5tvab211mKAsPdbek
 zijlhAXhwjIzk9BB6anT/a/0A3hc/TxaOMzoq6oXafumnSU7Y84cWf0xUNFfVKL7Pn
 diO4ysrS8CXuo7gCQojSyfGlcmULl/k98Gp8RE3jXoIS7siulgeykPQ3byuTu+PWdI
 f96KwjKHp4q810QqQ/anSnGLTuU/XQhcEKQvtK6BV/MjZGTc+jEanVWZ4dQZMMhTL3
 zdVGGqBAtVW94U8WZbQ6qsvjYEnsmVufX5KMFKhV9slisOlcZKCXjtkFCPg7Qo0q5S
 M/kZXUgfZzcgQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GNCK6qIy
Subject: Re: [Buildroot] [PATCH] package/rauc: security bump to version
 1.15.2
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

On 27/03/2026 19:21, Peter Korsgaard wrote:
> Fixes the following security issue:
> 
> CVE-2026-34155: Improper Signing of Plain Bundles Exceeding 2 GiB
> 
> RAUC bundles using the 'plain' format exceeding a payload size of 2 GiB
> cause an integer overflow which results in a signature which covers 
> only the
> first few bytes of the payload.  Given such a bundle with a legitimate
> signature, an attacker can modify the part of the payload which is not
> covered by the signature.
> 
> Bundles using the recommended 'verity' or 'crypt' formats are not 
> affected.
> 
> For more details, see the advisory:
> https://github.com/rauc/rauc/security/advisories/GHSA-6hj7-q844-m2hx
> 
> https://github.com/rauc/rauc/releases/tag/v1.15.2
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
