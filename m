Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF44C5AC82
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 10:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B40E880D7F;
	Mon, 10 Aug 2026 10:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vRN2RxVGTo_n; Mon, 10 Aug 2026 10:39:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9E4E80CC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786358371;
	bh=iv6TxpUA726pss4nqLQaaXlrNpuMI9F0dT0P/3coirw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=kIY5Lg3DWEtkZAtFaC00Pmqzb8YoAttfZNp3YyFXz+86WtxFjdUWT2wMw7pAcmvMK
	 DRj6p6IvhcOoXdszNvEJBZqMos2wPRLoNTW/QSp3TLd3oJ9WpP6ircsc+GtWA7Hwgt
	 7ndaxtJI3sjC9kKdXymkcMlQayLcdeRPslryFs3dun8cjy1/kLUar/RgmX2kHVfnq/
	 sGkzZ7yh5IqsX+QCo+3a179KRz8fVsXh4OurSIf3Jtlm7T1I5w7eSHsFiHFsvAIKY5
	 crtqIX2eRABtABGi6c5XYAh7BDBnTwaQ7aH2+Prh/YGoLBQG8A0uzdQEYSoT40Bau+
	 S5ojRD+DyBYAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9E4E80CC3;
	Mon, 10 Aug 2026 10:39:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E6C6A23F
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 10:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD113400F1
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 10:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vC_2rD4OOhSB for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 10:39:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=jonhenrik@qbee.io; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5115D400DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5115D400DB
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5115D400DB
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 10:39:27 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-39c95395230so13650141fa.2
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 03:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786358366; x=1786963166;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=XdQ2m0VtQobpwCm/6ucx1pynK35qgu14JIsdxMZumH8=;
 b=mWNfXNf25zyAXfa1jI1J7ZtJBZ2OCnwjfI8SS+auxr4pxqPuRQcSCWUK9ejBljuny7
 iAdy5ykol2spAOmwo8zBvIcY6wZEjJnDEPn51s9w0yDqoKjaFFrLNuH+RfECQSWeGcsf
 bXd571NVuUz2c3Iu45cD4VPgspr9hxOiseRds8fibjVN1ZsOyot5xXB4yys4Zd8B79Vj
 r4tXSdF3l00KsE7Wfq5PAXvXwTW9gfd1UZzmY9QTQY2bOr0noTTNQ4tQzNMbAz1U7wXi
 vpHd3GAnQf0W5Z3IFquqoNMbl7H0TSCvfhRfAU7KQbgK+xz+XLH+Wc/i/wNU834s3WtJ
 Y7rg==
X-Gm-Message-State: AOJu0YxX3ifTAllSo52qRlPn56vDlYohE6sH6BXGmXBZUUK6i//tvtyR
 BLq+wI+DqJQkiGuWmQtWCNf/FGX5j2gym7AVqqst3xM0CkU95m/5zzFJ/aOxx0cQyeGf1Vuj+6y
 gcSWMjvg=
X-Gm-Gg: AR+sD12shkZSq137fKRZlEXAn43NobwvUYDzQtZkBhQ/wlf7ldRvU+5WiHydrBziBdb
 b1l+j9apDHA9adyxRE+y3i5TfSu2LHJVFS2lLNvY75F7l/e6CK6NtlXV+/uw7/8ndWA8xUvaFkt
 V2BcPYRr0B13Rg62LDcW7BmTvovxtKXAMOlEIAILz6bX+XH1UcL6EiQoXsNUefqMTptDHBUFc+7
 e6M4edD9bFtTTmazfBVit7ICko2LWuhcBRfYKrL35vb41KODzyNN+RIjF448Wo33yVxNl+oBwLf
 5yBE980Fbg0anREgU63sXriqyLgao0sdkVkIE4q4UsjA1YIwyQLxqNMI10Y3OiTh/WdIHEFpe9I
 XAhGw6twqF6/rcneGGQoXGjYVEeTy7xxQw7c/M3QYLYPPjfcgD5MlsAy1g6739f18LCg7Dt9Gi5
 6Fs118UyqytuI9xGaI8zZkmC3Jn2xTIF0Hf40Dl1n3QTfU4zfejyLzKGMlhWFkYPiAfcIGLN8le
 qSsn3VC00zJRp85MpqY
X-Received: by 2002:a05:651c:19a5:b0:39a:da70:2c77 with SMTP id
 38308e7fff4ca-39fdf2c7597mr24274181fa.3.1786358365496; 
 Mon, 10 Aug 2026 03:39:25 -0700 (PDT)
