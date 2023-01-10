Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CC2C54EBC
	for <buildroot@archiver.kernel.org>; Tue, 10 Jan 2023 12:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1C3E60FA1;
	Tue, 10 Jan 2023 12:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1C3E60FA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07XWq9C1AWig; Tue, 10 Jan 2023 12:37:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3A9460F93;
	Tue, 10 Jan 2023 12:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3A9460F93
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 56CA21BF307
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 12:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E3EF40A00
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 12:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E3EF40A00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rn0bc1o9ln1H for <buildroot@lists.busybox.net>;
 Tue, 10 Jan 2023 12:37:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B75AA400F6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B75AA400F6
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 12:37:41 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id vm8so28213256ejc.2
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 04:37:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HOVsBd3J/adeWTaQGCL6gRJzk0ZAWjBMP8Qs58hcES4=;
 b=wIIu5W0KEf5yFOjcb3GYHnYwawjXu0a+PrbQJZkYf9o5Xsb8MzPLMjMBBnoZefwW+D
 E7+xl4EbCB7aT6S9531i//EpO2iTRsixyTjOCgZ7pDRzaatD5k2MNrL1F49w5dYeeCam
 fQm4CmjstZEyMq10TUjMPyshIvYcoVc+0ZjW48Lo7gIXd6QHyCYCod05r7gHNhHuhEKi
 PiRxzrw8kPzHD97UFlMh8Mmd5/S9+hz9pX9nMeijH4uINx+kL1NwLFW1fcc/t2OrpoLw
 b75QGKq9fds6nSx41cM/F8EPg7Um8K/DlqKxDVfDkhFuiWNxOxkzmF2QUpU/HshEB9vW
 Ygfw==
X-Gm-Message-State: AFqh2kppq8eTcJJwOBVu39NHN1aOkYZmzXCrSmFkO/lxycfjiRDOie0+
 1YgJ8lfsStKI2qFRFpNyLDUUEGW7GwVeppHwA+x4wW6b6oMYdIMV
X-Google-Smtp-Source: AMrXdXvPuLA+rQC60iGnbo5XZn7j0FZit5YZB9LysCy1sQmrvDXRwbi6ys4rM6zy5J9c/7uwoU6P7jJfwaTGR9bnkyA=
X-Received: by 2002:a17:906:140e:b0:7c0:e0db:f136 with SMTP id
 p14-20020a170906140e00b007c0e0dbf136mr5331290ejc.333.1673354259818; Tue, 10
 Jan 2023 04:37:39 -0800 (PST)
MIME-Version: 1.0
References: <20221128175851.1913859-1-james.hilliard1@gmail.com>
 <20221128175851.1913859-6-james.hilliard1@gmail.com>
In-Reply-To: <20221128175851.1913859-6-james.hilliard1@gmail.com>
From: Gilles Talis <gilles.talis@gmail.com>
Date: Tue, 10 Jan 2023 13:37:27 +0100
Message-ID: <CAKcgs2z3CR9q3fBar3EcAfup9QNQwt_0G2UFw2fK=e3_bLmspg@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HOVsBd3J/adeWTaQGCL6gRJzk0ZAWjBMP8Qs58hcES4=;
 b=cPAKC7bEflGfg4RtoIrTWq+V//8YXNxc7I3/zmQJegG6rsTOCpi1AOfMVqbI0nxJ2n
 9lu4rzLig2jIPIScgITBNFefgcXB6HzA0YhOQM87VAGBr1blonFkOvshCMc235e0TRL9
 UfjrZuFxQnUUEQwp55oWYbuY9QVYoKuK6i0tL0HgyCfIixfGBkJVhWTRhYu0YXpKDy+m
 q4gDhp4/cAFibu1hu1vMXxuvgBlPOqvxyrNlNikL+i53RZvq/M7DikoRRtci4idF8cU3
 1H/5SiMV0xoUFgRmOXxkYFJ1wth2MzNqzWmXj0NknfkNF7rMI7KmG6ZArtaSvzHqgHHC
 WxzA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cPAKC7bE
