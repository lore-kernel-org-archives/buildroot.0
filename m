Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F276EC0219D
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 14:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8764861ADA;
	Thu, 13 Feb 2025 14:16:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b94feBaS7o0m; Thu, 13 Feb 2025 14:16:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A694861AE2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A694861AE2;
	Thu, 13 Feb 2025 14:16:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CAB0199
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 14:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 307FB61ADA
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 14:16:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8A3ZlPoebwVW for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 14:16:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 686D06119D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 686D06119D
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 686D06119D
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 14:16:25 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5450475df04so910504e87.0
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 06:16:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739456183; x=1740060983;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3UI0j+DJmnCKQNCNXymCtYgOTaCDRdiS3KH+BVAwUD8=;
 b=MJ7aNFDsF2+xTNF87f9vfImhFctZlVVWAtOkJehtzXCiPXjUJIJlqYN53xXxyPcJ9Q
 up5V4r5uOgu/G8KAIJBdkLwTRY2RekTe8vin1Jpm0PVL7L2cVfAty2W3Z6uO0Fa2dTi1
 +TlTBha5HBAfWp/16asJ25VA27F+TdimGxQJZtg14PGLkoI9F75l0n3O/UB3Ctg/bCWl
 R+XZI7hFyYEWz6tP025hzQ7A2PlN/Te1ip4IqTebWlV3zOrLGxPWNRFcAjkbygZrd9b8
 fejF6gA+M6F3iz6m8Hchlikt7Cxag1LmnX/mg660pQ9U/61wYAJ1Oeqqtpz24lDZAZwh
 4ttg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWriJUPSEL43tGnnrwpeME91Dj6iEK2jBu0ETvs1zASL9te0t8eggNcKK4TbrBG+4XwCc7MGJ5mD8M=@buildroot.org
X-Gm-Message-State: AOJu0YxOZE1KZ1Khnz/KLE2VC1h/BrjmuGgQ9krP36hU9XKnIE+r3RFj
 FCLEx+8YKCdJ6FpS+2Ng7Kz0JnUGmuH9Aaktf1MD5TAQUU8L21XewIyBSJDGx4u9NKGlq4JHl4+
 /iqlerOxS7oMhY21YGIgpkXE6BZU=
X-Gm-Gg: ASbGncux8FKWuw9FSCn3jYyCdf7ps8X+Pj0rAoWqVFno9VCijVzPBaOa9QE2c2DyLHZ
 b4oxHl3XNJ0Q9ilSksACMYGjkb2njZxf81sPCWA7gg7XedKQcfW26fZx8bjsghHmb1X5qT3lm+w
 ==
X-Google-Smtp-Source: AGHT+IG0O741SXbv/jZ4f6YYEDB6D7n71cGnRVkRKX8ZX3Nl5QAUz56CxrU25Tt5EpFMIM6zr+gAQjY3cdMLngsvy0g=
X-Received: by 2002:a05:6512:3b2c:b0:545:95b:a335 with SMTP id
 2adb3069b0e04-5451810cb35mr2472850e87.14.1739456181441; Thu, 13 Feb 2025
 06:16:21 -0800 (PST)
MIME-Version: 1.0
References: <20250212135027.759121-1-fancp2007@gmail.com>
 <87tt8znsuq.fsf@tarshish>
 <30ddb8d5-72c7-475c-a02e-6b9160cbaae9@gmx.de>
 <CAFkzVZYXo0EALs-dV=VgnSYhOh28YT9wip99UVutHcuesEfw2g@mail.gmail.com>
 <CA+R_depGhKXfGn2BUxGd+HkiWgY4ip2ZAm5ObwWJA4B6Bh4GpA@mail.gmail.com>
 <CAFkzVZaAP3iZRZf0e072CQgHiTiTrdL-ndTV9JWBsfYpy2dhYA@mail.gmail.com>
