Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5DDC61CE7
	for <buildroot@archiver.kernel.org>; Wed, 11 Jun 2025 10:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D35584237F;
	Wed, 11 Jun 2025 10:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ehqcl41WCtkM; Wed, 11 Jun 2025 10:09:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0879A42379
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0879A42379;
	Wed, 11 Jun 2025 10:09:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33877237
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 10:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28FAE42379
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 10:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nwy5i1QuWdlo for <buildroot@buildroot.org>;
 Wed, 11 Jun 2025 10:09:40 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=nunog@fr24.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3E84A42363
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E84A42363
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E84A42363
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 10:09:40 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a51481a598so3733856f8f.3
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 03:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749636578; x=1750241378;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2G8i6A4pv14EjHL+NjnS+F95CNxI4dNu0Xq8ZOl7xyc=;
 b=DuUEqQaLo4GGREtfwAEV+5lz/gczaOJIm7+crujA6c1fPqsHa8rXeA+T0IbPXcL306
 yEWV5ilJSecFbL+Q7lMlYTGFF72bzyf5Gphhp3bXEPGK0wuQcp9ME/s5ezmbZ7f4fK+d
 JlkjhJo5CJC9/qTngfGrt7cvZltfN5gM9jIfd9I0ImyXv6O3TvqlR3uvQofQpXasMq0n
 Lh1aHdLei8SKN9a0N5dzo4VCTfaW0+rMFeAhSn0TYUK6l0wef3ZsbTIpZ2AEnzftXa+/
 wKnYgrxN0S7qWESOTUc280gA2N/kkKL4BbnihWzt4OBl4TmPQGQ7y7KzTWG5RDGh5o2q
 KcSQ==
X-Gm-Message-State: AOJu0YzFy5fiiU57+sU0jehpCyWSeflMxxfExGxlAHirLMo6M8rt1tk9
 rTWRTEYtWWCBwvBU/3BYkkWyi8O9YdMu/6R/O6zRtaXIQP5QbB0KS07bdTIi/YBEGrTdI2ulfQG
 7K+IhVUg=
X-Gm-Gg: ASbGncupGLGqUP4CBaTMyFdBaQDztwcoVNkMQp4GtrYRb5PPPJMQa9tf3zoT3+KvWLD
 U7vmO1gnPL6486X0ZpwAfL8jxjKKgFL73306XEB9tfn+W3SRHG39MpWHVtJ2/IbMie/LAK1MasT
 bDlwJ62bZHRHL3RK4y0j1gR51pRLKxz9DEHh99uUqc/NBnAzNzZvsapjiVtHy4V2BFEGWX3tt4p
 RkgmCQQTWZNU2gVTmhvPptZLhYgfRFAuxY0ItqOGYJXQiLL1ig+rTDBvh03M4CvwusUljlzVHYy
 /a/yAAgV1rx+v+ELYGmAsrqZeJVGoLc5nDVjQ3ehc1UOlz5tATSTslO/OnS10iiqVEFO6hXxOLP
 oia4fDPVcqxwl1hc8/oR25H4=
X-Google-Smtp-Source: AGHT+IH3psP2RnkpJYtKpjBDyqmKyZYBVeNCySGoPy6hw57eFIIxHeJP0zhEUwM1eo7cBXg5MluPJQ==
X-Received: by 2002:a05:6000:4287:b0:3a4:f7db:6ff7 with SMTP id
 ffacd0b85a97d-3a558a5205dmr2276062f8f.52.1749636578221; 
 Wed, 11 Jun 2025 03:09:38 -0700 (PDT)
