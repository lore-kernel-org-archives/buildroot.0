Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C01C3DA66
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 15:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D79883BBD;
	Fri, 25 Aug 2023 15:41:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D79883BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2jDUMpRg9y_C; Fri, 25 Aug 2023 15:41:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96A4283C1C;
	Fri, 25 Aug 2023 15:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96A4283C1C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 250181BF271
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 15:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BD4083C1C
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 15:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BD4083C1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cOhiRSMPvnZV for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 15:41:47 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D451E83BBD
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 15:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D451E83BBD
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-31c615eb6feso844388f8f.3
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 08:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692978105; x=1693582905;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uVFD5v2Zcl0/5fw0BDRlUpBTFLlcBzP4XOw/bRsuxr0=;
 b=dCOU1YYdHv1whzMsEIvfdtS3KZIa7UQ2KZ+KDKvYsdRCLY4dvRGsQN5zZHck3b491j
 1eeJ8KIEIXR6L6Iz05VXoLesxQUutQcgQWFMZosfW/49fKU6Pb2fqSI9L/MPPtkkZ1cJ
 Y6WWFACV9SguW3PJ6A9DbCc3eGLCfTtPuWOcyVQxksX5SfNjAwV6ry/xWdzu0Kc7LSX9
 EfdMfKGi7SHbVAs8haWl/hk5hxbr92eqUZLHF3tzIc54SrTFT3mBcuD/R+TqCYpj7MYI
 HFyjWR5xRCeWm9KmTdg4qP8MSixT4vT4rY5UUEU62a5zQ3Br1yN1mNVckSeQZPduCCLH
 0qDA==
X-Gm-Message-State: AOJu0YxgrWZRAmVLy5NkdCijh+x+JMAcNrZSJi45gyrDzDqT+HLixVsz
 0RIhMZ8iOwZRZ6lIlmm2HSBlwU4e36iR8Q6aTJ8AvoQFeKv9H9N6
X-Google-Smtp-Source: AGHT+IEZWl2LRmD0r3skmEpRU1coRMhvgqEUOFfhiExw6E1cJrMnurfARPh2U2LVF70HeKYV2Rqo8VlpW2M42UMmt/E=
X-Received: by 2002:adf:e4c9:0:b0:31a:dbd8:95d4 with SMTP id
 v9-20020adfe4c9000000b0031adbd895d4mr14289279wrm.12.1692978104739; Fri, 25
 Aug 2023 08:41:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230815131542.1402848-1-javad321javad@gmail.com>
 <20230824232211.250d51b1@windsurf>
In-Reply-To: <20230824232211.250d51b1@windsurf>
From: Javad Rahimipetroudi <javad321javad@gmail.com>
Date: Fri, 25 Aug 2023 19:11:30 +0330
Message-ID: <CAL245asN3rbf_imzEE2dmX-rr-_EtcD-GWYiupAuaNZ_DvQffw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692978105; x=1693582905;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uVFD5v2Zcl0/5fw0BDRlUpBTFLlcBzP4XOw/bRsuxr0=;
 b=JT6LP7I3ZQ4RhbC6YRbRF6YHTbN/Mr3BUcpZgdgiTGLXVUC3rKewFOVbMhuV1RHnde
 +T5ksdCdMJ5IeRImANmld3+9enx+zU7DJUzLLT4ECwO71oSIPE9m3OOlvn64cCbArhR8
 GTfWDm2VJAh4ZlbXd1mtuYN4Rsk/1OH2mUaIGr1Av4W/iOs30C2mDK4Zrde7WzgjQl5k
 y/r7jZJbaB8O47ipb2hLmpvT7pu2Oe6JxJkXOfMg9w3yPbk+4V5yMNGxQrMaoRSN2bwL
 hC0qOCIxyAfPbMPWJbzmZyhqOgvRLjivyJN2NrYnl7VK50jBoSYHi4wxLljwPOY8LeZ2
 61fw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=JT6LP7I3
