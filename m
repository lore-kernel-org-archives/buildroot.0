Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB215C001CC
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 18:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92FBE606BB;
	Wed, 17 Apr 2024 18:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLcETFQ5cmhh; Wed, 17 Apr 2024 18:39:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88786606E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88786606E5;
	Wed, 17 Apr 2024 18:39:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 86BE01BF423
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 18:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72F134085B
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 18:39:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JHIiVspSK5cQ for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 18:39:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B352A40859
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B352A40859
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B352A40859
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 18:39:26 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a53f131d9deso446112966b.3
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 11:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713379164; x=1713983964;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AQh47UDbKzWHuH6eS7QWV9bwpHWDdbYvzfbdOLGXb5Q=;
 b=Mo8M8KLVOGB40y+ALhPPFyKQzAuoX3Z1NOSRqPGQWMOphMebPpJlRQ8K6N/h85TJ9f
 m+GbcykPb9MOWq1yUZ/mps8FLTRUYQHOLChWCLfKogymdwdLp9h475yq3hVkvRv++9to
 BH7zypeXg+C/H8zYq73XgaAB5LcYQB5c3UhwJbUsR/jnEFboBmD7vV7FoDA/LESveSP1
 QbMO4hRqHCtN9fXb+STKLmFNBPiw8lLxEqw8p2/VK9vUq6YVxW1t3+TSrEhsXXZZm7IO
 zJ9mKGcJJMNbZR4h0GKwfuz/HS4pcfCbBH4UlNfzNV43COAvkqY4t3WoRs/wEP7xyfog
 t5dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWoAOYfbQEishSVHcvZ8FAZCO3wCphWuxSEPcv4C1nXKEX5YFV41RBUkQsdkflZ0yvKV38h+oUbS++Tg67qVBuZCuZ+LKhMA==
X-Gm-Message-State: AOJu0YznV2m8eqnNuC9g/zO1NhSTk+ioatI6birQXGeZqOp4I4+rsFfN
 jjWLCbju497EnADUQ4+W5EeDd91DFJUgk/SwNKYrFN+8+jlBqYpitcQ3RiX3cVwqjNwGDb/pgxH
 WWR9nFVT2WO1beYkE5EjUqStLKLbhhJfLM3U8Qg==
X-Google-Smtp-Source: AGHT+IGMBYs935vxJogPysKpDXT1+T/FD3Lb+4iB4SYjDGbBxKUS/40WR/LQrLFH/9atVUzuGQXoTncgbYIrJPcRYGs=
X-Received: by 2002:a17:906:b786:b0:a52:4cd9:2dd6 with SMTP id
 dt6-20020a170906b78600b00a524cd92dd6mr202884ejb.66.1713379163768; Wed, 17 Apr
 2024 11:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <e2634bc6-2e68-4331-8354-49407b40f191.ref@yahoo.com>
 <e2634bc6-2e68-4331-8354-49407b40f191@yahoo.com>
 <6068206a-9a0c-4ef4-a5bb-9e6f35218297@benettiengineering.com>
 <d144cbba-9be6-477f-9a79-e72361487734@yahoo.com>
 <CAOf5uwmQBtHf9w7vjxyxDjFuaQj=uv4a0OpLHJ1MNg5V3PjNwQ@mail.gmail.com>
 <37ec60b9-d7db-440c-a8d4-2993ae9c6a16@yahoo.com>
In-Reply-To: <37ec60b9-d7db-440c-a8d4-2993ae9c6a16@yahoo.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 17 Apr 2024 20:39:12 +0200
Message-ID: <CAOf5uwmOi0V7t7GmwNvrwy8qoKyVnaGJziwZhqPd2jCAZMK5EQ@mail.gmail.com>
To: DTrustee <dterry_engineer@yahoo.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1713379164; x=1713983964;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AQh47UDbKzWHuH6eS7QWV9bwpHWDdbYvzfbdOLGXb5Q=;
 b=lJsESiyjj9SMljEEWX1psSf0MJCKBEvDe9BOzBcF4gIhcLuoDj11WzplK4a6nhXgZV
 wsX818q+NAWqhmdzWGQOR7QDtOsFfsJVsJwPVTVd5Edj+J7qxO/eBo4RFS7WVBkOl5We
 G3PLFIeD2xbg7OizmwaAd/Bm+UdOK+RPNU2ek=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=lJsESiyj
