Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38CEC3DA5D
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 09:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9456160607;
	Thu, 25 Jul 2024 09:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GWwdZcQEHQYu; Thu, 25 Jul 2024 09:43:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F3A560851
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F3A560851;
	Thu, 25 Jul 2024 09:43:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B36A1BF2C2
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 09:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9728060851
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 09:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SwpCzs5bSXg0 for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 09:43:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A464260607
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A464260607
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A464260607
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 09:43:27 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-427d2cc1c4eso4985795e9.1
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 02:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721900605; x=1722505405;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jF5xsi4UC0oex0ODzED9kYNcHVpXNi9vJnemmLyBcA0=;
 b=D+1SHbuViaHw4lWkrK/DDZhf2AfcC7PIkEXh0nJ+z1F+ImeUfp76po4jfC/nO4kSON
 JElt7Ix7ihO9wBSkQRsl/lhV8DLmfYa4RJNDxuKuNBZypp3wkMrMtORAG94B6/XSmLWE
 q08bRnfpJqPL4ILphKXU6W0Zr3wQWsnla+oP1CjdZxphXGxWfhHC+XcqHFOIQ6WPrOVM
 M/4oPD0uelm8l7zVPgg1D8ARSC868QeZ84HxH71ocAn4uW6AB3hLuEskea7wUBxXJXms
 zpNt/APuOEaj++CvczN7GT1Su0dXYYS8RlbB4IeVPI+4ue1VhKEWDy62W1rj+xpJz6H7
 K+HQ==
X-Gm-Message-State: AOJu0YwjtKBOK22LmsPyQjcischo6B+AyCtLa32CmxwDy3XUNn2AIU+X
 EqcPvyyU3HY/7vv4zWIznWIHBZw6Wkp8AdG1ThpVFXMBASBQ9FS4oNzb+Ni3ecI=
X-Google-Smtp-Source: AGHT+IHoyjdOqBzf7R4WKY+L1QWuQ7Yzm17ihN1yvOWEJmYHMBNC8UhdRR2cqBXNvHrzx1sC6s1ORg==
X-Received: by 2002:a05:600c:474a:b0:426:6960:34b2 with SMTP id
 5b1f17b1804b1-4280579e00bmr11082415e9.33.1721900604976; 
 Thu, 25 Jul 2024 02:43:24 -0700 (PDT)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367c0889sm1567507f8f.22.2024.07.25.02.43.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jul 2024 02:43:24 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 25 Jul 2024 11:43:23 +0200
Message-Id: <D2YITL40TOEJ.98932ZGHH1A9@gmail.com>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.18.1-0-gaa8319bc591f
References: <20240723212011.23048-1-gael.portay@rtone.fr>
 <20240723212011.23048-2-gael.portay@rtone.fr>
 <20240724182122.6a1f75ee@windsurf> <D2YGQXWLNLWG.2S6K4TCJ7EDN6@gmail.com>
 <20240725101027.77f7b4e4@windsurf>
In-Reply-To: <20240725101027.77f7b4e4@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721900605; x=1722505405; darn=buildroot.org;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jF5xsi4UC0oex0ODzED9kYNcHVpXNi9vJnemmLyBcA0=;
 b=kZABwBucCIBL+UvCuYdFNGqJ4ElZ4lS4TSGeQm40nlss7M+xZuCXylWuBxIsUFEGpT
 /6bw6eWXOXVilUjg1L4I/ykwfZadzqv3o+7PHYvJldmMworqvY0DmBTQilZqxunpp64G
 mNACMKs5Inxt6ExJudNs4Fpp629b2ZWGAvBILtbEMr592Kc2JXhNywnpqGbrPatY6znN
 M4LhQk6Gg6xEVgJFE7YNXTrUG1nzeSU6ZaThQqcRJ4n3Y7+xs9CWUj2Z8v4sjTE3OBnD
 4Q1l5rkOmu0mNCYm4quYNt/+wzEofi0h4Z+YryiwuBOXjt9KNSk644d9uo2QHOeRGTCD
 J7eA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kZABwBuc
Subject: Re: [Buildroot] [PATCH 1/2] package/rpi-utils: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>, Mahyar
 Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzLAoKT24gVGh1IEp1bCAyNSwgMjAyNCBhdCAxMDoxMCBBTSBDRVNULCBUaG9tYXMgUGV0
