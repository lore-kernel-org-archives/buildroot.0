Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB22DC87FD2
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 21:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A6F3409BC;
	Sat,  9 Aug 2025 21:58:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F5oEAZ4Cqy7L; Sat,  9 Aug 2025 21:58:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80720409D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80720409D1;
	Sat,  9 Aug 2025 21:58:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A91F831
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 21:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EE41606C8
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 21:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Fw37txXV0BS for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 21:58:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 701FD60D61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 701FD60D61
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 701FD60D61
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 21:58:16 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3b786421e36so1703383f8f.3
 for <buildroot@buildroot.org>; Sat, 09 Aug 2025 14:58:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754776694; x=1755381494;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4+yp2UC+2XkkZM0QfSpdMOl/ur1oZIUuY2THpTfMYDE=;
 b=kOJ00Fn7u1ancXTP5ZsnoYH2I34+i1o8Mkcg8dAjNeUOwXrIaJQQcaQBjg3z04LRFt
 H5KjkyszVh1wC6/6+8Bu/OdsPjq36UrWRF4JLhzqPvIKxSR0EXDHV6DoYTHPy430Za/M
 QYXx1WwbP1S5tXiThIbx1jJUHTy4mQHGPnEz5Mj8Lcw0l2eV6NOzMQe97EUsMeWFYCgj
 jq57TXJOim9ADuquH0juUth5VtTG1hNrExWXw8dsf8hI+5DNFMvIz8azdEwWXZjTAgmU
 yhqt92Vw5hzlB/wHSfukWbgbAlOo73Kt5zE60LJrE4nPVdxrMC0ln9lpfS3GvVaUs7Sb
 0Zzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq+vYECXfZ3do6oGFPYFbrPfZDgnq9EqX15Qo33z/8iiu1wewuWUXVacDDT0Zatv0kUmS89vRjTjA=@buildroot.org
X-Gm-Message-State: AOJu0YwEW+EDCEBvc38UwMhrAlXMUxUzYQpu3CH6gO3uwKZ4xtvOWRMF
 fAbwUi2zBSaL9tBLB7y/Vh8Dt++kMkyO0ytRRDQ0awmJzqIBweLp7tEDvToHH1vlBHT/JWKeqaG
 r75bj
X-Gm-Gg: ASbGncsjeQLyGS20d0TX27uuke0aQP1oX9Ol9wDUf/nxub7s5fEbRyDBmOUjQ5N1PDc
 3LBwb3wgqDd5j7HGvWRZNaP2KEbCenhzrbkas9jyNm/lTLyK+Rs7bZTL2ObMgqs1lY0pVCKVrZS
 RRbySdbVN1izdL3Vv0mPd4tbAZXvWjMemplgfOAl8IeX8HEF2mIK3vaohC6Rt06++a0t5ryJJRm
 I+0dXnpOPzsrNLAPkBgm6LbM6mPBQ6CsMpZtJAP7Pdt7lknmHqhXMIzhv5z+Nc6tDlZpPDmC5ug
 B9fvfAZqmzTQUnULfL83dq5mmMPdLIcU+Qpfp6PYRx18T+/DmpBGqTCpKYJd4ddB8LEQuxuLJ6c
 JLOyd7en4Hlc4exJ/AYb3qCaWrmh+mQJIDMZQeODjIpj7EtupnUpsmNvZ5V0WRC+qeefoNhUDtE
 KXHmPL04Yuf9oJsnTgDBCH7kFkMkaqMqmVmqZNDdzGAJImt6K3hcTRsNmD3WGGjotd8XjYrlxyV
 JgLdDzuKQ==
X-Google-Smtp-Source: AGHT+IEDHv8lS8XLRp76YZSuQ1L1icSH0UBvli//BymjMXqAXLOtAi1ZlEi71bm6zzEYTIbGFyzt6Q==
X-Received: by 2002:a05:6000:290b:b0:3b7:8fcc:a1e3 with SMTP id
 ffacd0b85a97d-3b900b5108cmr5706039f8f.48.1754776694270; 
 Sat, 09 Aug 2025 14:58:14 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3c4beasm34105670f8f.30.2025.08.09.14.58.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Aug 2025 14:58:13 -0700 (PDT)
