Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD6AC3ABCB
	for <buildroot@archiver.kernel.org>; Sun, 11 May 2025 17:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D71D40712;
	Sun, 11 May 2025 17:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2v7ln5mV58CM; Sun, 11 May 2025 17:48:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB10840878
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB10840878;
	Sun, 11 May 2025 17:48:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E34B8154
 for <buildroot@buildroot.org>; Sun, 11 May 2025 17:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8E9F4071D
 for <buildroot@buildroot.org>; Sun, 11 May 2025 17:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ELfkTlMlrpgu for <buildroot@buildroot.org>;
 Sun, 11 May 2025 17:48:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AB2B340712
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB2B340712
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB2B340712
 for <buildroot@buildroot.org>; Sun, 11 May 2025 17:48:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 46136B00563;
 Sun, 11 May 2025 19:48:14 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 11 May 2025 19:48:14 +0200
MIME-Version: 1.0
Date: Sun, 11 May 2025 19:48:14 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250511161312.3194997-1-bernd@kuhls.net>
References: <20250511161312.3194997-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <af997277c1b0becd02b35cdd2f8355bd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746985695;
 bh=oPJDhGhfIi3hoo1+p5OD+vE+Ieq+xfY9NI7DjVIRuF8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fkMKq6dTxuwxlnh/2Iqi4N360exwODqBwpVBh87qDDI7wHFOhqc8eQVjwZl9Wgx2q
 P2tIzXDvp0qv1pHKyl9nBX8OeDDIABxUyoReNNpy6u0Hz1jKdjJtxSu9j0NQegMn7I
 dn6YRhizb3M2BZSk7WCifRufqHFCRseoE4yXtu8C/d7DV5jfVRePliLYdcanhRyaKx
 hEmcrQs0rLomGlsE3EGdv7wSiwolZUhchUR6ftU2m+ouHkUKHs1DJeu06PfFlxnL+R
 JuPTJxPT5x4MwBzjGfd4SLEKwSQhZd0kqXUNbjCNZkTCvUOWk2agh4VTnpPk1B6tc5
 2KbDJMgqPXmbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fkMKq6dT
Subject: Re: [Buildroot] [PATCH 1/1] package/ghostscript: security bump to
 version 10.05.1
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

On 11/05/2025 18:13, Bernd Kuhls wrote:
> Release notes: 
> https://ghostscript.readthedocs.io/en/gs10.05.1/News.html
> 
> "This release addresses CVEs: CVE-2025-27835, CVE-2025-27832,
>  CVE-2025-27831, CVE-2025-27836, CVE-2025-27830, CVE-2025-27833,
>  CVE-2025-27837, CVE-2025-27834, CVE-2025-46646"
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
