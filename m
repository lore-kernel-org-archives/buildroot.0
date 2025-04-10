Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38303C3601E
	for <buildroot@archiver.kernel.org>; Thu, 10 Apr 2025 15:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB1D84081D;
	Thu, 10 Apr 2025 15:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nEwl7_i8oeV4; Thu, 10 Apr 2025 15:41:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9EAC407DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9EAC407DC;
	Thu, 10 Apr 2025 15:41:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E52CC193
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 15:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6A0B407DC
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 15:41:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AeKbtl-iAG5M for <buildroot@buildroot.org>;
 Thu, 10 Apr 2025 15:41:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=mickael.tansorier@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 065E940569
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 065E940569
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 065E940569
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 15:41:41 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43ed8d32a95so9209685e9.3
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 08:41:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744299700; x=1744904500;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vg9Z/4HlRqm7446/AtpxrgQr4dUaQvMtkjn8ocyOhx0=;
 b=UiPV143l4zHTBAVTKIRDwRiU9vSJ+Yrlv1Ia9FkwmfAO5Nkg5HxJSgycKf3+f3Zyz/
 KkNcAQE0S4wFMJgUAh6daQhM3j6WAkUJ1Vbrv/PVp2BY/9AK4pLPNMLdxsXUfsN18du1
 VjuA14FdYK/0AtwE/1kg8b35SuO+a4TQi5bBmcBerr9vUddT72JIxmB/rFq9T338uJH1
 /06vCSHKihzZq7fHlUoSLI/h7Q/+1WzHFwF/BX9iuXW+W6KSbIw3JEKg9MrklM/DMPA1
 +20KYweEXKm1236WEiMtxDQrgk88RkyUisYiQBgYJxwt4cVUctbsODb0YIqkP0CzH/2w
 SFYg==
X-Gm-Message-State: AOJu0YyoSnR5msRAPFsrDyZpZUqXY0x56LSEGgaYzJl36+dwv2fcrVbv
 YmBEEHVvCLlhXzSfPr1wO70TO7dpVYYJYBfI/GbcRZIwY8ouzG625HiAXF7YIe8bRJzFjmnE03a
 9YCI=
X-Gm-Gg: ASbGncus77SRyAVt9qql8IepHLN1t35lpplCBXTnleW88Czc6lVVx2X+kTvBj2cid5c
 eCfEwtDZmmqePffPdHkdHtcWZlkzA0fPoUJwNNGg2suMomx4T/eRPZTYu1vkGTefIKrWu3OiuXE
 XBY+K3kL390uDkWTL6yxrm5hXKnFKZK4V6kx06Lh7CC8FG6uK3yHy9EkXSSG11PYJcxNTcNYj5m
 3TiJZi+fIK1iG7iTzC14TV/mCo6208CXdCU1he0iO207wTM79iGFKq63TVN7pyq2P/yKbwSmO9O
 r5HjHCOj6SQLTyrPMHzpztA3NHS4DvNMc+P8Y0YJ7Hw6D9aas/P7LfMss1g2dhG2RIUCfsb+NX2
 80tZPZPbPE4C6eX7hyuOC2duYTZXPTLG49yvwDGBO
X-Google-Smtp-Source: AGHT+IFU7aVgxF9Je2wMD8/85CKhaKgvD+mwHZOKJWVMgOEG5mGTeNITit7dRStDJFaEu1n8Zq3EVQ==
X-Received: by 2002:a05:6000:40d9:b0:390:ed04:a676 with SMTP id
 ffacd0b85a97d-39d8f46a1demr2941439f8f.22.1744299700039; 
 Thu, 10 Apr 2025 08:41:40 -0700 (PDT)
Received: from baku.localdomain
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f235b050fsm57285735e9.40.2025.04.10.08.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 08:41:39 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Micka=C3=ABl=20Tansorier?= <mickael.tansorier@smile.fr>
Date: Thu, 10 Apr 2025 17:41:36 +0200
Message-ID: <20250410154136.3786324-1-mickael.tansorier@smile.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1744299700; x=1744904500; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Vg9Z/4HlRqm7446/AtpxrgQr4dUaQvMtkjn8ocyOhx0=;
 b=hRtXTtx55jtRsMMvLXtihjfxEJAZFP69CKz8JaGNFwlZNkeTX5vJ+UVTOTnfDBjPvJ
 6ERYaHnfwPDUr6jycG0fmxPfstQ16zrWwnsfh8WsI1WfdSrjzgbH1WdCfrMd4rP0dFV8
 S/wlQWISN1UMTVcxw7Vr1u2VgTqARFwya3JCw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=hRtXTtx5
