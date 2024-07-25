Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E00BC3DA49
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 14:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AC2A81DE7;
	Thu, 25 Jul 2024 14:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ij6p5Ejs0sfb; Thu, 25 Jul 2024 14:59:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F18081CC3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F18081CC3;
	Thu, 25 Jul 2024 14:59:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5B1F1BF20D
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 14:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FD3840175
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 14:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EbAw1SYQQqkm for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 14:59:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 99D5A40025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99D5A40025
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99D5A40025
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 14:59:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 693771C0002;
 Thu, 25 Jul 2024 14:59:34 +0000 (UTC)
Date: Thu, 25 Jul 2024 16:59:33 +0200
To: =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay@gmail.com>
Message-ID: <20240725165933.3c22cb67@windsurf>
In-Reply-To: <D2YKKETZ0VW0.3G5BB391498UM@gmail.com>
References: <20240723212011.23048-1-gael.portay@rtone.fr>
 <20240723212011.23048-3-gael.portay@rtone.fr>
 <20240724182158.07c7436b@windsurf>
 <D2YJ1IQ4XJ62.17GIHGKSB1ZYE@gmail.com>
 <20240725121537.7f987369@windsurf>
 <D2YKKETZ0VW0.3G5BB391498UM@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721919574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sBSCznfTe+nJHIJxhN5KxAM8k7ZGMROTUzK3v9gKTJk=;
 b=prkh4TKr+pTU20nRbBsMogvN6mghkHYGLNxGFW/T5n9H7QtNkZGK4Nb1XFYSGV6VnDdjR5
 4DPRb8zZfYZy44zJIj3sW9g0b1vCh0/HkaHPIZmFJKoKx+CFXziaBbwCYJkfo8Sjv9+rQe
 owcgm5eHQW7PXFtehZEjPbNr+Z2r/a5iDZ5TWxdvW/RSGPreC07n32Rb+M34YqFRwPgtfw
 cHzokCHsdPUijct7IEQIa9I0rKIrBfUREsogxb+UdvItwFLTyWFlrAwgxhxIDbt/PRJtFp
 cOGy8b4hBxqWBaSVNKtA+/j8mc1rr0hzIYitA911+g+oaF7hioNbIl6+VPhqVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=prkh4TKr
Subject: Re: [Buildroot] [PATCH 2/2] package/rpi-userland: package is
 deprecated
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Samuel Martin <s.martin49@gmail.com>,
 =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>, Mahyar
 Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBUaHUsIDI1IEp1bCAyMDI0IDEzOjA1OjI3ICswMjAwCkdhw6tsIFBPUlRBWSA8
