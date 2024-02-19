Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32DCC48BC3
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 10:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64EEA405F9;
	Mon, 19 Feb 2024 10:40:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0IFuuOln5qzI; Mon, 19 Feb 2024 10:40:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 084F040917
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 084F040917;
	Mon, 19 Feb 2024 10:40:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA1251BF3DB
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 10:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3E3B40917
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 10:40:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z7hbis5Jsroz for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 10:40:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2753F404C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2753F404C2
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2753F404C2
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 10:40:14 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33d2b354c72so1270262f8f.1
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 02:40:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708339213; x=1708944013;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/SAa1yWoWcPJHzDrgHkuo4qCHFp2srJOx+PFNe0wl54=;
 b=N0Xd0iKW2Jz3eOLcnkxGKmFqWNaCruCKX0Vmm/6pMr/JrCVJDNA093xqDVyVweEdHS
 9JDxJL6LFyZ8nH7tcmZ36cZEsefaOrtx0nbilRfSdC2PswbBFfQ1/r6wmZVW6ef20sL3
 HiLe5tQMMRZawBxNvTofV6aOLnOY3cOlSxMhBcG7FH78Aud7k59+PzpInlGK08oDBt6O
 jMTk2Sh+sHwkC9uTDsMO/S77ktvIS/7QdObSgaxLdGZ6depRP1Ylw/sZKbmp3jmCgUHj
 q4sPVj9EMHVo76YGLGwsdP/1/XZ/b1zecGAS0uHTPNQGtX1vkxw12v1Kj19zRlGFlBB3
 YdJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFUw/IGey/Whwsey2kgoqQogK4Sunb54Yc25AtXwHpmqhDmKlUXT0gnWa4/lAvH6kofl8sqJsiG+1RAGDMYOvJ9tlvsEY/Yg==
X-Gm-Message-State: AOJu0YyY42bsySyRgB43Kb/IDujY8igCD2YF7L2CMjKQ3GW0HhrYl2Ag
 rvPYCZU+n1XoqnaFccwMM4+P2oxBXtKNQ1Cx0ZiCiWXmgi/LCnnNcb+bkZgBDYQ=
X-Google-Smtp-Source: AGHT+IFCUIX27dtXvMKFm7ea/aub9cIqHT832lzFUCQcfAO2K0T3XzS/3gqgwY+B6R6/RKpdLkTWeg==
X-Received: by 2002:a05:6000:186f:b0:33d:1bd1:5a5d with SMTP id
 d15-20020a056000186f00b0033d1bd15a5dmr9696291wri.56.1708339213102; 
 Mon, 19 Feb 2024 02:40:13 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 bp1-20020a5d5a81000000b0033d38cbe385sm5827518wrb.6.2024.02.19.02.40.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 02:40:12 -0800 (PST)
Message-ID: <9f0b5e0e-b766-4995-a7de-32ea7d5a66bf@smile.fr>
Date: Mon, 19 Feb 2024 11:40:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr, en-US
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, buildroot@buildroot.org
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-14-dario.binacchi@amarulasolutions.com>
 <f64510a432556f497882e84791e4e64e01630ee3.camel@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <f64510a432556f497882e84791e4e64e01630ee3.camel@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708339213; x=1708944013;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/SAa1yWoWcPJHzDrgHkuo4qCHFp2srJOx+PFNe0wl54=;
 b=JSeV4oqkk+udkzN6NYQn9hbldkTZsnT12103fWj2Vqb279RpGh3tTORvtBJqaN3T6Y
 4BGfA1xujPhc/oaeteUEosG8q4RwZhfZi5gGBJRHfsv06by0XAuWi1khz8eMGmNvbs3q
 PmKsWk3Ptx4jv6QR9oO/JczUiL7OCrewb/RRjcj2YzHwqX1GiamWp2lGP4Yq6J11pBAs
 9q4/1fCoSqhNGuvGHqUZk2/nYL2z0hCGAfrRV4O/L9qkF+Itfd1LjNIhPNjukztsQcXe
 c+2sKeni2XNGjajXWlq2D3iuUXI2MTKfQyaAh+v59NOoFVQtITuT4WldKqtKWUXSTED2
 L4xw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=JSeV4oqk
