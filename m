Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6644C4828F
	for <buildroot@archiver.kernel.org>; Fri,  9 Feb 2024 13:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E1B060011;
	Fri,  9 Feb 2024 13:48:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BRrq30RcoZoU; Fri,  9 Feb 2024 13:48:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69A3A60732
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69A3A60732;
	Fri,  9 Feb 2024 13:48:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7FDAF1BF98E
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 13:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79A0A41598
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 13:48:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RmPFfbKT5_bb for <buildroot@lists.busybox.net>;
 Fri,  9 Feb 2024 13:48:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB908414E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB908414E8
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB908414E8
 for <buildroot@buildroot.org>; Fri,  9 Feb 2024 13:48:12 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-dc742fc3b68so1113570276.2
 for <buildroot@buildroot.org>; Fri, 09 Feb 2024 05:48:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707486491; x=1708091291;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gprLqYMEOVSrDiNvhOqGtdzkXX2feP0MZ8wFbbc+Iyk=;
 b=mG6FQaU9IN1uJc3r/6I8+0n92mz1Lc7pl62lRKxFGIrNzweg/3Rmg6wB6cav3oVk2U
 VHjWl6KDTaNvhNQH1ydA1NW+CxiTtaej+YKs0GmEse+VjXiLLiWKjgGXx1i/FvkiAWHJ
 5JwzZnj+WD/6b47WfjqsjV6dllL/i4Hdeqzgl659aQc0ZW89XUlMPuiOhy8VOiiHWmkT
 rT39dA215OSfU7GQPR6a1pOWJr9r+8OXP8GcEbrHhaB/lOHQIssuAUCpm5FFb4UDrDLd
 +qXAfSnbdLmhZXCKzK5QjoletWx5dV8Gpu7YKsjbqUtNNZzYWHdDyu1i+YM6WavxBwEc
 jCYw==
X-Gm-Message-State: AOJu0YwqEwL67kFPZAPlY6tHR+HgJd0IKk+oWik3NiivLznwUEhyNk2W
 pYBmbvXJkJGX7jplQpQ7yDaj4r9mjio7t9kMtUfCHq0Dd6xUOBkbbMHVQutnaoDsRYSwOqfcSQU
 lbFn9jt1pdiACMYLYldZ99Q/Ass9uZwkwrgVLCQ==
X-Google-Smtp-Source: AGHT+IHyLpzVbC1quAk8y4bF2LR5qFSRfkkhERon1Ynx1+cdjOrMfpv0SMipuwdhs+CkXQn7Zn+OUbmwjQlJOun0dAM=
X-Received: by 2002:a25:bccf:0:b0:db5:9004:cf5b with SMTP id
 l15-20020a25bccf000000b00db59004cf5bmr1413318ybm.64.1707486491592; Fri, 09
 Feb 2024 05:48:11 -0800 (PST)
MIME-Version: 1.0
References: <20231123134052.239690-1-dario.binacchi@amarulasolutions.com>
 <63d87792-b361-4915-b3bb-4bbb192a880d@benettiengineering.com>
 <53ee955f-0870-456f-8c46-67fafb8bfff8@benettiengineering.com>
In-Reply-To: <53ee955f-0870-456f-8c46-67fafb8bfff8@benettiengineering.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 9 Feb 2024 14:48:01 +0100
Message-ID: <CABGWkvo8AkM3NFcY=vRarAPWKdS=W7Cp2kzwMrPgNHv6w2riUg@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1707486491; x=1708091291;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gprLqYMEOVSrDiNvhOqGtdzkXX2feP0MZ8wFbbc+Iyk=;
 b=BfHDpUGObdjHzUWcEYKVSws7LLeL3AmiT/2EZUQMxcTwXIJbrF++8EylRj0YjcjNeN
 eUnx4Zp36VIS9Ur/fYRqMC/JA16nuuJ7Pz/u1wwMBlPgwnIKZEAKfdpQpWigR1KCFwvt
 R+V4lMQ6Lh5EsQSCWXxauqdUE5nTAvhFDgQ7U=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=BfHDpUGO
