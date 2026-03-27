Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9449910ED640
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68FBE4171A;
	Fri, 27 Mar 2026 10:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f-mlwSxpcYMl; Fri, 27 Mar 2026 10:03:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 869EE4173D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605797;
	bh=FBRKBoAJmWOqyveMWfVqiF47z464Hu3kYBf3QHLJA1s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EqLQJyhCVS6AOQU11lOpWPSglITuULW9gUqTZw/PTmXkR472Rh6q/lUcwqAQxBy5q
	 h1ZCmyofzdzQOvNvpcNf4q1KHxheIZrC0vXqXpHSxyE+xN3dKUJh99oNCco+HDXc3H
	 hLG1jyAT/gLIGGfKvgd+oqSMNNPaadCJh6DTLhwCUJrOAo2ODcEF/yjY7usBOvFJOx
	 nLgQqpEhqxzBAX7whItm3ks9XW4DByy3VWAO8hs73Fcp7bDs17fr/Y3YsoQ5wPE6PL
	 SXJ3HprxFnsQV+OYhFvNhPbQ8j1Hd3iCA682fkPwAYxMdz87y5xPSIw/03OGWa5QGc
	 YPYlSLc99dRRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 869EE4173D;
	Fri, 27 Mar 2026 10:03:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 53141249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38EA84171A
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qSu11UfgAqWD for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:03:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3415D4172A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3415D4172A
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3415D4172A
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:03:14 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-486fba7ce4cso19735755e9.3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 03:03:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774605792; x=1775210592;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ljq0f4zCapEYncQhr7tZ5aqJ2egtp4DVGapvpcjoA70=;
 b=W9DQ6RTSJeA+FM4txeQFH4ger55yXUo8aasMot9FMJuudowmMFGEcSp7mpOXQjqKq4
 uxolOLq3Wun+MY7UZNeskvDOkNgr4X5SrL7xxZgJXjEPJi++wTpTDU17gNevyeps3jLG
 mH4XuVq4GWmF41Li5FnZVI2Uy+zKiLZkInNbaanShHXaP/YpxMsaJqJFfFiy68+j1Ad/
 FFuQzYDpDFTlI3MahmtcJv35ICSxNmpdjSyOQNkLxByeYYdIOx5zJgL37VVtIMS9qBaj
 fp1Ns5R8/LF8YKu6pkEbLV9O4KhWQfB5z+sl8t51h8XzBDUtDcs7lE7sjzmok4eoIofT
 v79w==
X-Forwarded-Encrypted: i=1;
 AJvYcCViG4utBLbHc/LG2oz5g2DxTYw532Ae5hLZYHX2dQDugRGTFROZm/50XvcZtAoKK597btFhlLvEpZg=@buildroot.org
X-Gm-Message-State: AOJu0Yy8K9eu2NGnqwuR4Bqb9J8eGMoeZR+QFcwa8a0Jz+ZDjZtshn0S
 Abmz/8Ot9dueDZV6mXaT8yzrYxpba7sieyMESKeHppCSYreILKspQa6kFf56tEQWLEc=
X-Gm-Gg: ATEYQzw7NKo4/x8VVV78yxSOSDd6RpxpD7s4o0z2NKseY8fYpAV/tALvgOYtW/lShB8
 H5A3AYRkKwonUFpOJZGt5kEwN+P1AjZMCKa5YRHYmBY9nRSbOWSMa11p1GF0ovbXwF3ooKGrjCp
 skW/hHGXsSIoUgtZgaFJQ/Fs6wXRg6Tv8RN7LK66T7CbsPIIXyLZaAJwXKQ7geLSn3uPhbMOakj
 zOKrmelc8L/zfPIuHq845FcrIfAMnlvGTD2okl56sfssWN0RQ7g+uIiP0iMtGPYw+BaztxxmmyL
 a4Y1BtvO9aWqvj83E6YKmsdnoIQ5DQfn9xhVzzB/pExQ/L4Y6YAoGrjlEuPHnuU9DAoVgrXpP4y
 J3wAjhx5yA41VZl0wJilbeiYBwBwIDr4yjfkbxbJIA6EHIDkdaV7/93uiLrbSt/VW0hvGOJszPb
 l6uSOiCNmZ7c+JfDAJ
