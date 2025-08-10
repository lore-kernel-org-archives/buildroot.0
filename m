Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6167AC87FCA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 15:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34F25822C1;
	Sun, 10 Aug 2025 15:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CcXzHB-tUl_W; Sun, 10 Aug 2025 15:18:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38E59822C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38E59822C5;
	Sun, 10 Aug 2025 15:18:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DDB3F31
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 15:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3F0940A9B
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 15:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sm8bNVHpdo5g for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 15:18:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AAB8640B37
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAB8640B37
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AAB8640B37
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 15:18:52 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-458bc3ce3beso21204865e9.1
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 08:18:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754839130; x=1755443930;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yasG9+6baIwQ26yFAiWqQFfiW0fVKqL7MWeBpuXWpG4=;
 b=kvZn6t0lipozP0Z9GOD4qxXCCB4yu6qJU0BXIEd2OHL++rNR1hNpCOylB2l+bV42WA
 AenqCoxDpgHVexhdr7m67CT7rnK/gRGWFxRAYMBafnbhX6NTdrt0qLL8sq76FlWZg4pj
 0kIAkPhomVpkfssCvaTo01H6MeDrjaqSL8fBdhRN74XAGIdF3zSk8HWhDFjwyGhzhSKs
 hZ83fMg3r2/ctn5nBb2t2sLv5c5J+oT/1rm5Ftp25JoN+n2bCppBwXdE3vGJ/U4DprCs
 iHLc/Q8Ql/eNAyPM98GYRTYeYWZYW7BS2db/cvlSfsY5qfe/+EM/EA89YMy4FdzPzAhl
 Ybsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYrsqr7luzr0j9sR37DkQKXtv34BaalG4lW7DUG0+BwdjhyKfvBoTM4qkQ+wjz3qykEEEqemZx+aE=@buildroot.org
X-Gm-Message-State: AOJu0Yxgc9k3DNsIZ1FauXfGTZEUmSqluX3+2D5Rt3XPu0HZFNmpvSse
 E554pzEsB1M/uCIOwg6Yh/EDZ6teMHzY+smsQi683Mztw4XuKujYfFbB7QWvQJJtermQrCtCWHx
 l3cpo
X-Gm-Gg: ASbGnctis423IA7GJ2i3Rhj21V1RgPMZlOJTv+KiwBbEhJMMGXnLZcaxAbQ6hLxdNEm
 Q2ogPtsgXp8KqYjQqKxR045DzpDHBEYw4YKLm9rdjEhtOC/LsCQ12oxwh1ACIgP9nwtZg9AqcHW
 4Eo6rD+2VHqnRoaEjou842GNGaQMiVVQRSyH2bhxTVkj8/NKbvvdQRDjZYtqO8KImxAyeGUPafx
 WwQjl0Rz7ZRwAmuP1oq3yxZ5SLAWMZvsfwuhz6eZw67toKZKcI86vKZExLBSgcC28A2hatYA8fA
 psy8re2pPn4Mno8wL/Bc9fXVoN3kOXHDJcFlGKX4daLoXBNksRGXvHnEPvceHMvd3rtRX/XWMaj
 Es9AGkUvreHfkZ+Hqn+ty90Ml80mm0q8JZDTleAAUV39PbJlubGFeliYGJfEHD1mzyvuq/6p0QR
 TiZgWrxLBvvlx2J+UOI+Uns9PPLiYnuR/FkJLGyClMjW9eizkgEHBNHH2Q9Zx+
X-Google-Smtp-Source: AGHT+IHVYCZGuwvpS4iLISRv/F4sd5LlySPSqVOfokH3ZlNzahxsIDj4rwT4FJ3cKC1ghg+h0/0SQg==
X-Received: by 2002:a05:600c:c1d7:20b0:459:e440:61c7 with SMTP id
 5b1f17b1804b1-459f4f3b4b1mr60639135e9.31.1754839130373; 
 Sun, 10 Aug 2025 08:18:50 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5879d76sm231850025e9.24.2025.08.10.08.18.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Aug 2025 08:18:50 -0700 (PDT)
Message-ID: <32544038-2266-4c1f-856d-755e9d04e1c5@smile.fr>
Date: Sun, 10 Aug 2025 17:18:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20250731165700.1426768-1-thomas.perale@mind.be>
Content-Language: fr
In-Reply-To: <20250731165700.1426768-1-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754839130; x=1755443930; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yasG9+6baIwQ26yFAiWqQFfiW0fVKqL7MWeBpuXWpG4=;
 b=cLryz7Fb9fjZjre+yxx6DczegeKcRW/9rpiecyPu5hJSo2hmUw4YcUxASHpjychvG7
 Gn7mCQkn3UnMLulY6PT3VbXE6ven/zGqg0tFaTPogx9vFjZK1RS1gOxoc1x78tRFpg6v
 a5z0ZQ8styf8SP1kPTOJxroQ3E+fgZYbSQMmA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=cLryz7Fb
