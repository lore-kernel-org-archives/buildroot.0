Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D7EC3ABCB
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 17:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8B9140879;
	Mon, 12 May 2025 17:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Lh92YoFQ7Ry; Mon, 12 May 2025 17:35:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E16BB4088C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E16BB4088C;
	Mon, 12 May 2025 17:35:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F742150
 for <buildroot@buildroot.org>; Mon, 12 May 2025 17:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44DD481B71
 for <buildroot@buildroot.org>; Mon, 12 May 2025 17:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ku_itglAhp0R for <buildroot@buildroot.org>;
 Mon, 12 May 2025 17:35:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B9B9881B6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9B9881B6D
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9B9881B6D
 for <buildroot@buildroot.org>; Mon, 12 May 2025 17:35:12 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-54fcffd6b9dso2333645e87.1
 for <buildroot@buildroot.org>; Mon, 12 May 2025 10:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747071310; x=1747676110;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A+GErJNo9BFJzwjXd/CitMZs3hNLEEbRH/h35bkueq4=;
 b=HQr8yi4XrRrLYlEUuNInfmj8IMDg5jpR/uesSzqJJeOJpdSVRswandupFjjkoEvzHQ
 gWtCh6nNOtueC9xIxz4nZZbFolrbNfUdt+v/3Ud10i0sf4kBZX1iM2uvRZOF565ja7Ng
 1+2x+NKActVozaVIH1j0HwCvqRjFAwYYw6sdTQNkph1pu66vptv9WSN6LdbpJJ/hoHWM
 E3qr9HngrDHN6zzY6j5ZmFM1mUQ+H632W3Tm0OJ2MUbTY1BR/Cowb3j0XFvLftUHE3tk
 P20FDfLc/7G6hesWK9I7VUMUVI3vWl/w4E96NcyE7v64rznYWdRUNSzy7iEJtONCz36z
 7dVw==
X-Gm-Message-State: AOJu0YzAZ/uhdBC7lkkL+O3rshVDzA1IzxTYKEMa6YnTcf32DUMJKHh8
 vhDbRwZ6PipmDiMRj87tW/9B/4ILG4ovtHqO7MRD94lEGKK8MjSb6W0OJTRK
X-Gm-Gg: ASbGnctxrsAD7WjVwgyyBLX/V3LNpf7bBHgaRg1E7KyDeH3dwu6Jku/bJ9faGZUXJpR
 Tu8Nih447//XtOdgSthLfS3aX0FNLmJ/PmikGESb44ol4aiE+YpRx7zhbKUP3d71/RCDaObr8s7
 Y3COr6eapRxMII4AbBc0X1Pyd6BvUriX9iCEuJFtMx/NKonOELcqkiCx6krrClBMLc4R7IeWtmM
 Vb0eK3ujgzlM2FX1mGoY+5MKog1x0191oEUC0DQwpCekLRoJjumQp03bfwnMNIZp012wtQTSkEZ
 xD9GrytTTV0RYMb/GFmp2PEw2wICkp4VugXaJxZ5wVksgrAQo9i4uo1WoLe1mcE4yXZIJdkqqG4
 =
X-Google-Smtp-Source: AGHT+IEF0O71720fDPNK7lJveab1i6HLDWS5TbfnrsN4Jilv1YPnuFfNH1NAd3sDYbb0sXh4oktzUQ==
X-Received: by 2002:a05:6512:6612:b0:54f:c187:9c16 with SMTP id
 2adb3069b0e04-54fc67cb0a0mr3364494e87.25.1747071309701; 
 Mon, 12 May 2025 10:35:09 -0700 (PDT)
Received: from tollan.lan (b106.broadband9.quicknet.se. [194.132.233.106])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc645d93asm1582086e87.101.2025.05.12.10.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 10:35:08 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Mon, 12 May 2025 19:35:00 +0200
Message-ID: <20250512173506.3179898-1-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747071310; x=1747676110; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A+GErJNo9BFJzwjXd/CitMZs3hNLEEbRH/h35bkueq4=;
 b=JaYukHeLzZDGRbhY+SG6L+6Oa99g11EFJvgpb+em637ItVdETT5f5D80m4gwDbWU1g
 VlPZ/rAUJW19KEJCPGDo/CXs4z4rYlTBa76X/hho7Q3NaUAT2Xmjdgd9WlGKcaWLTnM/
 wNXQCA9UGQM8hFQKYp8+QvMFtIHCetpkGtDflhYEKbc7hw69aeE7EldZCDaMnzXIPuhd
 Gl3dBa6y0PQ04TT7F1iHzqhPYWJ6tGNmmWDtpT7pbcHCDXqUIJoDTMtn0CwZyzroe43Z
 Bd2Ctxbm+6eskQKsyTrIg5f/ONSCMxdlWMTw2/K5jnE8CennMmdL1AMBn+QY0Rbc64io
 ykWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JaYukHeL
