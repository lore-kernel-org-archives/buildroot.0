Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88186C27C53
	for <buildroot@archiver.kernel.org>; Sun,  9 Jun 2024 10:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2AA881BD9;
	Sun,  9 Jun 2024 10:05:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vcK67xT8FHIu; Sun,  9 Jun 2024 10:05:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB8AA81BC0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB8AA81BC0;
	Sun,  9 Jun 2024 10:05:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1173A1BF3F0
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 10:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EED6740106
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 10:05:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lurR5plASQ6l for <buildroot@lists.busybox.net>;
 Sun,  9 Jun 2024 10:05:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7D097400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D097400D6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D097400D6
 for <buildroot@buildroot.org>; Sun,  9 Jun 2024 10:05:13 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-57a1fe63947so4360465a12.1
 for <buildroot@buildroot.org>; Sun, 09 Jun 2024 03:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717927512; x=1718532312;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0lKuTN30/bzkxmhQyq8dM+pFvacENo+A4ML5m4t1LFs=;
 b=wz5vOx6MFd1DQigAwgC2MhgEfRQDiVX0NzE9tKzpVcbh13TnZQpEAAoGBxzHZcCXX5
 4yFiZJwfUjh4p1W8NyGh1zP25yKsb9hHc45pGOqQ4XTYqK7aNmAU6/WylaVX6htldBRV
 1vCkbPtzKwfprqNUPeekIFwxrJkAlCg6MhcfmcXsBBDLYSJD/zhpWcJ/YTtWWE6IAsIm
 NQpH8jPVmK0h7q33703Gu+IofuDQKtKTq0D8p7Ra7VKyGwb+zZ/MM2bZ2PHpbcDaM3Bg
 UhGFtif+eDUngXIAKpTm/MAUFiVsSw1ujZwe+Mc387DmqXdrwfy/dR8lLwavaA1FWu8n
 9wMA==
X-Gm-Message-State: AOJu0YxXZrqvw/3Vu+TCwKmHJFs6zGcihs9N9VtjuyMOypnH47P4Lg0r
 X+yFzCv+Sx44oaelRYhiDQKHWORodwIugEFK2IrM8ZXMeVZbF1duIuCz0A==
X-Google-Smtp-Source: AGHT+IERA6L9+UtuP4sUwyfQ8BbseqVxhPQIsA+BoMXniuxfLB/wlQy70sdQ3obWsd1W8vARBwOrYQ==
X-Received: by 2002:a50:8a8c:0:b0:57c:6871:e04d with SMTP id
 4fb4d7f45d1cf-57c6871e15emr2420956a12.22.1717927511502; 
 Sun, 09 Jun 2024 03:05:11 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8070:2483:7e00::fde5])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57aae0db916sm5470545a12.35.2024.06.09.03.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jun 2024 03:05:11 -0700 (PDT)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jun 2024 10:04:25 +0000
Message-ID: <20240609100425.10701-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717927512; x=1718532312; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0lKuTN30/bzkxmhQyq8dM+pFvacENo+A4ML5m4t1LFs=;
 b=iTB3Ty1oUvaAY6D4OGZ134WhKHGkpyCmKwhlQDGUcD9u5ERojut5pID03LAm5QIoJd
 JznbOWcf0JQrMVIci+RnZvWkNxqL44fLdM5z9BLqLbxVWX0PEuDtRS+OeHNr+Dbg4TKy
 z2jAcqT3MmrRHmFxEBiF7P4d0XjcWqrKUvCxwwBSKVVAUxAcRQdOobLza8j12apiSjAh
 icLMpDsPKopDq0hC9iTZAfe9L8oIW29reWY0IfH22/yLF6ZEpAVl6kq+2eK7ykVMyU7n
 q+LvYwc24xwv7mvxcuhgtinWF7Zt38S21+sI2pgN6w2+FgI8xGI+b+ayqkoAooRYWAfN
 oUdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iTB3Ty1o
Subject: [Buildroot] [PATCH v1 1/1] package/shadow: bump to version 4.15.1
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/shadow/shadow.hash | 4 ++--
 package/shadow/shadow.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/shadow/shadow.hash b/package/shadow/shadow.hash
index 23c292d659..1d83272cec 100644
--- a/package/shadow/shadow.hash
+++ b/package/shadow/shadow.hash
@@ -1,4 +1,4 @@
 # Verified from https://github.com/shadow-maint/shadow/releases/download/4.14.5/shadow-4.14.5.tar.xz.asc
-# with key A9348594CE31283A826FBDD8D57633D441E25BB5
-sha256  cba74bc7b05d89c015afe23131f9159ece38779d40a8af4cf162852e6e85ca23  shadow-4.14.5.tar.xz
+# with key 66D0387DB85D320F8408166DB175CFA98F192AF2
+sha256  bb5f70639a0581f9d626f227ce45b31ac137daa7c451c0f672ce14f2731a96ee  shadow-4.15.1.tar.xz
 sha256  3d25ab8f43fdc14624296a56ff8dc3e72e499ad35f32ae0c803f4959cfe17c0a  COPYING
diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index e4d8b67b8a..59771b9182 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHADOW_VERSION = 4.14.5
+SHADOW_VERSION = 4.15.1
 SHADOW_SITE = https://github.com/shadow-maint/shadow/releases/download/$(SHADOW_VERSION)
 SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
 SHADOW_LICENSE = BSD-3-Clause
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
