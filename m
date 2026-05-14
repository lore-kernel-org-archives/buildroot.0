Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C40DCD4851
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 10:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E55D40EE7;
	Thu, 14 May 2026 10:55:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GFGiETt5fynM; Thu, 14 May 2026 10:55:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17D8F40ED4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778756116;
	bh=eSlQo8nQzJWeOXHjSXjltjFUIvi9OlIHekUVz5RDojk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Fvyo5maGYnVwAeanO9e2EYlhTZBGkJsq328lM9G7uUE3SRe3yKyGdgnXsVjX49dKM
	 XieKeCd6S5V7nNyrLg8y/Vicm7VFcAd2x1HNS6u1LUVoeijgOWDxJ6pdgnO6N+dr4t
	 MqSl0hlwaii8OBEDB1FMV3fth4rVzlTOL3N6XPKaZH6YnwuzaNRB1KWdkroZEn9Uyw
	 /CABY3PYoD8lWcJlion+l+GIGe8rg56gD6slDbB3vvcqYiY1GsNJYj6I5IdqVFPcR4
	 z3IKtw3UnMLK7HFs4WmW6Lj3LyDqJZe/4exspd25/av7qr1c1VfjTvmlpcu84Y0s2C
	 /pHfrbhq4bBnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17D8F40ED4;
	Thu, 14 May 2026 10:55:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 505FB36F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 10:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4232F60E4F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 10:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0RsYFcinemld for <buildroot@buildroot.org>;
 Thu, 14 May 2026 10:55:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7675E60E4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7675E60E4A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7675E60E4A
 for <buildroot@buildroot.org>; Thu, 14 May 2026 10:55:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E65F42003B4;
 Thu, 14 May 2026 12:55:07 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 14 May 2026 12:55:07 +0200
MIME-Version: 1.0
Date: Thu, 14 May 2026 12:55:07 +0200
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260513081618.14018-1-nicolas.cavallari@green-communications.fr>
References: <20260513081618.14018-1-nicolas.cavallari@green-communications.fr>
User-Agent: Webmail Free/1.6.14
Message-ID: <00d34f8ab1e7e180dfe77260083666c6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778756109;
 bh=RScESH0X2AKqb91XDXVnTZaLtYv1z7CqKM5n0tipp5w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uahvM+VktALYlegvF+PXn2nRbmtG6k0RnXlsIA3n66yNB9prYF5IjNS49dm1zS3zj
 loPHtL63NsA0jFvT9s51iE4PO5bId8OHj5613TlVNEHAmZQZBAuuCBzhTZgWHhfu0P
 kVNxcKW8rSNq7uuvLLzA/obrCguiGf8+X/acJLwhcQWMRx+cbdUvgrcSdPV4nHaQlk
 yJ9s5JohNdNIVTZM0/S4sY8M1pEiCwRiSq9WHWeeqv3m1lfT3yBfTRlg7F3G3IAmmT
 MCOteLQGOGI6bYARCD8QcWAxGl778/dIH5i9RbvhXs+dKyvUJfdgxfco3YVHab0B/h
 KVeulh7U7bGcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=uahvM+Vk
Subject: Re: [Buildroot] [PATCH 1/1] package/libgit2: bump version to 1.9.3
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

On 13/05/2026 10:15, Nicolas Cavallari wrote:
> Release notes:
> https://github.com/libgit2/libgit2/releases/tag/v1.9.3
> 
> Signed-off-by: Nicolas Cavallari 
> <nicolas.cavallari@green-communications.fr>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
