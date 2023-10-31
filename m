Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC604C4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 11:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46A5A81757;
	Tue, 31 Oct 2023 11:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46A5A81757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jo6r86woYDvh; Tue, 31 Oct 2023 11:39:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7221380E85;
	Tue, 31 Oct 2023 11:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7221380E85
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F3A6A1BF322
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 11:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D53BA40256
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 11:39:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D53BA40256
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IzQCARzTmhmE for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 11:39:54 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99B95401F6
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 11:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99B95401F6
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-507b96095abso7983019e87.3
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 04:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698752391; x=1699357191;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mo4CtTn2JMVIwnrNxa4yGOp7G3Y/ZgY0Y7s88113mmY=;
 b=jyo73pZSSg5paFpfmngkRn7dCNdZPM/LgeHRoee8iovghj738hBVh6p03qYall1Bb+
 f6Mov/YFRjlzHD7x+VmUztWqePQC5JDs/S8pS7QHr8SJCAdawP78dHs1u5mvBBV8nBSU
 3p3ueQEBPGU07NtQMjuxejqTDTplUqMQrtayfIgA298OdXnJ7D6wda6HMda1sii2mfHy
 KlRRdsoay2x5tjTbkeqBx95eKaom3f2Hh3LnT7JOgIJ1DBU4/LpxNFqd3gxb2p0MCYq5
 olj5wKXy31ROLdLk+evL/xTfOZSLfLdFkaj9zRAHbUjbvwnJAXjUt5Gp2nNdBrDWA5xA
 CgrQ==
X-Gm-Message-State: AOJu0YxdC0ICKu3ZreGnm1+IS4X/NvDpDAsF8T09PtHcdkdu2buM6Oog
 AA9ArCcn9S8k8MVWgR2w78nbEj7tC7o1Drmtqns=
X-Google-Smtp-Source: AGHT+IEy2o/4NyisFlckpAp0xWqvf1Cf24Uqi8F7zjdjzNge+Pa8uWTyXnTXQ75sZLj21e/Ar6vJU3qQGGxGSRTYpRY=
X-Received: by 2002:a19:f503:0:b0:509:3835:73bc with SMTP id
 j3-20020a19f503000000b00509383573bcmr287923lfb.55.1698752390881; Tue, 31 Oct
 2023 04:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20231029234003.2606006-1-james.hilliard1@gmail.com>
 <20231029234003.2606006-2-james.hilliard1@gmail.com>
In-Reply-To: <20231029234003.2606006-2-james.hilliard1@gmail.com>
Date: Tue, 31 Oct 2023 12:39:39 +0100
Message-ID: <CAGm1_ktVtmhNE5s-AxNjX+0PT_LbL6ZKncD1Aft9Ozv=Ge-Oiw@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1698752391; x=1699357191; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mo4CtTn2JMVIwnrNxa4yGOp7G3Y/ZgY0Y7s88113mmY=;
 b=bjyC9ErqIW11gV9ELfq++quDmsAg87GjXjmLyvoor9r0Hqh/4b3og2Vg4H7tP53lNi
 tRoZp/+t/WSENQd2f88b6k/UfQaN3evgHCH7N9ejVPOzGvpel1U/GE+2QiI6Tiz/Vl9a
 NURqXugL8nA/ZVAculAKuiBp9SsGLn48rjSXJafEUsXcxocW7gNz/uCHU1hx4e6g1jH7
 K7wrMB/aBtRA+LzgZ9R4Wd4pW+Uhkezpr2/KILsuZI/djqGshH4bxIvPsX7WIyEsXRQo
 vNMtDS2cj6s+wTL87z3xW4Hbll5gcUdkV9sP6+gDauO64K6eX+wtDCGv1yjHmXQHBULj
 JjxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bjyC9Erq
