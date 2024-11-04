Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A20FD1BDC5
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 16:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E418C40538;
	Mon,  4 Nov 2024 16:53:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jyBdRfMrVEEH; Mon,  4 Nov 2024 16:53:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0EE640565
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0EE640565;
	Mon,  4 Nov 2024 16:53:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 59DE4962
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 16:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4843380E52
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 16:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f1LaKD7b_iAp for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 16:53:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.219.177;
 helo=mail-yb1-f177.google.com; envelope-from=bryce.d.johnson@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7408380E2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7408380E2D
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7408380E2D
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 16:53:11 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e30d1d97d20so3868457276.2
 for <buildroot@buildroot.org>; Mon, 04 Nov 2024 08:53:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730739190; x=1731343990;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SuvCRblXBE3x9lWQzebfUfKJ+k+NIsXFrktD/4xZYE0=;
 b=QMNpztIf5/huaI6M/kMCM6oigfbusPilpIrbOawQl61PPDuwAPVj2lEDT4+ZQi52n/
 mTe2G+ICQkQNwulPmguelmLilXqvB69Eakht3l2nAzV4p5yMNF5qbuzsVvOeqWYh1nSy
 JYHnzDjx0haXyMy8iyzF63lq7oMZYyqejEdPEix/W+tzNfJYJGB7/oqDAViuO9E7f27N
 mGfTgZDCB7oC/mdxKg1u6vY5h8hLbhHw7pEMzVHypX12TqCzgF6yZMLA3XDGBUk6Id8B
 JzFj+AHV5JazeXkH4FWepGmq57nnrNA2QauUcQ5B+eoq7Rug9VOiGcIlPusVfCW8vHDe
 u+VQ==
X-Gm-Message-State: AOJu0YzVkJ936kVGxU16EcmqEPc1d448u+8gZELK2HDz533To7CgpmrD
 wReGxy5+a7sS9HhIoMB9JXycP18OAcLZ252yJOy6jy8NqAEj1rObmydRYg==
X-Google-Smtp-Source: AGHT+IG9kjNj3km1ypZItL99dPfYF48MQvVT65VZX84+o+apSCTz/0OBPFNs2JsSSUAkNyvnBK/VVQ==
X-Received: by 2002:a05:690c:45c4:b0:6e3:23df:cc25 with SMTP id
 00721157ae682-6e9d8a76a3emr365226437b3.26.1730739189933; 
 Mon, 04 Nov 2024 08:53:09 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com.
 [209.85.128.170]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6ea55ac9928sm18765057b3.17.2024.11.04.08.53.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 08:53:09 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-6e9f69cc576so32088867b3.0
 for <buildroot@buildroot.org>; Mon, 04 Nov 2024 08:53:09 -0800 (PST)
X-Received: by 2002:a05:690c:9a0a:b0:6e3:21a9:d3c9 with SMTP id
 00721157ae682-6e9d8962048mr330035167b3.9.1730739189116; Mon, 04 Nov 2024
 08:53:09 -0800 (PST)
MIME-Version: 1.0
References: <20241022225457.568323-1-bryce@redpinelabs.com>
 <20241022225457.568323-3-bryce@redpinelabs.com>
 <20241030220902.yo475pa5avafzo4c@bryanbrattlof.com>
In-Reply-To: <20241030220902.yo475pa5avafzo4c@bryanbrattlof.com>
From: Bryce Johnson <bryce@redpinelabs.com>
Date: Mon, 4 Nov 2024 09:52:58 -0700
X-Gmail-Original-Message-ID: <CADXxVSKZPX68AMzYhu7zyV7sKmfUdVkvX8+d=vprh5GOMEW6eQ@mail.gmail.com>
Message-ID: <CADXxVSKZPX68AMzYhu7zyV7sKmfUdVkvX8+d=vprh5GOMEW6eQ@mail.gmail.com>
To: Bryan Brattlof <bb@ti.com>
Cc: buildroot@buildroot.org, Xuanhao Shi <X15000177@gmail.com>, 
 Anand Gadiyar <gadiyar@ti.com>
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=redpinelabs.com
Subject: Re: [Buildroot] [PATCH 3/3] boot/ti-k3-r5-loader: use
 HOST_ARM_GNU_TOOLCHAIN_SUPPORTS
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

