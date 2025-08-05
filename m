Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5CDC87FD2
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 15:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2187D83F2B;
	Tue,  5 Aug 2025 15:18:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PAVRF0FTsfrz; Tue,  5 Aug 2025 15:18:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E74383FDD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E74383FDD;
	Tue,  5 Aug 2025 15:18:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 922A81A2
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 790D34027D
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tly8MWtUwyC3 for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 15:18:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 79913401CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79913401CB
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79913401CB
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:25 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b78315ff04so4573549f8f.0
 for <buildroot@buildroot.org>; Tue, 05 Aug 2025 08:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754407103; x=1755011903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wWjTQoF00q8Xooi/+TW+mtgG2a5jjKvcgvWJVaFRt3g=;
 b=Y0oJ9Ck8/7622CmnajwLvD5LoQ5XO0KpXsNdtsYWMxHTx2pfavTFfPQCvzBXscnrlw
 rXC57inTFioMt/RljAWiHrTWgy+oiJk9ZRsguis6IxIbp/2L4td75N8HLNPSWD24WdDr
 77mdHaia+cvQn4bgZuakjxZEKhwf8hKc5gK7sKXPpYfQ7nFEUfsyzYDPMu6yGbWjxlMi
 AiuSxaMuUEoQ9/MLOW8dJfTzRaGrEXQ3l+n2ntW4zzH3OsaLbrOwJfR/A9qgTW5fSW/m
 d4WR9IHqL5e1Gw8MkZm9NDRyXBcax1Q8v/cWR1DeRTdcGCU4YbdvPSrTp5ss8fNdGDxw
 4zkQ==
X-Gm-Message-State: AOJu0YyOpumy4pZzVKqmyawGOGFkLGg8CQlZH+HxRIZlHRLTGXOGLbwr
 GSIwMg07F+tFH8iwY+appmQq9Ez8No1oRhqKNZSryrY4vqTPBRHmKEmsLlsCPud4qKapNDfmO+v
 tBX3s
X-Gm-Gg: ASbGncuDytPdZ09CoeainR0hRbww3SbhGVKEzi+xfJFV6/vresN385lWxJNlRJfbFWK
 hJ6uOLIPORIG6E7AfGVk9R3w5rEm9f9OjH/rB+Bjf431zUJc+nUfsnS+KyJpbPvMgjinTngSH1X
 xiRyzoOTt4n+dAzbxwjkTBipWefqxzby55vhUwFWhBf2SEZdabla5XtH53C+Y5ryx+3NERB/CWo
 GDraZgXem4bKOBQmHdGk/ItPe8K28y73AcmStaPaUVYFKl2yDHskzvQKOwGpnmwZibaIFETpck2
 UkZFrc/qdBYm0w/TRBSygsJMLG0+gfuGG7GHu7qywYB21QDwX0ZQ2SqJqrDgoq0k1SAUhD54gRl
 wm8kG2z+L1zP+LybTd3StFL4=
X-Google-Smtp-Source: AGHT+IFf5S9O7VsiZCX/AUa7eNEH14ZXkJXd+DLazO/vBGRFCbTm3RRTcjkSfLtM2lwO8UTQ8PMt/g==
X-Received: by 2002:a05:6000:1886:b0:3b8:d271:cdc5 with SMTP id
 ffacd0b85a97d-3b8d94bb377mr9281790f8f.34.1754407102876; 
 Tue, 05 Aug 2025 08:18:22 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c46ee84sm19146073f8f.57.2025.08.05.08.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 08:18:19 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 856725F8A5;
 Tue, 05 Aug 2025 16:18:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Tue,  5 Aug 2025 16:18:07 +0100
Message-ID: <20250805151814.1114414-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250805151814.1114414-1-alex.bennee@linaro.org>
References: <20250805151814.1114414-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754407103; x=1755011903; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wWjTQoF00q8Xooi/+TW+mtgG2a5jjKvcgvWJVaFRt3g=;
 b=ceL0DXKJjBoUiUHkCRclPyMNxl7m7W1Pb5s3iJx3CWYGFXdTU0n5XXRPi3leKKcpU9
 kZ/9nXmBWnsJyy0X5yX/WXAyASiBtDHn2ArasgLZXKXuo8CNkh6KQulB6dCC/+KV1UZG
 /aj41nwW5bDTzfw0LWPaz8mnb3PAgCqqBXEtfdDzDBjj6ktW9mZpj/gBcIuQ7J+kFkbI
 gGt447QokMsjix8N0nkL3fIeZWyXH/vroLra4DZ8ibP5kqwG37AdL13yTxc477eunBMY
 rBerDzuR4XiLXemFjT0y4oQa1HCaIV98BRnGmgW2P4aXnUyX39xfrV1ApPNdp43FgBhj
 ANEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=ceL0DXKJ