Message-ID: <9f6fdd80-ef24-49de-97ad-17f8a76f64a2@smile.fr>
Date: Sat, 9 Aug 2025 23:58:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Stefan Hager <stefan.hager@ginzinger.com>
References: <20250809210855.354805-1-thomas.perale@mind.be>
Content-Language: fr
In-Reply-To: <20250809210855.354805-1-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754776694; x=1755381494; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4+yp2UC+2XkkZM0QfSpdMOl/ur1oZIUuY2THpTfMYDE=;
 b=eiztcoyaet6aQW5F4E9FVU4CKP71C6QiD0vyrs8ObN9xY2ZWmLqkSjamu2lMzfF32T
 g0NFO4Go/roCPzGWahqHQWnBc5UhyMmJRDJwnU/sK7gup2iQfqzeghFRo3HYN3DTQrF0
 ZsgxTu5N8eST+Fco8h1tgYy35TZ8IJXTX8sxA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=eiztcoya
Subject: Re: [Buildroot] [PATCH v2 1/2] package/pthreadpool: fix thread
 dependency
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

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAwOS8wOC8yMDI1IMOgIDIzOjA4LCBUaG9tYXMgUGVyYWxl
IHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBPbiBhdXRvYnVpbGRlciBjb25maWcgd2l0aCBC
UjJfVE9PTENIQUlOX0hBU19USFJFQURTIG5vdCBzZXQgdGhlCj4gZm9sbG93aW5nIGVycm9yIGhh
cHBlbnMgd2hlbiBidWlsZGluZyB0aGUgcHRocmVhZHBvb2wgcGFja2FnZToKPiAKPiBgYGAKPiAt
LSBMb29raW5nIGZvciBwdGhyZWFkX2NyZWF0ZSBpbiBwdGhyZWFkcwo+IC0tIExvb2tpbmcgZm9y
IHB0aHJlYWRfY3JlYXRlIGluIHB0aHJlYWRzIC0gbm90IGZvdW5kCj4gLS0gTG9va2luZyBmb3Ig
cHRocmVhZF9jcmVhdGUgaW4gcHRocmVhZAo+IC0tIExvb2tpbmcgZm9yIHB0aHJlYWRfY3JlYXRl
IGluIHB0aHJlYWQgLSBub3QgZm91bmQKPiAtLSBDaGVjayBpZiBjb21waWxlciBhY2NlcHRzIC1w
dGhyZWFkCj4gLS0gQ2hlY2sgaWYgY29tcGlsZXIgYWNjZXB0cyAtcHRocmVhZCAtIG5vCj4gQ01h
a2UgRXJyb3IgYXQgL2hvbWUvYnVpbGRyb290L2luc3RhbmNlLTAvb3V0cHV0LTEvaG9zdC9zaGFy
ZS9jbWFrZS0zLjMxL01vZHVsZXMvRmluZFBhY2thZ2VIYW5kbGVTdGFuZGFyZEFyZ3MuY21ha2U6
MjMzIChtZXNzYWdlKToKPiAgIENvdWxkIE5PVCBmaW5kIFRocmVhZHMgKG1pc3Npbmc6IFRocmVh
ZHNfRk9VTkQpCj4gQ2FsbCBTdGFjayAobW9zdCByZWNlbnQgY2FsbCBmaXJzdCk6Cj4gICAvaG9t
ZS9idWlsZHJvb3QvaW5zdGFuY2UtMC9vdXRwdXQtMS9ob3N0L3NoYXJlL2NtYWtlLTMuMzEvTW9k
dWxlcy9GaW5kUGFja2FnZUhhbmRsZVN0YW5kYXJkQXJncy5jbWFrZTo2MDMgKF9GUEhTQV9GQUlM
VVJFX01FU1NBR0UpCj4gICAvaG9tZS9idWlsZHJvb3QvaW5zdGFuY2UtMC9vdXRwdXQtMS9ob3N0
L3NoYXJlL2NtYWtlLTMuMzEvTW9kdWxlcy9GaW5kVGhyZWFkcy5jbWFrZToyMjYgKEZJTkRfUEFD
S0FHRV9IQU5ETEVfU1RBTkRBUkRfQVJHUykKPiAgIENNYWtlTGlzdHMudHh0OjE0MyAoRklORF9Q
QUNLQUdFKQo+IAo+IC0tIENvbmZpZ3VyaW5nIGluY29tcGxldGUsIGVycm9ycyBvY2N1cnJlZCEK
PiBgYGAKPiAKPiBUaGlzIGNhbiBiZSByZXByb2R1Y2VkIHdpdGg6Cj4gCj4gYGBgCj4gY2F0ID4u
Y29uZmlnIDw8RU9GCj4gQlIyX2FybWViPXkKPiBCUjJfVE9PTENIQUlOX0JVSUxEUk9PVF9VQ0xJ
QkM9eQo+IEJSMl9QVEhSRUFEU19OT05FPXkKPiBCUjJfUEFDS0FHRV9QVEhSRUFEUE9PTD15Cj4g
RU9GCj4gbWFrZSBvbGRkZWZjb25maWcKPiBtYWtlIHB0aHJlYWRwb29sCj4gYGBgCj4gCj4gU2lu
Y2UgdGhlIGludHJvZHVjdGlvbiBvZiB0aGlzIHBhY2thZ2UgaW4gWzFdLCB0aGUgZGVwZW5kZW5j
eSB3YXMgbm90Cj4gaW5jbHVkZWQuIFNpbmNlIHRoaXMgcGFja2FnZSB3YXMgcGFydCBvZiB0aGUg
dGVuc29yZmxvdy1saXRlCj4gZGVwZW5kZW5jaWVzIHRoYXQgcmVxdWlyZWQgdGhyZWFkIGl0IHdh
cyBub3QgYW4gaXNzdWUuCj4gCj4gVGhpcyBwYXRjaCBhZGRzIEJSMl9UT09MQ0hBSU5fSEFTX1RI
UkVBRFMgaW4gdGhlIGRlcGVuZGVuY3kgdG8gYXZvaWQKPiBlcnJvcnMgd2hlbiBidWlsdCBhcyBh
IHN0YW5kYWxvbmUgcGFja2FnZS4KPiAKPiBbMV0gZjI0ODZhNmNmOSBwYWNrYWdlL3B0aHJlYWRw
b29sOiBuZXcgcGFja2FnZQo+IAo+IEZpeGVzOiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qu
b3JnL3Jlc3VsdHMvMzVhLzM1YWExMDBkNzJjNjg3NTM1MGFkMTBjNTdmMDI4ZjA0MDUyY2JmNzkK
PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGVyYWxlIDx0aG9tYXMucGVyYWxlQG1pbmQuYmU+CgpT
ZXJpZXMgYXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoK
PiAtLS0KPiAgcGFja2FnZS9wdGhyZWFkcG9vbC9Db25maWcuaW4gfCA0ICsrKysKPiAgcGFja2Fn
ZS94bm5wYWNrL0NvbmZpZy5pbiAgICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHRocmVh
ZHBvb2wvQ29uZmlnLmluIGIvcGFja2FnZS9wdGhyZWFkcG9vbC9Db25maWcuaW4KPiBpbmRleCAx
OTRhZTMzZjg1Li44ZDE2M2IxNmRlIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHRocmVhZHBvb2wv
Q29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9wdGhyZWFkcG9vbC9Db25maWcuaW4KPiBAQCAtMSw4
ICsxLDEyIEBACj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9QVEhSRUFEUE9PTAo+ICAJYm9vbCAicHRo
cmVhZHBvb2wiCj4gKwlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMKPiAgCXNl
bGVjdCBCUjJfUEFDS0FHRV9GWERJVgo+ICAJaGVscAo+ICAJICBQdGhyZWFkcG9vbCBpcyBhIHBv
cnRhYmxlIGFuZCBlZmZpY2llbnQgdGhyZWFkIHBvb2wKPiAgCSAgaW1wbGVtZW50YXRpb24uCj4g
IAo+ICAJICBodHRwczovL2dpdGh1Yi5jb20vTWFyYXR5c3pjemEvcHRocmVhZHBvb2wKPiArCj4g
K2NvbW1lbnQgInB0aHJlYWRwb29sIG5lZWRzIGEgdG9vbGNoYWluIHcvIHRocmVhZHMiCj4gKwkg
IGRlcGVuZHMgb24gIUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS94bm5wYWNrL0NvbmZpZy5pbiBiL3BhY2thZ2UveG5ucGFjay9Db25maWcuaW4KPiBpbmRl
eCBlNGI5MmY2MWU4Li43OTRjNWM0N2QyIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UveG5ucGFjay9D
b25maWcuaW4KPiArKysgYi9wYWNrYWdlL3hubnBhY2svQ29uZmlnLmluCj4gQEAgLTksNyArOSw3
IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9YTk5QQUNLCj4gIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdF
X1hOTlBBQ0tfQVJDSF9TVVBQT1JUUwo+ICAJZGVwZW5kcyBvbiBCUjJfSU5TVEFMTF9MSUJTVERD
UFAKPiAgCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNF85ICMgQysrMTQK
PiAtCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyAjIGNwdWluZm8KPiArCWRl
cGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyAjIGNwdWluZm8sIHB0aHJlYWRwb29s
Cj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfQ1BVSU5GTwo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0ZQ
MTYKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9GWERJVgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
