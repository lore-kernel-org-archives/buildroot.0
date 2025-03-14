Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5253C282EC
	for <buildroot@archiver.kernel.org>; Fri, 14 Mar 2025 10:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F3758222D;
	Fri, 14 Mar 2025 10:41:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tUL5HxAQT6bZ; Fri, 14 Mar 2025 10:41:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E88382261
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E88382261;
	Fri, 14 Mar 2025 10:41:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BC69F61
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 10:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB2524012F
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 10:41:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 34A8HVD1ekni for <buildroot@buildroot.org>;
 Fri, 14 Mar 2025 10:41:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5858940165
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5858940165
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5858940165
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 10:41:20 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so13010215e9.0
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 03:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741948878; x=1742553678;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x3T5TgPceMdbU6550OfdhfbGXPWCj9Lo7nAqmpZ4+Xw=;
 b=dZBhnWhOaJbkg56ZQyj95k75iLzvzBExCIYDRyF7q+qF5KyQe0O2Wjh5H2Zhe3ImhM
 nkbibQxHQAn9f6E8GOwJRD8L/f2aLYeXGsIo/gvHpcs5rCO8yPqjC6fWvwC9hukl+9lX
 b5zVPM9yxspg6rtr7j+sMr2N+vX8+8oHgIqSmxL6ZblIeqWlps2Io4W7/A/zl1kqZ0li
 JHFReFz6GwgYOZzVNJ/YFSMm7nyZpTxTyMoww1NpFXJ/wcdJcTaoLUEsPxZ/SwZ0h1Pg
 jrG0EpGQibdbk28zj1aqvZxd7VHcN3ql5F9vAcSo0UkK6gApNDMYZziGnTST1GWm44lZ
 yE1Q==
X-Gm-Message-State: AOJu0YzYTWeNSlyqEtH+xvFh+yKfYz98TxQyJ2w5mNwfoOObJ0CHXI0i
 /VgTTmm2V6N4gj9uJ/zo2a+N/ve7oXGkyTynmHaAJ/hgPORPTMfj1UjGeT8vL01EXrCpk36yYHR
 X
X-Gm-Gg: ASbGncsMPSarpQPA81Y6OJcqCL2ej9RhAf0z2TAYXxTK9nZDX7P0cMcsevmhNGAvbn0
 L8SK4VSjBBTR8MHpd6cxk8+Vd18BylK5avKw7NpuKL6STsjfJ3m2mcpPnMfwP3s439PpT/jTlg+
 R3LCcTj2RhNPXS9CgWteaX6cD5FD5eTDLFkagnnDty4O/TVjipZ7sQqz/7wdfMzPCqzGBek1PEl
 PozRMd2na+6oB+IQvNm2/UkwL+aLuk17av6OPpbzlTCv36ksL/G8ub4joFMfupfGQYHwLXuBTG1
 QVRBi51JVFNlySV3asU3CN9D2FuUi4LoV2TKWygSbgOoMs8=
X-Google-Smtp-Source: AGHT+IHtFnmWuLdMIXNWYiT2VGH93JhqGbHYYzborrrNemp4iMlScNkg+tst00zZctY1nv9HlCLCnA==
X-Received: by 2002:a05:600c:4f03:b0:43c:ec28:d301 with SMTP id
 5b1f17b1804b1-43d1eccf7b2mr22383165e9.26.1741948877714; 
 Fri, 14 Mar 2025 03:41:17 -0700 (PDT)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe658d4sm13152075e9.33.2025.03.14.03.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 03:41:17 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A58EB5F92C;
 Fri, 14 Mar 2025 10:41:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Fri, 14 Mar 2025 10:41:09 +0000
Message-Id: <20250314104109.2821418-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741948878; x=1742553678; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x3T5TgPceMdbU6550OfdhfbGXPWCj9Lo7nAqmpZ4+Xw=;
 b=fyxTW97G6vypVRMifFgaCADuzKE7Cbguvi8moOBH1/2B7v3xOiMsHGfo1GRpN38NLu
 eOVysyM2Y+KzhN8jDDrFt4ScM7U9IyrkFLFnNbcqKd+JiatAZae4vL7oZXN+wTQvscXj
 x6+ionaSnGIVBgSueI5DoDMwaSV3X/Zb/4AcOLB6jFVQP6RoSZ0gwLlwnb6I4xXqD40/
 n1OaWsGScEv2mb2g9fefWMsoI4dsZHiYplkpiuoDwI8Uu3amcKiqwrpcNVX49dMkuCmn
 werX12UJAOrrFxEytXC6Wmoh8djzEd6ce/4m0aeY63g2oYgJcyvcXqWZoLYG/m+S4Sq0
 3DMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=fyxTW97G
Subject: [Buildroot] [RFC PATCH] package/fio: explicitly control libnfs
 dependency
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
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHVwc3RyZWFtIHVzZXMgcGtnLWNvbmZpZyB0byBkZXRlY3QgYW5kIGVuYWJsZSBsaWJuZnMg
dXNhZ2UgaWYgaXQKaXMgZm91bmQuIFRoaXMgY2FuIGdldCBjb25mdXNlZCBieSB0aGUgaG9zdCBj
b25maWd1cmF0aW9uIHNvIGF0IHRoZQpsZWFzdCB3ZSBzaG91bGQgZGlzYWJsZSBkZXRlY3Rpb24g
aWYgd2UgYXJlIG5vdCBwbGFubmluZyB0byBidWlsZCB3aXRoCml0LgoKU2lnbmVkLW9mZi1ieTog
QWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgotLS0KIHBhY2thZ2UvZmlvL2Zp
by5tayB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2Zpby9maW8ubWsgYi9wYWNrYWdlL2Zpby9maW8u
bWsKaW5kZXggMTBmYWZiOGEwZS4uNTdhNTRkYzM0YSAxMDA2NDQKLS0tIGEvcGFja2FnZS9maW8v
ZmlvLm1rCisrKyBiL3BhY2thZ2UvZmlvL2Zpby5tawpAQCAtMTYsNyArMTYsMTAgQEAgRklPX0RF
UEVOREVOQ0lFUyArPSBsaWJhaW8KIGVuZGlmCiAKIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTElCTkZT
KSx5KQotRklPX0RFUEVOREVOQ0lFUyArPSBsaWJuZnMKK0ZJT19PUFRTICs9IC0tZW5hYmxlLWxp
Ym5mcworRklPX0RFUEVOREVOQ0lFUyArPSBob3N0LXBrZ2NvbmYgbGlibmZzCitlbHNlCitGSU9f
T1BUUyArPSAtLWRpc2FibGUtbGlibmZzCiBlbmRpZgogCiBpZmVxICgkKEJSMl9QQUNLQUdFX0xJ
QklTQ1NJKSx5KQotLSAKMi4zOS41CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
