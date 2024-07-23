Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE735C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 21:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F8CC6089F;
	Tue, 23 Jul 2024 21:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8WCsrNYfIB_1; Tue, 23 Jul 2024 21:20:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92DF86088C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92DF86088C;
	Tue, 23 Jul 2024 21:20:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 061341BF2F9
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E818D80A00
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6PkXvAan3IfQ for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 21:20:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CFCE1809E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFCE1809E8
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFCE1809E8
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 21:20:30 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4272738eb9eso45080135e9.3
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 14:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721769628; x=1722374428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DSLd2LA53sG6osCnOCjhFWcAcF3eUUI7YO2yUQGBM74=;
 b=JeeZVJRZSlToKEjAm2cZoe2HeOk7qSzHjZwWbDLjjyyAjZ8reUwA+FhsP8Xiaer72y
 fim7aKav8ETtR06LVgsK9Q0AksBCjbivhoGK770XSDZSjCOz3lhqo6y+lo9PV7h35pAY
 SMPCKiMfYW1BkA/WBcw3TS+hcE0Xj8TegEUI25rZd1dnhHigZsavcCXTLnpZ6fi3zwLX
 SpPYMPH+KKYVG93knX5JbSkRRDp48EaRDD9RPdYNTS+N9suqgBrT1oMh8HrgDL1fdNhF
 dcmzFnwokIz6aSZ6xl2ksRBcBGR7N1X2LOuGLEYCWh2Xx8l2gCWty2Dnc9vgjTeofU7v
 LbZw==
X-Gm-Message-State: AOJu0YzJaDAoPeDVaCUpxC/AQurDMw2l+/F4xW7L/4kXkJl5bMECEMnO
 OAYfCec6rcrI08IHsPwkcn9pbHWnbqV/nZWyswJ9O9HEufZF9ZlZO5sXb1iNJHo=
X-Google-Smtp-Source: AGHT+IEzxztt1Z8tQZdTdaK/etHVRPOz3dqxmpV5YTZxUPsiYrkWXsUuBQma2tYMH+amufumJQNXDA==
X-Received: by 2002:a05:600c:1ca3:b0:426:61e8:fb3b with SMTP id
 5b1f17b1804b1-427f95af0f8mr447375e9.27.1721769627969; 
 Tue, 23 Jul 2024 14:20:27 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f937348bsm1575705e9.18.2024.07.23.14.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 14:20:26 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 23:20:11 +0200
Message-ID: <20240723212011.23048-3-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240723212011.23048-1-gael.portay@rtone.fr>
References: <20240723212011.23048-1-gael.portay@rtone.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721769628; x=1722374428; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DSLd2LA53sG6osCnOCjhFWcAcF3eUUI7YO2yUQGBM74=;
 b=Mf5aFiXNDzGA8zTvDYn0cXgwlEUyzadTnc30/1IAhhEaWHZQnXeAn/rKQJd1t8/b2o
 9tJr69NkZTyVJMhn71h65CFtV/REhwm4Rn0KWbSoFxqYG1Y6NARegxB3fZcOynj2EEP2
 EV5qZA9+ADuJT1xswTF7F9aTTD4bPO4t/GFAy3OzD0bJkjk5202/7jtmQJYG9V1seVl8
 fjhYWyg2bJpPWXMe92rH4zqotmz4PgL+sFOMUQqeiHBSqhIXCgJTFuQ9BfVipxBrOHTR
 4x7etB9U83KaxT2WzYDrUFD9BBZEf5tkQ0GDqrWR8BbKdfI6TpYu+HJQqro2QKY64KUJ
 OC5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Mf5aFiXN
Subject: [Buildroot] [PATCH 2/2] package/rpi-userland: package is deprecated
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
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHBhY2thZ2UgcnBpLXVzZXJsYW5kIGhhcyBiZWVuIG1hcmtlZCBhcyBhbmNpZW50IGFuZCBk
ZXByZWNhdGVkWzFdLgoKVGhpcyBhZGRzIHRoZSBtZXNzYWdlIGluIGl0cyBoZWxwLgoKWzFdOiBo
dHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvdXNlcmxhbmQvY29tbWl0Lzk2YTczMzRhZTlk
NWZjOWRiN2FjOTJlNTk4NTIzNzdkZjYzZjE4NDgKClNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRB
WSA8Z2FlbC5wb3J0YXlAcnRvbmUuZnI+Ci0tLQogcGFja2FnZS9ycGktdXNlcmxhbmQvQ29uZmln
LmluIHwgMTEgKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9ycGktdXNlcmxhbmQvQ29uZmlnLmluIGIvcGFja2FnZS9ycGkt
dXNlcmxhbmQvQ29uZmlnLmluCmluZGV4IDQyMTliZGI5YzQuLmMzOWViNDU5OGYgMTAwNjQ0Ci0t
LSBhL3BhY2thZ2UvcnBpLXVzZXJsYW5kL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL3JwaS11c2Vy
bGFuZC9Db25maWcuaW4KQEAgLTE2LDYgKzE2LDE3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9SUElf
VVNFUkxBTkQKIAkgIG1tYWwsIEdMRVN2MiwgdmNvcywgb3Blbm1heGlsLCB2Y2hpcV9hcm0sIGJj
bV9ob3N0LCBXRkMsCiAJICBPcGVuVkcuCiAKKwkgIEltcG9ydGFudDogVGhlIHBhY2thZ2UgaXMg
YW5jaWVudCBhbmQgZGVwcmVjYXRlZC4KKworCSAgSXQgbGFyZ2VseSBjb250YWlucyBjb2RlIHVz
aW5nIHByb3ByaWV0YXJ5IEFQSXMgdG8gaW50ZXJmYWNlCisJICB0byB0aGUgVmlkZW9Db3JlIGZp
cm13YXJlLiBJdCBoYXMgc2luY2UgbW92ZWQgdG8gc3RhbmRhcmQKKwkgIGxpbnV4IEFQSXMuCisK
KwkgIFY0TDIsIERSTS9LTVMgYW5kIE1lc2EgYXJlIHRoZSBBUElzIHlvdSBzaG91bGQgYmUgdXNp
bmcuCisKKwkgIFRoZSBmZXcgdXNlZnVsIHRvb2xzIGZyb20gaGVyZSAoZHRvdmVybGF5LCBkdG1l
cmdlLAorCSAgdmNtYWlsYm94LCB2Y2dlbmNtZCkgaGF2ZSBiZWVuIG1vdmVkIHRvIHRoZSBwYWNr
YWdlIHJwaS11dGlscy4KKwogCSAgaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL3VzZXJs
YW5kLwogCiBpZiBCUjJfUEFDS0FHRV9SUElfVVNFUkxBTkQgJiYgQlIyX2FybQotLSAKMi40NS4y
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
