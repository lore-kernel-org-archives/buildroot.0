Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30FECD4851
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 09:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D4B680BED;
	Thu, 14 May 2026 09:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VQvKJqqsQgKW; Thu, 14 May 2026 09:37:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B892809D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778751460;
	bh=BoLCNs6mKZ0OzjKAcnmCxF0TTDZ4LfMOdTli0JvdD4Y=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Pngkg4Siwk2x7Bgua5Lduj6hyb8cL2QYMWWPoCLDlgxvI77LtL+ivmSXpuI7/cFg5
	 x03wSu/TT/Yy8BX4ULXOO2GZcZ1+iwo3Aa6fDP7Ej4scfxVIbeOuaWydFUiomKHuEv
	 ZLBz0xGP22p5wLQDVfKi0Tubw5oODn1jALciyCOBt5eVnBjYgo5RWEYPZ7xbBRhwAt
	 tA88Di9V2E8BHo1RnSbiAn9B7LNiNCbeVOlC5eiBHKpb5E9Wv37pFz/rGW9EWaUDlh
	 2K9vJgCfwLrpHGLbzCWcN/4OIPK5AXCKdVdkxmkdp0WJe8L6fxkUKu90X60RN6HlYs
	 IAbW0//kFHqmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B892809D3;
	Thu, 14 May 2026 09:37:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9538B36F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 09:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B2A460E39
 for <buildroot@buildroot.org>; Thu, 14 May 2026 09:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HDMK2YNeHz_z for <buildroot@buildroot.org>;
 Thu, 14 May 2026 09:37:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 55D8C60E33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55D8C60E33
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55D8C60E33
 for <buildroot@buildroot.org>; Thu, 14 May 2026 09:37:37 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4896c22fcbaso67120485e9.0
 for <buildroot@buildroot.org>; Thu, 14 May 2026 02:37:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778751455; x=1779356255;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7acUs4saXXxEFJb0ea4UDZpMqJOuMKHJd5RWA7O5afs=;
 b=WnUz9t2R+1gOm5u94FVzqZg9C05pQwmtwCQt2Ubjse6T8UOlagEK0Sj9fX3ji+vi91
 DpA2vmxDsRNCx1NPAH4gMfDGjxY2TJqtwq0lFhQFhYUr9EkQ5tD6GlTUUtMgl0PxmA6Z
 qURM4Hr84+/TFeGiRn4Qeyuc/hHOAWa0BtwWotaVZ8lGe9bKhPJwE328WIIWveu6hgcb
 vhLu0m/n1hGqs8ttYXJmVwIViMXrr2kkWNob3olCt78GB8Uy6dAjjW2tQ7mXbvGTjOsO
 NB+vNzZVW0zlkFXtMVA6uUzuGgDeLgIRnjAEzHbHoSePnPq9KAOLGkTSGGhTYQ9SACnn
 AQMA==
X-Gm-Message-State: AOJu0YzsZKVrX9OzAZ4X7A6KqpqskSutXPbTFezi+5DIna2NKGpgOtlU
 3+k/p88UVEA4V3dLzfGud1AOpVgVYFiSDXSW1rRAlmXC7j1L7lgPS0Tm3yUe2YWph64a42hpXw9
 dozoN
X-Gm-Gg: Acq92OH143xwrjYcacEZz78ENnyDcjhUC+d844lzxVN7fXzL8d7aQbdFFbH3mbxvzVm
 pQsDQmysnh5XVDTfMiQ9hSmSlMwfZ+sNT1M0v7pjULjaR3wQq1PVasRsH1d0olJ5eE0Cp9Jspkj
 aEKs20YD9g8cuaKmNNdAcEJm4uJOJlZnbVeP1GV3FmIJ3aYMsK0nJa+XIGGgRm473LjUNy/sHQ1
 VEKJzzPvZyX2o6ssPaxnLpGTgXxmK1jqsEerCsDERc7Z3WWPJdrEYAkmPNSihD/bAUxI+2NZ3hE
 P3lp5zGpIUmMqZApK8YSdJO8dVyvbsDIh5NibVPHhjYk2NC4hU/xpZXtcO6D5GJSIizkJq2d2qx
 6Rry2sAsjTKprhoAMnrswcDoFwchY8/u4P0AAkiDKrM0tQFNLnhbqkOTSPYk5pRMBJ8Ee1avhFP
 8+8B32YEIkRyIB83opqJOwksAhiABMFsQqaqqFw13LMO/KU80MbDQzY2cKm4fT+T51lYiptv9TB
 SfL2OTc6BHFvlNvvC6LbvdfYSOHmblcL6nW2vBON2dwT3WP
X-Received: by 2002:a05:600c:4743:b0:48a:93d2:60d2 with SMTP id
 5b1f17b1804b1-48fc99a2ca3mr105866135e9.0.1778751455095; 
 Thu, 14 May 2026 02:37:35 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.40.246])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fdc6f0ab7sm30443045e9.15.2026.05.14.02.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2026 02:37:34 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 14 May 2026 11:37:31 +0200
Message-ID: <20260514093731.1726256-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1778751455; x=1779356255;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7acUs4saXXxEFJb0ea4UDZpMqJOuMKHJd5RWA7O5afs=;
 b=T/KZA8ms56HIwr62jZdDx30j+H+vUKpmQ90z3GnuwdcbKVOJZzW2Tmp5APInOIOwgS
 XMvaAy6ZBo7sRrnglaGtZUQeb4Hif/oOo6LEL0m5XOsirgDvVE0wFrGt8T1tDtlGItKT
 F4C2i7l5In8afgKhKxkZZANpWS+5Tuh/0Aw4I=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=T/KZA8ms
Subject: [Buildroot] [PATCH 1/1] package/babeld: fix linking error with musl
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

Building with musl on some architectures (e.g. loongarch64) fails with:
  ld: read-only segment has dynamic relocations

This happens because the default '-ztext' linker flag conflicts with
musl's dynamic relocations. Fix it by filtering out '-ztext' from
TARGET_LDFLAGS when using a musl toolchain.

Fixes:
https://autobuild.buildroot.org/results/c75643713fd5f27fe063c226630680d26a8b9487/

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/babeld/babeld.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/babeld/babeld.mk b/package/babeld/babeld.mk
index e9d20111f93d..e7c02e334b56 100644
--- a/package/babeld/babeld.mk
+++ b/package/babeld/babeld.mk
@@ -9,8 +9,15 @@ BABELD_SITE = https://www.irif.fr/~jch/software/files
 BABELD_LICENSE = MIT
 BABELD_LICENSE_FILES = LICENCE
 
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+BABELD_LDFLAGS = $(filter-out -ztext,$(TARGET_LDFLAGS))
+else
+BABELD_LDFLAGS = $(TARGET_LDFLAGS)
+endif
+
 define BABELD_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		LDFLAGS="$(BABELD_LDFLAGS)"
 endef
 
 define BABELD_INSTALL_TARGET_CMDS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
