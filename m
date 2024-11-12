Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4202D42BBA
	for <buildroot@archiver.kernel.org>; Tue, 12 Nov 2024 18:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DDD4607A1;
	Tue, 12 Nov 2024 18:14:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e48Y2zKZzgpL; Tue, 12 Nov 2024 18:14:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1C02607B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1C02607B5;
	Tue, 12 Nov 2024 18:14:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A8F5E0D
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 18:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 541FA40576
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 18:14:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7DW0RHXktVtw for <buildroot@buildroot.org>;
 Tue, 12 Nov 2024 18:14:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 655E4400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 655E4400C1
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 655E4400C1
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 18:14:01 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aa1e51ce601so147690766b.3
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 10:14:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731435239; x=1732040039;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xdFfYOWkXMT38d64VEZAsdyEnkyICkUCY70hXeXU4NM=;
 b=WVJgZKJGn7CBLiwY/dok8mC82ZtOqo9OTVH2R0aVbVzqP/zcqqcaPPi0jngQJ+VHmv
 hp5kc4LZG69BZqxC3H5sXp21ssQk8i9l7YHg8c7zYGeT1KMxkpqWONBUeMVY17vr3wth
 yq9cMPWeHkxmWB/5zyCpFX0EihCBd5XDQ0681NfTGmXehSfcQCRzxLO73mzi3STpwffj
 mYlxS4FHjnDDUoDWG/AwguA2Urn2VXeT/UH8NCSzItBudETCSY0skcxVa8gWeMMaohwx
 U/euR8DOqXGVO++LnpBtqC6DlN2zwRxUtYU67JSqcXzuhJRn9Ih0EFDXMbQs7RRehlUc
 y5ug==
X-Gm-Message-State: AOJu0YxPwZr163ANsZdAp9fRvyW9n9bxbBPzGDG40QD7Zq5ytfoG47fX
 M9lriwpiBrepZTog7ew9WWpIWd0HUdvZssYRaSgg2YTSzW5UeE2due7NG0Ig+fwxTNBzoyo4jvE
 b
X-Google-Smtp-Source: AGHT+IFaBnDPNU3LX27BkWD3eXCfUj8i9nRTcKaeCWvSKat3SWYETMp+wvWOyuq+yV5+upemiGYERQ==
X-Received: by 2002:a17:907:9411:b0:a99:35eb:1301 with SMTP id
 a640c23a62f3a-a9eefeecb8bmr1755884666b.18.1731435239202; 
 Tue, 12 Nov 2024 10:13:59 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.110])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a18b02sm760836366b.22.2024.11.12.10.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 10:13:58 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Tue, 12 Nov 2024 19:13:50 +0100
Message-ID: <20241112181350.2559743-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1731435239; x=1732040039;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xdFfYOWkXMT38d64VEZAsdyEnkyICkUCY70hXeXU4NM=;
 b=MjDGfCh/S2dQ5lYP+YKk8xEGdmknqsUyt8Gex7xoJ9FIKrIWIHQmI9NeNn9yviaA3L
 lWzyXxXfMmypn16UXuvjiv9w2hsO8N2Og6xL1OSWaL2+Zbi6V0qccWP+lvwHcPXvllge
 FbyZB7b8qwFoiWZRKqbyhzMiXKAQl2Jzqi8/E=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=MjDGfCh/
Subject: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.191
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

Add python binding

Release notes:
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.191

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index 9dc286c41ffc..8460481e0ff0 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  723d3da358e6af974a056e3adbcb105fac9dad4b87544de0d22b8c974a8037aa  uuu_source-uuu_1.5.182.tar.gz
+sha256  28792a9776d1ee73f6f20f7c49a7b81dcab10311733c5becac8928145fc86170  uuu_source-uuu_1.5.191.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index e57828a0ca6e..8faadc0201a1 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.182
+UUU_VERSION = 1.5.191
 UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/nxp-imx/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
