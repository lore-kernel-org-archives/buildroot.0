Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A7DE67488
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 21:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 851FC605D7;
	Thu, 31 Oct 2024 21:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bXMytA0-G5qD; Thu, 31 Oct 2024 21:51:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FD6260611
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FD6260611;
	Thu, 31 Oct 2024 21:51:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 784295B1E
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57EE54037C
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ih3Gm8wWVUvn for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 21:51:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 65FAA4029F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65FAA4029F
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65FAA4029F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:51:44 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37d43a9bc03so819166f8f.2
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 14:51:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730411502; x=1731016302;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QaXoekaRw52lQlp4Bl5TXJWt9U5pGk7gbemm+o+HJ+Q=;
 b=iH1rIfDZF0lEscCuJ/XGeuVAooJz5vhY93C/NhE2Zb+kdhwHcRUtAE0AryTbOj7xGU
 GO+Z+1iXTXhBR36uK+fiYPjzwdbbHRQKd3ud/gw3ymv+1yM+6+f4/55AkU6BhvBlMP05
 UMhmdZisIPIfsFy+/sW+GUbavJlvYoWaPMelKWX+35/SDnHlRKzHtBe6Yl4P36Z7ytW4
 khT/1JeLMIcPwXo/ovCO3eXZYoZPerWoR9bFGZeyJtxeLJhrWOj4uV921yDCXFfU9kRn
 V6+BB3sjnGO8daCw7292Bxjt6KWpAnysFAHX1zkSem1k/sWeeHxsfKrXahbe1JjzNTqY
 56zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+pqI8pZ+EAdgAN//7Md5STeXnnRQMi7NcjTd0W5ovvd9FRIYy334H0X1dlXu7HJ8sLbbpfkR4zaA=@buildroot.org
X-Gm-Message-State: AOJu0YwrlAu0Y1C3a+6TLSkEgMQsB6zNvnG3AXrR7tq+YR9g7LLk99gA
 UH7QjMrobpFg07/23GisdkbbLILUwdlEfe8Q7ehILGwqvi59Hn9z+cXmYmUGrbo=
X-Google-Smtp-Source: AGHT+IFKPEQWsASJmCS1DlHmEzM3/DJ8sdIOeMlu37SLHGBikdfEceJu8+xSLzKP6EFCjtQQwYKBTg==
X-Received: by 2002:a05:6000:a0d:b0:37d:3185:285f with SMTP id
 ffacd0b85a97d-381c7ac784bmr1379225f8f.54.1730411501971; 
 Thu, 31 Oct 2024 14:51:41 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c113e073sm3190503f8f.66.2024.10.31.14.51.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 14:51:41 -0700 (PDT)
Message-ID: <b49bf4c2-c744-4d4d-a7c3-6ed473033629@smile.fr>
Date: Thu, 31 Oct 2024 22:51:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
References: <20241031213348.2057705-1-ju.o@free.fr>
 <20241031213348.2057705-2-ju.o@free.fr>
Content-Language: en-US
In-Reply-To: <20241031213348.2057705-2-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730411502; x=1731016302; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QaXoekaRw52lQlp4Bl5TXJWt9U5pGk7gbemm+o+HJ+Q=;
 b=YlQgIP7B9RoROgumlHtzCKTs3xhMwonkQ9xUVpwPmpukjvIQ5HXXJt7hr8Zha5Skh3
 vqBcz83n3z+WsBe31WGoXPljK2sU39HCp7blFef7fhUVdV0uK63d+969cG/U4fq5l/CC
 /HsiQEG+y0XcyCAwzseBfTA7soQzT/RdenYJ0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=YlQgIP7B
Subject: Re: [Buildroot] [PATCH v3 1/8] configs/qemu_aarch64_sbsa_defconfig:
 update ATF to v2.11
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