Subject: Re: [Buildroot] [PATCH 1/4] configs/orangepi_pc2: bump Linux
 version to 6.1.45
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzCgpPbiBGcmksIEF1ZyAyNSwgMjAyMyBhdCAxMjo1MuKAr0FNIFRob21hcyBQZXRh
enpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCAx
NSBBdWcgMjAyMyAxNjo0NTozOSArMDMzMAo+IEphdmFkIFJhaGltaSA8amF2YWQzMjFqYXZhZEBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9vcmFuZ2VwaV9wYzJf
ZGVmY29uZmlnIGIvY29uZmlncy9vcmFuZ2VwaV9wYzJfZGVmY29uZmlnCj4gPiBpbmRleCAzZGUw
NjdhZTU0Li43NTM2NzA0OTQ3IDEwMDY0NAo+ID4gLS0tIGEvY29uZmlncy9vcmFuZ2VwaV9wYzJf
ZGVmY29uZmlnCj4gPiArKysgYi9jb25maWdzL29yYW5nZXBpX3BjMl9kZWZjb25maWcKPiA+IEBA
IC0xLDEzICsxLDEzIEBACj4gPiAgQlIyX2FhcmNoNjQ9eQo+ID4gIEJSMl9BUk1fRlBVX1ZGUFY0
PXkKPiA+IC1CUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzVfMTY9eQo+ID4g
K0JSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNl8xPXkKPiA+ICBCUjJfVEFS
R0VUX0dFTkVSSUNfSVNTVUU9IldlbGNvbWUgdG8gT3JhbmdlcGkgUEMyIgo+ID4gIEJSMl9ST09U
RlNfUE9TVF9CVUlMRF9TQ1JJUFQ9ImJvYXJkL29yYW5nZXBpL2NvbW1vbi9wb3N0LWJ1aWxkLnNo
Igo+ID4gIEJSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9InN1cHBvcnQvc2NyaXB0cy9nZW5p
bWFnZS5zaCIKPiA+ICBCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9Ii1jICQoQklOQVJJRVNf
RElSKS9nZW5pbWFnZS5jZmciCj4gPiAgQlIyX0xJTlVYX0tFUk5FTD15Cj4gPiAgQlIyX0xJTlVY
X0tFUk5FTF9DVVNUT01fVkVSU0lPTj15Cj4gPiAtQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVS
U0lPTl9WQUxVRT0iNS4xNi4xIgo+ID4gK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05f
VkFMVUU9IjYuMS40NSIKPiA+ICBCUjJfTElOVVhfS0VSTkVMX1VTRV9BUkNIX0RFRkFVTFRfQ09O
RklHPXkKPiA+ICBCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKPiA+ICBCUjJfTElOVVhf
S0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0iYWxsd2lubmVyL3N1bjUwaS1oNS1vcmFuZ2VwaS1wYzIi
Cj4KPiBUaGFua3MsIEkndmUgYXBwbGllZCB0aGUgc2VyaWVzIG9mIDQgcGF0Y2hlcyB0byBuZXh0
LiBCdXQgbm93IEkgcmVhbGl6ZQo+IHRoYXQgeW91ciBQQVRDSCAxLzQgd2FzIG1pc3NpbmcgeW91
ciBTaWduZWQtb2ZmLWJ5IGxpbmUuLi4gTm90IHN1cmUgd2h5Cj4gZ2l0IGFsbG93ZWQgbWUgdG8g
cHVzaCBzb21ldGhpbmcgbGlrZSB0aGlzIHdpdGggdGhlIGF1dGhvciBub3QgbWF0Y2hpbmcKPiB0
aGUgZmlyc3QgU2lnbmVkLW9mZi1ieSBsaW5lLgo+Cj4gQWxzbyBQQVRDSCAyLzQgd2FzIG1pc3Np
bmcgYSBqdXN0aWZpY2F0aW9uLCBzbyBJIGFkZGVkIG9uZSBpbiB0aGUKPiBjb21taXQgbG9nLCBi
YXNlZCBvbiB0aGUgcHJldmlvdXMgZGlzY3Vzc2lvbiB3ZSBoYWQuCgpUaGFua3MgYSBsb3QuIE1h
eWJlIGl0IHdhcyBhIG1pc3Rha2UgZnJvbSBteSBzaWRlLiBJIGp1c3QgY2hlY2tlZCB0aGUKbWVy
Z2VkIHBhdGNoIHNlcmllcyBhbmQgYnVpbHQgaXQgZnJvbSBzY3JhdGNoLiBIb3BlZnVsbHksIGl0
IHdvcmtzCm5vcm1hbGx5LgpCZXN0IHJlZ2FyZHMsCkphdmFkCj4KPiBCZXN0IHJlZ2FyZHMsCj4K
PiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3Rs
aW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+
IGh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
