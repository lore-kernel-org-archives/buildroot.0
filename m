Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27576C48BC3
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 09:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B74E640785;
	Mon, 19 Feb 2024 09:49:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q-Ailz-33Whq; Mon, 19 Feb 2024 09:49:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97CD340745
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97CD340745;
	Mon, 19 Feb 2024 09:49:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7313C1BF5E9
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 09:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6096760ACF
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 09:49:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VMMeRo0yb6I3 for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 09:49:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 26814605FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26814605FE
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26814605FE
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 09:49:03 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d180d6bd32so39558671fa.1
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 01:49:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708336141; x=1708940941;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7emd5sqNYGkPzrSHD4WKx8MG6PrGTs5ztEljpj9zDk8=;
 b=sQ7avsMGVg1xP7DzgB0trs57rH2zBJHbBxDS39IYf56vViyCFJUxvSf56ESZHesS9U
 Rxl6v/PX5M842pVZDFyrtskpScEH3Ky7HuJ/sMzixaAeH7SBfzslRBrZhO6Hg50o//ul
 e63lekQTioaog0I6eGaOX5iljJFFeTw/4zON6X8JcVjzP5UgrDOSjEVHweeZS7fVEYrh
 diIr3lEW3R95tjVl8+yqD1PNdYJWPLAMe9mF168WllkIEy9lOUh2erfLdIHqxlKIHAu1
 FtVzTm2GDcXSOJrDvfxCg6bnmpMmihLDyZDsXJSVVTwvQ/J5l3AiOnehcTZd8N3nMH0y
 OIFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdlKQ0UjK5y4OKkVFgjwbPboAJ62aazcCWzxmEaln57nUahj7N1FyJgaLXWcQq4Eono18K7eE7KeRJu4YyK7PrCZLG8tPS2g==
X-Gm-Message-State: AOJu0YxZoeSoUy/M7bZ9gSVh2FLSSYQeHqh0NONEgSpuOKZDsu9CjW+T
 GprzxIUEDgXvwvK+OT4KjmJy4MrCp/iUz8c7otnB+/w3IgmMfCkwQhFeaW7QJaw=
X-Google-Smtp-Source: AGHT+IH4EkxlvvpJQkZomc+mBqYKl9N4sD79IPUPCNT4dv90Hknw156m8dz0C7KI7mfIgGNa/Z0Prw==
X-Received: by 2002:a2e:a589:0:b0:2d2:c80:fc7f with SMTP id
 m9-20020a2ea589000000b002d20c80fc7fmr9427657ljp.6.1708336140844; 
 Mon, 19 Feb 2024 01:49:00 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 b7-20020adfe647000000b0033b406bc689sm9944730wrn.75.2024.02.19.01.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 01:49:00 -0800 (PST)
Message-ID: <5f007c47-0c4c-438b-8978-4fe6e2515db1@smile.fr>
Date: Mon, 19 Feb 2024 10:48:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-7-dario.binacchi@amarulasolutions.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240217160244.1320482-7-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708336141; x=1708940941;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7emd5sqNYGkPzrSHD4WKx8MG6PrGTs5ztEljpj9zDk8=;
 b=ksWBYeqsGy8kMk/4pVT4vtuxpefvpy+JrM5nALw/DszXDrYsGzguWhxs+yT9vHIg95
 nNI/i8hweM7MP7W7qvTCS6NXJPk77Q2L2PoofTfSrNn1cg3xDXWKoJkc3Rc/NTmICLa8
 //Pv7Vr8+h+nxkuosRorbzoWhtbQ5w0Zjdr+v1bPIH5dyGHHSshidJ0ZEW265xG4Ykl0
 GkfAXl5HElku4VvTelICroN5P5lS83IMH7h0+QhVUvFygU7jSJ6cqto159wzINqZE1E5
 WguNgP+hJFs+kdomNQdzTFj0ro0OwN6LkeXELBslU6/RsuTUTxBrFE1p8uBQBqb6pria
 +zSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ksWBYeqs
