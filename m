Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94258C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:57:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55721610A0
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 55721610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1911340001;
	Thu, 19 Aug 2021 20:57:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3SIbwdKjoR6x; Thu, 19 Aug 2021 20:57:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 409064011D;
	Thu, 19 Aug 2021 20:57:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 822F91BF297
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EFC2424F7
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:57:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bhdXkJhbx5w1 for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 20:57:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8B9042513
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 20:57:21 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id y7so13687285ljp.3
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 13:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VK+tGAQP2Gk0m/g1OZP9Y79unKhYVoY3Yalr38qcK80=;
 b=lNgzPXGOlO09Tr5/+RAXQarcba/kQe6M7Q2xBWhdNxDwcTil7YMtahbPdT5gBo7D9l
 x1qBTr9dT0TOvj0REOp1eEYhpvF2FIDO/WdWQR/Lme9B+HRGe4zJUkz2WJkpCN7xdmM8
 nUTytLkihVkm+jsqP502sofcVKUgmBOl9/hdhZvDoekjSiFYlQ3I7kOJCNnPqDaZv/up
 BEE6bsmPRXKj24hvxYi5x8DMFeRB2gmqcB2gmxY1CV8LcY2g65D0HriD5ahsEGQkXsHA
 HZMgimDuTZf8zHKSSNatNpIsd5ThMWrl5Xg8pSlj8eiK7dI5KJ2WUdlZ9DYEvpLibRP7
 yyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VK+tGAQP2Gk0m/g1OZP9Y79unKhYVoY3Yalr38qcK80=;
 b=draTMXh39YXEcwu+dQozhDWIeNmW0CCr+oKVgY6Lhs1QvrDMMyImvknzxT7efRf9VK
 CwQ4HtxVk/pMxLehc3ju616ZTmdxyUv+egk1d+HSPB97uGz51wbMfjSsa81ENu9a2sAq
 ez3gf1i56/yMUU/QshlZHslnvrMsnFVEK/HHhWAkKpzVuxIs+U1YiH6ydcn+nh7DGwGX
 B5/a9HihglcZ1GGDkUVPs+0B+PqNAzTF44lHlsXVc4iil82Y+AyaZU8pRqT/O+hR8pu6
 4dyAq7hoAeK/jLFeH+A5X9xZcvsz3EuXQLN3FUv3miyBoBdsV3rlCoc9QK8cjDTTGvtm
 fogQ==
X-Gm-Message-State: AOAM5326w8fJl2axVQ/Z5MoMukaGltZMZsT9ic7jG9YY+qD1AdTj2G2x
 ag4gOjOKxfRBmINstq+ZSu6KHw+Ao10T/Gk677g=
X-Google-Smtp-Source: ABdhPJyl1NPHi/Ke2Q6AX3VEAMOmM9OOiVmIYlKrKjLqwBCKvDoGZloCYXPOJ+wm0BomMcHrHS6PkWwDuV7puvxcGrg=
X-Received: by 2002:a2e:2f0d:: with SMTP id v13mr14011020ljv.159.1629406639531; 
 Thu, 19 Aug 2021 13:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210817221530.2343233-1-fontaine.fabrice@gmail.com>
 <20210819225118.361fe904@windsurf>
In-Reply-To: <20210819225118.361fe904@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 19 Aug 2021 22:57:08 +0200
Message-ID: <CAPi7W83S32fCdbuv-rGxz2QoTjWLFnA=AhL0AnG3AwaNSHMVxA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] Revert "package/libshout: enable
 optional dependency for libressl"
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

TGUgamV1LiAxOSBhb8O7dCAyMDIxIMOgIDIyOjUxLCBUaG9tYXMgUGV0YXp6b25pCjx0aG9tYXMu
cGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4KPiBPbiBXZWQsIDE4IEF1ZyAyMDIx
IDAwOjE1OjMwICswMjAwCj4gRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gPiBUaGlzIHJldmVydHMgY29tbWl0IDQ2YjhmYjc1MDBlY2NhNjVh
Nzk1MDczMThmZDMwNTIyMDg1NTljMDkgaW5kZWVkIGlmCj4gPiBsaWJyZXNzbCBpcyBzZWxlY3Rl
ZCBhcyB0aGUgb3BlbnNzbCBwcm92aWRlciwgdGhlIEJSMl9QQUNLQUdFX09QRU5TU0wKPiA+IGNv
bmRpdGl0aW9uIHdpbGwgYWx3YXlzIGJlIHVzZWQgYW5kIHRoZSBCUjJfUEFDS0FHRV9MSUJSRVNT
TCBjb25kaXRpb24KPiA+IHdpbGwgbmV2ZXIgYmUgdHJpZ2dlcmVkLiBNb3Jlb3ZlciwgbGlicmVz
c2wgcHJvdmlkZXMgYSBwa2ctY29uZmlnIGZpbGUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRmFi
cmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBw
YWNrYWdlL2xpYnNob3V0L2xpYnNob3V0Lm1rIHwgMyAtLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MyBkZWxldGlvbnMoLSkKPgo+IEkndmUgYXBwbGllZCB0byBtYXN0ZXIsIGJlY2F1c2UgeW91J3Jl
IHJpZ2h0LCB3aGF0Cj4gNDZiOGZiNzUwMGVjY2E2NWE3OTUwNzMxOGZkMzA1MjIwODU1OWMwOSBo
YXMgYWRkZWQgaXMgYSBuby1vcCwgYmVjYXVzZQo+IEJSMl9QQUNLQUdFX0xJQlJFU1NMIGNhbm5v
dCBiZSAneScgd2l0aG91dCBCUjJfUEFDS0FHRV9PUEVOU1NMIGFsc28KPiBiZWluZyAneScuCj4K
PiBIb3dldmVyLCBjb3VsZCB5b3UgbG9vayBhdCB0aGUgYXV0b2J1aWxkZXIgaXNzdWUgdGhhdAo+
IDQ2YjhmYjc1MDBlY2NhNjVhNzk1MDczMThmZDMwNTIyMDg1NTljMDkgd2FzIGludGVuZGVkIHRv
IGZpeCwgYW5kIHNlZQo+IHdoYXQgaXMgdGhlIHByb3BlciBmaXggZm9yIGl0ID8KVGhlIGF1dG9i
dWlsZGVyIGxpbmsgZ2l2ZW4gaW4gdGhlIGNvbW1pdCBtZXNzYWdlIHJldHVybnMgNDA0Lgo+Cj4g
QmVzdCByZWdhcmRzLAo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJv
b3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4gaHR0cHM6Ly9i
b290bGluLmNvbQpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
