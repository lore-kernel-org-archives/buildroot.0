Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03324C5478C
	for <buildroot@archiver.kernel.org>; Tue, 27 Feb 2024 22:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9F824049C;
	Tue, 27 Feb 2024 22:23:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hXgtpk2-O488; Tue, 27 Feb 2024 22:23:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C03AF40526
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C03AF40526;
	Tue, 27 Feb 2024 22:23:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE09A1BF842
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 22:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB3F44052C
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 22:23:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eCCRXK4BMvJO for <buildroot@lists.busybox.net>;
 Tue, 27 Feb 2024 22:23:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9761540309
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9761540309
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9761540309
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 22:23:16 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33ddebaf810so1287017f8f.2
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 14:23:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709072594; x=1709677394;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QhaC6bYSrOI/+9HLEzdl+lWJ+WCy+L+VkrYG+ShEuFM=;
 b=vgzqu6LWhLxWGsJH/uVLNL+Q8Ar3uLP0fFmmXkAq9hSEMT1XnMwZSNbXJ9Eqbotq2Y
 rUJTrXS1qCQN1t7O05Z2xINaYAoDjuO7mEFAiW8zj1goLd+anyhweKRxrReypOwckfN5
 Zhaz8uT3ky44MV6kQaxaoq5cEa3APkFv0MygQluurTkWST8TQA5U8LLUxhQwrAxZJ7nC
 zx+GWzvCU3TZ2Lh+UYFlkUsDrAiM8N6Hz6HokVtkr+WV+AGDaPHdTlreEN3ARbmbkLsn
 AwFGePmxlC6L8E0awMznilQ5Qc/DzudNFpLL73Yuw5c4WvvEudFZ9EFZX7+Z3rpZero4
 FGfw==
X-Gm-Message-State: AOJu0YyfCVfk2+79uBPMaDl1KAFLyjBpCREvYlneDcSiIe8t0HB/dJuW
 rCUw+tpSj9E9cwk5XDCqAN1/WQNEE4LGvuTdOWYUgJPFRyOcHwRMa6r02nYHzX0=
X-Google-Smtp-Source: AGHT+IGLtF/tl1w25AVWewQOyCrgH5j2chbWMVwRPyZ+2I9G8vK4onLejZTpNFKf+POGVDB1ZCmIiQ==
X-Received: by 2002:adf:f186:0:b0:33b:381d:a71e with SMTP id
 h6-20020adff186000000b0033b381da71emr7622922wro.17.1709072594513; 
 Tue, 27 Feb 2024 14:23:14 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 bp19-20020a5d5a93000000b0033d4c3b0beesm13046019wrb.19.2024.02.27.14.23.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 14:23:14 -0800 (PST)
Message-ID: <28040f8a-c68e-4966-9e81-804f723f2100@smile.fr>
Date: Tue, 27 Feb 2024 23:23:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
 <20240224205654.1546744-17-dario.binacchi@amarulasolutions.com>
 <383a2418-fa99-44f6-935c-8423cf9c22b3@smile.fr>
 <CABGWkvr8UBGB=z9QWwdZxjHQ53E0gjXRp9oK0PUTmwo3Vas28g@mail.gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CABGWkvr8UBGB=z9QWwdZxjHQ53E0gjXRp9oK0PUTmwo3Vas28g@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709072594; x=1709677394;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QhaC6bYSrOI/+9HLEzdl+lWJ+WCy+L+VkrYG+ShEuFM=;
 b=kB/iZrrXBulcbZrHT8u94IDphqSeSPYXRU1SxI07NXkzTK1dXsz0Fp5p3qf5Qjyk3L
 HUfWGv2qzo3PVWqnZZsqftjpboq9/s7Ll5zvy70D3lpztEyyuzTeQykGpFXMYhgJGghb
 i4oI5YeXrc8fHK7Ju0qHLH4DO+494Z9x8G9wKyhRuuD54cj3c11lxKtTl9ekT+ztxlyK
 VJaHm3PCxCOi1+5yR5PY/BcaLfHVwBXixOU9/rwFjQ2DN5UDlq9jB2y7IxJ348Qe/1Ie
 UYbOFyP2dNCKxVVLNf+lqxduL5lpzjW/fofoRrt2UuvaU78NGunxwNzOD57+87u/cAEA
 q4ig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=kB/iZrrX
