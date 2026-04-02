Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76307D6AAFF
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 19:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28C9241177;
	Thu,  2 Apr 2026 19:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Na4J_AAL14zh; Thu,  2 Apr 2026 19:21:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9601940A32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775157684;
	bh=7nHOU1FruYGvMZRnoAE1KoUztA+ChTMsJdLvKxRKCow=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dBqHJt3dOrNOyDKTiinL1P5+RJUtyecXtBHW7vq3tykCiOJ1awq48fx2kh/NhMbCz
	 SzGUQeuhf2MINhPsrmbbpOfcXa/bK3tYwufNAKz3/IPUFeBzk65YJM0eULhoW8YwNH
	 sA4ETVupLIg981SfPZ0SZpkgSaSldAxr7yj+vIPTt0dc9H99U7g8PMVJoAI0UgGIdm
	 lEsByv951SGJyCniEJgLTMb9vrbssh/CUOfZwhklst1oNTyO8qhoBi7sKyxN2pbqMd
	 PNMMAvJxSENdXx3WuHAYVkqVjORxIKnyOUKSNq5j0evr4hxsJuclsHM2ZCjCLo7GIY
	 uTZU5N+B0eD/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9601940A32;
	Thu,  2 Apr 2026 19:21:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B7EF2A2
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 19:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99159400B3
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 19:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bZ137QQ0tNlx for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 19:21:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1D86D401E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D86D401E0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D86D401E0
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 19:21:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 9E63713F854;
 Thu,  2 Apr 2026 21:21:18 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 02 Apr 2026 21:21:18 +0200
MIME-Version: 1.0
Date: Thu, 02 Apr 2026 21:21:18 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260402165535.1464368-1-giulio.benetti@benettiengineering.com>
References: <20260402165535.1464368-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <5ccd6ff42b0dc57a28c6e2a770f24480@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775157679;
 bh=gFMF1oxH50DsiWDuJehXs5n1ncxu9cZPb7C2MpzbR6w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UePhmN49vEuFA/Kjm7Rj+v6MUJtKdBX9Ti5Cka/aBImMOnVKGxEllaUiNX9hr7CD+
 X/FkjPOCZK1fhtglJH/tvwK+4hARHX1LlE18UBE6JEXX6LfutuntXFpHefDPAvU51Y
 OldSgBLPOmWbqi5P9nWZ0XDgVGM8TZ+t9wD8VWeBrIi9CEsJ5iF8LqqZ7mlsflwThk
 1+2oXL4bWzJhOlx++nTW6JMQCbBqvuq9QRr7BkDgp7hDkxWS7lHyKez6tRqtznr34R
 EXylWpLwwqOVAb05R2YzteV9mpuk+SuumQZjVhkm526RUFHvHK5q+MhAcYl2L6kAG3
 mSgzZutH503zw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UePhmN49
Subject: Re: [Buildroot] [PATCH] package/bind: security bump to version
 9.18.48
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

On 02/04/2026 18:55, Giulio Benetti wrote:
> Release notes:
> https://ftp.isc.org/isc/bind9/9.18.48/doc/arm/html/notes.html
> 
> Changelog:
> https://ftp.isc.org/isc/bind9/9.18.48/doc/arm/html/changelog.html
> 
> Fixes bugs:
> GL #5817
> https://gitlab.isc.org/isc-projects/bind9/-/issues/5817
> GL #5800
> https://gitlab.isc.org/isc-projects/bind9/-/issues/5800
> GL #5826
> https://gitlab.isc.org/isc-projects/bind9/-/issues/5826
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
