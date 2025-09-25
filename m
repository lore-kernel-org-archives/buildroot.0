Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32536CAC5AE
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 01:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7B1783E4F;
	Thu, 25 Sep 2025 01:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XsvpbXWz2HSo; Thu, 25 Sep 2025 01:42:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12CE983E50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12CE983E50;
	Thu, 25 Sep 2025 01:42:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 32466199
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 01:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18AA361236
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 01:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WjhxL86_NCWy for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 01:42:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 542616122C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 542616122C
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 542616122C
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 01:42:34 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-77f605f22easo472037b3a.2
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 18:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758764553; x=1759369353;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=29sj6ojHQgHsvpWWdEyW4iN88/h8/DdKNbdKcXq7shA=;
 b=JBJOT9Lv6A2YfTLF7rGjP+NgvhH24jV582iHFKxK05qBOh7lN7lp6uP6IpKdeP/rqt
 YW3jo0GgT3RoLa02e2zDGJKeaM+h0Ct2ssre6rSAySoTsvWEOjWQ418BFJ8A5T15fzfl
 Cdh6s/WshONAr+WnZS664Jry9mNIpBflZLtwKUPVhTEJfGuv3Zi2BYOQGbNkIaNYqG+J
 /vLfoJ9somlHckRFx/qKTDr3EyEJiCGJwdFDNoX01SDUOeXp5TrQhdr7X26kx5oznJf1
 7xkRVDeauBzt7te27tKRt0Enw/qK6617i3J1Gd76ONVTL+gqZu5fyCg49rJf0Hy1WT5T
 s5YA==
X-Gm-Message-State: AOJu0Yz22rgr3wflMXdfXpbKhEkT0h4bKmilzN4jTsf748LNg8mR4adt
 FEjEaZTe40bLtmXzYU4OHcHAqdEy/hxnAs29wCdwsuEcdh3wV7GwcoAglWM0Wg==
X-Gm-Gg: ASbGncvN0MW2BzBWW5P/6e0NFTaIhuNHrIzlcPKvYvsHcrXmOOUxb50+5ZP+WoYSVfE
 +EkD6TtT2UZKjJr0g0uKzXg16ki0VQuF1Vz+QlFVcBKCnUBbsIB7b6z89boQjFDNwyK8aubvrTd
 hsYi/+sc2bFToJLUaMfcb2BUKX63nbgYwXjc7Sx7S8UR0iaFtOzwdnLF4KtZlXshBwj95RFpb6W
 7vgLn3TsEnpExnmANWirAI6MnVLVJKHEW/d8HQS2zy3rBYMWE/nOh+84kf0CfVVA3XBOKEnRTkQ
 Q+oTM/gUkVsLioYr9qQQBicBN0erwQD+5NG/dqDjrhON4onkng8NweQrxRo8lOYGOtAwg5F+0Tm
 dCzMjcSNVwkGBBIJb8A8=
X-Google-Smtp-Source: AGHT+IF/W6k70/VplzlR3G1S7g0T1MEUHiDWMaQP7BoLI+StjPinrJObHOpEh6ueorgwncyhQA9IMA==
X-Received: by 2002:a05:6a20:158d:b0:2bd:2798:7ae7 with SMTP id
 adf61e73a8af0-2e7cdda05e1mr1755393637.31.1758764553239; 
 Wed, 24 Sep 2025 18:42:33 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b57c5574197sm569746a12.33.2025.09.24.18.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 18:42:32 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
	Bernd Kuhls <bernd@kuhls.net>
Date: Thu, 25 Sep 2025 09:42:16 +0800
Message-ID: <20250925014217.1562831-2-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250925014217.1562831-1-fancp2007@gmail.com>
References: <20250925014217.1562831-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758764553; x=1759369353; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=29sj6ojHQgHsvpWWdEyW4iN88/h8/DdKNbdKcXq7shA=;
 b=NDXe7cPXr4ada0JF9ys1uBkgGCsMKijvyvqrz5HkHqz6S/nUzOAjwdPOlYeDaSCtQ7
 o7NoD+TIaBhL5hJkmWpo4qTdprM1KqCWujREG1gPO5/CSVSKYG2rOfUAA+Qr4zFO7UQh
 L5Gj2/zo8hLU0x/OffQjN3Upn00V+R8x927aoPjA1gY56/A17tpieEOpFaGMg0Buic1k
 KVzz+3bkXWDHf5dku3F2UO5FbexPbYSH/4Ov0UZFXsQKn2RAQbeXRuzyJTRRjzzzdni2
 Wp/kJb/M4fEJd8r2c/swpfFsINn2YKWqTaeKPq7NZs7yZ1MCCl8du+4nmlH6HnqAdocM
 zHhg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NDXe7cPX
