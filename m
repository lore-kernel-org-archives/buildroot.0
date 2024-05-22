Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA23C25B79
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 19:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E2BC40188;
	Wed, 22 May 2024 19:02:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wqDe1vTkxEfJ; Wed, 22 May 2024 19:02:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7064C40217
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7064C40217;
	Wed, 22 May 2024 19:02:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A0E61C5E9B
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 19:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA386405B5
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 19:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k83K6W5t5bv3 for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 19:02:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f31; helo=mail-qv1-xf31.google.com;
 envelope-from=robertcnelson@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 834BC40560
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 834BC40560
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 834BC40560
 for <buildroot@buildroot.org>; Wed, 22 May 2024 19:02:31 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-69b6c2e9ed9so21396826d6.1
 for <buildroot@buildroot.org>; Wed, 22 May 2024 12:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716404550; x=1717009350;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hpVkXRUydHaebFOAPCQdmFuV1BJs+LUB3gZlxQVAopQ=;
 b=MNNk3w0ikwcKgPep1jJsGZvC866X6JDsxewAr0Fxb5DlI8aVv4rPhC/4dkoTL5H2pP
 2irv6IjvZD+1fh1SNcUJhUn1aE57FVFEFwsW6GG5SeCXiHj5FTaNBeKDLaJ5ePHcj+ze
 K2VsKQ2Kni9XGZsqVflHmokHmcBzacJpurQ7zgXh6mQ0hS+Z9J3UnYKWJ2M0JL4PyCVw
 rruL/qqncDlcMSfyozIU1sEU/8and92s/GNOPPtr1hewWNK2n76ZbXLt38YdifbvuYzF
 AdRdci3Svofr7IZ2EdNLKIbYkEFXTWXqapQebAiSx57f1rd9K/oXwW2xZ4KW23h+mIgA
 mamA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1Ns6QKafm8xM3vQomftkT9GvnjbU9m/ZrqxJoSNbAEVbDg2u0xKdrMKVmr0mI1LPm75PtnsSM3txcO3QywCCPNLYCGb0E5A==
X-Gm-Message-State: AOJu0Yw2bUgsBuFzDX/MVezGZe4G0ChjTua3rCmrbk1CMY1TKHTVuPCR
 EIhF1baQHrD52lx64oZqmhBxiMCbGqyA+Y4dLTweGdz964fR0l2/uQOP4I2PRIf+4Z62sWNLcO5
 +lmV3BNa1rdtF+Hqlkx9U7NVRy34=
X-Google-Smtp-Source: AGHT+IFikMRdAin+LcRUQuFzyIzKKLSBzjYiU6q2QJmMHfMwWZm2LadUvb4WyoWr9Xc062ZE7fexqmNHgVo+mMSyhkg=
X-Received: by 2002:a05:6214:3a0a:b0:6ab:7349:6a49 with SMTP id
 6a1803df08f44-6ab7f349303mr30756466d6.4.1716404550053; Wed, 22 May 2024
 12:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240507143409.230685-1-jamie.gibbons@microchip.com>
 <20240509220334.1641f661@windsurf>
 <CAOCHtYijXAWZonwgOe5mHc3-o7gNORLjkNN-CdV9kG3fcBM7KQ@mail.gmail.com>
 <20240522-geometric-everglade-a978e7098495@spud>
In-Reply-To: <20240522-geometric-everglade-a978e7098495@spud>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Wed, 22 May 2024 14:02:02 -0500
Message-ID: <CAOCHtYhbj3OioyB_u-6hbYvQx_hOu5CdfWo5T2QYEwho6w4a4g@mail.gmail.com>
To: Conor Dooley <conor@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716404550; x=1717009350; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hpVkXRUydHaebFOAPCQdmFuV1BJs+LUB3gZlxQVAopQ=;
 b=KvSkcGo6Pq7ZHAoABrVPb1k3ptP4kzl+PWs/BDaqgoP2uYqPaR5CDy6cj5DHYxVrzG
 N5MC97FGZQoUG5QwFxz62xDEfhyxcgYjh/7tq4499OgjvFH/OI+qXpw3dloQGAzVizpP
 trcMeFCalf80cmNwjSPqtU11PxVioeBBwwqiPoahdyxuk23NuWM+O035KnSw09bQDAOT
 Hb5IhB9kTLxcMRJGkOALkYWZEfDFz9K91gOj8fmzrGHNzvbXmlD9+I5fkEMUju5qBZjP
 +q/RaaVFgktx4Tyq6ze8yKAMy0orXkUpENQWCcYmGLWgHppyAkw2msu2BeA62wHxBEJp
 5wdg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KvSkcGo6
Subject: Re: [Buildroot] [PATCH 1/1] configs/beaglev_fire: add support for
 BeagleV Fire
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Conor Dooley <Conor.Dooley@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jamie Gibbons via buildroot <buildroot@buildroot.org>,
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
 Jamie Gibbons <jamie.gibbons@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBNYXkgMjIsIDIwMjQgYXQgMTozM+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIE1heSAyMiwgMjAyNCBhdCAxMjoyNzo1MVBNIC0w
