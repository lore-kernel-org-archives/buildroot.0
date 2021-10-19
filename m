Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2379BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 17:27:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE6D361212
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 17:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE6D361212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94FF583C55;
	Tue, 19 Oct 2021 17:27:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ehh87f4p30J0; Tue, 19 Oct 2021 17:27:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9AE383C51;
	Tue, 19 Oct 2021 17:27:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C70E1BF9AC
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 17:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1894C60A49
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 17:27:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 77ySsRHG6_PY for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 17:27:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3610660AF2
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 17:27:03 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id o24so5814978wms.0
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 10:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8r+coA2n9SEwL0gWCyyid85GWMbAy2M4FceSTHZcVvE=;
 b=Yx3siYfSkpChZfQLPCX6rPTKl028wBCiKJih8N/eV81QL3hIOZtdBcbNjpDuWmqign
 jiZ7N1KLTKPsVqGYyDaCg615kk5qvjFFC3n2iwf9XseZeFiTPXf95lA8WzaEqcK+00G2
 H7CQZv0Z2ONu53DoeZxx4zp7eqNeVTNEvV6xgDSvr2Jj6xInvv930oviOS9XHq0cBw0g
 4S0evjNaf/XLs9g8nMC8mksUnDtPZPzV5WOmA8AlnAGLoELsZPZd4vdTjYTZP6HnAS+a
 l4woUXfMjxm7yr/sk3aB69+rU7yFQXc16MUioXeFE2NFO6UIB0NeZFfInUHWGuO4zs94
 wTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8r+coA2n9SEwL0gWCyyid85GWMbAy2M4FceSTHZcVvE=;
 b=v2TeqqPTgW/O0F9Jb7nF8sUKtJONPtncP1Tz9OUJsfWW3k+xtmp6Hy769bVyd4LFZW
 t9pNwZIvbS9H0/BDNQbxqJZPTbs5APnDZLlRdOke+DL8NrX2tN9BBdSEfsFQyVD9y9sl
 gqmz66C9n/p7TG+QZRdvnZ9H2YPit4A22tTZjRo0FHmad1/x+2/G5hOF7FTpVdrRHu+o
 vtmV9hIUvQycp1JC2hXarJ02/gY6bVlaaOi/6eAU7HLa+b+/YiB7rSQ6wfQ/DBnjbLF5
 MnxnbFdtU5fHY85rJL8KuQS8BRVMBIMJbgnY8ZApRKow2C3lmgbEez4qpj37RAKbJjI6
 km2A==
X-Gm-Message-State: AOAM530sWl9TcNr1u7Ec6vNKYyf4+5Hk2w/UlrOoWlphhiVOP3CLQXBK
 31Vp4/GDXATH+7iKZX4NM+cVWdvoOqs=
X-Google-Smtp-Source: ABdhPJwrU4eGCbSJgVs6XTWj+js6ndoRS7VAtmgNSXEtAR/mQz5e1GsKOMMggr7zJZkF9s8LCxtcRg==
X-Received: by 2002:a5d:47c3:: with SMTP id o3mr46783568wrc.25.1634664421224; 
 Tue, 19 Oct 2021 10:27:01 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id f184sm2749076wmf.22.2021.10.19.10.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 10:27:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Oct 2021 19:25:32 +0200
Message-Id: <20211019172532.3431240-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211019172532.3431240-1-fontaine.fabrice@gmail.com>
References: <20211019172532.3431240-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/samba4: drop third patch
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop third patch as it is not needed when using compile_et from heimdal
instead of compile_et from e2fprogs as spotted by upstream in:
https://bugzilla.samba.org/show_bug.cgi?id=13856#c20

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../samba4/0003-Fix-unistd.h-include.patch    | 38 -------------------
 ...t.c-include-stdint.h-before-cmoka.h.patch} |  0
 ...patch => 0004-dcesrv_core-fix-build.patch} |  0
 3 files changed, 38 deletions(-)
 delete mode 100644 package/samba4/0003-Fix-unistd.h-include.patch
 rename package/samba4/{0004-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch => 0003-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch} (100%)
 rename package/samba4/{0005-dcesrv_core-fix-build.patch => 0004-dcesrv_core-fix-build.patch} (100%)

diff --git a/package/samba4/0003-Fix-unistd.h-include.patch b/package/samba4/0003-Fix-unistd.h-include.patch
deleted file mode 100644
index f01b899a18..0000000000
--- a/package/samba4/0003-Fix-unistd.h-include.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 85c33f89df8607ace0707e1360ff0f79f3e8f5f3 Mon Sep 17 00:00:00 2001
-From: Andy Walsh <andy.walsh44+github@gmail.com>
-Date: Wed, 6 Nov 2019 19:28:30 +0100
-Subject: [PATCH] Fix unistd.h include
-
-Fixes build error
-
-source4/heimdal/lib/asn1/asn1_err.c:47:23: error: 'link' redeclared as different kind of symbol
- static struct et_list link = { 0, 0 };
-
-Downloaded from
-https://github.com/Andy2244/openwrt-extra/blob/samba-4.10/samba4/patches/006-samba-4-10-musl_rm_unistd_incl.patch
-
-Upstream bug report: https://bugzilla.samba.org/show_bug.cgi?id=13856
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- lib/replace/replace.h | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/lib/replace/replace.h b/lib/replace/replace.h
-index 1658465866e..e6768c4ae51 100644
---- a/lib/replace/replace.h
-+++ b/lib/replace/replace.h
-@@ -168,10 +168,6 @@
- #include <bsd/unistd.h>
- #endif
- 
--#ifdef HAVE_UNISTD_H
--#include <unistd.h>
--#endif
--
- #ifdef HAVE_STRING_H
- #include <string.h>
- #endif
--- 
-2.20.1
-
diff --git a/package/samba4/0004-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch b/package/samba4/0003-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch
similarity index 100%
rename from package/samba4/0004-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch
rename to package/samba4/0003-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch
diff --git a/package/samba4/0005-dcesrv_core-fix-build.patch b/package/samba4/0004-dcesrv_core-fix-build.patch
similarity index 100%
rename from package/samba4/0005-dcesrv_core-fix-build.patch
rename to package/samba4/0004-dcesrv_core-fix-build.patch
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
