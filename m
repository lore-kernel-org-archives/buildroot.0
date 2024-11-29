Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C14D735E4
	for <buildroot@archiver.kernel.org>; Fri, 29 Nov 2024 23:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4268E6088F;
	Fri, 29 Nov 2024 23:43:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cssrFX6TGkJp; Fri, 29 Nov 2024 23:43:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ACBE60899
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ACBE60899;
	Fri, 29 Nov 2024 23:43:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 056476C
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 23:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D90BE408C4
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 23:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z87-GWkb7msv for <buildroot@buildroot.org>;
 Fri, 29 Nov 2024 23:43:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D0861408BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0861408BB
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0861408BB
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 23:43:01 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-8419f5baedcso74942939f.2
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 15:43:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732923781; x=1733528581;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SZepRr/VTTzY4ETaf0IAdA/QzeS7w4DSu7D8+Pq6zdc=;
 b=T5PrIz103h2sYoKcW1ZZD3yxwWyWas+tUOXMZ7vWdENFX1FaLkU8b+6MfOFn0dWVNY
 Hcl6uKVAo7QV1tt8xEjcxkNvh9vV8IeNw7xx492Xbcw4tDJQMzFgqJENE2zhSN5jNWUJ
 Ms98C0qnUb4cSIN5vr6Gz19np2JCpSfGZLkVToREv7xxd5ddv9wJH7ku0FNqeRrxuKTQ
 8Fgu2HUXvVsMsB+IQFqWumBIbGmf9HV9pLRF+CRftYjCy1pqTTT7fynQ+TZHhaF3KMUH
 JILk/7sw/iELy2BeaDEPdfECYEsvNRGxdygF/ix7W4S1I1D4BcjfNbA9Gs92dCAxWhyq
 5+cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6VjS36siCsH7UZgrzKXMeFXrkMizDBGND18/u5nezLXFHVZ7Ykd90Jbo6brvl+e0jKJud8F34Ptw=@buildroot.org
X-Gm-Message-State: AOJu0YyOFHX6OjimK7i0JgbQHmf5uMvWDwLDO1koM/skO2GP1bSBEWrg
 UsuhutibtUbNrhLImiTTIKRnl68l0mjSxJLSKt7xyoitheq/PsZLshOnmIOvE8M=
X-Gm-Gg: ASbGnctUIuZNjdH1z6igZpyIwmnC4Ng+jxGeHc4+nkuOV9GpX3H+en6/GJ8J4X6cDKL
 zirlqwOqJGh3QuavDaUpFFbByDOa+kV7Dw6FiSYNaTPxjVuzpWBBBt+FNw1rpIXtUuiHcCMoYCe
 sS4fdWlnUUlrN7N6QHxnRX7JVUhpUryCgrcDgsdYOAGB7ZTozZNwwsXoPiF8KWTXOFIvVhRi8iG
 rFdKegxzfz9RgzifKFOU2ZzF7Wc+dEvQ7Hp7ddMLqUk4nbvhet8SOMhnahEvbblcHxdM9zdtP+u
 nM+0LIIHBhMSLRTELxE5a2Sb
X-Google-Smtp-Source: AGHT+IFi9k/SfMsnqS1ju3LNaFcnrsgGlMq9xJg5G6tGhiPZYSoc28gANDGd0z4atJz0sPFlGFMgQw==
X-Received: by 2002:a05:6602:2cd1:b0:843:eb89:9655 with SMTP id
 ca18e2360f4ac-843ed10036emr1231536839f.15.1732923780640; 
 Fri, 29 Nov 2024 15:43:00 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-84405eee4d4sm95900239f.26.2024.11.29.15.42.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 15:42:59 -0800 (PST)
Mime-Version: 1.0
Date: Fri, 29 Nov 2024 17:42:59 -0600
Message-Id: <D5Z27LYGMKJK.2KDMDIY9CR01H@gmail.com>
From: "Brandon Maier" <brandon.maier@gmail.com>
To: "Vincent Jardin" <vjardin@free.fr>, <buildroot@buildroot.org>
Cc: "Eric Le Bihan" <eric.le.bihan.dev@free.fr>, "Robin Jarry" <robin@jarry.cc>
X-Mailer: aerc 0.18.2
References: <CADwxmTnvhL1rg7T2k8Ye+wV0gx2oCCjLmnKiCfUQsY7ud9RVPA@mail.gmail.com>
 <20241127013001.24122-1-vjardin@free.fr>
 <20241127013001.24122-2-vjardin@free.fr>
