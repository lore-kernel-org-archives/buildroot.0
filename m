Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8A7C282EC
	for <buildroot@archiver.kernel.org>; Thu,  6 Mar 2025 14:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37FD68361C;
	Thu,  6 Mar 2025 14:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q45i8KwSQWtg; Thu,  6 Mar 2025 14:36:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46D4A83639
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46D4A83639;
	Thu,  6 Mar 2025 14:36:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9071395F
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 14:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F2B440BF2
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 14:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FD1eHOHLBkUB for <buildroot@buildroot.org>;
 Thu,  6 Mar 2025 14:35:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=mickael.tansorier@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF1D340BE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF1D340BE8
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF1D340BE8
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 14:35:56 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3912baafc58so450293f8f.1
 for <buildroot@buildroot.org>; Thu, 06 Mar 2025 06:35:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741271754; x=1741876554;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/rlB1l3V9E51n9C4unJV8DwCyeFLCTlKV5ywZeG+ch4=;
 b=sJ8Oz8tfpZ8dudc2TDJlhq5I/ljp/CLtRx3VjT1thxCgTnuF9x3kQKCC4A7VVW9Oad
 NW7H3HBPyf3u0Vj48r/HGZGL+QhUhlitZ6Xi9aI4CBeTxPpIlyzEXEnb5KwlBR9W2vX9
 CO+f4ejxBpOwUI42k9j+jRjLelDnA/7oDqq+vTzXWM+PnwdOZ23prlnAIgWY8j4KQyV3
 W4Sz2ulB4+WFgYyIo6ky5nB0MVyyKaw9SpJhDp0uD610S9iuTyFgLoZVNRe8D6yvxe3X
 Bko7ToG/xdiiQB36Za791vxqRRSn3F/of4/PeRk/Lucof3vlHIkVi3nXBkhj3VMn4PIi
 vI7g==
X-Gm-Message-State: AOJu0YzGheh8FufDE9g1Vb5Ktg7MrH3E4robkbAfUUzaMYIASmhKBgZV
 7tTD/Etc4TWTN/1WKB6oDfCU3PNmtLh6HrCHUv29hSYuAI6K9YTIn8hb78LDSqDgq9TTY9PCeIX
 0
X-Gm-Gg: ASbGncvJaJGiFI8DT4VUL7HTuVZmsOCJD9hJGSsxKJvMrh+ViWGuVPdSdUKAA2Qxy9C
 bfXMG4DXQ09wg2FRTPTfli6aiFCHcZKIczwpBMl6LXKPWAcsq7yio7RMkv/5lTtFqe1UE3Nekly
 1ad7nm6qWHgxLicwT7NqQuC//6IOaYjvzz7acsW3gGO3/7apHIrcgRQ/D977DILGOycLtrxLS6R
 Z47U+44xfn7iCTXDrKRwjkQ+apoQPs6gca/wIrzNR7ex7N0GwSJu9dTuJ+V1XxFSryKeFcEjVNh
 sbB5vvkxV3sHd9312JJJsxchaw+bF9GGGnTxGcq7BTkx3xmWuVgJ5GyvYHyFa/LVangs7lF0H3B
 nFJr0IoiNYevyxuWiXHH62dYz21/Yb/aHZZjT9l+Ld+nh
X-Google-Smtp-Source: AGHT+IHi5GM4mm1xiIMyVOl1ObKKKq/aJZ49yao0AMtRBGxJ3shq6TNoytnF6plqXn4KMVyTT/hrrA==
X-Received: by 2002:a05:6000:2d0e:b0:390:dfa1:3448 with SMTP id
 ffacd0b85a97d-3911f7af240mr4747178f8f.43.1741271754415; 
 Thu, 06 Mar 2025 06:35:54 -0800 (PST)
Received: from baku.localdomain
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd93c9d6sm21475045e9.26.2025.03.06.06.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 06:35:54 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Micka=C3=ABl=20Tansorier?= <mickael.tansorier@smile.fr>
Date: Thu,  6 Mar 2025 15:35:52 +0100
Message-ID: <20250306143552.1719990-1-mickael.tansorier@smile.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1741271754; x=1741876554; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/rlB1l3V9E51n9C4unJV8DwCyeFLCTlKV5ywZeG+ch4=;
 b=XtI64exQPICYTyR6a7fYjzc23f4qNUwCg4x3VI6AbJJS8fllZBkYCr+mEZcRCBPBBy
 OpWSEFU/6alOD7ZMn2uiXoumcd9GLHwmr7bkn2ClqHGY+BiJEboLydTEmaiB6sCDdtrU
 XC0TJlCVNCi/bZ1862DSJDJoRmB/TSXPBn/qw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=XtI64exQ
