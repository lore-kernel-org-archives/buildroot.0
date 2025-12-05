Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46E9D374B6
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 22:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0F6861722;
	Fri,  5 Dec 2025 22:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ySVFXrMxULYw; Fri,  5 Dec 2025 22:23:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F242E60E7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764973411;
	bh=WCPVNhNHCeuZHX9PHS+Jk06LhRsmEHzpbMg7PbympJY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s+axlXgGM4+0EGYdOPqldanmBP7boZKpOxOA6TaYclBL1+qs3CBqBfII4YRUBBRq/
	 N86zAHYjMoNqSGGFCGBTh+2TEdWwM2FRs38bRGh0r3t8RX0OER2h7+VMFQ6h2lKaNn
	 zvuo44ozbRVty7ztg3DkDeBBIQojUOKDI/QB5h1MKb7m4WJ5MvL8LBK4ppyl3KkW9p
	 ipqKiZKiPA0n2QQWTBUNWnDYLWarhzyl8ZoQSFRaXh374pY/rQx7yIvCcA40+yfZAr
	 hmTMDktdYlXxCfwt0gIPgWzrVgTRfnclp6H+Tb4ANzZWVgZ+u5I6DWwIoakqXKZpSn
	 20sKZkp4RvTBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F242E60E7B;
	Fri,  5 Dec 2025 22:23:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A4D9258
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 22:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F8574041A
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 22:23:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mh2-mdVzo-J2 for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 22:23:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2F4C940010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F4C940010
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F4C940010
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 22:23:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 963922003C3;
 Fri,  5 Dec 2025 23:23:21 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 05 Dec 2025 23:23:21 +0100
MIME-Version: 1.0
Date: Fri, 05 Dec 2025 23:23:21 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Marcus Hoffmann
 <bubu@bubu1.eu>
In-Reply-To: <20251205124620.609798-1-buildroot@bubu1.eu>
References: <20251205124620.609798-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <18a8249e42048734864aaf9203933f3e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764973406;
 bh=myJNQkwRyWUr14KVpDMth5kqMAMs+Ms6Izr4tJtOyEo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=j2XP7025Q0yJpuwPa0irUtdvhCbUVgpfP1z1rHlsEC0juyqu4jGjGx3wWXQm+Tvwo
 5RsY20Mw0SdsSGjdwiVwt0hKqXs05jx/w8terpUSYLvFKIlf0BvEXCwLk9/tLDS1RC
 ySzXXfs29sVza7fVp0TQuKLOUuQbYX2lCg9IyksnR/zBWC6ysLGYa77H2TwAedEA0E
 ZRur49uvK+JGiH0pOU7HekdilLOcnKbd9i7emIwZ9ZP94Bt2CFh4voY1D2pvB+STrO
 fAI5MbIHTju6uAiWcbykR9qDPfA9hVJwDviLyAW0DdkNjPGLTsK/KrmpZ59T2jcSgY
 YZwTnOnQXdqhw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=j2XP7025
Subject: Re: [Buildroot] [PATCH v2 1/2] package/python-annotated-doc: new
 package
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

On 05/12/2025 13:45, Marcus Hoffmann via buildroot wrote:
> Required for fastapi since 0.120.0 [1]
> 
> https://github.com/fastapi/fastapi/releases/tag/0.120.0
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