Subject: Re: [Buildroot] [PATCH 1/2] configs/ti_am62x_sk_defconfig:
 explicitly set the kernel version
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgR2l1bGlvIGFuZCBSb21haW4sIEFsbAoKT24gTW9uLCBGZWIgNSwgMjAyNCBhdCA0OjM04oCv
UE0gR2l1bGlvIEJlbmV0dGkKPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+
IHdyb3RlOgo+Cj4gRGFyaW8sCj4KPiBJJ3ZlIGFsc28gdHJpZWQgdG8gYnVpbGQgdGhpcyBkZWZj
b25maWcgYW5kIGl0IGZhaWxzIHdoaWxlIGJ1aWxkaW5nCj4gdGktazMtcjUtbG9hZGVyCj4gd2l0
aDoKPiBgYGAKPiAgICBDT1BZICAgIHNwbC91LWJvb3Qtc3BsLmJpbgo+IC4vdG9vbHMvazNfZ2Vu
X3g1MDlfY2VydC5zaCAtYyAxNiAtYiBzcGwvdS1ib290LXNwbC5iaW4gXAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIC1vIHRpYm9vdDMuYmluIC1sIDB4NDNjMDAwMDAgLXIgMSAtayAiIgo+ICAg
U1dSViA9IDEKPiBDb3VsZCBub3Qgb3BlbiBmaWxlIG9yIHVyaSBmb3IgbG9hZGluZyBwcml2YXRl
IGtleSBmcm9tIGVja2V5LnBlbTogTm8KPiBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4gY2F0OiBj
ZXJ0aWZpY2F0ZS5iaW46IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKPiBybTogY2Fubm90IHJl
bW92ZSAnY2VydGlmaWNhdGUuYmluJzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+IHJtOiBj
YW5ub3QgcmVtb3ZlICdlY2tleS5wZW0nOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4gbWFr
ZVszXTogKioqIFthcmNoL2FybS9tYWNoLWszLy9jb25maWcubWs6NTU6IHRpYm9vdDMuYmluXSBF
cnJvciAxCj4gbWFrZVszXTogKioqIERlbGV0aW5nIGZpbGUgJ3RpYm9vdDMuYmluJwo+IGBgYAo+
Cj4gQ2FuIHlvdSBwbGVhc2UgdGFrZSBhIGxvb2sgaW50byBpdD8KClRoZSBjb21waWxhdGlvbiB3
aXRoIGBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TRUNUWVBFX0dQYCBlbmFibGVkIGlzIGZp
bmUsCndoaWxlIHRoZSBjb21waWxhdGlvbiB3aXRoIGBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dF
Tl9TRUNUWVBFX0hTX0ZTYAplbmFibGVkIGlzIGJyb2tlbi4KSGF2ZSB5b3UgZW5hYmxlZCB0aGUg
YEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NFQ1RZUEVfSFNfRlNgIG9yCmBCUjJfVEFSR0VU
X1RJX0szX0lNQUdFX0dFTl9TRUNUWVBFX0hTYCBvcHRpb24/CgpUaGFua3MgYW5kIHJlZ2FyZHMs
CkRhcmlvCgo+Cj4gVGhhbmsgeW91Cj4gQmVzdCByZWdhcmRzCj4gLS0KPiBHaXVsaW8gQmVuZXR0
aQo+IENFTyZDVE9AQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKPgo+IE9uIDA1LzAyLzI0IDE2OjEz
LCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPiA+IEhpIERhcmlvLAo+ID4KPiA+IE9uIDIzLzExLzIz
IDE0OjQwLCBEYXJpbyBCaW5hY2NoaSB3cm90ZToKPiA+PiBDb21taXQgNGI4ZmRkYjA2MGZiICgi
Y29uZmlncy90aV9hbTYyeF9zazogbmV3IGRlZmNvbmZpZykgZm9yZ290IHRvCj4gPj4gc3BlY2lm
eSB0aGUgTGludXgga2VybmVsIHZlcnNpb24sIHNvIGRvIHRoYXQgbm93Lgo+ID4+Cj4gPj4gV2hl
biB0aGUgZGVmY29uZmlnIHdhcyBhZGRlZCwgdGhlIGRlZmF1bHQgdmVyc2lvbiB3YXMgNi40Lngs
IHNvIHVzZQo+ID4+IHZlcnNpb24gNi40LjE2Lgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogRGFy
aW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiA+IC0tLQo+
ID4+ICAgY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcgfCAzICsrKwo+ID4+ICAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3Mv
dGlfYW02Mnhfc2tfZGVmY29uZmlnCj4gPj4gYi9jb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZp
Zwo+ID4+IGluZGV4IGI5OGE2OGZmMTUzZi4uNjYxMGU2ZmNmODkwIDEwMDY0NAo+ID4+IC0tLSBh
L2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnCj4gPj4gKysrIGIvY29uZmlncy90aV9hbTYy
eF9za19kZWZjb25maWcKPiA+PiBAQCAtMSw3ICsxLDEwIEBACj4gPj4gICBCUjJfYWFyY2g2ND15
Cj4gPj4gK0JSMl9LRVJORUxfSEVBREVSU182XzQ9eQo+ID4KPiA+IGhlcmUgXl5eIHlvdSBuZWVk
IHRvIHNwZWNpZnkgQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzQKPiA+
IGFuZCBub3QgdGhlIGxpbmUgYWJvdmUsCj4gPgo+ID4+ICAgQlIyX1JPT1RGU19QT1NUX0lNQUdF
X1NDUklQVD0ic3VwcG9ydC9zY3JpcHRzL2dlbmltYWdlLnNoIgo+ID4+ICAgQlIyX1JPT1RGU19Q
T1NUX1NDUklQVF9BUkdTPSItYyBib2FyZC90aS9hbTYyeC1zay9nZW5pbWFnZS5jZmciCj4gPj4g
ICBCUjJfTElOVVhfS0VSTkVMPXkKPiA+PiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lP
Tj15Cj4gPj4gK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuNC4xNiIK
PiA+PiAgIEJSMl9MSU5VWF9LRVJORUxfVVNFX0FSQ0hfREVGQVVMVF9DT05GSUc9eQo+ID4+ICAg
QlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15Cj4gPj4gICBCUjJfTElOVVhfS0VSTkVMX0lO
VFJFRV9EVFNfTkFNRT0idGkvazMtYW02MjUtc2siCj4gPgo+ID4gQ2FuIHlvdSBwbGVhc2UgY29y
cmVjdCBhbmQgc2VuZCBWMj8KPiA+Cj4gPiBUaGFuayB5b3UhCj4gPgo+ID4gQmVzdCByZWdhcmRz
Cj4KCgotLSAKCkRhcmlvIEJpbmFjY2hpCgpTZW5pb3IgRW1iZWRkZWQgTGludXggRGV2ZWxvcGVy
CgpkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwoKCkFtYXJ1bGEgU29sdXRpb25zIFNSTAoKVmlhIExlIENhbmV2YXJl
IDMwLCAzMTEwMCBUcmV2aXNvLCBWZW5ldG8sIElUCgpULiArMzkgMDQyIDI0MyA1MzEwCmluZm9A
YW1hcnVsYXNvbHV0aW9ucy5jb20KCnd3dy5hbWFydWxhc29sdXRpb25zLmNvbQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
