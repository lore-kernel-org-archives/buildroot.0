Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49DDCDE001
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 15:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 674186101C;
	Thu, 25 Jun 2026 15:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bvTszHY8RAch; Thu, 25 Jun 2026 15:00:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8500A6101D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782399622;
	bh=vTUUSgjoqqlLQdYwBMtRN/xzajDrA8b1mwVmAy6DPLk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OFGkDnr66emOzrCxQGRG3+nGbuZwFmHpqJYUsebSuDT2lQ8CxBk8TKO+CiJ3HK2NO
	 n2Sin3PU+OE8NQKfck/0ARqOVpBoXvD8ibKkMgqAf4eGa1rEc6mnEgzazOmVoVRdNu
	 ItejAuJG93KbS/jS2tqmYN46wI30JvwWbiz4vEnf0+rKbT2LGIxqA0pAMXReU4ixLG
	 3ffTCAZ0dZf0O+3MZf5g7Z7w2Cz+hCDd/cR+Wd63YcgQllkDIDTb8IWdwMLqnGTllM
	 dVtpIoCY4XBkbdwiv5a28bqgLIibaHdyYl0zFXyyVTRan8n5Z/PdwAi6nDseRiXP+d
	 DLOKSMCrJDjqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8500A6101D;
	Thu, 25 Jun 2026 15:00:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE75D2C7
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFE676101D
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rpmn4Ybpic_Q for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 15:00:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8795D6101C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8795D6101C
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8795D6101C
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:00:19 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c0115a3794bso643330566b.0
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 08:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782399618; x=1783004418;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EBZtp12t8u6eY44sdTF5osPopsMChTRopI6Nudg8KjY=;
 b=sucbYCrMaKRzgW3r7HjQlSmDv0skCNp13MzOK8E4yFffDTHUBMMZgETzQslvR09sjb
 Lpu+iwtG83okUV21mURO1BsZoqP2pineMooO23G9dV4mp2nTVyirc+KcbUhcOSEF2NCp
 EluMvTOat8BM60hmRMz9iltgIwh4bJ0m9iWbAjBuiWVN1l7hDiWC2qP8cBLOuRCw2fxI
 qdS2oBH09HilJy36pfyIUGpTmWAthsXm/PXemAeomUt1q/WdvUKu4J6FECVGvfj/BlEt
 IgmWqRMl/Hq6ZVWRxmU3S4LgJxHsvcc9SuFe3/BY5MfFX5Gq/TOFTS9UBqkvSUZgcX1j
 uH8A==
X-Gm-Message-State: AOJu0YyrUoP0oNpYR1rwQSMJ5WsXkeEsdHpOJ0BSjy2PZHIjUP3KCO1b
 fWnSu6IzwCv0EZnke57rlB2HFb55TeDLLKbv1aNmjbt1nt76DQhUrIAlqrLeIpnYWPEKxY9ERlH
 cJgl/es4=
X-Gm-Gg: AfdE7clQ3E4DykWr55plxSzojHLwVsKqMzknKG+18aBVMaojoEiNFQXR3ZBAwy6HaCW
 lTOgkg6lXydT+yu9SRLKGva3GR6VTwKwBTJIOcCrHXPH8TRYN+X2SE4ndr05Tg49Xfo7rI+3J6T
 OnMSUXbMeYqedhD7Y8iPBM5swIn7BVV60Y/vp8O34gf2LioWsAI5KBcb9ZTLz5k8izeiBeFvaRt
 Fheiq6n86dtr4V73unia8PGNiRE1AC3nBG9BnQ+yV3uZticCOJmitgWEztGBnwkrO2r51lianZ/
 /F3MsgUZIxDvs4B48SX0vQTgkMNtxmz6cdKsO09jnWbQ0LoN7Dby5FMoFRgXExcZ8/i2v03A2TY
 oH6qO/13fgrSvJ6cZyLDZVJx/c3hEaAkoeuQLffDnbav6EJ+YXeD+MONexqeNDKX/1XT84EJf1C
 fkOZwECiMXYDB+7wXSXsGLU6UTh/8OxBoBEfXqUmSOiY/I0vQ9e50ZZZka79rtYXgqZZ34zorNx
 OsHtbChJXfEMLcUfiLDUNBZy4aT+1m7oOnOhohfHuaQB+U=