X-Received: by 2002:a05:600c:81c5:b0:46e:4e6d:79f4 with SMTP id
 5b1f17b1804b1-48727e90ec7mr27036165e9.15.1774605791910; 
 Fri, 27 Mar 2026 03:03:11 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48725fc4827sm13987085e9.11.2026.03.27.03.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 03:03:11 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 27 Mar 2026 11:03:09 +0100
Message-ID: <20260327100310.46952-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260315191748.762183-1-bernd@kuhls.net>
References: <20260315191748.762183-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774605792; x=1775210592; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ljq0f4zCapEYncQhr7tZ5aqJ2egtp4DVGapvpcjoA70=;
 b=YHYF/aGeaJofXwTEMVAmb6pS9aeBdDu5xF8pV1WtJjNXi+aDv4lfO8GrJPlChz37vL
 REfgWVr/4rs415ngpEnTPPa/JVW7dPKpU1sx6uFiqQs8hF9jdOztVnqso4IpukRVGkUT
 A53WSvQXdYhWkJP0VLK+UaiOg2dZFhWXzsEOb0YNw6VXknMsaYN4jZJqAvvYGZdyyBnX
 axHtXTgixZj35KYtPU1kWtfc9xPf+hVo4udF/9ox6ISBD0vL8X9fDVybsJpqWBWQ7ixr
 2GDzXKujF9MOaj8iIRa7VaILcfYr3C288nu31Sl9h7XIqbVApkXVaAwDVZRYjxQb4FlN
 CqAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YHYF/aGe
Subject: Re: [Buildroot] [PATCH 1/1] package/igh-ethercat: fix build with
 kernel >= 6.15
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

