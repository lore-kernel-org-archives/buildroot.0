Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69714C8303C
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 17:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A47D820E8;
	Mon,  7 Jul 2025 17:38:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vkxv0KjnZ8ud; Mon,  7 Jul 2025 17:38:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 613D782135
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 613D782135;
	Mon,  7 Jul 2025 17:38:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 940241BF
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 17:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 859276128A
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 17:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I5WDZZcslqfC for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 17:38:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7CCD36126E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CCD36126E
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CCD36126E
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 17:38:36 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a53359dea5so1753461f8f.0
 for <buildroot@buildroot.org>; Mon, 07 Jul 2025 10:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751909914; x=1752514714;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AneIzYnIXIHfQU3tWxkb8+5eTGInKqAZdSPuGArzt4o=;
 b=HeW/QC0GLih/ft7psT7d2DJogBZf3SUhDQwyd9FA1dz+iT68oOTtR5O1SxNU+BFgM6
 fBHMKP4pyVUL4J6PmehapU8jjz3JI7CfJkO0o3Bzh5M2HmVAba+WYto3OyYxADHd81g9
 aaCHDLMT9GiFxLUQxlaCVeeWBIMmNj46DQIQaf6Fxp2CWP/Mg7l29Q2zgQ7rLZW5Q6AR
 EM4fsShDcYletf+e2ZIeEGRUC/PaZHZ963I4iwWk4Ou2E9j1gy3jtfSP3RquZxiF6/EE
 QkM1W6TxbnatmFOW9QLP4owN34ATogB6GpHigLNsTInBk1j2QXEywlAdpkJ1xsDvRCex
 vY7w==
X-Gm-Message-State: AOJu0YzCevcAFzk79/GTmOScZvzc5EMt0Q7QcGRXOlCVXZjfr9z069QM
 N/+zY3xZQ/yvhCK2JR/5fizydqMFopM8cMk1kVH8r5E1ZIENGVZ360yaQzrAyAwor4vjucJ4oBW
 U0/Ye
X-Gm-Gg: ASbGncv5NU2+Uz78GRqebLwzqQPU+NAx0L/7N4hibaBphNGb6zQzt4Z0EVy1g5qcW11
 DFkRZdai1z+rLzwZoEjrbIi2weNAYiLc0L38SY0c1i2UzrfQ7dvWusAWDLoTH1AMMMZJAnqoKaD
 sbBKTsiOYV2eUZ9pNLFXTCxBaOwDx/5TztqI+Y+0OsMRix7efbTE2IpMt6CcR8v1/tjaRXQoHJd
 hrVD/ZtqxwpieOP+CqJ9KSCiFafUSwduY2DwiDiFFty69vd6SpaidlcYMkCwrkaihLqFA4/oNXA
 r6zQDiiIdAiuntwtaRyf51PCPc+twaEB2wwQvL79Z5BTkYG24ASO4k2D0JN6XIBP44WA+qb81sT
 vpxRbGfHad0L6il+XiOf2Lft8z8BS9LLpxz8mFQ==
X-Google-Smtp-Source: AGHT+IGDLylnJsPgg49pKTHTcbJJ/u/BRc361syjp/nN645dXF4EB8uWZs8z2IUmgobFaVxBGb6O+w==
X-Received: by 2002:a05:6000:200b:b0:3a4:f7db:6ff7 with SMTP id
 ffacd0b85a97d-3b497042f05mr10048291f8f.52.1751909914128; 
 Mon, 07 Jul 2025 10:38:34 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.134])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9bcebf7sm150278245e9.21.2025.07.07.10.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 10:38:33 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon,  7 Jul 2025 19:38:30 +0200
Message-ID: <20250707173830.371681-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1751909914; x=1752514714;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AneIzYnIXIHfQU3tWxkb8+5eTGInKqAZdSPuGArzt4o=;
 b=dqDYiTF+PZEfj/DExhtWPK9Pwb0O8mPXslKsaFf22aKXPHERGJs7fG3KWJyCbyoCGH
 /OsmqcgZliDrSe6zqpUWnkPVj05JGNtPsewwyCbKq25pErsdUEXBmTJ6tCAeQe+swVMM
 o7qd+D6UIQLzfXOLf2Cos7S9SKTytxsZijafs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=dqDYiTF+
Subject: [Buildroot] [PATCH 1/1] package/ufs-utils: bump to version 7.14.11
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

