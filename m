Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4ACE77188
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 22:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF1FF60F54;
	Tue, 14 Jan 2025 22:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x2ICACk1fEjW; Tue, 14 Jan 2025 22:35:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A58AF60ADF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A58AF60ADF;
	Tue, 14 Jan 2025 22:35:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D72894B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 22:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BC9F8136F
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 22:35:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JDwDzCmZrIWH for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 22:35:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CA74C812A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA74C812A7
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA74C812A7
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 22:35:01 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43618283d48so43447765e9.1
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 14:35:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736894100; x=1737498900;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4celXwiawfLnVX3FRAV+8WtTDz+8XnJT4bJ4Q0XRMP8=;
 b=eCg7uU+5NS8L8NDUDi0nXBo54K6pLEA6ibf7mrowT50S8Ml5UDU+nYptif/YI2juUv
 eMtZ2jHUV3u0XBrUaLrYBYzF49VyaiZd600Mjys+6urCp3fD0botHER0gf5qoQIKDzAi
 0pxnONd934BGTbsggtYu8MHY67+wyMIcq04OBFiv9NaCeCoj2Q6qk/acO1cKNuW/T8HT
 Lk/hSw3NrML9W8+NYSPD3CFyXVwBnASGsNE2S4o1bH1m79nkDXJY+0aqtgIqGvpggssv
 NCcCrcvdYGjzl10lGQdHtn3a3Cvue1uJPaxvf/9tskbPjXHIGRt3DAVeC6pGWxtibf2t
 CDrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRO3+sF3wGUabpy5/kfGxshL3XInj4mOKoiPvRMo+RnITUf3y4Rwtf+MQKEgLTwkN7wFu4lqKu8eI=@buildroot.org
X-Gm-Message-State: AOJu0YxoMl5me+Adt5xj9PU0R8KYDnf0WY38z+bYh8Yer73k4vA2QFaN
 4uTtPFOP11z3x6neCU9+AQ51WeyI6KNcSAOlIF4qtd4SynFYzi5gJeJJ810aEzg=
X-Gm-Gg: ASbGncuojCVLQxVhBwTpyyq0OdBQ93xqdX0qwzcZicL3u1NKLBP0gh6QzU35cuQb/9Z
 IzuYMNC07Olc3aC/WUDVGuOOy0WQt6vmE8Ht4yroXB+qb9fnQmSB3jfffgo1zZdYj3Z0kv0Y2ma
 vvVsc4UX+A4SGq8p0fhAUicuBhFGqWhkV3+lDRqqzi6wjObUgcyK38nevExnK+FhwLCm9+JVDkK
 uE4sWaHkQvDQYWwLxZscF6/zSonTQBDrxYcfZ7Hk+Jv/1dtI2YSiptV0a4utJsC+U0XREw62xlT
 BWX/4AODfuSgL4YKtECu2ZD/946914XYaZbp2HJQHkwWuNtcLuRylW6XJj8veU9Kl1ZQxmolDbi
 mw6SBxnDH7j+ptSYp
X-Google-Smtp-Source: AGHT+IHJvjJO2KYfewY66kQpOmWDxP83tToQaek5ID/meorG7wvfEsUpLOSa3YGO4Cvolwx2D310CQ==
X-Received: by 2002:a05:600c:510a:b0:434:a1e7:27b0 with SMTP id
 5b1f17b1804b1-436e2696db5mr271609355e9.11.1736894099805; 
 Tue, 14 Jan 2025 14:34:59 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c16c4c12sm15645245e9.3.2025.01.14.14.34.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 14:34:59 -0800 (PST)
Message-ID: <f0025326-73ff-48f5-8a24-a342c85bc0d6@smile.fr>
Date: Tue, 14 Jan 2025 23:34:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250108224320.2241826-1-thomas.petazzoni@bootlin.com>
 <20250108224320.2241826-2-thomas.petazzoni@bootlin.com>