Subject: [Buildroot] [PATCH] package/minetest: Fix missing license about
 irrlicht
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
From: =?utf-8?q?Micka=C3=ABl_Tansorier_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Micka=C3=ABl=20Tansorier?= <mickael.tansorier@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

aXJybGljaHQgd2FzIGluY2x1ZGUgZGlyZWN0bHkgaW50byBzb3VyY2UgY29kZSBhZnRlciB2ZXJz
aW9uIDUuOVsxXQoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9taW5ldGVzdC9pcnJsaWNodC9ibG9i
L21hc3Rlci9SRUFETUUubWQKClNpZ25lZC1vZmYtYnk6IE1pY2thw6tsIFRhbnNvcmllciA8bWlj
a2FlbC50YW5zb3JpZXJAc21pbGUuZnI+Ci0tLQogcGFja2FnZS9taW5ldGVzdC9taW5ldGVzdC5o
YXNoIHwgMSArCiBwYWNrYWdlL21pbmV0ZXN0L21pbmV0ZXN0Lm1rICAgfCAyICstCiAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvbWluZXRlc3QvbWluZXRlc3QuaGFzaCBiL3BhY2thZ2UvbWluZXRlc3QvbWluZXRlc3Qu
aGFzaAppbmRleCA1ZDg1OTM4NGNhLi4wNDc3ZGM1ZDJhIDEwMDY0NAotLS0gYS9wYWNrYWdlL21p
bmV0ZXN0L21pbmV0ZXN0Lmhhc2gKKysrIGIvcGFja2FnZS9taW5ldGVzdC9taW5ldGVzdC5oYXNo
CkBAIC0yLDMgKzIsNCBAQAogc2hhMjU2ICBmODE3MzQzNjc4MmI1YTI1NDRhYTE5YzU0ZjU3MmE4
MTgzMWI2Y2ZjODk0ODA3MzdjY2Y2NzY4OTkyYzY1MWVhICBtaW5ldGVzdC01LjkuMS50YXIuZ3oK
IAogc2hhMjU2ICBiMzhjOGQ0MjhjZWRkZjhlOWI0OWRjYTYzNjEwYzc0NDk5ZDk1Mjg5NWQ3NTZi
N2VhYjVmNWQ0Y2VmMjk1NGY2ICBMSUNFTlNFLnR4dAorc2hhMjU2ICAyYzk0MzQ4ODZkMzE0NGVh
ZDYwNmI5NTljZjYxZGM0MTkzNWQxNzU0YzA3NGY0NzM1NDFkYTRhM2RkNDA0ZWZhICBpcnIvTElD
RU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9taW5ldGVzdC9taW5ldGVzdC5tayBiL3BhY2thZ2Uv
bWluZXRlc3QvbWluZXRlc3QubWsKaW5kZXggYjA3ZWE1N2VhNy4uYWMwZWE0ZWY1MiAxMDA2NDQK
LS0tIGEvcGFja2FnZS9taW5ldGVzdC9taW5ldGVzdC5taworKysgYi9wYWNrYWdlL21pbmV0ZXN0
L21pbmV0ZXN0Lm1rCkBAIC02LDcgKzYsNyBAQAogCiBNSU5FVEVTVF9WRVJTSU9OID0gNS45LjEK
IE1JTkVURVNUX1NJVEUgPSAkKGNhbGwgZ2l0aHViLG1pbmV0ZXN0LG1pbmV0ZXN0LCQoTUlORVRF
U1RfVkVSU0lPTikpCi1NSU5FVEVTVF9MSUNFTlNFID0gTEdQTC0yLjErIChjb2RlKSwgQ0MtQlkt
U0EtMy4wICh0ZXh0dXJlcyBhbmQgc291bmRzKQorTUlORVRFU1RfTElDRU5TRSA9IExHUEwtMi4x
KyAoY29kZSksIENDLUJZLVNBLTMuMCAodGV4dHVyZXMgYW5kIHNvdW5kcyksIFpsaWIgKGlycmxp
Y2h0KQogTUlORVRFU1RfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UudHh0CiBNSU5FVEVTVF9DUEVf
SURfVkVORE9SID0gbWluZXRlc3QKIAotLSAKMi40OC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
