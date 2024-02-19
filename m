Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A37FC54766
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 09:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDD9A4066D;
	Mon, 19 Feb 2024 09:37:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id adX0TarUEh-i; Mon, 19 Feb 2024 09:37:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 121FC40794
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 121FC40794;
	Mon, 19 Feb 2024 09:37:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D55091BF5E9
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 09:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF9FF60AE0
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 09:37:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tAkCMBkLV47e for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 09:37:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9A7D960ADF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A7D960ADF
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A7D960ADF
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 09:36:59 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-412698cdd77so1427775e9.1
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 01:36:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708335417; x=1708940217;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oLcIlsySnJPBo7CcijDbQEzgQrQWhvEYyuHFoXLQ+Zk=;
 b=wyy8RH1Y4Lh3M2x2v3+3qmna8+ag2Ew+he+73KDPtWB3h+qiUVVmUivt9V8qXtmneM
 e4yqvmBoxKX4GRHmVGMpdmSj92SfEg3OpsKuIevQWDxzZ4R2c1BfW99VBVFEimOKN/0x
 vxi6361pqWwQdpJ20H+FFDnfL3c5sQEd4M92mk7tcu2xgwEbZpF7u38jjTQ0dl9sqf98
 QJU+/n3TKALifhvnbDL6dV7efuYf5NyUMhAvBiNHGe4GaGtzAgRlJQakJLSC/Wl8RyzV
 zof3VGyQfnWP5AzfkhAHHap4x9AYjmvMgrjbndD5O22iHrQgPIPPXGxiNrOmrArDgE3/
 yIMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ4AWHh3vTF4Jgcx5MnpifZsV2B6FHuPBP28qd8Qz+PDFwKnlhOivQLFtO/vDdamXMlXItW/8ngvnHekWOnpDQ9RagUcgvoQ==
X-Gm-Message-State: AOJu0Ywi/iL3qfeZIX1GD2QUp6aSp8gxIGCpfRf4E4ciKca3oYNseg+i
 vmrs4gtNhB1M1/9rWv+rOd6MZpNcmxW+t3c9wYnkLzYjze72CmSpVZVUN4R9cUw=
X-Google-Smtp-Source: AGHT+IH5pdVvmF5tEVLf0fg+LLQ/oQJ/ei0kAHs4H/nRC8lu3Yhk2FihuA7gV8PhhPKRHvZeYue3Ww==
X-Received: by 2002:a05:600c:3546:b0:411:ec07:9b6e with SMTP id
 i6-20020a05600c354600b00411ec079b6emr14138932wmq.6.1708335417580; 
 Mon, 19 Feb 2024 01:36:57 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 g19-20020a7bc4d3000000b004126101915esm5018928wmk.4.2024.02.19.01.36.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 01:36:57 -0800 (PST)
Message-ID: <6b3561ef-a245-4bb4-baa3-c41864aa8b61@smile.fr>
Date: Mon, 19 Feb 2024 10:36:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-2-dario.binacchi@amarulasolutions.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240217160244.1320482-2-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708335417; x=1708940217;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oLcIlsySnJPBo7CcijDbQEzgQrQWhvEYyuHFoXLQ+Zk=;
 b=jkFRO3xasY9Bp13S3oeVBSOMAWRwc1KA0zzTWahiSKTQqs4DBQHCISl0fBUlcMCcsC
 9xNyrT+eh5tZNpUNFRLbB8wIW0hIF6SrEifwuXHIqkkElHZawJt3jhVdoKQyZ0Shiex/
 zeNBL5BA2dtmbEtArJ+8eiFVQHE33r2MXtEIwfoTntCEzdeoWeMxSRYvcwXbMWdEy056
 aDBZ6CSUyo47Ea0KEOJxFxsSMfFVdGqcqjnqJLbTEZdeL5S2rnRmBwK/R+FjQTrID4Gd
 2gNd8L8sdZOJRTllJF3E1aG2qcOeBKUSKp870ZBradCStFTbMClO9hoiOX48RDtTQ/rF
 MTjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=jkFRO3xa
