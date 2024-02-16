Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6C8C48260
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 21:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59C164213F;
	Fri, 16 Feb 2024 21:52:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oy5ZsgCPxW48; Fri, 16 Feb 2024 21:52:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12866420F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12866420F9;
	Fri, 16 Feb 2024 21:52:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F22A51BF2C7
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 21:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E62BB8409B
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 21:52:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TxOdk9CoDbak for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 21:52:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7A7DF83FF3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A7DF83FF3
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A7DF83FF3
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 21:52:24 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2d204e102a9so32203351fa.0
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 13:52:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708120342; x=1708725142;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NnneX+w4a8p6etrnmtz5cZYdM38/loQs1t7Dr8ctZOg=;
 b=IOigssY+74N49pafU6moVAbJV2KtiCVKbV6nxYcyaHKswniozhfuYDkRLDLeJ6yCW4
 E7oEsX6Hqc5b9Y1cHbolUEXG3ODg9JTL8r/NS0hoCpfSFzzge1RpzRrTSUhJr68UpBcs
 RBrQlmZec7SuOCP7llo+z92wiQURUBN7M3ATbaTu7U5uY0Usnl8FHoImto9W24bZqDLL
 E4oN5cWEwsamNP0yHfmXHvZfTS6dVAlAn6ZoJ1SgcZtfwXg323mjBpPj0pZ+WJPJ7njE
 G5XtblsSkppSIXx0emNrDzpp38hpD4DHrvn4hELvWdsU2cApvMp/Zja0sTmV8cZGcfmX
 t2OA==
X-Gm-Message-State: AOJu0YxFXn4NUG5OXfpbI7vIv6dg2heJk1Bchh8/eJxpjv+7jwVovr95
 0wFIn8jEZf4jqrJ1Ci3Z53fcMX8JtrSx6akwfSwS395KMEwuyZmQy+emXRYB5Uc=
X-Google-Smtp-Source: AGHT+IHgl+s4Qgc5w/fIIqRv2ehsPhMha81wfclcqU+M76LtTFSvB9fjBu/usKc8T/zcHnN3YVhdGg==
X-Received: by 2002:a2e:3606:0:b0:2d0:ce22:5174 with SMTP id
 d6-20020a2e3606000000b002d0ce225174mr3677622lja.42.1708120342056; 
 Fri, 16 Feb 2024 13:52:22 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a7bc44e000000b00411d1ce4f9dsm3371103wmi.34.2024.02.16.13.52.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 13:52:21 -0800 (PST)
Message-ID: <735636d6-c0f8-4226-ab8a-1576c2133189@smile.fr>
Date: Fri, 16 Feb 2024 22:52:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andreas Dannenberg <dannenberg@ti.com>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240216201903.lhhkjevrgzcp5msz@dasso>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240216201903.lhhkjevrgzcp5msz@dasso>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708120342; x=1708725142;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NnneX+w4a8p6etrnmtz5cZYdM38/loQs1t7Dr8ctZOg=;
 b=qYtQ68Zz7Kjh9bInSsl3NEHNv8zI6GvF4BwsG5R3DFCKTPYfEYVP++5BG0CSKjvKHw
 jrZQCPpM3gqhjOToYZ372rUA21b8PJ5f1pTkyoph9PsOybh/LR6/ZImWtFQL1RdGb9ZZ
 TvypjrVpz8LXHffx5un+Zy7DUXjB1o4Y7mCwwcihPC6EZx1rLiWfpW+KOkHdB+uwCCjV
 d6w6PN0YggkWEsljU+iftnB5BkAwDFdRwix72uoWow52R9ZOi/nn9ei5dP73MW5Ayj2i
 nuh1cg9pLI5IX2VKaiScNuKWZKO+M0EmQ1FXttlWRCU5ECOJYG0Nw/Ih6cmdrd+qb2Fe
 bCgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=qYtQ68Zz
