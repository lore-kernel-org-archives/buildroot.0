Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4870C369D5
	for <buildroot@archiver.kernel.org>; Mon, 28 Apr 2025 21:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5345B40A03;
	Mon, 28 Apr 2025 21:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V24NddWqyQQX; Mon, 28 Apr 2025 21:01:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 878D040B67
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 878D040B67;
	Mon, 28 Apr 2025 21:01:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 84682117
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 21:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81D11400F2
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 21:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDe79y-dVbub for <buildroot@buildroot.org>;
 Mon, 28 Apr 2025 21:01:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1CF4E400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CF4E400D8
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CF4E400D8
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 21:01:31 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso51058565e9.1
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 14:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745874090; x=1746478890;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AIshpTAt109rhjGsyzWDBilufvqib31lm4KIS/gNSZQ=;
 b=qvIuNO2mByrQJNlqT1eX6sTDsikIpfc2WYSpw57d93il5M3b7+ehs8il/RasFc4aub
 Q5UVDOHx4zbL7yWIxaAIEDj+PXwuGJs7DuVAsI188OmVMiFNzKm3qTVJb+Fe79HmbEPH
 THT0Dgpb0BnEA3vfhzeGZoA7c2M74HBWfxFXbj3fORkvzAPqNEYYG7nd+LvE8JOKmCCT
 k6tUe8Oh7Yw0cAECYtG/sb4P8D71KCxuNwLIyuvsxtYRYBgOIJr9V7rLOCwXzmhPmKP8
 QEQh8l5/QMSCTCYSKmwdfseKsHfShYcWTdM9MVklCL1qGWghiCLw9Jqr5XgPrdo1MCUx
 UX3Q==
X-Gm-Message-State: AOJu0YwbWKtr7aWqrlhvKmcuRpN5FM3ogSQbEM3XeK5OYovQ4O+oRC9P
 d2YbrEa2IoOSIR4+fv4gHo4QzQ0HaFv0WqJGV8NG4xTLENFNPMThAEnXGVUiEmPpAlOZSO4NW+8
 c
X-Gm-Gg: ASbGncun3aygv0nJnaVikh71vyCwIBa3NLdXyKdBpsS4UBxHOnxS2wv/d3wnrpXGhJB
 rXHZwtWYaHSw0snxu9X6ppGqxtunHTPNWTENu7bRy2LLgsjZ0AEKCt+K2tIeKtbiisus6qqzOWG
 lJ3ziLcnQVphAhRG90Fo+E3eqTI8CXEyP0FvkgfV3xu4CL//MRq84MCALcUWJvPhBvA8vm4TiIZ
 IjoF/tZW5akg05dH5n1MEwO5Xyg6rAsVP5UwCbKmv5V9AssajvLJQZzCbAywfpfcccol/gU3ZKl
 v680Zxa2fIOyisFKyF+/e1wzFtOp2NxlI5tg/vtrRsuKJtFA8+p62RPOCOAl
X-Google-Smtp-Source: AGHT+IFpmp50z0aacWXMOmqnaCVxI61lNqf+ZTbkOQTi730wVoszEbN626F5R/ZbpX/zxX+4h3tcww==
X-Received: by 2002:a05:600c:1e11:b0:43d:762:e0c4 with SMTP id
 5b1f17b1804b1-440ab8709c8mr89067455e9.27.1745874090006; 
 Mon, 28 Apr 2025 14:01:30 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([213.211.140.212])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a5394bfasm136162835e9.40.2025.04.28.14.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 14:01:29 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Sen Hastings <sen@hastings.org>
