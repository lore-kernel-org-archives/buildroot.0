Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77F9C3601E
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 06:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70EB441222;
	Thu,  3 Apr 2025 06:48:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2zsQE8jmBX6o; Thu,  3 Apr 2025 06:47:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A28474127B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A28474127B;
	Thu,  3 Apr 2025 06:47:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ABDB0117
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 06:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DD1C400AB
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 06:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GXMO9DRjNKmI for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 06:47:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3DFB6401B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DFB6401B7
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DFB6401B7
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 06:47:56 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so282858f8f.3
 for <buildroot@buildroot.org>; Wed, 02 Apr 2025 23:47:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743662874; x=1744267674;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WZwrOMMO9vKb0CD411X7VxneQP9tfVdP1ETR6maFkX8=;
 b=oJiXmUAMmadfv47clS6Z8g3iHZ28Mj9HlsOihQGAztuqroKr2tYjOaa/Vc6IGWJtsz
 E9EkqJKsumjfLNCRwJl2c2l71o8mOXKIf6/AWvHU/RtFelqj1pZRjNpi6Sw+XRVAJRre
 xDOEnvNgMCsY3RA/6jQj4gipeXwF4QCf1pnvlj7x8ZuDTjOXVXgZO4R/FediE4O55dUs
 9HpNV4aHhIS+Bvs9IwQrwDfYrBF5/758QPCQxl2UNhsUPAR9nuwVeLtQkuxdgtGFh9BG
 kzusPa2Wy6zW5xs43gtCkrude1jMZWVCeVSDlQhD+09UhKlPm2DmrWL+LGk9Gduwu6F8
 fYQg==
X-Gm-Message-State: AOJu0YwxYpjDxsJm3MTzdD8tUUPoboLr85TuBBCpeO9wXayx0Ke1SCnt
 LgvJ5bH8F9DILS7X20ChPa2urOPFGkJxu+u9EgeT7MpkCAcrqeXuq6oMCW9ZokPQvKpMRTK0tiI
 j
X-Gm-Gg: ASbGnctH7PZEJz3r55QNhutN1MR+vMLXxTLfvV2pPJlB87xhbhGRLpJdDPz1U/xsyPH
 ak3kiPwwxlC8xhbN453K535a7PruXaltGfcduPEJX9HNmj9/zkknT5cbQXReJT+1WLh2maUmZ/s
 DJVa6T4pQr025w8x8ih3sPuqQBGRZppYOS4Y1LkldOxxrd3D43SMbbhmwm52CWIegpQWKlxy+NJ
 cXMlxUFrs+Vj+nBeOUb681SaoILCoou5VsTRva3XEG925vkZOt+ns7lx8cUFNiDLweG5F8DOEsa
 VoAXIa2GkXHuD/vJ9k/FwuWpdFdzWRkar+efHmcuEvdJV+eOhSyzlrEGSAea55QPUeW7YGITXO4
 2jaxzhxyMkhRE/DZCJG+3cZSTzzhj1Kf5Lms5YbpVKmc=
X-Google-Smtp-Source: AGHT+IFL88P33dClTwtV2ts1/XyMUMfHwhNiPXh25cekIFqPfzqRcHMl/CFV34krq8Lu3B9l3qGOuA==
X-Received: by 2002:a05:6000:2913:b0:391:4674:b136 with SMTP id
 ffacd0b85a97d-39c120e21famr15883456f8f.29.1743662874322; 
 Wed, 02 Apr 2025 23:47:54 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c30096401sm910740f8f.1.2025.04.02.23.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 23:47:54 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Thu,  3 Apr 2025 08:47:50 +0200
Message-ID: <20250403064750.116910-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1743662874; x=1744267674; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WZwrOMMO9vKb0CD411X7VxneQP9tfVdP1ETR6maFkX8=;
 b=QX+NTjtoMDPp8GJzXqUyv+8/g1XeYlaaez3T3voCKDXVz1vH3CP/CV0yktI+e7GCN3
 UD8Ufm0SouxwpycRj50MKkMsTM/C+S5oyvgQqhM+kReC81QxNmmNX+TYuQURvvLfBBg+
 GWmnroDjbJX7by0wLTxlEtFTOkVga4cmXyYiI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=QX+NTjto