Received: from sky21.internal.fr24.com (dsl-191-233.bl27.telepac.pt.
 [176.79.191.233]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3a53229d9ddsm14648601f8f.4.2025.06.11.03.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 03:09:37 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Nuno=20Gon=C3=A7alves?= <nunog@fr24.com>
Date: Wed, 11 Jun 2025 11:08:56 +0100
Message-ID: <20250611100915.1562316-1-nunog@fr24.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fr24.com; s=google; t=1749636578; x=1750241378; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2G8i6A4pv14EjHL+NjnS+F95CNxI4dNu0Xq8ZOl7xyc=;
 b=ZYENb7L8WdNYoQB/O7ZD+k6uHaEzl1cb40FRjhELS4AZ8DwzkMxAkAYCMVPfTbcMCR
 bSmaH/Yc5yvxZYxa+s+/bIWsjSODx/oYJ2UoebvI9ogC5dT7Fg7U7k/ExMAc2ubB8UQc
 atTApB7und6uMwUsG6Wgpzxis6KxyGYS/hqhXsVkwbyEt71xMm25G6wiwN7TGQ2dP410
 KX4sH2IzeiSBc7iBKshfXez3eBsXHDb7rowXf86rxhpcU1KWJO0v6ZYNlbgFDbw9nMR6
 wjSZS8OxWNhwsD0Df4p1fh7n4v7/FER7RdL6uM1KYmieCbciMn8wcD2pl9mH8L4CH5A2
 QYYA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=fr24.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=fr24.com header.i=@fr24.com header.a=rsa-sha256
 header.s=google header.b=ZYENb7L8
Subject: [Buildroot] [PATCH V2] package/systemd: disable fchmodat2 as
 changes are not visible in fakeroot
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
From: =?utf-8?q?Nuno_Gon=C3=A7alves_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Nuno=20Gon=C3=A7alves?= <nunog@fr24.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hlbiBmY2htb2RhdDIgaXMgY2FsbGVkIGluIHN5c3RlbWQgdG1wZmlsZXMsIGl0c2VsZiBjYWxs
ZWQgYnkKZmFrZXJvb3RfdG1wZmlsZXMuc2gsIHRoZSBjaGFuZ2VzIHdpbGwgbm90IGJlIHZpc2li
bGUgaW5zaWRlIHRoZQpmYWtlcm9vdCwgbWFraW5nIHRoZSBjaGFuZ2VzIGxvc3QgZm9yIHRoZSBw
dXJwb3NlIG9mIHJvb3RmcyBmaWxlCnBlcm1pc3Npb25zLgoKVGhpcyB3b3VsZCBhZmZlY3QgYnVp
bGRzIHdoZW4gaG9zdCBrZXJuZWwgPj0gNi42LgoKU2lnbmVkLW9mZi1ieTogTnVubyBHb27Dp2Fs
dmVzIDxudW5vZ0BmcjI0LmNvbT4KLS0tCiAuLi4tYXMtY2hhbmdlcy1hcmUtbm90LXZpc2libGUt
aW4tZmFrZS5ocGF0Y2ggfCAzNiArKysrKysrKysrKysrKysrKysrCiBwYWNrYWdlL3N5c3RlbWQv
c3lzdGVtZC5tayAgICAgICAgICAgICAgICAgICAgfCAgNSArKysKIDIgZmlsZXMgY2hhbmdlZCwg
NDEgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvc3lzdGVtZC9ob3N0
LW9ubHktcGF0Y2hlcy8wMDAxLURpc2FibGUtZmNobW9kYXQyLWFzLWNoYW5nZXMtYXJlLW5vdC12
aXNpYmxlLWluLWZha2UuaHBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9zeXN0ZW1kL2hvc3Qt
b25seS1wYXRjaGVzLzAwMDEtRGlzYWJsZS1mY2htb2RhdDItYXMtY2hhbmdlcy1hcmUtbm90LXZp
c2libGUtaW4tZmFrZS5ocGF0Y2ggYi9wYWNrYWdlL3N5c3RlbWQvaG9zdC1vbmx5LXBhdGNoZXMv
MDAwMS1EaXNhYmxlLWZjaG1vZGF0Mi1hcy1jaGFuZ2VzLWFyZS1ub3QtdmlzaWJsZS1pbi1mYWtl
LmhwYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5mMTY3MzVkZjQ3
Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9zeXN0ZW1kL2hvc3Qtb25seS1wYXRjaGVzLzAw
MDEtRGlzYWJsZS1mY2htb2RhdDItYXMtY2hhbmdlcy1hcmUtbm90LXZpc2libGUtaW4tZmFrZS5o
cGF0Y2gKQEAgLTAsMCArMSwzNiBAQAorRnJvbSA3OGUzMWNjMDkzMWU1NjY3NzQyNjAwOTU3NDEx
MzI2Y2ZjZDljODNkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogPT9VVEYtOD9xP051
bm89MjBHb249QzM9QTdhbHZlcz89IDxudW5vZ0BmcjI0LmNvbT4KK0RhdGU6IFdlZCwgMTEgSnVu
IDIwMjUgMDk6NTE6NTAgKzAxMDAKK1N1YmplY3Q6IFtQQVRDSF0gRGlzYWJsZSBmY2htb2RhdDIg
YXMgY2hhbmdlcyBhcmUgbm90IHZpc2libGUgaW4gZmFrZXJvb3QKK01JTUUtVmVyc2lvbjogMS4w
CitDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJhbnNm
ZXItRW5jb2Rpbmc6IDhiaXQKKworV2hlbiBmY2htb2RhdDIgaXMgY2FsbGVkIGluIHN5c3RlbWQg
dG1wZmlsZXMsIGl0c2VsZiBjYWxsZWQgYnkKK2Zha2Vyb290X3RtcGZpbGVzLnNoLCB0aGUgY2hh
bmdlcyB3aWxsIG5vdCBiZSB2aXNpYmxlIGluc2lkZSB0aGUKK2Zha2Vyb290LCBtYWtpbmcgdGhl
IGNoYW5nZXMgbG9zdCBmb3IgdGhlIHB1cnBvc2Ugb2Ygcm9vdGZzIGZpbGUKK3Blcm1pc3Npb25z
LgorCitUaGlzIHdvdWxkIGFmZmVjdCBidWlsZHMgd2hlbiBob3N0IGtlcm5lbCA+PSA2LjYuCisK
K1NpZ25lZC1vZmYtYnk6IE51bm8gR29uw6dhbHZlcyA8bnVub2dAZnIyNC5jb20+CistLS0KKyBz
cmMvYmFzaWMvZnMtdXRpbC5jIHwgMiAtLQorIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygt
KQorCitkaWZmIC0tZ2l0IGEvc3JjL2Jhc2ljL2ZzLXV0aWwuYyBiL3NyYy9iYXNpYy9mcy11dGls
LmMKK2luZGV4IDA0ZjcyOTBjYzIuLjJjYTgwODA3OGUgMTAwNjQ0CistLS0gYS9zcmMvYmFzaWMv
ZnMtdXRpbC5jCisrKysgYi9zcmMvYmFzaWMvZnMtdXRpbC5jCitAQCAtMjk4LDggKzI5OCw2IEBA
IGludCBmY2htb2Rfb3BhdGgoaW50IGZkLCBtb2RlX3QgbSkgeworIAorICAgICAgICAgYXNzZXJ0
KGZkID49IDApOworIAorLSAgICAgICAgaWYgKGZjaG1vZGF0MihmZCwgIiIsIG0sIEFUX0VNUFRZ
X1BBVEgpID49IDApCistICAgICAgICAgICAgICAgIHJldHVybiAwOworICAgICAgICAgaWYgKCFJ
Tl9TRVQoZXJybm8sIEVOT1NZUywgRVBFUk0pKSAvKiBTb21lIGNvbnRhaW5lciBtYW5hZ2VycyBi
bG9jayB1bmtub3duIHN5c2NhbGxzIHdpdGggRVBFUk0gKi8KKyAgICAgICAgICAgICAgICAgcmV0
dXJuIC1lcnJubzsKKyAKKy0tIAorMi40My4wCisKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3lzdGVt
ZC9zeXN0ZW1kLm1rIGIvcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQubWsKaW5kZXggNzFmZTBkZTU1
MC4uNmZkMDM3ZTE0MCAxMDA2NDQKLS0tIGEvcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQubWsKKysr
IGIvcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQubWsKQEAgLTEwMzQsNiArMTAzNCwxMSBAQCBIT1NU
X1NZU1RFTURfTklOSkFfRU5WID0gREVTVERJUj0kKEhPU1RfRElSKQogIyAqIHRodXMgcmUtdHdl
YWsgcnBhdGggYWZ0ZXIgdGhlIGluc3RhbGxhdGlvbiBmb3IgYWxsIGJpbmFyaWVzIHRoYXQgbmVl
ZCBpdAogSE9TVF9TWVNURU1EX0hPU1RfVE9PTFMgPSBidXNjdGwgam91cm5hbGN0bCBzeXN0ZW1j
dGwgc3lzdGVtZC0qIHVkZXZhZG0KIAorZGVmaW5lIEhPU1RfU1lTVEVNRF9OT19GQ0hNT0RBVDIK
KwkkKEFQUExZX1BBVENIRVMpICQoQEQpIHBhY2thZ2Uvc3lzdGVtZC9ob3N0LW9ubHktcGF0Y2hl
cyAwMDAxLURpc2FibGUtZmNobW9kYXQyLWFzLWNoYW5nZXMtYXJlLW5vdC12aXNpYmxlLWluLWZh
a2UuaHBhdGNoCitlbmRlZgorSE9TVF9TWVNURU1EX1BPU1RfUEFUQ0hfSE9PS1MgKz0gSE9TVF9T
WVNURU1EX05PX0ZDSE1PREFUMgorCiBkZWZpbmUgSE9TVF9TWVNURU1EX0ZJWF9SUEFUSAogCWZv
ciBmIGluICQoYWRkcHJlZml4ICQoSE9TVF9ESVIpL2Jpbi8sJChIT1NUX1NZU1RFTURfSE9TVF9U
T09MUykpOyBkbyBcCiAJCVsgLWUgJCRmIF0gfHwgY29udGludWU7IFwKLS0gCjIuNDMuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
