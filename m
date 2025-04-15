Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BB3C369B8
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 08:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2C6740CDA;
	Tue, 15 Apr 2025 08:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mFwF-PCzmwYF; Tue, 15 Apr 2025 08:57:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6B45406D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6B45406D9;
	Tue, 15 Apr 2025 08:57:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D42F109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 08:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E92874194A
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 08:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAYeJRWZ0W_k for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 08:57:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D1F7241945
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1F7241945
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1F7241945
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 08:57:50 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3912b75c0f2so427023f8f.0
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 01:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744707468; x=1745312268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vSqwWuM+t83hkWLx5BCvndj1zdbqbKas3BYVCciEXkk=;
 b=Jjqr2fGTnCITB8g6fm48yT9UJmXq7/E7zp9C47oB37+IKE22X70JKRcQ9H24eIX/J2
 g8NrMl2MDupO/8d61Lx5MOoVTa5jDat08W20viWvgZe4LNWBEIvKyx1X1VelIxDG055j
 uKNgXYShxhOGsq8ZGs1ryox133oMLBoxiZmu0GORJngNrRbqZMXI/kZQKY+0UUHndLt5
 tzHrIT912BtuKUM8COumSRKjhWU+0+8RVk5R1hloKnlNUR4GXYifNuKPU7K6ClJsSnfh
 YPM26MVP+ACLI72kl6+wgW0EKNwTKplLR/XjqkZLMCwzNr+cNQsZNC4WKTOpeIsmmSS6
 OYfQ==
X-Gm-Message-State: AOJu0Yx3/LieMH+QSa62sDzrnNHNKewXm3gltTshNv07oOgybWKbO2KU
 XhCgr5aeHs3a6mfqHm/PMFYafASwPhxOzKHjeDvEMhj5siarwwccHtaMrTfl
X-Gm-Gg: ASbGncuJGARqTFUyzHJ4AUNjlqVSovJxoiuMQWDZEq+uaQxnsg3F9r+PCKHHUYqOlP1
 DKckaGduZu6bGoikS2+LHWQ8lOfDpbdC0/JaZoojFrgTFStpwt7fMEF6R15MEQJHY+6OkWmymbE
 gALE4Xv+JTeJBPE6js9v+2o3RNpst1CFrUNKMRJ3rAYEKTuBdWvoO6xWcIzfieg40x1bKpVntCo
 VUznYWcBKUEIJo9dFOroP2puwVQe5z8HD3V/9r+rKRJ0H1icghlA+5xgAYAKlbUFK8gSQgu5uLq
 X1CIUryYso/Dn+ZKwo5iYKyYQXDdZtRaw4MffJXRT4/bq08ggrI=
X-Google-Smtp-Source: AGHT+IFg/KL0GODW3XGe1JjMoE50xPf3GkGLMIql9CVDBmzfzI/t5qn+8l7XUWQrjkw/ILcZlRJDnw==
X-Received: by 2002:a05:6000:4211:b0:39c:30d8:a44 with SMTP id
 ffacd0b85a97d-39ea520470bmr4306329f8f.5.1744707468326; 
 Tue, 15 Apr 2025 01:57:48 -0700 (PDT)
