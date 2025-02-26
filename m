Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87626C18E7C
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 16:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 401F3403A5;
	Wed, 26 Feb 2025 16:51:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LCpdw15E2_AT; Wed, 26 Feb 2025 16:51:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE13B4031E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE13B4031E;
	Wed, 26 Feb 2025 16:51:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D5D31ED4
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 16:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18A9641226
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 16:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ypRHiMmDHD1Y for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 16:51:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=kuzminov.sergey81@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F3BEE403A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3BEE403A4
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3BEE403A4
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 16:51:29 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-30613802a04so257861fa.2
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 08:51:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740588688; x=1741193488;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uq8N6dbUm0gDsq7SpDaVotMabxjsb2w5GzgVDuMNMrg=;
 b=K523Btm1jmy6dDtDzStNqopHEFEM5yg5dSL212SHf4s7IFGANfcxaQXEPJUx/a+h+v
 vCp1KjntObSLuj5Lj6Vi67JMc6tGjQ1SXaBjDAlZwC8sBbeU9FFeQZPW0WURGvJVCMeB
 +sV9W/VNTBznID6peis4AQaLja3MVjbyFC+7ji1Mz+Uw24lRhR2wm7SowAod8waEVkzg
 VobU9kA0g9b4ySSQrk0oJce9ntXYCnH88SGFVsmcqbNt4Vxnjpyeta1bgqqfkBdOZek8
 ARU0DiOwWyglwk9xq+R5KKziCqA9byaU9MwZLu4hKNdYgJo9MsaNrMHSrhbGDyXiJ1mm
 xZXQ==
X-Gm-Message-State: AOJu0YzgX7VPwhvJWncO/nV5XeNkQeOEA2POKbrRx57cGX5unuNSKqea
 1lKpAOX8eQhYC7G9i3uCDNsLciLA+aEg5L0Suys4ZAhT4iqqq6Bx
X-Gm-Gg: ASbGncsulRzBaEAM3aD1bV656287+tDgOuC/AMMBqJ8Wu7IbqNen/MBc73e0r1LUwNK
 exnZDbit4Ep1DCDOrsIJAJbQyfUlKUiTKr4i0GInYbCETPbQmrtqUTKss0Rrjyt96L6fYHF687w
 F0AFAJWU1wuaik7IF6sDCvi8CAX6KiJ+sUL35uqwmWLWaRGgmylVwXwnd83AeV3rYCOUI0EmGci
 /6GbLh0/JkgTW4+asXXBW4bbdwtdu9Es+83A0jry1reHES5LQnEhZSqjpUVdK9O87kS/g9qzjmN
 Q3m5dEYPgZDhcRBox4DuCe8zX3Xo+WUVBkcmTjt4
X-Google-Smtp-Source: AGHT+IGzX4hPPZpMhwGH3y3rbQZMzN9xRCHHh/zSwcjnjkKdr43XPykbiTAHzwFLc52jyzEM6Fh4xw==
X-Received: by 2002:a2e:8017:0:b0:300:4107:6294 with SMTP id
 38308e7fff4ca-30a5b216a46mr89000801fa.35.1740588687429; 
 Wed, 26 Feb 2025 08:51:27 -0800 (PST)
Received: from [192.168.10.7] ([188.191.244.248])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a819f4a99sm5684821fa.52.2025.02.26.08.51.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 08:51:26 -0800 (PST)
Message-ID: <eed00cc9-1138-468e-9c03-a10976d255c4@gmail.com>
Date: Wed, 26 Feb 2025 19:51:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
References: <20250225174304.1810-1-kuzminov.sergey81@gmail.com>
 <87zfi9e0on.fsf@tarshish>
