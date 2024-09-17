Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC98C3ABCB
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 02:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85CD440E07;
	Tue, 17 Sep 2024 02:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7lbIjNNYAxeL; Tue, 17 Sep 2024 02:23:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1A5540E0B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1A5540E0B;
	Tue, 17 Sep 2024 02:23:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A992A1BF3D2
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 02:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 981B661464
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 02:23:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kqTdG10Y5IQQ for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 02:23:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a2f; helo=mail-vk1-xa2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4958961457
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4958961457
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4958961457
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 02:23:34 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-502af8a83daso1132214e0c.1
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 19:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726539813; x=1727144613;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i7FeAyHqEF68wiyHlAzHnPpzRzMGQxaUM1KnLQzTN94=;
 b=S6b394z2Ghyf+Sxb/XnspzMPHMWjvyEWSBFnhFEju0Afet7zP2aJc3ejtKF9kyzglS
 onPYMcWfcI4IVZdVz5Kp53mPMOx64Ew86upb5CoSdN6+CEZ1E5f7VuRyn5TPWpHr7GkM
 f+yxPsdkc9pwzAlUjfGzH2Ma2qtIghxYQ3XELX7fGiQ7AZLJjTZiqVuV95oxLigS4ybO
 HYSiJWRJtMJH+T7qj23YG+zrMEoE6bE+Ji+0s+jO+pdusp2YbXKV6CMVJyLRzAtZWlu8
 kKJ7EkjeuLtR+4xfnrbc2frFGAcpMer4lTKjtdDh+Lj8JqHtZtLSpPK1Ak5h3hYD6j4n
 vD9w==
X-Gm-Message-State: AOJu0YwAh32T9ogk7eTArpmhMbU9jHzAp9+kN04hZXZHJchbQwXpH/B8
 KiaeUk9uah/cojf/aKBk76mgcaRIvH2n0UF5T+067hGKZDY0RPINNyg+85QPcr46YzzSOusmJru
 3+1HH/Wy192oQYB7sm/s5AYeqk8E=
X-Google-Smtp-Source: AGHT+IFefpbj4Bp+Krhz83DKzTYBRbpnGN6S67FK1HxHlMAYlcnep8y59YUxqKw+Ckh/+/Cy0qRxoMwjYye1CC+JRuI=
X-Received: by 2002:a05:6122:310c:b0:501:be30:2abf with SMTP id
 71dfb90a1353d-50344b63a4dmr8805984e0c.1.1726539813089; Mon, 16 Sep 2024
 19:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240914203740.1089249-1-james.hilliard1@gmail.com>
 <ZugHf9sLvzw7Qv0x@landeda>
In-Reply-To: <ZugHf9sLvzw7Qv0x@landeda>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Sep 2024 20:23:21 -0600
Message-ID: <CADvTj4qVctNEPc4vLoDWsnAz=BBTgXk1cnpwWbzKvxWVsAbYZQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726539813; x=1727144613; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i7FeAyHqEF68wiyHlAzHnPpzRzMGQxaUM1KnLQzTN94=;
 b=mUAocThBN17M72Kecduqv9KosxUK7jT/DTrx/wPhGNfDzDUFRw1+E/2UdHETPam/kr
 R0OT5R0gyqaV48A/lG7ehP27DyAng9ABvbXZ0fMRN2rEDgStrOnmdurRhrxEynPMt+nK
 nWYhdMYunoszWJxTG5WFlPZvIQrQHRtJL3WXxiIIw5DDFvQrhdEprtFaS+ZI/rwz0J9L
 Wg95IAMkaMg2ps8tKKm4EeZWq4qg8e9M+FymafYvIZ2X0WZFs2mkWKKJf3e7bo6S/56/
 ALEtkzPpicz8Iuu5CQUNx2iw0RLENzGdwNT+Pr7PIQ9r3Sc80eC/i/XFIPoSCuFQjMtD
 cnUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mUAocThB