Subject: Re: [Buildroot] Problem with device tree
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
Cc: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkKCk9uIFdlZCwgQXByIDE3LCAyMDI0IGF0IDg6MjbigK9QTSBEVHJ1c3RlZSA8ZHRlcnJ5X2Vu
Z2luZWVyQHlhaG9vLmNvbT4gd3JvdGU6Cj4KPiBJIGFtIGJ1aWxkaW5nIGZvciB0aGUgQmVhZ2xl
Ym9uZSBCbGFjayB3aGljaCBpcyBjb252ZW5pZW50IGFzIHRoZQo+IEJvb3RsaW4gdHJhaW5pbmcg
dXNlcyB0aGUgd2lyZWxlc3MgdmVyc2lvbiBvZiB0aGF0IGJvYXJkLiBJIGhvcGUgSSBhbQo+IGRv
aW5nIHRoZSByaWdodCB0aGluZyBieSBpbmNsdWRpbmcgZXZlcnlvbmUgb24gdGhlIGFkZHJlc3Mg
bGlzdCBvZiB0aGlzCj4gdGhyZWFkLCBkb24ndCB3YW50IHRvIGZpbGwgdXAgcGVvcGxlJ3MgaW5i
b3ggbmVlZGxlc3NseS4KPgoKUGxlYXNlIHByb3ZpZGUgdGhlIHN0ZXBzIGhlcmUKCk1pY2hhZWwK
Cj4gSGF2ZSBhIEJsZXNzZWQgZGF5IQo+Cj4gRG9uCj4KPiBPbiA0LzE3LzI0IDExOjI5IEFNLCBN
aWNoYWVsIE5henphcmVubyBUcmltYXJjaGkgd3JvdGU6Cj4gPiBIaQo+ID4KPiA+IE9uIFdlZCwg
QXByIDE3LCAyMDI0IGF0IDY6MjXigK9QTSBEVHJ1c3RlZSB2aWEgYnVpbGRyb290Cj4gPiA8YnVp
bGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+ID4+IEkga25vdyB5b3UgYXJlIGFsbCBidXN5
LCBkb24ndCBtZWFuIHRvIGJ1ZyBhbnlvbmUgYnV0IEkgY2Fubm90IGdldAo+ID4+IGJ1aWxkcm9v
dCB0byBtYWtlIHdpdGhvdXQgZXJyb3JzLiBJIGhhdmUgbm8gaWRlYSB3aHkgIm9wZXJhdG9yICc8
JyBoYXMKPiA+PiBubyBsZWZ0IG9wZXJhbmQiIGlzIGdlbmVyYXRlZCBvciB3aGljaCBpbmNsdWRl
IGZpbGUgaXMgdGhlIGNhdXNlLiBJCj4gPj4gdHJ1bHkgYXBwcmVjaWF0ZSB5b3VyIGhlbHAuIElz
IHRoZXJlIGRvY3VtZW50YXRpb24gdGhhdCB3YWxrcyB0aHJvdWdoCj4gPj4gdGhlIGJ1aWxkIHBy
b2Nlc3M/IEkgaGF2ZSBsb29rZWQgYXQgdGhlIEJvb3RsaW4gdHJhaW5pbmcgYnV0IGl0IGlzCj4g
Pj4gc2V2ZXJhbCB5ZWFycyBvbGQgbm93IGFuZCBvdXQgb2YgZGF0ZS4KPiA+IFlvdSBhcmUgdHJ5
aW5nIHRvIGJ1aWxkIGEgdWJvb3QgYm9hcmQgdGhhdCBoYXMgbm90IGluY2x1ZGUgb2YgdGhlCj4g
PiBLY29uZmlnIG9mIGl0LiAgSSB0aGluayB0aGF0IHlvdQo+ID4gaGF2ZSBqdXN0IGEgYnJva2Vu
IHVib290LiBXaGF0IGNvbmZpZ3VyYXRpb24gb3IgYm9hcmQgYXJlIHlvdSBidWlsZGluZz8KPiA+
Cj4gPiBNaWNoYWVsCj4gPgo+ID4KPiA+PiBCdWlsZGxvZyBpcwo+ID4+Cj4gPj4gaHR0cHM6Ly9w
YXN0ZWJpbi5jb20vRXF0NnppOWEKPiA+Pgo+ID4+IGNvbmZpZyBpcwo+ID4+Cj4gPj4gaHR0cHM6
Ly9wYXN0ZWJpbi5jb20vOFAyaEI5dVkKPiA+Pgo+ID4+IGJ1aWxkcm9vdCAyMDI0LjAyLjEKPiA+
Pgo+ID4+IEhhdmUgYSBCbGVzc2VkIGRheSEKPiA+Pgo+ID4+IERvbgo+ID4+Cj4gPj4KPiA+Pgo+
ID4+IE9uIDQvOS8yNCA0OjU5IFBNLCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPiA+Pj4gSGkgRG9u
LAo+ID4+Pgo+ID4+PiBPbiAwOS8wNC8yNCAyMzoyMywgRG9uIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gPj4+PiBUaGlzIGlzIG15IGZpcnN0IHRpbWUgdXNpbmcgYnVpbGRyb290LiBGb2xsb3dpbmcg
dGhlIGluc3RydWN0aW9ucyBvZgo+ID4+Pj4gYm9vdGxpbi5jb20vZG9jL3RyYWluaW5nL2J1aWxk
cm9vdC9idWlsZHJvb3QtbGFicy5wZGYsIGJ1aWxkaW5nIGZvcgo+ID4+Pj4gQmVhZ2xlYm9uZSBC
bGFjayB0aG91Z2ggbm90IHRoZSB3aXJlbGVzcyBvZiB0aGUgdHJhaW5pbmcgcGRmLiBVbmRlcgo+
ID4+Pj4gS2VybmVsIC0gc2VsZWN0ZWQgZGV2aWNlIHRyZWUgYmxvYiBhbmQgaW4tdHJlZSBkZXZp
Y2UgdHJlZSBuYW1lIEkgcHV0Cj4gPj4+PiBhbTMzNXgtYm9uZWJsYWNrLiBIb3dldmVyIEkgZ2V0
Cj4gPj4+Pgo+ID4+Pj4gRGV2aWNlIFRyZWUgU291cmNlIChhcmNoL2FybS9kdHMvYW0zMzV4LS5k
dGIpIGlzIG5vdCBjb3JyZWN0bHkKPiA+Pj4+IHNwZWNpZmllZC4KPiA+Pj4+IFBsZWFzZSBkZWZp
bmUgJ0NPTkZJR19ERUZBVUxUX0RFVklDRV9UUkVFJwo+ID4+Pj4gb3IgYnVpbGQgd2l0aCAnREVW
SUNFX1RSRUU9PGRldmljZV90cmVlPicgYXJndW1lbnQKPiA+Pj4+Cj4gPj4+PiBXaGF0IGRvZXMg
aXQgd2FudD8gU29tZXRoaW5nIGlzIG1pc3NpbmcgYnV0IEkgZG9uJ3Qga25vdyB3aGF0Lgo+ID4+
PiBTdGFydGluZyBmcm9tICBMaW51eCB2ZXJzaW9uIDYuNVswXSB5b3UgaGF2ZSB0byBzcGVjaWZ5
IHRoZQo+ID4+PiBtYW51ZmFjdHVyZXIgZm9sZGVyIHRvbyBjb21wYXJlZCB0byBwcmV2aW91cyB2
ZXJzaW9ucyhpLmUuIDYuNFsxXSkuIFNvCj4gPj4+IGlmIHlvdSdyZSB1c2luZyBhIGtlcm5lbCBu
ZXdlciB0aGFuIDYuNSB5b3UgaGF2ZSB0byBzcGVjaWZ5IHNvbWV0aGluZwo+ID4+PiBsaWtlOgo+
ID4+PiBhcmNoL2FybS9kdHMvdGkvb21hcC9hbTMzNXgtLmR0Ygo+ID4+Pgo+ID4+PiBIb3BlIHRo
aXMgaGVscHMuCj4gPj4+Cj4gPj4+IFswXTogaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGlu
dXgvdjYuNS1yYzEvc291cmNlL2FyY2gvYXJtL2Jvb3QvZHRzCj4gPj4+IFsxXTogaHR0cHM6Ly9l
bGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuNC4xNi9zb3VyY2UvYXJjaC9hcm0vYm9vdC9kdHMK
PiA+Pj4KPiA+Pj4gQmVzdCByZWdhcmRzCj4gPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiA+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPj4gYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiA+Cj4gPgoKCgotLSAKTWljaGFlbCBOYXp6YXJlbm8g
VHJpbWFyY2hpCkNvLUZvdW5kZXIgJiBDaGllZiBFeGVjdXRpdmUgT2ZmaWNlcgpNLiArMzkgMzQ3
IDkxMyAyMTcwCm1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwoKQW1hcnVsYSBTb2x1dGlvbnMgQlYKSm9vcCBHZWVzaW5rd2VnIDEy
NSwgMTExNCBBQiwgQW1zdGVyZGFtLCBOTApULiArMzEgKDApODUgMTExIDkxNzIKaW5mb0BhbWFy
dWxhc29sdXRpb25zLmNvbQp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
