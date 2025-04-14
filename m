Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0304C369B5
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 11:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86F824003A;
	Mon, 14 Apr 2025 11:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6_ADWE0vdZT; Mon, 14 Apr 2025 11:21:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF56E403AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF56E403AC;
	Mon, 14 Apr 2025 11:21:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 52DFA108
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 11:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37F3482018
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 11:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KzILce8vkUxN for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 11:21:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=jonhenrik@qbee.io; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 66B2B8174F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66B2B8174F
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66B2B8174F
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 11:21:21 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-54d42884842so4408637e87.2
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 04:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744629679; x=1745234479;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Bk+4NgEq/TIKA4bHisGjTSeP5es9Z4EYQdcW3/3hoE=;
 b=Oh45Iu4b5uEkRbFgymR0nXOuJGx6PTlH9zAn4WjGIA3XEPslKfQBG4RtpJmu2KwMPB
 pB7ZjoCXLjM7u/icmvOlVUIgjCbQU8UkmbdczXR4bKxXYVntKRkZ6GzuHLbTivI2BkIP
 xy8LQbBC0tVsAdSqBMypMGaIO0Mswrn2zlTidre33I69tCJ1FAgEIftr5WNYfdOG7hQc
 jEMhRX/aJsfEyQMmq57j/rjFZBCjoj8gne9Q5gkynvLQ87pXN+V4O7nL2KMc+iSu+oHN
 pedq+/5x6pp7CbYEdeoHWbGpo2GSSRM9cbj5IKvheqOqZjwOIgGJYnHMjCCuzdOwYFGO
 /4vw==
X-Gm-Message-State: AOJu0YxIxstmSTbogBlqz2ondqcVFnYHeqy9wcBJ0FsM+x3E+OWJmVXv
 et5TE3UNsi0laa+8bkpAkIdF06GY7503SowqycTgDSeuy3TyMY2fL2KOYaQFcJ8mxxtU9yLhfhk
 2
X-Gm-Gg: ASbGncvmZj+sEJSfA6WxuLCL49/PwWbnp9CSyJGR+mRtMFl4Ecph5wr+jyJKEDVbWqt
 7T1lksvukFy8nGMwfl3wf4PcFHZFuVfYIiRAISjMovh+Cx6x0PaGq7oBEZHg0MDusjZIKHC9p/+
 7H+Cn5pFekuPuTRBEUppPCm3JxKErZXAlvuRZu74nmVqeoCoy0M82wyjjUqYrACktdRoaKOnx4k
 iNCToe2dHMjHuxvdSw/y3xxn/ngP3nS6S+xnaL8rNpZ+Xf/f8zhiWjvtfTjWkWfyZvfYOXHHkcZ
 TYRgcHCCnRzd0LDdOxHrGtCNcRrDeDJaaA48sB8=
X-Google-Smtp-Source: AGHT+IHK9xjyh0q0A1nE0Se4oZEZ97X/Zjgp9huOifq2SdJ5Fapr3SaOLz4FZspnYzgNupMivRm43g==
X-Received: by 2002:a05:6512:3d0e:b0:545:2b24:c711 with SMTP id
 2adb3069b0e04-54d4529eb61mr2521746e87.21.1744629678675; 
 Mon, 14 Apr 2025 04:21:18 -0700 (PDT)
Received: from nola.getinternet.no ([2a02:fe1:3375:e000::2])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d2387d9sm1058600e87.92.2025.04.14.04.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 04:21:18 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jon=20Henrik=20Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Date: Mon, 14 Apr 2025 13:21:13 +0200
Message-Id: <20250414112113.811330-1-jonhenrik@qbee.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qbee.io; s=google; t=1744629679; x=1745234479; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3Bk+4NgEq/TIKA4bHisGjTSeP5es9Z4EYQdcW3/3hoE=;
 b=ZMCLzCRIhfUnMG2uiESKkiGcYQP7hLziOgATOfobcqz7wqc9g2OtwOKcPxRSuXqKjN
 nQD+D3pfBF5uSvoRyXCb76kBAzCm3XIpKhG0oPyLO/PvJwRTO6OQYdxN0Mmv4+cwRlXd
 9PRiqdpCEo10bkbYuS0Ghcdi2njcrGwenQc24=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=qbee.io
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=qbee.io header.i=@qbee.io header.a=rsa-sha256
 header.s=google header.b=ZMCLzCRI
Subject: [Buildroot] [PATCH 1/1] package/qbee-agent: bump version to 2024.50
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
aW5kZXggMTU2ZjkxMWE2ZC4uM2MwMjJiNTE2NyAxMDA2NDQKLS0tIGEvcGFja2FnZS9xYmVlLWFn
ZW50L3FiZWUtYWdlbnQuaGFzaAorKysgYi9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5o
YXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgNmRjYTNk
MDIwYmM5ZjBmODBmNGM4YzViODVjMDc5YTY1NzA3ZmI3OTQ4NWIzOWM4NWQ5YmQxY2ZhZGFmY2Y5
ZiAgcWJlZS1hZ2VudC0yMDI0LjM2LWdvMi50YXIuZ3oKK3NoYTI1NiAgMzgzNzliMDg2OWQwMTNm
YmQyMjVkM2UwOTJmYTE2NzUxYzQxNGI4ZjQxMjQzN2MxYzRjN2YzYWYxMThmZWU0YiAgcWJlZS1h
Z2VudC0yMDI0LjUwLWdvMi50YXIuZ3oKIHNoYTI1NiAgMDJkMDdkOTZiZTk5ZWIwNDJiMDFiYTY1
MDA3OWE0NDBjZTI2YTc4YzVlMGUxZTgwNjBjMzNhOGM5ZTIwMDQwNCAgTElDRU5TRQpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQubWsgYi9wYWNrYWdlL3FiZWUtYWdl
bnQvcWJlZS1hZ2VudC5tawppbmRleCAxYTk2NTNlZTdmLi5jNWRmNTlhNjYzIDEwMDY0NAotLS0g
YS9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5taworKysgYi9wYWNrYWdlL3FiZWUtYWdl
bnQvcWJlZS1hZ2VudC5tawpAQCAtNSwxMiArNSwxMiBAQAogIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKIAogIyBrZWVwIFFCRUVfQUdFTlRfQ09NTUlUX0lEIGluIHN5bmMgd2hlbiB1cGRhdGluZwot
UUJFRV9BR0VOVF9WRVJTSU9OID0gMjAyNC4zNgorUUJFRV9BR0VOVF9WRVJTSU9OID0gMjAyNC41
MAogUUJFRV9BR0VOVF9TSVRFID0gJChjYWxsIGdpdGh1YixxYmVlLWlvLHFiZWUtYWdlbnQsJChR
QkVFX0FHRU5UX1ZFUlNJT04pKQogUUJFRV9BR0VOVF9MSUNFTlNFID0gQXBhY2hlLTIuMAogUUJF
RV9BR0VOVF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQogCi1RQkVFX0FHRU5UX0NPTU1JVF9JRCA9
IGQ1MmZiNWU2OWI0Nzk1NTA2MzY1NzBhMmRiNmNlYmUwNmY1ZjEyOWIKK1FCRUVfQUdFTlRfQ09N
TUlUX0lEID0gNDMwMzQ2NWQxNTVmMDY4MDk2OGI1N2ZkZjQ0MjE5NzE3ODYzNTZhNAogCiBRQkVF
X0FHRU5UX0dPTU9EID0gZ28ucWJlZS5pby9hZ2VudAogCi0tIAoyLjM0LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
