Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CFAC433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 23:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 517F560A79;
	Sat,  5 Feb 2022 23:04:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id npo0k1kz_Su4; Sat,  5 Feb 2022 23:04:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72DCB6079D;
	Sat,  5 Feb 2022 23:04:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D18471BF863
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 23:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB88A4010E
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 23:04:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u95IsZjz9o2I for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 23:04:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0D24400C7
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 23:04:25 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id k13so19684990lfg.9
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 15:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=prap41lOLxcegcVScnOIWiT2b7f58hKUq06jtfcGu+Q=;
 b=ZYlE59cY8dCvOmdE8egUg4MHcpmQeOlJ0n1bWuaEHEzqMNP8toS3HHIYc0gLpj5LPR
 3bAyitJzN+x3+NKfh1E+BXsnjQwzUwDymceNP9bkuf4lGxNqr+4W23tl1qzdKcea3lff
 VTHyd3UTQmGeOEZYg2ueRJQWBseww2VU+iYiwjswZSZaMLAMAvC6JwAroYGfbwi1GonM
 KYivQ+X+oEC4mDl7KzOHbvsPW/DMHxw1/IFVcF1TGT29+wEbC+Koj96M/fFBGlmDzW6G
 /G9jOrMZKx7SDO1GeQdTgI/CCZwlSI1NdduX0CtPcQgeQkTU3VBdnQ36wZaMDKI4v1yW
 N82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=prap41lOLxcegcVScnOIWiT2b7f58hKUq06jtfcGu+Q=;
 b=oydGT/YId9oXffx2SPFNupdQe6jIJ2nJACZhBczECBzFVI821RdMC36NpUoRsvl4P/
 hNY0lf4oSP6j0sBOkY7z98eY6/YQiY3MmE305JLMfq8tGRj9/x5FNXFxPj3/7/cnaJOe
 KplDAQXIAXx1b0xXLjqa2/gc0rTX4E9+7qRvyl191mdCVpln0WPczj/Vrx+x4Iv9XqAC
 ApRSQkUl74YCO6kafCvdSiPXjFZIzLuui66bRzljMMUwCUxGq6CSGHGneT8qBDpQoVuw
 jERmysU+vzJlJD0kQVZd223rXMEl8Y29y7AnKXcsatD2MMjHmRS5NDUt+XHZiHvy2TEA
 spig==
X-Gm-Message-State: AOAM5318iLi8VJAKhquqFYtiB1KvYBdeKm1OOrueZ3T1OYTPZFTmcAI8
 zZEM1S8q0/1XGEuD1a3WtA98PvMhu9w=
X-Google-Smtp-Source: ABdhPJyROxl/oc4XK3hxg8NDQ6461JMAvViA38jh+0ru7aFQEE+O3ZCs5HAe7l16MIMfuqh+QAmhCg==
X-Received: by 2002:a05:6512:32c5:: with SMTP id
 f5mr3980666lfg.361.1644102263479; 
 Sat, 05 Feb 2022 15:04:23 -0800 (PST)
Received: from [192.168.10.7] ([178.155.5.31])
 by smtp.gmail.com with ESMTPSA id s4sm611700lfi.185.2022.02.05.15.04.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 15:04:23 -0800 (PST)
