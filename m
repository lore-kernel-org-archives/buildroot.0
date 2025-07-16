Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24199C83F1B
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 13:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C25CB60F9F;
	Wed, 16 Jul 2025 13:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gR6ikAhnEizf; Wed, 16 Jul 2025 13:32:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D62A60B24
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D62A60B24;
	Wed, 16 Jul 2025 13:32:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A3F4B11AA
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 13:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A05A608AA
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 13:32:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KH5OaKEQbKaY for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 13:32:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=gero.schwaericke@sevenlab.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E2DE60634
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E2DE60634
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E2DE60634
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 13:32:31 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ae04d3d63e6so1272185466b.2
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 06:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752672749; x=1753277549;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V9pOYjUIbYQoqVB/pIsIHCVepYNWh+Jw2IDxwCVQ+Mc=;
 b=Mf+eSvqWM3+pBvubR2dcQ/Px3fwEA/G6PlPrQLjnah9YgyGbVel5cFkzoKYNNBqr+i
 IsyDgxb4gLoEjIfvGOkC44BYVa8Gi7worbfiSNApKiJdTlxnZKV5AS1VBsh2Ms7z+EHr
 qqJkieB8B3UihYdLhHzlpelvll76vKNjF4sE++Rw8XwMppsCqNiY4AqCH127TpUHCtQr
 l1I3vLR7l1UkwOnxhKlcXd+jN3iJgeHU3L/4u/Aj8mBIOs9mPgM+AReqrDU++FkfKooX
 /WjLCbnE9kikdcl94VuiHskP6pk041jXyM5blmQrK645ogPUbJrkxqW2A6vxBI4CtN65
 8INg==
X-Gm-Message-State: AOJu0Yxr42E1AMaxxaQygj2+3y1oUN0ABlWzQMPorMFR5/rZDlXNhyxp
 rDhU/jJCuWKp6jy1G8SdNvPSZsLIzH6WvhpXNCPIO5kws08R6nK+q5aYpafNyqjMaV9e9/PR/kc
 /cQR6
X-Gm-Gg: ASbGncvo9RD0hXlnLABHmmjy2pRFkFqz5vYXYWNp1NzAcfZkVsHTq85vIdYH7vc+1O7
 97HRcsoralXL/82uDXdQB8I6F70cq3BXgyjRzdZJRmtsBZ9d/Nb+MFHMA4wmglMJqWn8mHUE2Rs
 jWTkUXXOU3jvDagUCxeUqotnq8YvFirCmTuwz9i++MLmNWEW6IqOMaQqZ0yxWU5UcIBKg24ctj+
 xC70gpFm/23bziU0lCet8s8oNkW9QFB/uKyg/yHAJ0i9mFmSHhzGsFJLDUUGRpB/B3lZ10lvRYc
 odyUXj0+TThnf5Z+oerXy0vz1PD2PFE+kPHBYsQzq8pAanexr3f7Qn+PNelmzyq4oSgFyOaKesn
 3e/t2YenuZPMMGb1HjD4CFO8WTrgs+LxHqGaZlBNbSKM=
X-Google-Smtp-Source: AGHT+IHEC4s8Fqw4kXWUvD9Kxrn/SSwD9ImFj+hv2UhH90HGGPlprOPBitkLO41iSI0UGqE8XZowHg==
X-Received: by 2002:a17:907:724c:b0:ae3:6028:e4d0 with SMTP id
 a640c23a62f3a-ae9cddb0405mr284886966b.7.1752672749196; 
 Wed, 16 Jul 2025 06:32:29 -0700 (PDT)
Received: from Theia.fritz.box ([2a02:8109:8a91:de00:4226:6562:cd55:1257])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e8294b6bsm1201218366b.130.2025.07.16.06.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 06:32:28 -0700 (PDT)
From: =?UTF-8?q?Gero=20Schw=C3=A4ricke?= <gero.schwaericke@sevenlab.de>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Gero=20Schw=C3=A4ricke?= <gero.schwaericke@sevenlab.de>,
 Colin Foster <colin.foster@in-advantage.com>
Date: Wed, 16 Jul 2025 15:30:51 +0200
Message-ID: <20250716133220.3484511-1-gero.schwaericke@sevenlab.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sevenlab-de.20230601.gappssmtp.com; s=20230601; t=1752672749; x=1753277549;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V9pOYjUIbYQoqVB/pIsIHCVepYNWh+Jw2IDxwCVQ+Mc=;
 b=VWWsXx/oBEYUok8v5WqhoZJSMOf+9GEBebT0RK0iCwthmK+/F3L3mqZE0Z/LIYvTO4
 SEB0mMzAHnqqrU6h4/HzYrCGyoc8nu23F2bm+GuJDqVtTSCQPHqV9MCMA0gQZpCOY4Iu
 6Mwm04ixsNj4CP8pI37npo7FwiuDk6MDoVkYarK6Idd6Zpm00SWLGYslUW2ulhEleKjM
 i1/btG4H+NmsMvPU6/+HppHKYVwjuL3tcL4absNSHTAQe+vpPoyXSUQzj4w4rAGuY0bE
 g1OrXC5/47ZUcQScQDQtK9bO9F61C8OCBNjUDkYH+klmKMwzAjfl50xdm7d2FqRmS0O7
 ZPAg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=sevenlab.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sevenlab-de.20230601.gappssmtp.com
 header.i=@sevenlab-de.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=VWWsXx/o
