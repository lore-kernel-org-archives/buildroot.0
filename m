Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2920EC55167
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 21:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D910260608;
	Thu, 30 Jul 2026 21:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mqrFx-7I9LJk; Thu, 30 Jul 2026 21:09:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01D5760633
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785445782;
	bh=ePWiXarDrnBPeIf9Gg4pUH6qo1Bk6oquZf+oWOYgCZg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=l3TgWH+xPfEj/b6aJWWVHsQxH5tAxVNoG9FMEMI6vLvKh2Yh86SfWGIsFlP4Gpahg
	 dKyprEXOuXTYXj8i2XV0KcsQg0Dv8KBsbsYqU6VjVYJV4xsC3Ibe0vnShmLXhwVSJ8
	 T8Cdhbo1+6ar3tKeOdLwRjUdp/nFx3F8tZRURkzQaNsjIOeJkbrGHKxKfxN9Kcnw6p
	 nGU3+oKh/3dmUe7YEOSdP14/0FlWPMxMXof15IkM5oZW7dSEEI3Cpy4ZMF25mk9K2j
	 r1hwzf94r7XVYud9wfOo5JvWvY+8t8KVvJHOeN7JXYayDs4XRuOdyG7eug3M2rvfIW
	 +P8jOB1i2kbFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01D5760633;
	Thu, 30 Jul 2026 21:09:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E3D9B2CE
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0E5940DA4
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fha7mHzAzvsc for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 21:09:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E8B2240DA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8B2240DA2
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8B2240DA2
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:09:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 89EDC5FF95;
 Thu, 30 Jul 2026 23:09:34 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 30 Jul 2026 23:09:34 +0200
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 23:09:34 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260730171825.95765-1-bernd@kuhls.net>
References: <20260730171825.95765-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <e81772c157c80be931ba0ddbd645140f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785445775;
 bh=cbniA2v58em/tRdTpZrJ2GCWumW3fEEM8VUO8k50aEc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mnv9yAngcNb4zpdyTDkBkQx+hzbfZzK3b+vPaTJQSnR7oiYBbrhcO7ky1kqXJyzur
 FLfZ5LsWixudybNwTdb6oNWOj69kx47LNoy/EbSwekK3dQkqVpDvmim2NFnzQIqLDQ
 Vam6vEBFVZNZmOVoyVFLdlp8dGeTwIxMYgon5s0qsmOWerzz4RsSROw4Ra69iyiMh0
 T8FfWbZhyZWb7YQqHYOHuKyJz1lua0xzGQLHvKp2ZKO2P/9Bmll6bslL7POiMQixL6
 UZAdzGIhYonzhy54LkPzKPK20x4j0SdpzG/gSOBnWeb5bUk8Wj3y9o1dBaE03pMpdY
 x41xMl03zNNkg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mnv9yAng
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.12.x,
 6.6.x, 6.1.x, 5.15.x, 5.10.x, 6.18.x series
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

On 30/07/2026 19:18, Bernd Kuhls wrote:
> Update the latest kernel releases to:
> 
>  - 6.18.40 -> 6.18.41
>  - 6.12.99 -> 6.12.100
>  - 6.6.146 -> 6.6.147
>  - 6.1.179 -> 6.1.180
>  - 5.15.212 -> 5.15.213
>  - 5.10.261 -> 5.10.262
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
