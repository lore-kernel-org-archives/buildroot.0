Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FC2CCF9E3
	for <buildroot@archiver.kernel.org>; Fri, 31 Oct 2025 00:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A332983089;
	Fri, 31 Oct 2025 00:14:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pqw60TtbRMyQ; Fri, 31 Oct 2025 00:14:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4F5783422
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4F5783422;
	Fri, 31 Oct 2025 00:14:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB5AD2A3
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 00:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3F7141806
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 00:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z29WFxfrnzKh for <buildroot@buildroot.org>;
 Fri, 31 Oct 2025 00:14:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DCA28417FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCA28417FE
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCA28417FE
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 00:14:12 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-431da4fa224so14164485ab.2
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 17:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761869652; x=1762474452;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p2rm81ttC9qUCF6MdtV7Wxk8NFYuIM4WOBkP/trh8rA=;
 b=EVwvAEB2IH3Q5zjxszg4MFPFsRFXL2vTm1XtaVts+mB9prFSX/yaIs9vKlRtNjTkK3
 TyOVbQVjuSqvlD/hIj8fFgStw87gZVDzfND5l/CvxdW13SLww8d5QbnbtipkVnjS0Vvh
 oHa9hKCsf3/o12U45G81Ds3/LNGL/iGbmWd0JkK0Sm7YK5ggEJBzYTQa5caN8ea8gnet
 BJAK7UIjDFcIzaU4AXm3+7AGJNN3pZbZELjrMGzMkIX/TR7mRF8M/bxWZ1DBpX/9+GkK
 /DpLeVp8bPaxcl6Wyd7i+iHrM4D6ztb/Jaw/IoncS2/F4y63x6wapux3384Q+Bq/cqYo
 9rOQ==
X-Gm-Message-State: AOJu0YwAO5Sl5raUjC9TnJnCY80tH52oEi9cFtiAk5ZwiNpTPHVvOHb0
 wNeTjDA9fq/meOzPNk+yu2uUsfA6Kry7pc1tLFHUv5n1Q6o7MRj7ZWEwfG5pc39KzUrm/KmO2TW
 GootgAU9nvQwwY4iInSzhHm6oe+UzpmM=
X-Gm-Gg: ASbGncsd04zsAFXS8e7YvA1Z9tOEdS++Tf9TzQeSiqH87Bx/9t6ldWOU6t+MgwjKv+Y
 6NJbQjHqzl+BeUWSUElh77dgDZ2mEolwk2Vfr5th3OwddJ5WhvFQBqnT7fn/pg0SZzX4y7Y7nyo
 13IdlEAhOMf7jvqJ3BAD5GLkyg/qGiDGZc7LjzsT3Iqszpcyz4cRzoqo/JzL9idnvgCY9KcWReE
 pw8Sm2ETHANuxe8sZ5v3vfIBze0FoA91Lk279Z3EptypVCL4MSTs9NlWuERx5hQtFVigQ==
X-Google-Smtp-Source: AGHT+IGtitYLdBa0h946H/K38Q+p33YiXZLn2BeE4AzCN2X9zw04IL2s40mXGJMFs9WPrLPara7c65ToEuhC+MjZdas=
X-Received: by 2002:a05:6e02:318f:b0:430:b999:49e7 with SMTP id
 e9e14a558f8ab-4330d1df5femr32187055ab.27.1761869651790; Thu, 30 Oct 2025
 17:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20251022-bash-5-3-v2-1-adcf1223650f@gmail.com>
 <1de6f99f32205dfc810bd0811a6c013e@free.fr>
 <CAMWSM7hpyxHZrUxuwjXtoMDyTfoqqzgEsOF3ALmQ8sYCJo27vw@mail.gmail.com>
In-Reply-To: <CAMWSM7hpyxHZrUxuwjXtoMDyTfoqqzgEsOF3ALmQ8sYCJo27vw@mail.gmail.com>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 30 Oct 2025 17:13:35 -0700
X-Gm-Features: AWmQ_bnw30qGHRBtunBPEILvXnNpLDlvP4lv2bui9sPyT2HC5Fu2jjCLZREZmKc
Message-ID: <CAMWSM7jpwk=-XgDB-OJ68o_eBz-GOLAO0RfywhsEj+XWigdZfQ@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761869652; x=1762474452; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p2rm81ttC9qUCF6MdtV7Wxk8NFYuIM4WOBkP/trh8rA=;
 b=W1WTZAM1Zj3L4COls4gusZzliUO9gj2/J+/2kNMbak91FqyLKlyralAleRVCmHHJ6T
 WWT5+BAbAsdyn6Oy+nnGLEjs2lzLD0buGeTZHzxK5895BY3lNm0HnQYK2ksAY8dwyHm0
 wTvsnJrshB+HAN7T1HtvqZQ6wjODPlqUPfesJ/UZBg65w0Z63lqmguyQM7CwCHvgsBNj
 sZxJ3NSjhcoUVzJeoYZGAe2OJAZ2hgoejp6jxVxO4Zfiuj27PI+qx9U7a97T6F0m34Ga
 tKT5p6iCL6IXqXx0587rO/mZZwjr1sF6b1jGkuihA7WTt4NRG9udT3x9ghDtX26cvsxk
 aIzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=W1WTZAM1
