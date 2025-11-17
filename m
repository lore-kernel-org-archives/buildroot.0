Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB1BCEBF92
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 21:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92F5E80897;
	Mon, 17 Nov 2025 21:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 98Bu7N21qd1f; Mon, 17 Nov 2025 21:14:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEA7E808BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEA7E808BE;
	Mon, 17 Nov 2025 21:14:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A67001BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9865683E66
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PBdsGrJktaXF for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 21:14:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EF22F83E4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF22F83E4A
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF22F83E4A
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:14:23 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-43479d86958so23101375ab.0
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 13:14:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763414063; x=1764018863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1sPyblwYOK02mBkr8m/6nv3usU9e5ZB6suQ57BdX56w=;
 b=kDfQfSMZlf10OcRDiK+BQB3QFd9WlceMAFbRkmdXuc6L77aHKwr9GdWHOkZla4P52x
 SxIS07lkpHbK6+LbCum2uYq+WyQAONllnqpVXZN/OdAsMUDB1c5WLKmRlnVxCG7j7Lpf
 uqrnunCF2HvXYXm6+6Ztmta2z9FYZEatCQkUAf2FFixyd7HmvLKsJ+dbgOVedETIBNR5
 fGVxX8X+zosCWIRAltF7xLMQaf+7srPQ7tjdC8Gbo/Zzy1oq4I83dGbPGzmiywPtAe4j
 jymadcnZSijUpTSZjYgSD2qSIvRphsmplBu6BK5q7tnlc+4IRZFKsJmY7QfCcvS4TydZ
 VCQA==
X-Gm-Message-State: AOJu0YyjUTVajnkmdo1ubCJYQRX+B7D0xr9+RnTv2G0t4rkIr5QNlfTS
 S8lwx6EqGwhsFNM2HLcEkiH32dGUiPvtx/UZPNYINqlyds16OlDJ3VI4hK8h9cGkDwE=
X-Gm-Gg: ASbGncvgt/W8jiiXfBoNQ0oFgrskzx12BXxyxNFOQY6Sp/hNCGVwgBx5J+3eNuCIPLg
 805E2e8ZgZlP4D8Ysrkdknh58zPUt8GjKS2z0m7yWAR1h8u8aM1S5UtuXa5J0p85qmQRNgALpb8
 2+yvdjcgV0PSR4xEobjn+tE+POwZ40mcq2rIxa22QY7xB/b3RC3KB8eQO5QEQWgceWhFBJsjkPL
 /CB8Czlgw99TDPjXo+FYUVAPXdOCExpXezTUSXdfNnOn6hy6k41Dd5VfLafZHVf8MgOh+LHbPwm
 Sv2q8GAKDatLH/YW0oB2GSvZXURLSXyhb96pQndSwgYUJb+soyqAkfryngL+ufnOHZAy+waRVR5
 Rh7M0l4ASDTJQnQitV9WbUT+NX/kEL5wud9vUXdw639Hb7TplaN1pCI2hzoXm19QsmW1occwoqD
 ayjPpUSNr8DSoR92QPmSfbmabIJOCsfMZjTzVV/6dFVtq+lyd5aXe/+m21abqC
X-Google-Smtp-Source: AGHT+IFJyQOMod2gJX5cMuP+xwqO/obc2Ko7rgBt6++p0hFr51b1EVOIVmpuXA8X1zoMZh6h21Vd8A==
X-Received: by 2002:a92:c0ca:0:b0:434:96ea:ff77 with SMTP id
 e9e14a558f8ab-43496eb0287mr101540195ab.39.1763414062738; 
 Mon, 17 Nov 2025 13:14:22 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-218-112-180.hlrn.qwest.net.
 [71.218.112.180]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-434833c5357sm75265425ab.2.2025.11.17.13.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 13:14:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 17 Nov 2025 14:14:12 -0700
Message-ID: <20251117211412.2491717-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117211412.2491717-1-james.hilliard1@gmail.com>
References: <20251117211412.2491717-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763414063; x=1764018863; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1sPyblwYOK02mBkr8m/6nv3usU9e5ZB6suQ57BdX56w=;
 b=bCM99P+JL14r0m+CsuVdw77/pLewIadus2vPJPnBPUKg2Sq7xemCxAYjQZLq2hlzmt
 oHSZjwHYb8/3LCCvYi0gNope0MRv5OYI2AY9Imts9loIcF2ft9F4psqgZXwYQMjYsnqq
 qPh6sXQ+pb0tS1wJdWI/cWlxKKAKtwWaGI57GIdf6IqhGERfvVDyIE186ixI1Z2AYTYQ
 yYrhjL+vt3ybOzFX+0v//StkJUbnR7HcCqqGyYribyubbjYE+Fy/4dvUniUZg4sOjYCi
 xdDao1/8H7AptXdsLzv8McLDcu5WiaGO5geVO4Wp+CiQZzT1dMnN5tO0dL3Kb2rbim/G
 h1RA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bCM99P+J
Subject: [Buildroot] [PATCH v4 3/3] package/tailscale: bump to version 1.90.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v3 -> v4:
  - update tailscale to 1.90.6
---
 package/tailscale/tailscale.hash | 2 +-
 package/tailscale/tailscale.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tailscale/tailscale.hash b/package/tailscale/tailscale.hash
index e2d600f03e..978407fab2 100644
--- a/package/tailscale/tailscale.hash
+++ b/package/tailscale/tailscale.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4830cd822a838d5d44fd5eeebd07a2aacaf0255fb3fb7d3852d57659f54e51bc  tailscale-1.78.1-go2.tar.gz
+sha256  694a352a518fe487c9cde7b5892d11a5b98dcdf6ea5779af283412216c6bb25a  tailscale-1.90.6-go2.tar.gz
 sha256  d1ee1c7947d4b2c1963ea214d5324f1d4c89f2f1d0f0224889b4dfb868dad725  LICENSE
diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index 86039fd4b1..a4610e865a 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAILSCALE_VERSION = 1.78.1
+TAILSCALE_VERSION = 1.90.6
 TAILSCALE_SITE = $(call github,tailscale,tailscale,v$(TAILSCALE_VERSION))
 TAILSCALE_LICENSE = BSD-3-Clause
 TAILSCALE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
