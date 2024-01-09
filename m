Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66242C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 18:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D49DF4161C;
	Tue,  9 Jan 2024 18:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D49DF4161C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 241jq9LQ0WGx; Tue,  9 Jan 2024 18:27:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3103741601;
	Tue,  9 Jan 2024 18:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3103741601
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5808C1BF2A9
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 18:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B05C831DE
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 18:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B05C831DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DAePU_Iiy2AH for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 18:27:09 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA2BA831A7
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 18:27:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA2BA831A7
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40e4d778e5eso12648245e9.1
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 10:27:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704824826; x=1705429626;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rLSL3AFOK6VjqCXRU6pezex5QMrh5X8kJlJ3kaRwqc4=;
 b=vV2erjQpuzbDzETdsA/nJus0oYqTRQGwpd+nB2Cd8Y37jSybhc+k32ACXg1EmFk7vb
 s7qhwGLFDofIEdF+wQwFrUZoFUQUeKNTpdrJHtXbzOQuOp+SHi6sA6ClAtKeNuUDHrZB
 NicjhPF/vl7EXaBydPHkTTPeW0V6tl/ubYX2qAsU6AUOGZGnOR3jlY4CoQBy+c9o4qMf
 uw05IerjpOf1spQq6i9Ya0RSGB50RCxavFoTo9XPIZYPWY4eOevISM/rbvPGFhishHTt
 X1F4pRdM8LR7GO5hdXU0wbnr/o6caUyGXe8Jg9rUj/G3Ek63yigOfhFe0jTIhXASh0ET
 VVlA==
X-Gm-Message-State: AOJu0YzolJYmSTVYl51xpKV+JZZ0CUzEJTDjySlXY3MjIOFyyLJX56aT
 A29V3EZFqMdAK8+A4CgFX6/Fy7qtM7coIYtir1I6jZRP6Ps=
X-Google-Smtp-Source: AGHT+IHIynIRptyQplAjhKoiX1t9O3mmQJTbotemrRAa8LIqwjPm81wkXwJnvyFQucHneIAbxuv2qQ==
X-Received: by 2002:a05:600c:3108:b0:40e:4156:9f68 with SMTP id
 g8-20020a05600c310800b0040e41569f68mr2923228wmo.136.1704824826018; 
 Tue, 09 Jan 2024 10:27:06 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 d15-20020a05600c34cf00b0040d5ac00dc6sm4611324wmq.8.2024.01.09.10.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 10:27:05 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 65F8E5F786;
 Tue,  9 Jan 2024 18:27:05 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 18:26:56 +0000
Message-Id: <20240109182656.3265944-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704824826; x=1705429626; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rLSL3AFOK6VjqCXRU6pezex5QMrh5X8kJlJ3kaRwqc4=;
 b=JPnURVqxgzSJqH/Nb6j33IttkLr/+j7h3O1GjRN6/bd7yCpSOmAp/8VfjrUdEqOFDz
 hSAyoYYSJ6FqaZcUzHovrOXq8ofsGBDhvT0rNknbdpkVCqRH/Zzn11SwM2U0Xr4ju6gS
 ZNWfFt42KZFHvlwcln7oC9eXGHGBuQIP+HtYtPHDeno9uOztg5MG1RLFtzSFlvoRVhna
 OthygrL+QH8YdfBsXUwy9R6lsHyzw7r0xiNv5bqZELbTT+9VULcFFj2FQq3ahwqMLuQl
 /0hFtSl/sfnr1rr80zdZ7JGzL0QzSI8NwWjIjZIKE3VNGXjcirl9blHZuml5tWYOE9lg
 2H+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=JPnURVqx
Subject: [Buildroot] [RFC PATCH] package/mesa3d: add option to enable VIRTIO
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
Cc: bernd@kuhls.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHN1cHBvcnQgZm9yIFZlbnVzIGluIE1FU0EgaGFzIGJlZW4gc3RhYmxlIHNpbmNlIDIzLjIg
c28gYWRkIGFuCm9wdGlvbiB0byBlbmFibGUgaXQuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7D
qWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Ci0tLQogcGFja2FnZS9tZXNhM2QvQ29uZmlnLmlu
IHwgNiArKysrKysKIHBhY2thZ2UvbWVzYTNkL21lc2EzZC5tayB8IDEgKwogMiBmaWxlcyBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL21lc2EzZC9Db25maWcu
aW4gYi9wYWNrYWdlL21lc2EzZC9Db25maWcuaW4KaW5kZXggMzlhNGY3MDZlMi4uYjY5NTQ5NmMw
OSAxMDA2NDQKLS0tIGEvcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvbWVz
YTNkL0NvbmZpZy5pbgpAQCAtMzI1LDYgKzMyNSwxMiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTUVT
QTNEX1ZVTEtBTl9EUklWRVJfU1dSQVNUCiAJaGVscAogCSAgVnVsa2FuIHN3cmFzdCBkcml2ZXIu
CiAKK2NvbmZpZyBCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUl9WSVJUSU8KKwlib29s
ICJWdWxrYW4gVmlydElPIGRyaXZlciAoVmVudXMpIgorCXNlbGVjdCBCUjJfUEFDS0FHRV9NRVNB
M0RfVlVMS0FOX0RSSVZFUgorCWhlbHAKKwkgIFZ1bGthbiBWaXJ0SU8gKHZlbnVzKSBkcml2ZXIu
CisKIGNvbW1lbnQgIk9mZi1zY3JlZW4gUmVuZGVyaW5nIgogCiBjb25maWcgQlIyX1BBQ0tBR0Vf
TUVTQTNEX09TTUVTQV9HQUxMSVVNCmRpZmYgLS1naXQgYS9wYWNrYWdlL21lc2EzZC9tZXNhM2Qu
bWsgYi9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsKaW5kZXggOThmYTMzZmViZS4uNWQ2ZTU2ODJm
MCAxMDA2NDQKLS0tIGEvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rCisrKyBiL3BhY2thZ2UvbWVz
YTNkL21lc2EzZC5tawpAQCAtMTIyLDYgKzEyMiw3IEBAIE1FU0EzRF9HQUxMSVVNX0RSSVZFUlMt
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
