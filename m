Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2362CDB482
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 13:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D964405EB;
	Thu, 19 Oct 2023 13:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D964405EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id raDIxXXbuSPK; Thu, 19 Oct 2023 13:50:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C44A242F64;
	Thu, 19 Oct 2023 13:49:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C44A242F64
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 21B741BF27A
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 13:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF1F381CE7
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 13:49:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF1F381CE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zQa6IfidwRlM for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 13:49:57 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE60B8188A
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 13:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE60B8188A
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1ca6809fb8aso33351665ad.1
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 06:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697723396; x=1698328196;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0ScLmiDdxchDrOynVeSkTbgG3n1GIJWhkJvme0ffVFM=;
 b=uLhznnx0dlYf2ijpelyPzvTaxJkRMiNrjTnhjZjDLuAWGuW1TJFqIojjJrzXGuSb59
 CsKSiTY0xI3Pwcohit4X3R1jKkEcdhB0pAWFZm5Yzy2ma449xfUAyE5OPmKr0vaa57Ps
 v0ZCSPLFR85bgz4Jg3eUAERnmgsJlijayD8vtFjR8FBfpu1+WTO0uUIeEPeHek19S1T8
 XQnNDvDLAJnhhvRSCJUgne4s9V3tGDFYsqfd/s9/ygkO9S+zg3OxwgyzNb5euaPRx7vG
 HJpaFe/NqPmM4DMoV7STxuli0pMowN/yy+pPtSgSynf9uzLEj1hHUCLb99soWX6IVwHg
 gOng==
X-Gm-Message-State: AOJu0Yx3qDVsiYenRQTSMiFD+H+v+bkIOUMrZCgM/xX4kXXL2t/k7Kkl
 keFa00lfo7GLH3bifvrMN6Lx9tp9qh09bzolvM+cu9+SXoU=
X-Google-Smtp-Source: AGHT+IFbDI7HXmmHQIzESjBSqs9cD5h/NaG8c2CBefvfDVxFK7ga6+UqsC/lfowoGHHY3t4PFJGL45mWbY8OAhiRz9E=
X-Received: by 2002:a17:90a:195e:b0:27d:60b1:4f2c with SMTP id
 30-20020a17090a195e00b0027d60b14f2cmr2087841pjh.4.1697723396169; Thu, 19 Oct
 2023 06:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <20231017143424.430007-1-anaumann@ultratronik.de>
 <PH1P110MB1603AE1FC3925D2A2D33EEED9FD6A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <38dd6e9a-7fea-e3fb-21a1-5a381a36c8cf@mind.be>
 <bede2a82-ee1f-4f8a-97f8-c6e2b54b2b84@grenoble.cnrs.fr>
 <PH1P110MB160358C3869C0C4BADDCB52B9FD4A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <PH1P110MB160358C3869C0C4BADDCB52B9FD4A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
From: =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>
Date: Thu, 19 Oct 2023 15:49:44 +0200
Message-ID: <CAEktqctCpzEL25Rxi4=BUH4VoA7OKac8rMWFkxeRqh9QRbsURw@mail.gmail.com>
To: Vincent Fazio <vfazio@xes-inc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697723396; x=1698328196; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0ScLmiDdxchDrOynVeSkTbgG3n1GIJWhkJvme0ffVFM=;
 b=Grp3Fz1+dbFfxiPHFN7Vabyj7Nn/b8au1TAtjHB7ejZciMOonlnae9MI75fnhAaiDP
 fsU6sGSThhu4Xyv2b08BlM+XAifY/pMK0XUF84+DLqeCcDR+QsZWMQpGS0tQzBM/9YqC
 nfMz7qcCWJOUWuMZSOxXg5uz96gAzzjexINPW/myy7DkMjZwY2SN9YhDhHEyOSWQdY1j
 kkznWa/xTqvOO7s8+yg/1Mjhwf+pJ7sWCtAi3p01KGbJ/6ESiVbDwqj1mmeGjEIhQ0oI
 7uvGgttZKm9HvbyFvmqvFG/YnTkd4ZSSMFOaJxEwlu3m1YktcF9YbkwAREah2C2/5eU9
 yCUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Grp3Fz1+
