Return-Path: <SRS0=DPgg=NG=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C710C4338F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 16:08:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02E4E61185
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 16:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02E4E61185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B30A860609;
	Sun, 15 Aug 2021 16:08:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LRFqA0gycFyG; Sun, 15 Aug 2021 16:08:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3232D60619;
	Sun, 15 Aug 2021 16:08:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 23ED31BF3CA
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 16:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C6ED4031D
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 16:08:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ym_-QXTX8jIA for <buildroot@lists.busybox.net>;
 Sun, 15 Aug 2021 16:08:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 244AB40255
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 16:08:13 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id i28so2971997lfl.2
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 09:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=THkZkyCNiPXJt6pEGDO1Cj82ZT3N36osgbO5lG5U3v8=;
 b=N8WTrpc4idK9V3cfziYPjcanHJIgd3WJUEiiuovRaNnQ1vUEb7amLwKYI4P6hXVqTN
 TvhMY99IN81fBAgn9yo8g+fWOIPmJPdF1ND1ks39ctrZSjrxeovRM7FvrkKDf3P00Vp5
 2uJRQTsYlshf8fzqSdGG9dUKFfl5GaebMZFnxqBTeasBGvLct7VNuBFo50NdutqgtIdD
 Prb+cWdl+uqWtCACZ/Eh/2rp7/snLna8NyyvzLydeOCMYmbN9Ur5727BJd2FkKgyKFtk
 ttOPFgA2crFfXKkkd7uI8MmjXzcwGF0XZAvhZiocsd1KwY797C4qS+C8njmY3KjmeSDK
 OdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=THkZkyCNiPXJt6pEGDO1Cj82ZT3N36osgbO5lG5U3v8=;
 b=I4folQ2y99KHxe5PFf6FLVOyhaEH1vBUvH18zPvJ9Kx8cdYXFXV63nAREpfxORtFBw
 HdN7HpwNIXjABfvYGQoHRvOlVRSKbVdwJykY6YcnAEKGWmyX9kdhw0fVe1et4eYfDm1e
 X1ZSePTeuYgyijYqOGUsHWvdJbeu8i1gyledo0+Z+SlcUKgsWp1b3lrHegJbp8QQZXpD
 PF4WLE3tEzg0PP2iIeRQHhx44IhoKuhRsg9DDy81tFxgcrq8ZWSogPDj8ecHoH+1cgd+
 KyDGmetqgDnIqxxNapfQ7yA0w/5MXW+lKZjGv6mn1Ndq8g0qQHWMsoNziXoGUI+mxN0k
 1fnQ==
X-Gm-Message-State: AOAM530y9kEMuhBCafcw03SqOUuX4UI8CO6aNx1JDbXtl3TWJnxZSbZ4
 4/81Rt1QOzMUU2ota026PbMwDvYS9OEZc4L41W8vmt9pktWRqw==
X-Google-Smtp-Source: ABdhPJxyZtZTss30jgXmKMtpF6Cd1LL7p1oNtw8qRYO4pdgDSVFCb8cXzqauhzkw2eBz2PCfUpwiSHuNZBQ2fpTYawY=
X-Received: by 2002:a05:6512:314c:: with SMTP id
 s12mr8587084lfi.213.1629043690813; 
 Sun, 15 Aug 2021 09:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210813142626.2941588-1-fontaine.fabrice@gmail.com>
 <20210815175743.012d125f@windsurf>
In-Reply-To: <20210815175743.012d125f@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 15 Aug 2021 18:07:56 +0200
Message-ID: <CAPi7W80M_AFXgmMqK8DkLaNQV3O+BcLR+Wsv0rRarhpk47_dYQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gdb: fix build of gdb on riscv
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

