Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C33D2AB3E
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 13:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C109F4019C;
	Tue, 29 Oct 2024 13:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yJQFBcBw7r1X; Tue, 29 Oct 2024 13:26:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B4D8401FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B4D8401FE;
	Tue, 29 Oct 2024 13:26:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 928FD4EC0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 13:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7401460630
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 13:26:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HzXId0yueJ9B for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 13:26:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 69F90600B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69F90600B6
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69F90600B6
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 13:26:12 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-539e4b7409fso5220898e87.0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 06:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730208370; x=1730813170;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zcGXwh3WGZWWpBCDykFylZcsoQhBQIl0fSKk+jFvjVU=;
 b=IrnODMNJOIuGXdJoy3lCiFU+pZsi08IwfkOupXsz9Hdap1Agi1YHlnPpkXwewRLDP/
 tGj7paQgfmbt1bScYr4BLOVYQNSOIpJn7EQUzC8fXLRaUY2tRAJO1JJEkeiDtobGe/HH
 ZbIJYNuQT+KcKNfkz2WKEuvHNNGLOA1OI37XgOjGYH5HHxiraKmRI4acmURtvdvJPD2I
 FfEJQiSfeVLD4d9FrDwSsDxttZl8mLJ/v6+lrXwQv1ONUmQtfOHclih99imzSlopUdxz
 rkOep2jlRS157Fq4PH/5cMw4frrCI1/+j1+GUuP9T0B7H2rCNgJw7hylcC48nkLnTC/o
 FT0Q==
X-Gm-Message-State: AOJu0Yz3GJx6JXjKyCC2dZYteTqgJuVgX4RSgi7B9Y8DZMmxBLIwFWy5
 DV1sxm/G68/DvTlJIroRubVgCq1bPOjhMA7bGYlSCHN/pBZcJAXhPRaWtMQOSqxOq0gcLjBmHSM
 Ww+FtCbkYoyPbrICe2pOXJARqGcCLvjJSFII=
X-Google-Smtp-Source: AGHT+IEtMRxA+lbZap0CEOIj+vZMryCZcK982e+15Xob8cUGddMdLruy2MC8M7QUuPWxw1ydWPWUa+4o0d8+q+BUKG4=
X-Received: by 2002:a05:6512:2813:b0:539:f922:bd3a with SMTP id
 2adb3069b0e04-53b4928fa18mr647165e87.25.1730208369558; Tue, 29 Oct 2024
 06:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20241029053338.766690-1-fancp2007@gmail.com>
 <20241029122031.60ab547b@windsurf>
In-Reply-To: <20241029122031.60ab547b@windsurf>
From: Scott Fan <fancp2007@gmail.com>
Date: Tue, 29 Oct 2024 21:25:58 +0800
Message-ID: <CAFkzVZbZWYiq5hxx4F748RVc0G-QVk6AEozAAvcjxej8ZkSNtA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730208370; x=1730813170; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zcGXwh3WGZWWpBCDykFylZcsoQhBQIl0fSKk+jFvjVU=;
 b=iy/0uA1+ukOIkWqWSqVqjOhGl5JwCrMH8ucDrv1IxE6oWpLoEPSRlMLk1smWGvWOIj
 4X6TMVZlGuYJyMlGrDWw+0pQls72jgtzeU06MjHWtmfSXK5wywvPLmYALfBKbaMCyshR
 fLoObyQJQ07ArUje1OUHXRUTi5LezuSu0Sn5DPrUBLAbgGiu9AWXhZqNquF1pi+sruwK
 R/qsEtEP/rzHFGyu00X4q4wydNnhrBIlwis2cac4fGCn5CYWav3kXX/l7eOODWh6EOfS
 8+b4WqsHmjIkPz5F5KzmEuKFzQn9SdfZLeZHNmH0IT/TnedivYllguWXF41tQavv/YWw
 5SpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iy/0uA1+
Subject: Re: [Buildroot] [PATCH] package/procps-ng: fix build without
 __NR_pidfd_open and pidfd_open() found
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

SGkgVGhvbWFzLAoKUGF0Y2ggZnJvbSB1cHN0cmVhbSBkZWZpbmUgdGhlIG5leHQgbGluZToKQUNf
TVNHX0VSUk9SKFtOZWl0aGVyIHBpZGZkX29wZW4gb3IgX19OUl9waWRmZF9vcGVuIGZvdW5kLiBE
aXNhYmxlCnBpZHdhaXQgd2l0aCBjb25maWd1cmUgb3B0aW9uIC0tZGlzYWJsZS1waWR3YWl0XSkK
Ckl0IHdpbGwgcmVwb3J0IGFuIGVycm9yIG1lc3NhZ2Ugd2hpbGUgbmVpdGhlciBwaWRmZF9vcGVu
IG9yCl9fTlJfcGlkZmRfb3BlbiBmb3VuZC4KSSBjYW4gbm90IGJ1aWxkIGl0IHdpdGgga2VybmVs
IDQuMTkueCwgc28gYWRkIGFuIG9wdGlvbiB0byBhbGxvdwpleHBsaWNpdCBkaXNhYmxlIHBpZHdh
aXQuCgpTY290dCBGYW4KCk9uIFR1ZSwgT2N0IDI5LCAyMDI0IGF0IDc6MjDigK9QTSBUaG9tYXMg
UGV0YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhlbGxv
LAo+Cj4gT24gVHVlLCAyOSBPY3QgMjAyNCAxMzozMzozNiArMDgwMAo+IFNjb3R0IEZhbiA8ZmFu
Y3AyMDA3QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+IEJhY2twb3J0IHBhdGNoIGZyb20gdXBzdHJl
YW06Cj4gPiBodHRwczovL2dpdGxhYi5jb20vcHJvY3BzLW5nL3Byb2Nwcy8tL2NvbW1pdC8yNTA3
YmM0NzU3ODJmZjVlMDU0MWQzN2M3ODBkZmYxZTI5M2M5NTUzCj4gPgo+ID4gQWRkIG5ldyBjb25m
aWd1cmUgb3B0aW9uLCBhbGxvdyBkaXNhYmxlIGJ1aWxkIHBpZHdhaXQgZXhwbGljaXRseSB0byBh
dm9pZCBlcnJvcnMuCj4KPiBXaHkgaXNuJ3QgdGhpcyBhdXRvLWRldGVjdGVkPyBJdCBpcyByZWFs
bHkgc2lsbHkgdG8gdXNlIGNvbmZpZ3VyZS5hYwo+IGFuZCBub3QgZGV0ZWN0IHN1Y2ggdGhpbmdz
IGF1dG9tYXRpY2FsbHkuCj4KPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpvbmksIGNvLW93
bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVy
aW5nIGFuZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
