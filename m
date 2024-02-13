Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658BDC4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 19:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A99781E05;
	Tue, 13 Feb 2024 19:05:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 42LiAzZWQdpg; Tue, 13 Feb 2024 19:05:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F413C81E28
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F413C81E28;
	Tue, 13 Feb 2024 19:05:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DAB211BF32A
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 19:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C46A081E28
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 19:05:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id urXkmI6SWywr for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 19:05:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B3A8581E05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3A8581E05
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3A8581E05
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 19:05:20 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-411c779ab2dso6399275e9.0
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 11:05:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707851119; x=1708455919;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JDKWfEedzbH8coD11yD7OPgnDB/JO6XO3XK/qkZXuMw=;
 b=i13lysJoe1K4tAjGuvKDwxXGnUcf4j+JSpu23CYPA4bDnNki1NPDN74hFfkP+dTZ2B
 21Dmyn50xQNulceIVTR9BalfHM7AepVYER2ledEdBkCCWym7T6EAob5Csp4pfeU0gnA3
 UY8wmlQnT7KM4fx3NUPt04siBlsqI4n0o3q7XbRTHaXGmyIY7cexL4K4yizz7QTOcbd/
 XtLf6NhOX05cM3OLBpDC1eLvXICHZGbOPuJUp02hoGN8VP2VRukThlQcH07avcs9rcY4
 J+kcNiJGQRg+d70SF5VC0ySmcjwDe2vZsZ/+SbsJcfULMlpk2jE+zNl0BQxIMY7Wm1Mp
 2gTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2bC3S4RTjP2Nuy5dUV7I9Kn/x/1IMduVc2tMkcWEXEVL3NsWi3My4ZK2x8ciAxf3f0CW4s53qPdlcfoDtbk/TW4/EfdsJqw==
X-Gm-Message-State: AOJu0Yz23p+z3GD0DYWFF1gSIoEam7+w3+nbyq5t1a2muz16cfIIcVpq
 f1fnxzuyYt0MKB7QE62pzeKsFatEmGLeadUaj0vZIHeE4gayLNa7
X-Google-Smtp-Source: AGHT+IEgU8dS/4xnCRfZUja5LmLnu8RJoc4w1wsNGyJQ2g3ZuZ7tZSwkFkrnRYQ6xs6AsxQgrJsIMQ==
X-Received: by 2002:a05:600c:4e50:b0:410:48dd:c397 with SMTP id
 e16-20020a05600c4e5000b0041048ddc397mr387595wmq.40.1707851118584; 
 Tue, 13 Feb 2024 11:05:18 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWkMgYyX/Puj6Kto/soOCW/WcJ0IlmsMiiKK54TuXPDEd0/8hvBXLuwGBMtXfqYlJPAQx89nL3YaHM2LY1IFeuNTLhwkStingvZ4dIuz+t2Yf7NG8vvEJI=
