Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD44C52D7C
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 13:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF65760655;
	Thu, 22 Aug 2024 13:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v3LPERDDYOUE; Thu, 22 Aug 2024 13:02:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9B5460D6B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9B5460D6B;
	Thu, 22 Aug 2024 13:02:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 829361BF3DF
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 13:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F2FC402DE
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 13:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_0zX8nOWXD7 for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 13:02:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4AA44402A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AA44402A5
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4AA44402A5
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 13:02:26 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5bef295a45bso698236a12.0
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 06:02:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724331744; x=1724936544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kGO0y2odBfvHOBHrTkO7236j9UA4pCg0fFTz/DEFKWo=;
 b=PkFBBBDtM+/k4v6IIKWAGMi2UreBm9v+p02VoYA7IXyCvP9yItc9u4W8XVk8Qmeo+C
 4BSvaY1U87VuJ7KKY1EwbJoBIFwDwiKd896bZZ6HZH+S0XKU+ZRTL/brYDSyBw65Kgo+
 Cvq3RHeq+8W+S3DU4iUDxjQRUHwVibRPlj1b/Jj62SmMiR9AczBGxWE2B+W1rEfTxnJ8
 rhxiMFGl2IDQtt6dOS2Kjol0XL5PUIHo+xpVQ4z01hnnuowPBGEQNoZrh6HuwrF3oZFR
 zJcMz7MIZLsYPP7bJ+cJ66MKOuN6BK/Stiw+nqas5xQ8+Fl13mau8VMFSCzfr2zdFu83
 JrXQ==
X-Gm-Message-State: AOJu0YwvYd4zj/uw70dEBVR85QmIHCknyL+bAvJPc19f1n+jfvXAV9J9
 peAlfETE8B1GZhCJBfZMmP0nTsx0cQGP5JI2JV9kpYxVdcZYspxZ8E3+jO+NHGYiLv2kpkT9Saa
 0
X-Google-Smtp-Source: AGHT+IHfyMVt8gSR3VnEONLvL6pVcmPbZGp2kZjUtmNHDtxNrqWb83LmGV21Qk7PoCoqDJfevx3B6w==
X-Received: by 2002:a05:6402:3595:b0:5be:ff75:3aa9 with SMTP id
 4fb4d7f45d1cf-5c0792947bcmr2039868a12.26.1724331742601; 
 Thu, 22 Aug 2024 06:02:22 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c04a3eb693sm901393a12.53.2024.08.22.06.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 06:02:21 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id C86125F913;
 Thu, 22 Aug 2024 14:02:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 14:02:17 +0100
Message-Id: <20240822130220.4135741-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822130220.4135741-1-alex.bennee@linaro.org>
References: <20240822130220.4135741-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724331744; x=1724936544; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kGO0y2odBfvHOBHrTkO7236j9UA4pCg0fFTz/DEFKWo=;
 b=AvpW3c2Ss5+OHvjmeU2xEBYAvQ1zDaUfpfCl8DzqEWsJ75dc7qc0IyOivfxpu0PEc0
 CPFoxlrjrR8jJ9lXli+kNswzBPlu1c6b/XiaaWdoxb1FKSAuFjYFsmFLppUuew5gnv1a
 c3HY/kcOL7QNlSbSMNNpICQOtiaiHUG5xboEyyk2fvckclUfUqNdIpp8aMGm2mBpZ9Uy
 e/rpk0jRMSGm24U6N2I/qcuPnSUlxaQ0frBgPhRpKLJDSVqIhtIw6gwR81P2ncg0055Y
 +lmgCXxs//iOP/7J9TcFO3xqTMjmrSGSLlmoMRxe5ofadfXZiLTuTyjLvAxYapMkDbTI
 3btA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=AvpW3c2S
Subject: [Buildroot] [PATCH 1/4] package/mesa3d: add option to enable VIRTIO
 vulkan driver
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHN1cHBvcnQgZm9yIFZlbnVzIGluIE1FU0EgaGFzIGJlZW4gc3RhYmxlIHNpbmNlIDIzLjIg
c28gYWRkIGFuCm9wdGlvbiB0byBlbmFibGUgaXQuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7D
qWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Ci0tLQogcGFja2FnZS9tZXNhM2QvQ29uZmlnLmlu
IHwgNiArKysrKysKIHBhY2thZ2UvbWVzYTNkL21lc2EzZC5tayB8IDEgKwogMiBmaWxlcyBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL21lc2EzZC9Db25maWcu
aW4gYi9wYWNrYWdlL21lc2EzZC9Db25maWcuaW4KaW5kZXggNzc2MWIwYTY1MC4uMGUwOGIwZTdj
NSAxMDA2NDQKLS0tIGEvcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvbWVz
YTNkL0NvbmZpZy5pbgpAQCAtMzE0LDYgKzMxNCwxMiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTUVT
QTNEX1ZVTEtBTl9EUklWRVJfU1dSQVNUCiAJaGVscAogCSAgVnVsa2FuIHN3cmFzdCBkcml2ZXIu
CiAKK2NvbmZpZyBCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUl9WSVJUSU8KKwlib29s
ICJWdWxrYW4gVmlydElPIGRyaXZlciAoVmVudXMpIgorCXNlbGVjdCBCUjJfUEFDS0FHRV9NRVNB
M0RfVlVMS0FOX0RSSVZFUgorCWhlbHAKKwkgIFZ1bGthbiBWaXJ0SU8gKHZlbnVzKSBkcml2ZXIu
CisKIGNvbW1lbnQgIk9mZi1zY3JlZW4gUmVuZGVyaW5nIgogCiBjb25maWcgQlIyX1BBQ0tBR0Vf
TUVTQTNEX09TTUVTQV9HQUxMSVVNCmRpZmYgLS1naXQgYS9wYWNrYWdlL21lc2EzZC9tZXNhM2Qu
bWsgYi9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsKaW5kZXggY2U0NjBjNDQ3NS4uZDNiNTAxMDY0
OCAxMDA2NDQKLS0tIGEvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rCisrKyBiL3BhY2thZ2UvbWVz
YTNkL21lc2EzZC5tawpAQCAtMTE0LDYgKzExNCw3IEBAIE1FU0EzRF9HQUxMSVVNX0RSSVZFUlMt
JChCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfVklSR0wpICAgICs9IHZpcmdsCiBN
RVNBM0RfVlVMS0FOX0RSSVZFUlMtJChCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUl9C
Uk9BRENPTSkgKz0gYnJvYWRjb20KIE1FU0EzRF9WVUxLQU5fRFJJVkVSUy0kKEJSMl9QQUNLQUdF
X01FU0EzRF9WVUxLQU5fRFJJVkVSX0lOVEVMKSAgICs9IGludGVsCiBNRVNBM0RfVlVMS0FOX0RS
SVZFUlMtJChCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUl9TV1JBU1QpICs9IHN3cmFz
dAorTUVTQTNEX1ZVTEtBTl9EUklWRVJTLSQoQlIyX1BBQ0tBR0VfTUVTQTNEX1ZVTEtBTl9EUklW
RVJfVklSVElPKSArPSB2aXJ0aW8KIAogaWZlcSAoJChCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElV
TV9EUklWRVIpLCkKIE1FU0EzRF9DT05GX09QVFMgKz0gXAotLSAKMi4zOS4yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
