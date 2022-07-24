Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3396AC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 14:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BD5641728;
	Sun, 24 Jul 2022 14:26:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BD5641728
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VGi4LYJmAFWY; Sun, 24 Jul 2022 14:26:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BB98416EA;
	Sun, 24 Jul 2022 14:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BB98416EA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A48571BF3D8
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 14:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F08E84613
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 14:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F08E84613
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pvD7e8ozgzwU for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 14:26:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2766583E46
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2766583E46
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 14:26:22 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 ay11-20020a05600c1e0b00b003a3013da120so7837827wmb.5
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 07:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=2nUuQcQ8szhQao6gSno5q16JDdZq2065dVSwURCgj6E=;
 b=si0ZhjDXDKR9XlsPeHkrqV3ZJrdIm8KkGoy4ow0TUjhbOo/aYoU930lABl475ZU5Jv
 u/AI5EaIrmnQePDLl0b/NXxyv32v2H1UtY9j+z3pNSeivhUHzBG7pMro9w8v3aVAL7hj
 7hnSPt51SLLge6gQ+p+QBzPkCFNVP7LHIwz5OGXfD5R4cUCdhYw3rnKmv5kYfGcfBegK
 JJgbRAT4BvFqaXPooHMpSnA4/Dy4k427O0QEF58xG2ONOY/m50uXIR8VFCVEEF6vT0eq
 sdBUFqhqdo3ZEtYUkch6Pvq9mS2Ok2+EoZLFxH/kuZeunP4tPaqTBhitIEHW7XDznxCD
 DErg==
X-Gm-Message-State: AJIora+bdkLTaPzcPvtrb0sqyLgoCTfZU0ZmZjzCo7O1gIVV3oINBIBT
 K+OheoKzSOq5uq5JZ54Pwk67USSxC8Q40w==
X-Google-Smtp-Source: AGRyM1tUzOB0EQVOgFHADAKeTShbgLQhxgVs9xQ64R38IGtcbvyvMeyRh4X285dwszK3e0hYaFTxMQ==
X-Received: by 2002:a1c:ed05:0:b0:3a2:ebae:c5e7 with SMTP id
 l5-20020a1ced05000000b003a2ebaec5e7mr5466680wmh.78.1658672779773; 
 Sun, 24 Jul 2022 07:26:19 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:283:d2f0:f8df:54e6:5f1e:2381])
 by smtp.googlemail.com with ESMTPSA id
 z4-20020adfd0c4000000b0021d7b41255esm9424281wrh.98.2022.07.24.07.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 07:26:19 -0700 (PDT)
From: David GOUARIN <dgouarin@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 16:26:15 +0200
Message-Id: <20220724142615.22630-1-dgouarin@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=2nUuQcQ8szhQao6gSno5q16JDdZq2065dVSwURCgj6E=;
 b=HPsNPmnyVC/Sw2jA2I/DsXuyEPe/5XEj+2+QNsoONQiHu9ZWl92w4QhY0fq/dQzMpl
 zvC3y7omgv75TI4sJVRPrwagh0kqmYDpQtYuIutwFZ0NzfhE3QRnNE78UwO/FVqANMby
 fZJyX/Z/8JG1ggDBGWuEpn6cyHQ4JmSW30O+NWJ/3h80z/5JqC6w8zjq75s5UMapJJYr
 4jTPTlgqrGaw+NCyyklulT2OHI+mxUqMcr5qHtrT47a3uIWou8nxpQIMIQ46xhfou19+
 hO9eBpuN212qAYroKU9yziGDb05KW3LhJVlq8E7KBnv/zf0qkNOkFZS8Sia5PYe54iMs
 JMdQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HPsNPmny
Subject: [Buildroot] [PATCH V3] package/libtallc: bump version to 2.3.4
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
Cc: David GOUARIN <dgouarin@gmail.com>, romain.naour@smile.fr,
 David GOUARIN <david.gouarin@thalesgroup.com>, yann.morin.1998@free.fr
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 2.3.4 of libtalloc needs to define PYTHONHASHSEED, as a check has been added
to the configure script, and build will fail if it is not defined.

This is originately a workaround by samba developpers meant to avoid rebuilding talloc
with each call to make. Defining PYTHONHASHSEED would not be required in the context
of builroot, if not for the check in the configure script.

Signed-off-by: David GOUARIN <david.gouarin@thalesgroup.com>

---
Changes v2 -> v3:
  - fix commented lines and commit message. sorry for the mess.

Changes v1 -> v2:
  - edit commit message (suggested by Yann E. MORIN)
Signed-off-by: David GOUARIN <dgouarin@gmail.com>
---
 package/libtalloc/libtalloc.hash | 2 +-
 package/libtalloc/libtalloc.mk   | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/libtalloc/libtalloc.hash b/package/libtalloc/libtalloc.hash
index cbfd11e63b..0bc8edb695 100644
--- a/package/libtalloc/libtalloc.hash
+++ b/package/libtalloc/libtalloc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6be95b2368bd0af1c4cd7a88146eb6ceea18e46c3ffc9330bf6262b40d1d8aaa  talloc-2.3.3.tar.gz
+sha256  179f9ebe265e67e4ab2c26cad2b7de4b6a77c6c212f966903382869f06be6505  talloc-2.3.4.tar.gz
 sha256  f8340c449dd64a55c6605b02fcad2aec6f473612ac6026739a22995380a8043c  talloc.h
diff --git a/package/libtalloc/libtalloc.mk b/package/libtalloc/libtalloc.mk
index 8cba699ea1..6a5e1ef4b6 100644
--- a/package/libtalloc/libtalloc.mk
+++ b/package/libtalloc/libtalloc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTALLOC_VERSION = 2.3.3
+LIBTALLOC_VERSION = 2.3.4
 LIBTALLOC_SOURCE = talloc-$(LIBTALLOC_VERSION).tar.gz
 LIBTALLOC_SITE = https://www.samba.org/ftp/talloc
 LIBTALLOC_LICENSE = LGPL-3.0+
@@ -40,6 +40,9 @@ else
 LIBTALLOC_CONF_OPTS += --disable-python
 endif
 
+LIBTALLOC_CONF_ENV += PYTHONHASHSEED=1
+LIBTALLOC_MAKE_ENV += PYTHONHASHSEED=1
+
 LIBTALLOC_WAF = ./buildtools/bin/waf
 
 # like samba4, libtalloc uses the waf build system which requires a
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
