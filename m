Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC113C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 15:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4DBF81EF8;
	Wed, 27 Mar 2024 15:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PsyjWFwNE578; Wed, 27 Mar 2024 15:07:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 860A382044
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 860A382044;
	Wed, 27 Mar 2024 15:07:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C39D01BF418
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 15:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF60140574
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 15:07:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogYqbpmXfC_y for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 15:07:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=cleger@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5DD0740570
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DD0740570
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5DD0740570
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 15:07:00 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41486b39f46so606875e9.0
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 08:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711552018; x=1712156818;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nZ/po6AlQMUlYybkfrtkpfh44x5vilnE9u7PumB2zIM=;
 b=rpzEMDJmQxUYDi2+ZtRvHlOO0fkb6/8Iq8v79lbQiXA5COyByCRlz9fhsHou+GRAkG
 Zc2WOeSiZ4ITk8Fw/eIVRoLQUBC2YRikkHnW8yBN6+MfT8qGN2xfW5K6w4h08l/1m5PW
 pV7azJXaIisIBJEiHVEED6ian9etePE4vIkdhtIxCgoq6VzAjvwheky1QItqienanihF
 ZCxyipwzkm4ffmbPlau8RVmLo5ydv63ZNP6MWZzOy7PYVx1uToLcDP4nZUZBUhpe/nEj
 dDvB8n1Vm33H2iN0cSA1WQmQoAesMBt7OhU6H6zdJKbHj0ZcX+fzoCDS+ZWOAnAjJSlK
 6yyA==
X-Gm-Message-State: AOJu0YysBxjOkl0itzni0PB0EHzcwf/sj0km+wx+/EH6dT3fME+vM31H
 EcvubxVUoXlmf3hgymCshWhlvfAqBtC8nrgizYe1Zxo3s6EVGL6J+gP5AtyKl26hbP1eU21yrIX
 RJLo=
X-Google-Smtp-Source: AGHT+IFRi67n6L446+gXhscQgMmLXGHgvvD32wDAUC5e1R+ZtOBSWJYllor0EGQosx5ITVftQ/2noA==
X-Received: by 2002:a05:600c:198a:b0:414:7ed9:d5c8 with SMTP id
 t10-20020a05600c198a00b004147ed9d5c8mr273571wmq.0.1711552017651; 
 Wed, 27 Mar 2024 08:06:57 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9678:f1de:fff7:3af5])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05600c00cf00b00414041032casm2766172wmm.1.2024.03.27.08.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 08:06:56 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: buildroot@buildroot.org
Date: Wed, 27 Mar 2024 16:06:13 +0100
Message-ID: <20240327150616.39345-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240327150616.39345-1-cleger@rivosinc.com>
References: <20240327150616.39345-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711552018; x=1712156818;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nZ/po6AlQMUlYybkfrtkpfh44x5vilnE9u7PumB2zIM=;
 b=fPu/Fcc7eh8/RH2Qwrmaw6BmPk5qiI4rLN/jmLq0KYjuCe3NgZ5w3BZmHU544oe42n
 6ae7ISGo3AoniYQq5spFPNSGq9svkx4ALi5SSPRAENXuE9RlJprm89YQKLS9YAVlWPNZ
 AM0ATFHPNW5EoJVhhGzrNJjP/pCuK1jCS+Ki9FshVo12lRRDsNpZpPAwt4rzgLlkDOXm
 IZn4ym9mpkUeco4Yer4npy7Y9si6qCLOllUwhdHm8CXxobqP+bNt3pU4dqxx2DhrmjwD
 JvOFqjANO4zDF+gqudFtB9Daa87uDl4TUCHT0Uk0l5v2T3DJRz6Tud5kNjQXO5XHelNU
 CLgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=fPu/Fcc7
Subject: [Buildroot] [PATCH 2/2] package/kvmtool: enable build for riscv
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
Cc: Anup Patel <apatel@ventanamicro.com>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

a3ZtdG9vbCBub3cgc3VwcG9ydHMgcmlzY3YsIGVuYWJsZSBpdCBhbmQgc2VsZWN0IEJSMl9QQUNL
QUdFX0RUQyB3aGljaAppcyBuZWVkZWQgdG8gYnVpbGQgaXQuCgpTaWduZWQtb2ZmLWJ5OiBDbMOp
bWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogcGFja2FnZS9rdm10b29sL0Nv
bmZpZy5pbiB8IDcgKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2t2bXRvb2wvQ29uZmlnLmluIGIvcGFj
a2FnZS9rdm10b29sL0NvbmZpZy5pbgppbmRleCBiZjE5YTI1Mzc2Li4zNTIyNWUwMTUwIDEwMDY0
NAotLS0gYS9wYWNrYWdlL2t2bXRvb2wvQ29uZmlnLmluCisrKyBiL3BhY2thZ2Uva3ZtdG9vbC9D
b25maWcuaW4KQEAgLTYsMTEgKzYsMTIgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0tWTVRPT0wKIAkj
IE9ubHkgbWlwcyBiaWctZW5kaWFuIHNlZW1zIHRvIGJlIHN1cHBvcnRlZCAoYnVpbGQgYnJlYWtz
KQogCSMgU2hvdWxkIHdvcmsgb24gcG93ZXJwYzY0IGJ1dCB0aGUgYnVpbGQgYnJlYWtzIHdpdGgg
bWlzc2luZyB0eXBlcwogCWRlcGVuZHMgb24gQlIyX2FhcmNoNjQgfHwgQlIyX2FybSB8fCBCUjJf
YXJtZWIgfHwgQlIyX2kzODYgfHwgXAotCQlCUjJfbWlwcyB8fCBCUjJfeDg2XzY0CisJCUJSMl9t
aXBzIHx8IEJSMl94ODZfNjQgfHwgQlIyX3Jpc2N2CiAJIyBsaWJmZHQgaXMgb25seSByZXF1aXJl
ZCBmb3IgRFQgYXJjaGl0ZWN0dXJlcy4uLgogCSMgLi4uYnV0IGl0J3Mgbm90IGFibGUgdG8gYnVp
bGQgZm9yIHN0YXRpYyB0YXJnZXRzCi0JZGVwZW5kcyBvbiAhKEJSMl9TVEFUSUNfTElCUyAmJiAo
QlIyX2FhcmNoNjQgfHwgQlIyX2FybSB8fCBCUjJfYXJtZWIpKQotCXNlbGVjdCBCUjJfUEFDS0FH
RV9EVEMgaWYgQlIyX2FhcmNoNjQgfHwgQlIyX2FybSB8fCBCUjJfYXJtZWIKKwlkZXBlbmRzIG9u
ICEoQlIyX1NUQVRJQ19MSUJTICYmIChCUjJfYWFyY2g2NCB8fCBCUjJfYXJtIHx8IFwKKwkJQlIy
X2FybWViIHx8IEJSMl9yaXNjdikpCisJc2VsZWN0IEJSMl9QQUNLQUdFX0RUQyBpZiBCUjJfYWFy
Y2g2NCB8fCBCUjJfYXJtIHx8IEJSMl9hcm1lYiB8fCBCUjJfcmlzY3YKIAloZWxwCiAJICBrdm10
b29sIGlzIGEgbGlnaHR3ZWlnaHQgdG9vbCBmb3IgaG9zdGluZyBLVk0gZ3Vlc3RzLgogCSAgQXMg
YSBwdXJlIHZpcnR1YWxpemF0aW9uIHRvb2wgaXQgb25seSBzdXBwb3J0cyBndWVzdHMgdXNpbmcK
LS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
