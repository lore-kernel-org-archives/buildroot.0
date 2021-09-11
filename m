Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31551C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:26:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E295F61213
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E295F61213
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B454D406B3;
	Sat, 11 Sep 2021 16:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FHgzVRYkbA6W; Sat, 11 Sep 2021 16:26:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEEA740489;
	Sat, 11 Sep 2021 16:26:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EEB7A1BF304
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD55A82C4D
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:25:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dli3dPELXYHQ for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 16:25:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96D0B82786
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 16:25:22 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id k4so10937886lfj.7
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 09:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QPRQcSN+c/0Zp8CgXEFTNENa1E0tDKhwHZ/5l7ObNx8=;
 b=ddnElQPyd/G2BEzR1LWtToxI920dWkinLytVQNw1JwwuxTTKuJjqBz1YnbWSHuc4j/
 F7Zg8MrCxPXcNF4+GPFLZ4dP7B+U4GkEjfVlMpm3cmA4qm4DlZda3oW2ZY4LRfKdH8Fp
 GRp8ENBqdO/YNTtmR6URxqVHVhIah9cJaU1sUsq4Kv7nxOATbD3jxlMt4dmfkz/p0v4C
 SbSEFy0Xxwu11nLxR1ZCB5XTx6J//ER+YrfxWy++RJiA9ktMDHRZPBBY0wiT5AN0h5MH
 MdTZQq3Df8k4B1zzKZ6ab+XXxoxcAi5HI5r1Sn5cq1FjmNS13c3LUfGSfkUX3Y98neiN
 GBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QPRQcSN+c/0Zp8CgXEFTNENa1E0tDKhwHZ/5l7ObNx8=;
 b=zfJj7q/4hEmhgWrs/UZawuBtnvpM/5RRfFdQokYLTU3L8lthAPmCWQuLI0eOeNhvsK
 Oueg7NH0IIulVtr15hGSegdReD+MaPa+MF0bPTESLLSxyP1RF0lwpdr8XP0CodQkAZed
 o4eVp+fVmTtUGXB5L1lltaI2DqREXNWv5VvAMpy3S7uD3YhYrkYjf65YUNY7nPj/ltEc
 enWxpVAlVjVYgX3VWrCndx+n3qd7Cda7yzY/a7cqYtKc6YlYrYJVMFD2UAPZJhYJs/Ja
 1jML67hnrVkOyuSAt0KQ0hFsRX9wkp1Z6GBYfMidnLnjMHez9uekjm2mC3Hp+npGUfAf
 stkw==
X-Gm-Message-State: AOAM531T1Cr1dkiTsf1KyG/55qblJY99T0tpreyLFB5OMZntSqlcWJfL
 OF4orA21eiJGzmBc9f3gPzyCGOt29yT2mF1X7DvSSYRNfTg=
X-Google-Smtp-Source: ABdhPJzdWya6onlqIKkG0MNjfjgFJTlRvqQfnTmfMhc/w5fkH5ot7j4kH5mnjSUgv6YOSRBX39wLIVG9Vuozmph0NEE=
X-Received: by 2002:ac2:483a:: with SMTP id 26mr2531112lft.684.1631377520710; 
 Sat, 11 Sep 2021 09:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210908164536.474998-1-fontaine.fabrice@gmail.com>
 <20210911125500.GN1053080@scaer>
 <CAPi7W82x1VFV2Lb+=m=7fhzV7MDc0743TjkDN9n0nXNYefPUsg@mail.gmail.com>
 <20210911161614.GR1053080@scaer>
In-Reply-To: <20210911161614.GR1053080@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 11 Sep 2021 18:25:09 +0200
Message-ID: <CAPi7W81wz0Tr1wtV0BLTEg3FfT+6bs0A2p=7MYKJ+WSp4CUtKg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/uboot-tools: fix MKIMAGE_ARCH handling
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