Subject: [Buildroot] [PATCH 2/2] package/openvpn: bump version to 2.6.15
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

UmVsZWFzZSBub3RlczoKaHR0cHM6Ly9zb3VyY2Vmb3JnZS5uZXQvcC9vcGVudnBuL21haWxtYW4v
bWVzc2FnZS81OTIzODIzMy8KCkNoYW5nZWxvZzoKaHR0cHM6Ly9naXRodWIuY29tL09wZW5WUE4v
b3BlbnZwbi9ibG9iL3JlbGVhc2UvMi42L0NoYW5nZUxvZwpodHRwczovL2dpdGh1Yi5jb20vT3Bl
blZQTi9vcGVudnBuL2Jsb2IvcmVsZWFzZS8yLjYvQ2hhbmdlcy5yc3QKClRoZSDigI5DT1BZUklH
SFQuR1BMIHdhcyB1cGRhdGVkIHRvIGxhdGVzdCB2ZXJzaW9uIGZyb20gRlNGLgoKU2lnbmVkLW9m
Zi1ieTogU2NvdHQgRmFuIDxmYW5jcDIwMDdAZ21haWwuY29tPgotLS0KIHBhY2thZ2Uvb3BlbnZw
bi9vcGVudnBuLmhhc2ggfCA0ICsrLS0KIHBhY2thZ2Uvb3BlbnZwbi9vcGVudnBuLm1rICAgfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL29wZW52cG4vb3BlbnZwbi5oYXNoIGIvcGFja2FnZS9vcGVudnBu
L29wZW52cG4uaGFzaAppbmRleCA0MzJiMWMyYWZiLi4zNTNlOGE4MDUxIDEwMDY0NAotLS0gYS9w
YWNrYWdlL29wZW52cG4vb3BlbnZwbi5oYXNoCisrKyBiL3BhY2thZ2Uvb3BlbnZwbi9vcGVudnBu
Lmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZCBhZnRlciBjaGVja2lu
ZyBzaWduYXR1cmUKLXNoYTI1NiAgOWViNmE2NjE4MzUyZjllN2I3NzFhOWQzOGFlMTYzMWI1ZWRm
ZWVkNmQ0MDIzM2UyNDNlNjAyZGRmMjE5NWU3YSAgb3BlbnZwbi0yLjYuMTQudGFyLmd6Ci1zaGEy
NTYgIDFmY2I3OGQ3ZTQ3OGJiOGE5NDA4MDEwYmRjOTFiMzZlMjEzYjFmYWNmYWQwOTNkZjNmN2Nl
N2UyOGFmMTkwNDMgIENPUFlSSUdIVC5HUEwKK3NoYTI1NiAgZTM1NTEzZWUxNTk5NWUzYzcxYWRm
ZDg4OTFiOWYzMzUyMjg5NmM3MGIzYmFhMmVkOWEyM2M3YTQyYzRkN2JkZSAgb3BlbnZwbi0yLjYu
MTUudGFyLmd6CitzaGEyNTYgIGVkYWVmNjMyY2JiNjQzZTRlN2EyMjE3MTdhNmM0NDFhNGMxYTdj
OTE4ZTZlNGQ1NmRlYmMzZDg3MzliMjMzZjYgIENPUFlSSUdIVC5HUEwKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2Uvb3BlbnZwbi9vcGVudnBuLm1rIGIvcGFja2FnZS9vcGVudnBuL29wZW52cG4ubWsKaW5k
ZXggY2U5MTZkYmEwNC4uMjY1NThjM2QxNiAxMDA2NDQKLS0tIGEvcGFja2FnZS9vcGVudnBuL29w
ZW52cG4ubWsKKysrIGIvcGFja2FnZS9vcGVudnBuL29wZW52cG4ubWsKQEAgLTQsNyArNCw3IEBA
CiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1PUEVOVlBOX1ZFUlNJT04gPSAyLjYuMTQK
K09QRU5WUE5fVkVSU0lPTiA9IDIuNi4xNQogT1BFTlZQTl9TSVRFID0gaHR0cHM6Ly9zd3VwZGF0
ZS5vcGVudnBuLm5ldC9jb21tdW5pdHkvcmVsZWFzZXMKIE9QRU5WUE5fREVQRU5ERU5DSUVTID0g
aG9zdC1wa2djb25mIGxpYmNhcC1uZwogT1BFTlZQTl9MSUNFTlNFID0gR1BMLTIuMAotLSAKMi40
My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
