Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78663C3ABAC
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 13:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45F0C41529;
	Fri,  2 May 2025 13:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fukTg9u2-xkx; Fri,  2 May 2025 13:29:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 134BC41794
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 134BC41794;
	Fri,  2 May 2025 13:29:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 628621A4
 for <buildroot@buildroot.org>; Fri,  2 May 2025 13:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FDE783777
 for <buildroot@buildroot.org>; Fri,  2 May 2025 13:29:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mYEvkS0YoGaE for <buildroot@buildroot.org>;
 Fri,  2 May 2025 13:29:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5DF908380B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DF908380B
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DF908380B
 for <buildroot@buildroot.org>; Fri,  2 May 2025 13:29:43 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-3104ddb8051so18875591fa.1
 for <buildroot@buildroot.org>; Fri, 02 May 2025 06:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746192581; x=1746797381;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rhOhr3njkX6m2uzLh6vQAE2WWojFrj6geCpXeJ4uYac=;
 b=ryYiVEOMeFRx6IKBo+CB3dyH2petDsK4E44XXgPC5VGsmteJ3ZgGmHLtVfKypzb28F
 gD8QmvKXLh6f/jaok+LHzYm9447YmQnCECrePLXfjkbnHSoWr/Npr9kQC+n0DN7Bic5y
 2IgqQQUFmTIcBvaGtSEFEQ1iw/H8iaeABA+vU3FVt5wCAa+RowdosgNgDovtnZxIv1Nb
 tmpnDzk0JB0wkQ8XaYjdxZTEA2qyyH3/pqmigDhYeCbkHBbbsGAiIxZkLKHaRGBCg9O6
 TB3hir5EkukiffPfNHu/2UngUhg6wBF1GOpRb1pr9dMSKkq1rgqyZC4sozahFsRVSEO+
 8HHQ==
X-Gm-Message-State: AOJu0Yz/Rm7xI9Uhj4Qv5AZ+cKSV/9DjqCLsYBvNZLsjQNFskwM57ora
 LBdCuZqMt/e+1j8JniqVKAy+fsiXPbHhIRmgWTZ0jHhKdeumW5sG/vHRNgwl
X-Gm-Gg: ASbGncuXm1LLFN/Ng9SFklSMgcTlaLY0eTbbSjO2/apYQWfZyEFFIhSU+YWXbEJqADp
 WAwp84nP3YRUWa0QBCVukG2bHc/Q8kJnJY164v6v482i/+hbssVC4mTJ/s0FhqRaRmpP1y0ewGH
 6cHQTPDO3yEeIaVycQLrhui+epjfvwdZgoHBcDjyfDXtPyE7gjvMr0WBRL431nCQkMoqq9EOiGg
 nYmG73wNNpMUstAarZvP/l7cMaVZ/v4qBnPj7k52DcHjiHr89a++kLsn5kit5uRi604QlGgXRwx
 S04m/pQKv6cJ0kguShrrEa2k9O6xw5EqOFi4BqorHmuXqp+FFspasKkfNWHDezBMQDfAooHS
X-Google-Smtp-Source: AGHT+IG+F0gS1snFgSRZsSHo+n1DZoo5lMerON8rvb9+a1y4MgKSTvw4gHwEzcH6CzXZ1xVBTV6hMA==
X-Received: by 2002:a2e:be9f:0:b0:31a:ba1:2387 with SMTP id
 38308e7fff4ca-320c58fd044mr7726241fa.31.1746192580608; 
 Fri, 02 May 2025 06:29:40 -0700 (PDT)