Subject: Re: [Buildroot] [PATCH 1/1] package/janet: fix build w/ musl
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAzMS8wNy8yMDI1IMOgIDE4OjU3LCBUaG9tYXMgUGVyYWxl
IHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBTaW5jZSB0aGUgY29tbWl0IFsxXSB0aGUgamFu
ZXQgcGFja2FnZSBzdGFydGVkIGZhaWxpbmcgb24gdGhlCj4gYXV0b2J1aWxkZXIgd2hlbiB1c2lu
ZyBtdXNsIGxpYmM6Cj4gCj4gYGBgCj4gWzUwLzU2XSBDb21waWxpbmcgQyBvYmplY3QgbGliamFu
ZXQuc28uMS4zNS4yLnAvbWVzb24tZ2VuZXJhdGVkXy4uX2phbmV0LmMubwo+IEZBSUxFRDogbGli
amFuZXQuc28uMS4zNS4yLnAvbWVzb24tZ2VuZXJhdGVkXy4uX2phbmV0LmMubwo+IC93b3JrZGly
L2luc3RhbmNlLTAvb3V0cHV0LTEvaG9zdC9iaW4vYXJtZWItYnVpbGRyb290LWxpbnV4LW11c2xl
YWJpLWdjYyAtSWxpYmphbmV0LnNvLjEuMzUuMi5wIC1JLiAtSS4uIC1JLi4vc3JjL2luY2x1ZGUg
LWZkaWFnbm9zdGljcy1jb2xvcj1hbHdheXMgLVdhbGwgLVdpbnZhbGlkLXBjaCAtc3RkPWM5OSAt
TzMgLURfTEFSR0VGSUxFX1NPVVJDRSAtRF9MQVJHRUZJTEU2NF9TT1VSQ0UgLURfRklMRV9PRkZT
RVRfQklUUz02NCAtTzEgLWczIC1mUElDIC1wdGhyZWFkIC1mdmlzaWJpbGl0eT1oaWRkZW4gLU1E
IC1NUSBsaWJqYW5ldC5zby4xLjM1LjIucC9tZXNvbi1nZW5lcmF0ZWRfLi5famFuZXQuYy5vIC1N
RiBsaWJqYW5ldC5zby4xLjM1LjIucC9tZXNvbi1nZW5lcmF0ZWRfLi5famFuZXQuYy5vLmQgLW8g
bGliamFuZXQuc28uMS4zNS4yLnAvbWVzb24tZ2VuZXJhdGVkXy4uX2phbmV0LmMubyAtYyBqYW5l
dC5jCj4gc3JjL2NvcmUvdXRpbC5jOiBJbiBmdW5jdGlvbiAnamFuZXRfc3RyZXJyb3InOgo+IHNy
Yy9jb3JlL3V0aWwuYzo5Nzc6MTI6IGVycm9yOiByZXR1cm5pbmcgJ2ludCcgZnJvbSBhIGZ1bmN0
aW9uIHdpdGggcmV0dXJuIHR5cGUgJ2NvbnN0IGNoYXIgKicgbWFrZXMgcG9pbnRlciBmcm9tIGlu
dGVnZXIgd2l0aG91dCBhIGNhc3QgWy1XaW50LWNvbnZlcnNpb25dCj4gWzUxLzU2XSBDb21waWxp
bmcgQyBvYmplY3QgamFuZXQtbmF0aXZlLnAvbWVzb24tZ2VuZXJhdGVkXy4uX2phbmV0LmMubwo+
IGBgYAo+IAo+IFRoZSBjb21taXQgWzJdIGludHJvZHVjZWQgdGhlIGlzc3VlIGluIHYxLjM1LjAs
IHRoZSBgc3RyZXJyb3JgIGZ1bmN0aW9uCj4gaGFzIGRpZmZlcmVudCBkZWZpbml0aW9uIG9uIGds
aWJjIGNvbXBhcmVkIHRvIG11c2wuIFRoaXMgaXNzdWUgaGFzIGJlZW4KPiBhZGRyZXNzZWQgaW4g
Y29tbWl0IFszXS4gVGhpcyBwYXRjaCBhZGQgdGhlIHVwc3RyZWFtIGNvbW1pdCBbM10uCj4gCj4g
WzFdIDMxMjEyYzRjNTggcGFja2FnZS9qYW5ldDogYnVtcCB0byB2ZXJzaW9uIDEuMzUuMgo+IFsy
XSBodHRwczovL2dpdGh1Yi5jb20vamFuZXQtbGFuZy9qYW5ldC9jb21taXQvODMzNDUwNGY0ZTVh
YTI1MzUwMmE0NWRiM2VlYjRkYjI2NTQ5MGI0ZQo+IFszXSBodHRwczovL2dpdGh1Yi5jb20vamFu
ZXQtbGFuZy9qYW5ldC9jb21taXQvYTVkNmIyMjgzODM0NDIyYTlmYTllNzliNWM3YWQ5YjkzMmI1
MjU2OAo+IAo+IEZpeGVzOiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMv
ZmYxL2ZmMWQ2MDYzYzFhNzlkMTdjZmE5OTEwY2NhODI0ZTcwNGE0YTBjNjcvYnVpbGQtZW5kLmxv
Zwo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXJhbGUgPHRob21hcy5wZXJhbGVAbWluZC5iZT4K
CkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gLS0t
Cj4gIC4uLmhlY2stZm9yLWdsaWJjLWluc3RlYWQtb2YtZ251LXNvdXJjZS5wYXRjaCB8IDI2ICsr
KysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvamFuZXQvMDAwMS1jaGVjay1mb3ItZ2xpYmMtaW5z
dGVhZC1vZi1nbnUtc291cmNlLnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvamFuZXQv
MDAwMS1jaGVjay1mb3ItZ2xpYmMtaW5zdGVhZC1vZi1nbnUtc291cmNlLnBhdGNoIGIvcGFja2Fn
ZS9qYW5ldC8wMDAxLWNoZWNrLWZvci1nbGliYy1pbnN0ZWFkLW9mLWdudS1zb3VyY2UucGF0Y2gK
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjVlZTAyMWU2NTgKPiAt
LS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9qYW5ldC8wMDAxLWNoZWNrLWZvci1nbGliYy1p
bnN0ZWFkLW9mLWdudS1zb3VyY2UucGF0Y2gKPiBAQCAtMCwwICsxLDI2IEBACj4gK0Zyb20gYTVk
NmIyMjgzODM0NDIyYTlmYTllNzliNWM3YWQ5YjkzMmI1MjU2OCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKPiArRnJvbTogQ2FsdmluIFJvc2UgPGNhbHNyb3NlQGdtYWlsLmNvbT4KPiArRGF0ZTog
RnJpLCAyMSBKdW4gMjAyNCAxNzoxNzoyMiAtMDUwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIENoZWNr
IGZvciBfX0dMSUJDX18gaW5zdGVhZCBvZiBfR05VX1NPVVJDRQo+ICsKPiArbXVzbCBkb2Vzbid0
IG9iZXkgdGhpcyBiZWhhdmlvci4KPiArCj4gK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20v
amFuZXQtbGFuZy9qYW5ldC9jb21taXQvYTVkNmIyMjgzODM0NDIyYTlmYTllNzliNWM3YWQ5Yjkz
MmI1MjU2OAo+ICtTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGVyYWxlIDx0aG9tYXMucGVyYWxlQG1p
bmQuYmU+Cj4gKy0tLQo+ICsgc3JjL2NvcmUvdXRpbC5jIHwgMiArLQo+ICsgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gKwo+ICtkaWZmIC0tZ2l0IGEvc3Jj
L2NvcmUvdXRpbC5jIGIvc3JjL2NvcmUvdXRpbC5jCj4gK2luZGV4IDRiYjM3YWJjNS4uNmNiNTY3
NmUwIDEwMDY0NAo+ICstLS0gYS9zcmMvY29yZS91dGlsLmMKPiArKysrIGIvc3JjL2NvcmUvdXRp
bC5jCj4gK0BAIC05NzIsNyArOTcyLDcgQEAgY29uc3QgY2hhciAqamFuZXRfc3RyZXJyb3IoaW50
IGUpIHsKPiArICNpZmRlZiBKQU5FVF9XSU5ET1dTCj4gKyAgICAgLyogTWljcm9zb2Z0IHN0cmVy
cm9yIHNlZW1zIHNhbmUgaGVyZSBhbmQgaXMgdGhyZWFkIHNhZmUgYnkgZGVmYXVsdCAqLwo+ICsg
ICAgIHJldHVybiBzdHJlcnJvcihlKTsKPiArLSNlbGlmIGRlZmluZWQoX0dOVV9TT1VSQ0UpCj4g
KysjZWxpZiBkZWZpbmVkKF9fR0xJQkNfXykKPiArICAgICAvKiBTZWUgaHR0cHM6Ly9saW51eC5k
aWUubmV0L21hbi8zL3N0cmVycm9yX3IgKi8KPiArICAgICByZXR1cm4gc3RyZXJyb3JfcihlLCBq
YW5ldF92bS5zdHJlcnJvcl9idWYsIHNpemVvZihqYW5ldF92bS5zdHJlcnJvcl9idWYpKTsKPiAr
ICNlbHNlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