Z2FlbC5wb3J0YXlAZ21haWwuY29tPiB3cm90ZToKCj4gVGVzdGluZyB0aGUgY2hhbmdlIGluIFF0
V2ViZW5naW5lIGlzIHByZXR0eSBsb25nLi4uIGFuZCBldmVuIG1vcmUgb24gYQo+IGxhcHRvcC4K
Ck9oIHllcywgSSBoYXZlIGJlZW4gdXNpbmcgYSB2ZXJ5IGZhc3QgYnVpbGQgc2VydmVyIHRvIGRv
IHRoaXMKZGVidWdnaW5nL2ludmVzdGlnYXRpb24uCgo+IFRoZSBmaXJzdCByYWlzZXMgaWYgdGhl
IHByb3ByaWV0YXJ5LWNvZGVjcyBpcyBzZXQgYXMgdGhlIGJ1bmRsZSBmZm1wZWcKPiBoYXMgaGFy
ZGNvZGVkIGNvbmZpZ3M7IGl0IGJ1aWxkcyB0aGUgdnA4IHJlcXVpcmluZyB0aHVtYiBmb3IgYXJt
ICh3ZWxsCj4gbWF5YmUgaXQgYnVpbGRzIHZwOCBldmVuIGlmIHRoZSBwcm9wcmlldGFyeSBjb2Rl
Y3MgaXMgdW5zZXQgOi8pLgo+IAo+IEhvd2V2ZXIsIHFtYWtlIGNyZWF0ZXMgdGhlIGFybSBmbGFn
cyBnaXZlbiB0byB0aGUgY29tcGlsZXIgaXRzZWxmLiBJdAo+IGd1ZXNzZXMgdGhlbSBmcm9tIHRo
ZSAkUU1BS0UgYW5kICRRTUFLRV9DRkxBR1Mgc2V0IGluIHRoZSBxbWFrZS5jb25mCj4gZ2VuZXJh
dGVkIGluIHF0NWJhc2U7IGJ1dCBidWlsZHJvb3QgZG9lcyBub3Qgc2V0IHRoZSAtbWFyY2gsIC1t
dHVuZSwKPiAtbWZsb2F0LWFiaSwgLW1mcHUgLW1hcm0vLW10aHVtYiBmbGFncyB0byBpdC4KPiAK
PiBTbyBxbWFrZSBpcyBsb3N0IGFuZCBidWlsZHMgYW55IEFSTSAzMi1iaXMgdGFyZ2V0IHdpdGgg
dGhlIGRlZmF1bHQgZmxhZ3MKPiAtbWFyY2g9YXJtdjctYSAtbWZsb2F0LWFiaT1oYXJkIC1tdHVu
ZT1nZW5lcmljLWFybXY3LWEgLW1mcHU9dmZwdjMtZDE2Cj4gLW1hcm0uCj4gCj4gVGhlIGZsYWcg
LW1hcm0gcmFpc2UgcmFpc2VzIHRoZSBlcnJvciBiZWxvdyBmb3IgdnA4LmMgKGJlY2F1c2UgaXQg
aXMgYQo+IHRodW1iIG1uZW1vbmljKToKCkkgaGlnaGx5IGRvdWJ0IHRoYXQgdGhlIFZQOCBjb2Rl
IGlzIHVzaW5nIFRodW1iLW9ubHkgaW5zdHJ1Y3Rpb25zLgoKPiAKPiAJe3N0YW5kYXJkIGlucHV0
fTogQXNzZW1ibGVyIG1lc3NhZ2VzOgo+IAl7c3RhbmRhcmQgaW5wdXR9OjExMTk6IEVycm9yOiBi
YWQgaW5zdHJ1Y3Rpb24gYGxkcmhjcyByMCxbaXBdLCMyJwoKSSBkaWQgYSBiaXQgb2YgZXhwZXJp
bWVudCwgYnV0IGNvdWxkIG5vdCBjb21lIHRvIGEgY29uY2x1c2lvbi4gbGRyaCBpcwpkZWZpbml0
ZWx5IHJlY29nbml6ZWQsIGJ1dCBub3QgbGRyaGNzLiBBbmQgYnVpbGRpbmcgaW4gVGh1bWIgbW9k
ZQpkb2Vzbid0IG1ha2UgYW55IGRpZmZlcmVuY2U6Cgp0aG9tYXNAd2luZHN1cmY6L3RtcCQgY2F0
IHBsb3AuUyAKbGRyaGNzIHIwLCBbaXBdLCAjMgoKdGhvbWFzQHdpbmRzdXJmOi90bXAkIGFybS1s
aW51eC1nbnUtZ2NjIC1tYXJjaD1hcm12NnprIC1jIHBsb3AuUyAKcGxvcC5TOiBBc3NlbWJsZXIg
bWVzc2FnZXM6CnBsb3AuUzoxOiBFcnJvcjogYmFkIGluc3RydWN0aW9uIGBsZHJoY3MgcjAsW2lw
XSwjMicKCnRob21hc0B3aW5kc3VyZjovdG1wJCBhcm0tbGludXgtZ251LWdjYyAtbWFyY2g9YXJt
djZ6ayAtbXRodW1iIC1jIHBsb3AuUyAKcGxvcC5TOiBBc3NlbWJsZXIgbWVzc2FnZXM6CnBsb3Au
UzoxOiBFcnJvcjogYmFkIGluc3RydWN0aW9uIGBsZHJoY3MgcjAsW2lwXSwjMicKCnRob21hc0B3
aW5kc3VyZjovdG1wJCBhcm0tbGludXgtZ251LWdjYyAtbWFyY2g9YXJtdjgtYSAtbXRodW1iIC1j
IHBsb3AuUyBwbG9wLlM6IEFzc2VtYmxlciBtZXNzYWdlczoKcGxvcC5TOjE6IEVycm9yOiBiYWQg
aW5zdHJ1Y3Rpb24gYGxkcmhjcyByMCxbaXBdLCMyJwoKdGhvbWFzQHdpbmRzdXJmOi90bXAkIGFy
bS1saW51eC1nbnUtZ2NjIC1tYXJjaD1hcm12OC1hIC1jIHBsb3AuUyAKcGxvcC5TOiBBc3NlbWJs
ZXIgbWVzc2FnZXM6CnBsb3AuUzoxOiBFcnJvcjogYmFkIGluc3RydWN0aW9uIGBsZHJoY3MgcjAs
W2lwXSwjMicKCj4gTm90ZTogY2hyb21pdW0gZmFpbHMgYXQgY29uZmlndXJlIGlmIC1mZWF0dXJl
LXdlYmVuZ2luZS1hcm0tdGh1bWIgaXMKPiBmb3JjZWQgdG8gaXRzIGNvbW1hbmQtbGluZSBpbnN0
ZWFkIG9mIGZhaWxpbmcgYWZ0ZXJ3YXJkIGF0IGJ1aWxkOyBzbyBpdAo+IGlzIGludGVycmVzdGlu
ZyB0byBlbmZvcmNlIGl0IGlmIENQVSBzdXBwb3J0cyBUaHVtYi4KCk5vdCBzdXJlIHRvIHVuZGVy
c3RhbmQgdGhpcyBwYXJ0LgoKPiBBbHNvLCBpdCBpcyB3cm9uZyBmb3IgcmFzcGJlcnJ5IHBpIDEg
KGFybXY2KS4KPiAKPiBUaGUgc2Vjb25kIHJhaXNlcyBhdCBsaW5raW5nIGJsaW5rOgo+IAo+IAkv
aG9tZS9ncG9ydGF5L3NyYy9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvbGliL2djYy9hcm0tYnVpbGRy
b290LWxpbnV4LWdudWVhYmloZi8xMy4zLjAvLi4vLi4vLi4vLi4vYXJtLWJ1aWxkcm9vdC1saW51
eC1nbnVlYWJpaGYvYmluL2xkOiB3YXJuaW5nOiAvaG9tZS9ncG9ydGF5L3NyYy9idWlsZHJvb3Qv
b3V0cHV0L2J1aWxkL3F0NXdlYmVuZ2luZS01LjE1LjE0L3NyYy9jb3JlL3JlbGVhc2Uvb2JqL3Ro
aXJkX3BhcnR5L2JsaW5rL3JlbmRlcmVyL3BsYXRmb3JtL2hlYXAvYXNtL2FzbS9TYXZlUmVnaXN0
ZXJzX2FybS5vOiBtaXNzaW5nIC5ub3RlLkdOVS1zdGFjayBzZWN0aW9uIGltcGxpZXMgZXhlY3V0
YWJsZSBzdGFjawo+IAkvaG9tZS9ncG9ydGF5L3NyYy9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvbGli
L2djYy9hcm0tYnVpbGRyb290LWxpbnV4LWdudWVhYmloZi8xMy4zLjAvLi4vLi4vLi4vLi4vYXJt
LWJ1aWxkcm9vdC1saW51eC1nbnVlYWJpaGYvYmluL2xkOiBOT1RFOiBUaGlzIGJlaGF2aW91ciBp
cyBkZXByZWNhdGVkIGFuZCB3aWxsIGJlIHJlbW92ZWQgaW4gYSBmdXR1cmUgdmVyc2lvbiBvZiB0
aGUgbGlua2VyCj4gCWNvbGxlY3QyOiBlcnJvcjogbGQgcmV0dXJuZWQgMSBleGl0IHN0YXR1cwo+
IAo+IElzIHRoYXQgcG9zc2libGUgdGhpcyBpcyB0aGUgaXNzdWUgeW91IG1lbnRpb25lZD8KClRo
aXMgaXMgdGhlIGlzc3VlIEkgbWVudGlvbmVkIGluZGVlZC4gVGhlIGxpbmtlciBiYWlscyBvdXQg
d2l0aCBhCm5vbi16ZXJvIGVycm9yIGNvZGUsIGJ1dCBkb2VzIG5vdCBzaG93IGFueSBlcnJvciBt
ZXNzYWdlLgoKPiBBbHNvLCBJIGhhdmUgbm90aWNlZCB0aGF0IGNocm9taXVtIGNoZWNrcyBmb3Ig
anBlZy10dXJibyBzcGVjaWZpYwo+IHN5bWJvbHMgaWYgLWZlYXR1cmUtd2ViZW5naW5lLXN5c3Rl
bS1qcGVnOyByYXNwYmVycnlwaSB1c2VzIGxpYmpwZWcgYXMKPiBqcGVnLXR1cmJvIGNhbm5vdCBi
ZSBidWlsdCBmb3IgdGhpcyB0YXJnZXQsIGFuZCBxdDV3ZWJlbmdpbmUgZmFpbHMgYXQKPiBjb25m
aWd1cmUuCgpEYW5nLCBJIGFtIHByZXR0eSBzdXJlIEkgc2F3IHRoaXMsIHN3aXRjaGVkIHRvIGpw
ZWctdHVyYm8sIGJ1dCBJIGZvcmdvdAp0byBpbmNsdWRlIGl0IGluIG15IHBhdGNoIHNlcmllcy4g
SG93IGNvbWUganBlZy10dXJibyBjYW5ub3QgYmUgYnVpbHQKZm9yIHlvdXIgdGFyZ2V0PyBBcyBm
YXIgYXMgSSBjYW4gc2VlLCBqcGVnLXR1cmJvIGRvZXMgbm90IGhhdmUgYW55CmFyY2hpdGVjdHVy
ZSBkZXBlbmRlbmN5LiBBcmUgeW91IHN1cmUgeW91IGRpZG4ndCBtaXNyZWFkCnBhY2thZ2UvanBl
Zy9Db25maWcuaW4/IEl0IHVzZXMganBlZy10dXJibyBhcyBkZWZhdWx0IGlmCkJSMl9QQUNLQUdF
X0pQRUdfU0lNRF9TVVBQT1JULCBidXQgaXQgZG9lcyBub3QgcHJldmVudCBmcm9tIHNlbGVjdGlu
ZwpqcGVnLXR1cmJvIGlmIEJSMl9QQUNLQUdFX0pQRUdfU0lNRF9TVVBQT1JUIGlzIG5vdCB0cnVl
LgoKQmVzdCByZWdhcmRzLAoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBh
bmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5k
IHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
