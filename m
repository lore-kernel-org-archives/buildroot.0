Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E1D1094481
	for <buildroot@archiver.kernel.org>; Sat, 21 Mar 2026 21:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB4EB41FC8;
	Sat, 21 Mar 2026 21:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-6JrUkc8p5z; Sat, 21 Mar 2026 21:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4699A41473
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774127883;
	bh=WeC3G4t+RBY2iVtvZ4pzStGwi8iAdnpyYNcudKUDSKU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=U73phvlrbXxx4hnVZ7BoH9u6yfpf3uR7YqT9Y6XbmKz6/57qOP4sMbCVP0dPv2aXc
	 iZLVACcWGfXUPi7acBRy1Lstz5oo/1MliCOGpDH1Q8qnTNcHIO7Y+XAJxgHMb/QwVX
	 /AKc0cdEyxlq28cGnzTNxZBVSplfvCJGwi00JQ5wuXa4qyKKYkPjve3tUZa4OJmBAY
	 QvvKdKQyxjNOUZXgPXDZ+Oo7fRdBmCP2neo9BPsnARFuxX6MA87qWTVcFgi9tc8tLz
	 3Z8uDNkLPDwHyXns71wAGRjRYwSrR99fumFxVX9iMYhiBvuy7ZtOxqS6VlXxXXmZPe
	 b51HQO9OiFGKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4699A41473;
	Sat, 21 Mar 2026 21:18:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D5B9A265
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 21:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6A4841473
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 21:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kXHQzS2FAkJt for <buildroot@buildroot.org>;
 Sat, 21 Mar 2026 21:18:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8B9894140C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B9894140C
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B9894140C
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 21:18:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D8A3578035B;
 Sat, 21 Mar 2026 22:17:54 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 21 Mar 2026 22:17:54 +0100
MIME-Version: 1.0
Date: Sat, 21 Mar 2026 22:17:54 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Knight <james.knight@collins.com>
In-Reply-To: <20260315131619.3961450-1-bernd@kuhls.net>
References: <20260315131619.3961450-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <ff4099a6cdd4fb8fc49114d4224c69dd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774127878;
 bh=jZDAEBp8XyEJSRRuEVJa6JeCF4UoxfuOtm8lzAPKSfQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JzzC0r57L9a+jHtP1+luHde5kww5A3+L0wu/UI0rPN3Arm+3RC+8q6USHr2WPlHZp
 CKEjmLLWkIY9bwIYOUiq0Rya9sG96yg4q5H9F94hO+hbDmY3W+t2qVbibd5LMVajW1
 QWmm+qzJ3Y23xrtcZ3OT1NZop3AmD3P1hguJhIwowLvGrRMGkkR2/K31By40rpGIXH
 JN+U/RDsMog2zOGVMEfZWVnUQhH5Qy6SuoNsNpbVS9/sO6gZB5PNWoqYb67Hx1cfbM
 mpMWwkOH/7CbMEXLvlR6x8dkMQo8uYpYaxMnHF0TWNf54Q96pXP6QH+Bc6xxUy+d7L
 LPuOp0AJpRWuA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=JzzC0r57
Subject: Re: [Buildroot] [PATCH 1/4] package/libzippp: new package
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

On 15/03/2026 14:16, Bernd Kuhls wrote:
> The package will be used as an optional dependency by the upcoming
> gerbera bump.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
