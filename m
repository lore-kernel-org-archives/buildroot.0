Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BA0C3ABCC
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 17:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07BA160596;
	Mon, 12 May 2025 17:35:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fv2Y9IT3kBBh; Mon, 12 May 2025 17:35:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30AA8607E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30AA8607E5;
	Mon, 12 May 2025 17:35:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AF564150
 for <buildroot@buildroot.org>; Mon, 12 May 2025 17:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D6F781B71
 for <buildroot@buildroot.org>; Mon, 12 May 2025 17:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ye3K4mRO94w for <buildroot@buildroot.org>;
 Mon, 12 May 2025 17:35:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D3ACC81BCF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3ACC81BCF
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3ACC81BCF
 for <buildroot@buildroot.org>; Mon, 12 May 2025 17:35:19 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5499614d3d2so6072718e87.3
 for <buildroot@buildroot.org>; Mon, 12 May 2025 10:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747071317; x=1747676117;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wkcryvhL9vBGcu8N2xcbgAgiybJak4aQNUPUU7Yln/s=;
 b=iYStFVpEti8rYle7id0sNItU2z5Tz5CfO3E/MhyjR1ZQ/JNPqIDv4CotSrhNLOT6Oo
 7lPgJdQA157IFdIyCJG5L/b7sTprN+4Af5Y1uVuRdfiSTvqDJ4r2AhsB+lyVFZqux98j
 D+GmFeCQg+N0jNGOtfr3NxaDiTVnPTxuMo5orjFprF/ijlAMoUy2sjZ1ecWTRc1/z0eD
 EWvim00c6BtT6Dkm7D2pD70rb5JVtj5fvd1EzLGkySss7xvlXRhRbB9PIf0yYxW1M3A2
 +Z21mlWfaIethl6/auXdM2ISuKdNyw/fGLruhIf9sAO6V9wlnsafIztxuoJ2MnEqDyOi
 lmtA==
X-Gm-Message-State: AOJu0YwByXYrF9ic+oo+e2HvlbmvXfpuGLyIPTa0PufBZAKYwUK5jl2k
 ktG8+hhcCt03NwMInzje2hEsxqjcHYLXI88M0TDNCAdU93KDF/sMHbSFy9ez
X-Gm-Gg: ASbGncsaIUggRnr7gw9aZlrsY1bGHg5t4x4G8xn/vMUo74vb+24E7J7W3yIX5pK8mBi
 xklH+PkOTDpxgR0/Mu2XjAgceMmiAQ+8OQLnXvbnGPkBEV6B+PbzkS5pnUnA57wQm19X8wNEHYN
 BWrYnOyZ4G5dVhQDfe4ev8nU4feCVKr2qyj1E9QEKnqDFRjbgcmgJHAsuGg1ot2+FNe7TOBcC95
 p2aYirE4KQSJdyp07pLuJpgCnZ7Mk9LTuObxzTFQpLgWcYvwIS+OZE+IxoFwNwSXpxZx1vR4G34
 GQwJFqnyPTlmhg1ZisfIybFI0pgW67rV1crD7ygD6WRWK1URALe5/aD2wCLE4hFRPF41RzgNFx0
 =
X-Google-Smtp-Source: AGHT+IGPPk9BwudlBNMPXbscK+ZIPX5Ra19LbPgp9PKduNERCJ5TvQmst60R+dctxnc/5sYx2RoSKg==
X-Received: by 2002:a05:6512:1406:b0:54f:c6b0:4e46 with SMTP id
 2adb3069b0e04-54fc6b04e74mr4470592e87.3.1747071316800; 
 Mon, 12 May 2025 10:35:16 -0700 (PDT)
Received: from tollan.lan (b106.broadband9.quicknet.se. [194.132.233.106])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc645d93asm1582086e87.101.2025.05.12.10.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 10:35:16 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Mon, 12 May 2025 19:35:05 +0200
Message-ID: <20250512173506.3179898-6-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512173506.3179898-1-lazzer@gmail.com>
References: <20250512173506.3179898-1-lazzer@gmail.com>
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747071317; x=1747676117; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wkcryvhL9vBGcu8N2xcbgAgiybJak4aQNUPUU7Yln/s=;
 b=Bni5W9rnSGQyxtZ9lQHiaOacWjl/kCk62l2jSbXUojN9VJq6XE3BixJkk2+IPss9Y+
 4lmttl3en3J+HkSbmxbohFcwpHoFTqIwT4PntTfwAxP6KEVds2qfDtiwgz0NZKNaUqIn
 TmAOV6uwLZW65/H1KdKaxVlvszClBAZz/XnuyHemIrUpFXuiY8SR0zYA9jeKFUFHfLm7
 87goC5bpemmwxL2QgI1mszTH4zGHj8C5pP2or7Cv1NNzhFIHB9eKsMU1dOqQqnEyc/f9
 207LW6/4rLiG6GGWxZlzxbG3JLG7MKtOQalZI11y1uWrKqozenPAzrH9eotassNWSTyD
 b42g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Bni5W9rn
Subject: [Buildroot] [PATCH v3 5/6] package/netopeer2: Update dependencies
 from libnetconf2
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

U2lnbmVkLW9mZi1ieTogTWF0dGlhcyBXYWxzdHLDtm0gPGxhenplckBnbWFpbC5jb20+Ci0tLQog
cGFja2FnZS9uZXRvcGVlcjIvQ29uZmlnLmluIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9uZXRvcGVl
cjIvQ29uZmlnLmluIGIvcGFja2FnZS9uZXRvcGVlcjIvQ29uZmlnLmluCmluZGV4IGRiMzFhNzg2
YTEuLmJlNGVjM2M0YTMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbmV0b3BlZXIyL0NvbmZpZy5pbgor
KysgYi9wYWNrYWdlL25ldG9wZWVyMi9Db25maWcuaW4KQEAgLTEzLDEwICsxMywxMiBAQCBjb25m
aWcgQlIyX1BBQ0tBR0VfTkVUT1BFRVIyCiAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19U
SFJFQURTX05QVEwKIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzRfOCAj
IHN5c3JlcG8KIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCTkVUQ09ORjIKKwlzZWxlY3QgQlIyX1BB
Q0tBR0VfTElCTkVUQ09ORjJfU1NIX1RMUworCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJDVVJMCiAJ
c2VsZWN0IEJSMl9QQUNLQUdFX0xJQlNTSAogCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJTU0hfU0VS
VkVSICMgRm9yIGxpYm5ldGNvbmYyIHRvIGhhdmUgU1NICisJc2VsZWN0IEJSMl9QQUNLQUdFX09Q
RU5TU0wgaWYgIUJSMl9QQUNLQUdFX01CRURUTFMgIyBmb3IgbGlibmV0Y29uZjIKIAlzZWxlY3Qg
QlIyX1BBQ0tBR0VfTElCWUFORwotCXNlbGVjdCBCUjJfUEFDS0FHRV9PUEVOU1NMICMgRm9yIGxp
Ym5ldGNvbmYyIHRvIGhhdmUgVExTCiAJc2VsZWN0IEJSMl9QQUNLQUdFX1NZU1JFUE8KIAloZWxw
CiAJICBOZXRvcGVlcjIgaXMgYSBzZXQgb2YgdG9vbHMgaW1wbGVtZW50aW5nIG5ldHdvcmsgY29u
ZmlndXJhdGlvbgotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
