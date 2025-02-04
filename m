Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42A2C02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 16:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54CE060BCE;
	Tue,  4 Feb 2025 16:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id db5Ju7YuLFwT; Tue,  4 Feb 2025 16:54:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1243060D50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1243060D50;
	Tue,  4 Feb 2025 16:54:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CAA512A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A92C607D2
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e5Mlg7_tmcg6 for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 16:53:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CB5F060BCE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB5F060BCE
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB5F060BCE
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:53:58 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38da586ef14so715876f8f.0
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 08:53:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738688036; x=1739292836;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1BdxtuwMGkoIoeJFzzFGQhr27NdqvbZ/K9vDcoZdZcI=;
 b=F77zwMom4snlbJRBP9tXVaixQzrEUtB4M2+DEPYreyxTWsGyL2Jl9pJXqhU6Ve4gm7
 W9ie+UKTT3qullChjrsEXnlrnYmy2ZagM5NFSxU75negA6xREeTGXtdAu/UssbjQ3h8d
 cEgrTo9GarcWl7yvb2fiqakSrT5HU545dbKlmt96fFdFMmODJVcUcoFUqdCjzdb2YCtQ
 YkSDY0iwQcbF0GpLcYMHxWJO0PjgvlFpi8pmN1Xzj6pgBq/4hT7/njVWJJxXOj05ADQE
 hvdaF2cdamLWZ3IOzi6wsYmMG3XDQbEMfaBvI1PUIk2w/quITAMEqoqBqozdtPJoCSZN
 U71g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo0gLFL8oJissghTkLL+s1dxXUAvG3PVFPX0adFuqKLYdNKvCrC4LvAEZzNZXtpNIMJTAPdCPoAj4=@buildroot.org
X-Gm-Message-State: AOJu0YyP1sNyfd49wAokRc5uWWKTJBdvCK3jZgo2BmrFab4LaIfktR1b
 nh7hDzF4qnYw38ldS881QGXsE0YW9huA/rmpM7d8GhilzlzoT8qltKwn92UfJs7A9NL72KGey3u
 A
X-Gm-Gg: ASbGncsQ0SxZnw7LNbbwSr7Cwo6sg1ZSrsGybty/h9kiWfwkZCQMHmVVFNci2aLAGGN
 rxRKNDXzi+gBGOuwPX7m/Bvo/Vm3vtIETbq9tmjeztGy4t7XcYpy6x2L5FLt4rKNqZo6cWGfqEw
 TdhCY2SW9Ub5k5MrH7Tjvupv4msguoCUGtrz7lroLEkbL8zHKXmhK7ECzSfzQnF57f+6zb+iNrJ
 8M5ky+G0jqiYpuSNbvijsK2NMdtVSpJW5ktaEv+c9sSPMSshAf6SY56TxQjbMEdNhSgT1HohZ8x
 uBPswDugFDEyj/aUnA2wqKmEEZuUJIl/7wv1b2OD7ZCQ1Tw=
X-Google-Smtp-Source: AGHT+IEpuRRDxBtN95cxt2mZkieCSrseGx8xzOEYP+UB57pZlXY5RrlXeUBjfLC/bNCbbEgH7YNsFQ==
X-Received: by 2002:a5d:47cb:0:b0:38d:b2e4:6da3 with SMTP id
 ffacd0b85a97d-38db2e46fa8mr95753f8f.9.1738688036411; 
 Tue, 04 Feb 2025 08:53:56 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dafbb2598sm1499227f8f.43.2025.02.04.08.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 08:53:56 -0800 (PST)
Message-ID: <ec647692-245e-4589-895a-dba2937c9377@mind.be>
Date: Tue, 4 Feb 2025 17:53:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 buildroot@buildroot.org
References: <20250204-remove-ramsmp-v1-1-62d9e4bb1754@armadeus.com>
Content-Language: en-GB
In-Reply-To: <20250204-remove-ramsmp-v1-1-62d9e4bb1754@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738688036; x=1739292836; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1BdxtuwMGkoIoeJFzzFGQhr27NdqvbZ/K9vDcoZdZcI=;
 b=LXCJrul6LdksL8D2T8jr9NRtaeXPqjFoapB8t1vh2YkGTbGvnEPmPsE0NwY0TNK3GN
 4qzrDuLzHHg/EkMiEfAenNGRnmBcuywsCWmkld1IzLtOPJ1v6wzBp/9Zh/20l4V4toE2
 r1rsUH57IGgtTl8CyiuUDjKEr54GTgcK2SXisGlCJkxZjGvOP2pHNcNu1Pt5nDJgR2NO
 5xuXLlMUhx4d9rGC0wiHNAyNI0+VVp+DbQKdw5Ys28dsFN9iu7+GLFAmx34iZ98cs/o1
 SgU5AelpeyMPJ3Wl96lmja0J+8WbdoLCDD79X+HZJZrZyQq/FxVGv2Y/+95c/WxW/TXF
 l2Tw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LXCJrul6
