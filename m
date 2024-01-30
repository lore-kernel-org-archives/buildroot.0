Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02962C46CD2
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 21:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6BA641E3B;
	Tue, 30 Jan 2024 21:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6BA641E3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Koj9AC5tMUAT; Tue, 30 Jan 2024 21:11:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC9D841E26;
	Tue, 30 Jan 2024 21:11:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC9D841E26
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7CD671BF263
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 21:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5479541E26
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 21:11:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5479541E26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RGDorON1mIl8 for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 21:11:32 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83A2A41B92
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 21:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83A2A41B92
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-51124983d6aso99681e87.0
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 13:11:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706649090; x=1707253890;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P+v2MdmlG925wI9oQcuOJ+5evDFguvZ+CJdeHrE/WUA=;
 b=ZbZoXI5/7Tubb+3g2YOsHW4ZpveEbiqPiVEAEMRKrqz/hD0nqZ9GVuBZc4lRXod+iT
 98w7UziavKs3Q4Ck7eWtW+pNHe2CMWlSsCoQlNnbTbiBhOpO6U6BtpwDDHtSnvkVDBDF
 94URoSTKYCB6bIJvhZ4WQZbRGCdBB4+9Cpf3aZU7SAuWdPTNJ8IfOvTrea45sKEhoVuU
 sVYtgHEBu32PiqRcLAZ/BjQQaRJ1Y2MjSeV+lDqh0SIN0guF9+5JKwk8EUiH7LlGuOob
 SUs8NS/FX37ktNaUueqkTWWjNEMp39w7kBC8o/pBM0/zS2bATYJUns1gQlvyhb3SRpkc
 ZyKg==
X-Gm-Message-State: AOJu0Yxlkvagl7wF17VT/xrn1cpAJB48FmV2bC08kxWmk/hK9t0oy8I9
 jo6F+xVcHet00x1egWaa5vHI0zOtbN/6N17y2QhEuqcLHnRvhK6KdsyhexfmVfE=
X-Google-Smtp-Source: AGHT+IEBG+3q0bQDljqnp5fKe7Kh3Wtio1HDrEERoWs5naJ6/9t7KOoSGH5owWyqO8v38HT6LpOMUg==
X-Received: by 2002:a05:6512:3e0b:b0:511:1038:dcde with SMTP id
 i11-20020a0565123e0b00b005111038dcdemr5102123lfv.52.1706649089884; 
 Tue, 30 Jan 2024 13:11:29 -0800 (PST)
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 cu7-20020a170906ba8700b00a3527389447sm4804203ejd.142.2024.01.30.13.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 13:11:29 -0800 (PST)
Message-ID: <f63378d9f3ed51f3740b15d02e66f8831905cc8b.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: gsmecher@threespeedlogic.com, buildroot@buildroot.org
Date: Tue, 30 Jan 2024 22:11:28 +0100
In-Reply-To: <20240130210553.2554954-1-gsmecher@threespeedlogic.com>
References: <2419e302d2201270df70f0f2033fff876168332b.camel@gmail.com>
 <20240130210553.2554954-1-gsmecher@threespeedlogic.com>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706649090; x=1707253890; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=P+v2MdmlG925wI9oQcuOJ+5evDFguvZ+CJdeHrE/WUA=;
 b=E2J7P6xsoNQgh/wX4iqTRsGTRPTitcX1Sa7Lbk3GDps4DE+ajy/DwPogTLvID73KYp
 yReZcMteyoWjhnGllbQHfovQ3lrSF+AFm6W2jhXzUe5tAAM8cxlMESnzwwmd2hqX5K8r
 ZL9TRG6Nq1KGI2lzVL01/UnAPNU8orjwMYJS5uLr/tabw+rjSkFbjAiTwJS2SZja9GLW
 lx9Q/VPuVB4K3vIq1L/0cZxwNbDc2zeGcEMlkJK7c62MOdvr10Lm3SvMqPB8n9jn9qpd
 vtqYcbk3c0l4MrxCxbPWr9RpUo7JMQtvLPreZctvAahkmMgMfdcC4yqAcWMHSNQa0Dm+
 4ZMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E2J7P6xs