Received: from tollan.addiva.ad (b106.broadband9.quicknet.se.
 [194.132.233.106]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3202ad8c3fcsm3370691fa.88.2025.05.02.06.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 06:29:39 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Fri,  2 May 2025 15:29:23 +0200
Message-ID: <20250502132924.3775738-4-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502132924.3775738-1-lazzer@gmail.com>
References: <20250502132924.3775738-1-lazzer@gmail.com>
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746192581; x=1746797381; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=rhOhr3njkX6m2uzLh6vQAE2WWojFrj6geCpXeJ4uYac=;
 b=ePA9zDmQHLKIt6wHZjrhbS2SMuj6LbJ3FknZ1xTm6y39GYuyZRSBkWwQwy9e3Dv/uz
 56XzOLFzSaTwDS8nEPNT8jL7H73hFScxQJXLFN/bd9BeBc6uYFNJIaZY9/OExJ7Pdigw
 euGrNLUJzDMgYJYZp0gEdUf2pTxxNVOfZ+rgW+Y84B0iIMKvak0xmWFdGVVgVYD/POdo
 m6MLYXnClQQ/E0drx4Las8ckfq+XFbtYOnuwPdu3W6kcNIv0AyGRjZXsa9xBFaW1sDQU
 fJp45uwZrxvoHDII36DA0eLjECdnMVAFzaz985fgIOn3hvQNf4LzqIP6J85HCX1fhn5U
 RMNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ePA9zDmQ
Subject: [Buildroot] [PATCH 3/4] package/libnetconf2: bump to version 3.7.1
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

Q2hhbmdlbG9nOgogIGVycm9yLXBhdGggZGF0YSBub2RlCiAgIG5vdyB1c2luZyBwcm9wZXIgZm9y
bWF0IHNvIGluIHJwYy1yZXBseSB1c2VzIFhNTCBYUGF0aCBmb3JtYXQgaW5zdGVhZCBvZiBKU09O
CiAgc2V2ZXJhbCBidWdmaXhlcyBhbmQgaW1wcm92ZW1lbnRzCgpEZXBlbmQgb24gbGlieWFuZyB2
My4xMi4yIGh0dHBzOi8vZ2l0aHViLmNvbS9DRVNORVQvbGlieWFuZy9yZWxlYXNlcy90YWcvdjMu
MTIuMgoKU2lnbmVkLW9mZi1ieTogTWF0dGlhcyBXYWxzdHLDtm0gPGxhenplckBnbWFpbC5jb20+
Ci0tLQogcGFja2FnZS9saWJuZXRjb25mMi9saWJuZXRjb25mMi5oYXNoIHwgMiArLQogcGFja2Fn
ZS9saWJuZXRjb25mMi9saWJuZXRjb25mMi5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJu
ZXRjb25mMi9saWJuZXRjb25mMi5oYXNoIGIvcGFja2FnZS9saWJuZXRjb25mMi9saWJuZXRjb25m
Mi5oYXNoCmluZGV4IDY3NWM3NmE1MDAuLjJkNjM5NGU4MWIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uv
bGlibmV0Y29uZjIvbGlibmV0Y29uZjIuaGFzaAorKysgYi9wYWNrYWdlL2xpYm5ldGNvbmYyL2xp
Ym5ldGNvbmYyLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hh
MjU2ICA3MmU5YTY0NjFmYWRiZDIyZjBjZjBkMjNiYTY4ZDYyYjI5N2M4ZjU2NGY3ZjJiZWUwNjk3
NDhmYjY3ZmMzYTI0ICBsaWJuZXRjb25mMi0yLjEuMjgudGFyLmd6CitzaGEyNTYgIGM5NWMwMGFk
ODg3Mjk1ZDFmYTMxMDk4Yzg1OWM3NGUzMzBlZWFkNzhiMmVlZThkMDA4NzAxYWYyZDlkZjgwZTUg
IGxpYm5ldGNvbmYyLTMuNy4xLnRhci5negogc2hhMjU2ICBiZDk2MmFiNDU3YzhhOGNiOGZhYWFh
MzZjMTE0ODQ2ODBmM2M5YTQ3ZGJjMzM2NTA3ODE3YWU4OTM1Mzg0MDY0ICBMSUNFTlNFCmRpZmYg
LS1naXQgYS9wYWNrYWdlL2xpYm5ldGNvbmYyL2xpYm5ldGNvbmYyLm1rIGIvcGFja2FnZS9saWJu
ZXRjb25mMi9saWJuZXRjb25mMi5tawppbmRleCA4ODE2MzkyNmMwLi4wZDc0YmQ3MzZkIDEwMDY0
NAotLS0gYS9wYWNrYWdlL2xpYm5ldGNvbmYyL2xpYm5ldGNvbmYyLm1rCisrKyBiL3BhY2thZ2Uv
bGlibmV0Y29uZjIvbGlibmV0Y29uZjIubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIwogCi1MSUJORVRDT05GMl9WRVJTSU9OID0gMi4xLjI4CitMSUJORVRDT05G
Ml9WRVJTSU9OID0gMy43LjEKIExJQk5FVENPTkYyX1NJVEUgPSAkKGNhbGwgZ2l0aHViLENFU05F
VCxsaWJuZXRjb25mMix2JChMSUJORVRDT05GMl9WRVJTSU9OKSkKIExJQk5FVENPTkYyX0lOU1RB
TExfU1RBR0lORyA9IFlFUwogTElCTkVUQ09ORjJfTElDRU5TRSA9IEJTRC0zLUNsYXVzZQotLSAK
Mi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