Subject: Re: [Buildroot] [PATCH v4 06/20] boot/ti-k3-core-secdev: new package
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
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAxNy8wMi8yMDI0IMOgIDE3OjAyLCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IFRoaXMgaXMgYSBzZWN1cml0eSBkZXZlbG9wbWVudCBwYWNrYWdlIGNvbnRhaW5p
bmcgdG9vbHMgZm9yCj4gSGlnaC1TZWN1cml0eShIUykgVEkgSzMgcGxhdGZvcm0gZGV2aWNlcy4K
Ck5vdGU6IHRoaXMgdG9vbCBjYW4gYWxzbyBoYW5kbGUgVEkgImxlZ2FjeSIgcGxhdGZvcm0gc3Vj
aCBBTTU3eHggb3IgQU00M3h4IChub3QKc3VyZSB3ZSByZWFsbHkgd2FudCBkbyB0aGF0KS4KCkNh
biB5b3UgdHJ5IHdpdGhvdXQgdGhpcyBwYWNrYWdlIHdoZW4gdXNpbmcgYmlubWFuPwpUaGlzIHRv
b2wgZG9lc24ndCBzZWVtcyAiZnV0dXJlIHByb29mIi4KCmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5l
dC9waXBlcm1haWwvYnVpbGRyb290LzIwMjQtRmVicnVhcnkvNjg1ODIwLmh0bWwKCkJlc3QgcmVn
YXJkcywKUm9tYWluCgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5i
aW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiAKPiAtLS0KPiAKPiBDaGFuZ2VzIGluIHY0
Ogo+IC0gUmVtb3ZlIHRoZSB0cmFpbGluZyAnLycgYXQgdGhlIGVuZCBvZiB0aGUgdXJsIGluIHRo
ZSBoZWxwIG9mCj4gICBDb25maWcuaW4KPiAtIEZpeGVkIGxpY2Vuc2UgaXNzdWVzCj4gLSBVc2Ug
JChCSU5BUklFU19ESVIpL3RpLWszLWNvcmUtc2VjZGV2IGFzIHRoZSBkaXJlY3Rvcnkgd2hlcmUg
dG8KPiAgIGluc3RhbGwgZmlsZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkg
PGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IC0tLQo+ICBERVZFTE9QRVJT
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gIGJvb3QvQ29uZmln
LmluICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgYm9vdC90aS1rMy1j
b3JlLXNlY2Rldi9Db25maWcuaW4gICAgICAgICAgICAgIHwgIDkgKysrKysrKysKPiAgYm9vdC90
aS1rMy1jb3JlLXNlY2Rldi90aS1rMy1jb3JlLXNlY2Rldi5oYXNoIHwgIDMgKysrCj4gIGJvb3Qv
dGktazMtY29yZS1zZWNkZXYvdGktazMtY29yZS1zZWNkZXYubWsgICB8IDIyICsrKysrKysrKysr
KysrKysrKysKPiAgNSBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBib290L3RpLWszLWNvcmUtc2VjZGV2L0NvbmZpZy5pbgo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgYm9vdC90aS1rMy1jb3JlLXNlY2Rldi90aS1rMy1jb3JlLXNlY2Rldi5oYXNoCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBib290L3RpLWszLWNvcmUtc2VjZGV2L3RpLWszLWNvcmUtc2Vj
ZGV2Lm1rCj4gCj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCj4gaW5kZXgg
MGQxMmMzYWJjYjExLi4zM2Q5OWFiMjQ0MGYgMTAwNjQ0Cj4gLS0tIGEvREVWRUxPUEVSUwo+ICsr
KyBiL0RFVkVMT1BFUlMKPiBAQCAtNzUzLDYgKzc1Myw3IEBAIEY6CXBhY2thZ2UveGluZXRkLwo+
ICBOOglEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+
Cj4gIEY6CWJvYXJkL2JzaC8KPiAgRjoJYm9hcmQvc3RtaWNyb2VsZWN0cm9uaWNzL3N0bTMyZjc2
OS1kaXNjby8KPiArRjoJYm9vdC90aS1rMy1jb3JlLXNlY2Rldi8KPiAgRjoJY29uZmlncy9pbXg4
bW5fYnNoX3NtbV9zMl9kZWZjb25maWcKPiAgRjoJY29uZmlncy9pbXg4bW5fYnNoX3NtbV9zMl9w
cm9fZGVmY29uZmlnCj4gIEY6CWNvbmZpZ3Mvc3RtMzJmNzY5X2Rpc2NvX3NkX2RlZmNvbmZpZwo+
IGRpZmYgLS1naXQgYS9ib290L0NvbmZpZy5pbiBiL2Jvb3QvQ29uZmlnLmluCj4gaW5kZXggZTVm
ZGY3YWQ0MzllLi4xOGE3ZDI2OGY5NWEgMTAwNjQ0Cj4gLS0tIGEvYm9vdC9Db25maWcuaW4KPiAr
KysgYi9ib290L0NvbmZpZy5pbgo+IEBAIC0yMCw2ICsyMCw3IEBAIHNvdXJjZSAiYm9vdC9zNTAw
LWJvb3Rsb2FkZXIvQ29uZmlnLmluIgo+ICBzb3VyY2UgImJvb3Qvc2hpbS9Db25maWcuaW4iCj4g
IHNvdXJjZSAiYm9vdC9zeXNsaW51eC9Db25maWcuaW4iCj4gIHNvdXJjZSAiYm9vdC90aS1rMy1i
b290LWZpcm13YXJlL0NvbmZpZy5pbiIKPiArc291cmNlICJib290L3RpLWszLWNvcmUtc2VjZGV2
L0NvbmZpZy5pbiIKPiAgc291cmNlICJib290L3RpLWszLWltYWdlLWdlbi9Db25maWcuaW4iCj4g
IHNvdXJjZSAiYm9vdC90aS1rMy1yNS1sb2FkZXIvQ29uZmlnLmluIgo+ICBzb3VyY2UgImJvb3Qv
dWJvb3QvQ29uZmlnLmluIgo+IGRpZmYgLS1naXQgYS9ib290L3RpLWszLWNvcmUtc2VjZGV2L0Nv
bmZpZy5pbiBiL2Jvb3QvdGktazMtY29yZS1zZWNkZXYvQ29uZmlnLmluCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLmY3YjRlMjk2MjA0Mgo+IC0tLSAvZGV2L251
bGwKPiArKysgYi9ib290L3RpLWszLWNvcmUtc2VjZGV2L0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEs
OSBAQAo+ICtjb25maWcgQlIyX1RBUkdFVF9USV9LM19DT1JFX1NFQ0RFVgo+ICsJYm9vbCAidGkt
azMtY29yZS1zZWNkZXYiCj4gKwlkZXBlbmRzIG9uIEJSMl9hYXJjaDY0Cj4gKwloZWxwCj4gKwkg
IFRoaXMgcGFja2FnZSBkb3dubG9hZHMgYW5kIGluc3RhbGxzIGRldmVsb3BtZW50IHRvb2xzIGZv
cgo+ICsJICBIaWdoLVNlY3VyaXR5KEhTKSBUSSBLMyBwbGF0Zm9ybXMgKHdoaWNoIGluY2x1ZGUg
QU02MngsCj4gKwkgIEFNNjR4LCBBTTY1eCBhbmQgbW9yZSkuCj4gKwo+ICsJICBodHRwczovL2dp
dC50aS5jb20vY2dpdC9zZWN1cml0eS1kZXZlbG9wbWVudC10b29scy9jb3JlLXNlY2Rldi1rMwo+
IGRpZmYgLS1naXQgYS9ib290L3RpLWszLWNvcmUtc2VjZGV2L3RpLWszLWNvcmUtc2VjZGV2Lmhh
c2ggYi9ib290L3RpLWszLWNvcmUtc2VjZGV2L3RpLWszLWNvcmUtc2VjZGV2Lmhhc2gKPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uZTMwNzRhMzk4ZDYyCj4gLS0t
IC9kZXYvbnVsbAo+ICsrKyBiL2Jvb3QvdGktazMtY29yZS1zZWNkZXYvdGktazMtY29yZS1zZWNk
ZXYuaGFzaAo+IEBAIC0wLDAgKzEsMyBAQAo+ICsjIExvY2FsbHkgY2FsY3VsYXRlZAo+ICtzaGEy
NTYgIGI2ZDNiY2EwZDU2MWQwNTVjNjg2OWM1NTY0YjA2ZjJmYjFiOWY2N2U0ZWYxODBjMmJhZjhh
MTRhNmE2YWZhMDYgIGNvcmUtc2VjZGV2LWszLTA4LjA2LjAwLjAwNy50YXIueHoKPiArc2hhMjU2
ICAzZTVjZjRmNWFiOWYwMzMzZjQ2Y2Q2OGZhYmVkZTNmMjFlNTVkZTFhOWUzYzZhZDY3M2YyNDFm
NDUxNGQ4MzY5ICBtYW5pZmVzdC9rMy1zZWNkZXYtMC4yLW1hbmlmZXN0Lmh0bWwKPiBkaWZmIC0t
Z2l0IGEvYm9vdC90aS1rMy1jb3JlLXNlY2Rldi90aS1rMy1jb3JlLXNlY2Rldi5tayBiL2Jvb3Qv
dGktazMtY29yZS1zZWNkZXYvdGktazMtY29yZS1zZWNkZXYubWsKPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uZjc2NTVhMGZlZmM4Cj4gLS0tIC9kZXYvbnVsbAo+
ICsrKyBiL2Jvb3QvdGktazMtY29yZS1zZWNkZXYvdGktazMtY29yZS1zZWNkZXYubWsKPiBAQCAt
MCwwICsxLDIyIEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyB0aS1rMy1j
b3JlLXNlY2Rldgo+ICsjCj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKwo+ICtUSV9LM19D
T1JFX1NFQ0RFVl9WRVJTSU9OID0gMDguMDYuMDAuMDA3Cj4gK1RJX0szX0NPUkVfU0VDREVWX1NJ
VEUgPSBodHRwczovL2dpdC50aS5jb20vY2dpdC9zZWN1cml0eS1kZXZlbG9wbWVudC10b29scy9j
b3JlLXNlY2Rldi1rMy9zbmFwc2hvdAo+ICtUSV9LM19DT1JFX1NFQ0RFVl9TT1VSQ0UgPSBjb3Jl
LXNlY2Rldi1rMy0kKFRJX0szX0NPUkVfU0VDREVWX1ZFUlNJT04pLnRhci54ego+ICtUSV9LM19D
T1JFX1NFQ0RFVl9JTlNUQUxMX0lNQUdFUyA9IFlFUwo+ICtUSV9LM19DT1JFX1NFQ0RFVl9MSUNF
TlNFID0gQlNELTMtQ2xhdXNlCj4gK1RJX0szX0NPUkVfU0VDREVWX0xJQ0VOU0VfRklMRVMgPSBt
YW5pZmVzdC9rMy1zZWNkZXYtMC4yLW1hbmlmZXN0Lmh0bWwKPiArCj4gK1RJX0szX0NPUkVfU0VD
REVWX0lOU1RBTExfRElSID0gJChCSU5BUklFU19ESVIpL3RpLWszLWNvcmUtc2VjZGV2Cj4gKwo+
ICtkZWZpbmUgVElfSzNfQ09SRV9TRUNERVZfSU5TVEFMTF9JTUFHRVNfQ01EUwo+ICsJbWtkaXIg
LXAgJChUSV9LM19DT1JFX1NFQ0RFVl9JTlNUQUxMX0RJUikKPiArCWNwIC1kcGZyICQoQEQpL2tl
eXMgJChUSV9LM19DT1JFX1NFQ0RFVl9JTlNUQUxMX0RJUikvCj4gKwljcCAtZHBmciAkKEBEKS9z
Y3JpcHRzICQoVElfSzNfQ09SRV9TRUNERVZfSU5TVEFMTF9ESVIpLwo+ICtlbmRlZgo+ICsKPiAr
JChldmFsICQoZ2VuZXJpYy1wYWNrYWdlKSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