Subject: Re: [Buildroot] [PATCH v6 16/16] configs/ti_am62x_sk_defconfig:
 bump Linux version to 6.6.17
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRGFyaW8sCgpMZSAyNy8wMi8yMDI0IMOgIDE3OjQwLCBEYXJpbyBCaW5hY2NoaSBhIMOpY3Jp
dMKgOgo+IEhpIFJvbWFpbiwKPiAKPiBPbiBTdW4sIEZlYiAyNSwgMjAyNCBhdCA1OjQz4oCvUE0g
Um9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyb3RlOgo+Pgo+PiBIZWxsbyBE
YXJpbywKPj4KPj4gTGUgMjQvMDIvMjAyNCDDoCAyMTo1NiwgRGFyaW8gQmluYWNjaGkgYSDDqWNy
aXQgOgo+Pj4gVGVzdGVkIG9uIFNLLUFNNjJCLVAxLgo+Pgo+PiBZb3UgY291bGQgY29tcGxldGUg
eW91ciBzZXJpZXMgYnkgdXBkYXRpbmcgdGhlIHRpX2FtNjR4X3NrX2RlZmNvbmZpZyB0b28gYW5k
Cj4+IHJlbW92ZSB0aS1rMy1pbWFnZS1nZW4uCj4gCj4gSSBwcmVmZXJyZWQgdG8gc3VibWl0IHZl
cnNpb24gNyB3aXRob3V0IHRoZSBwYXRjaGVzIGZvciB1cGRhdGluZyB0aGUKPiB0aV9hbTY0eF9z
a19kZWZjb25maWcgYW5kIHRoZSByZW1vdmFsIG9mIHRoZSB0aS1rMy1pbWFnZS1nZW4gcGFja2Fn
ZS4KPiBUaGlzIGlzIGJlY2F1c2UgSSBkbyBub3QgaGF2ZSB0aGUgYW02NHhfc2sgYm9hcmQgdG8g
dGVzdCB0aGUgY2hhbmdlcwo+IG9uLiBIb3dldmVyLCBJIGFtIGF2YWlsYWJsZSB0byBzdWJtaXQg
YSBzZXBhcmF0ZSBzZXJpZXMgZm9yIGFwcGx5aW5nCj4gdGhlIGNoYW5nZXMgdG8gdGlfYW02NHhf
c2tfZGVmY29uZmlnIGlmIHRoZXJlIGlzIHNvbWVvbmUgd2hvIGNhbiB0ZXN0Cj4gdGhlIGNvbmZp
Z3VyYXRpb24gZm9yIG1lLgo+IFBsZWFzZSBsZXQgbWUga25vdy4KCk1heWJlIHlvdSBjYW4gYXNr
IHRvIEFuZHJlYXMgRGFubmVuYmVyZyBmb3IgdGhlIGFtNjR4X3NrPwoKPiBNYXliZSBpZiB5b3Ug
Y2FuIGFsc28gdGVzdCBvbiBBTTY0eCBqdXN0IHRvIGJlIHN1cmUgdGhlIGRlZmNvbmZpZyBpcyB3
b3JraW5nLgoKSSdtIHBsYW5uaW5nIG9uIHRlc3RpbmcgdGhlIGVudGlyZSBzZXJpZXMgaGVyZSBw
cmV0dHkgc29vbiBhbmQgd2lsbApwcm92aWRlIGZlZWRiYWNrIChJIGhhdmUgYWNjZXNzIHRvIGFu
eSBhbmQgYWxsIGJvYXJkczopCgpodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvcGlwZXJtYWlsL2J1
aWxkcm9vdC8yMDI0LUZlYnJ1YXJ5LzY4NTgzNi5odG1sCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoK
Cj4gCj4gVGhhbmtzIGFuZCByZWdhcmRzLAo+IERhcmlvCj4gCj4+Cj4+IEV4Y2VwdCBmb3IgbWlu
b3IgaW1wcm92ZW1lbnQsIHRoaXMgc2VyaWVzIGlzIG9rIGZvciBtZS4KPj4KPj4gQmVzdCByZWdh
cmRzLAo+PiBSb21haW4KPj4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8
ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4+Pgo+Pj4gLS0tCj4+Pgo+Pj4g
Q2hhbmdlcyBpbiB2NToKPj4+IC0gQnVtcCB0byA2LjYuMTcgZnJvbSA2LjYuMQo+Pj4gLSBVcGRh
dGUgY29tbWl0IG1lc3NhZ2UKPj4+Cj4+PiBDaGFuZ2VzIGluIHY0Ogo+Pj4gLSBBZGQgQlIyX1BB
Q0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzYgdG8gdGlfYW02Mnhfc2tfZGVmY29u
ZmlnLgo+Pj4KPj4+IG5vIGNoYW5nZXMgc2luY2UgdjEKPj4+Cj4+PiAgY29uZmlncy90aV9hbTYy
eF9za19kZWZjb25maWcgfCA0ICsrLS0KPj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9jb25maWdzL3RpX2FtNjJ4
X3NrX2RlZmNvbmZpZyBiL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnCj4+PiBpbmRleCA0
ODRmOWZlYjhjNjEuLjhjOTYyYjRhOTQ5NCAxMDA2NDQKPj4+IC0tLSBhL2NvbmZpZ3MvdGlfYW02
Mnhfc2tfZGVmY29uZmlnCj4+PiArKysgYi9jb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZwo+
Pj4gQEAgLTEsMTEgKzEsMTEgQEAKPj4+ICBCUjJfYWFyY2g2ND15Cj4+PiAtQlIyX1BBQ0tBR0Vf
SE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzQ9eQo+Pj4gK0JSMl9QQUNLQUdFX0hPU1RfTElO
VVhfSEVBREVSU19DVVNUT01fNl82PXkKPj4+ICBCUjJfUk9PVEZTX1BPU1RfQlVJTERfU0NSSVBU
PSJib2FyZC90aS9hbTYyeC1zay9wb3N0LWJ1aWxkLnNoIgo+Pj4gIEJSMl9ST09URlNfUE9TVF9J
TUFHRV9TQ1JJUFQ9ImJvYXJkL3RpL2FtNjJ4LXNrL3Bvc3QtaW1hZ2Uuc2giCj4+PiAgQlIyX1JP
T1RGU19QT1NUX1NDUklQVF9BUkdTPSItYyB0dHlTMiwxMTUyMDBuOCAtciAvZGV2L21tY2JsazFw
MiAteCBlYXJseWNvbj1uczE2NTUwYSxtbWlvMzIsMHgwMjgwMDAwMCIKPj4+ICBCUjJfTElOVVhf
S0VSTkVMPXkKPj4+ICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKPj4+IC1CUjJf
TElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjQuMTYiCj4+PiArQlIyX0xJTlVY
X0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi42LjE3Igo+Pj4gIEJSMl9MSU5VWF9LRVJO
RUxfVVNFX0FSQ0hfREVGQVVMVF9DT05GSUc9eQo+Pj4gIEJSMl9MSU5VWF9LRVJORUxfRFRTX1NV
UFBPUlQ9eQo+Pj4gIEJSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJ0aS9rMy1hbTYy
NS1zayIKPj4KPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
