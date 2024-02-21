Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F4EC5478A
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 20:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A52781D70;
	Wed, 21 Feb 2024 20:11:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fPuohznb2h65; Wed, 21 Feb 2024 20:11:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08EA281F01
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08EA281F01;
	Wed, 21 Feb 2024 20:11:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C275B1BF41B
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 20:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF84B81F01
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 20:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xSsCFk4oArU3 for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 20:11:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D0CB781D70
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0CB781D70
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0CB781D70
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 20:11:16 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-dcbef31a9dbso4751299276.1
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 12:11:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708546275; x=1709151075;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DOrsnU26v97r9VIs0xFDPqOz8zsiuF069Fm3jLLWvj4=;
 b=NaSY8HsPW5kP1KVXNnCoJkNOZZIc00m4FLiXV2LPovtD3lVjjSzkDB71KCHQib9No0
 msvGwxPFrCUhJhc4ZGOEoYIAnqmCkwNA/aqpL8wxYpwmXQojnER6qZ0sbzTAJiUN2du8
 e3eT+rpDB4qKmC6z5fX3kd8d3ukfLYyumXveCyz+NP/QYGDAdXE+6TAqYiBLnnXbhHng
 mPxc5qV58gBYVqMN/i47iya4dNl5DyFo17RpGYmnPCyFg26JJtdhtprcFodx8YcplwEv
 orCfgh8ENQWeF4JibCxYDBFwzO9YGq7SwBha8b8O1uDohyTh+Jb0+11npAXemL5XsheQ
 pazQ==
X-Gm-Message-State: AOJu0YwDFtXXzZGhToeOf/22hd3HybCfCfxgGPJvX8zot/7/99TTE+/Q
 y8XMY/G4wcpge/hPv/iN70LVR5P1gonpQAxlAsfMnRY8Vyst0XI5TYR/aIfmdQ6zLUXLnjVc/2I
 vPzmBFdNtSatGTFqEr30e3QInCCthOBWB8+xsZQ==
X-Google-Smtp-Source: AGHT+IHRVaKn+ouD4ZSOc2ue5XxO/g6m6PKNjlcJfnIeNTofU1dwdxLs6izkwsOZvXuoXyAQQ4NcAnfN3GJnNxu8JV8=
X-Received: by 2002:a25:ae68:0:b0:dcc:e187:6ceb with SMTP id
 g40-20020a25ae68000000b00dcce1876cebmr428568ybe.17.1708546275624; Wed, 21 Feb
 2024 12:11:15 -0800 (PST)
MIME-Version: 1.0
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-20-dario.binacchi@amarulasolutions.com>
 <20240220223423.bnrqouwcuuxhw43f@dasso>
In-Reply-To: <20240220223423.bnrqouwcuuxhw43f@dasso>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 21 Feb 2024 21:11:04 +0100
Message-ID: <CABGWkvrx2ALSV=33iW5pT8adzo=9Ds2LMXuAoWC+-VMBx40_ng@mail.gmail.com>
To: Andreas Dannenberg <dannenberg@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708546275; x=1709151075;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DOrsnU26v97r9VIs0xFDPqOz8zsiuF069Fm3jLLWvj4=;
 b=mI7SZ2HgGRHdqq6vP6ZSSeRtwEuwK3DpMhJg7HxemGP1ZK5DeA8jToNOFOVh+uRuYu
 ldQvylH3tn8w9jdgij6WOWcEOa5FHgTtgc7Z3OVSsAQL/KKRfIcnPmhzy50cmPpP8AM4
 m8PLddNgXffo3TX+OQwTQEjTavfppWcj/AXV0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=mI7SZ2Hg