Subject: Re: [Buildroot] [PATCH v4 01/20] configs/ti_am62x_sk_defconfig: fix
 BR2_TARGET_OPTEE_OS_PLATFORM setting
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
Y3JpdMKgOgo+IENoZWNraW5nIHRoZSBvdXRwdXQgb2YgdGhlIGNvbW1hbmQgYGdpdCBncmVwIFBM
QVRGT1JNIHwgZ3JlcCBrM2AsIHdlIGNhbgo+IGZvdW5kIHRoZSBwcm9wZXIgc2V0dGluZ3MgZm9y
IHRoZSBvcHRlZS1vcyBwYWNrYWdlOgo+IAo+IC5naXRodWIvd29ya2Zsb3dzL2NpLnltbDogICAg
ICAgICAgX21ha2UgUExBVEZPUk09azMtYW02MngKPiAuZ2l0aHViL3dvcmtmbG93cy9jaS55bWw6
ICAgICAgICAgIF9tYWtlIFBMQVRGT1JNPWszLWFtNjJ4IENGR19BUk02NF9jb3JlPXkKPiAuLi4K
PiBjb3JlL2FyY2gvYXJtL3BsYXQtazMvY29uZi5tazppZm5lcSAoLCQoZmlsdGVyICR7UExBVEZP
Uk1fRkxBVk9SfSxhbTY1eCBqNzIxZSBqNzg0czQgYW02NHggYW02MngpKQoKU2V0dGluZyBCUjJf
VEFSR0VUX09QVEVFX09TX1BMQVRGT1JNX0ZMQVZPUiBkb2Vzbid0IHNlZW1zIG5lY2Vzc2FyeSBz
aW5jZQpvcHRlZS1vcyBNYWtlZmlsZSBjYW4gZXh0cmFjdCBpdCBmcm9tIEJSMl9UQVJHRVRfT1BU
RUVfT1NfUExBVEZPUk0gWzFdLgoKWzFdCmh0dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvbWV0
YS10aS9jb21taXQvP2lkPTkxMjk4M2RkNTYyYmE1ZjAwOWE0ZGIzNGU4YWJlMzgxMGM4ZWQ3YWMK
CkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBTdWdnZXN0ZWQtYnk6IFJvbWFpbiBOYW91ciA8
cm9tYWluLm5hb3VyQHNtaWxlLmZyPgo+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxk
YXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiAKPiAtLS0KPiAKPiBBZGRlZCBp
biB2NAo+IAo+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBh
bWFydWxhc29sdXRpb25zLmNvbT4KPiAtLS0KPiAgY29uZmlncy90aV9hbTYyeF9za19kZWZjb25m
aWcgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnIGIvY29u
Zmlncy90aV9hbTYyeF9za19kZWZjb25maWcKPiBpbmRleCBmODgyNTJhODljNjguLmZkZTZmOGY1
NjM2YSAxMDA2NDQKPiAtLS0gYS9jb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZwo+ICsrKyBi
L2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnCj4gQEAgLTIxLDcgKzIxLDggQEAgQlIyX1RB
UkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9QTEFURk9STT0iazMiCj4gIEJSMl9UQVJHRVRfQVJN
X1RSVVNURURfRklSTVdBUkVfVEFSR0VUX0JPQVJEPSJsaXRlIgo+ICBCUjJfVEFSR0VUX0FSTV9U
UlVTVEVEX0ZJUk1XQVJFX0JMMzJfT1BURUU9eQo+ICBCUjJfVEFSR0VUX09QVEVFX09TPXkKPiAt
QlIyX1RBUkdFVF9PUFRFRV9PU19QTEFURk9STT0iazMiCj4gK0JSMl9UQVJHRVRfT1BURUVfT1Nf
UExBVEZPUk09ImszLWFtNjJ4Igo+ICtCUjJfVEFSR0VUX09QVEVFX09TX1BMQVRGT1JNX0ZMQVZP
Uj0iYW02MngiCj4gIEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOPXkKPiAgQlIyX1RBUkdFVF9U
SV9LM19JTUFHRV9HRU5fU09DX0FNNjJYPXkKPiAgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVI9
eQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
