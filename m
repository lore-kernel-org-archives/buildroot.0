Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84645C5478C
	for <buildroot@archiver.kernel.org>; Thu, 22 Feb 2024 22:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07AEA41C0A;
	Thu, 22 Feb 2024 22:04:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bng9R6n-hWtS; Thu, 22 Feb 2024 22:04:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F35C141D7B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F35C141D7B;
	Thu, 22 Feb 2024 22:04:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2296A1BF3D6
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 22:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E8C26088F
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 22:04:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qjJOc3T_shHn for <buildroot@lists.busybox.net>;
 Thu, 22 Feb 2024 22:04:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8CA066088E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CA066088E
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CA066088E
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 22:04:13 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33d9c3f36c2so143553f8f.2
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 14:04:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708639451; x=1709244251;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tubT4Na3j2IFWZZQONc8Jtao+BYry6RTzPrYPYN7Zvo=;
 b=SVnKU69Pe3JGsq0PmOp/DBiCf+oxUiv470WPjD7cE01ezyhpE/9dVFYfKey3QXW+c3
 SCfU0timaNyL0u9ouhCF+xbCiHT3DNjUTjkxFgDRa0s7+xLaeUXzu9v+Tb2Z5XlJpW9J
 RaqgH3dkVVm04/MpVRla9loV6e+pJQ/Cd+bq0f7K485lwCuaQ0inlzh/Dx2Q0Af9mZ4q
 D2aT3P6zd1C8lQa5PgxE22a1CUpQ+vcAcRl8egM5DfIANX2Q+TRRhxQHUQLqbRVfzmJY
 1lWFpMUwHG5Zf920VeqfFN236E7hHC8GGyaAW+n6GMbwX4fHuisNPhV9ho2aCvihVjNF
 Mu9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV39+8shpqJAussOLMVrpzGDtivJEoVCBazdMAbIKWiRME3fxwLBVzSDQd+7JPIONyNHQBP/g0L1bWU5cw7haSZIM09Y/uAcg==
X-Gm-Message-State: AOJu0YxTW31hFvSzcQq2GOIYFPPNSH0GEUpAVz8U6meCUA5YRl6igSS2
 VycvgVo/Bp/iIYRwL+D3M7qNxxgNcDWVt1AuLKpM65DSQRf674Y8Iy+A43zIWySnYi9TAc9gD0k
 b
X-Google-Smtp-Source: AGHT+IGlTyUXSleZ9rrZV/WgRQUrjO6hLshK4AyZaNkBzYRT7482AkeJ5zngd0lJbPZ79q9GYcl3Ww==
X-Received: by 2002:adf:ef43:0:b0:33d:269e:132a with SMTP id
 c3-20020adfef43000000b0033d269e132amr250123wrp.15.1708639451500; 
 Thu, 22 Feb 2024 14:04:11 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 h14-20020adfa4ce000000b0033d56aa4f45sm311957wrb.112.2024.02.22.14.04.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 14:04:11 -0800 (PST)
Message-ID: <8233b0af-d9be-4b36-b190-201e3095d870@smile.fr>
Date: Thu, 22 Feb 2024 23:04:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
 <20240222101617.18422-12-dario.binacchi@amarulasolutions.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240222101617.18422-12-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708639451; x=1709244251;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tubT4Na3j2IFWZZQONc8Jtao+BYry6RTzPrYPYN7Zvo=;
 b=FyIAwOxm16/fCW24rzCq0wIO1V8aKsegABjzNNIhdi7dH7N95BUKCjEGTl6mPojl70
 2K7xnSEFOak02/FVoY38vpcPtaJQBHyynBoFeE4HwraeQrLK2Ob5Ze+ud2Fo71dHET3y
 KxWYdwoyE0AeJP3oP1Cz8A4I5fn1qyrtpiuAHM5+xUzkqFLnX0If6NZiJn/1bAbtsIRT
 T290XQCAsJe72kX/uBREMJhT7rxkF3IgrHut+j6Txjef/AuW8EvCyoT29WiED/iP/jrT
 7iCJDbWU0uEXntke74ttW2gYSHNrMJFImg58nXnrtXxxGnhS94ghu/hKwMcZsC6LPrQg
 omIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=FyIAwOxm
Subject: Re: [Buildroot] [PATCH v5 11/16] boot/ti-k3-r5-loader: set binman
 environment
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