Message-ID: <4b114bca-d4ee-9ff9-931c-bd7501eb2e32@gmail.com>
Date: Sun, 6 Feb 2022 02:04:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: ru-RU
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20220205215558.30751-1-kuzminov.sergey81@gmail.com>
 <033373DF-6707-4295-8A12-D4ABE072608F@benettiengineering.com>
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
In-Reply-To: <033373DF-6707-4295-8A12-D4ABE072608F@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH v2] configs/orangepi_zero_defconfig: switch
 to extlinux
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgR2l1bGlvLAoKMDYuMDIuMjAyMiAwMToxOCwgR2l1bGlvIEJlbmV0dGk6Cj4gSGkgU2VyZ2V5
LAo+IAo+IGJlbG93IEkgZ2l2ZSB5b3UgYSBiZXR0ZXIgZXhhbXBsZSBvZiBjb21taXQgbG9nLAo+
IGFuZCB0aGUgZGVhbGluZyB3aXRoIFYxLT5WMiBzZXJpZXMuCj4gCj4+IElsIGdpb3JubyA1IGZl
YiAyMDIyLCBhbGxlIG9yZSAyMjo1NiwgU2VyZ2V5IEt1em1pbm92IDxrdXptaW5vdi5zZXJnZXk4
MUBnbWFpbC5jb20+IGhhIHNjcml0dG86Cj4+Cj4+IO+7v0NoYW5nZXM6Cj4+IHYxOgo+IAo+IFBs
ZWFzZSBSZW1vdmUgdGhpcyBsaW5lIF5eXgo+IAo+PiAtIEV4Y2x1ZGUgRkFUIHBhcnRpdGlvbiwg
aXQgaXMgbm8gbG9uZ2VyIG5lZWRlZCBmb3IgVS1Cb290Lgo+PiAtIFN3aXRjaCB0aGUgcm9vdGZz
IHBhcnRpdGlvbiBmcm9tIE1CUiB0byBHUFQgZm9yIHBhcnRpdGlvbi11dWlkIHRvIHdvcmsuCj4+
IC0gU3dpdGNoIHRvIGV4dGxpbnV4LCB0aGlzIGlzIGNvbnZlbmllbnQgZm9yIGRlYnVnZ2luZy4K
Pj4gLSBDcmVhdGUgY29tbW9uIHNjZW5hcmlvcyBmb3IgbXVsdGlwbGUgYm9hcmRzIHRvIGNyZWF0
ZSBhbiBTRCBpbWFnZTogYm9hcmQvb3JhbmdlcGkvY29tbW9uLgo+Pgo+PiB2MjoKPiBSZW1vdmUg
dGhpcyBeXl4gbGluZQo+PiAtIEZpeCB0eXBvIGluIGZpcnN0IGxpbmUgb2YgY2hhbmdlcyAocy9o
ZS9pdCkuCj4gVGhpcyB0b28gXl5eCj4+IC0gQWRkIEJSMl9UQVJHRVRfR0VORVJJQ19SRU1PVU5U
X1JPT1RGU19SVz15Lgo+IEhlcmUgd2UgbmVlZCBhbiBleHBsYW5hdGlvbiBvZiB0aGUgcmVhc29u
IHdoeSwgd2hhdCB0aGlzIGltcGxpZXMuCj4+IC0gRXhjbHVkZSBvbmUgYm9vdCBvcHRpb24gZnJv
bSBleHRsaW51eC5jb25mLgo+IFRoaXMgXl5eIHRvbwo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTZXJn
ZXkgS3V6bWlub3YgPGt1em1pbm92LnNlcmdleTgxQGdtYWlsLmNvbT4KPiDigJQtCj4gVjEtPlYy
Ogo+ICogaW1wcm92ZWQgY29tbWl0IGxvZwo+ICogcmVtb3ZlZCBjb21tZW50ZWQgbGluZSBpbiBl
eHRsaW51eC5jb25mCj4gKiByZW1vdmVkIG9uZSBib290IG9wdGlvbiBmcm9tIGV4dGxpbnV4LmNv
bmYKPj4gLS0tCj4gCj4gU28gYXMgeW91IGNhbiBzZWUsIGNvbW1pdCBsb2cgZG9lc27igJl0IG1l
bnRpb24gdGhlIHBhdGNoIHZlcnNpb24sIHdoaWxlIGFmdGVyIHRoZSAzIGRhc2hlcyB5b3UKPiBj
YW4gd3JpdGUgaW4gZ2VuZXJhbCB3aGF0ZXZlciB5b3Ugd2FudCBiZWNhdXNlIGl0IHdvbuKAmXQg
YmUgcGFydCBvZiBjb21taXQgbG9nIGFuZCBpdOKAmXMgdXN1YWxseSB1c2VkCj4gdG8gcmVwb3J0
IFYxLT5WMiB2ZXJzaW9uIGV0Yy4KCkNoYW5nZXM6CiogRXhjbHVkZSBGQVQgcGFydGl0aW9uLCBp
dCBpcyBubyBsb25nZXIgbmVlZGVkIGZvciBVLUJvb3QuCiogU3dpdGNoIHRoZSByb290ZnMgcGFy
dGl0aW9uIGZyb20gTUJSIHRvIEdQVCBmb3IgcGFydGl0aW9uLXV1aWQgdG8gd29yay4KKiBTd2l0
Y2ggdG8gZXh0bGludXgsIHRoaXMgaXMgY29udmVuaWVudCBmb3IgZGVidWdnaW5nLgoqIENyZWF0
ZSBjb21tb24gc2NlbmFyaW9zIGZvciBtdWx0aXBsZSBib2FyZHMgdG8gY3JlYXRlIGFuIFNEIGlt
YWdlOiAKYm9hcmQvb3JhbmdlcGkvY29tbW9uLgoqIEFkZCBCUjJfVEFSR0VUX0dFTkVSSUNfUkVN
T1VOVF9ST09URlNfUlc9eSwgcmVtb3VudCByb290IGZpbGVzeXN0ZW0gCnJlYWQtd3JpdGUgZHVy
aW5nIGJvb3QuCgotLS0KVjEtPlYyOgoqIGltcHJvdmVkIGNvbW1pdCBsb2cKKiByZW1vdmVkIGNv
bW1lbnRlZCBsaW5lIGluIGV4dGxpbnV4LmNvbmYKKiByZW1vdmVkIG9uZSBib290IG9wdGlvbiBm
cm9tIGV4dGxpbnV4LmNvbmYKClYyLT5WMzoKKiBpbXByb3ZlZCBjb21taXQgbG9nCgpUaGF0J3Mg
cmlnaHQ/CgoKPj4gKysrIGIvYm9hcmQvb3JhbmdlcGkvY29tbW9uL2dlbmltYWdlLmNmZwo+PiBA
QCAtMCwwICsxLDIzIEBACj4+ICtpbWFnZSBzZGNhcmQuaW1nIHsKPj4gKyAgICBwYXJ0aXRpb24g
dS1ib290IHsKPj4gKyAgICAgICAgaW4tcGFydGl0aW9uLXRhYmxlID0gZmFsc2UKPj4gKyAgICAg
ICAgaW1hZ2UgPSAidS1ib290LXN1bnhpLXdpdGgtc3BsLmJpbiIKPj4gKyAgICAgICAgb2Zmc2V0
ID0gOEsKPj4gKyAgICAgICAgc2l6ZSA9IDEwMDBLICMgMU1CIC0gOEtCKG9mZnNldCkgLSAxNktC
KEdQVCkKPj4gKyAgICB9Cj4+ICsKPj4gKyAgICBoZGltYWdlIHsKPj4gKyAgICAgICAgcGFydGl0
aW9uLXRhYmxlLXR5cGUgPSBncHQKPj4gKyAgICAgICAgZ3B0LWxvY2F0aW9uID0gMTAwOEsgIyAx
TUIgLSAxNktCKEdQVCkKPj4gKyAgICAgICAgZ3B0LW5vLWJhY2t1cCA9IHRydWUKPj4gKyAgICAg
ICAgIyBBZnRlciB3cml0aW5nIHRoZSBpbWFnZSB0byB0aGUgU0QgY2FyZCwKPj4gKyAgICAgICAg
IyBiYWNrdXAgR1BUIGRhdGEgc3RydWN0dXJlcyBhdCB0aGUgZW5kIG9mIHRoZSBkaXNrOgo+PiAr
ICAgICAgICAjIGdkaXNrIC9kZXYvbW1jYmxrMCB0aGVuIHByZXNzIHRoZSBidXR0b25zOiB4LCBl
LCB3LCB5Cj4gCj4gV2h5IGRvbuKAmXQgeW91IG1ha2UgdGhpcyBwYXJ0IF5eXiBhdXRvbWF0aWMg
d2l0aCBhIHNjcmlwdCBvciB5b3Ugc2ltcGx5IHVzZSBnZW5pbWFnZSBpdHNlbGY/Cj4gCj4gV2hh
dCBpdOKAmXMgZXhwZWN0ZWQgYXMgYm9hcmQgZGVmY29uZmlnIGlzIHNvbWV0aGluZyB0aGF0IHlv
dSBidXJuIGEgc2RjYXJkIHdpdGggdGhlIHNkY2FyZC5pbWcgZmlsZSBhbmQgdGhhdOKAmXMgaXQu
IFNvIGhlcmUgeW91IG5lZWQgdG8gbWFrZSBpdCBhdXRvbWF0aWMuCj4gCj4gU28gd2Ugd2FpdCBm
b3IgVjMgd2l0aCB0aGUgY29tbWl0IGxvZyBmb3JtIHlvdSByZWFkIGFib3ZlIGFuZCByZXF1ZXN0
ZWQgY2hhbmdlcy4KClRoZSBwcm9ibGVtIGlzIHRoYXQgaXQgaXMgbm90IHBvc3NpYmxlIHRvIGNy
ZWF0ZSBhbiBzZGNhcmQuaW1nIGltYWdlIAp3aXRoIHRoZSBjb3JyZWN0IEdQVCBzdHJ1Y3R1cmUu
IFRoZSBzZWNvbmQgY29weSBvZiB0aGUgR1BUIG11c3QgYmUgYXQgCnRoZSBlbmQgb2YgdGhlIGRp
c2ssIGFuZCB0aGUgc2l6ZSBvZiBzZGNhcmQuaW1nIHdpbGwgbm90IG1hdGNoIHRoZSBTRCAKY2Fy
ZC4gV2lsbCB3b3JrIGFuZCBzbywgd2l0aCBvbmUgY29weSBvZiBHUFQuIEJ1dCB0aGUgZGlzayB1
dGlsaXRpZXMgbWF5IAppc3N1ZSBhIHdhcm5pbmcgYWJvdXQgdGhlIGFic2VuY2Ugb2YgYSBzZWNv
bmQgY29weSBvZiB0aGUgR1BULiBZb3UgY2FuIApjb3JyZWN0IHRoZSBzaXR1YXRpb24gb25seSBh
ZnRlciB3cml0aW5nIHNkY2FyZC5pbWcgdG8gdGhlIFNEIGNhcmQsIG9yIApkdXJpbmcgdGhlIGZp
cnN0IGxvYWRpbmcgb2YgdGhlIGJvYXJkIGluIGEgc2VwYXJhdGUgc2NyaXB0LiBUaGlzIGlzIG91
dCAKb2Ygc2NvcGUgZm9yIHRoaXMgcGF0Y2guCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