Subject: [Buildroot] [PATCH] package/mineclonia: bump to version 0.113.0
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
From: =?utf-8?q?Micka=C3=ABl_Tansorier_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Micka=C3=ABl=20Tansorier?= <mickael.tansorier@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VXBkYXRlIG1pbmVjbG9uaWEgdmVyc2lvbi4KClNlZToKaHR0cHM6Ly9naXRodWIuY29tL1Rlc3Nl
cmFjdDREL21pbmVjbG9uaWEvcmVsZWFzZXMvdGFnLzAuMTEzLjAKCkZpeCBtaXNzaW5nIHNvdXJj
ZSBmb3IgYHBhY2thZ2UvQ29uZmlnLmluYC4KClNpZ25lZC1vZmYtYnk6IE1pY2thw6tsIFRhbnNv
cmllciA8bWlja2FlbC50YW5zb3JpZXJAc21pbGUuZnI+Ci0tLQogcGFja2FnZS9Db25maWcuaW4g
ICAgICAgICAgICAgICAgICB8IDEgKwogcGFja2FnZS9taW5lY2xvbmlhL21pbmVjbG9uaWEuaGFz
aCB8IDIgKy0KIHBhY2thZ2UvbWluZWNsb25pYS9taW5lY2xvbmlhLm1rICAgfCAyICstCiAzIGZp
bGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCmluZGV4IDE5ZWUyMTE5Y2Uu
LjE2NTZiMjc2ZGIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCisrKyBiL3BhY2thZ2Uv
Q29uZmlnLmluCkBAIC0yOTksNiArMjk5LDcgQEAgbWVudSAiR2FtZXMiCiAJc291cmNlICJwYWNr
YWdlL2x1YW50aS9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL2x1Z2FydS9Db25maWcuaW4i
CiAJc291cmNlICJwYWNrYWdlL21pbmV0ZXN0LWdhbWUvQ29uZmlnLmluIgorCXNvdXJjZSAicGFj
a2FnZS9taW5lY2xvbmlhL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2Uvb3BlbnR5cmlhbi9D
b25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL29wZW50eXJpYW4tZGF0YS9Db25maWcuaW4iCiAJ
c291cmNlICJwYWNrYWdlL3ByYm9vbS9Db25maWcuaW4iCmRpZmYgLS1naXQgYS9wYWNrYWdlL21p
bmVjbG9uaWEvbWluZWNsb25pYS5oYXNoIGIvcGFja2FnZS9taW5lY2xvbmlhL21pbmVjbG9uaWEu
aGFzaAppbmRleCBhZWEzODA3ZTczLi5jNTc3ODlkMTc1IDEwMDY0NAotLS0gYS9wYWNrYWdlL21p
bmVjbG9uaWEvbWluZWNsb25pYS5oYXNoCisrKyBiL3BhY2thZ2UvbWluZWNsb25pYS9taW5lY2xv
bmlhLmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICBi
MDlkMWFmOTRjMzU3NmZjODlhMTJjMjNlYTJjZDZlODRkMTE0ZmIwNGEzODlmMTc0NmYxMzk5NzIx
Y2QzYWU0ICAwLjExMS4xLnRhci5negorc2hhMjU2ICA0N2RjNTdhNTQ4N2FlMTlkNjVmNjQ3MWE4
NTYzOGUwNzM1NjRkNTIwOWM4ZGJkODQ2ODc4OTEwNTlkMGUwNWE5ICAwLjExMy4wLnRhci5negog
CiBzaGEyNTYgIDFiMzc4MmNjYWQ3Yjg2MTQxMDBjZGEzMGQzZmFmNDJmYzM5ZjJlOTc5MzI5MDhj
NTQzMDA1MDUzYjY1NGNhNjggIExJQ0VOU0UudHh0CiBzaGEyNTYgIDViNjY4NDEwNzA4MjQ5MDBl
ZWZhOWQzM2Q3YzM4ODdmMmRmYzQzMzQ3MTdiNDYwYWE3YzhiOGFlMjNkYWY3ZDQgIG1vZHMvRU5U
SVRJRVMvbWNsX2NoYXJnZXMvdGV4dHVyZV9saWNlbnNlLnR4dApkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9taW5lY2xvbmlhL21pbmVjbG9uaWEubWsgYi9wYWNrYWdlL21pbmVjbG9uaWEvbWluZWNsb25p
YS5tawppbmRleCBlYjY5ZWVhYWI5Li42NmU4MmEzMGY2IDEwMDY0NAotLS0gYS9wYWNrYWdlL21p
bmVjbG9uaWEvbWluZWNsb25pYS5taworKysgYi9wYWNrYWdlL21pbmVjbG9uaWEvbWluZWNsb25p
YS5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLU1JTkVD
TE9OSUFfVkVSU0lPTiA9IDAuMTExLjEKK01JTkVDTE9OSUFfVkVSU0lPTiA9IDAuMTEzLjAKIE1J
TkVDTE9OSUFfU09VUkNFID0gJChNSU5FQ0xPTklBX1ZFUlNJT04pLnRhci5negogTUlORUNMT05J
QV9TSVRFID0gaHR0cHM6Ly9jb2RlYmVyZy5vcmcvbWluZWNsb25pYS9taW5lY2xvbmlhL2FyY2hp
dmUKIE1JTkVDTE9OSUFfTElDRU5TRSA9IEdQTHYzLCBNSVQgKG1vZHMpCi0tIAoyLjQ5LjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
