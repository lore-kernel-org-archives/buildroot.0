Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D28C5B542
	for <buildroot@archiver.kernel.org>; Tue, 27 May 2025 20:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D9D360C0D;
	Tue, 27 May 2025 20:15:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D2mmABgXqwJV; Tue, 27 May 2025 20:15:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D1F260BF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D1F260BF2;
	Tue, 27 May 2025 20:15:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F0C1828B
 for <buildroot@buildroot.org>; Tue, 27 May 2025 20:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED2A040426
 for <buildroot@buildroot.org>; Tue, 27 May 2025 20:15:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uUo5U_N88QZu for <buildroot@buildroot.org>;
 Tue, 27 May 2025 20:15:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3D53840451
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D53840451
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D53840451
 for <buildroot@buildroot.org>; Tue, 27 May 2025 20:15:35 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2301ac32320so31887135ad.1
 for <buildroot@buildroot.org>; Tue, 27 May 2025 13:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748376934; x=1748981734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2v5eszKSDzPDOXoNoW1ksDDbtSTVvyJWxEs59ZRp/T0=;
 b=M3vckU/aarUOMQ9zLoPjX0ePw824pvWCcS4y0v2JvOvNMug2kqP58+RaQFDzAwhLpl
 /EznRWUbMfLaGYx1pmeFq/A+VhhRchFiJtJofh4TpCOpqULkFfWgF+qgK4wcfSZb4Rz0
 +gXbp9iubeK6fx9QlFZ4FiimTUlRIK3r1ce3U0sGQiBiNSYKPMB/OvKZW3lrGzZx58do
 KuB0a0EpTC9bhTJxKVDk9BK8yB0sR84rETuEtm+ijYYSwGa9xsexKsf9qLeTu/iGpmv4
 mgGyk4BrWzMKqcHqWYDcfFMsVNlQDUOSCt5DwKOt6xx/i2QdoT1SYVOXOACus8hNpbEZ
 ZiJg==
X-Gm-Message-State: AOJu0YwvFO7vyqnzX4oJKFy9WxWIZId0nRoExEXZzOAlHdzf1VrKCee7
 IEZEu0bn8w+ZC8A/5l/cVPS+h4Qqyxy6kFHZveXNcm+idJXpAy0vCzM7dTmVMlA3
X-Gm-Gg: ASbGncv5F8kUr6shbQEi02ERBztVU/UT0iCal13/qB7x+7q0cvIB6PJYaM9pUY3iXJ6
 DED2+olRsccwz0AdnJsiY5Ty5kKx75blfX/cKjr7OeszM5KwJWaLMiZPzRB6zxWMUUqlYi0P/d9
 jHWG5kteMxZZSbReGSp78+9CcjAdu6EgB/3gpUpWj6htAzwoK8cD2f8xYGAtkr84NdJodYXPmJ9
 UU96xHdZY5kMKcrJo4iXoN7dznIooBfOw9/IyFG9QfjlicqP2zw+yhYtIN6NcG/wGxEwS7k5Cqh
 MvOYUsjM7R4MY0WRe7A6tAzVJqIsqDKytEK7gH6goidpEodplrcNuGOJyO1+b/OUhgZK0STGaio
 dMu6bcpvYtR8aAnuDoVZF1O/dj2bmk/xiO4wzoQ==
X-Google-Smtp-Source: AGHT+IF/dzqfWPvNWYFCRvoQ4dmhAMhym47xIhzfssxhYrDbQGceCUjsIOSRVnbQ49SzizLFY0q3zQ==
X-Received: by 2002:a17:902:f545:b0:234:c65f:6c0f with SMTP id
 d9443c01a7336-234c65f6d1amr4509035ad.8.1748376933887; 
 Tue, 27 May 2025 13:15:33 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-234a139143esm14670595ad.196.2025.05.27.13.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 13:15:33 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Kadambini Nema <kadambini.nema@gmail.com>
