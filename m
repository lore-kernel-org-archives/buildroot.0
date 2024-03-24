Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6995DC47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 21:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3862481396;
	Sun, 24 Mar 2024 21:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KTspE7bgbrjY; Sun, 24 Mar 2024 21:24:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45FB781400
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45FB781400;
	Sun, 24 Mar 2024 21:24:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A2FBB1BF4E5
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 21:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F046400CE
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 21:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M87cMCjnzkUr for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 21:24:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 778CB400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 778CB400BA
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 778CB400BA
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 21:24:50 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6e6afb754fcso3304928b3a.3
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711315489; x=1711920289;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=InQ43eJft2LlRRht8LvtxFakX2nlxri2QQzMEoK5pqc=;
 b=CbZbU5io1Ca1/4w4XOs0/6JN8Gs03lOGV+vxJwrjMdHdvr4CXbNJosYSXHisXeejsm
 /YFBejVnwdW33TdIv88ISK5oCBwc5L29fLwwKyjD50qmjJc6ktTwc7oWbGgKvg2biJeH
 5u+r1EoXXUuqLhd/2LxmRX0jPvcmfzwSlrmX/qu3hDvTX6vaWikorGRZaizi9aZk0Tf0
 V927F1rvfLK0pykhrKNpakP5w8Vtqcs7WMqJfNIpeQp3CXhZt9kwXIgEWueSl1PrSqPb
 nH6Yfr090+toEaP3N1olbvYDWZZ0iU9fi5MD1qItT9UVUPJHhXwyL81yAJY1QvhGgP6u
 YqtA==
X-Gm-Message-State: AOJu0YwyEVwRjv9QeMPfdaP/XkyrBQrRvVW2Dddy9LHuXksB35MRvOaZ
 tpwSQ8utY/nz2Bh3ueO7Iz0aVJAg0LucMDKsXGGdvTMoEKdHvXcieKoA5gU6z613s7lspqeau+d
 J
X-Google-Smtp-Source: AGHT+IEkWKnNCWBxNgdV41gV12aeaTcIoJKJb4kjH0lVL/1ZmEUshacIcympq0eCZRa0+JCQ9FQh1w==
X-Received: by 2002:a05:6a20:7484:b0:1a3:c8be:c035 with SMTP id
 p4-20020a056a20748400b001a3c8bec035mr1913017pzd.53.1711315489235; 
 Sun, 24 Mar 2024 14:24:49 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a17090a658700b0029c3bac0aa8sm8979556pjj.4.2024.03.24.14.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 14:24:48 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 15:24:32 -0600
Message-ID: <20240324212441.526544-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711315489; x=1711920289;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=InQ43eJft2LlRRht8LvtxFakX2nlxri2QQzMEoK5pqc=;
 b=EN+Nd9I/UXGB5lD1RcHhv1pqkCzQ9hdJbnrP7fQlHL3eBzd9BsBjzm9VCHo4ji06p+
 SfOBcWSN4o15cF151389uXJoLLufvZy98N/PbS+4yCX/wlZrgUaGASnyPQ7aY0kwVboI
 1oSuOXyPTOOLUGBP/4+5pSCnQaHUROHU6+DFQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=EN+Nd9I/
Subject: [Buildroot] [PATCH v2 1/9] package/libsepol: bump to version 3.6
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/libsepol/libsepol.hash | 2 +-
 package/libsepol/libsepol.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsepol/libsepol.hash b/package/libsepol/libsepol.hash
index c243aaae2b..1369d820e1 100644
--- a/package/libsepol/libsepol.hash
+++ b/package/libsepol/libsepol.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  78fdaf69924db780bac78546e43d9c44074bad798c2c415d0b9bb96d065ee8a2  libsepol-3.5.tar.gz
+sha256  c9dc585ea94903d784d597c861cd5dce6459168f95e22b31a0eab1cdd800975a  libsepol-3.6.tar.gz
 
 # Hash for license file
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  LICENSE
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index f7782542ec..6361cc66bc 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSEPOL_VERSION = 3.5
+LIBSEPOL_VERSION = 3.6
 LIBSEPOL_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSEPOL_VERSION)
 LIBSEPOL_LICENSE = LGPL-2.1+
 LIBSEPOL_LICENSE_FILES = LICENSE
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