Content-Language: ru-RU
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
In-Reply-To: <87zfi9e0on.fsf@tarshish>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740588688; x=1741193488; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uq8N6dbUm0gDsq7SpDaVotMabxjsb2w5GzgVDuMNMrg=;
 b=eEoLokTYGCxmEL0f1by67HOHeetfS3Ug7hq1zhZ8+nkE4ON+LMDXbe0DEU/YnMcoBI
 1+TOVaojk/qwFeRPv/i4ae9QR181NhDrxPhZm84YgA97rL6dV21KCb9jXIDUdCdqQq2X
 7+opTeTbAkrKA1EOP/f4+3vnxYASYx81icEBSPLxWF3yZz3iNCXic4sO5sP326pKr22F
 flk9neM2WzaqGUgp5U1o8GlLIdtrSU2UzRWaoYT8yTy+6JdxguT8HDWBhZheZN2RvNzA
 7h75voIiEQlGAPZL5vXwKaXX9Fmrn/4h5xkTeoLhse+BzKp/JNKBjIVINP1INszkhvsY
 dCig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eEoLokTY
Subject: Re: [Buildroot] [PATCH] board/friendlyarm/nanopi-r3s:
 rk3566-nanopi-r3s.dts: enable hw random
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksIEJhcnVjaAoKMjYuMDIuMjAyNSAwODoyNiwgQmFydWNoIFNpYWNoINC/0LjRiNC10YI6Cj4g
SGkgU2VyZ2V5LAo+IAo+IE9uIFR1ZSwgRmViIDI1IDIwMjUsIFNlcmdleSBLdXptaW5vdiB3cm90
ZToKPj4gVGhpcyBwYXRjaCBlbmFibGVzIHRoZSBoYXJkd2FyZSByYW5kb20gbnVtYmVyIGdlbmVy
YXRvciBpbiB0aGUgZGV2aWNlIHRyZWUuCj4+IFdpdGhvdXQgaXQsIHRoZSBlbnRyb3B5IGxldmVs
IGluIHRoZSBMaW51eCBrZXJuZWwgaW5jcmVhc2VzIHZlcnkgc2xvd2x5Lgo+PiBUbyBjaGVjayB0
aGUgZW50cm9weSBsZXZlbDogY2F0IC9wcm9jL3N5cy9rZXJuZWwvcmFuZG9tL2VudHJvcHlfYXZh
aWwKPj4KPj4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IEt1em1pbm92IDxrdXptaW5vdi5zZXJnZXk4
MUBnbWFpbC5jb20+Cj4+IC0tLQo+PiAgIC4uLjAwMS1yazM1NjYtbmFub3BpLXIzcy5kdHMtZW5h
YmxlLXJuZy5wYXRjaCB8IDMwICsrKysrKysrKysrKysrKysrKysKPj4gICAxIGZpbGUgY2hhbmdl
ZCwgMzAgaW5zZXJ0aW9ucygrKQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9mcmllbmRs
eWFybS9uYW5vcGktcjNzL3BhdGNoZXMvbGludXgvMDAwMS1yazM1NjYtbmFub3BpLXIzcy5kdHMt
ZW5hYmxlLXJuZy5wYXRjaAo+Pgo+PiBkaWZmIC0tZ2l0Cj4+IGEvYm9hcmQvZnJpZW5kbHlhcm0v
bmFub3BpLXIzcy9wYXRjaGVzL2xpbnV4LzAwMDEtcmszNTY2LW5hbm9waS1yM3MuZHRzLWVuYWJs
ZS1ybmcucGF0Y2gKPj4gYi9ib2FyZC9mcmllbmRseWFybS9uYW5vcGktcjNzL3BhdGNoZXMvbGlu
dXgvMDAwMS1yazM1NjYtbmFub3BpLXIzcy5kdHMtZW5hYmxlLXJuZy5wYXRjaAo+PiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwLi5iMzc2MDA0Mzc3Cj4+IC0tLSAvZGV2
L251bGwKPj4gKysrIGIvYm9hcmQvZnJpZW5kbHlhcm0vbmFub3BpLXIzcy9wYXRjaGVzL2xpbnV4
LzAwMDEtcmszNTY2LW5hbm9waS1yM3MuZHRzLWVuYWJsZS1ybmcucGF0Y2gKPj4gQEAgLTAsMCAr
MSwzMCBAQAo+PiArRnJvbSAyODRlNjY4M2I0YTBlZTZiMWZkMjJjY2QzNDc4NWUxZjJkNThjMTE1
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+PiArRnJvbTogU2VyZ2V5IEt1em1pbm92IDxrdXpt
aW5vdi5zZXJnZXk4MUBnbWFpbC5jb20+Cj4+ICtEYXRlOiBUdWUsIDI1IEZlYiAyMDI1IDE5OjQ5
OjAwICswMzAwCj4+ICtTdWJqZWN0OiBbUEFUQ0hdIHJrMzU2Ni1uYW5vcGktcjNzLmR0czogZW5h
YmxlIHJuZwo+PiArCj4+ICtUaGlzIHBhdGNoIGVuYWJsZXMgdGhlIGhhcmR3YXJlIHJhbmRvbSBu
dW1iZXIgZ2VuZXJhdG9yIGluIHRoZSBkZXZpY2UgdHJlZS4KPj4gK1dpdGhvdXQgaXQsIHRoZSBl
bnRyb3B5IGxldmVsIGluIHRoZSBMaW51eCBrZXJuZWwgaW5jcmVhc2VzIHZlcnkgc2xvd2x5Lgo+
PiArVG8gY2hlY2sgdGhlIGVudHJvcHkgbGV2ZWw6IGNhdCAvcHJvYy9zeXMva2VybmVsL3JhbmRv
bS9lbnRyb3B5X2F2YWlsCj4+ICsKPj4gK1NpZ25lZC1vZmYtYnk6IFNlcmdleSBLdXptaW5vdiA8
a3V6bWlub3Yuc2VyZ2V5ODFAZ21haWwuY29tPgo+PiArVXBzdHJlYW06IE5vdCBhcHBsaWNhYmxl
LCBCdWlsZHJvb3Qgc3BlY2lmaWMuCj4gCj4gV2hhdCBtYWtlcyB0aGlzIHBhdGNoIEJ1aWxkcm9v
dCBzcGVjaWZpYz8KCldpdGhvdXQgdGhpcyBjb21tZW50LCB0aGUgdmVyaWZpY2F0aW9uIHNjcmlw
dCAodXRpbHMvZG9ja2VyLXJ1biBtYWtlIApjaGVjay1wYWNrYWdlKSByZXBvcnRzIGFuIGVycm9y
LiBJIHRvb2sgdGhpcyBjb21tZW50IGZyb20gc29tZSBzaW1pbGFyIApidWlsZHJvb3QgcGF0Y2gu
Cgo+IAo+IGJhcnVjaAo+IAo+PiArLS0tCj4+ICsgYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hp
cC9yazM1NjYtbmFub3BpLXIzcy5kdHMgfCA0ICsrKysKPj4gKyAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspCj4+ICsKPj4gK2RpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3Jv
Y2tjaGlwL3JrMzU2Ni1uYW5vcGktcjNzLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2No
aXAvcmszNTY2LW5hbm9waS1yM3MuZHRzCj4+ICtpbmRleCBmYjFmNjVjODY4ODMuLmE4OWJkYmY3
MWUxMiAxMDA2NDQKPj4gKy0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszNTY2
LW5hbm9waS1yM3MuZHRzCj4+ICsrKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3Jr
MzU2Ni1uYW5vcGktcjNzLmR0cwo+PiArQEAgLTU1MiwzICs1NTIsNyBAQCAmdm9wIHsKPj4gKyAm
dm9wX21tdSB7Cj4+ICsgCXN0YXR1cyA9ICJva2F5IjsKPj4gKyB9Owo+PiArKwo+PiArKyZybmcg
ewo+PiArKwlzdGF0dXMgPSAib2theSI7Cj4+ICsrfTsKPj4gKy0tCj4+ICsyLjQ1LjMKPj4gKwo+
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