In-Reply-To: <CAFkzVZaAP3iZRZf0e072CQgHiTiTrdL-ndTV9JWBsfYpy2dhYA@mail.gmail.com>
From: Scott Fan <fancp2007@gmail.com>
Date: Thu, 13 Feb 2025 22:16:07 +0800
X-Gm-Features: AWEUYZmaVWTsXOzVJteQvChjG_2l_2PiSM6f8DHwYSEmQ4ifNvlf48zuHKbEs5U
Message-ID: <CAFkzVZaqmdnRsLOd1qbh65Qs=xESeZbe-p+MEVUafH7DCT9cog@mail.gmail.com>
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: Fiona Klute <fiona.klute@gmx.de>, Bernd Kuhls <bernd@kuhls.net>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739456183; x=1740060983; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3UI0j+DJmnCKQNCNXymCtYgOTaCDRdiS3KH+BVAwUD8=;
 b=fATKpiskt+6wCS4HMs5u2JUAPMa/PGFnczllgwVZ1HjVkba28LQSyStbUPZ8UY0qz4
 qhbYq7GeJlv+x6PEwam7y8C+NNwi5I56IjHIMESD0Yx9luUURpMuOjxV2s+NPaVi6vGn
 VRbuutSwTIJg1Uwa93e+vfjLy7zXDmz7khf0knfTf+/slNCADnXjUJTOHk5mjWIqYh+Y
 PzEc9306f+BCEswr65yauGNtzdT/mfu+mBJqT9t5DuYNyEKBOfG9JCn4HW4Uyv2QFCy4
 L6oKvb2ZkmuN9NaQ2g7QTq02jITVRB7rlMSLdYHimAFtf5w1viRUMLmFbwpmMZ8pMJ6k
 TfHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fATKpisk
Subject: Re: [Buildroot] [PATCH] package/sqlite: fix build issue since bump
 to 3.49.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpJIGFsc28gdGVzdGVkIHRoZSBmb2xsb3dpbmcgZGVmY29uZmlnOgokIGNhdCBkZWZjb25m
aWcKQlIyX3g4Nl82ND15CkJSMl9UT09MQ0hBSU5fQlVJTERST09UX0NYWD15CkJSMl9QQUNLQUdF
X05GU19VVElMUz15CgoKClNjb3R0IEZhbgoKT24gVGh1LCBGZWIgMTMsIDIwMjUgYXQgNDoxOeKA
r1BNIFNjb3R0IEZhbiA8ZmFuY3AyMDA3QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSwKPgo+IEkg
aGFkIHRlc3RlZCB0aGUgcGF0Y2ggdjIgd2l0aCB0aGUgZGVmY29uZmlnOgo+ICQgY2F0IGRlZmNv
bmZpZwo+IEJSMl9hYXJjaDY0PXkKPiBCUjJfVE9PTENIQUlOX0JVSUxEUk9PVF9DWFg9eQo+IEJS
Ml9QQUNLQUdFX05GU19VVElMUz15Cj4KPiBFdmVyeXRoaW5nIGlzIE9LLiBUaGUgInNxbGl0ZSIg
YW5kICJob3N0LXNxbGl0ZSIgdGFyZ2V0cyB0aGF0IHRoZQo+IG5mc191dGlscyBwYWNrYWdlIGRl
cGVuZHMgb24gYXJlIGJvdGggY29tcGlsZWQgYW5kIHBhc3NlZC4KPgo+Cj4gU2NvdHQgRmFuCj4K
PiBPbiBUaHUsIEZlYiAxMywgMjAyNSBhdCAyOjM54oCvUE0gUm95IEtvbGxlbiBTdmVuZHNlbgo+
IDxyb3lrb2xsZW5zdmVuZHNlbkBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IEhpLAo+ID4KPiA+
IEZpeGVzOgo+ID4gMjAyNS0wMi0xM1QwNjo0ODoxOCA+Pj4gc3FsaXRlIDMuNDkuMCBDb25maWd1
cmluZwo+ID4gLi4uCj4gPiAyMDI1LTAyLTEzVDA2OjQ4OjE5IEVycm9yOiBVbmtub3duIG9wdGlv
biAtLXRhcmdldAo+ID4KPiA+IFRlc3RlZC1CeTogUm95IEtvbGxlbiBTdmVuZHNlbiA8cm95a29s
bGVuc3ZlbmRzZW5AZ21haWwuY29tPgo+ID4KPiA+Cj4gPiB0b3IuIDEzLiBmZWIuIDIwMjUga2wu
IDA0OjU5IHNrcmV2IFNjb3R0IEZhbiA8ZmFuY3AyMDA3QGdtYWlsLmNvbT46Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
