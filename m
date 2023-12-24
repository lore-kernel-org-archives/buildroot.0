Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFB7C46CD2
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 22:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8596781755;
	Sun, 24 Dec 2023 22:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8596781755
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lq-6KU5kXqCh; Sun, 24 Dec 2023 22:09:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2A6C814A9;
	Sun, 24 Dec 2023 22:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2A6C814A9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B739F1BF380
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 22:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FF3660BD1
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 22:09:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FF3660BD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Bs-7UJ9TbQA for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 22:09:05 +0000 (UTC)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3E3660804
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 22:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3E3660804
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5e734d6cbe4so27218187b3.3
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 14:09:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703455744; x=1704060544;
 h=content-transfer-encoding:cc:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C7Cvehk5upltx70Qy6ERVkHvetyMAAfPt51TfeF0jtI=;
 b=qpjK9x5bv1alh6WRc05kf3zDERvtHpxpXnB7BE6jR7aRjm1WHNsXQ5kP3bozQHgDB/
 cMLqfhawv2nA6OrQcHn+K9dCcVxPD9vubHyfuFJqoN+dordoMvWyQgA4JM3DOMrjeD0n
 84bzlDn96ZM/QG+ikYpXPlbHb+r5ttEXricSyZhHS4m/OjxvF5DSSiPHKGCAXvAIakKQ
 cuIY4SaPkDJ5M4ACcBNKSUNuCfK3oXc5EUQx0uXOIkYf9dc/6w9EBpeMSHKfbA7v6stW
 4lNZcv8/FqTB5it6+VuGzjCDzz9O4ua28t0L8U3QybTL4PUomaoSkR2uoH1t8NzpvUvp
 iHFA==
X-Gm-Message-State: AOJu0YxJ5twCfmYV6x5tJneICSkASG2v/I/qNe5irKbOcfZ0lzgp6NIk
 DnccmWjOQUCORiIBdQW4ZPsWH3NhpkpWmW20kaUEY9Zm
X-Google-Smtp-Source: AGHT+IE7ZUR9IqcWAK4ou0PI2GRYwdiHJZIw5RcfeUbDYRe2VmI/3Nl0zOHQ7K0snreg/de+/Ac+YYiPOUHfUMn35QM=
X-Received: by 2002:a25:aae9:0:b0:dbd:56fb:7ba9 with SMTP id
 t96-20020a25aae9000000b00dbd56fb7ba9mr2429252ybi.26.1703455744015; Sun, 24
 Dec 2023 14:09:04 -0800 (PST)
MIME-Version: 1.0
References: <20231219172446.498409-1-adam.duskett@amarulasolutions.com>
In-Reply-To: <20231219172446.498409-1-adam.duskett@amarulasolutions.com>
From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 24 Dec 2023 15:08:53 -0700
Message-ID: <CAFSsvmoYpT9ZS57HaTmz5U_bdWAKe0C+Abb5z-Bp8O-r2pv+Jg@mail.gmail.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703455744; x=1704060544; darn=buildroot.org;
 h=content-transfer-encoding:cc:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C7Cvehk5upltx70Qy6ERVkHvetyMAAfPt51TfeF0jtI=;
 b=QBE/ME26+4bsHrm76waZIQAIAO2m1XAnFp5nvydk1ef2fuHf54hSmdLy+pXkiMQ7Pq
 EV9NhuhBae6PNzTa0wWUi9ESMY1bhTbJYLkHlxVUKd2D0FG7sb24twPkmGbOMFJcfhhA
 YM4d8r++dNGkkAZ2e3OmQqxqhWhwoJlc5ZaVJoln9y43wYE9qi1/T8v014NcGFStmIw5
 4Gat37Xsx7ySNRjDq4bQzpXcHMZtjglscJVtqeOyBiAeo21L+nxLfr4xroFCAJmG3t69
 nzfred3A4Oq8uR8i4zudI/hsrq08HvxzAGMwQgel/o6bb+DMZN4rwJ2GFrM9LKEyc21p
 Qvow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QBE/ME26
Subject: Re: [Buildroot] [PATCH v3 1/6] configs/mender_x86_64_efi_defconfig:
 Update kernel to latest LTS version
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SSB3aWxsIG1hcmsgdGhpcyBzZXJpZXMgYXMgcmVqZWN0ZWQsIGFzIGl0J3Mgbm90IEZsdXR0ZXIt
cmVsYXRlZC4KCk9uIFR1ZSwgRGVjIDE5LCAyMDIzIGF0IDEwOjI24oCvQU0gQWRhbSBEdXNrZXR0
CjxhZGFtLmR1c2tldHRAYW1hcnVsYXNvbHV0aW9ucy5jb20+IHdyb3RlOgo+Cj4gNS4xOCBpcyBu
b3QgYSBMVFMgdmVyc2lvbi4gTGV0J3MgdXBkYXRlIHRoZSBrZXJuZWwgdG8gdXNlIHRoZSBMVFMg
Ni4xIGtlcm5lbC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFkYW0gRHVza2V0dCA8YWRhbS5kdXNrZXR0
QGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IC0tLQo+IHYyIC0+IHYzOiBVcGRhdGUgQlIyX1BBQ0tB
R0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV81XzE4IC0+IDZfMSBbVGhvbWFzXQo+Cj4gIGNv
bmZpZ3MvbWVuZGVyX3g4Nl82NF9lZmlfZGVmY29uZmlnIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvY29u
Zmlncy9tZW5kZXJfeDg2XzY0X2VmaV9kZWZjb25maWcgYi9jb25maWdzL21lbmRlcl94ODZfNjRf
ZWZpX2RlZmNvbmZpZwo+IGluZGV4IDI1YTQ2M2FiYjMuLjU3YmZjMTVkMDEgMTAwNjQ0Cj4gLS0t
IGEvY29uZmlncy9tZW5kZXJfeDg2XzY0X2VmaV9kZWZjb25maWcKPiArKysgYi9jb25maWdzL21l
bmRlcl94ODZfNjRfZWZpX2RlZmNvbmZpZwo+IEBAIC0yLDcgKzIsNyBAQAo+ICBCUjJfeDg2XzY0
PXkKPgo+ICAjIFRvb2xjaGFpbgo+IC1CUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VT
VE9NXzVfMTg9eQo+ICtCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfMT15
Cj4KPiAgIyBTeXN0ZW0KPiAgQlIyX1RBUkdFVF9HRU5FUklDX0dFVFRZX1BPUlQ9InR0eVMwIgo+
IEBAIC0zOSw3ICszOSw3IEBAIEJSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0iLS1kYXRhLXBh
cnQtc2l6ZT0zMk0gLS1kZXZpY2UtdHlwZT1idWlsZHJvb3QteDg2XzY0Cj4gICMgS2VybmVsCj4g
IEJSMl9MSU5VWF9LRVJORUw9eQo+ICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkK
PiAtQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNS4xOC4xNCIKPiArQlIy
X0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi4xLjY4Igo+ICBCUjJfTElOVVhf
S0VSTkVMX1VTRV9DVVNUT01fQ09ORklHPXkKPiAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fQ09O
RklHX0ZJTEU9ImJvYXJkL21lbmRlci94ODZfNjQvbGludXguY29uZmlnIgo+ICBCUjJfTElOVVhf
S0VSTkVMX0lOU1RBTExfVEFSR0VUPXkKPiAtLQo+IDIuNDMuMAo+Cj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