TGUgZGltLiAxNSBhb8O7dCAyMDIxIMOgIDE3OjU3LCBUaG9tYXMgUGV0YXp6b25pCjx0aG9tYXMu
cGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4KPiBPbiBGcmksIDEzIEF1ZyAyMDIx
IDE2OjI2OjI2ICswMjAwCj4gRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gPiArIyByZWNlbnQgZ2RiIHZlcnNpb25zICg+PSAxMCkgaGF2ZSBn
ZGJzZXJ2ZXIgbW92ZWQgYXQgdGhlIHRvcC1sZXZlbCwKPiA+ICsjIHdoaWNoIHJlcXVpcmVzIGEg
ZGlmZmVyZW50IGJ1aWxkIGxvZ2ljLgo+ID4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfSE9TVF9HREIp
OiQoQlIyX3Jpc2N2KSw6eSkKPiA+ICtHREJfR0RCU0VSVkVSX1RPUExFVkVMID0geQo+ID4gK2Vu
ZGlmCj4gPiArCj4gPiAgR0RCX0xJQ0VOU0UgPSBHUEwtMi4wKywgTEdQTC0yLjArLCBHUEwtMy4w
KywgTEdQTC0zLjArCj4gPiAgR0RCX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HIENPUFlJTkcuTElC
IENPUFlJTkczIENPUFlJTkczLkxJQgo+ID4gIEdEQl9DUEVfSURfVkVORE9SID0gZ251Cj4KPgo+
IFdoaWxlIEkgdW5kZXJzdGFuZCB0aGUgaWRlYSwgSSdtIG5vdCBlbnRpcmVseSBzdXJlIGl0J3Mg
dGhlIG1vc3QKPiBsb2dpY2FsIHdheS4gV2hhdCBhYm91dCBpbnN0ZWFkIGNoYW5naW5nIHRoZSBj
dXJyZW50Ogo+Cj4gaWZlcSAoJChCUjJfR0RCX1ZFUlNJT05fMTApLHkpCj4gR0RCX0dEQlNFUlZF
Ul9UT1BMRVZFTCA9IHkKPiBlbmRpZgo+Cj4gYnk6Cj4KPiBpZmVxICgkKEdEQl9WRVJTSU9OXzEw
KSwxMC4xKQo+IEdEQl9HREJTRVJWRVJfVE9QTEVWRUwgPSB5Cj4gZW5kaWYKVGhpcyBvbmUgd29u
J3Qgd29yayBhcyBHREJfVkVSU0lPTl8xMCBpcyBub3QgZGVmaW5lZCBpZiBob3N0LWdkYiBpcwpu
b3Qgc2VsZWN0ZWQuCj4KPiBUaGlzIHdheSwgaXQgcmVhbGx5IGV4cHJlc3NlcyB3aGF0IHdlIHdh
bnQ6IGdkYiB2ZXJzaW9uIDEwLnggcmVxdWlyZSBhCj4gZGlmZmVyZW50IGJ1aWxkIGxvZ2ljLgo+
Cj4gQWx0ZXJuYXRpdmVseSwgd2UgY291bGQgZG8gYSBoaWRkZW4gQ29uZmlnLmluIGJvb2xlYW46
Cj4KPiBjb25maWcgQlIyX1BBQ0tBR0VfR0RCX1RPUExFVkVMCj4gICAgICAgICBib29sCj4gICAg
ICAgICBkZWZhdWx0IHkgaWYgQlIyX0dEQl9WRVJTSU9OXzEwCj4gICAgICAgICBkZWZhdWx0IHkg
aWYgIUJSMl9QQUNLQUdFX0hPU1RfR0RCICYmIEJSMl9yaXNjdgpJJ2xsIHRlc3QgdGhpcyBvbmUg
YnV0IEkgdGhpbmsgdGhhdCBpdCBzaG91bGQgd29yay4KPgo+IEJlc3QgcmVnYXJkcywKPgo+IFRo
b21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+
IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKPiBodHRwczovL2Jvb3RsaW4u
Y29tCkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJv
eC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
