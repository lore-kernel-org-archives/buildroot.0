Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079FAC6FD1F
	for <buildroot@archiver.kernel.org>; Fri, 29 Mar 2024 16:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D81340949;
	Fri, 29 Mar 2024 16:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IU1vD7ybWHBn; Fri, 29 Mar 2024 16:04:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64B7240847
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64B7240847;
	Fri, 29 Mar 2024 16:04:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 184B81BF286
 for <buildroot@lists.busybox.net>; Fri, 29 Mar 2024 16:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05E2F607C3
 for <buildroot@lists.busybox.net>; Fri, 29 Mar 2024 16:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fMSU3r7JutDG for <buildroot@lists.busybox.net>;
 Fri, 29 Mar 2024 16:04:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B96B360763
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B96B360763
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B96B360763
 for <buildroot@buildroot.org>; Fri, 29 Mar 2024 16:04:13 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41553f150b9so2782165e9.1
 for <buildroot@buildroot.org>; Fri, 29 Mar 2024 09:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711728251; x=1712333051;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ghaoBAoDHs4ciMSlY/yOplluXkS9+J3bmqb75HkMt4Q=;
 b=n+AoZ0kRRLCXEyp9Dj6RKaaH2KVSvO9LXiAXLhOT7DooUiYHh4ET2fgn7zQZyUDCpK
 xAPD61Bl1JxYa6j/Tp0aaTrLyujc9nZuPTmWsa1q/jXW5EajkuKtPXkb9lXCBkxw/Wrj
 WfFs7P+WQQnIZgmJkB/BvMO2S1P2NMO4XUG+LCdLOOL4igN0uJ6ieOH0P7Kl0Hr0d8zp
 /HVwcxSep1Em+R51O+aIS2mffb+hEJrO2/CE6JDUdVyVk+1ijb+L1jvqQKhGIYVgm8wb
 2Utq7/eScRnm8EHc42ZY/Cl4Nt1YAQrshZxbnuX+3XVOgcPTQlDsYh7YposO1UFZop8s
 toHg==
X-Gm-Message-State: AOJu0Yyvd0MN8dH7fYbdQUKLBRcKLovHvgfo+3R2Qbd/AcGibI2qz6h4
 vO5ZhG8zsLeckXDlJsFkxWxqVpTDRavfSNxL7cpzGL8dSr1mX0K6INX1P9OKdPUO11+O2Cm5M49
 uj7m3DA==
X-Google-Smtp-Source: AGHT+IEQtcLIaft91Lqq0yWjuatGGSVEzpleO60KLh66gs4tKLI1UddNRZXQteqN+tG+w2W3+oUf+Q==
X-Received: by 2002:a05:600c:3b0f:b0:413:f4d1:199e with SMTP id
 m15-20020a05600c3b0f00b00413f4d1199emr2476434wms.31.1711728250986; 
 Fri, 29 Mar 2024 09:04:10 -0700 (PDT)
Received: from debian-hp-1.fritz.box (94.105.103.7.dyn.edpnet.net.
 [94.105.103.7]) by smtp.gmail.com with ESMTPSA id
 t20-20020a05600c199400b0041401eb021asm5813552wmq.24.2024.03.29.09.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Mar 2024 09:04:10 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 Mar 2024 17:03:58 +0100
Message-ID: <20240329160400.66499-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711728251; x=1712333051; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ghaoBAoDHs4ciMSlY/yOplluXkS9+J3bmqb75HkMt4Q=;
 b=bnjYZqmSPDPcj9Ik4x2/8Hysq1axuPegMvsoA9tBDD92juHq4ncoUT8NJsS4wtXhU/
 WNMiWPd21PwbABBvG5Bzq7AZG4A1c6+cf0YbTtHhY3SSvP7aEyJF0LH0jwB53j1opt0z
 iq8wq5te5Wg0cUNyfeA0B+9xV0kCVO5gQm5sPJKeSDK2GiImUOtMeH3hEt+gC99J7YzX
 DvJ/xx1lZ8HWO4vnDB5DaW4TmxErrjbF8U1MtJO562AXq16OQ1FKXNlNNwHrBPMR6RRL
 VEYGxT1lE5SDX9dejycgJwicyeKvXvVitx7Jwhm7u/yQPCnkyj73YH0PMXn0XHRXlknV
 tisg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bnjYZqmS
Subject: [Buildroot] [PATCH 1/1] doc/manual: fix host-python-setuptools typo
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJl
PgotLS0KIGRvY3MvbWFudWFsL2FkZGluZy1wYWNrYWdlcy1weXRob24uYWRvYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RvY3MvbWFudWFsL2FkZGluZy1wYWNrYWdlcy1weXRob24uYWRvYyBiL2RvY3MvbWFudWFsL2Fk
ZGluZy1wYWNrYWdlcy1weXRob24uYWRvYwppbmRleCA5OTUzYmU2NjM5Li42N2YyZjYwODFkIDEw
MDY0NAotLS0gYS9kb2NzL21hbnVhbC9hZGRpbmctcGFja2FnZXMtcHl0aG9uLmFkb2MKKysrIGIv
ZG9jcy9tYW51YWwvYWRkaW5nLXBhY2thZ2VzLXB5dGhvbi5hZG9jCkBAIC05Miw3ICs5Miw3IEBA
IE5vdGUgdGhhdDoKICAgIGRlcGVuZGVuY2llcyBhcmUgYXV0b21hdGljYWxseSBhZGRlZCBhcyBu
ZWVkZWQgYnkgdGhlIFB5dGhvbgogICAgcGFja2FnZSBpbmZyYXN0cnVjdHVyZS4KIAotICogU2lt
aWxhcmx5LCBpdCBpcyBub3QgbmVlZGVkIHRvIGFkZCAraG9zdC1zZXR1cHRvb2xzKyB0bworICog
U2ltaWxhcmx5LCBpdCBpcyBub3QgbmVlZGVkIHRvIGFkZCAraG9zdC1weXRob24tc2V0dXB0b29s
cysgdG8KICAgICtQWVRIT05fRk9PX0RFUEVOREVOQ0lFUysgZm9yIHNldHVwdG9vbHMtYmFzZWQg
cGFja2FnZXMsIHNpbmNlIGl0J3MKICAgIGF1dG9tYXRpY2FsbHkgYWRkZWQgYnkgdGhlIFB5dGhv
biBpbmZyYXN0cnVjdHVyZSBhcyBuZWVkZWQuCiAKLS0gCjIuNDEuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
