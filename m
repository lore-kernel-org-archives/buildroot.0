Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A84C27C52
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 09:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 805E9811FF;
	Thu,  6 Jun 2024 09:40:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xqvnjzPTevbg; Thu,  6 Jun 2024 09:40:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 720B181200
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 720B181200;
	Thu,  6 Jun 2024 09:40:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C4F81BF23C
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 09:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28DB64023F
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 09:40:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Bsn3xAzDDif for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 09:40:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 09049401FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09049401FF
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09049401FF
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 09:40:00 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-62a087bc74bso7126417b3.2
 for <buildroot@buildroot.org>; Thu, 06 Jun 2024 02:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717666800; x=1718271600;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cF5HblhPqbswpY0DRErLyIXz/QwfAiUTG4+6/UafvFs=;
 b=W4d4eMjZRZx4eK48ja2o3h3vHfsWmKeWXp/n8uEeedpSaPDPrQ1Co+poFMsRi/ZFDL
 UjJp/LlYKTx2GChOhoiF8MdZD+KmAJhaZQQInRnI9+tcpxor1S/cHDcxAY3qiGiwQU9x
 XgkducC8cZBXUd9W1tpF1j/70oBh+uXvsismGTLTKxHyrgKQfKh+7Cgut2UYpmauVzc7
 QQeIpBexWbtdf4XFJlMTbmzL+nvNgjwzFwwoPimMWEDJ22RCJKMXDz+QFwe8vqk+AAWU
 64569xkxUFoN8P3eZej/qB83HZLBclTnTCdzOBPxFK3sePV9t61YMfpOfzlmy3YIA+Wn
 jPKw==
X-Gm-Message-State: AOJu0YzhZiUBVd1ud6G7Hi5PCg3seJwaLrsQfh9XjJWRs5sy94JlEKg+
 otO/zy43+oePsN0JAz7W/JzZfOqwOJ5tAXu1YpdJh61EiY7juKUFDwDNVnBUJNbJMmM217Pb1Sg
 GplObPWtzypy6LNE2OmFE6p6NhUq5KEFCuuQQAw==
X-Google-Smtp-Source: AGHT+IH70qpqnCtGbIEO/fgoZhX9Wlq1MlTOo2WvfJfHFBgRoO6wVLU7ieiwYzJqM1fBHkfyGlD6VJz2tiCvRSwiFJA=
X-Received: by 2002:a0d:d2c5:0:b0:61a:fe34:18b6 with SMTP id
 00721157ae682-62cbb4c6f64mr51342587b3.21.1717666799667; Thu, 06 Jun 2024
 02:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240605090440.2400647-1-dario.binacchi@amarulasolutions.com>
 <6476235f-0b7f-410e-b056-df620d3632ca@mind.be>