X-Received: by 2002:a17:907:6d25:b0:c0d:32c8:6f23 with SMTP id
 a640c23a62f3a-c1205ec8f52mr209337866b.37.1782399617220; 
 Thu, 25 Jun 2026 08:00:17 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.20])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c11fbbe9f9asm211974166b.26.2026.06.25.08.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2026 08:00:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Thu, 25 Jun 2026 17:00:12 +0200
Message-ID: <20260625150012.1505793-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1782399618; x=1783004418;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EBZtp12t8u6eY44sdTF5osPopsMChTRopI6Nudg8KjY=;
 b=RMYH2E7zZfzkiO1K3GPJdtBgaDPmUE7ZyYGseuOO9LFyMjyatrdTlzFiLkVQ0/RI08
 PfD0Jdveep0AkJ2E/0A9aXI3SS/6qqHjP3egM3FZMlu2mM2GPQzROckh7aCaJuTYrJFH
 CWQg8c6uFwYh20sXbrbFSofbZbWwXkXkDgRw4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=RMYH2E7z
Subject: [Buildroot] [PATCH 1/1] package/babeld: bump to version 1.14
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

The removed patch has been merged [1].

Release notes:
https://github.com/jech/babeld/blob/master/CHANGES

[1] https://github.com/jech/babeld/commit/f8e5fbb33690b516b8516590def5136e6619de4c
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../babeld/0001-Fix-uclibc-build-issue.patch  | 38 -------------------
 package/babeld/babeld.hash                    |  2 +-
 package/babeld/babeld.mk                      |  2 +-
 3 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 package/babeld/0001-Fix-uclibc-build-issue.patch

diff --git a/package/babeld/0001-Fix-uclibc-build-issue.patch b/package/babeld/0001-Fix-uclibc-build-issue.patch
deleted file mode 100644
index fb2f69e98bb1..000000000000
--- a/package/babeld/0001-Fix-uclibc-build-issue.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From f8e5fbb33690b516b8516590def5136e6619de4c Mon Sep 17 00:00:00 2001
-From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Date: Tue, 17 Sep 2024 21:48:01 +0200
-Subject: [PATCH] Fix uclibc build issue
-
-This patch fixes the following compilation error raised by the bump to
-version 1.13.1 in Buildroot [1] using uclibc as the C library for the
-cross-compilation toolchain:
-
-net.c: In function 'babel_send':
-net.c:199:27: error: 'IPV6_DONTFRAG' undeclared (first use in this function)
-  199 |         cmsg->cmsg_type = IPV6_DONTFRAG;;
-
-[1] https://patchwork.ozlabs.org/project/buildroot/patch/20240917201030.11583-1-dario.binacchi@amarulasolutions.com/
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: https://github.com/jech/babeld/pull/121
----
- net.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/net.c b/net.c
-index 7a7b57844e6c..30de3dafe1d9 100644
---- a/net.c
-+++ b/net.c
-@@ -37,6 +37,10 @@ THE SOFTWARE.
- #include <arpa/inet.h>
- #include <errno.h>
- 
-+#if defined(__UCLIBC__)
-+#include <linux/in6.h>
-+#endif
-+
- #include "babeld.h"
- #include "util.h"
- #include "net.h"
--- 
-2.43.0
-
diff --git a/package/babeld/babeld.hash b/package/babeld/babeld.hash
index ab2ffc6ef811..d24649dcd227 100644
--- a/package/babeld/babeld.hash
+++ b/package/babeld/babeld.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  15f24d26da0ccfc073abcdef0309f281e4684f2aa71126f826572c4c845e8dd9  babeld-1.13.1.tar.gz
+sha256  c4ed13c04880ccc3a85a99645dcb64134beac8ab0607fe32a4d07e1057ad73b7  babeld-1.14.tar.gz
 sha256  b415c41292cedef6c97b243609e50552887c29343566c639f23282d31efd2afd  LICENCE
diff --git a/package/babeld/babeld.mk b/package/babeld/babeld.mk
index e9d20111f93d..e20cadf9c031 100644
--- a/package/babeld/babeld.mk
+++ b/package/babeld/babeld.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BABELD_VERSION = 1.13.1
+BABELD_VERSION = 1.14
 BABELD_SITE = https://www.irif.fr/~jch/software/files
 BABELD_LICENSE = MIT
 BABELD_LICENSE_FILES = LICENCE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