QWRkaW5nIF9HTlVfU09VUkNFIHRvIENGTEFHUyB3YXMgbmVjZXNzYXJ5IHRvIGZpeCB0aGUgZm9s
bG93aW5nIGVycm9yCnJhaXNlZCBkdXJpbmcgdGhlIGNvbXBpbGF0aW9uIG9mIHRoZSBuZXcgdmVy
c2lvbjoKCnVmc19lbW9uLmM6IEluIGZ1bmN0aW9uIOKAmGRvX2Vtb27igJk6CnVmc19lbW9uLmM6
NDU1OjUxOiBlcnJvcjog4oCYT19ESVJFQ1TigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRo
aXMgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4g4oCYT19ESVJFQ1RPUlnigJk/CiAgNDU1IHwgICAg
ICAgICBmaWxsX2RhdGFfZmQgPSBvcGVuKCJmaWxsX2ZpbGUiLCBPX1JEV1IgfCBPX0RJUkVDVCB8
IE9fQ1JFQVQsCiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBefn5+fn5+fgogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgT19ESVJFQ1RPUlkKdWZzX2Vtb24uYzo0NTU6NTE6IG5vdGU6
IGVhY2ggdW5kZWNsYXJlZCBpZGVudGlmaWVyIGlzIHJlcG9ydGVkIG9ubHkgb25jZSBmb3IgZWFj
aCBmdW5jdGlvbiBpdCBhcHBlYXJzIGluCgpSZWxlYXNlIG5vdGVzOgpodHRwczovL2dpdGh1Yi5j
b20vU2FuRGlzay1PcGVuLVNvdXJjZS91ZnMtdXRpbHMvcmVsZWFzZXMvdGFnL3Y3LjE0LjExCgpT
aWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0
aW9ucy5jb20+Ci0tLQogcGFja2FnZS91ZnMtdXRpbHMvdWZzLXV0aWxzLmhhc2ggfCAyICstCiBw
YWNrYWdlL3Vmcy11dGlscy91ZnMtdXRpbHMubWsgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS91
ZnMtdXRpbHMvdWZzLXV0aWxzLmhhc2ggYi9wYWNrYWdlL3Vmcy11dGlscy91ZnMtdXRpbHMuaGFz
aAppbmRleCAzOWNmNjUxNmM2ZGYuLmY2NzUzNGNkMWU4ZCAxMDA2NDQKLS0tIGEvcGFja2FnZS91
ZnMtdXRpbHMvdWZzLXV0aWxzLmhhc2gKKysrIGIvcGFja2FnZS91ZnMtdXRpbHMvdWZzLXV0aWxz
Lmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY29tcHV0ZWQKLXNoYTI1NiAgYjQ2ZjFk
YmQzNjg4ZDNiNzIwMDljNTRhZTc4OWRkNjBlYTM4NjU0NmNkNDMzMzI1YzA1OTcwMjA4ZDM2Yzhh
MyAgdWZzLXV0aWxzLTYuMTQuMTEudGFyLmd6CitzaGEyNTYgIDA3ZDgwZGRkMmRjZmJlNWU4NDQ1
MTU2NDhjNDk0ZmFiMzM3OTBiZTU0NTBkMTUwYjg4ZTM2MTJkYTliMTg5NWIgIHVmcy11dGlscy03
LjE0LjExLnRhci5negogc2hhMjU2ICAyMzFmN2VkY2M3MzUyZDc3MzRhOTZlZWYwYjgwMzBmNzc5
ODI2NzhjNTE2ODc2ZmNiODFlMjViMzJkNjg1NjRjICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNr
YWdlL3Vmcy11dGlscy91ZnMtdXRpbHMubWsgYi9wYWNrYWdlL3Vmcy11dGlscy91ZnMtdXRpbHMu
bWsKaW5kZXggNjcyMDQxYTExOWQzLi5jYWZjODI1ZmFiNTUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uv
dWZzLXV0aWxzL3Vmcy11dGlscy5taworKysgYi9wYWNrYWdlL3Vmcy11dGlscy91ZnMtdXRpbHMu
bWsKQEAgLTQsMTMgKzQsMTMgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLVVGU19V
VElMU19WRVJTSU9OID0gNi4xNC4xMQorVUZTX1VUSUxTX1ZFUlNJT04gPSA3LjE0LjExCiBVRlNf
VVRJTFNfU0lURSA9ICQoY2FsbCBnaXRodWIsU2FuRGlzay1PcGVuLVNvdXJjZSx1ZnMtdXRpbHMs
diQoVUZTX1VUSUxTX1ZFUlNJT04pKQogVUZTX1VUSUxTX0xJQ0VOU0UgPSBHUEwtMi4wCiBVRlNf
VVRJTFNfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKIAogZGVmaW5lIFVGU19VVElMU19CVUlMRF9D
TURTCi0JJChNQUtFKSAtQyAkKEBEKSAkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykKKwkkKE1BS0Up
IC1DICQoQEQpICQoVEFSR0VUX0NPTkZJR1VSRV9PUFRTKSBDRkxBR1M9IiQoVEFSR0VUX0NGTEFH
UykgLURfR05VX1NPVVJDRSIKIGVuZGVmCiAKIGRlZmluZSBVRlNfVVRJTFNfSU5TVEFMTF9UQVJH
RVRfQ01EUwotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