SW4gcmVwbHkgb2Y6Cj4gQnVpbGRyb290IGNvbW1pdCBjNmU5MTQ4MTk3NzQyMTJlNzliZTE5ZjYy
NzA2ZjY1M2I5NjQ2ZjExIGJ1bXBlZCB0aGUKPiBwYWNrYWdlIGZyb20gMS42LjMgdG8gMS42Ljgu
IFRoZSBwcmV2aW91cyB2ZXJzaW9uIDEuNi4zIGZhaWxlZCB0byBidWlsZAo+IHdpdGgga2VybmVs
ID49IDYuMTUgYXMgc2VlbiBoZXJlOgo+IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQv
cmVzdWx0cy83ZjQvN2Y0YjNlNjMyYTVkZTY3ZGVjMjYyNGEyMDk3MDQ1ZWM0ZDc2NzI0Ni8KPiAi
ZXhhbXBsZXMvbWluaS9taW5pLmM6NTI4OjU6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBv
ZiBmdW5jdGlvbgo+ICDDouKCrMucZGVsX3RpbWVyX3N5bmPDouKCrOKEoiBbLVdpbXBsaWNpdC1m
dW5jdGlvbi1kZWNsYXJhdGlvbl0KPiAgIDUyOCB8ICAgICBkZWxfdGltZXJfc3luYygmdGltZXIp
OyIKPiAKPiBUaGUgYnVtcCB0byAxLjYuOCBpbmNsdWRlcyBhIGNvbW1pdCB3aGljaCBmaXhlcyB0
aGUgcHJvYmxlbToKPiBodHRwczovL2dpdGxhYi5jb20vZXRoZXJsYWIub3JnL2V0aGVyY2F0Ly0v
Y29tbWl0LzI0MDA4MGYxMTA2MmNjYTQyZjkxMzJjZDMyZmFkM2I5OTM1MDI2NjUKPiAKPiBidXQg
aXQgb25seSBtYXNrZWQgb3RoZXIgYnVpbGQgZXJyb3JzIHdoaWNoIHdlcmUgZm91bmQgYnkgdGhl
Cj4gYXV0b2J1aWxkZXJzOgo+IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0
cy8xYTUvMWE1NDZlZTIyMTdlNzg0M2I4NTJhNWI3OWI0NzdlZjIzZGY2YTA2NC8KPiAiZXhhbXBs
ZXMvdHR5L3R0eS5jOjIzNjo1OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rp
b24KPiAgJ2RlbF90aW1lcl9zeW5jJyBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0K
PiAgIDIzNiB8ICAgICBkZWxfdGltZXJfc3luYygmdGltZXIpOyIKPiAKPiB3aGljaCBuZWVkIHNp
bWlsYXIgZml4ZXMuCj4gCj4gRml4ZXM6Cj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5l
dC9yZXN1bHRzLzBiYS8wYmE3MTYzZTUwMTIzMDlkM2EzMWFhNzE4NmNhOTVhOWQ1YzhkZTY5Lwo+
IAo+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+CgpBcHBsaWVk
IHRvIDIwMjYuMDIueC4gVGhhbmtzCgo+IC0tLQo+ICAuLi5uZXctdGltZXItaW50ZXJmYWNlLXNp
bmNlLWtlcm5lbC02LjEucGF0Y2ggfCA2MyArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2ln
aC1ldGhlcmNhdC8wMDAxLXR0eS1JbXBsZW1lbnRlZC1uZXctdGltZXItaW50ZXJmYWNlLXNpbmNl
LWtlcm5lbC02LjEucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9pZ2gtZXRoZXJjYXQv
MDAwMS10dHktSW1wbGVtZW50ZWQtbmV3LXRpbWVyLWludGVyZmFjZS1zaW5jZS1rZXJuZWwtNi4x
LnBhdGNoIGIvcGFja2FnZS9pZ2gtZXRoZXJjYXQvMDAwMS10dHktSW1wbGVtZW50ZWQtbmV3LXRp
bWVyLWludGVyZmFjZS1zaW5jZS1rZXJuZWwtNi4xLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiBpbmRleCAwMDAwMDAwMDAwLi41ZTU2OGVhYmE5Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBi
L3BhY2thZ2UvaWdoLWV0aGVyY2F0LzAwMDEtdHR5LUltcGxlbWVudGVkLW5ldy10aW1lci1pbnRl
cmZhY2Utc2luY2Uta2VybmVsLTYuMS5wYXRjaAo+IEBAIC0wLDAgKzEsNjMgQEAKPiArRnJvbSBl
MzJlOTlmOGI4ZWMwMmEzNDBhZDNiOTNjYzhhYmQzNjc4MWZmNTY4IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQo+ICtGcm9tOiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0Pgo+ICtEYXRlOiBT
dW4sIDE1IE1hciAyMDI2IDIwOjA2OjQyICswMTAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gdHR5OiBJ
bXBsZW1lbnRlZCBuZXcgdGltZXIgaW50ZXJmYWNlIHNpbmNlIGtlcm5lbCA2LjE1Cj4gKwo+ICtV
cHN0cmVhbTogaHR0cHM6Ly9naXRsYWIuY29tL2V0aGVybGFiLm9yZy9ldGhlcmNhdC8tL21lcmdl
X3JlcXVlc3RzLzE4Nwo+ICsKPiArU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1
aGxzLm5ldD4KPiArLS0tCj4gKyBleGFtcGxlcy90dHkvdHR5LmMgfCA0ICsrKysKPiArIHR0eS9t
b2R1bGUuYyAgICAgICB8IDggKysrKysrKysKPiArIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKQo+ICsKPiArZGlmZiAtLWdpdCBhL2V4YW1wbGVzL3R0eS90dHkuYyBiL2V4YW1wbGVz
L3R0eS90dHkuYwo+ICtpbmRleCA0ZDQ3YTQ5Li5lNWI0ZDUyIDEwMDY0NAo+ICstLS0gYS9leGFt
cGxlcy90dHkvdHR5LmMKPiArKysrIGIvZXhhbXBsZXMvdHR5L3R0eS5jCj4gK0BAIC0yMzMsNyAr
MjMzLDExIEBAIHN0YXRpYyB2b2lkIF9fZXhpdCBjbGVhbnVwX21pbmlfbW9kdWxlKHZvaWQpCj4g
KyB7Cj4gKyAgICAgcHJpbnRrKEtFUk5fSU5GTyBQRlggIlN0b3BwaW5nLi4uXG4iKTsKPiArIAo+
ICsrI2lmIExJTlVYX1ZFUlNJT05fQ09ERSA+PSBLRVJORUxfVkVSU0lPTig2LCAxNSwgMCkKPiAr
KyAgICB0aW1lcl9kZWxldGVfc3luYygmdGltZXIpOwo+ICsrI2Vsc2UKPiArICAgICBkZWxfdGlt
ZXJfc3luYygmdGltZXIpOwo+ICsrI2VuZGlmCj4gKyAKPiArICAgICBmcmVlX3NlcmlhbF9kZXZp
Y2VzKCk7Cj4gKyAKPiArZGlmZiAtLWdpdCBhL3R0eS9tb2R1bGUuYyBiL3R0eS9tb2R1bGUuYwo+
ICtpbmRleCAyYjdiMjJiLi4xMmFkMWU3IDEwMDY0NAo+ICstLS0gYS90dHkvbW9kdWxlLmMKPiAr
KysrIGIvdHR5L21vZHVsZS5jCj4gK0BAIC0yOTIsNyArMjkyLDExIEBAIHN0YXRpYyBpbnQgZWNf
dHR5X2luaXQoZWNfdHR5X3QgKnQsIGludCBtaW5vciwKPiArIAo+ICsgc3RhdGljIHZvaWQgZWNf
dHR5X2NsZWFyKGVjX3R0eV90ICp0dHkpCj4gKyB7Cj4gKysjaWYgTElOVVhfVkVSU0lPTl9DT0RF
ID49IEtFUk5FTF9WRVJTSU9OKDYsIDE1LCAwKQo+ICsrICAgIHRpbWVyX2RlbGV0ZV9zeW5jKCZ0
dHktPnRpbWVyKTsKPiArKyNlbHNlCj4gKyAgICAgZGVsX3RpbWVyX3N5bmMoJnR0eS0+dGltZXIp
Owo+ICsrI2VuZGlmCj4gKyAgICAgdHR5X3VucmVnaXN0ZXJfZGV2aWNlKHR0eV9kcml2ZXIsIHR0
eS0+bWlub3IpOwo+ICsgfQo+ICsgCj4gK0BAIC0zNjcsMTAgKzM3MSwxNCBAQCBzdGF0aWMgdm9p
ZCBlY190dHlfd2FrZXVwKHN0cnVjdCB0aW1lcl9saXN0ICp0KQo+ICsgc3RhdGljIHZvaWQgZWNf
dHR5X3dha2V1cCh1bnNpZ25lZCBsb25nIGRhdGEpCj4gKyAjZW5kaWYKPiArIHsKPiArKyNpZiBM
SU5VWF9WRVJTSU9OX0NPREUgPj0gS0VSTkVMX1ZFUlNJT04oNiwgMTUsIDApCj4gKysgICAgZWNf
dHR5X3QgKnR0eSA9IHRpbWVyX2NvbnRhaW5lcl9vZih0dHksIHQsIHRpbWVyKTsKPiArKyNlbHNl
Cj4gKyAjaWYgTElOVVhfVkVSU0lPTl9DT0RFID49IEtFUk5FTF9WRVJTSU9OKDQsIDE1LCAwKQo+
ICsgICAgIGVjX3R0eV90ICp0dHkgPSBmcm9tX3RpbWVyKHR0eSwgdCwgdGltZXIpOwo+ICsgI2Vs
c2UKPiArICAgICBlY190dHlfdCAqdHR5ID0gKGVjX3R0eV90ICopIGRhdGE7Cj4gKysjZW5kaWYK
PiArICNlbmRpZgo+ICsgICAgIHNpemVfdCB0b19yZWN2Owo+ICsgCj4gKy0tIAo+ICsyLjQ3LjMK
PiArCj4gLS0gCj4gMi40Ny4zCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