Subject: Re: [Buildroot] [PATCH v2 6/8] package/fft2d: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsIEhpIFN0ZWZhbiwKCkxlIGx1bi4gMjggbm92LiAyMDIyIMOgIDE5OjAwLCBKYW1l
cyBIaWxsaWFyZAo8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4gYSDDqWNyaXQgOgo+Cj4gRnJv
bTogU3RlZmFuIEhhZ2VyIDxzdGVmYW4uaGFnZXJAZ2luemluZ2VyLmNvbT4KPgo+IFRoaXMgcGFj
a2FnZSBpcyByZXF1aXJlZCBieSB0ZW5zb3JmbG93LWxpdGUuCj4KPiBUaGlzIHBhY2thZ2UgZG9l
c24ndCBwcm92aWRlIGEgY29udmVudGlvbmFsIGluc3RhbGwgbWVjaGFuaXNtIHNvCj4gd2UgbmVl
ZCB0byBpbnN0YWxsIGl0IG1hbnVhbGx5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhhZ2Vy
IDxzdGVmYW4uaGFnZXJAZ2luemluZ2VyLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxs
aWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiAtLS0KPiAgcGFja2FnZS9Db25maWcu
aW4gICAgICAgIHwgIDEgKwpJZiB5b3Ugd2FudCB0byBiZSBtYWludGFpbmVycyBmb3IgdGhpcyBw
YWNrYWdlLCBkbyBub3QgZm9yZ2V0IHRvCnVwZGF0ZSB0aGUgREVWRUxPUEVSUyBmaWxlLgoKPiAg
cGFja2FnZS9mZnQyZC9Db25maWcuaW4gIHwgIDcgKysrKysrKwo+ICBwYWNrYWdlL2ZmdDJkL2Zm
dDJkLmhhc2ggfCAgNCArKysrCj4gIHBhY2thZ2UvZmZ0MmQvZmZ0MmQubWsgICB8IDIyICsrKysr
KysrKysrKysrKysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2ZmdDJkL0NvbmZpZy5pbgo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS9mZnQyZC9mZnQyZC5oYXNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL2ZmdDJkL2ZmdDJkLm1rCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4g
Yi9wYWNrYWdlL0NvbmZpZy5pbgo+IGluZGV4IDJlYzYyM2VkOGYuLmZlNjM2ZmRlOWQgMTAwNjQ0
Cj4gLS0tIGEvcGFja2FnZS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL0NvbmZpZy5pbgo+IEBA
IC0xOTg4LDYgKzE5ODgsNyBAQCBtZW51ICJPdGhlciIKPiAgICAgICAgIHNvdXJjZSAicGFja2Fn
ZS9lbGZ1dGlscy9Db25maWcuaW4iCj4gICAgICAgICBzb3VyY2UgInBhY2thZ2UvZWxsL0NvbmZp
Zy5pbiIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9mYWxjb3NlY3VyaXR5LWxpYnMvQ29uZmln
LmluIgo+ICsgICAgICAgc291cmNlICJwYWNrYWdlL2ZmdDJkL0NvbmZpZy5pbiIKPiAgICAgICAg
IHNvdXJjZSAicGFja2FnZS9mZnR3L0NvbmZpZy5pbiIKPiAgICAgICAgIHNvdXJjZSAicGFja2Fn
ZS9mbGFubi9Db25maWcuaW4iCj4gICAgICAgICBzb3VyY2UgInBhY2thZ2UvZmxhdGJ1ZmZlcnMv
Q29uZmlnLmluIgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2ZmdDJkL0NvbmZpZy5pbiBiL3BhY2th
Z2UvZmZ0MmQvQ29uZmlnLmluCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAw
MDAwLi4zODM5NGY2MTcwCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvZmZ0MmQvQ29u
ZmlnLmluCj4gQEAgLTAsMCArMSw3IEBACj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9GRlQyRAo+ICsg
ICAgICAgYm9vbCAiZmZ0MmQiCj4gKyAgICAgICBoZWxwCj4gKyAgICAgICAgIFRoaXMgaXMgYSBw
YWNrYWdlIHRvIGNhbGN1bGF0ZSBEaXNjcmV0ZSBGb3VyaWVyL0Nvc2luZS9TaW5lCj4gKyAgICAg
ICAgIFRyYW5zZm9ybXMgb2YgMiwzLWRpbWVuc2lvbmFsIHNlcXVlbmNlcyBvZiBsZW5ndGggMl5O
Lgo+ICsKPiArICAgICAgICAgaHR0cDovL3d3dy5rdXJpbXMua3lvdG8tdS5hYy5qcC9+b291cmEv
ZmZ0Lmh0bWwKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9mZnQyZC9mZnQyZC5oYXNoIGIvcGFja2Fn
ZS9mZnQyZC9mZnQyZC5oYXNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAw
MDAwLi5hMWIxYTMyNmFlCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvZmZ0MmQvZmZ0
MmQuaGFzaAo+IEBAIC0wLDAgKzEsNCBAQAo+ICsjIExvY2FsbHkgY2FsY3VsYXRlZAo+ICtzaGEy
NTYgIGFkYTdlOTkwODdjNGVkNDc3YmZkZjExNDEzZjJiYThkYjhhODQwYmE5YmJmOGFjOTRmNGYz
OTcyZTJhN2NlYzkgIGZmdDJkLnRnego+ICsjIExpY2Vuc2UgZmlsZXMsIGxvY2FsbHkgY2FsY3Vs
YXRlZAo+ICtzaGEyNTYgIDBiMmEyMDgyNTM3NzM1YTJhNTc2ZGJlYzJlOGY5YzFhMDk4MTJlYWM2
ZGY2YTM4OTUwMmE2YmE4NjAwNzI5MDYgIHJlYWRtZTJkLnR4dAo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL2ZmdDJkL2ZmdDJkLm1rIGIvcGFja2FnZS9mZnQyZC9mZnQyZC5tawo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNjI2M2IxYWYzOAo+IC0tLSAvZGV2L251bGwK
PiArKysgYi9wYWNrYWdlL2ZmdDJkL2ZmdDJkLm1rCj4gQEAgLTAsMCArMSwyMiBAQAo+ICsjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMgZmZ0MmQKPiArIwo+ICsjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwo+ICsKPiArRkZUMkRfVkVSU0lPTiA9IDIwMDYuMTIuMjgKPiArRkZUMkRfU0lU
RSA9IGh0dHBzOi8vd3d3Lmt1cmltcy5reW90by11LmFjLmpwL35vb3VyYQo+ICtGRlQyRF9TT1VS
Q0UgPSBmZnQyZC50Z3oKPiArRkZUMkRfTElDRU5TRSA9IHJlYWRtZTJkLnR4dAo+ICtGRlQyRF9M
SUNFTlNFX0ZJTEVTID0gcmVhZG1lMmQudHh0Cj4gK0ZGVDJEX0lOU1RBTExfU1RBR0lORyA9IFlF
Uwo+ICtGRlQyRF9JTlNUQUxMX1RBUkdFVCA9IE5PCj4gKwo+ICtkZWZpbmUgRkZUMkRfSU5TVEFM
TF9TVEFHSU5HX0NNRFMKPiArICAgICAgIG1rZGlyIC1wICQoU1RBR0lOR19ESVIpL3Vzci9pbmNs
dWRlL2ZmdDJkCj4gKyAgICAgICAkKElOU1RBTEwpIC1tIDA2NDQgJChARCkvKi5jICQoU1RBR0lO
R19ESVIpL3Vzci9pbmNsdWRlL2ZmdDJkCj4gKyAgICAgICAkKElOU1RBTEwpIC1tIDA2NDQgJChA
RCkvKi5mICQoU1RBR0lOR19ESVIpL3Vzci9pbmNsdWRlL2ZmdDJkCj4gKyAgICAgICAkKElOU1RB
TEwpIC1tIDA2NDQgJChARCkvKi5oICQoU1RBR0lOR19ESVIpL3Vzci9pbmNsdWRlL2ZmdDJkCj4g
K2VuZGVmCj4gKwo+ICskKGV2YWwgJChnZW5lcmljLXBhY2thZ2UpKQo+IC0tCj4gMi4zNC4xCj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApUaGFua3MKR2lsbGVz
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