Subject: Re: [Buildroot] [PATCH v2] package/bash: bump to v5.3
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

SGVsbG8sCgpPbiBGcmksIE9jdCAyNCwgMjAyNSBhdCAyOjUx4oCvUE0gSm9zZXBoIEtvZ3V0IDxq
b3NlcGgua29ndXRAZ21haWwuY29tPiB3cm90ZToKPgo+IEhpIEp1bGllbiwKPgo+IE9uIFRodSwg
T2N0IDIzLCAyMDI1IGF0IDE6MzHigK9QTSBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPiB3
cm90ZToKPiA+Cj4gPiBIaSBKb3NlcGgsCj4gPgo+ID4gVGhhbmtzIGZvciB0aGlzIHYyIQo+ID4K
PiA+IE9uIDIyLzEwLzIwMjUgMjI6MDEsIEpvc2VwaCBLb2d1dCB3cm90ZToKPiA+ID4gU2VlIHRo
ZSByZWxldmFudCBhbm5vdW5jZW1lbnQ6Cj4gPiA+IGh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNo
aXZlL2h0bWwvYnVnLWJhc2gvMjAyNS0wNy9tc2cwMDAwNS5odG1sCj4gPiA+Cj4gPiA+IENoYW5n
ZXM6Cj4gPiA+IC0gUmVtb3ZlZCB1cHN0cmVhbWVkIG11bHRpYnl0ZSBjb21waWxhdGlvbiBmaXgK
PiA+ID4gLSBSZWJhc2VkIG1pc3NpbmcgaW5jbHVkZSBwYXRjaCB0aGF0IHJlbWFpbnMgdW5tZXJn
ZWQKPiA+ID4gICAtIEZpeGVkIFVwc3RyZWFtOiBjaGVja3BhY2thZ2Ugd2FybmluZwo+ID4gPiAt
IFJlbW92ZWQgYnVpbGQgZmFpbHVyZSB3b3JrYXJvdW5kcyBlbmZvcmNpbmcgb2xkZXIgQyBzdGFu
ZGFyZAo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKb3NlcGggS29ndXQgPGpvc2VwaC5rb2d1
dEBnbWFpbC5jb20+Cj4gPiBbLi4uXQo+ID4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9iYXNoL2Jh
c2gubWsgYi9wYWNrYWdlL2Jhc2gvYmFzaC5tawo+ID4gPiBpbmRleCA3ZmI0M2M1MmMwLi5lZDk5
YmJhZGIyIDEwMDY0NAo+ID4gPiAtLS0gYS9wYWNrYWdlL2Jhc2gvYmFzaC5tawo+ID4gPiArKysg
Yi9wYWNrYWdlL2Jhc2gvYmFzaC5tawo+ID4gPiBAQCAtNCw3ICs0LDcgQEAKPiA+ID4gICMKPiA+
ID4KPiA+ID4gIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiA+ID4KPiA+ID4gLUJBU0hfVkVSU0lP
TiA9IDUuMi4zNwo+ID4gPiArQkFTSF9WRVJTSU9OID0gNS4zCj4gPgo+ID4gVGhpcyBuZXcgNS4z
IHZlcnNpb24gaXMgaW50cm9kdWNpbmcgMyBidWlsZCBmYWlsdXJlcy4gU2VlOgo+ID4gaHR0cHM6
Ly9naXRsYWIuY29tL2pvbGl2YWluL2J1aWxkcm9vdC8tL3BpcGVsaW5lcy8yMTE0ODc2MTQ2Cj4g
Pgo+ID4gRm9yIHJlZmVyZW5jZSwgdGhlIHZlcnNpb24gNS4yLjM3IGJ1aWxkIGNvcnJlY3RseToK
PiA+IGh0dHBzOi8vZ2l0bGFiLmNvbS9qb2xpdmFpbi9idWlsZHJvb3QvLS9waXBlbGluZXMvMjEx
NDg5Mjk2Nwo+ID4KPiA+ID4gIEJBU0hfU0lURSA9ICQoQlIyX0dOVV9NSVJST1IpL2Jhc2gKPiA+
ID4gIEJBU0hfREVQRU5ERU5DSUVTID0gbmN1cnNlcyByZWFkbGluZSBob3N0LWJpc29uCj4gPiA+
ICBCQVNIX0xJQ0VOU0UgPSBHUEwtMy4wKwo+ID4gPiBAQCAtMjYsMTUgKzI2LDYgQEAgQkFTSF9D
T05GX0VOViA9IFwKPiA+ID4gICAgICAgYmFzaF9jdl9mdW5jX3NpZ3NldGptcD1wcmVzZW50IFwK
PiA+ID4gICAgICAgYmFzaF9jdl9wcmludGZfYV9mb3JtYXQ9eWVzCj4gPiA+Cj4gPiA+IC0jIENh
biBiZSBkcm9wcGVkIHdoZW4gYmFzaCBpcyBidW1wZWQgdG8gNS4zIG9yIG5ld2VyLgo+ID4gPiAt
aWZlcSAoJChCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF8xNSkseSkKPiA+ID4gLUJBU0hfQ09O
Rl9FTlYgKz0gQ0ZMQUdTPSIkKFRBUkdFVF9DRkxBR1MpIC1zdGQ9Z251MTciCj4gPiA+IC1lbmRp
Zgo+ID4gPiAtCj4gPiA+IC1pZmVxICgkKEJSMl9IT1NUX0dDQ19BVF9MRUFTVF8xNSkseSkKPiA+
ID4gLUJBU0hfQ09ORl9FTlYgKz0gQ0ZMQUdTX0ZPUl9CVUlMRD0iJChIT1NUX0NGTEFHUykgLXN0
ZD1nbnUxNyIKPiA+ID4gLWVuZGlmCj4gPgo+ID4gV2hlbiBob3N0LWdjYyBpcyA+PSAxNSBidXQg
dGFyZ2V0LWdjYyA8IDE1LCB0aGUgYnVpbGQgaXMgZmFpbGluZwo+ID4gYmVjYXVzZSB0aGUgYnVp
bGRjb25mLmggKGluaXRpYWxseSBtYWRlIGZvciB0YXJnZXQpIGlzIHJldXNlZCBmb3IKPiA+IGhv
c3QuIFNvIHdlIG1heSBuZWVkIHRvIGtlZXAgdGhpcyBwcmV2aW91cyBibG9jayBzZXR0aW5nCj4g
PiBDRkxBR1NfRk9SX0JVSUxEIHZhcmlhYmxlLCBhZnRlciBhbGwuCj4gPgo+Cj4gSXQgbG9va3Mg
bGlrZSB3ZSBzdGlsbCBuZWVkIHRoZSBIT1NUX0dDQyB0ZXN0LCBidXQgbm90IHRoZQo+IFRPT0xD
SEFJTl9HQ0MgdGVzdD8gV2l0aCBib3RoIHJlbW92ZWQsIEkgZ2V0IDI4LzMzIGZhaWx1cmVzIHdp
dGgKPiB0ZXN0LXBrZyAtYS4KPgo+IFdpdGgganVzdCB0aGUgdG9vbGNoYWluIGNoZWNrLCBJIGdl
dCAzMy8zMyBmYWlsdXJlcywgYW5kIGp1c3QgdGhlIGhvc3QKPiBjaGVjayBJIGdldCAzLzMzIGZh
aWx1cmVzLiBJdCBsb29rcyBsaWtlIHRob3NlIHRocmVlIGZhaWx1cmVzIGFyZQo+IHN0aWxsIHBy
ZXNlbnQgZXZlbiB3aXRoIGJvdGggY2hlY2tzIGluIHBsYWNlLCBzbyBJJ2Qgc2F5IHdlIHN0aWxs
IG5lZWQKPiB0aGUgaG9zdCBjaGVjaywgYnV0IG5vdCB0aGUgdG9vbGNoYWluIGNoZWNrLgo+Cj4g
TXkgYXBvbG9naWVzIGZvciBub3QgcnVubmluZyB0ZXN0LXBrZyBiZWZvcmUgc2VuZGluZyB2Mi4K
Pgo+ID4gPiAtCj4gPiA+ICAjIFRoZSBzdGF0aWMgYnVpbGQgbmVlZHMgc29tZSB0cmlja2VyeQo+
ID4gPiAgaWZlcSAoJChCUjJfU1RBVElDX0xJQlMpLHkpCj4gPiA+ICBCQVNIX0NPTkZfT1BUUyAr
PSAtLWVuYWJsZS1zdGF0aWMtbGluawo+ID4gPgo+ID4gPiAtLS0KPiA+Cj4gPiBDb3VsZCB5b3Ug
aGF2ZSBhIGxvb2ssIHBsZWFzZT8KPiA+Cj4gPiBCZXN0IHJlZ2FyZHMsCj4gPgo+ID4gSnVsaWVu
LgoKQWZ0ZXIgZGlnZ2luZyBpbnRvIHRoaXMgc29tZSBtb3JlLCBpdCBzZWVtcyB0aGUgcmVtYWlu
aW5nIHRocmVlIGJ1aWxkCmZhaWx1cmVzIHdlcmUgaW50cm9kdWNlZCBieSB0aGUgbmV3IHZlcnNp
b24uIEkgd2FzIGFibGUgdG8gcGF0Y2ggb3V0Cm9uZSBmYWlsdXJlIHByZXR0eSBlYXNpbHksIGJ1
dCB0aGVyZSBhcmUgYSBmZXcgYWRkaXRpb25hbCBwcm9ibGVtcwp0aGF0IGFyZW4ndCBhcyBxdWlj
ayB0byByZXNvbHZlLiBUaGlzIG1pZ2h0IG5lZWQgcmV2aXNpdGVkIGFmdGVyIGEgZmV3CnBhdGNo
ZXMgbGFuZC4KCkJlc3QsCkpvc2VwaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