Subject: [Buildroot] [PATCH v3 0/6] Bump netopeer2 and its dependencies
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

djM6Ci0gcmVtb3ZlIEVOQUJMRV9TU0gsIGl0IGlzIHJlbW92ZWQgaW4gbGlibmV0Y29uZjIKLSBh
ZGQgbmV3IGRlcGVuZGVuY2llcyBmb3IgbmV0b3BlZXIyCi0gcmVvcmRlciBwYXRjaGVzLCB1cGRh
dGUgbmV0b3BlZXIyIGxhc3QKdjI6Ci0gZml4IHdyb25nIGhhc2ggZm9yIGxpYnlhbmcsIHRoYW5r
cyBIZWlrbyBUaGllcnkKLSBmaXggY29tbWVudHMgZnJvbSBUaG9tYXMgUGV0YXp6b25pIGZyb20g
YSBwcmV2aW91cyBwYXRjaCBzZXJpZXM6Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJv
amVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNTAxMTQwNzI5NDcuMjg0OTY1LTMtaGVpa28udGhpZXJ5
QGdtYWlsLmNvbS8KCk1hdHRpYXMgV2Fsc3Ryw7ZtICg2KToKICBwYWNrYWdlL3N5c3JlcG86IGJ1
bXAgdG8gdmVyc2lvbiAzLjYuMTEKICBwYWNrYWdlL2xpYnlhbmc6IGJ1bXAgdG8gdmVyc2lvbiAz
LjEyLjIKICBwYWNrYWdlL2xpYm5ldGNvbmYyOiBidW1wIHRvIHZlcnNpb24gMy43LjEKICBwYWNr
YWdlL2xpYm5ldGNvbmYyOiBVcGRhdGUgZGVwZW5kZW5jaWVzCiAgcGFja2FnZS9uZXRvcGVlcjI6
IFVwZGF0ZSBkZXBlbmRlbmNpZXMgZnJvbSBsaWJuZXRjb25mMgogIHBhY2thZ2UvbmV0b3BlZXIy
OiBidW1wIHRvIHZlcnNpb24gMi40LjEKCiBwYWNrYWdlL2xpYm5ldGNvbmYyL0NvbmZpZy5pbiAg
ICAgICAgfCAgOCArKysrKysrKwogcGFja2FnZS9saWJuZXRjb25mMi9saWJuZXRjb25mMi5oYXNo
IHwgIDIgKy0KIHBhY2thZ2UvbGlibmV0Y29uZjIvbGlibmV0Y29uZjIubWsgICB8IDIxICsrKysr
KysrKy0tLS0tLS0tLS0tLQogcGFja2FnZS9saWJ5YW5nL2xpYnlhbmcuaGFzaCAgICAgICAgIHwg
IDQgKystLQogcGFja2FnZS9saWJ5YW5nL2xpYnlhbmcubWsgICAgICAgICAgIHwgIDIgKy0KIHBh
Y2thZ2UvbmV0b3BlZXIyL0NvbmZpZy5pbiAgICAgICAgICB8ICA0ICsrKy0KIHBhY2thZ2UvbmV0
b3BlZXIyL25ldG9wZWVyMi5oYXNoICAgICB8ICAyICstCiBwYWNrYWdlL25ldG9wZWVyMi9uZXRv
cGVlcjIubWsgICAgICAgfCAgMiArLQogcGFja2FnZS9zeXNyZXBvL3N5c3JlcG8uaGFzaCAgICAg
ICAgIHwgIDIgKy0KIHBhY2thZ2Uvc3lzcmVwby9zeXNyZXBvLm1rICAgICAgICAgICB8ICAyICst
CiAxMCBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKCi0t
IAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