Date: Mon, 28 Apr 2025 23:01:18 +0200
Message-ID: <20250428210120.1501818-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1745874090; x=1746478890; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AIshpTAt109rhjGsyzWDBilufvqib31lm4KIS/gNSZQ=;
 b=LeGxm29sZDRwuffQsuK2yTdhrLtQ8im2nXcqd8oiPgCtGwcjda7SpHSJ/tPQLERn4x
 c5VKrgIeyBtn8EO+lMQ5E/vcXQBHEleGd/LoQ+sO2bFlQPXKYnKEIoA1SCa2EcjcbO+r
 O0nlPx8mKNnpkwFKY7/5DwDJGazPMO2a4SpmDhg6Xu/kVNULi98tS4hWaZYLMAcMxxDn
 xZjL69Th52+pTZ8TPQlybNFWkRbsbVI4h1apM0FY2hzLI6+oo9jp3aey3t0huSQWM/in
 r1CHDwraLth7SaaSZ86dDgXGAfXrwav2Z8wcZA4HXlJjjBYenW0VW+JAoeryD4U4yvz0
 L6cA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=LeGxm29s
Subject: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: fix typo in
 --disable help text
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW5ub3lpbmdseSwgdXNpbmcgIi0tZGlzYWJsZSB3YXJuaW5nIiBkb2VzIG5vdCBkaXNhYmxlIHRo
ZSB3YXJuaW5ncwpjaGVja3MuCgpJdCB0dXJucyBvdXQgdGhhdCB3ZSBsb29rIGZvciAid2Fybmlu
Z3MiIChpLmUuIHdpdGggYW4gJ3MnKSB0byBrbm93IGlmCndlIHNob3VsZCBkaXNhYmxlIHRoZSB3
YXJuaW5ncyBjaGVjaywgc28gdXBkYXRlIHRoZSBoZWxwIHRleHQKYWNjb3JkaW5nbHkuCgpTaWdu
ZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Ci0t
LQogc3VwcG9ydC9zY3JpcHRzL3BrZy1zdGF0cyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3N1cHBvcnQvc2NyaXB0cy9w
a2ctc3RhdHMgYi9zdXBwb3J0L3NjcmlwdHMvcGtnLXN0YXRzCmluZGV4IGMxMzRlMWVjMDYuLjQ2
YjEyY2Q5OTIgMTAwNzU1Ci0tLSBhL3N1cHBvcnQvc2NyaXB0cy9wa2ctc3RhdHMKKysrIGIvc3Vw
cG9ydC9zY3JpcHRzL3BrZy1zdGF0cwpAQCAtMTI3Niw3ICsxMjc2LDcgQEAgZGVmIHBhcnNlX2Fy
Z3MoKToKICAgICBwYXJzZXIuYWRkX2FyZ3VtZW50KCctLW52ZC1wYXRoJywgZGVzdD0nbnZkX3Bh
dGgnLAogICAgICAgICAgICAgICAgICAgICAgICAgaGVscD0nUGF0aCB0byB0aGUgbG9jYWwgTlZE
IGRhdGFiYXNlJywgdHlwZT1yZXNvbHZlcGF0aCkKICAgICBwYXJzZXIuYWRkX2FyZ3VtZW50KCct
LWRpc2FibGUnLCB0eXBlPWxpc3Rfc3RyLAotICAgICAgICAgICAgICAgICAgICAgICAgaGVscD0n
RmVhdHVyZXMgdG8gZGlzYWJsZSwgY29tbWEtc2VwYXJhdGVkIChjdmUsIHVwc3RyZWFtLCB1cmws
IHdhcm5pbmcpJywKKyAgICAgICAgICAgICAgICAgICAgICAgIGhlbHA9J0ZlYXR1cmVzIHRvIGRp
c2FibGUsIGNvbW1hLXNlcGFyYXRlZCAoY3ZlLCB1cHN0cmVhbSwgdXJsLCB3YXJuaW5ncyknLAog
ICAgICAgICAgICAgICAgICAgICAgICAgZGVmYXVsdD1bXSkKICAgICBwYXJzZXIuYWRkX2FyZ3Vt
ZW50KCctdicsICctLXZlcmJvc2UnLCBkZXN0PSd2ZXJib3NlJywgYWN0aW9uPSdzdG9yZV90cnVl
JywKICAgICAgICAgICAgICAgICAgICAgICAgIGhlbHA9J0luY3JlYXNlIHZlcmJvc2l0eScpCi0t
IAoyLjQ5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
