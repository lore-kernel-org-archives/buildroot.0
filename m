Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C16CFD355
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 21:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D13B383CD8;
	Mon, 24 Nov 2025 21:09:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9EZmFWUrriJP; Mon, 24 Nov 2025 21:09:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 216E982416
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 216E982416;
	Mon, 24 Nov 2025 21:09:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B1A1E35C
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 21:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 993F682416
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 21:09:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2lKLQ20OqhrP for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 21:09:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DF1A982391
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF1A982391
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF1A982391
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 21:09:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 28DC7B979AE6; Mon, 24 Nov 2025 22:09:15 +0100 (CET)
Message-ID: <47cd1e1f-98da-4758-ab64-1223642582a2@rnout.be>
Date: Mon, 24 Nov 2025 22:09:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, Ayoub Zaki <ayoub.zaki@embetrix.com>
Cc: Lance Fredrickson <lancethepants@gmail.com>, buildroot@buildroot.org
References: <1c677011-9c6e-483c-ab4f-93480d7fdd69@embetrix.com>
 <CABwKrPDNVLCLJHg7Nvxne+03RtZXXpO_H-iKquAe7hchiMf3pg@mail.gmail.com>
 <076df85a-3775-4854-875a-f76662318e35@embetrix.com>
 <87bjl7rpct.fsf@dell.be.48ers.dk>
Content-Language: en-GB, fr-BE
In-Reply-To: <87bjl7rpct.fsf@dell.be.48ers.dk>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764018555; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=2A00gPhs/Kp4L9bsSrwWBjCXamb+wKn7d04HZH8F5MM=;
 b=Ge3chgtVAT3JMoiYpjeZmbtW4KjVYVSubrZCs4J3eFYjtB3Yyb1VjyK4CgPg6qMEGMWzUv
 zxyEZuOhiE06nFng49FexA53OUhfMJ7H2bN/bYDniiqg3n+pKZEjmCoRxSi9Cyrg8jlJY0
 X0MuVz0E8yWXBJkwmjfGLd7/1NZpnFSCgvZfDVzDtUmQt2hRwpZPdxgBJ8HZgYXy0L+IOr
 BroAUy170tVaug84zv9dL6soGEYhv61RjputBOeXY0EtnEo2nsFQyy2ANyAz9MfUUUgX6p
 64HiEhiMQF/vIS3X06NS+DgViFoVTGioQiECC6HAtpyHU6W30ij5YGOi4Fc5IA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Ge3chgtV
Subject: Re: [Buildroot] override a core package from BR2_EXTERNAL
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMi8xMS8yMDI1IDIxOjAyLCBQZXRlciBLb3JzZ2FhcmQgd3JvdGU6Cj4+Pj4+PiAiQXlv
dWIiID09IEF5b3ViIFpha2kgPGF5b3ViLnpha2lAZW1iZXRyaXguY29tPiB3cml0ZXM6Cj4gCj4g
ICA+IHRoYW5rcywgYnV0IHRoaXMgaXMgTk9UIHdoYXQgSSdtIGxvb2tpbmcgZm9yLCBJIGhhdmUg
cmVxdWlyZW1lbnQgdG8KPiAgID4gaGF2ZSBhIGNvbXBsZXRlIG9sZGVyIHZlcnNpb24gb2YgYSBj
b3JlIHBhY2thZ2UuCj4gCj4gICA+IEkgZGlkIGHCoCByZXZlcnNlIHBhdGNoIGZvciB0aGUgcGFj
a2FnZSBidXQgdGhpcyBpcyB1Z2x5IGFuZCBsb29rIGZvciBhCj4gICA+IGNsZWFuZXIgd2F5IHRv
IGRvIGl0Lgo+IAo+IFRoZXJlIGlzbid0IHJlYWxseSBhbnkgc3VwcG9ydGVkIHdheSB0byBkbyBz
by4gKFNpZ25pZmljYW50bHkpIGNoYW5naW5nCj4gdGhlIHZlcnNpb24gb2YgYSBwYWNrYWdlIGNv
dWxkIGFsc28gbWVhbiBhIGNoYW5nZSBpbiAodG9vbGNoYWluKQo+IGRlcGVuZGVuY2llcywgc28g
dGhlIGVhc2llc3QgaXMgcHJvYmFibHkgdG8gZm9yayBidWlsZHJvb3QgYW5kIGRvIHlvdXIKPiB0
d2Vha3MgaW4gYSBjdXN0b20gdHJlZS4KCiAgSWYgaXQncyAoYWxtb3N0KSBhIGxlYWYgcGFja2Fn
ZSwgeW91IGNhbiBhbHNvIGNyZWF0ZSBhIG5ldyBwYWNrYWdlIHdpdGggYSAKZGlmZmVyZW50IG5h
bWUsIGUuZy4gdmxjMjI0IGlmIHlvdSBuZWVkIGFuIG9sZGVyIHZlcnNpb24gb2YgdmxjLCBvciBs
aWJvcGVuc3NsMSAKaWYgeW91IG5lZWQgYW4gb2xkZXIgdmVyc2lvbiBvZiBsaWJvcGVuc3NsLiBC
dXQgZm9yIG9wZW5zc2wgdGhpcyBpcyBnb2luZyB0byBiZSAKYSBwcm9ibGVtLCBzaW5jZSB5b3Ug
Y2FuJ3QgaW5zdGFsbCBsaWJvcGVuc3NsMSBhbmQgbGlib3BlbnNzbDMgc2lkZS1ieS1zaWRlLCBz
byAKeW91J3JlIGFsc28gZ29pbmcgdG8gaGF2ZSB0byBtYWtlIGNvcGllcyBvZiBhbGwgcGFja2Fn
ZXMgdGhhdCBkZXBlbmQgb24gCmxpYm9wZW5zc2wuLi4gQnV0IG9mIGNvdXJzZSwgc29tZSBvZiB0
aG9zZSBwYWNrYWdlcyBwcm9iYWJseSBkb24ndCBidWlsZCB3aXRoIApvcGVuc3NsMSBhbnkgbW9y
ZS4uLgoKICBUaGVyZSdzIGEgcmVhc29uIHdlIGRvbid0IHN1cHBvcnQgdGhpcy4gSXQncyBhIGhh
cmQgcHJvYmxlbS4gVG8gc29sdmUgdGhpcyAKd2VsbCB5b3UgbmVlZCBzb21ldGhpbmcgbGlrZSBO
aXggb3IgR3VpeC4KCgogIFJlZ2FyZHMsCiAgQXJub3V0CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
