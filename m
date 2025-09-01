Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FB0CA0FFD
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 09:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4061C6133F;
	Mon,  1 Sep 2025 09:02:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DyEJO0HMzzl0; Mon,  1 Sep 2025 09:02:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 376C5613E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 376C5613E5;
	Mon,  1 Sep 2025 09:02:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 30529169
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15395414BF;
 Mon,  1 Sep 2025 09:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WN9vMK72XTzh; Mon,  1 Sep 2025 09:01:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 188AF413F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 188AF413F9
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 188AF413F9
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:40 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45b8b2712d8so10959915e9.3
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 02:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756717298; x=1757322098;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Evi66PeLQ+A2PTBlaFmUNkHNux9xDqYtj09RIc6oDGY=;
 b=m+IvyEx9Tf//j6RS1hEzu2WpzzGmHwazPjgZ/3U0/fKxK/o0huoACKot0DOMBMuH/P
 W9/0rG5M/EwZNaIasr2c+LuaxJieEoHOLjejcfahozmKM/H00Ue+QIMIIwnYIY7q575x
 bpCgzu+lAdML80FBkctBOPu4s7AXbBuOC+u2WMnaO8xZ6KZ9sItlswrLkq4ivgbOyYnR
 ouHPjyL8Rh87jmE2eCjHDml/bN6HN4kP59CuqCOBpBKL/xJvkQW/FsUmnO8MI12PPd9Y
 q+1p/SWrbL6lLVE6dugme5ElsGdrw1KYqqoyNqqvhdN+6+W/LnFZ2FLXqqloRec3sByh
 IrVw==
X-Gm-Message-State: AOJu0YzQVffZ+LBW/sQmf5aAB2/CbJC+fORGYG+wld5opHw8R9m560xa
 B4kMyCjMrjntMo8k4awwAindvWyXwZoUwdmK0BCg76P5DFAxnoxIIs93YwAdMQ==
X-Gm-Gg: ASbGnctI+rYLxhD9IJ36hrhiKmRa/0LE+j9AsBDjbFf2ePBS7WuGUNQwrignC9t1+HW
 8kaZXPC+TbCfUflEAwPJ+xR83QmDJRXi6nyuZAkXWFqDKHHntpg5e6wgQEKk+XoP+povLfZPcPE
 dU1ZhnUJvVkMu0lD/1xbv0PzUMnz3aL/c+ziIap8+ZdIEENvmRQzlwBvxO7Pnv3srCcCFog996t
 gRMeFgX5U7tOKLr6qXJAsWr4AFg6Gnr0y9SiZ1ZMCBY3D6+jGsZnOudMS1+M3iGW5QUv1NJEo/A
 x0e1nx0p+iMxvnjrTA1MMzE9nO5fb04YLIWa6pHDFIAIX6UlsP18OgKkZ4w7WHlca0r6PJ6KrBS
 1nM1foFsLQ8BUagaNNvbiUx6f9piBmR2Y3g9GT1eTJB8=
X-Google-Smtp-Source: AGHT+IF3GmqqaYF4KaaS+XBone7tMXcVEwfQBPnyWJ8v47NGM09Ui7CNr3LvUVe2cQ9Yy9JfqFE30w==
X-Received: by 2002:a05:600c:1386:b0:45b:81ad:336 with SMTP id
 5b1f17b1804b1-45b855340e4mr67479125e9.16.1756717297987; 
 Mon, 01 Sep 2025 02:01:37 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b8525a94bsm98171055e9.15.2025.09.01.02.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:01:37 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Arnout Vandecappelle <arnout@mind.be>, Norbert Lange <nolange79@gmail.com>,
 Sen Hastings <sen@hastings.org>
Date: Mon,  1 Sep 2025 11:01:27 +0200
Message-ID: <5cefed1c9f4e76ba81b1263b7278ecc2e488bb49.1756717276.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756717276.git.yann.morin.1998@free.fr>
References: <cover.1756717276.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756717298; x=1757322098; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Evi66PeLQ+A2PTBlaFmUNkHNux9xDqYtj09RIc6oDGY=;
 b=TEIbfbpkjyDmeQ7flnlE6rpBbd++84ppdCItCKPUmkdgLVWOOmj+jjWh1jzgnhkifp
 obpY7crSZVn+fGcelWdNNdvMJNe1NqhgjqipLK4tftVKx0YQXoWc8wYV8gxzz0DLCRzN
 0Lq8b7ree+Gi5H3zbdBCyvG697f7jsNOI6CHYOGa+UxJaflhI+MQQTdkOV7SkJvwBhdw
 QgVMYH0RMzA7NmSW1hXwB3r3/tL+lEE6ny3PoIwwNu/KN+o+ngXLHJgMjhCkEEJD9UAZ
 bzaj4Ej/ZRyjeH2YGA/TUEz8jqeQMXl+vVvUOpGp4JSAYEtYXvbuqUiTGlyi4Y2xN0AP
 sMhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TEIbfbpk
