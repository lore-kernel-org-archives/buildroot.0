Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EBBC83030
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4678383BA8;
	Fri,  4 Jul 2025 06:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8fqWLES3MqnY; Fri,  4 Jul 2025 06:46:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8111583CC6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8111583CC6;
	Fri,  4 Jul 2025 06:46:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 939BC7AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84FE083CC6
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0uoa-W8yPGhe for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:46:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9AD208361C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AD208361C
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9AD208361C
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:52 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso476485f8f.0
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:46:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611610; x=1752216410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L8kvSR80fGJkOwei85bJgFfh6+uHn/srdEHDeoWhpLE=;
 b=SP3TaKh57e3XuKP2qfAgAWEviyD59LpsPwkZaY446g4VjaRCu6q3B+NIDV0n/eZVjX
 V3Och3GMV15grDnp5dEj+Dfsu2FEApOrY7mbt2afGcxu9MwrmzXTeu8H+N5LYKv9flJU
 TBhbeKCxBndkTnGgCD3nCjN2md+AI6f++/9zpjYVsKIQaTI6E9eNRUUGGlCd0b2FAcRk
 2w6w20cUdGAm0HZltaJr8I3avofJNaa71QnBhwR9PrdlT4+oi/3dhAsV4w0mZLEgf5aQ
 wPXtwnlr1CKKPRhtwTD4wwpNg94ZuJuDA9nQn5qY9iggRfuNWEVegeb9cV5crhJ4I9Yz
 s5sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlofwpP1YQP9OWgvYfalK+C+eQMspo3dnjqC6zjOsp+mwLLMquBs9VtM9Es/DyObrsecO4sh4IuF4=@buildroot.org
X-Gm-Message-State: AOJu0YzaJOo0YO1Sa8gba8qUJd3Bh+aAJznTKDMlHWAIEm/jcyHaiugH
 b6REtjPPwmi82+72HxoJAE86p8v4JqWfRcvOpTxXcWPPXP7FuYlyVniJuJzEf1fI7ewBb4Sl3rv
 Zx4th
X-Gm-Gg: ASbGncuhrobIUvTX2TBvb/xmo84Rektq7XCHz1SuUsml3pUOndxx75Q/v33s5y3Gkj0
 31QkRNqzj7CKW70UOxqbVUluQJZC7aR+tPEFISuzt6uWEyL7KVdMklDMM1t0zy65MlR5VSSsKx9
 M36mdp2lcOXPcJiOPlFUCq+FL3mjKNTXv8pfWcYbAtPw3AFqRR1DQuabqBJK52wAdfGNBvWGS7N
 6aXI3h7BdHwNe+bzI14cPgex4uEqLaBA2oW1cmn4TzNrwGw+MvL4R6ecl8MdAAy0ymtdI0mhPyD
 4EMvidcDL3QCLX3lSl9NrlFX8JDqLcCBLPKKfnpSH52KC2ih5aNi5UEwN4inobQEAqPb4N0T8EY
 uHetloo2iNXCO476j2D69
X-Google-Smtp-Source: AGHT+IGuw2K7RnuJNHMxtzMWO0Fgek0vA/ZdiUIsJkiRuJg7JID0rzBsDicHEDRQyfuIHGwjwbvtzg==
X-Received: by 2002:a05:6000:4311:b0:3a5:24a9:a5d3 with SMTP id
 ffacd0b85a97d-3b49700e07fmr615464f8f.17.1751611610579; 
 Thu, 03 Jul 2025 23:46:50 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b471b96534sm1614175f8f.48.2025.07.03.23.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:46:49 -0700 (PDT)
To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:46:44 +0200
Message-ID: <20250704064645.4064071-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250624090905.287792-1-raphael.melotte@mind.be>
References: <20250624090905.287792-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611610; x=1752216410; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L8kvSR80fGJkOwei85bJgFfh6+uHn/srdEHDeoWhpLE=;
 b=aJCQe8nqPjrvgjwqA9m/ElYJ/J8Gbg+oRriePjayfccQi2PVxBVqhDBemHZo2buWkt
 LvfMiCYW6S8GPV+41kwgry8Wdlh9DCNYiYQYSpfCA+89mIC/qhANc2QpASQugvht+cBj
 Z4f6nAbd9ly/iZqbmHpD004wv4b1XZzjRg81eapsgE/LKny+Sx63IkAlPGKQQpHA46Za
 y/MAhsm7w1ttc/DVkQn83jjyfS0sYR1nGXqjRyF6I40JD43AcGSrm82LBkOauSKvOVdB
 u5axphdl/PZaOkMfjkpbWYkAtotaxn2R1KddUvm4l002R0WZyDwxDkqueq3Uu6Vywkw3
 4o/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aJCQe8nq
Subject: Re: [Buildroot] [PATCH 1/1] package/mupdf: update homepage URL
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gVGhlIGN1cnJlbnQgaG9tZXBhZ2UgVVJMIGxlYWRzIHRvIGFuIEhUVFAg
NDA0IGVycm9yLgo+IAo+IEZpeCBpdCBieSB1c2luZyB0aGUgaG9tZXBhZ2UgVVJMIGN1cnJlbnRs
eSBtZW50aW9uZWQgaW4gbXVwZGYncyBnaXQKPiByZXBvc2l0b3J5Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KCkFwcGxpZWQg
dG8gMjAyNS4wMi54LiBUaGFua3MKCj4gLS0tCj4gIHBhY2thZ2UvbXVwZGYvQ29uZmlnLmluIHwg
MiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9tdXBkZi9Db25maWcuaW4gYi9wYWNrYWdlL211cGRmL0Nv
bmZpZy5pbgo+IGluZGV4IDM0YzVlN2Q1MzguLjVjMGExMjdhOTAgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9tdXBkZi9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL211cGRmL0NvbmZpZy5pbgo+IEBA
IC0xNCw3ICsxNCw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9NVVBERgo+ICAJaGVscAo+ICAJICBN
dVBERiBpcyBhIGxpZ2h0d2VpZ2h0IFBERiwgWFBTLCBhbmQgRS1ib29rIHZpZXdlci4KPiAgCj4g
LQkgIGh0dHBzOi8vd3d3Lm11cGRmLmNvbS9pbmRleC5odG1sCj4gKwkgIGh0dHBzOi8vd3d3Lm11
cGRmLmNvbS8KPiAgCj4gIGNvbW1lbnQgIm11cGRmIG5lZWRzIGEgdG9vbGNoYWluIHcvIEMrKywg
Z2NjID49IDQuOSIKPiAgCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfU1lOQ180Cj4gLS0g
Cj4gMi40OS4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
