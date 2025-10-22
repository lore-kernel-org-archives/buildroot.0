Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE03CCD1BB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 044E261240;
	Wed, 22 Oct 2025 16:38:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9nVfmOFLrUCm; Wed, 22 Oct 2025 16:38:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38E7E61244
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38E7E61244;
	Wed, 22 Oct 2025 16:38:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D84CDDE
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA2EB40BB8
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lVpuIkeTKfHL for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:38:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B8B214048F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8B214048F
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B8B214048F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:38:36 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-63bdfd73e6eso2225499a12.0
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 09:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761151115; x=1761755915;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k7fkWDMJIUFE8naie3Bkzg8J73UWkb2BQMz/oOyanXU=;
 b=ddsiwkami+EuK8k+o3lStwSwfZGWPzZ+KNmfUfwqImHdWEWIyrvdePX3h1y3ovBWAE
 g5SEEczjFxurbA74u7IoTD0hyHXVParoxp8b88iFu9yQQr3GcNdEp+MmucwArYBuXfRn
 RRtChL4Pnq0/YWmKRXEPankFurI3PdH2Ixje/nn5RVRXKFT1BehUzhJIZgSE/xkyJlPd
 A1vysFoz3XyJdDb/00v+9I+0jpSSfCcxBjgDnI7+KfSB/4Dt8Er33J6D/R9svkkpKRME
 JWoEB9q0gDc5YfH9HYYiwzfzpPM540GBlIsQ78Jwefzw6vB3TN+GyxL+0IP9NlEZIS4/
 rdmQ==
X-Gm-Message-State: AOJu0YwHovr/zSm3KAlSlH7j6z1GrQO/9j05NVR2SN/8jzR2Idt6zutS
 sG8klxmJAFAyJq7EaWyB4R5gtkRgmXYO5ihBdkNgbVY8afGO/rJHLALts7gjdjn7TXG0x/Ga+gu
 Q/r1a
X-Gm-Gg: ASbGncuAmkwvKrL53Z0RgwWtgGqLNZps78bT/B3AO1x8ihhS60sja50ITRhotRAMxvz
 KNt85/vZE2Gt0ymogX3tuiAewTGgNQBUcr8jw13wtJw3/1+tGQ+bN0Mcu25+dP3kuYZavnFVLZm
 Huez4PRJjZscZn9Cq1tAwy5fgmAeJtI+1uwSzapLcL6gShOHdUY8d9b4lKRHwvU8wUcJcgr7tAH
 KMt3Xtg7C3xDL9TSEX5scVF9VpGfBXid9y93aJ4Yc5y5EBIeF7UnfKcixcrBRn+oWI2Pov/0OV+
 pwXQoD7fKO3y9twr2ipmHJdgoDXUjUXxTjS5pLeE27hlQLY/rhlJ3XCW9No1XYfLqOQ3GRcAfP3
 cf7rizDQyMjwbdcoV6WVAFEnqvCqWCJqFUo6MvNi3C4jPeNlKDKg73PC6y+KJaZvJOj1NMuDGPu
 qVJAIGFS82DJ+VPCCZCJs69Wb4tGw3R0Y73UmsLA==
X-Google-Smtp-Source: AGHT+IH/VnFvp9Wt/l5isei4iXiIumJtEJIAvwYdgd3eS70EPUX1FNWBrys4QCn3FDiCJjBYNvzFkQ==
X-Received: by 2002:aa7:d75a:0:b0:63c:2cce:5476 with SMTP id
 4fb4d7f45d1cf-63e27124257mr1529885a12.13.1761151114697; 
 Wed, 22 Oct 2025 09:38:34 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.39])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c48a8e4easm12064953a12.5.2025.10.22.09.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 09:38:34 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 22 Oct 2025 18:38:31 +0200
Message-ID: <20251022163831.20816-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1761151115; x=1761755915;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k7fkWDMJIUFE8naie3Bkzg8J73UWkb2BQMz/oOyanXU=;
 b=qaN4jaq65khIh5P7k0X/AOy8Al0C7PpkAOD0NPZfn0GtyLAAYTU+p/OBtoQVEvldnq
 hb93Xbt/9Rtza+LD/xYtyvbGRF+ORa+9zYPjxr7WqN0MrLIlNXRarXKVhLxeySm+b5jv
 AtPneMmKCrKkUQ5Ksx3jdOgF2x8Ti8HkLs3+s=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=qaN4jaq6
Subject: [Buildroot] [PATCH 1/1] package/libexif: bump to version 0.6.25
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

Release notes:
https://github.com/libexif/libexif/releases/tag/v0.6.25

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libexif/libexif.hash | 2 +-
 package/libexif/libexif.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libexif/libexif.hash b/package/libexif/libexif.hash
index 0d082aedb0f0..9e95e27f3ea7 100644
--- a/package/libexif/libexif.hash
+++ b/package/libexif/libexif.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d47564c433b733d83b6704c70477e0a4067811d184ec565258ac563d8223f6ae  libexif-0.6.24.tar.bz2
+sha256  7c9eba99aed3e6594d8c3e85861f1c6aaf450c218621528bc989d3b3e7a26307  libexif-0.6.25.tar.bz2
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
index 858901f40eba..0e50d78fbed3 100644
--- a/package/libexif/libexif.mk
+++ b/package/libexif/libexif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEXIF_VERSION = 0.6.24
+LIBEXIF_VERSION = 0.6.25
 LIBEXIF_SOURCE = libexif-$(LIBEXIF_VERSION).tar.bz2
 LIBEXIF_SITE = \
 	https://github.com/libexif/libexif/releases/download/v$(LIBEXIF_VERSION)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
