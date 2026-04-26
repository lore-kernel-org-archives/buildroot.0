Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001ABFF885D
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 20:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40E5861CB2;
	Sun, 26 Apr 2026 20:02:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9EqyqimbuEs; Sun, 26 Apr 2026 20:01:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5395161CA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777233718;
	bh=Num/mjgOxqM35gENYBDGtHA3uTogSxYkgXhSyy7dMTU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mFTcWbdbC+MFIxfVO3Xcdo0u0S6xaNFeRetH2AYKBRbaWtjp/v8SBkemTHLF8A+lU
	 bMdFMBDP2MOYdeqx7n6xGI2Ku0SZ0HYtx0POtVrZ5jQzHDqM7ZV4i64kDEeReiJSVK
	 O3UijPXmUMLR9vy1Ls7ePziev5iyjpHvKy4ShkQgfqjeeLsXciowxqtGwD3q5U5AIC
	 7OKbsksRH3M4acJTLNOq25CI1MUlgoE6ByWSKKNB/zRwnUyHta6lwtvjk4WlFl8J5i
	 096APWcYjt8Isx/Xje+KA4DVkFQL8hKW7H7GDtI9Uhalne4xlMLpfNE8gP2ksCwT/+
	 VL0sEsIEZc7ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5395161CA9;
	Sun, 26 Apr 2026 20:01:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E70A82DF
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 20:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCF1142ABD
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 20:01:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bzWCwkGfnV4f for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 20:01:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D3A2942AAA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3A2942AAA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3A2942AAA
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 20:01:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E4BF913F8B3;
 Sun, 26 Apr 2026 22:01:48 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Apr 2026 22:01:48 +0200
MIME-Version: 1.0
Date: Sun, 26 Apr 2026 22:01:48 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>
In-Reply-To: <20260425080944.790046-1-bernd@kuhls.net>
References: <20260425080944.790046-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <86520760984e9c3046febb51bad38ef3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777233712;
 bh=Kg1WfEIoaNoYfa8N6pHucB4azkTqAxlJklfh5SpvM2I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pp0vYcx+6zP9BX4OoehBjmw+1UKbVZRMdopkUoH2Y0obkxFVgFCR3toOtA+A6Q9vO
 NnpoBqe55ivL1OV5gokg/MBOUJEzfBNG97ziUxLw7uk/b/jrCr9K/AQl14PdNE5fvh
 bZgmfj6q3dN8oICzkHtGzD1o0bnM+l+IRetTnHc3/cyzalEkF5tOGFDotfHA/6yDDO
 90B9e/7+vkwPkGumydikAPiCFFLUAH0KhtOekl8kKwSU0UjGmhK4WzPg9oeCexES1W
 ecvh19CuE16XcfysrRwdSqBLMHXSwO14r4k/uleIBVEsPESBjRLdO/7h2wB6D1l84X
 16mQC6Vql8pzA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pp0vYcx+
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to
 22.1.4
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

On 25/04/2026 10:09, Bernd Kuhls wrote:
> https://discourse.llvm.org/t/llvm-22-1-4-released/90622
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