In-Reply-To: <20241127013001.24122-2-vjardin@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732923781; x=1733528581; darn=buildroot.org;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SZepRr/VTTzY4ETaf0IAdA/QzeS7w4DSu7D8+Pq6zdc=;
 b=jT0EXhdLiw1MmMrK+hPXctH/hhtiw4rzw7u906QJYS1PFmSfITTi/fPmWlvdgkBdC3
 4xqVXAGEDySos9oA5CHC1SOFOI6lAPa4uJtM5C7raa6i38XkAI0dE65EezH3PwtZ37Nq
 LcCeBfbgL4b2W+S0ar8o/GxyUHP5cCX0gQPVndyHFAfWsQTChGS/HoBQN/WTG0eVMEA1
 ZgRgD2Az4bkrtHjZ18g9iz4BPs1Fi+BJVM/h1Kw/3zbVAQQ/BpJerOVPJ3QOJPf0X4ji
 rwgkB8wzwYG2PaRa9WQMV++CXSdDO3GCsFoxxbQgVrHCkxPpletuMpv44h31uT17EzP9
 qh5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jT0EXhdL
Subject: Re: [Buildroot] [PATCH v2 1/2] package/pkg-meson: h files only into
 sysroot
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

SGkgVmluY2VudCwKCk9uIFR1ZSBOb3YgMjYsIDIwMjQgYXQgNzozMCBQTSBDU1QsIFZpbmNlbnQg
SmFyZGluIHdyb3RlOgo+IE1hbnkgcGFja2FnZXMgYnVpbHQgd2l0aCBCdWlsZHJvb3QgYW5kIG1l
c29uIGN1cnJlbnRseSBpbnN0YWxsIGhlYWRlcgo+IGZpbGVzIGludG8gYm90aDoKPiAgIC0gdGhl
IHRhcmdldOKAmXMgL3Vzci9pbmNsdWRlLCBhbmQKPiAgIC0gdGhlIHN5c3Jvb3TigJlzIC91c3Iv
aW5jbHVkZS4KPgo+IFdoZW4gRk9PX01FU09OX0lOU1RBTExfVEFHUyA9IFlFUywgZW5zdXJlIHRo
YXQgaGVhZGVyIGZpbGVzIGFyZQo+IGluc3RhbGxlZCBleGNsdXNpdmVseSBpbiB0aGUgc3RhZ2lu
ZyAoc3lzcm9vdCkgdGFyZ2V0IGR1cmluZyB0aGUKPiBidWlsZCBwcm9jZXNzLgo+Cj4gVGhlIGRl
ZmF1bHQgaXMgRk9PX01FU09OX0lOU1RBTExfVEFHUyA/PSBOTyBpbiBvcmRlciB0byBhdm9pZAo+
IGNoYW5naW5nIHRvIHRoaXMgbmV3IGJlaGF2aW91ciBmb3IgdGhlIHRpbWUgYmVpbmcuCgpUaGlz
IHNldHRpbmcgaGFzIGRpbWluaXNoZWQgdmFsdWUgaWYgaXQgaXMgZGVmYXVsdCBvZmYuIEhhdmUg
eW91IGRvbmUgYQpzaWRlLWJ5LXNpZGUgYnVpbGQgdG8gc2VlIGhvdyBtYW55IHBhY2thZ2VzIHRo
aXMgYnJlYWtzPwoKPgo+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgSmFyZGluIDx2amFyZGluQGZy
ZWUuZnI+Cj4gU3VnZ2VzdGVkLWJ5OiBSb2JpbiBKYXJyeSA8cm9iaW5AamFycnkuY2M+Cj4gU3Vn
Z2VzdGVkLWJ5OiBCcmFuZG9uIE1haWVyIDxicmFuZG9uLm1haWVyQGdtYWlsLmNvbT4KPiAtLS0K
PiAgcGFja2FnZS9wa2ctbWVzb24ubWsgfCAxMSArKysrKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvcGtnLW1lc29uLm1rIGIvcGFja2FnZS9wa2ctbWVzb24ubWsKPiBpbmRleCBiYzgwNWI3OTlj
Li5hYTJhZDUzODlhIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcGtnLW1lc29uLm1rCj4gKysrIGIv
cGFja2FnZS9wa2ctbWVzb24ubWsKPiBAQCAtMjIwLDEwICsyMjAsMTMgQEAgZW5kaWYKPiAgaWZu
ZGVmICQoMilfSU5TVEFMTF9DTURTCj4gIGRlZmluZSAkKDIpX0lOU1RBTExfQ01EUwo+ICAJJCQo
SE9TVF9NQUtFX0VOVikgJCQoJCQoUEtHKV9OSU5KQV9FTlYpIFwKPiAtCQkkJChOSU5KQSkgJCQo
TklOSkFfT1BUUykgLUMgJCQoJCQoUEtHKV9TUkNESVIpL2J1aWxkIGluc3RhbGwKPiArCQkkJChN
RVNPTikgaW5zdGFsbCAtQyAkJCgkJChQS0cpX1NSQ0RJUikvYnVpbGQKPiAgZW5kZWYKPiAgZW5k
aWYKPgo+ICsjIERlZmF1bHQgdmFsdWVzIGZvciBTdGFnaW5nIGluc3RhbGxhdGlvbiBhbmQgVGFy
Z2V0IGluc3RhbGxhdGlvbgo+ICskKDIpX01FU09OX0lOU1RBTExfVEFHUyA/PSBOTwo+ICsKPiAg
Iwo+ICAjIFN0YWdpbmcgaW5zdGFsbGF0aW9uIHN0ZXAuIE9ubHkgZGVmaW5lIGl0IGlmIG5vdCBh
bHJlYWR5IGRlZmluZWQgYnkKPiAgIyB0aGUgcGFja2FnZSAubWsgZmlsZS4KPiBAQCAtMjMxLDcg
KzIzNCw4IEBAIGVuZGlmCj4gIGlmbmRlZiAkKDIpX0lOU1RBTExfU1RBR0lOR19DTURTCj4gIGRl
ZmluZSAkKDIpX0lOU1RBTExfU1RBR0lOR19DTURTCj4gIAkkJChUQVJHRVRfTUFLRV9FTlYpICQk
KCQkKFBLRylfTklOSkFfRU5WKSBERVNURElSPSQkKFNUQUdJTkdfRElSKSBcCj4gLQkJJCQoTklO
SkEpICQkKE5JTkpBX09QVFMpIC1DICQkKCQkKFBLRylfU1JDRElSKS9idWlsZCBpbnN0YWxsCj4g
KwkJJCQoTUVTT04pIGluc3RhbGwgLUMgXAo+ICsJCSAgJCQoJCQoUEtHKV9TUkNESVIpL2J1aWxk
ICQoaWYgJChmaWx0ZXIgWUVTLCQoJChQS0cpX01FU09OX0lOU1RBTExfVEFHUykpLC0tdGFncz1y
dW50aW1lLGRldmVsKQoKVGhlIGNvbW1hIGluICItLXRhZz1ydW5ldGltZSxkZXZlbCIgaXMgdHJl
YXRlZCBhcyB0aGUgTWFrZWZpbGUgc2VwYXJhdG9yCmZvciAiJChpZiB4LCB5LCB6KSIuIFVzZSAi
LS10YWc9cnVudGltZSQoY29tbWEpZGV2ZWwiIGluc3RlYWQgd2hpY2gKc3Vic3RpdHV0ZXMgYSBs
aXRlcmFsIGNvbW1hLgoKVGhlIHNpbmdsZSAiJCIgbmVlZCB0byBiZSAiJCQiIHNvIHRoZXkgYXJl
IHByb3Blcmx5IGVzY2FwZWQuIChFeGNlcHQKIiQoY29tbWEpIikKClRoYW5rcywKQnJhbmRvbgoK
PiAgZW5kZWYKPiAgZW5kaWYKPgo+IEBAIC0yNDIsNyArMjQ2LDggQEAgZW5kaWYKPiAgaWZuZGVm
ICQoMilfSU5TVEFMTF9UQVJHRVRfQ01EUwo+ICBkZWZpbmUgJCgyKV9JTlNUQUxMX1RBUkdFVF9D
TURTCj4gIAkkJChUQVJHRVRfTUFLRV9FTlYpICQkKCQkKFBLRylfTklOSkFfRU5WKSBERVNURElS
PSQkKFRBUkdFVF9ESVIpIFwKPiAtCQkkJChOSU5KQSkgJCQoTklOSkFfT1BUUykgLUMgJCQoJCQo
UEtHKV9TUkNESVIpL2J1aWxkIGluc3RhbGwKPiArCQkkJChNRVNPTikgaW5zdGFsbCAtQyBcCj4g
KwkJICAkJCgkJChQS0cpX1NSQ0RJUikvYnVpbGQgJChpZiAkKGZpbHRlciBZRVMsJCgkKFBLRylf
TUVTT05fSU5TVEFMTF9UQUdTKSksLS10YWdzPXJ1bnRpbWUpCj4gIGVuZGVmCj4gIGVuZGlmCj4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
