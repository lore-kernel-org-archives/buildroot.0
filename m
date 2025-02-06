Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B105BC02199
	for <buildroot@archiver.kernel.org>; Thu,  6 Feb 2025 17:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D2796FAD2;
	Thu,  6 Feb 2025 17:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xjmB1EPOJsT8; Thu,  6 Feb 2025 17:33:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C8776FAE3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C8776FAE3;
	Thu,  6 Feb 2025 17:33:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1660AE2
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 17:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05FBE42818
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 17:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1SOusQiev0sf for <buildroot@buildroot.org>;
 Thu,  6 Feb 2025 17:33:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BA23542814
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA23542814
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA23542814
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 17:33:31 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3d0620158ffso3969795ab.3
 for <buildroot@buildroot.org>; Thu, 06 Feb 2025 09:33:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738863210; x=1739468010;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XJzOqPGGU7LjYHCk6li30khXNAweTToscOGAVljMbYg=;
 b=LZCGPXuuF/9Jd6qKze2ONf4rkrsWvUMlGE5kvPLwa1kPwxjyELsHvrUS6KE35RUOzx
 lqDGcztPYb+4WBbYVs+DjlXBNJ9/YGTckyTJI/Sc5/IZPq/7h9NpyEmPjjZoRIPtGesP
 dT+lsvxpumOO9ZZA96A+oUFR6ZDc+sthwe1ieUzctI12pm8ZmYqbmyzQtH664jHMv1av
 V2jGdoWHxGcxMD7kD4c7nDGfaOJSBA2LRWIF1g0L8gkpfZ8zCHY5tpudlFv+z3IGHKGx
 5AED9+ylNofGL1D0GDAGQjY12vGPUcndI940MqhMXyYQESohBiU0+pAa1i0FVzabbCdk
 1X1Q==
X-Gm-Message-State: AOJu0YzrWi4RIUsrbPHil5a+V8cKvbevdFm3LDRKiHTN90m2MEn32f2K
 LtRC/52XZvn97pxEMAzpyo/7OSPrWv9Hm8P/GKVjnMpbKPDFFkQb4rZEIw==
X-Gm-Gg: ASbGnctDG6HGRPxYgKqeqy17NDbtCj6dxy1RdZbaEBkvd7afxKpaL+5kM3zop9VJg5I
 OjPhTQkGbcIDpNEN1lg4tuyy7Cw3s3VvbU84rGAcIXXcLE/EaJhlS1zeyL0QqNQlFApdSWxw16u
 Y4l+Ll1boJdxssZO7BOvPVR/IBpXJsoegWRBeem4y7WBr6Lc/e8RyWYES9qLoufKdbq+pfIU2oe
 q7fBxDYqA2khP1PJSaJGqEEOdCduwbC/zt8SVv/v8qUyj8okm2xzQVYpNn5MAw1WhaJJy2RQh/J
 vCO3VssCZ7zGeB7PwMZ0xPQ1b1xZ1oEOUCsalAdruQvjmTJ+0kkDjXo1NHgJIz64kw==
X-Google-Smtp-Source: AGHT+IH03qspdRwSN3JEzYagovyrLLgQKfu/CoAFduSNULwRsA4gvTPiro9JGUJ2/F0/umKzFtX7/A==
X-Received: by 2002:a05:6e02:1a69:b0:3d0:24c0:bd45 with SMTP id
 e9e14a558f8ab-3d04f97ba77mr69197005ab.20.1738863210275; 
 Thu, 06 Feb 2025 09:33:30 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4eccfacf5adsm351669173.97.2025.02.06.09.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 09:33:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Thu,  6 Feb 2025 10:33:28 -0700
Message-Id: <20250206173328.1446767-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738863210; x=1739468010; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XJzOqPGGU7LjYHCk6li30khXNAweTToscOGAVljMbYg=;
 b=QF0Ci5lyDsHCqnRX03RZR3QoZtBM06q6DDGCr/3k7V0eSg9u970H1irtWAb9XE29jS
 Gl2KQegPWDe30jVbs0F9/Tynmw2+MwKj6ebvSnsyS7HVpRPrOWXLSpX5VAjo5NNqlApu
 L3K8PwAGAPrGQbuUDpdcVLOlxyvDqH86k9dKURf+bQKmxbdb6JtFuTiUbcTWjKnB2uD9
 5jK8kILn8o+FNAAWhfBW7h74gBDIL5fJvjnYChpIDWoWfPbnv2ndBBPH4JRailM47zKl
 bwSilrAP6SZfMcLXevch6vquN1A4e93vtvtnUgWyGNj5XKV5vDjjbfhNJuBHNRGKl2Uo
 vemA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QF0Ci5ly
Subject: [Buildroot] [PATCH 1/1] package/qemu: fix build on hosts with newer
 glibc
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