Subject: Re: [Buildroot] [PATCH v4 2/4] package/python-terminaltables: use
 correct pep517 build backend
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Gustavo Heinz <gustavo@gsthnz.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBPY3QgMzAsIDIwMjMgYXQgMTI6NDDigK9BTSBKYW1lcyBIaWxsaWFyZAo8amFtZXMu
aGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBXZSBuZWVkIHRvIG1pZ3JhdGUgcHl0aG9u
LXRlcm1pbmFsdGFibGVzIHRvIHRoZSBwZXA1MTcgcG9ldHJ5LWNvcmUKPiBiYWNrZW5kIGFzIHNl
dHVwdG9vbHMgaXMgbm90IHN1cHBvcnRlZCB3aGVuIGJ1aWxkaW5nIHdpdGggYSBwZXA1MTcKPiBm
cm9udGVuZC4KPgo+IFRoaXMgcGFja2FnZSBjdXJyZW50bHkgYnVpbGRzIHVzaW5nIHNldHVwdG9v
bHMgYXMgd2UgZG8gbm90IHlldAo+IHVzZSBzZXR1cHRvb2xzIHdpdGggYSBwZXA1MTcgYnVpbGQg
ZnJvbnRlbmQuIFRoZSBwYWNrYWdlIGNvbnRhaW5zCj4gYSBzZXR1cHRvb2xzIGZhbGxiYWNrIHdo
aWNoIG9ubHkgY2FuIGJlIHVzZWQgd2hlbiB1c2luZyBzZXR1cHRvb2xzCj4gd2l0aG91dCBhIHBl
cDUxNyBmcm9udGVuZCBhcyB0aGUgcGVwNTE3IGZyb250ZW5kIHdpbGwgb25seSB1c2UgdGhlCj4g
YnVpbGQgYmFja2VuZCBzcGVjaWZpZWQgaW4gdGhlIHBhY2thZ2UgcHlwcm9qZWN0LnRvbWwgd2hp
Y2ggaXMKPiBwb2V0cnktY29yZSBhbmQgbm90IHNldHVwdG9vbHMuCj4KPiBVcHN0cmVhbSBoYXMg
bWVyZ2VkIGEgcGF0Y2ggcmVwbGFjaW5nIHBvZXRyeSB3aXRoIHBvZXRyeS1jb3JlLCBob3dldmVy
Cj4gd2UgY2FuIG5vdCBiYWNrcG9ydCB0aGlzIHVzaW5nIGEgcGF0Y2ggZmlsZSBkdWUgdG8gQ1JM
RiBsaW5lIGVuZGluZwo+IGlzc3VlcyBzbyB3ZSB3aWxsIGhhdmUgdG8gYXBwbHkgdGhlIGNoYW5n
ZSBpbiB0aGUgcGF0Y2ggdXNpbmcgc2VkCj4gaW5zdGVhZC4KPgo+IFNlZSB1cHN0cmVhbSBjb21t
aXQ6Cj4gaHR0cHM6Ly9naXRodWIuY29tL21hdHRoZXdkZWFubWFydGluL3Rlcm1pbmFsdGFibGVz
L2NvbW1pdC85ZTNkZGEwZWZiNTRmZWU2OTM0Yzc0NGExM2E3MzM2ZDI0YzZlOWU5Cj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KClJl
dmlld2VkLWJ5OiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Cgo+
IC0tLQo+IENoYW5nZXMgdjEgLT4gdjI6Cj4gICAtIGFkZCBtb3JlIGRldGFpbHMgcmVnYXJkaW5n
IHBlcDUxNyBmcm9udGVuZCBjb21wYXRpYmlsaXR5Cj4gLS0tCj4gIHBhY2thZ2UvcHl0aG9uLXRl
cm1pbmFsdGFibGVzL3B5dGhvbi10ZXJtaW5hbHRhYmxlcy5tayB8IDEwICsrKysrKysrKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcHl0aG9uLXRlcm1pbmFsdGFibGVzL3B5dGhvbi10ZXJtaW5hbHRhYmxl
cy5tayBiL3BhY2thZ2UvcHl0aG9uLXRlcm1pbmFsdGFibGVzL3B5dGhvbi10ZXJtaW5hbHRhYmxl
cy5tawo+IGluZGV4IGIzMWVkMzMyYjYuLjM4NWM3MWFlMmQgMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS9weXRob24tdGVybWluYWx0YWJsZXMvcHl0aG9uLXRlcm1pbmFsdGFibGVzLm1rCj4gKysrIGIv
cGFja2FnZS9weXRob24tdGVybWluYWx0YWJsZXMvcHl0aG9uLXRlcm1pbmFsdGFibGVzLm1rCj4g
QEAgLTcsOCArNywxNiBAQAo+ICBQWVRIT05fVEVSTUlOQUxUQUJMRVNfVkVSU0lPTiA9IDMuMS4x
MAo+ICBQWVRIT05fVEVSTUlOQUxUQUJMRVNfU09VUkNFID0gdGVybWluYWx0YWJsZXMtJChQWVRI
T05fVEVSTUlOQUxUQUJMRVNfVkVSU0lPTikudGFyLmd6Cj4gIFBZVEhPTl9URVJNSU5BTFRBQkxF
U19TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzL2Y1L2ZjLzBi
NzNkNzgyZjVhYjdmZWJhOGQwMDc1NzNhMzc3M2M1ODI1NWYyMjNjNTk0MGE3YjcwODVmMDIxNTNj
Mwo+IC1QWVRIT05fVEVSTUlOQUxUQUJMRVNfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKPiArUFlU
SE9OX1RFUk1JTkFMVEFCTEVTX1NFVFVQX1RZUEUgPSBwZXA1MTcKPiAgUFlUSE9OX1RFUk1JTkFM
VEFCTEVTX0xJQ0VOU0UgPSBNSVQKPiAgUFlUSE9OX1RFUk1JTkFMVEFCTEVTX0xJQ0VOU0VfRklM
RVMgPSBMSUNFTlNFCj4gK1BZVEhPTl9URVJNSU5BTFRBQkxFU19ERVBFTkRFTkNJRVMgPSBob3N0
LXB5dGhvbi1wb2V0cnktY29yZQo+ICsKPiArIyB3ZSBjYW4ndCB1c2UgYSBub3JtYWwgcGF0Y2gg
ZmlsZSBkdWUgdG8gZGlmZmVyZW50IGxpbmUgZW5kaW5ncwo+ICtkZWZpbmUgUFlUSE9OX1RFUk1J
TkFMVEFCTEVTX1VTRV9QT0VUUllfQ09SRQo+ICsgICAgICAgJChTRUQpICdzL3JlcXVpcmVzID0g
XFsicG9ldHJ5Pj0wLjEyIlxdL3JlcXVpcmVzID0gXFsicG9ldHJ5LWNvcmU+PTEuMC4wIlxdLycg
JChARCkvcHlwcm9qZWN0LnRvbWwKPiArICAgICAgICQoU0VEKSAncy9idWlsZC1iYWNrZW5kID0g
InBvZXRyeS5tYXNvbnJ5LmFwaSIvYnVpbGQtYmFja2VuZCA9ICJwb2V0cnkuY29yZS5tYXNvbnJ5
LmFwaSIvJyAkKEBEKS9weXByb2plY3QudG9tbAo+ICtlbmRlZgo+ICtQWVRIT05fVEVSTUlOQUxU
QUJMRVNfUE9TVF9QQVRDSF9IT09LUyArPSBQWVRIT05fVEVSTUlOQUxUQUJMRVNfVVNFX1BPRVRS
WV9DT1JFCj4KPiAgJChldmFsICQocHl0aG9uLXBhY2thZ2UpKQo+IC0tCj4gMi4zNC4xCj4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