Subject: [Buildroot] [PATCH] support/download/svn: use 'svn info' whith
 LC_ALL=C
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VXNlIHRoZSAnQycgbG9jYWxlIHdoZW4gcmV0cmlldmluZyB0aGUgZGF0ZSBvZiB0aGUgbGFzdCBj
aGFuZ2UgdXNpbmcKJ3N2biBpbmZvJyBzaW5jZSB0aGUgc3ZuIGRvd25sb2FkIGhlbHBlciBzY3Jp
cHQgZXhwZWN0CiJMYXN0IENoYW5nZWQgRGF0ZSIgc3RyaW5nLgoKSWYgYW5vdGhlciBsb2NhbGUg
aXMgdXNlZCwgdGhlICdkYXRlJyBpcyBlbXB0eSBzbyB0aGUgZ2VuZXJhdGVkCmFyY2hpdmUgKGJ5
IG1rX3Rhcl9neikgd2lsbCBub3QgbWF0Y2ggdGhlIGV4cGVjdGVkIGhhc2ggc2luY2UKdGhlIGZp
bGUgdGltZXN0YW1wIGlzIG5vdCBzZXQgcHJvcGVybHkuCgpJZiBMQU5HPWZyX0ZSLlVURi04IGlz
IGRlZmluZWQgaW4gdGhlIGhvc3Qgc3lzdGVtLCBzdm4gcHJpbnQgc29tZQoiRnJlbmNoIGVuY3J5
cHRlZCIgdGV4dDoKCiAgZXZhbCBzdm4gLS1ub24taW50ZXJhY3RpdmUgLS1jb25maWctb3B0aW9u
IHNlcnZlcnM6Z2xvYmFsOmh0dHAtdGltZW91dD0xMCBpbmZvICcnXCcnaHR0cHM6Ly9zdm4uY29k
ZS5zZi5uZXQvcC94bWxycGMtYy9jb2RlL2FkdmFuY2VkQHIzMTc2J1wnJycKICAuLi4KICBEYXRl
IGRlIGxhIGRlcm5pw6hyZSBtb2RpZmljYXRpb246IDIwMjMtMDktMDIgMTk6MTM6MzUgKzAyMDAg
KHNhbS4gMDIgc2VwdC4gMjAyMykKCmRpZmZvc2NvcGUgY29uZmlybSB0aGF0IHRoZSBmaWxlIHRp
bWVzdGFtcCBpcyBub3Qgc2V0IGNvcnJlY3RseQppbiB0aGUgZ2VuZXJhdGVkIGFyY2hpdmU6Cgok
IGRpZmZvc2NvcGUgTk9LL2xpYnhtbHJwYy1yMzE3Ni1zdm41LnRhci5neiBPSy9saWJ4bWxycGMt
cjMxNzYtc3ZuNS50YXIuZ3oKLS0tIE5PSy9saWJ4bWxycGMtcjMxNzYtc3ZuNS50YXIuZ3oKKysr
IE9LL2xpYnhtbHJwYy1yMzE3Ni1zdm41LnRhci5negrilJzilIDilIAgbGlieG1scnBjLXIzMTc2
LXN2bjUudGFyCuKUgiDilJzilIDilIAgZmlsZSBsaXN0CuKUgiDilIIgQEAgLTEsNjI2ICsxLDYy
NiBAQArilIIg4pSCIC0tcnctci0tci0tICAgMCAgICAgICAgMCAgICAgICAgMCAgICAgNjkzNyAy
MDI1LTA0LTAyIDAwOjAwOjAwLjAwMDAwMCBsaWJ4bWxycGMtcjMxNzYvR05VbWFrZWZpbGUK4pSC
IOKUgiArLXJ3LXItLXItLSAgIDAgICAgICAgIDAgICAgICAgIDAgICAgIDY5MzcgMjAyMy0wOS0w
MiAxNzoxMzozNS4wMDAwMDAgbGlieG1scnBjLXIzMTc2L0dOVW1ha2VmaWxlCgpGaXggdGhpcyBp
c3N1ZSB1c2luZyAnQycgbG9jYWxlOgoKICBMQ19BTEw9QyBldmFsIHN2biAtLW5vbi1pbnRlcmFj
dGl2ZSAtLWNvbmZpZy1vcHRpb24gc2VydmVyczpnbG9iYWw6aHR0cC10aW1lb3V0PTEwIGluZm8g
JydcJydodHRwczovL3N2bi5jb2RlLnNmLm5ldC9wL3htbHJwYy1jL2NvZGUvYWR2YW5jZWRAcjMx
NzYnXCcnJwogIC4uLgogIExhc3QgQ2hhbmdlZCBEYXRlOiAyMDIzLTA5LTAyIDE5OjEzOjM1ICsw
MjAwIChTYXQsIDAyIFNlcCAyMDIzKQoKRml4ZXM6IDg5ZjVlOTg5MzIzYWNlODE1YTMyZmNlZDI3
ZWFlZmVlMmY0NjY2ZGUKClNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3Vy
QHNtaWxlLmZyPgotLS0KIHN1cHBvcnQvZG93bmxvYWQvc3ZuIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvc3VwcG9ydC9k
b3dubG9hZC9zdm4gYi9zdXBwb3J0L2Rvd25sb2FkL3N2bgppbmRleCBmZjMzZjFmYTM5Li41NzZm
ZDQ4MzAzIDEwMDc1NQotLS0gYS9zdXBwb3J0L2Rvd25sb2FkL3N2bgorKysgYi9zdXBwb3J0L2Rv
d25sb2FkL3N2bgpAQCAtODEsNyArODEsNyBAQCBkb25lCiAjIEluIGNhc2UgdGhlcmUgaXMgYSBy
ZWRpcmVjdGlvbiAoZS5nLiBodHRwIC0+IGh0dHBzKSwganVzdCBrZWVwIHRoZQogIyBsYXN0IGxp
bmUgKHN2biBvdXRwdXRzIGV2ZXJ5dGhpbmcgb24gc3Rkb3V0KQogIyBzaGVsbGNoZWNrIGRpc2Fi
bGU9U0MyMDg2ICMgY3JlZHMgbWF5IGJlIGVtcHR5Ci1kYXRlPSIkKCBfcGxhaW5fc3ZuIGluZm8g
JHtjcmVkc30gIicke3VyaX1AJHtyZXZ9JyIgXAorZGF0ZT0iJCggTENfQUxMPUMgX3BsYWluX3N2
biBpbmZvICR7Y3JlZHN9ICInJHt1cml9QCR7cmV2fSciIFwKICAgICAgICAgfHNlZCAtciAtZSAn
L15MYXN0IENoYW5nZWQgRGF0ZTogLyFkOyBzLy8vJwogICAgICAgICkiCiAKLS0gCjIuNDkuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
