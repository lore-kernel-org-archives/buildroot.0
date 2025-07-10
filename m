Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42EAC83F20
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 20:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9933E820F5;
	Thu, 10 Jul 2025 20:23:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aczxolt6Ze0b; Thu, 10 Jul 2025 20:23:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EE5081959
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EE5081959;
	Thu, 10 Jul 2025 20:23:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 644DB114
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5586E40B3C;
 Thu, 10 Jul 2025 20:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J5CIGB7ftEN1; Thu, 10 Jul 2025 20:23:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9338840111
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9338840111
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9338840111
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:11 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a6d1369d4eso845197f8f.2
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 13:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752178989; x=1752783789;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qctlz4ZzSvD0dbKtrO86rafr5JeHjQLwUnE5NdlFQv0=;
 b=EK3lI6DeRW8AW4THXbfbF0L/RHP4q6Q6Oi/ipaN9K7RRTBL5l4rfF5Jey1C2NsKVzs
 s20XGv///1IY8isqduMWdKCBLS6Z7ZIlS8rjc0XbW8zCMKKKPrIyjzoWXSUTic+jHmGu
 6i3V9UQywkMQ84/SWIOpi5gBGq1LY4Lt+diHNZ/EBbKNTLCPatcqBgcQjXflZ3zehYC+
 ESSI3qFQ0pU7pGpS7ym4lhq1zU+7W/9VS40U+tM1BvabhJ4qgiunCIjpdxXXpOGmKLks
 6ZmA+v6bDMjTV84dXbmcTZsAKmSLXjBfsG7KNcOyWa04DVuoEU+qXWYoly4DZXrC3aMC
 W3dA==
X-Gm-Message-State: AOJu0Ywe/r4cE86oGTV8q+fjnn0M5olABna/gbDKNqD8w2MqFNEhdbYF
 ixCKPJyJQ6RsXRW2Eaz/55Fdne2OFanyqkJU85gJjBzPs1veIKf0AnpPxZj+aQ==
X-Gm-Gg: ASbGnctT+BmwMH7g4sluvAlVMAAzZsygsJoI3fGmnC6XlDGJngBXSU7AxjWikBusmn2
 rJCaMmzZQL/fFpmOMQCRc12r6GFOGehjx3tKa0/TILKuiIrrJXk5ZpY5r+tOnrGa4TXnNPzuBcJ
 PutyV6FX4sEXhoyDtuF9nmAqV8kRApMGEt6DfRo8zcZKPIzbSctu2caobP0zmUQdheyD1u5VqQ4
 zAEhnTHSUaVw1V0Md0/sHqMGsaov/ttmVp+w4ouCqQQ8OzI/dhOJ5o3BiH2bX9hKesUPHyr8zss
 +j2tVEFJmNULwoxSn7xhPGJI7LLjhnBIU63Cft1w18o7Kl0FjB2rxXrzEsPnZQQM8qr8j3xz
X-Google-Smtp-Source: AGHT+IEYdb/E3JIIuQzRwxHsJDEDPaWDBKmiRJliPV4TrpYodLESUySklCvMwn3xXOyKzMQXwFQ2xQ==
X-Received: by 2002:a05:6000:280e:b0:3a4:eecf:b8cb with SMTP id
 ffacd0b85a97d-3b5f189acfcmr529099f8f.28.1752178989534; 
 Thu, 10 Jul 2025 13:23:09 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1997sm2742694f8f.10.2025.07.10.13.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 13:23:09 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Arnout Vandecappelle <arnout@mind.be>, Norbert Lange <nolange79@gmail.com>,
 Sen Hastings <sen@hastings.org>
Date: Thu, 10 Jul 2025 22:22:59 +0200
Message-ID: <dfafeab5e93aefb72c1fc4e5b0a54fcc253708e2.1752178975.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752178975.git.yann.morin.1998@free.fr>
References: <cover.1752178975.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752178989; x=1752783789; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qctlz4ZzSvD0dbKtrO86rafr5JeHjQLwUnE5NdlFQv0=;
 b=BAWCRnIah056coU1Flvz/bD98gU/pHQTkvhGuAzGX1i1ni6y6D3ug+ob5VtT9Jb/4R
 OOMWM2PNBFFVe1sO449inXUBHkHG7x/GGD+osd/9gDv3i/2j59QVhA5CJiyUG/OCg1jd
 LKzabGQuTiwhC2a2wzdfWromU3WCl0ARAZNO2xYvKAY4/0rE8fgt2eTWpXBUjLaKRVfl
 qHK7Kvx1lEpPCPhpQ9NwF2GU43JF6OuGtoLjoazNOFItAWvzMMqgz9r5FGEsNrrXOVCb
 11Wn6I0T8RKpdGcIZfI6dG5uZBDdxcWW+DGpcH/cPfcXEeDKFGcnaR1QesCZ7NfSIz/+
 NXFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BAWCRnIa
Subject: [Buildroot] [PATCH 17/17 v2] package/systemd: require merged-bin
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
ZCIpCiAgICAgICAgIHNlbGYuYXNzZXJ0RXF1YWwobGVuKG91dHB1dCksIDApCi0tIAoyLjQ3LjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
