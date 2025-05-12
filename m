Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DADFC3ABC3
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 17:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C17E607B5;
	Mon, 12 May 2025 17:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mvdQvhUmQk7i; Mon, 12 May 2025 17:35:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38424607E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38424607E5;
	Mon, 12 May 2025 17:35:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 60042150
 for <buildroot@buildroot.org>; Mon, 12 May 2025 17:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50F0E40852
 for <buildroot@buildroot.org>; Mon, 12 May 2025 17:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nwZdsUwnMkBG for <buildroot@buildroot.org>;
 Mon, 12 May 2025 17:35:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7BA694084E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BA694084E
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BA694084E
 for <buildroot@buildroot.org>; Mon, 12 May 2025 17:35:15 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-54fc29f01c4so4820234e87.1
 for <buildroot@buildroot.org>; Mon, 12 May 2025 10:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747071313; x=1747676113;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J9s3NZBvtkugdLdBJDbm8i7qetTiP73ZPazKwvDHcXg=;
 b=Z74AZ0wTMNHYdJe9WStMiLJnYpo/dSdd6d+y/U6v73sZqTsdj+MNM0pqn2UYJ6d+Fi
 DBAjSIlVk0vZnBibQDVsQD7AoQfFSdvhiZUyNADlln2Iabcv+glWafF5ckw3zzwHvpHO
 ZtzZj8VONQKTI0czy1SdW7fq01gtt+12psQBAAQwysHKjXzdoXiR6XDr52RmRhj+2Msl
 MFOkeLD23VfDKe+ggaQB7J2cjcFfhq7o4MShrn64924cRltcy7iLKFTXU2pmAL/6yLSx
 v9xecCcUBQD+FCIbcnLIFVnnNgpbV4b+Crdft70O1xj98tpwYePCkJJSDkVkb0VVdEyV
 uSLQ==
X-Gm-Message-State: AOJu0Ywx9BtFg8OVcrhW71rvort58wY4opGDWgFli2Ff7w9lxAPZcZ0U
 toT4DuM+Zxa0WjItZsDigeoRl9BSEU8m3rGP18jUjrHnYFfi+njE+c3jdkqn
X-Gm-Gg: ASbGnctPg/V/xWmVhL2n6YoN6/C4AkVgh1UVmZb5lxvS9rZPg9N/uxYTkYb+/pRQKP7
 duMbU7GfEBF7AzUSPp7Omc/byYv2b0JjyFYlC+fLEWj+mPKTDwftxOTy8gIqkwRaf8AFvvDMSfT
 yNsYaMDQj+jkioUiSshvpAyt1KbsAFDYWIB6rgffMk9HpZfEz9O30pkDOqSmwnw2sPS0s6T6lNq
 gk7kusbwrAwiEr0axC26HJOU6FXVzHQiAEAxFWlXaQue6mCRK8LMf8WEcSHRT5Rxqf5g3ciu+eP
 h+zx8cYUMl3LAAq4+VMFx7GH7KtAnhOlhEZLJwUqNsshRT1qHXlhg5CXkmus2EsOhlAxTas8ZFs
 =
X-Google-Smtp-Source: AGHT+IFOqcqjrp74fegpGVR2xqhXtSrC6cblDWn5JER/AtRJqlsvK+1M4agcFNN6gRx4PHwdsHJtCg==
X-Received: by 2002:a05:6512:460b:b0:54a:f757:f8b3 with SMTP id
 2adb3069b0e04-54fc6762655mr4560773e87.0.1747071312662; 
 Mon, 12 May 2025 10:35:12 -0700 (PDT)
Received: from tollan.lan (b106.broadband9.quicknet.se. [194.132.233.106])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc645d93asm1582086e87.101.2025.05.12.10.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 10:35:12 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Mon, 12 May 2025 19:35:02 +0200
Message-ID: <20250512173506.3179898-3-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512173506.3179898-1-lazzer@gmail.com>
References: <20250512173506.3179898-1-lazzer@gmail.com>
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747071313; x=1747676113; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=J9s3NZBvtkugdLdBJDbm8i7qetTiP73ZPazKwvDHcXg=;
 b=MPNLi3Kb8AYBeGDP1io69PufWQCeO52hWLhA79zCiHF/+/PWQ/4SZO5rMh4L/QWZ9d
 QgZYg6EsQFe+d8his5t9Yquf0qTvXklXpykdq7wEbWKc0KryI2DnpUXvBiiVvExcGgQh
 fm9uSn31PSaxE4vpoz1mZr+5L8vmIvZ6k5OL+hhvtUyjbpZE0TpSJJ0pgp9jOCEDDHoM
 UUdH3aQVf4EE8GNekU8V3zxoN+SbGsnr7h5vSXnKQCHO9ivgQlWKwL8aTAjoDIb9VpAa
 ScvENYibMJumY3tniaBBMUls9AuvHj+5fxMbH30wuKC4Y0AZmt2arVvQoypUiwbGAfEC
 Iysw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MPNLi3Kb