Received: from giga-mm-2.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a7bce92000000b00410c04e5455sm7957554wmj.20.2024.02.13.11.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 11:05:17 -0800 (PST)
Message-ID: <f53ae1240335f3004bfe4cd116b7c9fe9853babd.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Date: Tue, 13 Feb 2024 20:05:15 +0100
In-Reply-To: <20240213172817.2872849-22-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240213172817.2872849-22-romain.naour@smile.fr>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=mQINBGWpGj8BEACy09IxfduHTzAdqKkf3SmGIHIEquHWHIXqgVIoZo/ufP8mIpsWYwFKP9gsCvVvNNugtK8YPN92lbHol35nfZiXLIp16ASRQXYFtBjXj4GAVjUPjaTkQbcedIgD2nEZ/HQSiohfnUSS0YmxI0UUJmZFulwQZil6OmPVbbQoda8/In5h/wNRo6y5vJreRhsjqcP5LckLRov3t+jabUzn0/1twHNO0SnI508dXenEhQcBX7Wns+JfwRqO8jxBK1P3DntW+n0OJ8DkjSMJjm0zk9JtY28WK332Vpq8smZxNDNCfs1YtRMzfEEZKRvxsSMzTxri/cw7VXJa7m138LlyPBkXizjAKqad/Mrthx4ambsWuRXyjklYOBYqMEAdlZNLPQnhnIICFwkJ/lnLE8Ek6Dh0NYl1HpsOyvu1ii7VPEXHLMGTKFmFmWtrmCUrHIBrAvStMJ2jIRhEyCGDpf6f5dfKNOb3GWRtX36326TDOa2eXWqaTQEPKWRSUwhC3f3j/C/o/vj6bDHQ8ZsNcKYxwtSoh+elHT5xtHOMvPBP6gavgZRDnH6wBSHWnXYxyOmZPKr2NuhMwhEyhpvkEq5zW6Z/hp5POzZ74GNkIKB5/FpETobgoV/XB2HMnlIUAJE2RYRYwvbgIkKTJxFD4FIIP2DVt/7cT/8ry5Nhe2fouscuDQARAQABtDFBbGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5zdmVyZGxpbkBnbWFpbC5jb20+iQJUBBMBCAA+FiEEYDtVWuq7d7K0J3aR+5lQra83LKgFAmWpGj8CGwMFCQPCZwAFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQ+5lQra83LKjUHA/+KlP0no2WRK1co+2yi0Jz2kbSY61ZoX+Rq
 bLqkCoo1UxsU/MddscgjKOfggNASZ1l//jUkx39smTBONmxcauTtY4bB4Q9X8Djk+XO1
 M9iwGb7feCbnIuRHyvI3qygC+k3XgLIJScui3/yEL0aikd5U4F6nkKyQiPQk7ihKWKyBQXQ+tXS06mUH4p0O5BYvxijW32Z9esVB15OB8vUcx2bsdjogEuNc0uwOGMHsVIsW4qupoHRHPc1865uAqzv9vW3a2/GOG6IpBFjmXqg7Wy9zwVjSJFMvVxu2xs3RCdpS99aMrfA2na1vjC5A7gNFnr+/N2vtMBP0d0ESfd/54zSglu3FW0TIOIz7qkrWQKwiennfUun/mAvCynCrKpCpUMkEgeQw1rHCWpSfnJ6TPG0UfQGNUFyzzmBheQRSEksaepfCtqwCxtjF19JZ6yapLi/lQt7YBjwxIPkZRHJNelPkK/bs6yeRJul90+X6UAJstWh4mC7HzVvmopJoCxbInS4+L6qlefdjqhB6NYw9Q5GsRmTKalaqJoW1/kXopeGExCY4r1FP5ZoLHFs0xNbycpD2tp/GnI8GlYCIzQED3TNab7IkWP2otXnWAnF8CrqhglBbYnp8oCkgBPatYftO4dWFP3YLVWE0EtoWLLrmiWzHkbWc8YKpWAiFX8OhUJLKtC5Ag0EZakaPwEQAOGrFhtJCvAvfyTMNLl1gs52B3foxtRUzk1uaqSvl0NlePGzXlE1hNiO1eUHdfqB00ZfXxJkUrQEjhyr0Em5sQk3JtZ8/cEvaHYQ+SmHYjWqEoiDsKFtTHNMwq/fVLVyWvAc5OLjuehhjqm3Pg+BFWNs6atdc5HpmUAHZ0oKDHL/WWetkMfdl4t7zTFGWR/dBCaQVmP2Gi1ZE8DY6MswYQeeCfwVeQsIMcripdW7fuzWr34EYrszYMlR1WpFPO6sXpNRsfmrqKoriOmgWKWvugvDHcEy3ArYvmND1qXRADY7m6D5cfZVlyUSu3DwyzBK6e2Nq7RgZ0uN8
 tnbnyRNUS+yn7RPSJNG6dyrREgG/wx7d8fKszk3Xu9ByCCoqcwzpNF0o4lNW3IYlZZPJ7
 LtS/E5mMEHXrvnA4esKSmZO3vSksJ7R0L3DOChbRCqYnK5uBRlFixwHYnG8bp8SAJP+vgE5qrYED0rUquapGZfyezE8Zv9hTBPCUF8ee86Jahiy2h1YRpzPDCCk5vE0Kv9VkndL/X048NfjInCN6U3lvgjTS/vKwxXpLCzs3HFxc2RlxrCY+Rn+e/sXsE81c92hhm+zQrfcDQ3tT3scIgK8UVJ2W70BFlE/K6gldaBoHPKXuhSmH/55t6NLxxmUbwzitYYVEcGYylpoPO7LxFmO59ZABEBAAGJAjwEGAEIACYWIQRgO1Va6rt3srQndpH7mVCtrzcsqAUCZakaPwIbDAUJA8JnAAAKCRD7mVCtrzcsqG9YD/917AOp+yx7tJwKeylRtfhd3aVjJPnZMpk+OKSDp1/D8vuugl+szUZm+h1d3flYdtM+g66gkkHinqLLkEybUR1D2aYpJ9DucoSmCeNycnUn+p2h+bAbhb2aFSwOtH+chcBMwXJqiLRaE9Tdn2YdS6OEG+n2a6AXOBmtwoAUdnXgh1zIAkIoLeekLKZK4O/CrgHAhrQ8Kee+ymxbKuX93DexyNJA8dLJu4Q1E3s4nkxenETfiLtKShQCyx9QiAhbj72wf30y8eo5F/ufw7+/09warSPz0eWtkp0pbhFdalICIdsyfU85hteQra+k/9HsxnIAF9yC5XieRQB/Xk7Q+uINZ8gmx1Lkq7DEB52xYiE2Rcn636dGGf8IqszkQ96QKVWFEdsEfuWvnaZ6DAaiQATA90M+B2xlqgshRg+AXF35sS7E0PIYFxrkVI8uo7bpxrWCoZavsxLI3zFsmjebwCndr8AA2WFlhQBOu2ztEgWLJpqBNH8+fgxLEt+L+oRHFeU60XlowtDT/oGlbcbR/cNnZ8OLwr0esN4LuZWNW8uNB
 EZGRCtvlFXNm8HOqHhx3APBl3vHvsvJTIH9agXHgKmy6lviHFf0qyJsyVpoGonK1tjRTeh
 c1oMKY+O7/JqOhEp/NwI+HI3THVgagrBPOjbiUA3q/0FW1puGsOF69gZlFA==
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707851119; x=1708455919; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JDKWfEedzbH8coD11yD7OPgnDB/JO6XO3XK/qkZXuMw=;
 b=dCeq4pMSPbZnbw79AI/oq/Glqz62KrBJZYoyWnho2in3tvxqqVisdpRXOA9jEHTU8Y
 L/+V5mBfCEWgdB+ZPLkFK7Ln/zWnjsPiiLQlqXhy4damKH4uZRv4aw6pQGH4X6dEb8T7
 KANKhT8Wwbi169s4IaEu37OEVQPtuxBmxbYLe5bc2lpJdrcmUfMSP99IfV4O5zo6txea
 ak8XOdktMWAcA7nvAxmHLSOhmmG2dnxp52C5j+mSReenSBwOvC+Pt9oTNLxCZnhmm2h+
 wTkGkrVsXR4wub2qWoA6wuOi3+C6X92bKzHmgY31flvY3Y8WwOl3AtgM1A/WjK2Efgl9
 /UGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dCeq4pMS