Subject: Re: [Buildroot] [PATCH] package/ramsmp: drop package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNC8wMi8yMDI1IDE3OjM0LCBTw6liYXN0aWVuIFN6eW1hbnNraSB3cm90ZToKPiBUaGUg
ZG93bmxvYWQgbG9jYXRpb24gaXMgZ29uZSBhbmQgZXZlbiB0aG91Z2ggdGhlIHBhY2thZ2UgaXMg
YXZhaWxhYmxlCj4gb24gYSBHaXRodWIgcmVwb3NpdG9yeSBbMF0sIGl0IGhhcyBub3QgYmVlbiB1
cGRhdGVkIGZvciA3IHllYXJzIG5vdy4KPiBEcm9wIHRoZSBwYWNrYWdlLgo+IAo+IFswXSBodHRw
czovL2dpdGh1Yi5jb20vY3J1dm9sby9yYW1zcGVlZC1zbXAKPiAKPiAtLS0KPiBTaWduZWQtb2Zm
LWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5j
b20+CgogIEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+
IC0tLQo+ICAgQ29uZmlnLmluLmxlZ2FjeSAgICAgICAgICAgfCAgNyArKysrKysrCj4gICBERVZF
TE9QRVJTICAgICAgICAgICAgICAgICB8ICAxIC0KPiAgIHBhY2thZ2UvQ29uZmlnLmluICAgICAg
ICAgIHwgIDEgLQo+ICAgcGFja2FnZS9yYW1zbXAvQ29uZmlnLmluICAgfCAgOSAtLS0tLS0tLS0K
PiAgIHBhY2thZ2UvcmFtc21wL01ha2VmaWxlICAgIHwgMTQgLS0tLS0tLS0tLS0tLS0KPiAgIHBh
Y2thZ2UvcmFtc21wL3JhbXNtcC5oYXNoIHwgIDMgLS0tCj4gICBwYWNrYWdlL3JhbXNtcC9yYW1z
bXAubWsgICB8IDIyIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIDcgZmlsZXMgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspLCA1MCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvQ29uZmln
LmluLmxlZ2FjeSBiL0NvbmZpZy5pbi5sZWdhY3kKPiBpbmRleCBlZGNhM2VlZjQ3ZDdjYTFiODVh
MzMzMGU4NWQzZjNiYjAxNmMwMDE4Li5jM2IzYmNmMzlkM2ZlZDNmMWJmMGNlMDZmYzQwZWJhMTdl
MmE5ZDY1IDEwMDY0NAo+IC0tLSBhL0NvbmZpZy5pbi5sZWdhY3kKPiArKysgYi9Db25maWcuaW4u
bGVnYWN5Cj4gQEAgLTI5OSw2ICsyOTksMTMgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1FVQUdHQQo+
ICAgCSAgVGhlIHF1YWdnYSBwYWNrYWdlIHdhcyByZW1vdmVkIGFzIGl0IGlzIG5vdCBtYWludGFp
bmVkCj4gICAJICBhbnltb3JlIGFuZCB0aGUgdXBzdHJlYW0gcmVwbyBpcyBnb25lLgo+ICAgCj4g
K2NvbmZpZyBCUjJfUEFDS0FHRV9SQU1TTVAKPiArCWJvb2wgInJhbXNtcCBoYXMgYmVlbiByZW1v
dmVkIgo+ICsJc2VsZWN0IEJSMl9MRUdBQ1kKPiArCWhlbHAKPiArCSAgVGhlIHJhbXNtcCBwYWNr
YWdlIHdhcyByZW1vdmVkIGFzIGl0IGlzIG5vdCBtYWludGFpbmVkCj4gKwkgIGFueW1vcmUgYW5k
IHRoZSB1cHN0cmVhbSByZXBvIGlzIGdvbmUuCj4gKwo+ICAgY29tbWVudCAiTGVnYWN5IG9wdGlv
bnMgcmVtb3ZlZCBpbiAyMDI0LjExIgo+ICAgCj4gICBjb25maWcgQlIyX1BBQ0tBR0VfQlNESUZG
Cj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCj4gaW5kZXggMmRhNWQxNzhi
MjA2NDYzYmYyOWE0ZDhjZjJmMTZkNjM3YTdmMWQwOS4uM2MzNzU0Y2JjM2U4MjJlOTYyNzBmNmQw
MjgxOGYwZDdhZWM5Mzc5NSAxMDA2NDQKPiAtLS0gYS9ERVZFTE9QRVJTCj4gKysrIGIvREVWRUxP
UEVSUwo+IEBAIC0yMDUyLDcgKzIwNTIsNiBAQCBGOglwYWNrYWdlL29wZW52bXRvb2xzLwo+ICAg
TjoJS2VsdmluIENoZXVuZyA8a2VndWFuZy56aGFuZ0BnbWFpbC5jb20+Cj4gICBGOglwYWNrYWdl
L2NwdWxvYWQvCj4gICBGOglwYWNrYWdlL2J3bS1uZy8KPiAtRjoJcGFja2FnZS9yYW1zbXAvCj4g
ICAKPiAgIE46CUtpZXJhbiBCaW5naGFtIDxraWVyYW4uYmluZ2hhbUBpZGVhc29uYm9hcmQuY29t
Pgo+ICAgRjoJcGFja2FnZS9saWJjYW1lcmEvCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmln
LmluIGIvcGFja2FnZS9Db25maWcuaW4KPiBpbmRleCBlOWM3ODljZmYyN2ExMmQ2ZWMzMjJjNmQ3
ZjEwZGQ0MDk0YjMyM2RjLi43ZTM1NTkxMzBmNWJjYzViNWZkNjhkOTVjOTAwOTEzZGVjZWFiOTdj
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9Db25maWcu
aW4KPiBAQCAtMTQ0LDcgKzE0NCw2IEBAIG1lbnUgIkRlYnVnZ2luZywgcHJvZmlsaW5nIGFuZCBi
ZW5jaG1hcmsiCj4gICAJc291cmNlICJwYWNrYWdlL3B0bTJodW1hbi9Db25maWcuaW4iCj4gICAJ
c291cmNlICJwYWNrYWdlL3B2L0NvbmZpZy5pbiIKPiAgIAlzb3VyY2UgInBhY2thZ2UvcmFjZWhv
dW5kL0NvbmZpZy5pbiIKPiAtCXNvdXJjZSAicGFja2FnZS9yYW1zbXAvQ29uZmlnLmluIgo+ICAg
CXNvdXJjZSAicGFja2FnZS9yYW1zcGVlZC9Db25maWcuaW4iCj4gICAJc291cmNlICJwYWNrYWdl
L3J0LXRlc3RzL0NvbmZpZy5pbiIKPiAgIAlzb3VyY2UgInBhY2thZ2UvcndtZW0vQ29uZmlnLmlu
Igo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3JhbXNtcC9Db25maWcuaW4gYi9wYWNrYWdlL3JhbXNt
cC9Db25maWcuaW4KPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCA0MTFlN2RlOTEx
NTA3OWY5YzM2ZGJkOTEwNTQ1Njk4ZjdiZDdhNjcyLi4wMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwCj4gLS0tIGEvcGFja2FnZS9yYW1zbXAvQ29uZmlnLmluCj4gKysrIC9k
ZXYvbnVsbAo+IEBAIC0xLDkgKzAsMCBAQAo+IC1jb25maWcgQlIyX1BBQ0tBR0VfUkFNU01QCj4g
LQlib29sICJyYW1zcGVlZC9zbXAiCj4gLQlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VICMgZm9yaygp
Cj4gLQloZWxwCj4gLQkgIFJBTXNwZWVkL1NNUCBpcyBhIGZyZWUgb3BlbiBzb3VyY2UgY29tbWFu
ZCBsaW5lIHV0aWxpdHkgdG8KPiAtCSAgbWVhc3VyZSBjYWNoZSBhbmQgbWVtb3J5IHBlcmZvcm1h
bmNlIG9mIG11bHRpcHJvY2Vzc29yCj4gLQkgIG1hY2hpbmVzLgo+IC0KPiAtCSAgaHR0cDovL2Fs
YXNpci5jb20vc29mdHdhcmUvcmFtc3BlZWQvCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcmFtc21w
L01ha2VmaWxlIGIvcGFja2FnZS9yYW1zbXAvTWFrZWZpbGUKPiBkZWxldGVkIGZpbGUgbW9kZSAx
MDA2NDQKPiBpbmRleCA1Y2Q3NmUwOWQ5MGNmYzkxNGYzMjM1MWRjYjhhOTJjNWRlOTk0YTJmLi4w
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwCj4gLS0tIGEvcGFja2FnZS9y
YW1zbXAvTWFrZWZpbGUKPiArKysgL2Rldi9udWxsCj4gQEAgLTEsMTQgKzAsMCBAQAo+IC0KPiAt
YWxsOiBnZW5lcmljCj4gLQo+IC1nZW5lcmljOiByYW1zbXAuYyBmbHRtZW0uYyBmbHRtYXJrLmMg
aW50bWVtLmMgaW50bWFyay5jCj4gLQkkKENDKSAkKENGTEFHUykgJChMREZMQUdTKSAkXiAtbyBy
YW1zbXAKPiAtCj4gLWkzODY6IHJhbXNtcC5jIGkzODYvKi5zIGkzODYvY3B1aW5mby8qLnMKPiAt
CSQoQ0MpICQoQ0ZMQUdTKSAtREkzODZfQVNNICQoTERGTEFHUykgJF4gLW8gcmFtc21wCj4gLQo+
IC14ODZfNjQ6IHJhbXNtcC5jIGFtZDY0Lyoucwo+IC0JJChDQykgJChDRkxBR1MpIC1EQU1ENjRf
QVNNICQoTERGTEFHUykgJF4gLW8gcmFtc21wCj4gLQo+IC1jbGVhbjoKPiAtCXJtIC1mICoubyBy
YW1zbXAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9yYW1zbXAvcmFtc21wLmhhc2ggYi9wYWNrYWdl
L3JhbXNtcC9yYW1zbXAuaGFzaAo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IGM1
ZTI5YTM5MDBiMWZmYzUzYjk5ZTkwY2NkZjM2ZGQ3Y2JiMDc1ZmYuLjAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAKPiAtLS0gYS9wYWNrYWdlL3JhbXNtcC9yYW1zbXAuaGFz
aAo+ICsrKyAvZGV2L251bGwKPiBAQCAtMSwzICswLDAgQEAKPiAtIyBMb2NhbGx5IGNvbXB1dGVk
Cj4gLXNoYTI1NiAgMzlmYjE1NDkzZmIzYzI5MzU3NTc0NmQ1NmY2YWI5ZmFhYTFkODc2ZDhiMWYw
ZDhlNWE0MDQyZDJhY2U5NTgzOSAgcmFtc21wLTMuNS4wLnRhci5nego+IC1zaGEyNTYgIDJjMzA4
Y2ZmYmFiMDE3NjJmOGY2YjExNzI1NzI1YTIyNzA4MDc0NmVmODY1ZjI3NTZjOWM5ZTE1OTFkZGRh
YWQgIExJQ0VOQ0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9yYW1zbXAvcmFtc21wLm1rIGIvcGFj
a2FnZS9yYW1zbXAvcmFtc21wLm1rCj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXgg
NjA5ODM3NmRhNTk2NzI1OTY5YmM0MjM0MWI2OWIwOTM4NWEwMDc5Yy4uMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMAo+IC0tLSBhL3BhY2thZ2UvcmFtc21wL3JhbXNtcC5t
awo+ICsrKyAvZGV2L251bGwKPiBAQCAtMSwyMiArMCwwIEBACj4gLSMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCj4gLSMKPiAtIyByYW1zbXAKPiAtIwo+IC0jIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+
IC0KPiAtUkFNU01QX1ZFUlNJT04gPSAzLjUuMAo+IC1SQU1TTVBfU0lURSA9IGh0dHA6Ly93d3cu
YWxhc2lyLmNvbS9zb2Z0d2FyZS9yYW1zcGVlZAo+IC1SQU1TTVBfQVJDSCA9ICQoaWYgJChCUjJf
aTM4NiksaTM4NikkKGlmICQoQlIyX3g4Nl82NCkseDg2XzY0KQo+IC1SQU1TTVBfTElDRU5TRSA9
IEFsYXNpciBMaWNlbnNlCj4gLVJBTVNNUF9MSUNFTlNFX0ZJTEVTID0gTElDRU5DRQo+IC0KPiAt
ZGVmaW5lIFJBTVNNUF9CVUlMRF9DTURTCj4gLQljcCAtZiBwYWNrYWdlL3JhbXNtcC9NYWtlZmls
ZSAkKEBEKQo+IC0JJChUQVJHRVRfQ09ORklHVVJFX09QVFMpIG1ha2UgLUMgJChARCkgJChSQU1T
TVBfQVJDSCkKPiAtZW5kZWYKPiAtCj4gLWRlZmluZSBSQU1TTVBfSU5TVEFMTF9UQVJHRVRfQ01E
Uwo+IC0JJChJTlNUQUxMKSAtbSAwNzU1IC1EICQoQEQpL3JhbXNtcCAkKFRBUkdFVF9ESVIpL3Vz
ci9iaW4vcmFtc21wCj4gLWVuZGVmCj4gLQo+IC0kKGV2YWwgJChnZW5lcmljLXBhY2thZ2UpKQo+
IAo+IC0tLQo+IGJhc2UtY29tbWl0OiAxNjk0Mzg0OWUwOTBmYmFjYTc1ODE3YmEzNTYzZGQyZDY2
YmZkNTFkCj4gY2hhbmdlLWlkOiAyMDI1MDIwNC1yZW1vdmUtcmFtc21wLTc2NzA5NGI0NGMzMwo+
IAo+IEJlc3QgcmVnYXJkcywKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
