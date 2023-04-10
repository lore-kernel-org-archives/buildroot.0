Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81124C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 09:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 086F16FE86;
	Mon, 10 Apr 2023 09:00:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 086F16FE86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ya8Ts2f93JGn; Mon, 10 Apr 2023 09:00:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 449336FE83;
	Mon, 10 Apr 2023 09:00:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 449336FE83
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E2A61C3B18
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 09:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 774F081F2D
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 09:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 774F081F2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XhnC6W6_j_L5 for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 09:00:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C437181F2C
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C437181F2C
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 09:00:38 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id a23so6132753lfk.4
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 02:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681117236; x=1683709236;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jBwviUyle55vdDkfuwEAy/MufEv0xlkem/WkmxyqqEM=;
 b=6XDytrgqiFDxer609euD28vkOS0P+GUrXieBrIJlLmMU3aS5rUUkpAEm14Z0BT72SF
 WMp4UF+dsrfSY/MrHGXijz8K/Hx3TEVAFgzWjSZId7e+dT+pSBBzD78rSq/+2wpctwRP
 fc4LB/2sWW/aLY7XlzpgMiu5/x/0tWKGtamJk7P9T2V+qLmRMrMzKXUgPe3aD9p4Dtjh
 beCtC9pkfB8wQVZT1TPHQZNyuO4WieOkUdGvwWZKferNaxNHLzHNWBfFREYToe1V6WgR
 VAH2ogbOZ/BTLjYYuveJYdp0gRe9S2zFRf5VaAxVYMhkvmg04ZBnZjwwKYLzcM0vkve7
 lYng==
X-Gm-Message-State: AAQBX9cYeaHrrJLwx/WSWSRyZAto5s/blphhhAIRAIX+dVtXz3NduNq6
 MbHKP/bjbsqBJegsQbSVPJ2L6oHrQkU=
X-Google-Smtp-Source: AKy350YSDpTIYkAEVXR3C5CbzpPOnEP2Rjap0WiHGiDO6il4j0L6C74MtsnvFSmKtGtgyk+9sxiwAg==
X-Received: by 2002:ac2:53b3:0:b0:4dc:65c0:c74e with SMTP id
 j19-20020ac253b3000000b004dc65c0c74emr2680594lfh.29.1681117235799; 
 Mon, 10 Apr 2023 02:00:35 -0700 (PDT)
Received: from luthien.. ([98.128.186.112]) by smtp.gmail.com with ESMTPSA id
 b9-20020ac25e89000000b004e849f6836csm1996766lfq.167.2023.04.10.02.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 02:00:35 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 11:00:26 +0200
Message-Id: <20230410090027.1926404-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681117236; x=1683709236;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jBwviUyle55vdDkfuwEAy/MufEv0xlkem/WkmxyqqEM=;
 b=El5Tm0hyD3PLz+eDulKeTJFgAwGOEV+UdAe1RGSQng+gbz09EJlGQeIREU6UOvwAlR
 OUD1bDkHNYvgMAedaVh4ExTe6fmhr1BcUPRl/jmBp1+ztbSzwMwitWy1gk6GQFYVIlR6
 rdNhltbe0pDiBZLtdd6Mkrwx5yDm1x+8pnwttkajotEHGYfgldN3wWPQePYg90LwrHCe
 MCwDUrijXte5oc/+HQj4EOVZoJJNK10YJJiBR4fn3DH8lhgbEm47kR30KJnw7rMYRhQf
 6mP+GFSGxIRMRhlF+wNeo+P3jxUBXSGv50m5ESxj+cLq9PzrmdeofT7t542hR9gkn/S9
 xMMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=El5Tm0hy
Subject: [Buildroot] [PATCH 1/1] package/mg: bump to v3.6
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Excerpt of https://github.com/troglobit/mg/releases/tag/v3.6:

 - Sync with mg upstream, OpenBSD 7.2, as of April 10 2023
   - Drop trailing whitespace on RET (c-mode)
   - Add zap-to-char and zap-up-to-char, binding the former to M-z
   - Fix dobeep_msgs() usage, does not support format strings, this may
     have caused unexpected crashes for some operations, e.g. goto line
     that does not exist
   - Fix memleaks and possible crashes in ctags support
   - Fall back to /bin/sh if $SHELL is undefined
 - Fix typos and duplicate undo in *quick* help buffer
 - Add support for exuberant/universal Ctags tags file format
 - Add support for M-, to pop-tag-mark, like GNU Emacs

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/mg/mg.hash | 4 ++--
 package/mg/mg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mg/mg.hash b/package/mg/mg.hash
index 19cf1e29d5..e8eedb8921 100644
--- a/package/mg/mg.hash
+++ b/package/mg/mg.hash
@@ -1,4 +1,4 @@
-# From https://github.com/troglobit/mg/releases/tag/v3.5
-sha256  a906eab9370c0f24a5fa25923561ad933b74ad339d0b2851d2067badf0d7e4ce  mg-3.5.tar.gz
+# From https://github.com/troglobit/mg/releases/tag/v3.6
+sha256  0e30f99b7606ddd92535aec0ba0118557afa4adca0961267314a4bf7791865fb  mg-3.6.tar.gz
 # Locally computed:
 sha256  7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c  UNLICENSE
diff --git a/package/mg/mg.mk b/package/mg/mg.mk
index bb3f59a14d..88f8f60257 100644
--- a/package/mg/mg.mk
+++ b/package/mg/mg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MG_VERSION = 3.5
+MG_VERSION = 3.6
 MG_SITE = https://github.com/troglobit/mg/releases/download/v$(MG_VERSION)
 MG_LICENSE = Public Domain
 MG_LICENSE_FILES = UNLICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
