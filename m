Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2254C282DE
	for <buildroot@archiver.kernel.org>; Mon, 10 Mar 2025 11:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A2B9811D6;
	Mon, 10 Mar 2025 11:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IRWzLRt10tm2; Mon, 10 Mar 2025 11:08:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CE4F81E7F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CE4F81E7F;
	Mon, 10 Mar 2025 11:08:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0276FDC
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 11:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA8F640844
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 11:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eG-8MEQ8TuNT for <buildroot@buildroot.org>;
 Mon, 10 Mar 2025 11:08:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4526A407C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4526A407C0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4526A407C0
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 11:08:47 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso1552015e9.2
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 04:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741604926; x=1742209726;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SabBC+Mm6ccDADzCyS0oaa8TgsHez2xbYq5iVYc7JYQ=;
 b=p3jhq4CNL0n2MF+JB9kOiV+RXQPhb0UfBka3qF1K61D2QYpy/8wcT+OoCpkZM+fXtz
 WiQTfmdlANDnf4bz2iHnGt1vrYlK8gVk9kiV52xRnyVkN0cQqtLlvd6lY0FZkfY6+Pp9
 pwaIymyoLF6ZwzNfhUaV1j5q+hxR/z4s1CV+vAL+FrokUqJU+D4qCD4BCn0IyPI9VxDl
 z9cUrC1dNmBJ4Hj1GmVIVqRa8A2EgjaziGxXAHKpWYFCs2XYGvN4E15dem3UxCCXcy+V
 9CIyV+Wk0mDOjlRBZOZGsYNYdrCfWW5T57VOqUgugR6pZXu3RV0/FCllGW1aCKpwo1Mr
 Hdng==
X-Gm-Message-State: AOJu0YxSjtJ/TmtZaKfOvJtb7OjMvGeXu0pytThhQkOcjQn+PnFnGWe/
 XB1m3qVVCwCCczXRBp0TVl3d8pnuyLXRWIEN7lcJ8FXTMnD4a2EdaY0u6XGRJ/RrkUFqYUpwF3T
 T14o=
X-Gm-Gg: ASbGncs6KvUHvQT6jfcGovg9EsltkPdzGfLQ+kP5B+7nuBJRCoenL72hD4gCDeCSzDc
 24x3/OBfZUmhNlbCu+yG2zTkWZvLphyvk3v7qORNBhfadtaRANtxQ7SP10/8w97fs0X+CJCQuX5
 5lVPEAMsDj5+N3/S+SzB19/dIN0KQRbJX3ssK0t62cU1SOEGM4zVqeG9Oopnq+OTUTrH7ClNn0q
 BP8KiiFnvvDXd1vOIPv+DIa82GiUOC4OAteYfozLabuK92aiM2chbVWiyHisQ0VmxO2hxIgIJpv
 46A5MwKdcCm8FclIbHv43z3MBg467STB/ivxigRofL0C3eLAsfwSuFnqriLO3jeaOzr1uQTaWAc
 GU9o/8ur1nf5MKxiGt9sV0LY/oBr5y0w=
X-Google-Smtp-Source: AGHT+IGfDh1UibAoUZSE3XC5LatWhc9I/4iF9X+A8BURC7K0Y8hvTrSajEkdGMi3K1Mk9Y3JvYUG0A==
X-Received: by 2002:a05:600c:3b1d:b0:43c:fe15:41e1 with SMTP id
 5b1f17b1804b1-43cfe15444emr7325885e9.4.1741604924630; 
 Mon, 10 Mar 2025 04:08:44 -0700 (PDT)