Subject: Re: [Buildroot] [PATCH 21/21] boot/ti-k3-image-gen: remove package
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKT24gVHVlLCAyMDI0LTAyLTEzIGF0IDE4OjI4ICswMTAwLCBSb21haW4gTmFv
dXIgd3JvdGU6Cj4gdGktazMtaW1hZ2UtZ2VuIHRvb2wgaXMgZGVwcmVjYXRlZCBhbiByZXBsYWNl
ZCBieSBiaW5tYW4gWzFdLgo+IAo+IEFsbCBkZWZjb25maWcgdGhhdCB3YXMgdXNpbmcgaXQgaGF2
ZSBiZWVuIHVwZGF0ZWQgdG8gdXNlIFUtYm9vdAo+IGJpbm1hbiB0b29sIGluc3RlYWQuCj4gCj4g
U28sIHdlIGNhbiBzYWZlbHkgcmVtb3ZlIHRpLWszLWltYWdlLWdlbiBwYWNrYWdlLgo+IAo+IFsx
XSBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL21ldGEtdGkvY29tbWl0Lz9pZD04MzU4MTFj
Zjg1ODY5MjZjZjc4YTk2MWQwOTBmNGU2MTUwNDMyMjM1Cj4gCj4gQ2M6IEFuYW5kIEdhZGl5YXIg
PGdhZGl5YXJAdGkuY29tPgo+IENjOiBYdWFuaGFvIFNoaSA8WDE1MDAwMTc3QGdtYWlsLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KPiAt
LS0KPiDCoENvbmZpZy5pbi5sZWdhY3nCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqAgNyArKwo+IMKgREVWRUxPUEVSU8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyIC0KPiDC
oGJvb3QvQ29uZmlnLmluwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAxIC0KPiDCoGJvb3QvdGktazMtaW1hZ2UtZ2VuL0NvbmZpZy5pbsKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA4MSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IMKgYm9v
dC90aS1rMy1pbWFnZS1nZW4vdGktazMtaW1hZ2UtZ2VuLmhhc2ggfMKgIDMgLQo+IMKgYm9vdC90
aS1rMy1pbWFnZS1nZW4vdGktazMtaW1hZ2UtZ2VuLm1rwqDCoCB8IDU0IC0tLS0tLS0tLS0tLS0t
LQo+IMKgNiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDE0MSBkZWxldGlvbnMoLSkK
PiDCoGRlbGV0ZSBtb2RlIDEwMDY0NCBib290L3RpLWszLWltYWdlLWdlbi9Db25maWcuaW4KPiDC
oGRlbGV0ZSBtb2RlIDEwMDY0NCBib290L3RpLWszLWltYWdlLWdlbi90aS1rMy1pbWFnZS1nZW4u
aGFzaAo+IMKgZGVsZXRlIG1vZGUgMTAwNjQ0IGJvb3QvdGktazMtaW1hZ2UtZ2VuL3RpLWszLWlt
YWdlLWdlbi5tawo+IAo+IGRpZmYgLS1naXQgYS9Db25maWcuaW4ubGVnYWN5IGIvQ29uZmlnLmlu
LmxlZ2FjeQo+IGluZGV4IGE4NjkyNzlhZjcuLjJiNTlhNjVmMWMgMTAwNjQ0Cj4gLS0tIGEvQ29u
ZmlnLmluLmxlZ2FjeQo+ICsrKyBiL0NvbmZpZy5pbi5sZWdhY3kKPiBAQCAtMTQ2LDYgKzE0Niwx
MyBAQCBlbmRpZgo+IMKgCj4gwqBjb21tZW50ICJMZWdhY3kgb3B0aW9ucyByZW1vdmVkIGluIDIw
MjQuMDIiCj4gwqAKPiArY29uZmlnIEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOCj4gKwlib29s
ICJ0aS1rMy1pbWFnZS1nZW4gcmVtb3ZlZCIKPiArCXNlbGVjdCBCUjJfTEVHQUNZCj4gKwloZWxw
Cj4gKwnCoCB0aS1rMy1pbWFnZS1nZW4gdG9vbMKgIGhhcyBiZWVuIHJlbW92ZWQgYW5kIHJlcGxh
Y2VkIGJ5Cj4gKwnCoCBVLUJvb3QgYmlubWFuIHRvb2wgKHJlcXVpcmVzIFUtYm9vdCA+PSAyMDI0
LjAxKS4KCklzIGNvbW1pdCA2ZDYyMjhhYjhmZTUgImFtNjJhOiBkdHM6IGJpbm1hbjogUGFja2Fn
ZSB0aWJvb3QzLmJpbiwgdGlzcGwuYmluLCB1LWJvb3QuaW1nIgppbiBVLUJvb3QgcmVwbyBub3Qg
d2hhdCBpcyBhY3R1YWxseSByZXF1aXJlZCAoc2luY2UgdjIwMjMuMTApPwpBdCBsZWFzdCB0aGF0
J3MgdGhlIHZlcnNpb24gd2hpY2ggd29ya3MgZm9yIG1lLgoKLS0gCkFsZXhhbmRlciBTdmVyZGxp
bi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