YXp6b25pIHdyb3RlOgo+IFdlbGwsIHlvdXIgcGF0Y2ggd2FzIG5vdCBpbmNsdWRpbmcgcGFja2Fn
ZS9ycGktdXRpbHMvQ29uZmlnLmluLCBzbyB0aGUKPiBvcHRpb24gQlIyX1BBQ0tBR0VfUlBJX1VU
SUxTIGRvZXMgbm90IGV4aXN0LiBQZXJoYXBzIHdoeSBpdCBnZXRzCj4gc2tpcHBlZD8KPgoKU28g
dGhlcmUgaXMgYSBidWlsZCBpc3N1ZSB3aXRoIHRoZSB1Y2xpYmMgdG9vbGNoYWlucyBiZWNhdXNl
IG9mCnJlYWxsb2NhcnJheSgpLgoKCWdwb3J0YXlAYXJjaGxpbnV4IH4vc3JjL2J1aWxkcm9vdCAk
IHV0aWxzL3Rlc3QtcGtnIC1wIHJwaS11dGlscwoJICAgICAgICAgICAgICAgICAgICBib290bGlu
LWFybXY1LXVjbGliYyBbMS82XTogRkFJTEVECgkgICAgICAgICAgICAgICAgICAgICBib290bGlu
LWFybXY3LWdsaWJjIFsyLzZdOiBPSwoJICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tYXJtdjdt
LXVjbGliYyBbMy82XTogU0tJUFBFRAoJICAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi14ODYt
NjQtbXVzbCBbNC82XTogT0sKCSAgICAgICAgICAgICAgICAgICAgICBici1hcm0tZnVsbC1zdGF0
aWMgWzUvNl06IFNLSVBQRUQKCSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYXJtLWFhcmNo
NjQgWzYvNl06IE9LCgpTZWU6CgoJL2hvbWUvZ3BvcnRheS9ici10ZXN0LXBrZy9ib290bGluLWFy
bXY1LXVjbGliYy9idWlsZC9ycGktdXRpbHMtYTFkNTIyZjBmMWI1MDg1OGE0NGZhYzgwNTIzYTJi
ZDgwMDk4ZTc4OS9waW5jdHJsL3BpbmN0cmwuYzogSW4gZnVuY3Rpb24g4oCYZG9fZ3Bpb19wb2xs
X2FkZOKAmToKCS9ob21lL2dwb3J0YXkvYnItdGVzdC1wa2cvYm9vdGxpbi1hcm12NS11Y2xpYmMv
YnVpbGQvcnBpLXV0aWxzLWExZDUyMmYwZjFiNTA4NThhNDRmYWM4MDUyM2EyYmQ4MDA5OGU3ODkv
cGluY3RybC9waW5jdHJsLmM6MjY4OjE4OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2Yg
ZnVuY3Rpb24g4oCYcmVhbGxvY2FycmF54oCZIFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRl
Y2xhcmF0aW9uXQoJICAyNjggfCAgICAgcG9sbF9ncGlvcyA9IHJlYWxsb2NhcnJheShwb2xsX2dw
aW9zLCBudW1fcG9sbF9ncGlvcyArIDEsCgkgICAgICB8ICAgICAgICAgICAgICAgICAgXn5+fn5+
fn5+fn5+CgkvaG9tZS9ncG9ydGF5L2JyLXRlc3QtcGtnL2Jvb3RsaW4tYXJtdjUtdWNsaWJjL2J1
aWxkL3JwaS11dGlscy1hMWQ1MjJmMGYxYjUwODU4YTQ0ZmFjODA1MjNhMmJkODAwOThlNzg5L3Bp
bmN0cmwvcGluY3RybC5jOjI2ODoxNjogZXJyb3I6IGFzc2lnbm1lbnQgdG8g4oCYc3RydWN0IHBv
bGxfZ3Bpb19zdGF0ZSAq4oCZIGZyb20g4oCYaW504oCZIG1ha2VzIHBvaW50ZXIgZnJvbSBpbnRl
Z2VyIHdpdGhvdXQgYSBjYXN0IFstV2Vycm9yPWludC1jb252ZXJzaW9uXQoJICAyNjggfCAgICAg
cG9sbF9ncGlvcyA9IHJlYWxsb2NhcnJheShwb2xsX2dwaW9zLCBudW1fcG9sbF9ncGlvcyArIDEs
CgkgICAgICB8ICAgICAgICAgICAgICAgIF4KCUluIGZ1bmN0aW9uIOKAmGdlbmNtZOKAmSwKCSAg
ICBpbmxpbmVkIGZyb20g4oCYbWFpbuKAmSBhdCAvaG9tZS9ncG9ydGF5L2JyLXRlc3QtcGtnL2Jv
b3RsaW4tYXJtdjUtdWNsaWJjL2J1aWxkL3JwaS11dGlscy1hMWQ1MjJmMGYxYjUwODU4YTQ0ZmFj
ODA1MjNhMmJkODAwOThlNzg5L3ZjZ2VuY21kL3ZjZ2VuY21kLmM6MTUyOjE0OgoJL2hvbWUvZ3Bv
cnRheS9ici10ZXN0LXBrZy9ib290bGluLWFybXY1LXVjbGliYy9idWlsZC9ycGktdXRpbHMtYTFk
NTIyZjBmMWI1MDg1OGE0NGZhYzgwNTIzYTJiZDgwMDk4ZTc4OS92Y2dlbmNtZC92Y2dlbmNtZC5j
OjEwOTo0OiB3YXJuaW5nOiDigJhzdHJuY2F04oCZIHNwZWNpZmllZCBib3VuZCAxMDI0IGVxdWFs
cyBkZXN0aW5hdGlvbiBzaXplIFstV3N0cmluZ29wLW92ZXJmbG93PV0KCSAgMTA5IHwgICAgc3Ry
bmNhdCAoICB+fn5+fn5+fn5+CgpEbyB5b3Ugd2FudCBtZSB0byBtYWtlIGEgcGF0Y2g/IG9yIHdv
cmtzIGFyb3VuZCBmb3IgaXQgdXNpbmcgS2NvbmZpZz8KCgljb25maWcgQlIyX1BBQ0tBR0VfUlBJ
X1VUSUxTCgkJKC4uLikKCQlkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX1VTRVNfVUNMSUJDICMg
bm8gcmVhbGxvY2FycmF5CgoJY29tbWVudCAicnBpLXV0aWxzIG5lZWRzIGEgZ2xpYmMgb3IgbXVz
bCB0b29sY2hhaW4gdy8gdGhyZWFkcyIKCSAgICAgICAgZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlO
X1VTRVNfVUNMSUJDCgpSZWdhcmRzLApHYcOrbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
