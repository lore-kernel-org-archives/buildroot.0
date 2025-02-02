Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4588C0218F
	for <buildroot@archiver.kernel.org>; Sun,  2 Feb 2025 11:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 929588128D;
	Sun,  2 Feb 2025 11:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UWdNwSI0-d82; Sun,  2 Feb 2025 11:30:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2602812F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2602812F2;
	Sun,  2 Feb 2025 11:30:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 892D812A
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 11:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AA4D42A8D
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 11:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ObNGvUu_aLg for <buildroot@buildroot.org>;
 Sun,  2 Feb 2025 11:30:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 49CD742A63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49CD742A63
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49CD742A63
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 11:30:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A12B3B0056A;
 Sun,  2 Feb 2025 12:30:09 +0100 (CET)
Received: from 2a01:e0a:485:b220:1449:f756:904c:bbad
 via 2a01:e0a:485:b220:1449:f756:904c:bbad by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Feb 2025 12:30:09 +0100
MIME-Version: 1.0
Date: Sun, 02 Feb 2025 12:30:09 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250202002102.44367-1-nemaakhilesh@gmail.com>
References: <20250202002102.44367-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <9cff407828cace45062069f517066940@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738495810;
 bh=pU9L4IR9pFcRmJm/2wt8JKvGs2MIrU0bSiyAutCl+/M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XkMvO9U5Gl7TWB9Ra2YwlRWjN6hyMSEHwKqXehsDIsFgTXJAk4Ea8HozjE3Bzhl30
 Pe6REs3W0xZUTNoHFCyKd9y3TREj433I9wdHlyxXZiGGxokKfHrJVYdYNuFYMyo8KG
 9cQWo9SCcqd925uiDIM+lCsYpph9Ba3NmjG7VJhvzBy1+EUsIFA0twPpoJdhAMWfJm
 IRnR2G7wDoE700wmU5pT9n4lDQMSi6Al6beiGZeaA/zHx7Ehdz+pZYknB62wPFDgfO
 jTSADgzylI2oagGq/FAhfNuoI73+furNe8gVnBrs7EobwSV6MwvooO3cn/S87rsd56
 iUMvnFXQcd1WQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XkMvO9U5
Subject: Re: [Buildroot] [PATCH 1/1] package/socat: security bump to version
 1.8.0.2
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

On 02/02/2025 01:21, Akhilesh Nema wrote:
> It fixes an arbitrary file overwrite vulnerability in the readline.sh.
> (CVE-2024-54661)
> 
> see - http://www.dest-unreach.org/socat/contrib/socat-secadv9.html
> 
> README hash changed due to version update.
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

I applied to master, thanks.
I also added the comment from Baruch that Buildroot is not directly 
impacted.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