Date: Tue, 27 May 2025 13:13:48 -0700
Message-Id: <20250527201348.376435-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748376934; x=1748981734; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2v5eszKSDzPDOXoNoW1ksDDbtSTVvyJWxEs59ZRp/T0=;
 b=eXORV0v6HB6EPHt8wRiHKjZtQKoqRVaXY7ziBO0UdYnfVnHTSXmdrIG3b+FTcFmosq
 fo5ydVmicuxYwOGXgVTm89CPbIkMlWxrnzvNMS4lESKczAM8XtZO2SOpPez16HXO6iie
 WGXKrka8+zrpJHl2fBRsEYb9NdSDQPAONzcP1BJWQ9ZiNQ9+0T5WBE7tK0awq/6dYkaS
 cKOxggs1XTIdg44Vtc+PV0PCCYWd+pf3oAsyQXHYvbdjnfIIEjgvg6oKXWZXo+78AggK
 IC6sqyKq5h0ioysR//Odqw/XrULh3Oqn8ikeyDbF8KwtUsrfGvd5XmMf1MMHo+CBktFl
 pSgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eXORV0v6
Subject: [Buildroot] [PATCH 1/1] package/iproute2: bump to version 6.15.0
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
Content-Type: multipart/mixed; boundary="===============7172268851064190162=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7172268851064190162==
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: 8bit

Release announcement:
https://lore.kernel.org/netdev/20250526140140.38ba5578@hermes.local/

Changelog:
https://github.com/iproute2/iproute2/compare/v6.14.0...v6.15.0

Drop 0001-nstat-NULL-Dereference-when-no-entries-specified.patch
Upstream commit - https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=866e1d107b7de68ca1fcd1d4d5ffecf9d96bff30

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 ...ereference-when-no-entries-specified.patch | 36 -------------------
 package/iproute2/iproute2.hash                |  2 +-
 package/iproute2/iproute2.mk                  |  2 +-
 3 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 package/iproute2/0001-nstat-NULL-Dereference-when-no-entries-specified.patch

diff --git a/package/iproute2/0001-nstat-NULL-Dereference-when-no-entries-specified.patch b/package/iproute2/0001-nstat-NULL-Dereference-when-no-entries-specified.patch
deleted file mode 100644
index 9b5e727fe3..0000000000
--- a/package/iproute2/0001-nstat-NULL-Dereference-when-no-entries-specified.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 866e1d107b7de68ca1fcd1d4d5ffecf9d96bff30 Mon Sep 17 00:00:00 2001
-From: ZiAo Li <23110240084@m.fudan.edu.cn>
-Date: Wed, 9 Apr 2025 23:03:30 +0800
-Subject: [PATCH] nstat: NULL Dereference when no entries specified
-
-The NULL Pointer Dereference vulnerability happens in load_ugly_table(), misc/nstat.c, in the latest version of iproute2.
-The vulnerability can be triggered by:
-1. db is set to NULL at struct nstat_ent *db = NULL;
-2. n is set to NULL at n = db;
-3. NULL dereference of variable n happens at sscanf(p+1, "%llu", &n->val) != 1
-
-Signed-off-by: ZiAo Li <23110240084@m.fudan.edu.cn>
-Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
-Upstream: https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=866e1d107b7de68ca1fcd1d4d5ffecf9d96bff30
----
- misc/nstat.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/misc/nstat.c b/misc/nstat.c
-index fce3e9c1..b2e19bde 100644
---- a/misc/nstat.c
-+++ b/misc/nstat.c
-@@ -218,6 +218,10 @@ static void load_ugly_table(FILE *fp)
- 			p = next;
- 		}
- 		n = db;
-+		if (n == NULL) {
-+			fprintf(stderr, "Error: Invalid input – line has ':' but no entries. Add values after ':'.\n");
-+			exit(-2);
-+		}
- 		nread = getline(&buf, &buflen, fp);
- 		if (nread == -1) {
- 			fprintf(stderr, "%s:%d: error parsing history file\n",
--- 
-2.49.0
-
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index d64ff918c6..69de2917cf 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  a6d23588150096591c3d00fc27a324a82ee71d7a1a9eea78df5df17ad9b8461f  iproute2-6.14.0.tar.xz
+sha256  8041854a882583ad5263466736c9c8c68c74b1a35754ab770d23343f947528fb  iproute2-6.15.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 3faa2235b8..e3076a59a8 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 6.14.0
+IPROUTE2_VERSION = 6.15.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.25.1


--===============7172268851064190162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7172268851064190162==--
