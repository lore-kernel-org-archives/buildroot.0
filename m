Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D3FC5B56A
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 19:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E1A260880;
	Tue, 11 Aug 2026 19:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKMmxQHQ0O5O; Tue, 11 Aug 2026 19:31:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49D83606E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786476712;
	bh=UAqso7PbmLyoteqatfQgRfYI+RrL5njNtYQ02UJkOE8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sIW2+cmEYjDMhpMg5XX2hQr2QHzexDuYcU9PwaFDIfhkLtYFuIqOTaxaN9QiKETH4
	 dngeYmyt/iyEU1knsMBy8MTA+4cRst7cdbgVL0Cb+NxVfZfuOdIW1wRCs981ReGh9R
	 imhJ1L//wCH8drC1EVdFjRxf2RjJBsVb1WiODaR5P09Idf64DAo78lPXn7ISnonUlU
	 dMJM5qwQqUC5J7QZPoZzmqwcDVYihehVTyefH+DcRgSEbtvNWj+7JdI01IDILFXUwc
	 BLlilqtd31nhlPaefK5Y2VT/lG6bal0Nzzc4dR6wlLAk/7lmkMhtNwc8iPw0XZCsEw
	 BhI0CAfY2wLVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49D83606E9;
	Tue, 11 Aug 2026 19:31:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D4443A4
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F23B4035F
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Vx5faHKjW_B for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 19:31:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 55653402D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55653402D4
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55653402D4
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:31:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 215EF2003B4;
 Tue, 11 Aug 2026 21:31:45 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 11 Aug 2026 21:31:45 +0200
MIME-Version: 1.0
Date: Tue, 11 Aug 2026 21:31:45 +0200
To: Sebastian Michel <sebastian.michel@oss.othermo.de>
Cc: buildroot@buildroot.org, Manuel Diener <manuel.diener@oss.othermo.de>
In-Reply-To: <20260811114854.690028-1-sebastian.michel@oss.othermo.de>
References: <20260811114854.690028-1-sebastian.michel@oss.othermo.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <9c4b305244e76d2f4ef5e6648cd80643@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786476707;
 bh=0zWaK0rONaoOryugS+QCbiX0119x+5Gdng5njOxW6WA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ofo8HogBFa46vJ6zTqxHSFz2npRjTmHFUCyJM8ueBLF95K2/8GlFFLVD5hG7qC+wB
 x6RsPw1g6UPwOcRv5vez/RKxRdvnyAZHto63x9yGSg9YLZfxLxPrgKJT9El0ZnfRUr
 HpdTNV6shV7SMXAi3zn1411ngBitZM76hFSpQNoH0iyEjtzO7sg0bLxmRKE6p42b+h
 SWKRWKiHRDvkEj3+GnjqYSl6aUXFw6jcFZKOvTPNPFS3YXOeIQDb7chbqiM1bnNKwR
 HtjyfauKZ6uUFr/tRUU1y0lI2H71gLks0M/n6rI6dBKf6io5oqg17pK6En5IPFayrn
 +tPGRRYh4rQXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ofo8HogB
Subject: Re: [Buildroot] [PATCH] package/pico-sdk,
 package/picotool: bump to 2.3.0
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

On 11/08/2026 13:48, Sebastian Michel wrote:
> Fixes CVE-2026-25833 (via mbedtls udpate in pico-sdk)
> Fixes CVE-2026-25834 (via mbedtls udpate in pico-sdk)
> Fixes CVE-2026-25835 (via mbedtls udpate in pico-sdk)
> 
> Signed-off-by: Sebastian Michel <sebastian.michel@oss.othermo.de>

Applied to master. For info, I marked the commit as a
"security bump" and added a link to the change log. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/6632b05900951d66750e888da353e98f44d89f80

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
