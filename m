Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCA3CD98F8
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 16:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07AFE6142A;
	Thu, 18 Jun 2026 16:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id twayVzGt_1Tu; Thu, 18 Jun 2026 16:35:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD38C61429
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781800518;
	bh=Q7Z9pcEWjfq8dAsVugRZCIqX3IENcs2O1dy1LFvXcrk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gsIVQ1GxJVMSZ3x8famThgzubgNJCJnJ8q+mhJNq75qjSt5dVtB+NyuCQD9ycThHr
	 4y7+1K3ao24hZ6/ie4QcPoWmz6URq77v2/UUfxN9MWQWHwOdDmjA/8v8/IodJBv25m
	 KkcBwCTlpy8UzPCBI5GtOpRyi6lq9/gHv3OrPEoQpmvJsc2vhi+GHJ/DiPsWWp2P/k
	 VvHOfDgbKsxKqoSsGNmuyFLCIjTn5Y2QFJmVYuHKEnydR2LtRHjygb+JorKepEgdpi
	 KMTHbQaMYdahrSu1YZLqoKCpR8hmVJDzaVg8hdrcfi3JknaN5PAJKzeFjGyTiIA80u
	 UpQg5t7eOFUpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD38C61429;
	Thu, 18 Jun 2026 16:35:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B7642BA
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 16:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 414A9843B8
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 16:35:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wIJir04NYSvK for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 16:35:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 61F4B842B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61F4B842B8
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61F4B842B8
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 16:35:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3E9FC4E42FAE;
 Thu, 18 Jun 2026 16:35:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EFD6D601AC;
 Thu, 18 Jun 2026 16:35:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CF45B106C8227; 
 Thu, 18 Jun 2026 18:35:10 +0200 (CEST)
Date: Thu, 18 Jun 2026 18:35:09 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com, Ricardo
 Martincoski <ricardo.martincoski@datacom.com.br>
Message-ID: <20260618183509.0d99856e@kmaincent-XPS-13-7390>
In-Reply-To: <20260618181452.6fe3794d@kmaincent-XPS-13-7390>
References: <20260615123930.447-1-kory.maincent@bootlin.com>
 <abca804a-1a63-4319-9b7e-ff9cdfed053d@gmx.de>
 <20260618181452.6fe3794d@kmaincent-XPS-13-7390>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1781800513; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=uoMU6l4ygnre6Z/eACJIImd0OOfL4p3Jml7VBLMb6YE=;
 b=CAlUC6MqJQ/ruRqs8FUDJFvpNHKi97PkLIwmYaszbeFkyuSlBxZSqhyJZ0Cd+BPMreBjL0
 sDVpKm7IuwiHbAypMmk+0xufFBA+Gqae4+5znCEjGsxfVL8o0/cI7TEE3NZuaAlfsMYq9Y
 GP+mqZuVTz3Vhcq0mvr1QOJ5DbgxIP/clIvfGmB8wYP1xkbQZu2v+HPzXLxF+kfPTbxk9Q
 yUpZwtAfVbu61QxuUAEE1jcD5/uAYAu9zmwCxR7KxHxQA9H8LLaiPb71WNMEghGYiQfJ/X
 CG9Ob4+p7X0TM6PBHH1IIZRrlhCurrUlZo9suLYev9ejXTGwcpJNSWy4e1gAXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=CAlUC6Mq
Subject: Re: [Buildroot] [PATCH] utils/docker-run: Support BR2_EXTERNAL with
 relative paths
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAxOCBKdW4gMjAyNiAxODoxNDo1MiArMDIwMApLb3J5IE1haW5jZW50IDxrb3J5Lm1h
aW5jZW50QGJvb3RsaW4uY29tPiB3cm90ZToKCj4gT24gTW9uLCAxNSBKdW4gMjAyNiAyMDowNzow
OSArMDIwMAo+IEZpb25hIEtsdXRlIDxmaW9uYS5rbHV0ZUBnbXguZGU+IHdyb3RlOgo+IAo+ID4g
QW0gMTUuMDYuMjYgdW0gMTQ6Mzkgc2NocmllYiBLb3J5IE1haW5jZW50IHZpYSBidWlsZHJvb3Q6
ICAKPiA+ID4gVGhlIGRvY2tlci1ydW4gc2NyaXB0IGRpZCBub3QgaGFuZGxlIHRoZSBCUjJfRVhU
RVJOQUwgZW52aXJvbm1lbnQKPiA+ID4gdmFyaWFibGUsIHByZXZlbnRpbmcgdXNlIG9mIGV4dGVy
bmFsIHRyZWVzIGluIERvY2tlciBidWlsZHMuCj4gPiA+IAo+ID4gPiBBZGQgc3VwcG9ydCBieSBj
b252ZXJ0aW5nIHJlbGF0aXZlIHBhdGhzIHRvIGFic29sdXRlLCBtb3VudGluZyB0aGUKPiA+ID4g
ZGlyZWN0b3J5IGludG8gdGhlIGNvbnRhaW5lciwgYW5kIHBhc3NpbmcgdGhlIHZhcmlhYmxlIHRv
IHRoZSBEb2NrZXIKPiA+ID4gZW52aXJvbm1lbnQuICAgIAo+ID4gCj4gPiBJJ3ZlIHNlbnQgYSBw
YXRjaCBhIHdoaWxlIGFnbyB0aGF0IGRvZXMgcHJldHR5IG11Y2ggdGhlIHNhbWUgdGhpbmcsIGFu
ZCAKPiA+IGhhbmRsZXMgdGhlIHBvc3NpYmlsaXRpZXMgb2YgbXVsdGlwbGUgZXh0ZXJuYWwgdHJl
ZXMgKHNwYWNlIHNlcGFyYXRlZCAKPiA+IGxpc3QsIG9yIGxlZ2FjeSBjb2xvbiBzZXBhcmF0ZWQp
IGFuZCBlbXB0eSBCUjJfRVhURVJOQUwgKHRvIGRpc2FibGUgYW55IAo+ID4gY29uZmlndXJlZCBl
eHRlcm5hbCB0cmVlcyk6Cj4gPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3Qv
YnVpbGRyb290L3BhdGNoLzIwMjYwNDA1MTg1NjA4LjEzNTc2MzMtMS1maW9uYS5rbHV0ZUBnbXgu
ZGUvCj4gPiAKPiA+IENvdWxkIHlvdSB0ZXN0IHRoYXQgb25lPyAgCj4gCj4gT2ggSSBoYXZlIG1p
c3NlZCB5b3VyIHBhdGNoLgo+IEl0IHdvcmtzIHdlbGwgb24gbXkgc2lkZS4KPiBZb3UgY2FuIGFk
ZCBteSBSZXZpZXdlZC1ieS4KCkkgbWVhbnQgVGVzdGVkLWJ5IHRhZy4KCj4gCj4gU21hbGwgcXVl
c3Rpb24sIHdoeSB3b3VsZCB5b3Ugd2FudCB0byBkaXNhYmxlIGNvbmZpZ3VyZWQgZXh0ZXJuYWwg
dHJlZXM/Cj4gCj4gUmVnYXJkcywKCgoKLS0gCkvDtnJ5IE1haW5jZW50LCBCb290bGluCkVtYmVk
ZGVkIExpbnV4IGFuZCBrZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