Subject: Re: [Buildroot] [PATCH] linux.mk: Allow wildcards in
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH.
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
Cc: thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgR3JhZW1lIQoKT24gVHVlLCAyMDI0LTAxLTMwIGF0IDEzOjA1IC0wODAwLCBnc21lY2hlckB0
aHJlZXNwZWVkbG9naWMuY29tIHdyb3RlOgo+IEZyb206IEdyYWVtZSBTbWVjaGVyIDxnc21lY2hl
ckB0aHJlZXNwZWVkbG9naWMuY29tPgo+IAo+IFRoZXJlIGFyZSBhIGZldyBjb25maWcvIGVudHJp
ZXMgd2hlcmUgd2lsZGNhcmRzIGFyZSBhbHJlYWR5IHByZXNlbnQ6Cj4gCj4gwqDCoMKgwqAgJCBn
cmVwIC1ybGUgJ0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19QQVRIPS4qXConIGNvbmZpZ3Mv
Cj4gwqDCoMKgwqAgY29uZmlncy9vY3Rhdm9fb3NkMzJtcDFfYnJrX2RlZmNvbmZpZwo+IMKgwqDC
oMKgIGNvbmZpZ3Mvb2N0YXZvX29zZDMybXAxX3JlZF9kZWZjb25maWcKPiAKPiAuLi5ob3dldmVy
LCB3aGlsZSB0aGUgY29weS1pbiBzdGVwIG9mIGRldmljZSB0cmVlIGNvbXBpbGF0aW9uIHdvcmtz
Cj4gY29ycmVjdGx5LCB0aGVzZSB3aWxkY2FyZHMgYXJlIG5vdCBjb252ZXJ0ZWQgdG8gRFRDIGJ1
aWxkIHRhcmdldHMgaW4gdGhlCj4ga2VybmVsIGJ1aWxkLiBBcyBhIHJlc3VsdCwgdGhpcyBjb25m
aWd1cmF0aW9uIGxpbmUgYWxvbmUgaXMgbm90IGVub3VnaAo+IHRvIGdlbmVyYXRlIERUQ3MuIEl0
IHNob3VsZCBiZS4KPiAKPiBUaGlzIHBhdGNoIGFkZHMgYSAkKHdpbGRjYXJkKSBleHBhbnNpb24g
c3RlcCBpbnRvIGdlbmVyYXRpb24gb2YgRFRCCj4gY29tcGlsYXRpb24gdGFyZ2V0cyAodGhlIExJ
TlVYX0RUQl9OQU1FIHZhcmlhYmxlKS4gQXMgYSByZXN1bHQsCj4gd2lsZGNhcmRzIGJlaGF2ZSBj
b3JyZWN0bHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogR3JhZW1lIFNtZWNoZXIgPGdzbWVjaGVyQHRo
cmVlc3BlZWRsb2dpYy5jb20+CgpNYWtlcyBzZW5zZSB0byBtZSAoZXhjZXB0IGEgZG90IGluIHRo
ZSBjb21taXQgU3ViamVjdCksCgpSZXZpZXdlZC1ieTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4
YW5kZXIuc3ZlcmRsaW5AZ21haWwuY29tPgoKPiAtLS0KPiDCoGxpbnV4L2xpbnV4Lm1rIHwgMiAr
LQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2xpbnV4L2xpbnV4Lm1rIGIvbGludXgvbGludXgubWsKPiBpbmRleCAxZGI1
YzYwNDZkLi44MDg4MTU5N2FkIDEwMDY0NAo+IC0tLSBhL2xpbnV4L2xpbnV4Lm1rCj4gKysrIGIv
bGludXgvbGludXgubWsKPiBAQCAtMTk1LDcgKzE5NSw3IEBAIExJTlVYX0RUU19OQU1FICs9ICQo
Y2FsbCBxc3RyaXAsJChCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRSkpCj4gwqAjIGFu
ZCAuZHRzaSBmaWxlcyBpbiBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9EVFNfUEFUSC4gQm90aCB3
aWxsIGJlCj4gwqAjIGNvcGllZCB0byBhcmNoLzxhcmNoPi9ib290L2R0cywgYnV0IG9ubHkgdGhl
IC5kdHMgZmlsZXMgd2lsbAo+IMKgIyBhY3R1YWxseSBiZSBnZW5lcmF0ZWQgYXMgLmR0Yi4KPiAt
TElOVVhfRFRTX05BTUUgKz0gJChiYXNlbmFtZSAkKGZpbHRlciAlLmR0cywkKG5vdGRpciAkKGNh
bGwgcXN0cmlwLCQoQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX1BBVEgpKSkpKQo+ICtMSU5V
WF9EVFNfTkFNRSArPSAkKGJhc2VuYW1lICQoZmlsdGVyICUuZHRzLCQobm90ZGlyICQod2lsZGNh
cmQgJChjYWxsIHFzdHJpcCwgJChCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9EVFNfUEFUSCkpKSkp
KQo+IMKgCj4gwqBMSU5VWF9EVEJTID0gJChhZGRzdWZmaXggLmR0YiwkKExJTlVYX0RUU19OQU1F
KSkKPiDCoAoKLS0gCkFsZXhhbmRlciBTdmVyZGxpbi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
