Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D9EC44529
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 19:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8333180D50;
	Mon, 20 Jul 2026 19:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7P7Wb95c5ayB; Mon, 20 Jul 2026 19:43:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B9B280D21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784576638;
	bh=LCBWpg8WP5QfgMA8E66rgC/QzvU7Mql63huGLuUXYTY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N4qP6M1AN/CxrXtYfdDpXcmw4pG3A95dvxmI5T8njahC8yBfnu/igFHh1UNrF0dPr
	 v8cP+bCnma+eu85bf79ngl7wbx69XwUJZE1Ty4/c0WX08vLjKsDlFg31+2JZm4FXlu
	 5gi7asEtrCvyvfp5D4k28W/6qJYoU6U+gsmR1MRSItS3kVFm63giIX3WBtcTNh9mx6
	 Mk3L/NhdLE1epsWdILGfT8ttKHX1LdQMzE1DD/tcBBxzC09UGfcdPCPpXsu19bjr11
	 zcRw+aJwH/iS5/FZrecLO5C5mwxRBeOTBWdYNqAwBZ2rk4cPg/ct+zivSOIPpQPY4k
	 HeWKeTpSDw3Hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B9B280D21;
	Mon, 20 Jul 2026 19:43:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DFC30DB4
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5EDB80D21
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bELcHILsZ_Qp for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 19:43:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E5B7480D09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5B7480D09
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5B7480D09
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:43:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id AD53E780506;
 Mon, 20 Jul 2026 21:43:52 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 20 Jul 2026 21:43:52 +0200
MIME-Version: 1.0
Date: Mon, 20 Jul 2026 21:43:52 +0200
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <918f048da1962f22f91b05a79e7943797a33729e.1784526139.git.yann.morin@orange.com>
References: <918f048da1962f22f91b05a79e7943797a33729e.1784526139.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <22d2a4e5ef5f69643b698eeae330cd24@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784576633;
 bh=W0EzoQ7NYuqE5itsdoOuUttO7TvvQ8o2Nre7g0lpKUg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cO7WX9fK1QjstMf//2ZRJpnBzEEH7fM/0SUW7uXeGirtz+nPcMi0zE54KvLn1Hi8U
 eMvKXo1kPdzxaYKmJoloZuC9sH7awUgi40c+FxXZVgGiz5kjBnCLke3zBStzKobQWz
 enGBC7+KGkpVkUmhiZMeedkKatSCQkpoHq3oLIxxU3JZ96GxAyrR9//sEcOcqOSNqq
 h94nlJaMBsYBiU/WI4cFA+A+R3ZuLGSYt6V1X+QFG3pPkRYlUz3gCXN53ivScp17nl
 fySJEJXDXaQ1a2DuBNzRa9y70fQxJY0+Lrbp9J5SuDkIz2RrltVyPwvNq5ygqUKQmb
 2NBe6VCoTfBxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cO7WX9fK
Subject: Re: [Buildroot] [PATCH] package/amazon-ecr-credential-helper: needs
 NPTL
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

On 20/07/2026 07:42, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> amazon-ecr-credential-helper calls pthread_getattr_np() which is only
> available with NPTL; i.e. always available with glibc (where it
> originates from, since 2.2.3), always available with musl (which has
> had it since 0.9.10 in 2013), and only available when uClibc has NPTL
> (since 1.0.0 in 2015).
> 
> Fixes: 
> https://autobuild.buildroot.org/results/4e6e13f1161485b412d4601cb8972a1524ddd2d6/
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