In-Reply-To: <6476235f-0b7f-410e-b056-df620d3632ca@mind.be>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 6 Jun 2024 11:39:48 +0200
Message-ID: <CABGWkvpTyDxs_Lci9s7NJmmyHVrtcVZ7AcnvWOL1o5MfaGcweg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1717666800; x=1718271600;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cF5HblhPqbswpY0DRErLyIXz/QwfAiUTG4+6/UafvFs=;
 b=mql37a3/64C2Z+iGCoSuv8nCInV6KXxUDP+8vSyUQpfUEKLQEgV8E8kslSzOqMVwtE
 Rs0KvL6jgod2arY3YFVeYSGkz3oz7PANebs4+6vWSJXJrSgAcE507wYMvaUFtzO9WJ6m
 DykW0Sg+mR+ZFJP1aGkZ/7t1cAAudibZ70zwU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=mql37a3/
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: don't use stack
 protection if BR2_SSP_NONE=y
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
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKT24gV2VkLCBKdW4gNSwgMjAyNCBhdCAxMDo1M+KAr1BNIEFybm91dCBWYW5k
ZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZT4gd3JvdGU6Cj4KPgo+Cj4gT24gMDUvMDYvMjAyNCAx
MTowNCwgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4gPiBUaGUgb3BlbnNzaCBwYWNrYWdlIGVuYWJs
ZXMgdGhlIHVzZSBvZiBjb21waWxlcidzIHN0YWNrIHByb3RlY3Rpb24gYnkKPiA+IGRlZmF1bHQs
IGJ1dCBhbGxvd3MgdGhpcyBmZWF0dXJlIHRvIGJlIGRpc2FibGVkIHVzaW5nIHRoZQo+ID4gIi0t
d2l0aG91dC1zdGFja3Byb3RlY3QiIGNvbmZpZ3VyYXRpb24gb3B0aW9uLgo+ID4KPiA+IFRoZSBw
YXRjaCBkaXNhYmxlcyB0aGUgY29tcGlsYXRpb24gb2Ygb3BlbnNzaCB3aXRoIHRoZSBjb21waWxl
cidzIHN0YWNrCj4gPiBwcm90ZWN0b3IgaWYgdGhlIEJ1aWxkcm9vdCBvcHRpb24gQlIyX1NTUF9O
T05FIGlzIHNlbGVjdGVkLCB0aHVzIGVuc3VyaW5nCj4gPiB0aGF0IHRoZSBwYWNrYWdlIGlzIGJ1
aWx0IGNvbnNpc3RlbnRseSB3aXRoIHRoZSBCdWlsZHJvb3QgY29uZmlndXJhdGlvbi4KPgo+ICAg
SWYgdGhhdCdzIHRoZSBvbmx5IHJlYXNvbiwgSSdtIG5vdCBzdXJlIHRoYXQgaXQgaXMgd29ydGgg
ZG9pbmcgdGhpcy4uLiBBCj4gY29udmluY2luZyByZWFzb24gdG8gYWx3YXlzIGRpc2FibGUgU1NQ
IGlzIGlmIGl0IGxlYWRzIHRvIGJ1aWxkIGZhaWx1cmVzIChlLmcuCj4gdGhlIHRvb2xjaGFpbiBk
b2Vzbid0IGluY2x1ZGUgdGhlIFNTUCBsaWJyYXJ5IHNvIGJ1aWxkaW5nIHdpdGggc3RhY2stcHJv
dGVjdG9yCj4gZW5hYmxlZCB3aWxsIGp1c3Qgbm90IHdvcmspLiBCdXQgSSBndWVzcyB0aGF0J3Mg
bm90IGhhcHBlbmluZyBpbiB5b3VyIGNhc2UgKEkKPiB0aGluayBvbmx5IHVDbGliYyBjYW4gcmVh
bGx5IGJlIGJ1aWx0IHdpdGhvdXQgU1NQIHN1cHBvcnQsIGFuZCBwcm9iYWJseSB0aGUKPiBvcGVu
c3NoIGNvbmZpZ3VyZSBzY3JpcHQgZGlzY292ZXJzIHRoYXQgU1NQIGlzIG5vdCBzdXBwb3J0ZWQu
Li4pCj4KPiAgIEl0J3MgbGlrZSB0aGUgb3RoZXIgaGFyZGVuaW5nIG9wdGlvbnMgSU1ITyAtIHdl
IGRvIHNldCBhIGdsb2JhbCBkZWZhdWx0LCBhbmQKPiB0aGF0IHNob3VsZCBiZSBjb25zaWRlcmVk
IGEgX21pbmltdW1fIGhhcmRlbmluZyBsZXZlbCwgYnV0IHBhY2thZ2VzIG1heSBzdGlsbAo+IG9w
dCB0byBlbmFibGUgaGFyZGVuaW5nIGJ5IHRoZW1zZWx2ZXMgYXMgbG9uZyBhcyBpdCdzIHN0cm9u
Z2VyIHRoYW4gdGhlIGdsb2JhbAo+IGRlZmF1bHQuCj4KPiA+IEFsbCB0aGlzIGFsc28gYWZmZWN0
cyB0aGUgc2l6ZSBvZiB0aGUgYmluYXJpZXMgY3JlYXRlZCBieSB0aGUgY29tcGlsYXRpb24uCj4K
PiAgIEhvdyBiaWcgaXMgdGhhdCBkaWZmZXJlbmNlPwoKc3NwIGVuYWJsZWQ6CiBzc2ggICAgICAg
ICAgICAgICAgIDogc2l6ZTogICAgIDgwMDQwMCB0b3RhbDogICAgIDgwMDQwMAogc2NwICAgICAg
ICAgICAgICAgICA6IHNpemU6ICAgICAxODU3MzIgdG90YWw6ICAgICA5ODYxMzIKIHNmdHAgICAg
ICAgICAgICAgICAgOiBzaXplOiAgICAgMTg5ODA4IHRvdGFsOiAgICAxMTc1OTQwCiBzc2gtYWdl
bnQgICAgICAgICAgIDogc2l6ZTogICAgIDM0NTQ0NCB0b3RhbDogICAgMTUyMTM4NAogc3NoLWFk
ZCAgICAgICAgICAgICA6IHNpemU6ICAgICAzNjE4MzYgdG90YWw6ICAgIDE4ODMyMjAKIHNzaC1r
ZXlzaWduICAgICAgICAgOiBzaXplOiAgICAgNDQ3OTg0IHRvdGFsOiAgICAyMzMxMjA0CiBzc2gt
cGtjczExLWhlbHBlciAgIDogc2l6ZTogICAgIDMyNDk1MiB0b3RhbDogICAgMjY1NjE1Ngogc3No
LWNvcHktaWQgICAgICAgICA6IHNpemU6ICAgICAgMTMwNzggdG90YWw6ICAgIDI2NjkyMzQKIHNz
aGQgICAgICAgICAgICAgICAgOiBzaXplOiAgICAgODMzNDA4IHRvdGFsOiAgICAzNTAyNjQyCiBz
ZnRwLXNlcnZlciAgICAgICAgIDogc2l6ZTogICAgIDEyODI0NCB0b3RhbDogICAgMzYzMDg4Ngog
c3NoLWtleWdlbiAgICAgICAgICA6IHNpemU6ICAgICA0NzI0OTIgdG90YWw6ICAgIDQxMDMzNzgK
IHNzaC1rZXlzY2FuICAgICAgICAgOiBzaXplOiAgICAgNDI3NTAwIHRvdGFsOiAgICA0NTMwODc4
Cgpzc3AgZGlzYWJsZWQ6CiBzc2ggICAgICAgICAgICAgICAgIDogc2l6ZTogICAgIDc1OTQ0MCB0
b3RhbDogICAgIDc1OTQ0MAogc2NwICAgICAgICAgICAgICAgICA6IHNpemU6ICAgICAxNzM0NDQg
dG90YWw6ICAgICA5MzI4ODQKIHNmdHAgICAgICAgICAgICAgICAgOiBzaXplOiAgICAgMTc3NTIw
IHRvdGFsOiAgICAxMTEwNDA0CiBzc2gtYWdlbnQgICAgICAgICAgIDogc2l6ZTogICAgIDMyOTA2
MCB0b3RhbDogICAgMTQzOTQ2NAogc3NoLWFkZCAgICAgICAgICAgICA6IHNpemU6ICAgICAzNDEz
NTYgdG90YWw6ICAgIDE3ODA4MjAKIHNzaC1rZXlzaWduICAgICAgICAgOiBzaXplOiAgICAgNDIz
NDA4IHRvdGFsOiAgICAyMjA0MjI4CiBzc2gtcGtjczExLWhlbHBlciAgIDogc2l6ZTogICAgIDMw
ODU2OCB0b3RhbDogICAgMjUxMjc5Ngogc3NoLWNvcHktaWQgICAgICAgICA6IHNpemU6ICAgICAg
MTMwNzggdG90YWw6ICAgIDI1MjU4NzQKIHNzaGQgICAgICAgICAgICAgICAgOiBzaXplOiAgICAg
NzkyNDQ4IHRvdGFsOiAgICAzMzE4MzIyCiBzZnRwLXNlcnZlciAgICAgICAgIDogc2l6ZTogICAg
IDEyMDA1MiB0b3RhbDogICAgMzQzODM3NAogc3NoLWtleWdlbiAgICAgICAgICA6IHNpemU6ICAg
ICA0NDc5MTYgdG90YWw6ICAgIDM4ODYyOTAKIHNzaC1rZXlzY2FuICAgICAgICAgOiBzaXplOiAg
ICAgNDAyOTI0IHRvdGFsOiAgICA0Mjg5MjE0CgpEaWZmZXJlbmNlIGlzIDI0MTY2NCAoMjM2S2Ip
CgpUaGFua3MgYW5kIHJlZ2FyZHMsCkRhcmlvCgo+Cj4KPiAgIFJlZ2FyZHMsCj4gICBBcm5vdXQK
Pgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBh
bWFydWxhc29sdXRpb25zLmNvbT4KPiA+IC0tLQo+ID4gICBwYWNrYWdlL29wZW5zc2gvb3BlbnNz
aC5tayB8IDEgKwo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVuc3NoL29wZW5zc2gubWsgYi9wYWNrYWdlL29wZW5zc2gv
b3BlbnNzaC5tawo+ID4gaW5kZXggZDdmNGRiNTljYTNkLi42OTliMDg0YTU3MDUgMTAwNjQ0Cj4g
PiAtLS0gYS9wYWNrYWdlL29wZW5zc2gvb3BlbnNzaC5tawo+ID4gKysrIGIvcGFja2FnZS9vcGVu
c3NoL29wZW5zc2gubWsKPiA+IEBAIC0yMiw2ICsyMiw3IEBAIE9QRU5TU0hfQ09ORl9PUFRTID0g
XAo+ID4gICAgICAgLS1zeXNjb25mZGlyPS9ldGMvc3NoIFwKPiA+ICAgICAgIC0td2l0aC1kZWZh
dWx0LXBhdGg9JChCUjJfU1lTVEVNX0RFRkFVTFRfUEFUSCkgXAo+ID4gICAgICAgJChpZiAkKEJS
Ml9QQUNLQUdFX09QRU5TU0hfU0FOREJPWCksLS13aXRoLXNhbmRib3gsLS13aXRob3V0LXNhbmRi
b3gpIFwKPiA+ICsgICAgICQoaWYgJChCUjJfU1NQX05PTkUpLC0td2l0aG91dC1zdGFja3Byb3Rl
Y3QsKSBcCj4gPiAgICAgICAtLWRpc2FibGUtbGFzdGxvZyBcCj4gPiAgICAgICAtLWRpc2FibGUt
dXRtcCBcCj4gPiAgICAgICAtLWRpc2FibGUtdXRtcHggXAoKCgotLSAKCkRhcmlvIEJpbmFjY2hp
CgpTZW5pb3IgRW1iZWRkZWQgTGludXggRGV2ZWxvcGVyCgpkYXJpby5iaW5hY2NoaUBhbWFydWxh
c29sdXRpb25zLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKCkFtYXJ1
bGEgU29sdXRpb25zIFNSTAoKVmlhIExlIENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2aXNvLCBWZW5l
dG8sIElUCgpULiArMzkgMDQyIDI0MyA1MzEwCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20KCnd3
dy5hbWFydWxhc29sdXRpb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