Content-Language: fr
In-Reply-To: <20250108224320.2241826-2-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736894100; x=1737498900; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4celXwiawfLnVX3FRAV+8WtTDz+8XnJT4bJ4Q0XRMP8=;
 b=XJf3UqZFfOnedXFte0bJbHgvRLYc/dlUwylVc3dtyY8kti854rTG0+iCQq1SbpyJvl
 3qIs14gp65u2vLuDdIwuL0+croZLbbH8NNFI2cychQhFz9LJn8wtdScIEYleRHRMZs3P
 mMGDutDNpt96RPn5qCG8PhDKr7jNprbxx82X4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=XJf3UqZF
Subject: Re: [Buildroot] [PATCH 1/4] package/cross-ldd: new package
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

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAwOC8wMS8yMDI1IMOgIDIzOjQzLCBUaG9tYXMgUGV0YXp6
b25pIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBUaGlzIGNvbW1pdCBpbnRyb2R1Y2VzIGEg
bmV3IGNyb3NzLWxkZCBwYWNrYWdlIHdoaWNoIGluc3RhbGxzIHRoZQo+IGNyb3NzIGxkZCBpbXBs
ZW1lbnRhdGlvbiB0aGF0IGNvbWVzIGZyb20gQ3Jvc3N0b29sLU5HLCBhbmQgd2hpY2ggY2FuCj4g
YmUgdXNlZCBsaWtlIGxkZCwgYnV0IHdoZW4gY3Jvc3MtY29tcGlsaW5nLiBXZSBpbnRlbmQgdG8g
dXNlIGl0IGFzIGEKPiByZXBsYWNlbWVudCBvZiBob3N0LXByZWxpbmstY3Jvc3MgZm9yIG91ciBk
cmFjdXQgcGFja2FnZS4KPiAKPiBUaGUgY3Jvc3MtbGRkIGZyb20gQ3Jvc3N0b29sLU5HIGlzIGlu
IGZhY3QgZXZlbiByZWNvbW1lbmRlZCBieSB0aGUKPiBEcmFjdXQgZG9jdW1lbnRhdGlvbiwgaW4g
aXRzIGRvY3MvUkVBRE1FLmNyb3NzIGRvY3VtZW50Ogo+IAo+ICAgIFRvIHN1cHBvcnQgY3Jvc3Mt
Y29tcGlsZWQgYmluYXJpZXMsIGEgZGlmZmVyZW50IGxkZCB2YXJpYW50IGlzIG5lZWRlZCB0aGF0
Cj4gICAgd29ya3Mgb24gdGhvc2UgYmluYXJpZXMuIE9uZSBzdWNoIGxkZCBzY3JpcHQgaXMgZm91
bmQgYXQKPiAgICBodHRwczovL2dpc3QuZ2l0aHViLmNvbS9qZXJvbWUtcG91aWxsZXIvYzQwMzc4
NmMxMzk0ZjUzZjQ0YTNiNjEyMTQ0ODllNmYKPiAKPiBUaGlzIEdpdGh1YiBHaXN0IGluIGZhY3Qg
Y29udGFpbnMgdGhlIHhsZGQuaW4gY29kZSBmcm9tIENyb3NzdG9vbC1ORy4KPiAKPiBPdXIgcGFj
a2FnZSBkb3dubG9hZHMgdGhlIGZ1bGwgdGFyYmFsbCBvZiBDcm9zc3Rvb2wtTkcuIFdlIHRyaWVk
IHRvCj4gZG93bmxvYWQgb25seSB0aGUgc2NyaXB0IGFuZCB0aGUgbGljZW5zZSBmaWxlLCBidXQg
d2UgY291bGRuJ3QgZmlndXJlCj4gb3V0IGEgd2F5IG9mIGRvd25sb2FkaW5nIHRoZW0gKmFuZCog
aGF2ZSB0aGUgdmVyc2lvbiBpbiB0aGUgZmlsZW5hbWUKPiB0byBtYWtlIHN1cmUgdGhhdCB3aGVu
IGRvaW5nIGFuIHVwZ3JhZGUgdG8gYSBuZXdlciB2ZXJzaW9uLCB3ZQo+IHdvdWxkbid0IGhhdmUg
YSBjbGFzaCBiZXR3ZWVuIG9sZC9uZXcgZmlsZXMgaGF2aW5nIHRoZSBzYW1lIG5hbWUgKGFuZAo+
IGNhdXNpbmcgY29uZmxpY3RzIHdpdGggdGhlIGhhc2ggdmVyaWZpY2F0aW9uKS4gU28gaW4gdGhl
IGVuZCwgd2Ugb3B0ZWQKPiBmb3IgZG93bmxvYWQgdGhlIHdob2xlIHRhcmJhbGwuCj4gCj4gU2ln
bmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNv
bT4KCkkndmUgcnVuIHNvbWUgcnVudGltZSB0ZXN0cyB3aXRob3V0IGFueSBpc3N1ZS4KCkFwcGxp
ZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gLS0tCj4gIERF
VkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBwYWNrYWdlL2Nyb3NzLWxk
ZC9jcm9zcy1sZGQuaGFzaCB8ICA0ICsrKysKPiAgcGFja2FnZS9jcm9zcy1sZGQvY3Jvc3MtbGRk
Lm1rICAgfCAzNyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAzIGZpbGVzIGNo
YW5nZWQsIDQyIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvY3Jv
c3MtbGRkL2Nyb3NzLWxkZC5oYXNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2Nyb3Nz
LWxkZC9jcm9zcy1sZGQubWsKPiAKPiBkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BF
UlMKPiBpbmRleCAxNmI3MmVlZTA4Li4xMTc0MTAwMDE0IDEwMDY0NAo+IC0tLSBhL0RFVkVMT1BF
UlMKPiArKysgYi9ERVZFTE9QRVJTCj4gQEAgLTMxNDUsNiArMzE0NSw3IEBAIEY6CXBhY2thZ2Uv
Y2lmcy11dGlscy8KPiAgRjoJcGFja2FnZS9jbG9vcC8KPiAgRjoJcGFja2FnZS9jbWFrZS8KPiAg
RjoJcGFja2FnZS9jcmFtZnMvCj4gK0Y6CXBhY2thZ2UvY3Jvc3MtbGRkLwo+ICBGOglwYWNrYWdl
L2RtaWRlY29kZS8KPiAgRjoJcGFja2FnZS9kb3VibGUtY29udmVyc2lvbi8KPiAgRjoJcGFja2Fn
ZS9mbGFzaHJvbS8KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9jcm9zcy1sZGQvY3Jvc3MtbGRkLmhh
c2ggYi9wYWNrYWdlL2Nyb3NzLWxkZC9jcm9zcy1sZGQuaGFzaAo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uYjE3OWFlYzVlMAo+IC0tLSAvZGV2L251bGwKPiArKysg
Yi9wYWNrYWdlL2Nyb3NzLWxkZC9jcm9zcy1sZGQuaGFzaAo+IEBAIC0wLDAgKzEsNCBAQAo+ICsj
IEZyb20gaHR0cDovL2Nyb3NzdG9vbC1uZy5vcmcvZG93bmxvYWQvY3Jvc3N0b29sLW5nL2Nyb3Nz
dG9vbC1uZy0xLjI2LjAudGFyLnh6LnNoYTUxMgo+ICtzaGE1MTIgIDc4MzQxODRhZTU3OTJmZDM0
NzQ1NWY5ZjQ4ZmVlODI2MjQ4ZGNiODJkMjcxOTU0ZWQ0MzA0YjFhMThmNjM5OTVmZjhhMmMzYjgx
NzU2NGRjZjE0N2FjN2UxNmUwMmQ3NzkxOTViMjZkOTdlYjU3ZGIyN2YxMTE4YTE4MzcwMDJhICBj
cm9zc3Rvb2wtbmctMS4yNi4wLnRhci54ego+ICsjIExvY2FsbHkgY2FsY3VsYXRlZAo+ICtzaGEy
NTYgIDA3YmMwY2NkMzg2NDY5Yzc0OGM0Y2Y2YzhmYWNhNTY2N2ZiZjhjNDQwMDM4NjcxNDI4N2Zh
MjMzYWNmZDY4YmEgIENPUFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9jcm9zcy1sZGQvY3Jv
c3MtbGRkLm1rIGIvcGFja2FnZS9jcm9zcy1sZGQvY3Jvc3MtbGRkLm1rCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4zNTcxMzNjZGQyCj4gLS0tIC9kZXYvbnVsbAo+
ICsrKyBiL3BhY2thZ2UvY3Jvc3MtbGRkL2Nyb3NzLWxkZC5tawo+IEBAIC0wLDAgKzEsMzcgQEAK
PiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArIwo+ICsjIGNyb3NzLWxkZAo+ICsjCj4gKyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKwo+ICtDUk9TU19MRERfVkVSU0lPTiA9IDEuMjYuMAo+
ICtDUk9TU19MRERfU0lURSA9IGh0dHA6Ly9jcm9zc3Rvb2wtbmcub3JnL2Rvd25sb2FkL2Nyb3Nz
dG9vbC1uZwo+ICtDUk9TU19MRERfU09VUkNFID0gY3Jvc3N0b29sLW5nLSQoQ1JPU1NfTEREX1ZF
UlNJT04pLnRhci54ego+ICtDUk9TU19MRERfTElDRU5TRSA9IEdQTC0yLjAKPiArQ1JPU1NfTERE
X0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCj4gKwo+ICtpZmVxICgkKEJSMl9BUkNIX0lTXzY0KSx5
KQo+ICtDUk9TU19MRERfQklUTkVTUyA9IDY0Cj4gK2Vsc2UKPiArQ1JPU1NfTEREX0JJVE5FU1Mg
PSAzMgo+ICtlbmRpZgo+ICsKPiArQ1JPU1NfTEREX1RPT0xTX1BSRUZJWCA9ICQocGF0c3Vic3Qg
JS0sJSwkKFRBUkdFVF9DUk9TUykpCj4gKwo+ICtkZWZpbmUgSE9TVF9DUk9TU19MRERfQ09ORklH
VVJFX0NNRFMKPiArCXNlZCBcCj4gKwkJLWUgInMlQEBDVF9iYXNoQEAlL3Vzci9iaW4vZW52IGJh
c2glIiBcCj4gKwkJLWUgInMlQEBDVF9WRVJTSU9OQEAlJChDUk9TU19MRERfVkVSU0lPTiklIiBc
Cj4gKwkJLWUgInMlQEBDVF9CSVRTQEAlJChDUk9TU19MRERfQklUTkVTUyklIiBcCj4gKwkJLWUg
InMlQEBDVF9zZWRAQCVzZWQlIiBcCj4gKwkJLWUgInMlQEBDVF9ncmVwQEAlZ3JlcCUiIFwKPiAr
CQktZSAicyVecHJlZml4PS4qJXByZWZpeD0kKENST1NTX0xERF9UT09MU19QUkVGSVgpJSIgXAo+
ICsJCSQoQEQpL3NjcmlwdHMveGxkZC5pbiA+IFwKPiArCQkkKEBEKS9zY3JpcHRzL3hsZGQKPiAr
ZW5kZWYKPiArCj4gK2RlZmluZSBIT1NUX0NST1NTX0xERF9JTlNUQUxMX0NNRFMKPiArCSQoSU5T
VEFMTCkgLW0gMDc1NSAtRCAkKEBEKS9zY3JpcHRzL3hsZGQgJChUQVJHRVRfQ1JPU1MpeGxkZAo+
ICtlbmRlZgo+ICsKPiArJChldmFsICQoaG9zdC1nZW5lcmljLXBhY2thZ2UpKQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
