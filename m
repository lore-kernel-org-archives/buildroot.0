Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49509CAC59A
	for <buildroot@archiver.kernel.org>; Thu, 18 Sep 2025 09:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E56BE412B0;
	Thu, 18 Sep 2025 09:38:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0DU7OXSLEjbG; Thu, 18 Sep 2025 09:38:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21C84412BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21C84412BE;
	Thu, 18 Sep 2025 09:38:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A07CF1E3
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 09:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 872AC84C82
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 09:38:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id se1vYFz4Uuz1 for <buildroot@buildroot.org>;
 Thu, 18 Sep 2025 09:38:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=fred.lefranc.evs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 623A484C81
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 623A484C81
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 623A484C81
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 09:38:39 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-62f5bfd0502so1161070a12.0
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 02:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758188317; x=1758793117;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CtAJ21z4ftHn9x/2OigvykWyk74l1XjDIALQ6FwqfrI=;
 b=m1blORNtQN+FdKqRlAMF2UHlMgbwdDBq3acU2uOJwaBLMTAYzsp3osTKFhmNtZ2XIb
 qR7wJ4nXTWbqlTuu4wBjAVFb2Dz71R18yhruefoe/uB5vxQxf+hFQX3Trgb7izTJDCqM
 KTg/txLEQZ04VheT4jhSzMNRzfijlhTCjA/AtRwhB52mBozvO5YWsInR+5PQJo7WXMkC
 /yM8YWGG855eTLxdjvSaJOxZDKsrAzmzMh9zn4kG+9PzqWjG46+jNsDtU8dTpcC/Lvha
 i8u92LJGOMyXwhjssDKe8TpLV4cFG12VjFFfZrOMbwSlKKycsHdJSiHQ1gT2CsL5xTgu
 5ZvQ==
X-Gm-Message-State: AOJu0YytqboExGG+BOD7keVIAkSCemWrZIzKR89iqklfsDweazQhMIKI
 m1Y582bAE8eKX4M6OBgViTsfYlZSB9NARjsj/4nK3CWFPwdvZpvF6NVe/g2XeXmIq0nnj7SHdJf
 IJu2vEKax8UA3VOGtswhRB9JNbPyGbmxfVjGk
X-Gm-Gg: ASbGncvoNdm3F50GbkriwhYIOLb8c4UwODryRisgdqvde6uxLub+S1suiLlQrrbccTq
 JRTVy3Up5+dpZy/Y53FPExEOmQNAiDhtYKO67FAvGxLxRAWuZeM+I8RgrlC6u1Ah0ui3V/u/4Wf
 DskmLvOvxKv/k5a7AVx3O5HDa+UeHzVCYAohRaVjzAfRaCnkQlLb9lt6lH1M+TeOEUASHiR7dGz
 B7es3z5XZU+zMrMq5UE3QdfBrM=
X-Google-Smtp-Source: AGHT+IG+RqC6vU0er3mSsp4dLwVty1O2LSJpBlqBQrPuQ7RDvyXXsv4gxBHTvvcfBIzvMVneXm9roPIvOxX8X6M+qf4=
X-Received: by 2002:a17:907:7e88:b0:b04:97a2:64f8 with SMTP id
 a640c23a62f3a-b1bb86d78famr562911566b.2.1758188317043; Thu, 18 Sep 2025
 02:38:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAGkXw1XQXKAxnjudTsiM4jcVcH0pYhzLD6bxg4H5VGDi1bt1tQ@mail.gmail.com>
 <41add64e1392d3584206104ee4d09192@free.fr>
In-Reply-To: <41add64e1392d3584206104ee4d09192@free.fr>
From: Fred Lefranc <fred.lefranc.evs@gmail.com>
Date: Thu, 18 Sep 2025 11:38:22 +0200
X-Gm-Features: AS18NWAi7m9CcxBaUIRsGGczrCZ3bHSKkK3EMapz28ileWBY05_19NlNFq-20-g
Message-ID: <CAGkXw1XN2ALan6FmgRci6WmVwUy7G2ceB58WJivW6BX=-xr_RA@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Fred Lefranc <fred.lefranc+evs@gmail.com>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758188317; x=1758793117; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CtAJ21z4ftHn9x/2OigvykWyk74l1XjDIALQ6FwqfrI=;
 b=i35ksrPuRfkwxCoohikFQ4Z8goDW/K0IN69k7MYpzYS1LdqNL1nvepYqehfBZUoRsS
 bd8n+acUJix6z2WxcFD1EIyD39TQdM86zEGrXFvgAa1mnJzV41WfCCVwKzo2EpIEtXy7
 J4xkm5WdG53E9b+KcUTRRkNwxHESWpkaa/ZP1KaGiG+90DGn0EjXGpm3FjHGae1mS+2k
 YgQS+CJ7loQ8vbIRrCS38POlnTsRoJtvrVfL/e9Xzuh/4Hdcq9dq7XjwYdSAcCiTbiyA
 JckXyp/EUyicJieIcWD+0aIoi6msrrKptrFfQ8cXK9m4A16tJNpP4MQQXNsYK7d0LnTK
 niZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=i35ksrPu