Subject: [Buildroot] [PATCH 18/18 v3] package/systemd: require merged-bin
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2luY2UgdmVyc2lvbiAyNTYsIHN5c3RlbWQgd2lsbCB0YWludCB0aGUgc3lzdGVtIGlmIC91c3Iv
YmluIGFuZAovdXNyL3NiaW4gYXJlIG5vdCBtZXJnZWQsIGtub3duIGFzIG1lcmdlZC1iaW46Cgog
ICAgIyBzeXN0ZW1jdGwgLS1uby1wYWdlciBzdGF0dXMKICAgIOKXjyBidWlsZHJvb3QKICAgICAg
ICBTdGF0ZTogcnVubmluZwogICAgICAgIFVuaXRzOiAxNjYgbG9hZGVkIChpbmNsLiBsb2FkZWQg
YWxpYXNlcykKICAgICAgICAgSm9iczogMCBxdWV1ZWQKICAgICAgIEZhaWxlZDogMCB1bml0cwog
ICAgICAgIFNpbmNlOiBNb24gMjAyNS0wNy0wNyAxOTo0ODowNSBVVEM7IDE5cyBhZ28KICAgICAg
c3lzdGVtZDogMjU3LjcKICAgICAgVGFpbnRlZDogdW5tZXJnZWQtYmluCiAgICAgICBDR3JvdXA6
IC8KICAgICAgICAgICAgICAg4pSc4pSAaW5pdC5zY29wZQogICAgICAgICAgICAgICBbLi4uXQoK
QWx0aG91Z2ggdGhpcyBpcyBub3QgeWV0IGFuIGVycm9yLCBpdCB3aWxsIGJlIGluIHRoZSBmdXR1
cmUuCgpUbyBiZSBhcyByZWFkeSBhcyB3ZSBjYW4gYmUgd2hlbiB0aGF0IGhhcHBlbnMsIGZvcmNp
Ymx5IGVuYWJsZQptZXJnZWQtYmluLCBsaWtlIHdlIGRpZCB3aGVuIHdlIGluaXRpYWxseSBhZGRl
ZCBtZXJnZWQtdXNyIChleGNlcHQKdGhpcyB0aW1lIHdlIGNhcnJ5IHRoZSBzZWxlY3QgZnJvbSBz
eXN0ZW1kLCBldmVuIHRob3VnaCBpdCBpcyBub3QKeWV0IHN0cmljdGx5IHJlcXVpcmVkLCByYXRo
ZXIgdGhhbiBmcm9tIHRoZSBpbml0IGVudHJ5KS4KCkV4dGVuZCB0aGUgcnVudGltZSB0ZXN0IHRv
IGNhdGNoIGFueSB0YWludGVkIGZsYWcuCgpTaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5
YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KQ2M6IEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRA
bWluZC5iZT4KQ2M6IE5vcmJlcnQgTGFuZ2UgPG5vbGFuZ2U3OUBnbWFpbC5jb20+CkNjOiBTZW4g
SGFzdGluZ3MgPHNlbkBoYXN0aW5ncy5vcmc+CgotLS0KQ2hhbmdlcyB2MSAtPiB2MjoKICAtIGFk
ZCB0aGUgcnVudGltZSB0ZXN0CiAgICA9PiBkbyBub3QgYWRkIHRoZSBBY2tlZC1ieSBBcm5vdXQg
Z2F2ZSBvbiB2MSwgc2luY2UgdGhlIHJ1bnRpbWUKICAgIHRlc3Qgd2FzIG5vdCByZXZpZXdlZCB0
aGVuLgotLS0KIHBhY2thZ2Uvc3lzdGVtZC9Db25maWcuaW4gICAgICAgICAgICAgICAgICB8ICAx
ICsKIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9pbml0L3Rlc3Rfc3lzdGVtZC5weSB8IDE5ICsrKysr
KysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL3BhY2thZ2Uvc3lzdGVtZC9Db25maWcuaW4gYi9wYWNrYWdlL3N5c3RlbWQvQ29uZmln
LmluCmluZGV4IDBjYjEwZWEzZDguLjkzMTEzNDkxMWEgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvc3lz
dGVtZC9Db25maWcuaW4KKysrIGIvcGFja2FnZS9zeXN0ZW1kL0NvbmZpZy5pbgpAQCAtMjUsNiAr
MjUsNyBAQCBtZW51Y29uZmlnIEJSMl9QQUNLQUdFX1NZU1RFTUQKIAlkZXBlbmRzIG9uIEJSMl9U
T09MQ0hBSU5fR0NDX0FUX0xFQVNUXzgKIAlkZXBlbmRzIG9uIEJSMl9IT1NUX0dDQ19BVF9MRUFT
VF84ICMgaG9zdC1zeXN0ZW1kCiAJc2VsZWN0IEJSMl9ST09URlNfTUVSR0VEX1VTUgorCXNlbGVj
dCBCUjJfUk9PVEZTX01FUkdFRF9CSU4KIAlzZWxlY3QgQlIyX1BBQ0tBR0VfSEFTX1VERVYKIAlz
ZWxlY3QgQlIyX1BBQ0tBR0VfREJVUyBpZiAhQlIyX1BBQ0tBR0VfREJVU19CUk9LRVIgIyBydW50
aW1lCiAJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQkNBUApkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL2luaXQvdGVzdF9zeXN0ZW1kLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2lu
aXQvdGVzdF9zeXN0ZW1kLnB5CmluZGV4IDA1YTY1MjIzYjMuLjdmZGQ1ZDE3OTggMTAwNjQ0Ci0t
LSBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9pbml0L3Rlc3Rfc3lzdGVtZC5weQorKysgYi9zdXBw
b3J0L3Rlc3RpbmcvdGVzdHMvaW5pdC90ZXN0X3N5c3RlbWQucHkKQEAgLTMxLDYgKzMxLDI1IEBA
IGNsYXNzIEluaXRTeXN0ZW1TeXN0ZW1kQmFzZShJbml0U3lzdGVtQmFzZSk6CiAgICAgICAgICAg
ICBzZWxmLnN0YXJ0X2VtdWxhdG9yKGZzKQogICAgICAgICBzZWxmLmNoZWNrX2luaXQoIi9saWIv
c3lzdGVtZC9zeXN0ZW1kIikKIAorICAgICAgICAjIFRlc3QgdGhlcmUgaXMgbm8gdGFpbnRlZCBm
bGFnLgorICAgICAgICBvdXRwdXQsIHJldCA9IHNlbGYuZW11bGF0b3IucnVuKCJzeXN0ZW1jdGwg
LS1uby1wYWdlciBzdGF0dXMiKQorICAgICAgICBzZWxmLmFzc2VydEVxdWFsKHJldCwgMCwgZiIn
c3lzdGVtY3RsIHN0YXR1cycgZmFpbGVkIHdpdGggZXhpdCBjb2RlIHtyZXR9LCB3aXRoOlxue291
dHB1dH0iKQorICAgICAgICB0cnk6CisgICAgICAgICAgICAjICdzdXBwb3J0LWVuZGVkJyB0YWlu
dGVkIGZsYWcgaXMgb25seSBzZXQgYmFzZWQgb24gdGhlCisgICAgICAgICAgICAjIFNVUFBPUlRf
RU5EIHZhcmlhYmxlIGluIC9ldGMvb3MtcmVsZWFzZTsgYXMgd2UgZG9uJ3Qgc2V0CisgICAgICAg
ICAgICAjIGl0IGluIEJ1aWxkcm9vdCwgd2UgY2FuJ3QgZ2V0IHRoYXQgZmxhZyBpbiB0aGUgcnVu
dGltZQorICAgICAgICAgICAgIyB0ZXN0cywgZXZlbiBvbiBvdXIgbWFpbnRlbmFuY2UgYnJhbmNo
ZXMsIHNvIHdlIGRvbid0IG5lZWQKKyAgICAgICAgICAgICMgdG8gZmlsdGVyIGl0IG91dC4KKyAg
ICAgICAgICAgIHRhaW50ZWRfZmxhZ3MgPSBbCisgICAgICAgICAgICAgICAgIiIuam9pbihsaW5l
LnNwbGl0KCI6IilbMTpdKS5zdHJpcCgpCisgICAgICAgICAgICAgICAgZm9yIGxpbmUgaW4gb3V0
cHV0CisgICAgICAgICAgICAgICAgaWYgbGluZS5zdHJpcCgpLnN0YXJ0c3dpdGgoIlRhaW50ZWQ6
ICIpCisgICAgICAgICAgICBdWzBdCisgICAgICAgICAgICByYWlzZSBSdW50aW1lRXJyb3IoZiJU
YWludGVkIGZsYWdzOiB7dGFpbnRlZF9mbGFnc30iKQorICAgICAgICBleGNlcHQgSW5kZXhFcnJv
cjoKKyAgICAgICAgICAgICMgTm8gdGFpbnRlZCBmbGFnIFxvLworICAgICAgICAgICAgcGFzcwor
CiAgICAgICAgICMgVGVzdCBhbGwgdW5pdHMgYXJlIE9LCiAgICAgICAgIG91dHB1dCwgXyA9IHNl
bGYuZW11bGF0b3IucnVuKCJzeXN0ZW1jdGwgLS1uby1wYWdlciAtLWZhaWxlZCAtLW5vLWxlZ2Vu
ZCIpCiAgICAgICAgIHNlbGYuYXNzZXJ0RXF1YWwobGVuKG91dHB1dCksIDApCi0tIAoyLjUxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
