Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7A8C48BC3
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 10:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F52A408F0;
	Mon, 19 Feb 2024 10:19:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tCF3B_9qiDgF; Mon, 19 Feb 2024 10:19:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E464840904
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E464840904;
	Mon, 19 Feb 2024 10:19:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 506451BF3DB
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 10:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B24581453
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 10:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NCvuPdd7GOev for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 10:19:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3F9668143E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F9668143E
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F9668143E
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 10:19:54 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d1094b5568so54863041fa.1
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 02:19:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708337992; x=1708942792;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QbpWuk90ofsIx3eS1tWR+r/ZxmSe07olG26CEmsLNSI=;
 b=jiAlXZcWeE4T8rckD8HDud90jKay7/of2uYSPNNm1lQoNkYWOrTEjKs8vR1lxOb2oc
 LUHc7YWsLyjuBbZAKoQcClKkhTVN59QgPW0TwAkbtpPk9s2yDtgFMoo3MSb19sN51ONE
 8ExLbMObvTtckaeYDO3WlIG2vyf0xNZEuST4Aa3DBUU/vKK61KQmAF1TWeJlRfYViK9k
 4sVSHog4iVCyNoAFkt4fnzQcYUqMCxdRwQqee+hjaH/OoyprF0ZaXsyWC6V7Z2BzVSu1
 nmFDwFWkskBtMrpNpzyGST7ZJ5qrCiCovKuWPtHaUHafobM5XOWGTMrj3IK2LzZGd9Fl
 6G9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQo93Ku1fzMzjTNTFgMlTDGhaknaM+IPxYsCCFO5QbKRzf+ahCqxFPgIzL2obukPj4xyjdylp6mhGBOL0Wv6QsRA3yBXp3Gw==
X-Gm-Message-State: AOJu0YznZCat7bK0mOYW9xIkQ5/KbjYuSYiTqX6kaV5TAH7Tq8Ow//Hz
 IBYf8SBvTJdI8Mo4tMLAODV3rXcF3jNEyKjqHtDwt2i8rmZYtgjLj3dtBaFY4VE=
X-Google-Smtp-Source: AGHT+IEKknYvtLnMnRlLXwp65qjRrdQ2ufk35XeUkvgCd+PW+NMF8i7W0v8Hhy+YJ2pN1u05vjtUTQ==
X-Received: by 2002:a2e:2243:0:b0:2d2:298a:dfc8 with SMTP id
 i64-20020a2e2243000000b002d2298adfc8mr3000951lji.47.1708337991883; 
 Mon, 19 Feb 2024 02:19:51 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a05600c350500b004124219a8c9sm10627767wmq.32.2024.02.19.02.19.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 02:19:51 -0800 (PST)
Message-ID: <345794c9-c917-4157-b614-67501e9597ab@smile.fr>
Date: Mon, 19 Feb 2024 11:19:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-15-dario.binacchi@amarulasolutions.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240217160244.1320482-15-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708337992; x=1708942792;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QbpWuk90ofsIx3eS1tWR+r/ZxmSe07olG26CEmsLNSI=;
 b=klbWBlvp0Q3btIEIlLjYceM5jrgsperfLx7EoDvjcBl0OPkuqqQy31d3/Ptefk+jhq
 bwNzRPMsX26lD/WkX1ovw4qr8Vf+yuiFa+uVfnK+YJ84NrCTl+8rTCP/0HsMlAUnBSKq
 NMeOMyczojeOEvNsIR59X+qbRgu5fz6tVWsrgCht6b6GWg/9Twz2WoxIGag6fzspL6Rd
 kY5Nz8uZ+DgxuApL/UQDtJkpup9fXH1DVw77NMIZTwKThM+njUDI7tGuR/rBcVYuZYF8
 Lgl3lFpVb04RpnH4oPbbIat4iL+aJ2Ox4FIo6ntlIqvWXcNtz1RnZ59qQFYRbTWBsDl+
 HqBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=klbWBlvp