Subject: Re: [Buildroot] [PATCH v4 13/20] boot/ti-k3-r5-loader: set binman
 environment
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Dannenberg <dannenberg@ti.com>, linux-amarula@amarulasolutions.com,
 bryce@redpinelabs.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWxleGFuZGVyLAoKTGUgMTcvMDIvMjAyNCDDoCAyMTozOCwgQWxleGFuZGVyIFN2ZXJk
bGluIGEgw6ljcml0wqA6Cj4gSGkgRGFyaW8sCj4gCj4gT24gU2F0LCAyMDI0LTAyLTE3IGF0IDE3
OjAyICswMTAwLCBEYXJpbyBCaW5hY2NoaSB3cm90ZToKPj4gUmVjZW50IHZlcnNpb24gb2YgVS1C
b290IHVzZSBiaW5tYW4gdG8gcHJvdmlkZSBhIG1lY2hhbmlzbSBmb3IgYnVpbGRpbmcKPj4gaW1h
Z2VzLCBmcm9tIHNpbXBsZSBTUEwgKyBVLUJvb3QgY29tYmluYXRpb25zLCB0byBtb3JlIGNvbXBs
ZXgKPj4gYXJyYW5nZW1lbnRzIHdpdGggbWFueSBwYXJ0cy4KPj4KPj4gVGhlIHBhdGNoIHNldCB0
aGUgQklOTUFOX0lORElSUyBlbnZpcm9ubWVudCB2YXJpYWJsZSB0byBwcm92aWRlIHRoZQo+PiBk
aXJlY3RvcnkgdG8gc2VhcmNoIGZvciBiaW5hcnkgYmxvYnMgYW5kIHNlbGVjdCB0aGUgcGFja2Fn
ZXMgcmVxdWlyZWQgYnkKPj4gYmlubWFuLgo+Pgo+PiBDby1kZXZlbG9wZWQtYnk6IE1pY2hhZWwg
VHJpbWFyY2hpIDxtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+PiBTaWduZWQtb2ZmLWJ5
OiBNaWNoYWVsIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbT4KPj4gU2ln
bmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlv
bnMuY29tPgo+IAo+IEkgcGVyc29uYWxseSBkbyBub3Qgc2VlIHdoeSBiaW5tYW4gdXNhZ2Ugc2hv
dWxkIGJlIGNvbmZpZ3VyYWJsZSBhcyBpbgo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNDAyMTMxNzI4MTcuMjg3Mjg0OS0xMS1yb21haW4u
bmFvdXJAc21pbGUuZnIvCj4geW91ciBwYXRjaCBsb29rcyBzaW1wbGVyLAoKQWdyZWUsIHRoZSBi
aW5tYW4gbXVzdCBiZSBtYW5kYXRvcnkgZm9yIHRpLWszLXI1LWxvYWRlciBwYWNrYWdlLgoKVGhl
IGludGVuZCB3YXMgdG8gdGFrZSBjYXJlIG9mIHRoZSBleGlzdGluZyBhbTY0eCBhbTYyeCBkZWZj
b25maWcgdGhhdCB3YXMKd29ya2luZyB3aXRob3V0IGJpbm1hbi4gQXMgc29vbiBhcyBhbGwgVEkg
SzMgZGVmY29uZmlnIHN3aXRjaGVkIHRvIGJpbm1hbiwgdGhpcwpvcHRpb24gY2FuIGJlIHJlbW92
ZWQuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gUmV2aWV3ZWQtYnk6IEFsZXhhbmRlciBT
dmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQGdtYWlsLmNvbT4KPiAKPj4gLS0tCj4+Cj4+IENo
YW5nZXMgaW4gdjQ6Cj4+IC0gRHJvcCB0aGUgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVVNF
X0JJTk1BTiBvcHRpb24KPj4KPj4gQ2hhbmdlcyBpbiB2MjoKPj4gLSBDaGFuZ2UgY29tbWl0IG1l
c3NhZ2UKPj4gLSBBZGQgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVVNFX0JJTk1BTiBvcHRp
b24KPj4gLSBTZWxlY3QgcGFja2FnZXMgcmVxdWlyZWQgYnkgYmlubWFuIGlmCj4+IMKgIEJSMl9U
QVJHRVRfVElfSzNfUjVfTE9BREVSX1VTRV9CSU5NQU4gaXMgZW5hYmxlZAo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5j
b20+Cj4+IC0tLQo+PiDCoGJvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tayB8
IDEzICsrKysrKysrKysrKy0KPj4gwqAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGkt
azMtcjUtbG9hZGVyLm1rIGIvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1r
Cj4+IGluZGV4IDBmZmNiODIzNWYyZS4uMmExMDAyNGFlZGFhIDEwMDY0NAo+PiAtLS0gYS9ib290
L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKPj4gKysrIGIvYm9vdC90aS1rMy1y
NS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rCj4+IEBAIC0zOSw3ICszOSwxMyBAQCBUSV9LM19S
NV9MT0FERVJfREVQRU5ERU5DSUVTID0gXAo+PiDCoAlob3N0LXBrZ2NvbmYgXAo+PiDCoAkkKEJS
Ml9NQUtFX0hPU1RfREVQRU5ERU5DWSkgXAo+PiDCoAlob3N0LWFybS1nbnUtdG9vbGNoYWluIFwK
Pj4gLQlob3N0LW9wZW5zc2wKPj4gKwlob3N0LW9wZW5zc2wgXAo+PiArCWhvc3QtcHl0aG9uLWF0
dHJzIFwKPj4gKwlob3N0LXB5dGhvbi1qc29uc2NoZW1hIFwKPj4gKwlob3N0LXB5dGhvbi1qc29u
c2NoZW1hLXNwZWNpZmljYXRpb25zIFwKPj4gKwlob3N0LXB5dGhvbi1weXlhbWwgXAo+PiArCWhv
c3QtcHl0aG9uLXJlZmVyZW5jaW5nIFwKPj4gKwlob3N0LXB5dGhvbi1ycGRzLXB5Cj4+IMKgCj4+
IMKgVElfSzNfUjVfTE9BREVSX01BS0UgPSAkKEJSMl9NQUtFKQo+PiDCoFRJX0szX1I1X0xPQURF
Ul9NQUtFX0VOViA9ICQoVEFSR0VUX01BS0VfRU5WKQo+PiBAQCAtNDksNiArNTUsMTAgQEAgVElf
SzNfUjVfTE9BREVSX0tDT05GSUdfREVQRU5ERU5DSUVTID0gXAo+PiDCoAkkKEJSMl9CSVNPTl9I
T1NUX0RFUEVOREVOQ1kpIFwKPj4gwqAJJChCUjJfRkxFWF9IT1NUX0RFUEVOREVOQ1kpCj4+IMKg
Cj4+ICtpZmVxICgkKEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfUFlMSUJGRFQpLHkpCj4+ICtUSV9L
M19SNV9MT0FERVJfREVQRU5ERU5DSUVTICs9IGhvc3QtcHl0aG9uLXB5bGliZmR0Cj4+ICtlbmRp
Zgo+PiArCj4+IMKgaWZlcSAoJChCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9VU0VfREVGQ09O
RklHKSx5KQo+PiDCoFRJX0szX1I1X0xPQURFUl9LQ09ORklHX0RFRkNPTkZJRyA9ICQoY2FsbCBx
c3RyaXAsJChCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9CT0FSRF9ERUZDT05GSUcpKV9kZWZj
b25maWcKPj4gwqBlbHNlIGlmZXEgKCQoQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVVNFX0NV
U1RPTV9DT05GSUcpLHkpCj4+IEBAIC01OCw2ICs2OCw3IEBAIFRJX0szX1I1X0xPQURFUl9NQUtF
X09QVFMgPSBcCj4+IMKgCUNST1NTX0NPTVBJTEU9JChIT1NUX0RJUikvYmluL2FybS1ub25lLWVh
YmktIFwKPj4gwqAJQVJDSD1hcm0gXAo+PiDCoAlIT1NUQ0M9IiQoSE9TVENDKSAkKHN1YnN0IC1J
LywtaXN5c3RlbSAvLCQoc3Vic3QgLUkgLywtaXN5c3RlbSAvLCQoSE9TVF9DRkxBR1MpKSkiIFwK
Pj4gKwlCSU5NQU5fSU5ESVJTPSQoQklOQVJJRVNfRElSKSBcCj4+IMKgCUhPU1RMREZMQUdTPSIk
KEhPU1RfTERGTEFHUykiCj4+IMKgCj4+IMKgZGVmaW5lIFRJX0szX1I1X0xPQURFUl9CVUlMRF9D
TURTCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