Subject: Re: [Buildroot] [PATCH v4 1/3] package/python-numpy: bump to
 version 1.26.4
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBTZXAgMTYsIDIwMjQgYXQgNDoyNeKAr0FNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9y
aW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IEphbWVzLCBBbGwsCj4KPiBPbiAyMDI0LTA5LTE0
IDE0OjM3IC0wNjAwLCBKYW1lcyBIaWxsaWFyZCBzcGFrZSB0aHVzbHk6Cj4gPiBMaWNlbnNlIGhh
c2ggY2hhbmdlZCBkdWUgdG8gZGF0ZSB1cGRhdGU6Cj4gPiBodHRwczovL2dpdGh1Yi5jb20vbnVt
cHkvbnVtcHkvY29tbWl0L2MxZmZkYmMwYzI5ZDQ4ZWNlNzE3YWNiNWJmYmY4MTFjOTM1YjQxZjYK
PiA+Cj4gPiBXZSBuZWVkIHRvIGJ1aWxkIHB5dGhvbi1udW1weSB3aXRoIGl0cyB2ZW5kb3JlZCB2
ZXJzaW9uIG9mIG1lc29uIGFzCj4gPiBpdCBjdXJyZW50bHkgcmVsaWVzIG9uIGZlYXR1cmVzIHRo
YXQgYXJlIG5vdCB5ZXQgdXBzdHJlYW0uIFRvIGRvIHRoaXMKPiA+IHdlIGNhbiBzaW1wbHkgc2V0
IHRoZSBQWVRIT05QQVRIIHdpdGggdGhlIHZlbmRvcmVkIG1lc29uIHBhdGggYmVmb3JlCj4gPiB0
aGUgbm9ybWFsIFBZVEhPTjNfUEFUSCBzbyB0aGF0IHRoZSB2ZW5kb3JlZCB2ZXJzaW9uIHdpbGwg
aGF2ZQo+ID4gcHJlY2VkZW5jZS4gV2UgbmVlZCB0byBzZXQgdGhpcyBmb3IgYm90aCBob3N0IGFu
ZCB0YXJnZXQgbnVtcHkuCj4gPgo+ID4gV2UgYWxzbyBuZWVkIHRvIHNldCB0aGUgYXJjaGl0ZWN0
dXJlIHNwZWNpZmljIGxvbmdkb3VibGVfZm9ybWF0Cj4gPiBwcm9wZXJ0eSBhcyBudW1weSBpcyB1
bmFibGUgdG8gZGV0ZXJtaW5lIHRoZSB2YWx1ZSBmb3IgdGhpcyB3aXRob3V0Cj4gPiBiZWluZyBh
YmxlIHRvIGV4ZWN1dGUgdGFyZ2V0IGJpbmFyaWVzLgo+ID4KPiA+IFNlZToKPiA+IGh0dHBzOi8v
Z2l0aHViLmNvbS9udW1weS9udW1weS9ibG9iLzNlN2U1YzNjYWJiOGYxYTBkOTQwZGM2ZjIwNThm
ZWQ0YThjM2UyODQvZG9jL3NvdXJjZS9idWlsZGluZy9jcm9zc19jb21waWxhdGlvbi5yc3QKPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWls
LmNvbT4KPiBbLS1TTklQLS1dCj4gPiAraWZlcSAoJChCUjJfYXJjbGUpLHkpCj4gPiArUFlUSE9O
X05VTVBZX0xPTkdET1VCTEVfRk9STUFUID0gSUVFRV9ET1VCTEVfTEUKPiA+ICtlbHNlIGlmZXEg
KCQoQlIyX2FyY2ViKSx5KQo+ID4gK1BZVEhPTl9OVU1QWV9MT05HRE9VQkxFX0ZPUk1BVCA9IElF
RUVfRE9VQkxFX0JFCj4gPiArZWxzZSBpZmVxICgkKEJSMl9hYXJjaDY0KSx5KQo+ID4gK1BZVEhP
Tl9OVU1QWV9MT05HRE9VQkxFX0ZPUk1BVCA9IElFRUVfUVVBRF9MRQo+ID4gK2Vsc2UgaWZlcSAo
JChCUjJfYXJtKSx5KQo+ID4gK1BZVEhPTl9OVU1QWV9MT05HRE9VQkxFX0ZPUk1BVCA9IElOVEVM
X0VYVEVOREVEXzEyX0JZVEVTX0xFCj4gPiArZWxzZSBpZmVxICgkKEJSMl9hcm1lYikseSkKPiA+
ICtQWVRIT05fTlVNUFlfTE9OR0RPVUJMRV9GT1JNQVQgPSBNT1RPUk9MQV9FWFRFTkRFRF8xMl9C
WVRFU19CRQo+ID4gK2Vsc2UgaWZlcSAoJChCUjJfaTM4NikseSkKPiA+ICtQWVRIT05fTlVNUFlf
TE9OR0RPVUJMRV9GT1JNQVQgPSBJTlRFTF9FWFRFTkRFRF8xMl9CWVRFU19MRQo+ID4gK2Vsc2Ug
aWZlcSAoJChCUjJfbWlwcykseSkKPiA+ICtQWVRIT05fTlVNUFlfTE9OR0RPVUJMRV9GT1JNQVQg
PSBJRUVFX0RPVUJMRV9CRQo+ID4gK2Vsc2UgaWZlcSAoJChCUjJfbWlwc2VsKSx5KQo+ID4gK1BZ
VEhPTl9OVU1QWV9MT05HRE9VQkxFX0ZPUk1BVCA9IElOVEVMX0VYVEVOREVEXzEyX0JZVEVTX0xF
Cj4gPiArZWxzZSBpZmVxICgkKEJSMl9wb3dlcnBjKSx5KQo+ID4gK1BZVEhPTl9OVU1QWV9MT05H
RE9VQkxFX0ZPUk1BVCA9IElFRUVfUVVBRF9CRQo+ID4gK2Vsc2UgaWZlcSAoJChCUjJfcG93ZXJw
YzY0KSx5KQo+ID4gK1BZVEhPTl9OVU1QWV9MT05HRE9VQkxFX0ZPUk1BVCA9IElFRUVfUVVBRF9C
RQo+ID4gK2Vsc2UgaWZlcSAoJChCUjJfc2gpLHkpCj4gPiArUFlUSE9OX05VTVBZX0xPTkdET1VC
TEVfRk9STUFUID0gSUVFRV9ET1VCTEVfTEUKPiA+ICtlbHNlIGlmZXEgKCQoQlIyX3g4Nl82NCks
eSkKPiA+ICtQWVRIT05fTlVNUFlfTE9OR0RPVUJMRV9GT1JNQVQgPSBJRUVFX1FVQURfTEUKPiA+
ICtlbmRpZgo+Cj4gWW91IG1pc3NlZCB0aGUgcmlzY3YgY2FzZSwgYWRkZWQgaW4gY29tbWl0IGEw
YjhjYTFjMjE0Cj4gKHBhY2thZ2UvcHl0aG9uLW51bXB5OiBlbmFibGUgb24gUklTQy1WKS4KPgo+
IEhvdyBkaWQgeW91IGVzdGFibGlzaCB0aGF0IGxpc3Q/IFdoZXJlIGFyZSB0aG9zZSBzZXR0aW5n
cyBkZWZpbmVkPwoKSG1tLCBJIHRoaW5rIEkgaGFkIHB1bGxlZCB0aGVtIGZyb20gdmFyaW91cyBz
b3VyY2VzLCBidXQgd2Fzbid0IHJlYWxseQpzdXJlIHRoZXkgd2VyZSBjb3JyZWN0LgoKSSB3ZW50
IGFoZWFkIGFuZCByYW4gdGhpcyBwcm9ncmFtIGZyb20gbnVtcHkncyBidWlsZCBzeXN0ZW0gb24g
YWxsCnN1cHBvcnRlZCB0b29sY2hhaW5zIGluIGJ1aWxkcm9vdCBhbmQgZ290IHNvbWUgZGlmZmVy
ZW50IHZhbHVlcyB3aGljaCBJCnRoZW4gdXNlZCBpbiBteSB2NToKaHR0cHM6Ly9naXRodWIuY29t
L251bXB5L251bXB5L2Jsb2IvdjIuMS4xL251bXB5L19jb3JlL21lc29uLmJ1aWxkI0w0MTAtTDQ4
MwoKdjUgd2l0aCB1cGRhdGVkIGxvbmdkb3VibGUgdmFsdWVzIGZyb20gdGVzdCBwcm9ncmFtOgpo
dHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjQw
OTE3MDIxMzMyLjM4Mzg1NzktMS1qYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tLwoKVGVzdCBwcm9n
cmFtIG91dHB1dCBmb3IgdmFyaW91cyBydW5zIHVzaW5nIHFlbXUtdXNlcihwcm9ncmFtIHNvdXJj
ZQpmcm9tIG51bXB5J3MgbWVzb24uYnVpbGQgaXMgbHR5cGUuYyBpbiB0aGVzZSB0ZXN0IHJ1bnMp
OgpodHRwczovL2dpc3QuZ2l0aHViLmNvbS9qYW1lc2hpbGxpYXJkL2IwNTc3OTFiNTViZDMyODg0
MzAxNzM0ZGY1Yjc4MWRiCgpJIHRoaW5rIEkgbWFuYWdlZCB0byBnZW5lcmF0ZSB2YWx1ZXMgdGhl
cmUgZm9yIGFsbCBhcmNoaXRlY3R1cmVzIGV4Y2VwdAphcmNsZSBhbmQgYXJjYmUgdXNpbmcgYnVp
bGRyb290IHRvb2xjaGFpbnMgYW5kIHFlbXUtdXNlciwgc28KcHJvYmFibHkgc2hvdWxkIGRvdWJs
ZSBjaGVjayB0aG9zZSB0d28gbG9vayByaWdodC4KCj4KPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9S
SU4uCj4KPiA+ICtQWVRIT05fTlVNUFlfTUVTT05fRVhUUkFfUFJPUEVSVElFUyA9IFwKPiA+ICsg
ICAgIGxvbmdkb3VibGVfZm9ybWF0PSckKFBZVEhPTl9OVU1QWV9MT05HRE9VQkxFX0ZPUk1BVCkn
Cj4gPiArCj4gPiArSE9TVF9QWVRIT05fTlVNUFlfQ09ORl9FTlYgKz0gXAo+ID4gKyAgICAgUFlU
SE9OUEFUSD0iJChARCkvdmVuZG9yZWQtbWVzb24vbWVzb246JChIT1NUX0RJUikvbGliL3B5dGhv
biQoUFlUSE9OM19WRVJTSU9OX01BSk9SKSIKPiA+ICsKPiA+ICtIT1NUX1BZVEhPTl9OVU1QWV9O
SU5KQV9FTlYgKz0gXAo+ID4gKyAgICAgUFlUSE9OUEFUSD0iJChARCkvdmVuZG9yZWQtbWVzb24v
bWVzb246JChIT1NUX0RJUikvbGliL3B5dGhvbiQoUFlUSE9OM19WRVJTSU9OX01BSk9SKSIKPiA+
ICsKPiA+ICAjIFJhdGhlciB0aGFuIGFkZCBhIGhvc3QtYmxhcyBvciBob3N0LWxhcGFjayBkZXBl
bmRlbmNpZXMsIGp1c3QgdXNlIHVub3B0aW1pemVkLAo+ID4gICMgaW4tdHJlZSBjb2RlLgo+ID4g
IEhPU1RfUFlUSE9OX05VTVBZX0NPTkZfT1BUUyA9IC1EYmxhcz0iIiAtRGxhcGFjaz0iIgo+ID4g
LS0KPiA+IDIuMzQuMQo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cj4KPiAtLQo+IC4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCj4gfCAgWWFubiBF
LiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3Mn
IGNvbnNwaXJhY3k6IHwKPiB8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8
IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAo+IHwgKzMzIDU2MSAwOTkg
NDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJl
IGlzIG5vICB8Cj4gfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwg
SFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKPiAnLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0t
LS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