Subject: Re: [Buildroot] [PATCH v4 19/20] boot/ti-k3/ti-k3-r5-loader:
 install tiboot3.bin
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
Cc: linux-amarula@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, michael@amarulasolutions.com,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQW5kcmVhcywKCk9uIFR1ZSwgRmViIDIwLCAyMDI0IGF0IDExOjM04oCvUE0gQW5kcmVhcyBE
YW5uZW5iZXJnIDxkYW5uZW5iZXJnQHRpLmNvbT4gd3JvdGU6Cj4KPiBIaSBEYXJpbywKPgo+IE9u
IFNhdCwgRmViIDE3LCAyMDI0IGF0IDA1OjAyOjQzUE0gKzAxMDAsIERhcmlvIEJpbmFjY2hpIHdy
b3RlOgo+ID4gUmVjZW50IHZlcnNpb25zIG9mIFUtQm9vdCBhcmUgY2FwYWJsZSBvZiBidWlsZGlu
ZyB0aWJvb3QzLmJpbiB1c2luZwo+ID4gQmlubWFuLiBJbiB0aGlzIGNhc2UsIGxldCdzIGNvcHkg
aXQgdG8gdGhlIGJpbmFyaWVzIGRpcmVjdG9yeS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYXJp
byBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPgo+ID4g
LS0tCj4gPgo+ID4gQWRkZWQgaW4gdjQKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5h
Y2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPiAtLS0KPiA+ICBi
b290L3RpLWszL3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsgfCAzICsrKwo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYm9v
dC90aS1rMy90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rIGIvYm9vdC90aS1rMy90
aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rCj4gPiBpbmRleCAyYTEwMDI0YWVkYWEu
LjY0MzI5OGExZTcwYSAxMDA2NDQKPiA+IC0tLSBhL2Jvb3QvdGktazMvdGktazMtcjUtbG9hZGVy
L3RpLWszLXI1LWxvYWRlci5tawo+ID4gKysrIGIvYm9vdC90aS1rMy90aS1rMy1yNS1sb2FkZXIv
dGktazMtcjUtbG9hZGVyLm1rCj4gPiBAQCAtNzUsOCArNzUsMTEgQEAgZGVmaW5lIFRJX0szX1I1
X0xPQURFUl9CVUlMRF9DTURTCj4gPiAgICAgICAkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykgJChU
SV9LM19SNV9MT0FERVJfTUFLRSkgLUMgJChARCkgJChUSV9LM19SNV9MT0FERVJfTUFLRV9PUFRT
KQo+ID4gIGVuZGVmCj4gPgo+ID4gK1RJX0szX1I1X0xPQURFUl9TRUNUWVBFID0gJChjYWxsIHFz
dHJpcCwkKEJSMl9UQVJHRVRfVElfSzNfU0VDVFlQRSkpCj4gPiArCj4gPiAgZGVmaW5lIFRJX0sz
X1I1X0xPQURFUl9JTlNUQUxMX0lNQUdFU19DTURTCj4gPiAgICAgICBjcCAkKEBEKS9zcGwvdS1i
b290LXNwbC5iaW4gJChCSU5BUklFU19ESVIpL3I1LXUtYm9vdC1zcGwuYmluCj4gPiArICAgICBm
aW5kICQoQEQpIC1uYW1lICJ0aWJvb3QzLSotJChUSV9LM19SNV9MT0FERVJfU0VDVFlQRSktKi5i
aW4iIC10eXBlIGYgLWV4ZWMgY3Age30gJChCSU5BUklFU19ESVIpL3RpYm9vdDMuYmluIFw7Cj4g
PiAgZW5kZWYKPgo+IEkgbGlrZSBob3cgdGhpcyBwaWNrcy9yZW5hbWVzIHRoZSB0aWJvb3QzLmJp
biBjb3JyZXNwb25kaW5nIHRvIHRoZQo+IGRldmljZSBzZWN1cml0eSB0eXBlLCB0aGlzIHdheSBh
bGxvd2luZyB0byBnZW5lcmF0ZSBhIHRhaWxvcmVkIGFuZAo+IHJlYWRpbHkgYm9vdGFibGUgaW1h
Z2UgZGVwZW5kaW5nIG9uIEdQLCBIUy1GUywgSFMgZGV2aWNlIHR5cGUuCj4KPiBIb3dldmVyIHRo
ZSBmaW5kL2NvcHkgYXBwcm9hY2ggbWF5IG5vdCBhbHdheXMgd29yayBhcyBpbnRlbmRlZC4gQ29u
c2lkZXIKPiB0aGUgYnVpbGQgb3V0cHV0IG9mIFI1IFUtQm9vdCBTUEwgZm9yIEFNNjR4IGZvciBl
eGFtcGxlOgo+Cj4gJCBsbCB0aWJvb3QzLSouYmluCj4gLXJ3LXJ3LXItLSAxIGEwNzk3MDU5IGEw
Nzk3MDU5IDMwNDQzMSBGZWIgMjAgMTU6MzQgdGlib290My1hbTY0eC1ncC1ldm0uYmluCj4gLXJ3
LXJ3LXItLSAxIGEwNzk3MDU5IGEwNzk3MDU5IDUzMjI3MCBGZWIgMjAgMTU6MzQgdGlib290My1h
bTY0eF9zcjItaHMtZXZtLmJpbgo+IC1ydy1ydy1yLS0gMSBhMDc5NzA1OSBhMDc5NzA1OSA1MzIy
NzAgRmViIDIwIDE1OjM0IHRpYm9vdDMtYW02NHhfc3IyLWhzLWZzLWV2bS5iaW4KPgo+IE5vdGUg
aG93IHRoZXJlJ3MgYSAnX3NyMicgKFNpbGljb24gUmV2aXNpb24gMi4wKSBpbiB0aGUgZmlsZW5h
bWUgb2Ygc29tZQo+IG9mIHRoZSBib290IGJpbmFyaWVzLiBJIGRpZCBsb29rIGF0IHRoZSBkaWZm
ZXJlbnQgSzMgZGV2aWNlcyBzdXBwb3J0ZWQKPiBpbiBVLUJvb3QgYXQgdGhlIG1vbWVudCwgYW5k
IGl0IGxvb2tzIGxpa2UgY3VycmVudGx5IHRoaXMgd2lsbCBub3QgYmUgYW4KPiBpc3N1ZSB0aGF0
IHdpbGwgbWFuaWZlc3QgaXRzZWxmIGFzIHRoZSBkZXZpY2Ugc2VjdXJpdHkgdHlwZSBoYXBwZW5z
IHRvCj4gYmUgdW5pcXVlIGVub3VnaCB0byBhbHNvIHBpY2sgdGhlIHJpZ2h0IHNpbGljb24gcmV2
aXNpb24uIEJ1dCBvZiBjb3Vyc2UKPiB0aGlzIGRvZXNuJ3QgbWVhbiBpdCdsbCBhbHdheXMgc3Rh
eSBsaWtlIHRoaXMuLi4uCj4KPiBTbyBpdCBtaWdodCBiZSBiZXR0ZXIgdG8gbGV2ZXJhZ2UgQlIy
X1RBUkdFVF9USV9LM19TT0MgdG8gYmUgbW9yZQo+IHNwZWNpZmljIGluIHRoYXQgZmluZC9jb3B5
IG9wZXJhdGlvbiBhbmQgdXNlIHRoaXMgdG8gcmVwbGFjZSB0aGUKPiBhc3RlcmlzayBpbiAidGli
b290My0qIi4gU28gdGhlbiBzb21lYm9keSBjYW4gdXNlICJhbTY0eCIgb3IgImFtNjR4X3NyMiIK
PiBmb3IgZXhhbXBsZSBhcyBCUjJfVEFSR0VUX1RJX0szX1NPQywgYW5kIHlvdSB3b3VsZCBndWFy
YW50ZWUgdGhlIHJpZ2h0Cj4gZmlsZSBnZXRzIHVzZWQgdG8gcG9wdWxhdGUgdGhlIGZpbmFsIHRp
Ym9vdDMuYmluLgoKVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbiEKSSB3aWxsIGFkZCBpdCB0byB2
NS4KClRoYW5rcyBhbmQgcmVnYXJkcywKRGFyaW8KCj4KPgo+IC0tCj4gQW5kcmVhcyBEYW5uZW5i
ZXJnCj4gVGV4YXMgSW5zdHJ1bWVudHMgSW5jCj4KPgo+Cj4KPgo+Cj4gPgo+ID4gICQoZXZhbCAk
KGtjb25maWctcGFja2FnZSkpCj4gPiAtLQo+ID4gMi40My4wCj4gPgoKCgotLSAKCkRhcmlvIEJp
bmFjY2hpCgpTZW5pb3IgRW1iZWRkZWQgTGludXggRGV2ZWxvcGVyCgpkYXJpby5iaW5hY2NoaUBh
bWFydWxhc29sdXRpb25zLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoK
CkFtYXJ1bGEgU29sdXRpb25zIFNSTAoKVmlhIExlIENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2aXNv
LCBWZW5ldG8sIElUCgpULiArMzkgMDQyIDI0MyA1MzEwCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5j
b20KCnd3dy5hbWFydWxhc29sdXRpb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
