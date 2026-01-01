Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF612EEEC1C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 22:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7939740631;
	Thu,  1 Jan 2026 22:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id irqOs0AT3rzN; Thu,  1 Jan 2026 22:27:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE2BA40510
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767306442;
	bh=863uwQJVfGMoW/QZJnOTLI2ZzO+YwhwT5ieaI7TeR70=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jTKkE+N158udl530eqs5oxHmHxEf3pY2uLZVwdYh+HTVoW90TNFoMG1SbpEaZJ4by
	 xK55FdhvdHUp1nk1BGASnRWEdSFkl2eaaj6nvbYMLxqiBkZ5MKuxkH5fk9dfW6wevZ
	 qNQnpDYkbuTQ8s6FgG1mv6sIGhQmvL/p49LkceZ/zcSJlsbGKNXiBPFc4bN+CGCHE4
	 5bb7M9XjuB/T/U5OPrRWHqW+DpvEfZ+drALZ8nep9Prb52hf3FUDRUvhtUvlThlHUk
	 6WKT1t84P/mHzEgx/Y+h0phIq0wakPRk3AwI7mbSGOnnylPAatpT3OZRjtgc6Rlk7w
	 QK2gX6VakOomw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE2BA40510;
	Thu,  1 Jan 2026 22:27:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CE44206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32D8D40387
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9F1BQZUeruZ for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 22:27:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 217FC4036A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 217FC4036A
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 217FC4036A
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:27:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 4B1564E41EE5;
 Thu,  1 Jan 2026 22:27:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 040A360749;
 Thu,  1 Jan 2026 22:27:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B87AA113B0713; Thu,  1 Jan 2026 23:27:15 +0100 (CET)
Date: Thu, 1 Jan 2026 23:27:14 +0100
To: Edgar Bonet via buildroot <buildroot@buildroot.org>
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>, Bernd Kuhls <bernd@kuhls.net>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20260101232714.566c9499@windsurf>
In-Reply-To: <bf9d2128-7603-4747-a0f9-3984e4e9c2d4@grenoble.cnrs.fr>
References: <20251115171432.1930126-1-bernd@kuhls.net>
 <bf9d2128-7603-4747-a0f9-3984e4e9c2d4@grenoble.cnrs.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767306436; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=eWUb/SL51eqDLW8yg77h3c3WWXyvlndBhVC68abusAU=;
 b=jCoznXpAHDg4FtxbVlN+L4HCd70yrUFzXYQlKDdzE++tKe4tdDzA8Z6QYZ+XIHQvFPa2uc
 6eWnKEEAtFqs6F0bSxq4FT421eHVQpfiDdbyEkzppyoBX4TKdc3uJCZ8QHfmXTK7W6vvo4
 SewzjDS482XqEUTBUI4VNU0l6ztBjQjNT9WZwYyXgMPlfQslJDqjuh/Gmrffny+P/P5yAA
 UpVWlipFd/erlYMEbn/6Eo0hyrVGBTrtYyf4XMDTqOEY5cyV8lGVEdmaiX1WOyhOtnNOim
 95FSQ0SZQPVa6NRZVbGnR7wFj4FMX1JX5zeAQls6+a7CwG5QsbPAa1o54XsvAA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=jCoznXpA
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libgphoto2: Fix compile
 errors with gcc 14
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBTdW4sIDE2IE5vdiAyMDI1IDE0OjI0OjEzICswMTAwCkVkZ2FyIEJvbmV0IHZp
YSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKCj4gQXMgSSBleHBs
YWluZWQgaW4gYSBjb21tZW50IG9uIHRoZSBwdWxsIHJlcXVlc3QgcGFnZSxbMV0gdGhpcyBicmVh
a3MgdGhlCj4gYnVpbGQgb24gb3RoZXIgcGxhdGZvcm1zLiBOb3RhYmx5LCB1c2luZyDigJh1aW50
MzJfdOKAmSB3aGVuIOKAmHNpemVfdOKAmSBpcwo+IGV4cGVjdGVkIHNob3VsZCBmYWlsIG9uIGFs
bCBwbGF0Zm9ybXMgd2hlcmUg4oCYc2l6ZV904oCZIGlzIGEgNjQtYml0IHR5cGUuCgpCZXJuZCwg
aGF2ZSB5b3UgaGFkIHRoZSBjaGFuY2UgdG8gbG9vayBpbnRvIHRoaXMgaXNzdWUsIGFuZCBwcm9w
b3NlIGEKcGF0Y2ggdGhhdCBmaXhlcyB0aGUgaXNzdWUgZm9yIGFsbCBhcmNoaXRlY3R1cmVzPwoK
T3IgcGVyaGFwcyBFZGdhciB5b3UncmUgdm9sdW50ZWVyaW5nIHRvIHByb3ZpZGUgc3VjaCBhIHBh
dGNoPyA6LSkKClRoYW5rcyBhIGxvdCEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28t
b3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVy
aW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