QWRkIGEgcGF0Y2ggZml4aW5nIGJ1aWxkcyBvbiBuZXdlciBnbGliYyB2ZXJzaW9ucy4KCkZpeGVz
OgouLi9saW51eC11c2VyL3N5c2NhbGwuYzozNjI6ODogZXJyb3I6IHJlZGVmaW5pdGlvbiBvZiDi
gJhzdHJ1Y3Qgc2NoZWRfYXR0cuKAmQogIDM2MiB8IHN0cnVjdCBzY2hlZF9hdHRyIHsKICAgICAg
fCAgICAgICAgXn5+fn5+fn5+fgpJbiBmaWxlIGluY2x1ZGVkIGZyb20gL3Vzci9pbmNsdWRlL2Jp
dHMvc2NoZWQuaDo2MywKICAgICAgICAgICAgICAgICBmcm9tIC91c3IvaW5jbHVkZS9zY2hlZC5o
OjQzLAogICAgICAgICAgICAgICAgIGZyb20gL3Vzci9pbmNsdWRlL3B0aHJlYWQuaDoyMiwKICAg
ICAgICAgICAgICAgICBmcm9tIC9ob21lL2J1aWxkcm9vdC9idWlsZHJvb3Qvb3V0cHV0L3Blci1w
YWNrYWdlL2hvc3QtcWVtdS9ob3N0L2luY2x1ZGUvZ2xpYi0yLjAvZ2xpYi9kZXByZWNhdGVkL2d0
aHJlYWQuaDoxMjYsCiAgICAgICAgICAgICAgICAgZnJvbSAvaG9tZS9idWlsZHJvb3QvYnVpbGRy
b290L291dHB1dC9wZXItcGFja2FnZS9ob3N0LXFlbXUvaG9zdC9pbmNsdWRlL2dsaWItMi4wL2ds
aWIuaDoxMTUsCiAgICAgICAgICAgICAgICAgZnJvbSAvaG9tZS9idWlsZHJvb3QvYnVpbGRyb290
L291dHB1dC9idWlsZC9ob3N0LXFlbXUtOS4yLjAvaW5jbHVkZS9nbGliLWNvbXBhdC5oOjMyLAog
ICAgICAgICAgICAgICAgIGZyb20gL2hvbWUvYnVpbGRyb290L2J1aWxkcm9vdC9vdXRwdXQvYnVp
bGQvaG9zdC1xZW11LTkuMi4wL2luY2x1ZGUvcWVtdS9vc2RlcC5oOjE2MSwKICAgICAgICAgICAg
ICAgICBmcm9tIC4uL2xpbnV4LXVzZXIvc3lzY2FsbC5jOjIwOgovdXNyL2luY2x1ZGUvbGludXgv
c2NoZWQvdHlwZXMuaDo5ODo4OiBub3RlOiBvcmlnaW5hbGx5IGRlZmluZWQgaGVyZQogICA5OCB8
IHN0cnVjdCBzY2hlZF9hdHRyIHsKICAgICAgfCAgICAgICAgXn5+fn5+fn5+fgoKU2lnbmVkLW9m
Zi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Ci0tLQogLi4u
ZWRfYXR0ci1Eby1ub3QtZGVmaW5lLWZvci1nbGliYy0yLjQxLnBhdGNoIHwgNDkgKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL3FlbXUvMDAwMy1zY2hlZF9hdHRyLURvLW5vdC1kZWZpbmUtZm9yLWds
aWJjLTIuNDEucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3FlbXUvMDAwMy1zY2hlZF9hdHRy
LURvLW5vdC1kZWZpbmUtZm9yLWdsaWJjLTIuNDEucGF0Y2ggYi9wYWNrYWdlL3FlbXUvMDAwMy1z
Y2hlZF9hdHRyLURvLW5vdC1kZWZpbmUtZm9yLWdsaWJjLTIuNDEucGF0Y2gKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMTFlZGMyN2MyZgotLS0gL2Rldi9udWxsCisrKyBi
L3BhY2thZ2UvcWVtdS8wMDAzLXNjaGVkX2F0dHItRG8tbm90LWRlZmluZS1mb3ItZ2xpYmMtMi40
MS5wYXRjaApAQCAtMCwwICsxLDQ5IEBACitGcm9tIDY2YjE5MjZkNzJlZjUxZDRkNTlkMGY5NzA2
MWYyNmE3NTY1MWUyNjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBLaGVtIFJhaiA8
cmFqLmtoZW1AZ21haWwuY29tPgorRGF0ZTogRnJpLCAxMSBPY3QgMjAyNCAxMjozMTo0MCAtMDcw
MAorU3ViamVjdDogW1BBVENIXSBzY2hlZF9hdHRyOiBEbyBub3QgZGVmaW5lIGZvciBnbGliYyA+
PSAyLjQxCisKK2dsaWJjIDIuNDErIGhhcyBhZGRlZCBbMV0gZGVmaW5pdGlvbnMgZm9yIHNjaGVk
X3NldGF0dHIgYW5kIHNjaGVkX2dldGF0dHIgZnVuY3Rpb25zCithbmQgc3RydWN0IHNjaGVkX2F0
dHIuIFRoZXJlZm9yZSwgaXQgbmVlZHMgdG8gYmUgY2hlY2tlZCBmb3IgaGVyZSBhcyB3ZWxsIGJl
Zm9yZQorZGVmaW5pbmcgc2NoZWRfYXR0cgorCitEZWZpbmUgc2NoZWRfYXR0ciBjb25kaXRpb25h
bGx5IG9uIFNDSEVEX0FUVFJfU0laRV9WRVIwCisKK0ZpeGVzIGJ1aWxkcyB3aXRoIGdsaWJjL3Ry
dW5rCisKK1sxXSBodHRwczovL3NvdXJjZXdhcmUub3JnL2dpdC8/cD1nbGliYy5naXQ7YT1jb21t
aXRkaWZmO2g9MjE1NzFjYTBkNzAzMDI5MDljZjcyNzA3YjJhNzczNmNmMTIxOTBhMDtocD0yOThi
YzQ4OGZkYzA0N2RhMzc0ODJmNDAwMzAyM2NiOWFkZWY3OGY4CisKK1NpZ25lZC1vZmYtYnk6IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CitDYzogTGF1cmVudCBWaXZpZXIgPGxhdXJlbnRA
dml2aWVyLmV1PgorQ2M6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+CitTaWdu
ZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KK1Vw
c3RyZWFtOiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvcWVtdS1kZXZlbC9w
YXRjaC8yMDI0MTAxMTE5MzE0MC4xMDQ3NjQ4LTEtcmFqLmtoZW1AZ21haWwuY29tLworLS0tCisg
bGludXgtdXNlci9zeXNjYWxsLmMgfCA0ICsrKy0KKyAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYgLS1naXQgYS9saW51eC11c2VyL3N5c2NhbGwu
YyBiL2xpbnV4LXVzZXIvc3lzY2FsbC5jCitpbmRleCAxY2U0Yzc5Nzg0Li5hNDA3ZDRhMDIzIDEw
MDY0NAorLS0tIGEvbGludXgtdXNlci9zeXNjYWxsLmMKKysrKyBiL2xpbnV4LXVzZXIvc3lzY2Fs
bC5jCitAQCAtMzU4LDcgKzM1OCw4IEBAIF9zeXNjYWxsMyhpbnQsIHN5c19zY2hlZF9nZXRhZmZp
bml0eSwgcGlkX3QsIHBpZCwgdW5zaWduZWQgaW50LCBsZW4sCisgI2RlZmluZSBfX05SX3N5c19z
Y2hlZF9zZXRhZmZpbml0eSBfX05SX3NjaGVkX3NldGFmZmluaXR5CisgX3N5c2NhbGwzKGludCwg
c3lzX3NjaGVkX3NldGFmZmluaXR5LCBwaWRfdCwgcGlkLCB1bnNpZ25lZCBpbnQsIGxlbiwKKyAg
ICAgICAgICAgdW5zaWduZWQgbG9uZyAqLCB1c2VyX21hc2tfcHRyKTsKKy0vKiBzY2hlZF9hdHRy
IGlzIG5vdCBkZWZpbmVkIGluIGdsaWJjICovCisrLyogc2NoZWRfYXR0ciBpcyBub3QgZGVmaW5l
ZCBpbiBnbGliYyA8IDIuNDEgKi8KKysjaWZuZGVmIFNDSEVEX0FUVFJfU0laRV9WRVIwCisgc3Ry
dWN0IHNjaGVkX2F0dHIgeworICAgICB1aW50MzJfdCBzaXplOworICAgICB1aW50MzJfdCBzY2hl
ZF9wb2xpY3k7CitAQCAtMzcxLDYgKzM3Miw3IEBAIHN0cnVjdCBzY2hlZF9hdHRyIHsKKyAgICAg
dWludDMyX3Qgc2NoZWRfdXRpbF9taW47CisgICAgIHVpbnQzMl90IHNjaGVkX3V0aWxfbWF4Owor
IH07CisrI2VuZGlmCisgI2RlZmluZSBfX05SX3N5c19zY2hlZF9nZXRhdHRyIF9fTlJfc2NoZWRf
Z2V0YXR0cgorIF9zeXNjYWxsNChpbnQsIHN5c19zY2hlZF9nZXRhdHRyLCBwaWRfdCwgcGlkLCBz
dHJ1Y3Qgc2NoZWRfYXR0ciAqLCBhdHRyLAorICAgICAgICAgICB1bnNpZ25lZCBpbnQsIHNpemUs
IHVuc2lnbmVkIGludCwgZmxhZ3MpOworLS0gCisyLjM0LjEKKwotLSAKMi4zNC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
