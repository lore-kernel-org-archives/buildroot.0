Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DE2CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92FB14282E;
	Sat, 30 May 2026 13:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K7WYCoza2s0f; Sat, 30 May 2026 13:01:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF50842831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780146096;
	bh=2akCZa2EAGORjcxH5zSSDhWMqC61RsO2Nmm7uAsi1XI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TWtX5eIE0nTbbqevmBg0uEXLtvP0Ms6JHKG01flOTK0akNqC+butD7J2XttcTTGAZ
	 l/M9ThNnXjZTl0KaJr9QM2Cp9tUqf4cNQPg9/EgCWQeAFMd7kBYd1YDZ6nt0V8Hcsz
	 lpzYYDWC9jaRfRpri3SiZ01R2E0Wa2KXdIs5slYU4tpwe7WVqEEjTTCmi34SkF+Woo
	 bc7JQw+o7KVN3yYcfsbPU6BKpAgWUwtW6kOcwOscyKl/FIUwYNJzDkT/XpyjBQIo13
	 XR5MjSixmivQkXPikhl7CrxaD8osVsGd4XVsXSmjBwDZt44wMpeLitRhZlQh8Ia17c
	 jdI9xOkltMPTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF50842831;
	Sat, 30 May 2026 13:01:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 86649D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C2FD407FD
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NqWDa3noyRIb for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:01:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7AAD9407A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AAD9407A3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7AAD9407A3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:01:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 2469013F854;
 Sat, 30 May 2026 15:01:21 +0200 (CEST)
Received: from 2a01:e0a:1015:b940:caf0:d340:4af7:8ed3
 via 2a01:e0a:1015:b940:caf0:d340:4af7:8ed3 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 30 May 2026 15:01:21 +0200
MIME-Version: 1.0
Date: Sat, 30 May 2026 15:01:21 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Tudor Holton <buildroot@tudorholton.com>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, Olivier Schonken
 <olivier.schonken@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20260506163136.1330722-8-bernd@kuhls.net>
References: <20260506163136.1330722-1-bernd@kuhls.net>
 <20260506163136.1330722-8-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <5fb275785726f9b1ee845d49a7d90946@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780146091;
 bh=XEJxUeKkXOwzMFCItpj3zpyvSenoSXgNBzlc78wRM9Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bBdOr51FJsLZwmAJUFnR+arS+F5hskKOJ4Bms4Alcj/JvAic+jnbyOqa9w28Ycp/H
 r/6TTxCsG1hpgaQXH3sKFSOGJKpZOguRvupepkm4e7N1StD+nGlRUEvcP6NeA51H8N
 mFTqvZDhKxIfXZEaMMd6mwq2K+W7eRFthPsDZgsCoveANiM7QfTb/K89PlgilEpZF/
 2n75WD+GtExJtYo1jWLn02ZQRzvbDWDNAL89eBaDL8z/3c/2WBnAjtengNEBQ2lPXg
 icFyywMAVKI6VlRO2fQ+jpN2KB0E7GERkNSiPZtCT6aq7xTV5IK4FxF7PujP9i4pCe
 Aw0JzXrWLokxw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=bBdOr51F
Subject: Re: [Buildroot] [PATCH v5 07/22] package/cups-filters: add upstream
 patch to fix CVE-2025-64524
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

On 06/05/2026 18:31, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Since this patch adds a package patch fixing a CVE, I applied it on 
master. Thanks.

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