SGVsbG8gRGFyaW8sCgpMZSAyMi8wMi8yMDI0IMOgIDExOjE2LCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IFJlY2VudCB2ZXJzaW9uIG9mIFUtQm9vdCB1c2UgYmlubWFuIHRvIHByb3ZpZGUg
YSBtZWNoYW5pc20gZm9yIGJ1aWxkaW5nCj4gaW1hZ2VzLCBmcm9tIHNpbXBsZSBTUEwgKyBVLUJv
b3QgY29tYmluYXRpb25zLCB0byBtb3JlIGNvbXBsZXgKPiBhcnJhbmdlbWVudHMgd2l0aCBtYW55
IHBhcnRzLgo+IAo+IFRoZSBwYXRjaCBzZXQgdGhlIEJJTk1BTl9JTkRJUlMgZW52aXJvbm1lbnQg
dmFyaWFibGUgdG8gcHJvdmlkZSB0aGUKPiBkaXJlY3RvcnkgdG8gc2VhcmNoIGZvciBiaW5hcnkg
YmxvYnMgYW5kIHNlbGVjdCB0aGUgcGFja2FnZXMgcmVxdWlyZWQgYnkKPiBiaW5tYW4uCj4gCj4g
Q28tZGV2ZWxvcGVkLWJ5OiBNaWNoYWVsIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxhc29sdXRp
b25zLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFy
dWxhc29sdXRpb25zLmNvbT4KPiBDby1kZXZlbG9wZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWlu
Lm5hb3VyQHNtaWxlLmZyPgo+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5h
b3VyQHNtaWxlLmZyPgo+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5h
Y2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiAKPiAtLS0KPiAKPiBDaGFuZ2VzIGluIHY1Ogo+
IC0gQWRkIGRlcGVuZGVjeSBvbiBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDX1RBUkdFVF9BUkNIX1NV
UFBPUlRTCj4gLSBEcm9wIHJ1bnRpbWUgZGVwZW5kZWNpZXMKPiAtIEFkZCBob3N0LXB5dGhvbi1w
eWxpYmZkdCBkZXBlbmRlbmN5IHdpdGhvdXQgcmVxdWlyaW5nCj4gICBCUjJfVEFSR0VUX1VCT09U
X05FRURTX1BZTElCRkRUIGNvbmZpZ3VyYXRpb24KPiAtIEFkZCBob3N0LXB5dGhvbjMgYW5kIGhv
c3QtcHl0aG9uLXNldHVwdG9vbHMgZGVwZW5kZW5jaWVzCj4gLSBBZGQgU09CIGFuZCBDT0IgdGFn
cyBvZiBSb21haW4gTmFvdXIKPiAKPiBDaGFuZ2VzIGluIHY0Ogo+IC0gRHJvcCB0aGUgQlIyX1RB
UkdFVF9USV9LM19SNV9MT0FERVJfVVNFX0JJTk1BTiBvcHRpb24KPiAKPiBDaGFuZ2VzIGluIHYy
Ogo+IC0gQ2hhbmdlIGNvbW1pdCBtZXNzYWdlCj4gLSBBZGQgQlIyX1RBUkdFVF9USV9LM19SNV9M
T0FERVJfVVNFX0JJTk1BTiBvcHRpb24KPiAtIFNlbGVjdCBwYWNrYWdlcyByZXF1aXJlZCBieSBi
aW5tYW4gaWYKPiAgIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX1VTRV9CSU5NQU4gaXMgZW5h
YmxlZAo+IAo+ICBib290L3RpLWszLXI1LWxvYWRlci9Db25maWcuaW4gICAgICAgICAgfCAxICsK
PiAgYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rIHwgOCArKysrKysrLQo+
ICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRp
ZmYgLS1naXQgYS9ib290L3RpLWszLXI1LWxvYWRlci9Db25maWcuaW4gYi9ib290L3RpLWszLXI1
LWxvYWRlci9Db25maWcuaW4KPiBpbmRleCA1Zjg2YzA0NWM5OWYuLmZjNzEzMzdlODBjYyAxMDA2
NDQKPiAtLS0gYS9ib290L3RpLWszLXI1LWxvYWRlci9Db25maWcuaW4KPiArKysgYi9ib290L3Rp
LWszLXI1LWxvYWRlci9Db25maWcuaW4KPiBAQCAtMSw2ICsxLDcgQEAKPiAgY29uZmlnIEJSMl9U
QVJHRVRfVElfSzNfUjVfTE9BREVSCj4gIAlib29sICJ0aS1rMy1yNS1sb2FkZXIiCj4gIAlkZXBl
bmRzIG9uIEJSMl9hYXJjaDY0Cj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hPU1RfUlVTVENf
VEFSR0VUX0FSQ0hfU1VQUE9SVFMgIyBweXRob24tcnBkcy1weSAtPiBweXRob24tanNvbnNjaGVt
YQo+ICAJaGVscAo+ICAJICBTZXBhcmF0ZSBVLUJvb3QgU1BMIGJ1aWxkIGZvciBSNSBjb3JlIG9u
IFRJJ3MgSzMgcHJvY2Vzc29ycy4KPiAgCSAgVXN1YWxseSB1c2VkIHRvIGJ1aWxkIHRpYm9vdDMu
YmluIHdpdGggazMtaW1hZ2UtZ2VuLgo+IGRpZmYgLS1naXQgYS9ib290L3RpLWszLXI1LWxvYWRl
ci90aS1rMy1yNS1sb2FkZXIubWsgYi9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2Fk
ZXIubWsKPiBpbmRleCAwZmZjYjgyMzVmMmUuLmZkYjA1OGYzYjcyYSAxMDA2NDQKPiAtLS0gYS9i
b290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKPiArKysgYi9ib290L3RpLWsz
LXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKPiBAQCAtMzksNyArMzksMTIgQEAgVElfSzNf
UjVfTE9BREVSX0RFUEVOREVOQ0lFUyA9IFwKPiAgCWhvc3QtcGtnY29uZiBcCj4gIAkkKEJSMl9N
QUtFX0hPU1RfREVQRU5ERU5DWSkgXAo+ICAJaG9zdC1hcm0tZ251LXRvb2xjaGFpbiBcCj4gLQlo
b3N0LW9wZW5zc2wKPiArCWhvc3Qtb3BlbnNzbCBcCj4gKwlob3N0LXB5dGhvbi1qc29uc2NoZW1h
IFwKPiArCWhvc3QtcHl0aG9uLXB5eWFtbCBcCj4gKwlob3N0LXB5dGhvbjMgXAo+ICsJaG9zdC1w
eXRob24tc2V0dXB0b29scyBcCj4gKwlob3N0LXB5dGhvbi1weWxpYmZkdAoKVGhlIGRlcGVuZGVu
Y3kgb2YgYmlubWFuIGlzIG5vdCByZWFsbHkgZWFzeSB0byBmb2xsb3cuCgpGaXJzdCB3ZSBoYXZl
IHRoZSBwYWNrYWdlcyBsaXN0IGZyb20gYmlubWFuLnJzdCBbMV0gdGhlbiB3ZSBoYXZlIHRvIGlu
c3RhbGwKYWRkaXRpb25hbCBweXRob24gbW9kdWxlcyBbMl0uCgpJJ20gbm90IHN1cmUgaWYgd2Ug
YWxzbyBuZWVkIGhvc3QtbHptYSBhbmQgaG9zdC1sejQgaW4gZGVwZW5kZW5jeS4KCk1heWJlIGFk
ZCBhIGNvbW1lbnQgdG8gcmV0cmlldmUgdGhpcyBwYWNrYWdlIGxpc3Q/CgpbMV0KaHR0cHM6Ly9z
b3VyY2UuZGVueC5kZS91LWJvb3QvdS1ib290Ly0vYmxvYi92MjAyNC4wMS90b29scy9iaW5tYW4v
YmlubWFuLnJzdD9wbGFpbj0xI0wzNzcKClsyXQpodHRwczovL3NvdXJjZS5kZW54LmRlL3UtYm9v
dC91LWJvb3QvLS9ibG9iL3YyMDI0LjAxL3Rvb2xzL2J1aWxkbWFuL3JlcXVpcmVtZW50cy50eHQK
CkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAgCj4gIFRJX0szX1I1X0xPQURFUl9NQUtFID0gJChC
UjJfTUFLRSkKPiAgVElfSzNfUjVfTE9BREVSX01BS0VfRU5WID0gJChUQVJHRVRfTUFLRV9FTlYp
Cj4gQEAgLTU4LDYgKzYzLDcgQEAgVElfSzNfUjVfTE9BREVSX01BS0VfT1BUUyA9IFwKPiAgCUNS
T1NTX0NPTVBJTEU9JChIT1NUX0RJUikvYmluL2FybS1ub25lLWVhYmktIFwKPiAgCUFSQ0g9YXJt
IFwKPiAgCUhPU1RDQz0iJChIT1NUQ0MpICQoc3Vic3QgLUkvLC1pc3lzdGVtIC8sJChzdWJzdCAt
SSAvLC1pc3lzdGVtIC8sJChIT1NUX0NGTEFHUykpKSIgXAo+ICsJQklOTUFOX0lORElSUz0kKEJJ
TkFSSUVTX0RJUikgXAo+ICAJSE9TVExERkxBR1M9IiQoSE9TVF9MREZMQUdTKSIKPiAgCj4gIGRl
ZmluZSBUSV9LM19SNV9MT0FERVJfQlVJTERfQ01EUwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