SGVsbG8gSnVsaWVuLAoKTGUgMzEvMTAvMjAyNCDDoCAyMjozMywgSnVsaWVuIE9saXZhaW4gYSDD
qWNyaXTCoDoKPiBGcm9tOiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KPiAK
PiBxZW11X2FhcmNoNjRfc2JzYV9kZWZjb25maWcgZG9lc24ndCBib290IHNpbmNlIHRoZSBxZW11
IHZlcnNpb24gYnVtcCB0bwo+IDkuMCBbMV0uIFN5bmMgdGhlIEFURiB2ZXJzaW9uIHdpdGggdGhl
IG9uZSAodjIuMTEpIHVzZWQgYnkgUWVtdSB0ZXN0cwo+IFsyXS4KPiAKPiBTaW5jZSB3ZSB1c2Ug
YSByZWxlYXNlZCB2ZXJzaW9uIG9mIEFURiwgd2Ugc3dpdGNoIHRvIEFURiBjdXN0b20gdmVyc2lv
bgo+IHRvIHVzZSB0aGUgb2ZmaWNpYWwgQVRGIHJlcG9zaXRvcnkgaW5zdGVhZCBvZiB0aGUgcmVh
ZC1vbmx5IG1pcnJvciBvbgo+IEFSTS1zb2Z0d2FyZSdzIGdpdGh1Yi4KPiAKPiBUaGlzIGRvZXNu
J3QgZml4IHlldCB0aGlzIGRlZmNvbmZpZyBkdWUgdG8gYSBidWcgaW4gZWRrMiBhcyBtZW50aW9u
ZWQKPiBpbiB0aGUgcWVtdSBjb21taXQgbG9nIFsyXS4KPiAKPiBXaXRoIHRoZSBlZGsyIHZlcnNp
b24gYnVtcCBhcHBsaWVkLCB0aGlzIGRlZmNvbmZpZyBkb2Vzbid0IGJvb3Qgd2l0aAo+IEFURiB2
Mi4xMC1sdHMgYnV0IGJvb3Qgc3VjY2Vzc2Z1bGx5IHdpdGggQVRGIHYyLjExLgo+IAo+IFsxXSBo
dHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvMTAzYTU1
MDI4Yzc1ZGFjZTMxMjQ3MGJhMDVhMTk3ODg2YzZiNjEwMAo+IFsyXSBodHRwczovL2dpdGxhYi5j
b20vcWVtdS1wcm9qZWN0L3FlbXUvLS9jb21taXQvMjRhN2NkNmE3YzIxZjgyZjFjZTliZDVlY2Y2
ZmI1NGViN2JmNDYwMgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5h
b3VyQHNtaWxlLmZyPgoKV2hlbiB5b3UgcmVzcGluIGEgcGF0Y2gsIHlvdSBuZWVkIHRvIGFkZCB5
b3VyIFNvQiBsaW5lIGhlcmUuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAtLS0KPiAgLi4uL3Bh
dGNoZXMvYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJtLXRydXN0ZWQtZmlybXdhcmUuaGFzaCAgIHwg
MSArCj4gIGNvbmZpZ3MvcWVtdV9hYXJjaDY0X3Nic2FfZGVmY29uZmlnICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDUgKystLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2JvYXJkL3FlbXUvcGF0Y2hlcy9hcm0t
dHJ1c3RlZC1maXJtd2FyZS9hcm0tdHJ1c3RlZC1maXJtd2FyZS5oYXNoIGIvYm9hcmQvcWVtdS9w
YXRjaGVzL2FybS10cnVzdGVkLWZpcm13YXJlL2FybS10cnVzdGVkLWZpcm13YXJlLmhhc2gKPiBp
bmRleCA1NjMyZGIwMWY4Li40YTA1MzRkMWJhIDEwMDY0NAo+IC0tLSBhL2JvYXJkL3FlbXUvcGF0
Y2hlcy9hcm0tdHJ1c3RlZC1maXJtd2FyZS9hcm0tdHJ1c3RlZC1maXJtd2FyZS5oYXNoCj4gKysr
IGIvYm9hcmQvcWVtdS9wYXRjaGVzL2FybS10cnVzdGVkLWZpcm13YXJlL2FybS10cnVzdGVkLWZp
cm13YXJlLmhhc2gKPiBAQCAtMSwzICsxLDQgQEAKPiAgIyBMb2NhbGx5IGNvbXB1dGVkOgo+ICBz
aGEyNTYgIGM5ZjBkMGJmOTY3ZDY5MGVkYmYzNGI2MjE3MjhhNjI3MTg1NmYyZTI2ZWQ0NjA4MWEy
ODViNmQ2MjdhMzU4YzUgIGFybS10cnVzdGVkLWZpcm13YXJlLXYyLjctZ2l0NC50YXIuZ3oKPiAg
c2hhMjU2ICA3ZWZhODllMWI0ZTQxMDZlZTA1ZDY4ZTg3NmM4ZWZiYjE0NjM2NGQ4OWNmZDVkMjZi
ZjQ2NDdiMDljMDhmMzJiICBhcm0tdHJ1c3RlZC1maXJtd2FyZS12Mi4xMC1naXQ0LnRhci5nego+
ICtzaGEyNTYgIGMwZjIzY2NjNzFjNDk5ODllOWFkMjM4YWNmMzM0NDczYzE3YjdjODhmNzlhMjBj
ODI5YzNkNDQzZTM3OTRhMjIgIGFybS10cnVzdGVkLWZpcm13YXJlLXYyLjExLWdpdDQudGFyLmd6
Cj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvcWVtdV9hYXJjaDY0X3Nic2FfZGVmY29uZmlnIGIvY29u
Zmlncy9xZW11X2FhcmNoNjRfc2JzYV9kZWZjb25maWcKPiBpbmRleCA4ZGE0MzMxYjMwLi4yM2Qy
NzRiNTI5IDEwMDY0NAo+IC0tLSBhL2NvbmZpZ3MvcWVtdV9hYXJjaDY0X3Nic2FfZGVmY29uZmln
Cj4gKysrIGIvY29uZmlncy9xZW11X2FhcmNoNjRfc2JzYV9kZWZjb25maWcKPiBAQCAtMTcsOSAr
MTcsOCBAQCBCUjJfVEFSR0VUX1JPT1RGU19FWFQyXzQ9eQo+ICBCUjJfVEFSR0VUX1JPT1RGU19F
WFQyX1NJWkU9IjEyOE0iCj4gICMgQlIyX1RBUkdFVF9ST09URlNfVEFSIGlzIG5vdCBzZXQKPiAg
QlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRT15Cj4gLUJSMl9UQVJHRVRfQVJNX1RSVVNU
RURfRklSTVdBUkVfQ1VTVE9NX0dJVD15Cj4gLUJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdB
UkVfQ1VTVE9NX1JFUE9fVVJMPSJodHRwczovL2dpdGh1Yi5jb20vQVJNLXNvZnR3YXJlL2FybS10
cnVzdGVkLWZpcm13YXJlLmdpdCIKPiAtQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9D
VVNUT01fUkVQT19WRVJTSU9OPSJ2Mi43Igo+ICtCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1X
QVJFX0NVU1RPTV9WRVJTSU9OPXkKPiArQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9D
VVNUT01fVkVSU0lPTl9WQUxVRT0idjIuMTEiCj4gIEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklS
TVdBUkVfUExBVEZPUk09InFlbXVfc2JzYSIKPiAgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJN
V0FSRV9GSVA9eQo+ICBCUjJfVEFSR0VUX0VESzI9eQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