Subject: Re: [Buildroot] [PATCH 00/21] Add ti_j721e_sk_defconfig
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
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQW5kcmVhcywKCkxlIDE2LzAyLzIwMjQgw6AgMjE6MTksIEFuZHJlYXMgRGFubmVuYmVy
ZyBhIMOpY3JpdMKgOgo+IE9uIFR1ZSwgRmViIDEzLCAyMDI0IGF0IDA2OjI3OjU2UE0gKzAxMDAs
IFJvbWFpbiBOYW91ciB3cm90ZToKPj4gVGhpcyBzZXJpZXMgYWltIHRvIGFkZCB0aGUgU0stVERB
NFZNIGJvYXJkIHN1cHBvcnQgYmFzZWQgb24gVEkgSzMgajcyMWUgU29DLgo+Pgo+PiBUaGlzIHNl
cmllcyBzdGFydCBieSBhZGRpbmcgVS1ib290IGJpbm1hbiBzdXBwb3J0IGFscmVhZHkgc3VibWl0
dGVkIGluIHRoZQo+PiBwcmV2aWV3IHNlcmllcyAiQWRkIHN1cHBvcnQgZm9yIEFNNjJ4LVNLIEhT
LUZTIGRldmljZXMiIGZyb20gRGFyaW8gQmluYWNjaGkKPj4gWzFdLCB3aXRoIHNtYWxsIGltcHJv
dmVtZW50cy4KPj4gU2VlIHRoZSBGT1NERU0gMjAyNCB0YWxrICJTdGFuZGFyZGl6aW5nIHRoZSBn
ZW5lcmF0aW9uIGFuZCBzaWduaW5nIG9mIGJvb3QgaW1hZ2VzIiBbMl0KPiAKPiBUaGFua3MgUm9t
YWluIGFuZCBEYXJpbyBmb3IgYWxsIHRoZSB3b3JrIG9uIHRoaXMsIGFuZCBzdWJtaXR0aW5nIHRo
aXMuCj4gV2lsbCBiZSBzcGVuZGluZyBzb21lIHRpbWUgb3ZlciB0aGUgbmV4dCBmZXcgZGF5cyB0
byBzZWUgaG93IEkgY2FuIGhlbHAKPiBvdXQgd2l0aCB0aGlzIGVmZm9ydC4gSSBjYW4gYWxyZWFk
eSBzZWUgbWFueSBncmVhdCBpbXByb3ZlbWVudHMgc2luY2UKPiB0aGUgbGFzdCB0aW1lIEkgd29y
a2VkIG9uIEFNNjJ4L0FNNjR4IHN1cHBvcnQgbGFzdCB5ZWFyLgoKWW91ciBmZWVkIGJhY2sgb24g
SFMtRlMgZGV2aWNlcyBpcyByZWFsbHkgaGVscGZ1bC4gQWxleGFuZGVyIFN2ZXJkbGluIGFsc28K
aGVscGVkIG9uIEFNNjJ4LgoKTWF5YmUgaWYgeW91IGNhbiBhbHNvIHRlc3Qgb24gQU02NHgganVz
dCB0byBiZSBzdXJlIHRoZSBkZWZjb25maWcgaXMgd29ya2luZy4KCkZvciBub3csIEkgbmVlZCB0
byByZXdvcmsgQU02NHgvQU02Mnggc3VwcG9ydCBzaW5jZSBBbGV4YW5kZXIgcmVwb3J0ZWQgdGhh
dCBoaXMKYm9hcmQgZG9lc24ndCBib290IHRoZSBrZXJuZWwuCgpCZXN0IHJlZ2FyZHMsClJvbWFp
bgoKCj4gCj4gLS0KPiBBbmRyZWFzIERhbm5lbmJlcmcKPiBUZXhhcyBJbnN0cnVtZW50cyBJbmMK
PiAKPiAKPiAKPj4KPj4gV2l0aCBiaW5tYW4gc3VwcG9ydCwgd2UgY2FuIGFkZCB0aGUgVEkgSzMg
ajcyMWUgU29DIHN1cHBvcnQgYnkKPj4gcHJvdmlkaW5nIGFsbCByZXF1aXJlZCBmaXJtd2FyZSBn
ZW5lcmF0ZWQgYnkgdGhlIGJ1aWxkLgo+Pgo+PiBBZGQgdGhlIG5ldyB0aV9qNzIxZV9za19kZWZj
b25maWcgZmlsZSB0byBidWlsZCBhIGJhc2ljIFNEIGNhcmQgaW1hZ2UgdG8KPj4gYm9vdCB0aGUg
Ym9hcmQgKHNlcmlhbCBkZWJ1ZyBhbmQgZXRoZXJuZXQgd29ya2luZykuCj4+Cj4+IFRoYW5rcyB0
byBiaW5tYW4gc3VwcG9ydCwgd2UgY2FuIHJlbW92ZSB0aGUgdGktazMtaW1hZ2UtZ2VuIHRvb2wg
ZnJvbQo+PiBCdWlsZHJvb3QuIFRvIGRvIHRoYXQsIHdlIGhhdmUgdG8gdXBkYXRlIGV4aXN0aW5n
IGRlZmNvbmZpZyAoYW02MiwgYW02NCkuCj4+Cj4+IEZvbGxvd3VwIGNvbW1pdHMgY2FuIGltcHJv
dmUgVEkgSzMgSFMtRlMgZGV2aWNlcyBiYXNlZCBvbiBiaW5tYW4gaW5zdGVhZAo+PiBvZiBsZWdh
Y3kgY29yZS1zZWNkZXYtazMgdG9vbC4KPj4KPj4gWzFdIGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5l
dC9waXBlcm1haWwvYnVpbGRyb290LzIwMjMtRGVjZW1iZXIvNjgxMTM5Lmh0bWwKPj4gWzJdIGh0
dHBzOi8vZm9zZGVtLm9yZy8yMDI0L2V2ZW50cy9hdHRhY2htZW50cy9mb3NkZW0tMjAyNC0zMDY3
LXN0YW5kYXJkaXppbmctdGhlLWdlbmVyYXRpb24tYW5kLXNpZ25pbmctb2YtYm9vdC1pbWFnZXMv
c2xpZGVzLzIyODA4L0ZPU0RFTTI0X1NwZWFrZXJfU2xpZGVzX3k3RnNJS00ucGRmCj4+Cj4+IEJl
c3QgcmVnYXJkcywKPj4gUm9tYWluCj4+Cj4+IERhcmlvIEJpbmFjY2hpICg1KToKPj4gICBwYWNr
YWdlL3B5dGhvbi1hdHRyczogYWRkIGhvc3QgdmFyaWFudAo+PiAgIHBhY2thZ2UvcHl0aG9uLXJw
ZHMtcHk6IGFkZCBob3N0IHZhcmlhbnQKPj4gICBwYWNrYWdlL3B5dGhvbi1yZWZlcmVuY2luZzog
YWRkIGhvc3QgdmFyaWFudAo+PiAgIHBhY2thZ2UvcHl0aG9uLWpzb25zY2hlbWEtc3BlY2lmaWNh
dGlvbnM6IGFkZCBob3N0IHZhcmlhbnQKPj4gICBwYWNrYWdlL3B5dGhvbi1qc29uc2NoZW1hOiBh
ZGQgaG9zdCB2YXJpYW50Cj4+Cj4+IFJvbWFpbiBOYW91ciAoMTYpOgo+PiAgIERFVkVMT1BFUlM6
IGFkZCBSb21haW4gTmFvdXIgZm9yIGFtNTc0eF9pZGtfZGVmY29uZmlnCj4+ICAgY29uZmlncy90
aV9hbTYyeF9za19kZWZjb25maWc6IGZpeCBvcHRlZS1vcyBwbGF0ZWZvcm0KPj4gICBjb25maWdz
L3RpX2FtNjR4X3NrX2RlZmNvbmZpZzogZml4IG9wdGVlLW9zIHBsYXRlZm9ybQo+PiAgIGJvb3Qv
dWJvb3Q6IGFkZCBCUjJfVEFSR0VUX1VCT09UX1VTRV9CSU5NQU4gb3B0aW9uCj4+ICAgYm9vdC90
aS1rMy1yNS1sb2FkZXI6IGFkZCBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9VU0VfQklOTUFO
IG9wdGlvbgo+PiAgIGJvb3QvdGktazMtcjUtbG9hZGVyOiBpbnN0YWxsIHRpYm9vdDMuYmluIGFu
ZCBzeXNmdy5pdGIgdG8KPj4gICAgIEJJTkFSSUVTX0RJUgo+PiAgIGJvb3QvdGktazMtYm9vdC1m
aXJtd2FyZTogaW50cm9kdWNlCj4+ICAgICBCUjJfVEFSR0VUX1RJX0szX0JPT1RfRklSTVdBUkVf
U09DX3tBTTYyQVgsQU02MlgsQU02NFgsQU02NVh9Cj4+ICAgYm9vdC91Ym9vdDogdXNlIERNIGZp
cm13YXJlIG5hbWUgZGVmaW5lZCBieSB0aS1rMy1ib290LWZpcm13YXJlCj4+ICAgICBwYWNrYWdl
Cj4+ICAgYm9vdC90aS1rMy1ib290LWZpcm13YXJlOiBhZGQgQlIyX1RBUkdFVF9USV9LM19CT09U
X0ZJUk1XQVJFX1NPQ19KNzIxRQo+PiAgIGJvb3QvdWJvb3Q6IHJlcGxhY2UgdGktazMtaW1hZ2Ut
Z2VuIG9wdGlvbnMgYnkgdGktazMtZmlybXdhcmUgb3B0aW9ucwo+PiAgIGJvb3QvdWJvb3Q6IGVu
YWJsZSBUSSBLMyBEZXZpY2UgTWFuYWdlciAoRE0pIGZvciBqNzIxZQo+PiAgIGJvb3QvdGktazMt
Ym9vdC1maXJtd2FyZTogYnVtcCB0byB2ZXJzaW9uIDA5LjAyLjAwLjAwNAo+PiAgIGNvbmZpZ3Mv
dGlfajcyMWVfc2tfZGVmY29uZmlnOiBuZXcgZGVmY29uZmlnCj4+ICAgY29uZmlncy90aV9hbTYy
eF9za19kZWZjb25maWc6IHVwZGF0ZSB0byB1Ym9vdCAyMDI0LjAxIHRvIHVzZSBiaW5tYW4KPj4g
ICAgIHRvb2wKPj4gICBjb25maWdzL3RpX2FtNjR4X3NrX2RlZmNvbmZpZzogdXBkYXRlIHRvIHVi
b290IDIwMjQuMDEgdG8gdXNlIGJpbm1hbgo+PiAgICAgdG9vbAo+PiAgIGJvb3QvdGktazMtaW1h
Z2UtZ2VuOiByZW1vdmUgcGFja2FnZQo+Pgo+PiAgQ29uZmlnLmluLmxlZ2FjeSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDcgKysKPj4gIERFVkVMT1BFUlMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICA2ICstCj4+ICBib2FyZC90aS9qNzIxZS1zay9nZW5pbWFn
ZS5jZmcgICAgICAgICAgICAgICAgfCAyOCArKysrKysrCj4+ICBib2FyZC90aS9qNzIxZS1zay9w
b3N0LWJ1aWxkLnNoICAgICAgICAgICAgICAgfCAxNiArKysrCj4+ICBib2FyZC90aS9qNzIxZS1z
ay9yZWFkbWUudHh0ICAgICAgICAgICAgICAgICAgfCAzNCArKysrKysrKwo+PiAgYm9vdC9Db25m
aWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgLQo+PiAgYm9vdC90aS1r
My1ib290LWZpcm13YXJlL0NvbmZpZy5pbiAgICAgICAgICAgIHwgMzkgKysrKysrKysrKwo+PiAg
Li4uL3RpLWszLWJvb3QtZmlybXdhcmUuaGFzaCAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPj4g
IC4uLi90aS1rMy1ib290LWZpcm13YXJlLm1rICAgICAgICAgICAgICAgICAgICB8IDE2ICsrLS0K
Pj4gIGJvb3QvdGktazMtaW1hZ2UtZ2VuL0NvbmZpZy5pbiAgICAgICAgICAgICAgICB8IDc3IC0t
LS0tLS0tLS0tLS0tLS0tLS0KPj4gIGJvb3QvdGktazMtaW1hZ2UtZ2VuL3RpLWszLWltYWdlLWdl
bi5oYXNoICAgICB8ICAzIC0KPj4gIGJvb3QvdGktazMtaW1hZ2UtZ2VuL3RpLWszLWltYWdlLWdl
bi5tayAgICAgICB8IDU0IC0tLS0tLS0tLS0tLS0KPj4gIGJvb3QvdGktazMtcjUtbG9hZGVyL0Nv
bmZpZy5pbiAgICAgICAgICAgICAgICB8ICA4ICsrCj4+ICBib290L3RpLWszLXI1LWxvYWRlci90
aS1rMy1yNS1sb2FkZXIubWsgICAgICAgfCAyMyArKysrKysKPj4gIGJvb3QvdWJvb3QvQ29uZmln
LmluICAgICAgICAgICAgICAgICAgICAgICAgICB8IDI3ICsrKystLS0KPj4gIGJvb3QvdWJvb3Qv
dWJvb3QubWsgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEwICsrLQo+PiAgY29uZmlncy90
aV9hbTYyeF9za19kZWZjb25maWcgICAgICAgICAgICAgICAgIHwgMTQgKystLQo+PiAgY29uZmln
cy90aV9hbTY0eF9za19kZWZjb25maWcgICAgICAgICAgICAgICAgIHwgMTQgKystLQo+PiAgLi4u
NjJ4X3NrX2RlZmNvbmZpZyA9PiB0aV9qNzIxZV9za19kZWZjb25maWd9IHwgMzQgKysrKy0tLS0K
Pj4gIHBhY2thZ2UvcHl0aG9uLWF0dHJzL3B5dGhvbi1hdHRycy5tayAgICAgICAgICB8ICA2ICsr
Cj4+ICAuLi4vcHl0aG9uLWpzb25zY2hlbWEtc3BlY2lmaWNhdGlvbnMubWsgICAgICAgfCAxMCAr
KysKPj4gIC4uLi9weXRob24tanNvbnNjaGVtYS9weXRob24tanNvbnNjaGVtYS5tayAgICB8IDE0
ICsrKysKPj4gIC4uLi9weXRob24tcmVmZXJlbmNpbmcvcHl0aG9uLXJlZmVyZW5jaW5nLm1rICB8
IDExICsrKwo+PiAgcGFja2FnZS9weXRob24tcnBkcy1weS9weXRob24tcnBkcy1weS5tayAgICAg
IHwgIDEgKwo+PiAgMjQgZmlsZXMgY2hhbmdlZCwgMjc1IGluc2VydGlvbnMoKyksIDE4MCBkZWxl
dGlvbnMoLSkKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC90aS9qNzIxZS1zay9nZW5pbWFn
ZS5jZmcKPj4gIGNyZWF0ZSBtb2RlIDEwMDc1NSBib2FyZC90aS9qNzIxZS1zay9wb3N0LWJ1aWxk
LnNoCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvdGkvajcyMWUtc2svcmVhZG1lLnR4dAo+
PiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGJvb3QvdGktazMtaW1hZ2UtZ2VuL0NvbmZpZy5pbgo+PiAg
ZGVsZXRlIG1vZGUgMTAwNjQ0IGJvb3QvdGktazMtaW1hZ2UtZ2VuL3RpLWszLWltYWdlLWdlbi5o
YXNoCj4+ICBkZWxldGUgbW9kZSAxMDA2NDQgYm9vdC90aS1rMy1pbWFnZS1nZW4vdGktazMtaW1h
Z2UtZ2VuLm1rCj4+ICBjb3B5IGNvbmZpZ3Mve3RpX2FtNjJ4X3NrX2RlZmNvbmZpZyA9PiB0aV9q
NzIxZV9za19kZWZjb25maWd9ICg1NCUpCj4+Cj4+IC0tCj4+IDIuNDMuMAo+Pgo+PiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFp
bGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