Subject: [Buildroot] [PATCH v2] package/rauc-hawkbit-updater: fix missing
 user
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

U3lzdGVtZCBzdXBwb3J0IGZvciB0aGUgUkFVQyBoYXdrYml0IHVwZGF0ZXIgd2FzIGFkZGVkIGlu
CgogIDRhYTdhNGFkOGEgKHBhY2thZ2UvcmF1Yy1oYXdrYml0LXVwZGF0ZXI6IGFkZCBzeXN0ZW1k
IG9wdGlvbmFsIGRlcGVuZGVuY3ksIDIwMjQtMDctMTApCgpUaGlzIGluc3RhbGxzIHRoZSBSQVVD
IGhhd2tiaXQgdXBkYXRlciBzZXJ2aWNlLCB3aGljaCBleGVjdXRlcyBhcyB1c2VyCiJyYXVjLWhh
d2tiaXQiIFsxXSwgd2hpY2ggZG9lc24ndCBleGlzdCBieSBkZWZhdWx0LgoKWzFdIGh0dHBzOi8v
Z2l0aHViLmNvbS9yYXVjL3JhdWMtaGF3a2JpdC11cGRhdGVyL2Jsb2IvMjcxMWMwZTAyNzgxZWI5
ZDk3Mjg1Yzg3MTk3ZjFiYWZlZjc1ZDBkMS9zY3JpcHQvcmF1Yy1oYXdrYml0LXVwZGF0ZXIuc2Vy
dmljZQoKU2lnbmVkLW9mZi1ieTogR2VybyBTY2h3w6RyaWNrZSA8Z2Vyby5zY2h3YWVyaWNrZUBz
ZXZlbmxhYi5kZT4KLS0tCkNoYW5nZXMgdjEgLT4gdjI6Ci0gQ2hhbmdlIHBhc3N3b3JkIGZpZWxk
IGZyb20gISAobG9naW4gZGlzYWJsZWQpIHRvICogKGxvZ2luIG5vdCBhbGxvd2VkKQotLS0KIHBh
Y2thZ2UvcmF1Yy1oYXdrYml0LXVwZGF0ZXIvcmF1Yy1oYXdrYml0LXVwZGF0ZXIubWsgfCA0ICsr
KysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdl
L3JhdWMtaGF3a2JpdC11cGRhdGVyL3JhdWMtaGF3a2JpdC11cGRhdGVyLm1rIGIvcGFja2FnZS9y
YXVjLWhhd2tiaXQtdXBkYXRlci9yYXVjLWhhd2tiaXQtdXBkYXRlci5tawppbmRleCBkYTFjMDIw
YmI2Li5lMzFhNGRlYjVmIDEwMDY0NAotLS0gYS9wYWNrYWdlL3JhdWMtaGF3a2JpdC11cGRhdGVy
L3JhdWMtaGF3a2JpdC11cGRhdGVyLm1rCisrKyBiL3BhY2thZ2UvcmF1Yy1oYXdrYml0LXVwZGF0
ZXIvcmF1Yy1oYXdrYml0LXVwZGF0ZXIubWsKQEAgLTE1LDYgKzE1LDEwIEBAIFJBVUNfSEFXS0JJ
VF9VUERBVEVSX0NGTEFHUyA9ICQoVEFSR0VUX0NGTEFHUykgLXN0ZD1jOTkKIGlmZXEgKCQoQlIy
X1BBQ0tBR0VfU1lTVEVNRCkseSkKIFJBVUNfSEFXS0JJVF9VUERBVEVSX0RFUEVOREVOQ0lFUyAr
PSBzeXN0ZW1kCiBSQVVDX0hBV0tCSVRfVVBEQVRFUl9DT05GX09QVFMgKz0gLURzeXN0ZW1kPWVu
YWJsZWQKKyMgcmF1Yy1oYXdrYml0LXVwZGF0ZXIuc2VydmljZSB1c2VzIHRoaXMgdXNlciBhbmQg
Z3JvdXAKK2RlZmluZSBSQVVDX0hBV0tCSVRfVVBEQVRFUl9VU0VSUworCXJhdWMtaGF3a2JpdCAt
MSByYXVjLWhhd2tiaXQgLTEgKiAtIC0gLSBSQVVDIEhhd2tiaXQgVXBkYXRlcgorZW5kZWYKIGVs
c2UKIFJBVUNfSEFXS0JJVF9VUERBVEVSX0NPTkZfT1BUUyArPSAtRHN5c3RlbWQ9ZGlzYWJsZWQK
IGVuZGlmCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