Received: from archlinux.. ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96c661sm13357921f8f.29.2025.04.15.01.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 01:57:47 -0700 (PDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>
Date: Tue, 15 Apr 2025 10:57:36 +0200
Message-ID: <20250415085737.1827669-3-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415085737.1827669-1-gael.portay+rtone@gmail.com>
References: <20250415085737.1827669-1-gael.portay+rtone@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744707468; x=1745312268; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vSqwWuM+t83hkWLx5BCvndj1zdbqbKas3BYVCciEXkk=;
 b=bjC4UeiKGxBg3HZ7J9KyzcJrwvxiiiclExKLu3jD057xPhVe719LjShRLn31cUEO/w
 nCsvIAFzdXCfpuIOAFNh7rUZuUcCCy5pMBZpxYnU6J/q+WNfg8Gc4afA3Wf/K8LFhwmh
 Zwnjk8AyQ3P0WOSoSQ5MQTKvW7eTrvQaIifeO72vomtSbZX1n8ZNle2Y7aIfLLr2bY/R
 EF1Zt0JowXGbCg/hXjBHnnjgAcOlNjbJYl1j5150Vx/8rkqEhvz9CA9ZJvh3Cx75685Y
 F498NH9YSLd29teO2CPdjs0+VixQjf36uPdFZ66BIV5OhPeQutRKmQBBVY8P+h4EV1xo
 guTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bjC4UeiK
Subject: [Buildroot] [PATCH 2/3] package/rpi-firmware: bump version to
 1.20250326
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

VGhlIHZlcnNpb24gMS4yMDI1MDMyNlsxXSBtYXRjaCB0aGUga2VybmVsIDYuMTIuMjBbMl0uCgpb
MV06IGh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnlwaS9maXJtd2FyZS9jb21taXQvZjQ5YTM5
NjAyMjNmMjBlYTBiMmUzMDY0NmY2NWJlNjdiYWZlMzBkYwpbMl06IGh0dHBzOi8vZ2l0aHViLmNv
bS9yYXNwYmVycnlwaS9saW51eC9jb21taXQvY2QyMzFkNDc3NWIxNGYyMjg2MDZjMDlmMjE5YjQ4
MzA4ZjZhYjNhYQoKU2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheStydG9u
ZUBnbWFpbC5jb20+Ci0tLQogcGFja2FnZS9ycGktZmlybXdhcmUvcnBpLWZpcm13YXJlLmhhc2gg
fCAyICstCiBwYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUubWsgICB8IDIgKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2FyZS5oYXNoIGIvcGFja2FnZS9ycGkt
ZmlybXdhcmUvcnBpLWZpcm13YXJlLmhhc2gKaW5kZXggNDUwMWRiNzM5Yy4uYzJjYTkzNDNmMSAx
MDA2NDQKLS0tIGEvcGFja2FnZS9ycGktZmlybXdhcmUvcnBpLWZpcm13YXJlLmhhc2gKKysrIGIv
cGFja2FnZS9ycGktZmlybXdhcmUvcnBpLWZpcm13YXJlLmhhc2gKQEAgLTEsMyArMSwzIEBACiAj
IExvY2FsbHkgY29tcHV0ZWQKLXNoYTI1NiAgMDBmZTU0ODczNzZlOWQ1ZWQxNGNiYzcyYTliN2E1
YmQ4ZDY5MDBjODRhZWUxMGY2ZDY1NmYxOTJhMjZkMTYxYyAgcnBpLWZpcm13YXJlLTU0NzY3MjBk
NTJjZjU3OWRjMTYyNzcxNTI2MmIzMGJhMTI0MjUyNWUudGFyLmd6CitzaGEyNTYgIGIxMjA2MjVj
MWUwZDJkZWM4MTk2MzhhNmZkYTk3Yzc0ZDFjODZlMTg0YzZhNDI2M2NkZjA0ZmFhMmQ1YmJlMmUg
IHJwaS1maXJtd2FyZS0xLjIwMjUwMzI2LnRhci5negogc2hhMjU2ICBjNzI4M2ZmNTFmODYzZDkz
YTI3NWM2NmUzYjRjYjA4MDIxYTVkZDRkOGMxZTdhY2M0N2Q4NzJmYmU1MmQzZDZiICBib290L0xJ
Q0VOQ0UuYnJvYWRjb20KZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJt
d2FyZS5tayBiL3BhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2FyZS5tawppbmRleCA3YWU5
ZmY2YzI4Li5jNzQzN2Y1ZDE3IDEwMDY0NAotLS0gYS9wYWNrYWdlL3JwaS1maXJtd2FyZS9ycGkt
ZmlybXdhcmUubWsKKysrIGIvcGFja2FnZS9ycGktZmlybXdhcmUvcnBpLWZpcm13YXJlLm1rCkBA
IC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotUlBJX0ZJUk1XQVJF
X1ZFUlNJT04gPSA1NDc2NzIwZDUyY2Y1NzlkYzE2Mjc3MTUyNjJiMzBiYTEyNDI1MjVlCitSUElf
RklSTVdBUkVfVkVSU0lPTiA9IDEuMjAyNTAzMjYKIFJQSV9GSVJNV0FSRV9TSVRFID0gJChjYWxs
IGdpdGh1YixyYXNwYmVycnlwaSxmaXJtd2FyZSwkKFJQSV9GSVJNV0FSRV9WRVJTSU9OKSkKIFJQ
SV9GSVJNV0FSRV9MSUNFTlNFID0gQlNELTMtQ2xhdXNlCiBSUElfRklSTVdBUkVfTElDRU5TRV9G
SUxFUyA9IGJvb3QvTElDRU5DRS5icm9hZGNvbQotLSAKMi40OS4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