SGV5IEJyeWFuLApOb3Qgc3VyZSBvbiB0aGF0IG9uZS4gIEkgdGhpbmsgdGhlIEJSMl9hYXJjaDY0
IGlzIHRoZXJlIHNpbmNlIHRoZSBhbTYqCnRoYXQgdXNlIHRoZSB0aS1rMy1yNS1sb2FkZXIgYXJl
IGFsbCBhYXJjaDY0IGFwcGxpY2F0aW9uIHByb2Nlc3NvcnMKZXZlbiB0aG91Z2ggdGhlIFI1IGlz
IDMyYml0PyAgTXkgZ3Vlc3MgaXMgaXQgcHJvYmFibHkgaXNuJ3QgbmVlZGVkLgpBbnkgcmVhc29u
IHNvbWVvbmUgd291bGQgd2FudCB0byBidWlsZCB0aGUgYW02MiogYXMgMzItYml0LCB0aGVuIHRo
ZXJlCm1pZ2h0IGJlIGFuIGlzc3VlIHdpdGggaGF2aW5nIHRoYXQgdGhlcmUuCgpCcnljZQoKCk9u
IFdlZCwgT2N0IDMwLCAyMDI0IGF0IDQ6MDnigK9QTSBCcnlhbiBCcmF0dGxvZiA8YmJAdGkuY29t
PiB3cm90ZToKPgo+IEhpIEJyeWNlIQo+Cj4gT24gT2N0b2JlciAyMiwgMjAyNCB0aHVzIHNheWV0
aCBCcnljZSBKb2huc29uOgo+ID4gVG8gY2hlY2sgZm9yIHZhbGlkIHg4Nl82NCBvciBhYXJjaDY0
IGNvbmZpZ3VyYXRpb24gZm9yIGFybTMyIHRvb2xjaGFpbgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IEJyeWNlIEpvaG5zb24gPGJyeWNlQHJlZHBpbmVsYWJzLmNvbT4KPiA+IC0tLQo+ID4gIGJvb3Qv
dGktazMtcjUtbG9hZGVyL0NvbmZpZy5pbiB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9ib290L3RpLWszLXI1LWxvYWRlci9Db25m
aWcuaW4gYi9ib290L3RpLWszLXI1LWxvYWRlci9Db25maWcuaW4KPiA+IGluZGV4IDhjNzg5OGVi
ZjYuLmZlNDI5YmI4YjQgMTAwNjQ0Cj4gPiAtLS0gYS9ib290L3RpLWszLXI1LWxvYWRlci9Db25m
aWcuaW4KPiA+ICsrKyBiL2Jvb3QvdGktazMtcjUtbG9hZGVyL0NvbmZpZy5pbgo+ID4gQEAgLTEs
NiArMSw3IEBACj4gPiAgY29uZmlnIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSCj4gPiAgICAg
ICBib29sICJ0aS1rMy1yNS1sb2FkZXIiCj4gPiAgICAgICBkZXBlbmRzIG9uIEJSMl9hYXJjaDY0
Cj4gPiArICAgICBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hPU1RfQVJNX0dOVV9UT09MQ0hBSU5f
U1VQUE9SVFMKPgo+IFRoaXMgcGFja2FnZSBpcyByZWFsbHkgb25seSBoZXJlIGZvciBUSSdzIEsz
IFNvQ3MuIFdvdWxkIGl0IG1ha2Ugc2Vuc2UKPiB0byBkcm9wIHRoZSBCUjJfYWFyY2g2NCBoZXJl
IGZvciB0aGlzIG9yIHRvIGtlZXAgQlIyX2FhcmNoNjQ/Cj4KPiB+QnJ5YW4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