Received: from nola.getinternet.no ([2a02:fe0:c42b:3e00:3bf0:ba5a:e9f6:b42a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-39fddd52594sm22446831fa.25.2026.08.10.03.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2026 03:39:25 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jon=20Henrik=20Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Date: Mon, 10 Aug 2026 12:39:21 +0200
Message-Id: <20260810103921.814290-1-jonhenrik@qbee.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qbee.io; s=google; t=1786358366; x=1786963166; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=XdQ2m0VtQobpwCm/6ucx1pynK35qgu14JIsdxMZumH8=;
 b=MQK+uHhy5mhSnl+RqwH1VRZYpXUonGoK0odS8B37r+1toM93qUNfjgc7cbC7Alduu3
 7oRPSkCHWzO1wwkqDXY4paTtwfWfVURDyGVCPvSTBcd7wew8pWK/2fqD9eEkkg1ee6CJ
 oJFk0DinSXYOztDIM/wySgfllm3NsJiUclj88=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=qbee.io
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=qbee.io header.i=@qbee.io header.a=rsa-sha256
 header.s=google header.b=MQK+uHhy
Subject: [Buildroot] [PATCH 1/1] package/qbee-agent: bump version to 2026.27
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
From: =?utf-8?q?Jon_Henrik_Bj=C3=B8rnstad_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Jon=20Henrik=20Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSm9uIEhlbnJpayBCasO4cm5zdGFkIDxqb25oZW5yaWtAcWJlZS5pbz4K
LS0tCiBwYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5oYXNoIHwgMiArLQogcGFja2FnZS9x
YmVlLWFnZW50L3FiZWUtYWdlbnQubWsgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9xYmVlLWFn
ZW50L3FiZWUtYWdlbnQuaGFzaCBiL3BhY2thZ2UvcWJlZS1hZ2VudC9xYmVlLWFnZW50Lmhhc2gK
aW5kZXggMmY3ZGExNDM0Zi4uMDIxMDlmMjc0YSAxMDA2NDQKLS0tIGEvcGFja2FnZS9xYmVlLWFn
ZW50L3FiZWUtYWdlbnQuaGFzaAorKysgYi9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5o
YXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgZGU3MmM5
NzU0ZjQ2ZDYzYzNkNmRkMjg2ZTRmYTk2N2M0YjU5MmMyNjc5YjE3MmZmOGNlOWU3ZTZhZTEzYTRk
NCAgcWJlZS1hZ2VudC0yMDI2LjE5LWdvMi50YXIuZ3oKK3NoYTI1NiAgYWRlNTVkNTgwMTE1Y2Ix
YzgxYjBlMzU3NjZjYmJhMmIzNzE4ZjQ1ZTliNDI2MmRkNzk1ZjVjOTY0YmIyY2EyYiAgcWJlZS1h
Z2VudC0yMDI2LjI3LWdvMi50YXIuZ3oKIHNoYTI1NiAgMDJkMDdkOTZiZTk5ZWIwNDJiMDFiYTY1
MDA3OWE0NDBjZTI2YTc4YzVlMGUxZTgwNjBjMzNhOGM5ZTIwMDQwNCAgTElDRU5TRQpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQubWsgYi9wYWNrYWdlL3FiZWUtYWdl
bnQvcWJlZS1hZ2VudC5tawppbmRleCBjY2JmN2NhYjQwLi45M2M2ZjUwMWE0IDEwMDY0NAotLS0g
YS9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5taworKysgYi9wYWNrYWdlL3FiZWUtYWdl
bnQvcWJlZS1hZ2VudC5tawpAQCAtNSwxMiArNSwxMiBAQAogIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKIAogIyBrZWVwIFFCRUVfQUdFTlRfQ09NTUlUX0lEIGluIHN5bmMgd2hlbiB1cGRhdGluZwot
UUJFRV9BR0VOVF9WRVJTSU9OID0gMjAyNi4xOQorUUJFRV9BR0VOVF9WRVJTSU9OID0gMjAyNi4y
NwogUUJFRV9BR0VOVF9TSVRFID0gJChjYWxsIGdpdGh1YixxYmVlLWlvLHFiZWUtYWdlbnQsJChR
QkVFX0FHRU5UX1ZFUlNJT04pKQogUUJFRV9BR0VOVF9MSUNFTlNFID0gQXBhY2hlLTIuMAogUUJF
RV9BR0VOVF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQogCi1RQkVFX0FHRU5UX0NPTU1JVF9JRCA9
IDk5YTBiNWE1NmJiMGFlMmQ3ZGVjMjlhYmNmMjVkMjliZTE2ZjJjMzYKK1FCRUVfQUdFTlRfQ09N
TUlUX0lEID0gNjcxMGFiZDQ5OTA2ZDAwYmE2YzRlNDQ2ZjY0MzZmYWFiMTRmYjVkOQogCiBRQkVF
X0FHRU5UX0dPTU9EID0gZ28ucWJlZS5pby9hZ2VudAogCi0tIAoyLjM0LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