Subject: [Buildroot] [PATCH v4 5/9] package/kvm-unit-tests: bump to
 v2025-07-31
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
Cc: Thomas Huth <huth@tuxfamily.org>, Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VXBkYXRlIHRvIHRoZSBjdXJyZW50IHZlcnNpb24gb2YgS1ZNIHVuaXQgdGVzdHMuIFRoZSBtYWlu
IGNoYW5nZQpzaW5jZSB0aGUgbGFzdCBjaGVjayBwb2ludCBpcyBzdXBwb3J0IGZvciBrdm10b29s
IHRvIGxhdW5jaCB0ZXN0cy4KClNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5u
ZWVAbGluYXJvLm9yZz4KCi0tLQp2MwogIC0gcmV3b3JkIGNvbW1pdAogIC0gbW92ZSB0byBjdXJy
ZW50IG1hc3RlciBzbyB3ZSBjYW4gdXNlIGt2bXRvb2wgYXMgd2VsbAogIC0gZGlkbid0IGFwcGx5
IHRoX2h1dGgncyByLWIgYXMgbW92ZWQgdG8gbWFzdGVyCnY0CiAgLSBjaGFuZ2UgZnJvbSBzbmFw
c2hvdCB0byB2MjAyNS0wNy0zMQogIC0gcmV3b3JkIGNvbW1pdCBtZXNzYWdlIGFnYWluCi0tLQog
cGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5oYXNoIHwgMiArLQogcGFja2Fn
ZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5oYXNoIGIvcGFja2FnZS9rdm0tdW5pdC10
ZXN0cy9rdm0tdW5pdC10ZXN0cy5oYXNoCmluZGV4IGFkMDkyMmRmNTkuLjZmYjdkZWEyYzYgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMuaGFzaAorKysg
Yi9wYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLmhhc2gKQEAgLTEsNCArMSw0
IEBACiAjIExvY2FsbHkgY29tcHV0ZWQKLXNoYTI1NiAgNjAwMTViMDIzZjM0MjYxYzEzNGQ3MTRm
NDY3MDkyNmFjODE0ODNlMjg2YTE2NDc1ZWI0YTVjZWRhYjAwZWVmYSAga3ZtLXVuaXQtdGVzdHMt
djIwMjUtMDYtMDUudGFyLmJ6Mgorc2hhMjU2ICA4MDUyZTFmNzBiZmIzYjBjODk0YjhlZjcxZTM4
NDdmNTMzYjNkOTU3Mjc3ZGQwNGIzMjcwZjMzMzMyZDQxNzBiICBrdm0tdW5pdC10ZXN0cy12MjAy
NS0wNy0zMS50YXIuYnoyCiBzaGEyNTYgIGIzYzljYTllMjU3ZjJlYWFlMDcwY2YwY2NkZjg3NzA3
NjRmMDVhOTQ3YTM5YTgzNWU2MzM0MTM3NTBhNTc3N2IgIENPUFlSSUdIVAogc2hhMjU2ICA4MTc3
Zjk3NTEzMjEzNTI2ZGYyY2Y2MTg0ZDhmZjk4NmM2NzVhZmI1MTRkNGU2OGE0MDQwMTA1MjFiODgw
NjQzICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0
LXRlc3RzLm1rIGIvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5tawppbmRl
eCAxZWQ5MDJiMWEwLi4xZDdlZWMyZDIxIDEwMDY0NAotLS0gYS9wYWNrYWdlL2t2bS11bml0LXRl
c3RzL2t2bS11bml0LXRlc3RzLm1rCisrKyBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVu
aXQtdGVzdHMubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwog
Ci1LVk1fVU5JVF9URVNUU19WRVJTSU9OID0gMjAyNS0wNi0wNQorS1ZNX1VOSVRfVEVTVFNfVkVS
U0lPTiA9IDIwMjUtMDctMzEKIEtWTV9VTklUX1RFU1RTX1NPVVJDRSA9IGt2bS11bml0LXRlc3Rz
LXYkKEtWTV9VTklUX1RFU1RTX1ZFUlNJT04pLnRhci5iejIKIEtWTV9VTklUX1RFU1RTX1NJVEUg
PSBodHRwczovL2dpdGxhYi5jb20va3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMvLS9hcmNo
aXZlL3YkKEtWTV9VTklUX1RFU1RTX1ZFUlNJT04pCiBLVk1fVU5JVF9URVNUU19MSUNFTlNFID0g
R1BMLTIuMCwgTEdQTC0yLjAKLS0gCjIuNDcuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