Subject: Re: [Buildroot] [PATCH 1/1] package/haproxy: bump to version 3.2.1
 (lts branch)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpUaGFua3MgZm9yIHRoZSBjYXRjaC4gSW4gdGhlIG1lYW50aW1lIEkgZm91bmQgdGhhdCB3
ZSBoYWQgYSBtYWpvcgppc3N1ZSBjb21waWxpbmcgSEFQcm94eSByZWxhdGVkIHRvIENGTEFHUyB0
aGF0IGFyZSBvdmVycmlkZGVuIGJ5IHRoZQpnZW5lcmljLXBhY2thZ2UgYnVpbGQgdG9wb2xvZ3ku
CgpJJ3ZlIGZvdW5kIGEgcGF0Y2ggdGhhdCBpcyB3b3JraW5nLCBidXQgSSB3YW50ZWQgdG8gaGF2
ZSBhIGRpc2N1c3Npb24KYWJvdXQgdGhlIGJlc3Qgd2F5IHRvIGhhbmRsZSB0aGlzLgoKUmVnYXJk
cywKRnJlZAoKT24gU3VuLCBKdWwgMTMsIDIwMjUgYXQgMTI6MzbigK9QTSBKdWxpZW4gT2xpdmFp
biA8anUub0BmcmVlLmZyPiB3cm90ZToKPgo+IEhpIEZyZWQsCj4KPiBUaGFua3MgZm9yIHRoZSBw
YXRjaCEKPgo+IEl0IHdhcyBub3QgYXBwbHlpbmcgYXMgaXMsIGR1ZSB0byB3b3JkIHdyYXBwaW5n
LiBDb3VsZCB5b3UgbWFrZSBzdXJlCj4gdG8gc2VuZCBwYXRjaGVzIHdpdGggZ2l0IHNlbmQtZW1h
aWwgdG8gbWFrZSBzdXJlIHRoZXkgYXJlIGNvcnJlY3RseQo+IGZvcm1hdHRlZCBwbGVhc2U/Cj4K
PiBXaGVuIGRvaW5nIGEgYnVtcCBsaWtlIHRoaXMsIGNvdWxkIHlvdSBhZGQgYSBsaW5rIHRvIGEg
Y2hhbmdlIGxvZywKPiBvciBhIHJlbGVhc2Ugbm90ZSBpbiB0aGUgY29tbWl0IGxvZz8KPgo+IEZv
ciBleGFtcGxlLCBhZGRpbmc6Cj4gIiIiCj4gRm9yIHRoZSBjaGFuZ2UgbG9nIHNpbmNlIHYyLjYu
MjIsIHNlZToKPiBodHRwczovL3d3dy5oYXByb3h5Lm9yZy9kb3dubG9hZC8zLjIvc3JjL0NIQU5H
RUxPRwo+ICIiIgo+Cj4gT24gMjMvMDYvMjAyNSAxMTowMCwgRnJlZCBMZWZyYW5jIHdyb3RlOgo+
ID4gU2lnbmVkLW9mZi1ieTogRnJlZCBMZWZyYW5jIDxmcmVkLmxlZnJhbmMrZXZzQGdtYWlsLmNv
bT4KPiA+IC0tLQo+ID4gIC4uLm1pYy5oLW1heS1uZWVkLWNvbXBpbGVyLmgtb24tQVJNdjguMi5w
YXRjaCB8IDM2IC0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICBwYWNrYWdlL2hhcHJveHkvaGFwcm94
eS5oYXNoICAgICAgICAgICAgICAgICAgfCAgNCArLS0KPiA+ICBwYWNrYWdlL2hhcHJveHkvaGFw
cm94eS5tayAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0KPiA+ICAzIGZpbGVzIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pCj4gPiAgZGVsZXRlIG1vZGUgMTAwNjQ0
Cj4gPiBwYWNrYWdlL2hhcHJveHkvMDAwMS1CVUlMRC1hdG9taWMtYXRvbWljLmgtbWF5LW5lZWQt
Y29tcGlsZXIuaC1vbi1BUk12OC4yLnBhdGNoCj4gPgo+IFsuLi5dCj4gPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9oYXByb3h5L2hhcHJveHkubWsgYi9wYWNrYWdlL2hhcHJveHkvaGFwcm94eS5tawo+
ID4gaW5kZXggNzcxOTVkOTY2Yi4uMDZkMGM3YmQyNiAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2Uv
aGFwcm94eS9oYXByb3h5Lm1rCj4gPiArKysgYi9wYWNrYWdlL2hhcHJveHkvaGFwcm94eS5tawo+
ID4gQEAgLTQsOCArNCw4IEBACj4gPiAgIwo+ID4KPiA+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Cj4gPgo+ID4gLUhBUFJPWFlfVkVSU0lPTl9NQUpPUiA9IDIuNgo+ID4gLUhBUFJPWFlfVkVSU0lP
TiA9ICQoSEFQUk9YWV9WRVJTSU9OX01BSk9SKS4yMgo+ID4gK0hBUFJPWFlfVkVSU0lPTl9NQUpP
UiA9IDMuMgo+ID4gK0hBUFJPWFlfVkVSU0lPTiA9ICQoSEFQUk9YWV9WRVJTSU9OX01BSk9SKS4x
Cj4KPiBUaGlzIGJ1bXAgaXMgaW50cm9kdWNpbmcgYnVpbGQgZmFpbHVyZXMgZm9yIHN0YXRpYyBi
dWlsZHMuCj4gU2VlOgo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9qb2xpdmFpbi9idWlsZHJvb3QvLS9w
aXBlbGluZXMvMTkyMzYyNDQ1Mwo+Cj4gaGFwcm94eSBpbnRyb2R1Y2VkIGEgbWFsbG9jX3RyaW0o
KSBzeW1ib2wgaW4KPiBodHRwczovL2dpdC5oYXByb3h5Lm9yZy8/cD1oYXByb3h5LTMuMi5naXQ7
YT1jb21taXRkaWZmO2g9ZWFiYTc2YjAyZGQ0MWUwYTFhMmU4NWEzZTcxZjkxZGZjNTI5OTE2ZAo+
Cj4gVGhlbiB0cmllcyB0byBvdmVycmlkZSBpdCB3aXRoIGxpYmRsIGNhbGxzOgo+IGh0dHBzOi8v
Z2l0LmhhcHJveHkub3JnLz9wPWhhcHJveHktMy4yLmdpdDthPWJsb2I7Zj1zcmMvdG9vbHMuYzto
PWFlZTc1MGI0MTgwYzIyYzFiMzYwMzA1YmY5ZWNjMzhhMTU3ZDJjMWU7aGI9ZjRkMWE0ZTI3OWJj
YjAwZjc1OGRmYmYwMzdlMzgwODUxMmRmMTEzYiNsNTQ4MAo+Cj4gRXZlbiBpZiB0aGVyZSBpcyBs
b2dpYyBhdm9pZGluZyB0aG9zZSBsaWJkbCBjYWxscywgdGhlIGZpbmFsIGxpbmsKPiBmYWlscyBk
dWUgdG8gdGhpcyBtdWx0aXBsZSBkZWZpbml0aW9uIG9mIG1hbGxvY190cmltIHN5bWJvbC4KPgo+
IFlvdSBjYW4gcmVwcm9kdWNlIHRoZSBpc3N1ZSB3aXRoIGNvbW1hbmRzOgo+Cj4gICAgICBjYXQg
Pi5jb25maWcgPDxFT0YKPiAgICAgIEJSMl9hYXJjaDY0PXkKPiAgICAgIEJSMl9TVEFUSUNfTElC
Uz15Cj4gICAgICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKPiAgICAgIEJSMl9UT09MQ0hBSU5f
RVhURVJOQUxfQk9PVExJTj15Cj4gICAgICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU5f
QUFSQ0g2NF9VQ0xJQkNfQkxFRURJTkdfRURHRT15Cj4gICAgICBCUjJfUEFDS0FHRV9IQVBST1hZ
PXkKPiAgICAgIEVPRgo+ICAgICAgbWFrZSBvbGRkZWZjb25maWcKPiAgICAgIG1ha2UgaGFwcm94
eQo+Cj4gQ291bGQgeW91IGhhdmUgYSBsb29rIHRvIGVpdGhlciBmaXggdGhvc2Ugc3RhdGljIGJ1
aWxkcywgb3IKPiBhZGRpbmcgYSBLY29uZmlnIGxvZ2ljIHRvIHJlc3RyaWN0IG9ubHkgdG8gZHlu
YW1pYyBidWlsZHM/Cj4KPiA+ICBIQVBST1hZX1NJVEUgPQo+ID4gaHR0cDovL3d3dy5oYXByb3h5
Lm9yZy9kb3dubG9hZC8kKEhBUFJPWFlfVkVSU0lPTl9NQUpPUikvc3JjCj4gPiAgSEFQUk9YWV9M
SUNFTlNFID0gR1BMLTIuMCsgYW5kIExHUEwtMi4xKyB3aXRoIGV4Y2VwdGlvbnMKPiA+ICBIQVBS
T1hZX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFIGRvYy9sZ3BsLnR4dCBkb2MvZ3BsLnR4dAo+ID4g
LS0KPiA+IDIuMjUuMQo+Cj4gQ2FuIHlvdSBzZW5kIGFuIHVwZGF0ZWQgcGF0Y2ggYWRkcmVzc2lu
ZyB0aG9zZSBjb21tZW50LCBwbGVhc2U/Cj4KPiBCZXN0IHJlZ2FyZHMsCj4KPiBKdWxpZW4uCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