TGUgc2FtLiAxMSBzZXB0LiAyMDIxIMOgIDE4OjE2LCBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmlu
LjE5OThAZnJlZS5mcj4gYSDDqWNyaXQgOgo+Cj4gRmFicmljZSwgQWxsLAo+Cj4gT24gMjAyMS0w
OS0xMSAxODowNyArMDIwMCwgRmFicmljZSBGb250YWluZSBzcGFrZSB0aHVzbHk6Cj4gPiBMZSBz
YW0uIDExIHNlcHQuIDIwMjEgw6AgMTQ6NTUsIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5
OEBmcmVlLmZyPiBhIMOpY3JpdCA6Cj4gPiA+IE9uIDIwMjEtMDktMDggMTg6NDUgKzAyMDAsIEZh
YnJpY2UgRm9udGFpbmUgc3Bha2UgdGh1c2x5Ogo+ID4gPiA+IEZpeCBNS0lNQUdFX0FSQ0ggaGFu
ZGxpbmcgdG8gYXZvaWQgdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlOgo+IFstLVNOSVAtLV0K
PiA+ID4gPiAtaWZlcSAoJChLRVJORUxfQVJDSCkseDg2XzY0KQo+ID4gPiA+IC1NS0lNQUdFX0FS
Q0ggPSB4ODYKPiA+ID4gPiAtZWxzZSBpZmVxICgkKEtFUk5FTF9BUkNIKSxpMzg2KQo+ID4gPiA+
ICsjIEZvciBpMzg2LCB3ZSBuZWVkIHRvIGNvbnZlcnQKPiA+ID4gPiArIyBGb3Igb3BlbnJpc2Ms
IHdlIG5lZWQgdG8gY29udmVydAo+ID4gPiA+ICsjIEZvciBvdGhlcnMsIHdlJ2xsIGp1c3Qga2Vl
cCBLRVJORUxfQVJDSAo+ID4gPiA+ICtpZmVxICgkKEtFUk5FTF9BUkNIKSxpMzg2KQo+ID4gPiA+
ICBNS0lNQUdFX0FSQ0ggPSB4ODYKPiA+ID4KPiA+ID4gQnV0IHRoZW4sIHg4Nl82NCBzaG91bGQg
c3RpbGwgYmUgY2hhbmdlZCB0byB4ODYsIG5vPwo+ID4gTm9wZSwgeDg2XzY0IGlzIHJlY29nbml6
ZWQgYXMgYSB2YWxpZCBhcmNoaXRlY3R1cmUsIGhlcmUgaXMgYW4gZXh0cmFjdAo+ID4gb2YgdGhl
IGNvbW1pdCBtZXNzYWdlOgo+ID4KPiA+ICAgICAgICAgeDg2ICAgICAgICAgICAgICBJbnRlbCB4
ODYKPiA+ICAgICAgICAgeDg2XzY0ICAgICAgICAgICBBTUQgeDg2XzY0Cj4gPiAgICAgICAgIHh0
ZW5zYSAgICAgICAgICAgWHRlbnNhCj4KPiBBaCwgcmlnaHQsIEkgb3Zlcmxvb2tlZCB0aGF0IGlu
IHRoZSBsaXN0Lgo+Cj4gV2hhdCBnb3QgbWUgY29uZnVzZWQgd2FzIHRoYXQgeW91IHNwZWNpYWxs
eSBtZW50aW9uIG9yMWssIGJ1dCBub3QKPiB4ODZfNjQsIHdoaWNoIHdhcyBhbHNvIHdyb25nLCBi
dXQgd2UgZG8gbm90IHNlZW0gdG8gaGF2ZSBhbnkgYnVpbGQKPiBmYWlsdXJlIGFzc29jaWF0ZWQg
d2l0aCB0aGF0LCBkbyB3ZT8KVHJ1ZSwgdGhlcmUgYXJlIG5vIGJ1aWxkIGZhaWx1cmVzIG9uIHg4
Nl82NC4KCkknbSB3b25kZXJpbmcgaWYgdGhvc2UgYnVpbGQgZmFpbHVyZXMgYXJlIHJhaXNlZCBi
ZWNhdXNlIG9mIHRvb2xjaGFpbiBhbGlhc2VzLgpJbmRlZWQsIGl0IHNlZW1zIHRoYXQgb3BlbnJp
c2MgY2FuIGJlIGRlZmluZWQgYXMgYSBhbGlhcyB0byBvcjFrOgpodHRwczovL2dpdGh1Yi5jb20v
dS1ib290L3UtYm9vdC9ibG9iL2JiY2FjZGY0Y2QyM2YyZTVkZWI5ZWY5MTYwOTZjOTU2Yzk1NTI0
M2QvdG9vbHMvYnVpbGRtYW4vUkVBRE1FI0wxOTYKaHR0cHM6Ly9naXRodWIuY29tL3UtYm9vdC91
LWJvb3QvYmxvYi9hOTRhYjU2MWUyZjQ5YTgwZDg1Nzk5MzBlODQwYjgxMGFiMWExMzMwL3Rvb2xz
L2J1aWxkbWFuL2JzZXR0aW5ncy5weSNMODgKCkJ1dCBJIGRpZG4ndCBmaW5kIHRoZSByb290IGNh
dXNlIG9mIHRoZXNlIGJ1aWxkIGZhaWx1cmVzLCBwZXJoYXBzIHRoZQp0b29sY2hhaW4tYWxpYXMg
aXMgb3ZlcndyaXR0ZW4/ClNvIEkgZ2F2ZSB1cCBhbmQgdGhvdWdodCB0aGF0IHRoaXMgcGF0Y2gg
d2FzIGFuIGFjY2VwdGFibGUgbG9uZy10ZXJtIHNvbHV0aW9uLgo+Cj4gUmVnYXJkcywKPiBZYW5u
IEUuIE1PUklOLgo+Cj4gLS0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
LS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4g
TU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBj
b25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBc
IC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQy
NyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBp
cyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhU
TUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0t
LScKQmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBsaXN0cy5i
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
