Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE96CC2A069
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 18:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E0E0404E4;
	Sun,  4 Jan 2026 18:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YNvEa4hA-xfu; Sun,  4 Jan 2026 18:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FBC9404EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767552034;
	bh=/IlBwNxuR2cIPFEDW38vfU6gNsxTLYTjJiTiEzeMMho=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PHYYw0QlDjm0+gfkuhtBKS7U2eU/N9T5TYTMfM9f7HrTVNHYS5+zXi0E/mLUOxVqR
	 ud14WhixCCf+6Y3YSiP2cYHGIuE77ssT5GSKBZz7GmMeBsB6CkFJzc2oDxLM83yw5d
	 As5JA33Ibl8LC/9JwnSEXBW0efcTwuu3KZHNXlDgSy0KqeMkzHpOyIGOU/P5wKzv6i
	 6qexXaJVsnp2ap9sUGLgjeTEe/8C/o/27dcnP3x9meXYj9Fn+MJ8rH8+a8l3Pclspa
	 2nNmouf34yyvnY5dWaWbTmrxayrxfm9w9ClsjYTtqvUloLJkDKhJtu9FT8AotAZVd3
	 SRKUQykPpK3Tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FBC9404EC;
	Sun,  4 Jan 2026 18:40:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 80CB8249
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 18:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72DF44008D
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 18:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9vIg1K8oDqeI for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 18:40:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2c; helo=mail-vs1-xe2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B746A4005C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B746A4005C
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B746A4005C
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 18:40:31 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id
 ada2fe7eead31-5dd6fbe50c0so5083095137.2
 for <buildroot@buildroot.org>; Sun, 04 Jan 2026 10:40:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767552030; x=1768156830;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0YJ1oAos7ZFnZ/3r1m7vNXve8ZJkIa3wXDvvt7PC1Fc=;
 b=Cq5QukFsRe6omUIb/zwdlvGxgHTX+qaU0EeLASVHB4gVJ5CkLdFbJ6IUCR5Jo6Cxl/
 2gEsrJrum8oCpKzVsoSc9d8GEsIRdxioN/BUyQMJlJhnigpgfn4KUQeNT2D/mN6EIDcu
 r1+60xzECcEfChgKCAh0uOPZUKLX+c9TNPwkgm8GfsaBIsGkOR8G1rR75HKP0n0XynuH
 BSSrkP/OjLd5ASIuYH5EL0dapd4Li9AVNEKab4RR/nLMztgsWD9+dkJkvK2xdsBhOl9e
 iVRcm3sDey0IzHLKvxP8PmbNoTgESFidjKseUG84tvEhgNEAuLDrkPTYRXTcEmONKAWB
 AUUg==
X-Gm-Message-State: AOJu0Yxwm/XV3IvfR6tWfY7jCLx+vItaVmsDs0djcarzKSIpxY04k7uO
 fhq/Bv2J9X1PiFgqp+mbAeUH+j49qAAMLOAucXlEe/mb4vLumTGsLAyW0VtESIOgJkY695YYvy2
 xXVSAOJWvF2rXjTvoSaBDRVeFmkbfMBM=
X-Gm-Gg: AY/fxX7NsIyvGcOqtbi+47QiJiGoXH7K/pDpcXccPAsfZ5c+T7/T7a+hfNeBhRXlMYn
 ZMMX8gKVW9sfpchXzr+EpfRJCZO455xSU9m0r96bC8OMJr7Dl2Xkfm/2wW3egZ4J/v3N11oqczD
 iC8LBjcxhp01wXKuG2IVVQ+r3pdV7b+ki2ysC0p8qON2w6/YxQrmYdTyEYS2pPybMuwtMDB+vWv
 D43dxhmiKTJOah26Xn3Ep3CPgDdgwiKae9ZY378RpIkfExrx+x1AKKbhnvtMtm1eqUxU+zu1y/N
 exoi7l6nViW4zfue5KQe5i37/ahiJOeZ6AEsSj1/XyT5sIofNKALSs8koOWBS4sKdQ==