Subject: [Buildroot] [PATCH v3 2/6] package/libyang: bump to version 3.12.2
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

Q2hhbmdlbG9nOgogb3B0aW9uYWwgeHhoYXNoIGZhc3RlciBoYXNpbmcgZnVuY3Rpb24KIHN1cHBv
cnQgZm9yIG1ldGFkYXRhIGluIGRpZmYKIGxvdHMgb2Ygb3B0aW1pemF0aW9ucyBhbmQgZml4ZXMK
ClNpZ25lZC1vZmYtYnk6IE1hdHRpYXMgV2Fsc3Ryw7ZtIDxsYXp6ZXJAZ21haWwuY29tPgotLS0K
IHBhY2thZ2UvbGlieWFuZy9saWJ5YW5nLmhhc2ggfCA0ICsrLS0KIHBhY2thZ2UvbGlieWFuZy9s
aWJ5YW5nLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnlhbmcvbGlieWFuZy5oYXNoIGIv
cGFja2FnZS9saWJ5YW5nL2xpYnlhbmcuaGFzaAppbmRleCBlMDMyNzhhZGZkLi4xNjlkYmI1NDg1
IDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYnlhbmcvbGlieWFuZy5oYXNoCisrKyBiL3BhY2thZ2Uv
bGlieWFuZy9saWJ5YW5nLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY2FsY3VsYXRl
ZAotc2hhMjU2ICA3N2EwYWFhZWIzZGY3MjBhZWI3MGQ2ODk2ZTMyZTJjMmJlMDk5ZDQ4ZGY3M2Uz
Y2ZiNTI1NjcwNTFhZjNlNDRiICBsaWJ5YW5nLTIuMS4xNDgudGFyLmd6Ci1zaGEyNTYgIDBiN2Vj
NDM3NDdkMjExYTFlNDljNTM1ODhiMDgyMjA2Mjk0N2JhYjZiZGNjOTUyMzg1NzhiZWFiMzRjYmE1
YmIgIExJQ0VOU0UKK3NoYTI1NiAgYTJhZTk0Y2U0M2Q4YjRiMDg0ZjY3YzA1OTAyZjk3Y2JjMGVj
ODgyZDM4ZWY1ZGRmMWQ2MDE2NTlmNjRkNWM2NiAgbGlieWFuZy0zLjEyLjIudGFyLmd6CitzaGEy
NTYgIGY0ZmJhYTA5YzhiMmZhYTZhODczYTM4MTgxZmY4NjBlMmZmOTA4MDgzMjBmNzFkZWIzNjlm
MDNkZGZiOTIwZGEgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlieWFuZy9saWJ5YW5n
Lm1rIGIvcGFja2FnZS9saWJ5YW5nL2xpYnlhbmcubWsKaW5kZXggZmNhMGNkNjNmOC4uOTRmOWJh
M2I4YSAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJ5YW5nL2xpYnlhbmcubWsKKysrIGIvcGFja2Fn
ZS9saWJ5YW5nL2xpYnlhbmcubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIwogCi1MSUJZQU5HX1ZFUlNJT04gPSAyLjEuMTQ4CitMSUJZQU5HX1ZFUlNJT04gPSAz
LjEyLjIKIExJQllBTkdfU0lURSA9ICQoY2FsbCBnaXRodWIsQ0VTTkVULGxpYnlhbmcsdiQoTElC
WUFOR19WRVJTSU9OKSkKIExJQllBTkdfTElDRU5TRSA9IEJTRC0zLUNsYXVzZQogTElCWUFOR19M
SUNFTlNFX0ZJTEVTID0gTElDRU5TRQotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