Subject: Re: [Buildroot] [External] - [PATCH 0/1] libgpiod v2
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
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gYWxsLAoKT24gVGh1LCBPY3QgMTksIDIwMjMgYXQgMzowMOKAr1BNIFZpbmNlbnQgRmF6
aW8gPHZmYXppb0B4ZXMtaW5jLmNvbT4gd3JvdGU6Cj4KPiBBbGwKPgo+ID4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IGJ1aWxkcm9vdCA8YnVpbGRyb290LWJvdW5jZXNAYnVp
bGRyb290Lm9yZz4gT24gQmVoYWxmIE9mIEVkZ2FyCj4gPiBCb25ldAo+ID4gU2VudDogVGh1cnNk
YXksIE9jdG9iZXIgMTksIDIwMjMgMjozNSBBTQo+ID4gVG86IGJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCj4gPiBTdWJqZWN0OiBSZTogW0J1aWxkcm9vdF0gW0V4dGVybmFsXSAtIFtQQVRDSCAwLzFd
IGxpYmdwaW9kIHYyCj4gPgo+ID4gSGVsbG8hCj4gPgo+ID4gT24gMjAyMy0xMC0xOCwgYWJvdXQg
d2hldGhlciB0aGUgQVBJLWJyZWFraW5nIGxpYmdwaW9kIHYyIHNob3VsZCBiZSBhbgo+ID4gdXBn
cmFkZSBvciBhIG5ldyBwYWNrYWdlLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToKPiA+ID4g
SWYgaXQncyBsaWtlICJtb3N0bHkgaXQgd2lsbCBzdGlsbCB3b3JrLCBidXQgdGhlcmUgYXJlIGEg
ZmV3IGZ1bmN0aW9ucwo+ID4gPiB0aGF0IHlvdSBuZWVkIHRvIHJlcGxhY2Ugd2l0aCBhIG5ldyB2
YXJpYW50IiwgdGhlbiB0aGUgcHJvcGVyIGFwcHJvYWNoCj4gPiA+IGlzIGluZGVlZCB0byBmaXgg
dGhlIHBhY2thZ2VzIHRoYXQgZmFpbCB0byBidWlsZC4gWy4uLl0KPiA+ID4KPiA+ID4gRm9yIGJp
Z2dlciBBUEkgY2hhbmdlcyBbLi4uXSB3ZSBpbmRlZWQgbmVlZCBhIG5ldyBwYWNrYWdlIGxpYmdw
aW9kMi4KPiA+Cj4gPiBJJ3ZlIHdhdGNoZWQgYSB0YWxrIGJ5IEJhcnRvc3ogR29sYXN6ZXdza2kg
YWJvdXQgdGhlIG5ldyBsaWJncGlvZCxbMV0gdGhlbgo+ID4gc3RhcnRlZCBsb29raW5nIGF0IHRo
ZSBkb2N1bWVudGF0aW9uIG9mIHRoaXMgbmV3IEFQSS5bMl0gTXkgZmVlbGluZyBpcyB0aGF0Cj4g
PiB0aGlzIGlzIGEgcXVpdGUgZXh0ZW5zaXZlIHJld3JpdGUuIEEgcHJvZ3JhbSB3YW50aW5nIHRv
IHN1cHBvcnQgYm90aCB0aGUgdjEKPiA+IGFuZCB0aGUgdjIgQVBJcyB3b3VsZCBuZWVkIHF1aXRl
IGEgYml0IG9mIGNvbmRpdGlvbmFsIGNvbXBpbGF0aW9uLgo+ID4KPgo+IENvcnJlY3QsIHRoZSBz
b25hbWUgY2hhbmdlZCBmcm9tIC4yIHRvIC4zLCBidXQgdGhlIGxpYnJhcnkgd2Fzbid0IHJlbmFt
ZWQgdG8gbGliZ3Bpb2QxCj4gYW5kIHRoZSBoZWFkZXIgd2FzIG5vdCByZWxvY2F0ZWQgdG8gZGlz
dGluZ3Vpc2ggaXQgZnJvbSB0aGUgb3JpZ2luYWwgdmVyc2lvbi4KPgo+ID4gQmVzaWRlcywgSSBj
b3VsZCBub3QgZmluZCBpbiB0aGUgaGVhZGVyIGEgbWFjcm8gZGVzaWduZWQgdG8gZXhwbGljaXRs
eSB0ZWxsIHRoZQo+ID4gQVBJIHZlcnNpb24sIGFsdGhvdWdoIHNvbWUgbWFjcm9zLCB0aGF0IGFy
ZSBkZWZpbmVkIG9ubHkgaW4gdjEsIGNvdWxkIGJlCj4KPiBJIG5vdGljZWQgdGhpcyBhcyB3ZWxs
LiBUaGVyZSdzIGEgX2Z1bmN0aW9uXyBidXQgbm90IGEgZGVmaW5lLgo+Cj4gSSB3YXMgY29uc2lk
ZXJpbmcgIGNoZWNraW5nIHRoZSB2ZXJzaW9uIHdpdGggcGtnLWNvbmZpZyBhdCBjb25maWd1cmUg
dGltZSBzaW5jZSB0aGUKPiB2ZXJzaW9uIGlzIGV4cG9zZWQgYnkgdGhlIHBjIGZpbGUgYW5kIHRo
ZW4gc2V0dGluZyBhIGRlZmluZSB1c2VkIGZvciBjb25kaXRpb25hbCBjb21waWxlcy4KPgo+IEJ1
dCB5ZXMsIGl0IHdvdWxkIHJlcXVpcmUgZXh0ZW5zaXZlIG1vZGlmaWNhdGlvbiBkdWUgdG8gdGhl
IHJld3JpdGUgb2YgdGhlIGxpYnJhcnksIGJ1dAo+IGFsbCB1cHN0cmVhbSBwYWNrYWdlcyBhcmUg
Z29pbmcgdG8gaGF2ZSB0byBkZWFsIHdpdGggaXQgYXQgc29tZSBwb2ludCBzaW5jZSB0aGUga2Vy
bmVsJ3MKPiBHUElPX0NERVZfVjEgaW50ZXJmYWNlIGlzIGRlcHJlY2F0ZWQgYW5kIHdvbid0IGJl
IHN1cHBvcnRlZCBmb3JldmVyLgoKSSBhbHJlYWR5IHBhdGNoZWQgc3d1cGRhdGUgaW4gb3JkZXIg
dG8gd29yayB3aXRoIGJvdGggdmVyc2lvbnMuIEkgaGF2ZQp0byBjbGVhbiBzb21lIHRoaW5ncyB1
cCwKYnV0IGl0IGlzIGFscmVhZHkgd29ya2luZy4gSSB3aWxsIHNlbmQgdGhlIHBhdGNoLXNlcmll
cyB0byB0aGUKc3d1cGRhdGUgbWFpbGluZyBwcm9iYWJseQpzb21ldGltZSB0b21vcnJvdy4KCkF0
IGxlYXN0IGZvciBzaW1wbGUgb3BlcmF0aW9ucyBsaWtlIHNldHRpbmcgb3IgZ2V0dGluZyBhIGdw
aW8gdGhlCnJld29yayBpcyBxdWl0ZSBzdHJhaWdodCBmb3J3YXJkLgpUaGUgYmlnZ2VzdCByZXdv
cmsgaXMgbmVlZGVkIGluIHRoZSBpbml0aWFsaXphdGlvbiBwaGFzZSwgYW5kIGluIHRoZQphZGRp
dGlvbmFsIHBvaW50ZXJzIHRvIHRoZQpyZXF1ZXN0IHN0cnVjdHVycywgd2hpY2ggeW91IGhhdmUg
dG8ga2VlcC4KCj4KPiBsaWJncGlvZCAyLnggYWxzbyByZXF1aXJlcyBMaW51eCB2NS4xMCsgc2lu
Y2UgaXQgdXNlcyB1QVBJIHYyLgo+Cj4gPiB1c2VkIGZvciB0aGlzIHB1cnBvc2UuIEUuZy46Cj4g
Pgo+ID4gICAgICNpZmRlZiBHUElPRF9MSU5FX0JVTEtfTUFYX0xJTkVTCj4gPiAgICAgIyBkZWZp
bmUgVVNFX0dQSU9EX0FQSV9WMQo+ID4gICAgICNlbHNlCj4gPiAgICAgIyBkZWZpbmUgVVNFX0dQ
SU9EX0FQSV9WMgo+ID4gICAgICNlbmRpZgo+ID4KSSBhY3R1YWxseSBoYWQgdGhlIHNhbWUgaWRl
YSwgYnV0IGluc3RlYWQgb2YgZ29pbmcgd2l0aCBhIG5hbWUgd2hpY2gKaXMgbm8gbG9uZ2VyIHVz
ZWQsIGkgd2VudAp3aXRoIGEgbmFtZSB0aGF0IGhhcyBiZWVuIGludHJvZHVjZWQgaW4gdjIgKEdQ
SU9fVjJfTElORVNfTUFYKSBJCmFjdHVhbGx5IGRvbid0IGtub3csCndoaWNoIHdheSBpcyBiZXR0
ZXIsIHNpbmNlIGFuIG9sZCBvbmUgbWlnaHQgcmVhcHBlYXIgYXQgc29tZSBwb2ludCBhbmQKYSBu
ZXcgb25lIG1pZ2h0IHZhbmlzaApvciBiZSByZW5hbWVkLgo+ID4gUmVnYXJkcywKPiA+Cj4gPiBF
ZGdhci4KPiA+Cj4gPiBbMV0gaHR0cHM6Ly9scGMuZXZlbnRzL2V2ZW50LzE2L2NvbnRyaWJ1dGlv
bnMvMTI0Ny8KPiA+IFsyXSBodHRwczovL2xpYmdwaW9kLnJlYWR0aGVkb2NzLmlvL2VuL2xhdGVz
dC9tb2R1bGVzLmh0bWwKPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiBidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