X-Google-Smtp-Source: AGHT+IEkqHz9b5BYi4xLAu9IK+r5OHpvChN/6/uulqerCSnhy7fnS7MCI8PrbvHgo3tLaQAJ2O0Chr0RZ3wtKEovkVc=
X-Received: by 2002:a05:6102:510d:b0:5de:31b1:2011 with SMTP id
 ada2fe7eead31-5eb1a663371mr11426584137.17.1767552030347; Sun, 04 Jan 2026
 10:40:30 -0800 (PST)
MIME-Version: 1.0
References: <20260101134901.882436-1-bernd@kuhls.net>
In-Reply-To: <20260101134901.882436-1-bernd@kuhls.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 4 Jan 2026 11:40:19 -0700
X-Gm-Features: AQt7F2qwdp1PJ3tD1WqHyd9o1-bWdGqLPDn1n6O_FJm5J4nJfehyjqNcfSWC2Hw
Message-ID: <CADvTj4omtKN31WgG0cP=Gr9EBEqW1-Q1guBOKwgMB1gUCxe3gA@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767552030; x=1768156830; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0YJ1oAos7ZFnZ/3r1m7vNXve8ZJkIa3wXDvvt7PC1Fc=;
 b=azwwQ/zxmu7aNOTmJ3bwoxp0fxVzbk3RyUgWx9cHHXpFoxsIPHmvdYsaPV+LHVwAYB
 sr9F+oqlgCZlVa+hhvWAm24qyRs14KBTXBtyABXl/5UN02QB22Zq9tHmNlXyOvt0Mlrm
 X7pbrxgjYsMnoJn1JGvQv0O0WvlOUY/9EXGwWBJJeaV/jeYnxIS/gjytit+84qLR88ix
 l+rIOpm9G6e58bAqhOZxDJlu0XoLUiSsXKxVWbpQT8HS3lCSrMMDYSMCP2NW8lE/fJ1r
 oLcHTq5hFY+92xLS7DttdpSQUoYyFAb4DtkeXD0O4qvKKcFr+iVJDKvLSDDPFZ43R4E0
 yGGQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=azwwQ/zx
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pybind: install headers
 into host directory
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCBKYW4gMSwgMjAyNiBhdCA2OjQ54oCvQU0gQmVybmQgS3VobHMgPGJlcm5kQGt1aGxz
Lm5ldD4gd3JvdGU6Cj4KPiBGaXhlcyBidWlsZCBlcnJvciB3aXRoIHB5dGhvbi1waWxsb3cgc2lu
Y2UgaXRzIHZlcnNpb24gYnVtcCB0byAxMi4wLjAKPiB3aGljaCBpbnRyb2R1Y2VkIGEgZGVwZW5k
ZW5jeSB0byBweWJpbmQgd2l0aCBidWlsZHJvb3QgY29tbWl0Cj4gNWY0NDZhOGQ2ZGQ4NzE1Mzg1
ZDZlMmRmMjcxNGYwNjRiZjI2MjQzZDoKPgo+IEZpbGVOb3RGb3VuZEVycm9yOiBbRXJybm8gMl0g
Tm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeToKPiAgJy9ob21lL2Jlcm5kL2J1aWxkcm9vdC9vdXRw
dXQvaG9zdC9saWIvcHl0aG9uMy4xMy9zaXRlLXBhY2thZ2VzL2luY2x1ZGUvcHliaW5kMTEvZGV0
YWlsL2NvbW1vbi5oJwo+Cj4gd2l0aCB0aGlzIGRlZmNvbmZpZzoKPgo+IEJSMl94ODZfNjQ9eQo+
IEJSMl94ODZfY29yZWk3PXkKPiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKPiBCUjJfVE9PTENI
QUlOX0VYVEVSTkFMX0JPT1RMSU5fWDg2XzY0X0NPUkVfSTdfR0xJQkNfQkxFRURJTkdfRURHRT15
Cj4gQlIyX1BBQ0tBR0VfUFlUSE9OMz15Cj4gQlIyX1BBQ0tBR0VfUFlUSE9OX1BJTExPVz15Cj4K
PiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgpUZXN0ZWQtYnk6
IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+IC0tLQo+ICBwYWNr
YWdlL3B5dGhvbi1weWJpbmQvcHl0aG9uLXB5YmluZC5tayB8IDggKysrKystLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3B5dGhvbi1weWJpbmQvcHl0aG9uLXB5YmluZC5tayBiL3BhY2thZ2UvcHl0aG9u
LXB5YmluZC9weXRob24tcHliaW5kLm1rCj4gaW5kZXggNzI4MmMwNThmNi4uYjdlNWNiNjU5NiAx
MDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1weWJpbmQvcHl0aG9uLXB5YmluZC5tawo+ICsr
KyBiL3BhY2thZ2UvcHl0aG9uLXB5YmluZC9weXRob24tcHliaW5kLm1rCj4gQEAgLTE3LDExICsx
NywxMyBAQCBQWVRIT05fUFlCSU5EX0NPTkZfT1BUUyA9IFwKPiAgICAgICAgIC1EUFlCSU5EMTFf
VEVTVD1PRkYgXAo+ICAgICAgICAgLURQWUJJTkQxMV9OT1BZVEhPTj1PTgo+Cj4gLVBZVEhPTl9Q
WUJJTkRfSU5TVEFMTF9QQVRIID0gJChIT1NUX0RJUikvbGliL3B5dGhvbiQoUFlUSE9OM19WRVJT
SU9OX01BSk9SKS9zaXRlLXBhY2thZ2VzL3B5YmluZDExCj4gK1BZVEhPTl9QWUJJTkRfSU5TVEFM
TF9QQVRIID0gJChIT1NUX0RJUikvbGliL3B5dGhvbiQoUFlUSE9OM19WRVJTSU9OX01BSk9SKS9z
aXRlLXBhY2thZ2VzCj4KPiAgZGVmaW5lIFBZVEhPTl9QWUJJTkRfSU5TVEFMTF9NT0RVTEUKPiAt
ICAgICAgIG1rZGlyIC1wICQoUFlUSE9OX1BZQklORF9JTlNUQUxMX1BBVEgpCj4gLSAgICAgICBj
cCAtZHBmICQoQEQpL3B5YmluZDExLyoucHkgJChQWVRIT05fUFlCSU5EX0lOU1RBTExfUEFUSCkK
PiArICAgICAgIG1rZGlyIC1wICQoUFlUSE9OX1BZQklORF9JTlNUQUxMX1BBVEgpL2luY2x1ZGUv
cHliaW5kMTEKPiArICAgICAgIG1rZGlyIC1wICQoUFlUSE9OX1BZQklORF9JTlNUQUxMX1BBVEgp
L3B5YmluZDExCj4gKyAgICAgICBjcCAtZHBmciAkKEBEKS9pbmNsdWRlL3B5YmluZDExLyogJChQ
WVRIT05fUFlCSU5EX0lOU1RBTExfUEFUSCkvaW5jbHVkZS9weWJpbmQxMQo+ICsgICAgICAgY3Ag
LWRwZiAkKEBEKS9weWJpbmQxMS8qLnB5ICQoUFlUSE9OX1BZQklORF9JTlNUQUxMX1BBVEgpL3B5
YmluZDExCj4gIGVuZGVmCj4gIFBZVEhPTl9QWUJJTkRfUE9TVF9JTlNUQUxMX1NUQUdJTkdfSE9P
S1MgKz0gUFlUSE9OX1BZQklORF9JTlNUQUxMX01PRFVMRQo+Cj4gLS0KPiAyLjQ3LjMKPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