Subject: Re: [Buildroot] [PATCH v4 14/20] boot/uboot: set BINMAN_INDIRS for
 TI K3 DM
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAxNy8wMi8yMDI0IMOgIDE3OjAyLCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IEFzIGV4cGxhaW5lZCBpbiBbMV0sIGFkZGluZyBzdXBwb3J0IGZvciBBTTYyeCBM
UCBTSyBpbiBVLUJvb3QsIHJlcXVpcmVzCj4gYmlubWFuIGZvciBidWlsZGluZyBib290bG9hZGVy
IGltYWdlcy4gVGhlIEJJTk1BTl9JTkRJUlMgZW52aXJvbm1lbnQKPiB2YXJpYWJsZSBpcyB1c2Vk
IHRvIHByb3ZpZGUgYSBzcGFjZS1zZXBhcmF0ZWQgbGlzdCBvZiBkaXJlY3RvcmllcyB0bwo+IHNl
YXJjaCBmb3IgYmluYXJ5IGJsb2JzLgoKQmlubWFuIGlzIG5vdCBhIHRvb2wgc3BlY2lmaWMgdG8g
VEkgSzMgU29DIGFuZCBtYXkgYmUgdXNlZCBieSBhbnkgb3RoZXIgU29DCnZlbmRvci4gSSBiZWxp
ZXZlIHdlIHNob3VsZCBhZGQgYSBuZXcgdS1ib290IG9wdGlvbiBmb3IgaXQKKEJSMl9UQVJHRVRf
VUJPT1RfVVNFX0JJTk1BTikgYW5kIG5vdCBkZXBlbmQgb24gQlIyX1RBUkdFVF9VQk9PVF9ORUVE
U19USV9LM19ETQpiZWluZyBlbmFibGVkLgoKaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjQwMjEzMTcyODE3LjI4NzI4NDktMTAtcm9tYWluLm5h
b3VyQHNtaWxlLmZyLwoKPiAKPiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9q
ZWN0L3Vib290L3BhdGNoLzIwMjMxMDMwMTEwMTM4LjEzNDc2MDMtMy1uLXlhZGF2QHRpLmNvbS8K
PiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNv
bHV0aW9ucy5jb20+Cj4gCj4gLS0tCj4gCj4gbm8gY2hhbmdlcyBzaW5jZSB2MToKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9u
cy5jb20+Cj4gLS0tCj4gIGJvb3QvdWJvb3QvdWJvb3QubWsgfCAzICsrLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Jv
b3QvdWJvb3QvdWJvb3QubWsgYi9ib290L3Vib290L3Vib290Lm1rCj4gaW5kZXggZGRhNjA2YTg4
MDU5Li5jZjcwZjg2YTQxMzIgMTAwNjQ0Cj4gLS0tIGEvYm9vdC91Ym9vdC91Ym9vdC5tawo+ICsr
KyBiL2Jvb3QvdWJvb3QvdWJvb3QubWsKPiBAQCAtMTg5LDcgKzE4OSw4IEBAIGVuZGlmCj4gIGlm
ZXEgKCQoQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19USV9LM19ETSkseSkKPiAgVUJPT1RfVElfSzNf
RE1fU09DTkFNRSA9ICQoY2FsbCBxc3RyaXAsJChCUjJfVEFSR0VUX1VCT09UX1RJX0szX0RNX1NP
Q05BTUUpKQo+ICBVQk9PVF9ERVBFTkRFTkNJRVMgKz0gdGktazMtYm9vdC1maXJtd2FyZQo+IC1V
Qk9PVF9NQUtFX09QVFMgKz0gRE09JChCSU5BUklFU19ESVIpL3RpLWRtLyQoVUJPT1RfVElfSzNf
RE1fU09DTkFNRSkvaXBjX2VjaG9fdGVzdGJfbWN1MV8wX3JlbGVhc2Vfc3RyaXAueGVyNWYKPiAr
VUJPT1RfTUFLRV9PUFRTICs9IERNPSQoQklOQVJJRVNfRElSKS90aS1kbS8kKFVCT09UX1RJX0sz
X0RNX1NPQ05BTUUpL2lwY19lY2hvX3Rlc3RiX21jdTFfMF9yZWxlYXNlX3N0cmlwLnhlcjVmIFwK
PiArCUJJTk1BTl9JTkRJUlM9JChCSU5BUklFU19ESVIpCj4gIGVuZGlmCgpCaW5tYW4gZGVwZW5k
ZW5jaWVzIGFyZSBtaXNzaW5nLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+ICAKPiAgaWZlcSAo
JChCUjJfVEFSR0VUX1VCT09UX05FRURTX09QRU5TQkkpLHkpCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
