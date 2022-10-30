Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8493ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 21:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5114080F97;
	Sun, 30 Oct 2022 21:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5114080F97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5OVSuUxjmooX; Sun, 30 Oct 2022 21:51:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75188812AC;
	Sun, 30 Oct 2022 21:51:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75188812AC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C08011BF315
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8C5860803
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8C5860803
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q7022YkZYW5P for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 21:51:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CA44605A2
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CA44605A2
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 21:51:01 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 b20-20020a05600c4e1400b003cc28585e2fso7039126wmq.1
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 14:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+MCZ5n9jmvMBl9V3ofMCwOGrXN1AtLkH3sAwU7haib0=;
 b=rBoFmA//Ts5fhr/uUZWqtZ+zllBkFqZ1EXBjl6hSsBtVc/E1PjnGt3IR5F6LuBDhKM
 ow5sg5gf2uBG6QMLu3vmCpuHjeYRYraxoajaShSRRd8qPRuXBxehV6xgECZs2375jDp/
 o4YA4E4ocb11gimcGAYZLyGGQ5FEyX4IxAfE/P1K63Cqz878GSo9Q4igi2gHHesJ1QTi
 ol3b0b13YEYvAbyeDOf/RgafxL/rPlrTj7IpTnRMV9Cbk+B2g02C+qVb83QfmD6h4DKR
 eBg4iionsJ7C6S0sMpFE74rJpytFhc1kUEO+g3QcnpadA4N32B2iml8/kNkNTkkGDz3c
 yFVQ==
X-Gm-Message-State: ACrzQf1ZlA/cdqC5b8VQLfZmKYSkgJnfv9Z/cwoLAwZG5Tcq8ZjAogfH
 ENwV2BqTyHgm+gOdsnEVgwd+GCNXxio=
X-Google-Smtp-Source: AMsMyM5IZPHHqpOR28fznhb19xzZFoOb59gGUYW70KZ+Npph4Q/Zq1jU1+icQ74EjVvidwnztu/s0w==
X-Received: by 2002:a05:600c:468a:b0:3c6:f1ae:3e95 with SMTP id
 p10-20020a05600c468a00b003c6f1ae3e95mr6058585wmo.152.1667166659287; 
 Sun, 30 Oct 2022 14:50:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 v23-20020a05600c215700b003c5571c27a1sm5772003wml.32.2022.10.30.14.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 14:50:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 22:50:45 +0100
Message-Id: <20221030215046.461380-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+MCZ5n9jmvMBl9V3ofMCwOGrXN1AtLkH3sAwU7haib0=;
 b=mgJFyXCBpnK27jDiAOeXPhehpdPaIVuHFtCi741vQqwo3xoX6IzuFCofLMd/7MbByE
 B+ZsibDC5S3UyP3g2dUfseaHhiHOf0DPPCQdOigniVrjG3z0YwiTE09bP0NsxYtBrfV2
 mmm/s5BxA+CuwlEQAaKSPYQH7Ok47wYeQcLiBrpfx8rWObAJiP1ruuqK6Hi2nL4DF1Aq
 VAxg8YbvTEb3iOODb6mCMNskZ1WJ+iYZZjXdzOh5jwZMroWOjbEMgkrXH/upqgePuQW+
 PY2NX2tUf4W/TU8QR0EPQqJhelfBw2yfJlySGu3QqiDWS6t6HYaaT/D5CiC63gP6GIjB
 bIsA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mgJFyXCB
Subject: [Buildroot] [PATCH 1/2] package/exfatprogs: drop host-pkgconf
 dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-pkgconf is not a dependency since bump to version 1.0.3 in commit
fbad745139125ea0995a436fd81ce7ea233638c0 and
https://github.com/exfatprogs/exfatprogs/commit/843124cd9a2087281e00bd1b9d710db59acfbced

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/exfatprogs/exfatprogs.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/exfatprogs/exfatprogs.mk b/package/exfatprogs/exfatprogs.mk
index 2911d21f4f..44679c7d60 100644
--- a/package/exfatprogs/exfatprogs.mk
+++ b/package/exfatprogs/exfatprogs.mk
@@ -9,8 +9,6 @@ EXFATPROGS_SOURCE = exfatprogs-$(EXFATPROGS_VERSION).tar.xz
 EXFATPROGS_SITE = https://github.com/exfatprogs/exfatprogs/releases/download/$(EXFATPROGS_VERSION)
 EXFATPROGS_LICENSE = GPL-2.0+
 EXFATPROGS_LICENSE_FILES = COPYING
-EXFATPROGS_DEPENDENCIES = host-pkgconf
-HOST_EXFATPROGS_DEPENDENCIES = host-pkgconf
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