Received: from mind2.local.ess-mail.com (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c103aa5sm14709864f8f.94.2025.03.10.04.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 04:08:44 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 10 Mar 2025 11:08:40 +0000
Message-Id: <20250310110841.1556155-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1741604926; x=1742209726; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SabBC+Mm6ccDADzCyS0oaa8TgsHez2xbYq5iVYc7JYQ=;
 b=e+1vBEpypT3WWELUvBeSvUHaTGsRWo/3xUFODCxxPNWW0HfWM137l8iSUHV6uL46iy
 DyR5nt07cOQ1xvfXqs04lsP6rPgXNBQBAA5yT5DUjd3C7eRRyh7O+63xjLp+sAGiQDIp
 epZhcrZTrpfnh5FXcvPdfsYYNpTq+/cjqnchDqRrtsBe7P2sijhNQLsQuHbi2vKQTc7r
 W1XsDa2tRn+4imSGelJNcqJMPPAOzzB0znCPw9EqU5PqKFBCe//dQqUWfOLiaT5Cb435
 nK6JmBFdOpWpk6imgWkzRDg+oIvxvJuLJ61IYs/linD1aIQCRK6elVSJd+6BlOfNIlWc
 BHYA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=e+1vBEpy
Subject: [Buildroot] [PATCH 1/1] package/jbig2dec: add upstream security fix
 for CVE-2023-46361
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBzZWN1cml0eSBpc3N1ZToKQ1ZFLTIwMjMtNDYzNjE6IEFydGlm
ZXggU29mdHdhcmUgamJpZzJkZWMgdjAuMjAgd2FzIGRpc2NvdmVyZWQgdG8KY29udGFpbiBhIFNF
R1YgdnVsbmVyYWJpbGl0eSB2aWEgamJpZzJfZXJyb3IgYXQgL2piaWcyZGVjL2piaWcyLmMuCgpo
dHRwczovL3d3dy5jdmUub3JnL0NWRVJlY29yZD9pZD1DVkUtMjAyMy00NjM2MQoKTm90ZSB0aGF0
IGpiaWcyZGVjIHZlcnNpb24gMC4xOSAodXNlZCBpbiBCdWlsZHJvb3QgMjAyNC4wMi4xMSkgaXMg
bm90Cm9mZmljaWFsbHkgbGlzdGVkIGFzIGFmZmVjdGVkLCBidXQgaXQgYWN0dWFsbHkgaGFzIHRo
ZSBzYW1lIGJ1Zy4KCkFsc28gbm90ZSB0aGF0IHRoaXMgQ1ZFIGlzIGFib3V0IGEgY3Jhc2ggaW4g
dGhlIENMSSB0b29sIG9ubHkuCgpTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFw
aGFlbC5tZWxvdHRlQG1pbmQuYmU+Ci0tLQogLi4uZGVjLUF2b2lkLXVuaW5pdGlhbGl6ZWQtYWxs
b2NhdG9yLWluLnBhdGNoIHwgMjggKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDI4IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2piaWcyZGVjLzAw
MDEtQnVnLTcwNTA0MS1qYmlnMmRlYy1Bdm9pZC11bmluaXRpYWxpemVkLWFsbG9jYXRvci1pbi5w
YXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvamJpZzJkZWMvMDAwMS1CdWctNzA1MDQxLWpiaWcy
ZGVjLUF2b2lkLXVuaW5pdGlhbGl6ZWQtYWxsb2NhdG9yLWluLnBhdGNoIGIvcGFja2FnZS9qYmln
MmRlYy8wMDAxLUJ1Zy03MDUwNDEtamJpZzJkZWMtQXZvaWQtdW5pbml0aWFsaXplZC1hbGxvY2F0
b3ItaW4ucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uODMzMWQ1
ZjJhNAotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvamJpZzJkZWMvMDAwMS1CdWctNzA1MDQx
LWpiaWcyZGVjLUF2b2lkLXVuaW5pdGlhbGl6ZWQtYWxsb2NhdG9yLWluLnBhdGNoCkBAIC0wLDAg
KzEsMjggQEAKK0Zyb20gZTYwYTlmMzg4YmQ1NjU1Y2I1MTQ0OTFlZjhkNTVkNDAzYWVmMDc3MyBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFNlYmFzdGlhbiBSYXNtdXNzZW4gPHNlYnJh
c0BnbWFpbC5jb20+CitEYXRlOiBTdW4sIDUgTm92IDIwMjMgMTI6MjE6NTIgKzAxMDAKK1N1Ympl
Y3Q6IFtQQVRDSF0gQnVnIDcwNTA0MTogamJpZzJkZWM6IEF2b2lkIHVuaW5pdGlhbGl6ZWQgYWxs
b2NhdG9yIGluCisgY29tbWFuZC1saW5lIHRvb2wuCisKK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1
Yi5jb20vQXJ0aWZleFNvZnR3YXJlL2piaWcyZGVjL2NvbW1pdC9lZTUzYTdlNGJjNzgxOWQzMmU4
YzBiMjA1Nzg4NWJjYzk3NTg2YmYzCitTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8
cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+CistLS0KKyBqYmlnMmRlYy5jIHwgMiArLQorIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQorCitkaWZmIC0tZ2l0IGEv
amJpZzJkZWMuYyBiL2piaWcyZGVjLmMKK2luZGV4IDE1ZDIwNGQuLjFlMWRhZDggMTAwNjQ0Cist
LS0gYS9qYmlnMmRlYy5jCisrKysgYi9qYmlnMmRlYy5jCitAQCAtNTY3LDcgKzU2Nyw3IEBAIG1h
aW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQorIHsKKyAgICAgamJpZzJkZWNfcGFyYW1zX3QgcGFy
YW1zOworICAgICBqYmlnMmRlY19lcnJvcl9jYWxsYmFja19zdGF0ZV90IGVycm9yX2NhbGxiYWNr
X3N0YXRlOworLSAgICBqYmlnMmRlY19hbGxvY2F0b3JfdCBhbGxvY2F0b3JfOworKyAgICBqYmln
MmRlY19hbGxvY2F0b3JfdCBhbGxvY2F0b3JfID0geyAwIH07CisgICAgIGpiaWcyZGVjX2FsbG9j
YXRvcl90ICphbGxvY2F0b3IgPSAmYWxsb2NhdG9yXzsKKyAgICAgSmJpZzJDdHggKmN0eCA9IE5V
TEw7CisgICAgIEZJTEUgKmYgPSBOVUxMLCAqZl9wYWdlID0gTlVMTDsKKy0tIAorMi40OC4xCisK
LS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