NTAwLCBSb2JlcnQgTmVsc29uIHdyb3RlOgo+ID4gT24gVGh1LCBNYXkgOSwgMjAyNCBhdCAzOjA0
4oCvUE0gVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290Cj4gPiA+ID4gZGlmZiAtLWdpdCBh
L2JvYXJkL2JlYWdsZXZfZmlyZS9yb290ZnMtb3ZlcmxheS91c3Ivc2hhcmUvbWljcm9jaGlwL3Vw
ZGF0ZS1nYXRld2FyZS5zaCBiL2JvYXJkL2JlYWdsZXZfZmlyZS9yb290ZnMtb3ZlcmxheS91c3Iv
c2hhcmUvbWljcm9jaGlwL3VwZGF0ZS1nYXRld2FyZS5zaAo+ID4gPiA+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gPiA+ID4gaW5kZXggMDAwMDAwMDAwMC4uMmU5MWMwZjRmOQo+ID4gPiA+IC0tLSAv
ZGV2L251bGwKPiA+ID4gPiArKysgYi9ib2FyZC9iZWFnbGV2X2ZpcmUvcm9vdGZzLW92ZXJsYXkv
dXNyL3NoYXJlL21pY3JvY2hpcC91cGRhdGUtZ2F0ZXdhcmUuc2gKPiA+ID4gPiBAQCAtMCwwICsx
LDM2IEBACj4gPiA+ID4gKyMhL2Jpbi9iYXNoCj4gPiA+ID4gK2VjaG8gIj09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09Igo+ID4gPiA+ICtlY2hvICJ8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIEZQ
R0EgR2F0ZXdhcmUgVXBkYXRlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCIKPiA+ID4g
PiArZWNobyAifCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwiCj4gPiA+ID4gK2VjaG8gInwgICBQbGVh
c2UgZW5zdXJlIHRoYXQgdGhlIG1wZnNfYml0c3RyZWFtLnNwaSBmaWxlIGNvbnRhaW5pbmcgdGhl
IGdhdGV3YXJlICAgICB8Igo+ID4gPiA+ICtlY2hvICJ8ICAgdXBkYXRlIGhhcyBiZWVuIGNvcGll
ZCB0byBkaXJlY3RvcnkgL2xpYi9maXJtd2FyZS4gICAgICAgICAgICAgICAgICAgICAgICAgfCIK
PiA+ID4gPiArZWNobyAifCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwiCj4gPiA+ID4gK2VjaG8gInwg
ICAgICAgICAgICAgICAgICEhISBUaGlzIHdpbGwgdGFrZSBhIGNvdXBsZSBvZiBtaW51dGVzLiAh
ISEgICAgICAgICAgICAgICAgICB8Igo+ID4gPiA+ICtlY2hvICJ8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCIKPiA+ID4gPiArZWNobyAifCAgICAgICAgICAgICAgIEdpdmUgdGhlIHN5c3RlbSBhIGZl
dyBtaW51dGVzIHRvIHJlYm9vdCBpdHNlbGYgICAgICAgICAgICAgICAgIHwiCj4gPiA+ID4gK2Vj
aG8gInwgICAgICAgICAgICAgICAgICAgICAgICBhZnRlciBMaW51eCBoYXMgc2h1dGRvd24uICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8Igo+ID4gPiA+ICtlY2hvICJ8ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCIKPiA+ID4gPiArZWNobyAiPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0iCj4gPiA+
Cj4gPiA+IFRoaXMgd2hvbGUgbWVzc2FnZSBpcyBzaWxseSBhcyB0aGUgcHJldmlvdXMgc2NyaXB0
IGhhcyBhbHJlYWR5IGNvcGllZAo+ID4gPiB3aGF0ZXZlciBpcyBuZWVkZWQgaW4gL2xpYi9maXJt
d2FyZS8uIEJ1dCBpbiBmYWN0LCB3aGF0IGRvZXMgaXQgY29weSBpdAo+ID4gPiBpbiAvbGliL2Zp
cm13YXJlLyBpbiB0aGUgZmlyc3QgcGxhY2U/Cj4gPgo+ID4gSXQncyBhIE1pY3JvY2hpcCBGQUUg
dGhpbmcuIDspCj4KPiBJJ20gbm90IGEgbGlzdCBtZW1iZXIgKGFmYWlrKSwgc28gSSdtIGV4cGVj
dGluZyBtb3N0IHBlb3BsZSBub3QgdG8gc2VlCj4gdGhpcywgYnV0IHRoZSB3aG9sZSAvbGliL2Zp
cm13YXJlIGRhbmNlIGlzIGdvaW5nIHRvIGdvIGF3YXkgLSB0aGUKPiBtYWlubGluZWQgdmVyc2lv
biBbMV0gb2YgdGhlIGRyaXZlciBiZWluZyB1c2VkIGJ5IHRoaXMgc2NyaXB0IHVzZXMgdGhlCj4g
RmlybXdhcmUgVXBsb2FkIEFQSSAoaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvZHJpdmVyLWFwaS9m
aXJtd2FyZS9md191cGxvYWQuaHRtbCkKPiBhbmQgZG9lc24ndCByZWx5IG9uIGEgY29ycmVjdGx5
IHBsYWNlZCBmaWxlIGluIC9saWIvZmlybXdhcmUgb3IgZGVidWdmcy4KPgo+IENoZWVycywKPiBD
b25vci4KPgo+IDEgLSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJzL2Zpcm13YXJlL21pY3JvY2hpcC9t
cGZzLWF1dG8tdXBkYXRlLmMKClRoYXQncyBhd2Vzb21lIENvbm9yLCB5b3Ugc3BlbnQgYSBsb3Qg
b2YgdGltZSBvbiB0aGF0Li4gTGFuZGVkIGluIHY2LjghIDspCgpGb3IgcmVmZXJlbmNlLCB0aGUg
dmVyc2lvbiB3ZSBzaGlwIHdhcyBvbmUgb2YgQ29ub3IncyBlYXJseSBwcm90b3R5cGVzLi4uCgpS
ZWdhcmRzLAoKLS0gClJvYmVydCBOZWxzb24KaHR0cHM6Ly9yY24tZWUuY29tLwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
