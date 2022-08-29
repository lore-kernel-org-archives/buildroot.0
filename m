Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4477EECAAD5
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 15:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8C7C4087D;
	Mon, 29 Aug 2022 15:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8C7C4087D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PjCWGin4OSXL; Mon, 29 Aug 2022 15:45:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61E8F4086D;
	Mon, 29 Aug 2022 15:45:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61E8F4086D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F3F231BF28E
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 15:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C96D7407D7
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 15:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C96D7407D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 68tVbMRlBcdw for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 15:45:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5371A4086D
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org
 [IPv6:2001:67c:2050:102:465::110])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5371A4086D
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 15:45:38 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4MGZXG3JH0z9syh
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 17:45:34 +0200 (CEST)
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 17:45:33 +0200
Message-Id: <20220829154533.100445-2-marcus.hoffmann@othermo.de>
In-Reply-To: <20220829154533.100445-1-marcus.hoffmann@othermo.de>
References: <20220829154533.100445-1-marcus.hoffmann@othermo.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=MBO0001; t=1661787934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oZcHFB/pRgQzuQckYPv/21upeyxnSotm+/GqjeirU5Y=;
 b=fv2RMiTkqalcEnFsQgeTGp9UKCrTl2P9F03M0Qi0j54aT14MxTyL0BZBNdzQgF3RZvXMFB
 lyo01TVcTjkVR8CnAimrOlF4CkxsZO2c1OM8H53dUFkIoZLkINs0nhpGKqqTHqQ4bkBYmq
 UXnsxxlZPj6yINYcIPh30kgxxSKpxV9m40xsKLsuxNSbFoDD75zbPu1KVM8vsFBKpENQJS
 wJTNkdNTepOQyAJuXilxI4uCdEDkQI+H7lcVx92XjYBW3fledxjGVXEuwZRYJsM+Nbo285
 YWzrPMit0+vP/vrhjerc1HClFNmXeYOMKvB4DkktS9WZgUHGcaE/LE06vWypPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=othermo.de header.i=@othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=fv2RMiTk
Subject: [Buildroot] [PATCH 2/2] package/libzlib: backport security fix for
 CVE-2022-37434
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See: https://security-tracker.debian.org/tracker/CVE-2022-37434
Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
---
 package/libzlib/0002-fix-CVE-2022-37434.patch | 35 +++++++++++++++++++
 .../0003-fix-CVE-2022-37434-regression.patch  | 32 +++++++++++++++++
 package/libzlib/libzlib.mk                    |  3 ++
 3 files changed, 70 insertions(+)
 create mode 100644 package/libzlib/0002-fix-CVE-2022-37434.patch
 create mode 100644 package/libzlib/0003-fix-CVE-2022-37434-regression.patch

diff --git a/package/libzlib/0002-fix-CVE-2022-37434.patch b/package/libzlib/0002-fix-CVE-2022-37434.patch
new file mode 100644
index 0000000000..a61be48536
--- /dev/null
+++ b/package/libzlib/0002-fix-CVE-2022-37434.patch
@@ -0,0 +1,35 @@
+From eff308af425b67093bab25f80f1ae950166bece1 Mon Sep 17 00:00:00 2001
+From: Mark Adler <fork@madler.net>
+Date: Sat, 30 Jul 2022 15:51:11 -0700
+Subject: [PATCH] Fix a bug when getting a gzip header extra field with
+ inflate().
+
+If the extra field was larger than the space the user provided with
+inflateGetHeader(), and if multiple calls of inflate() delivered
+the extra header data, then there could be a buffer overflow of the
+provided space. This commit assures that provided space is not
+exceeded.
+
+Backported from: eff308af425b67093bab25f80f1ae950166bece1
+Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
+---
+ inflate.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/inflate.c b/inflate.c
+index 7be8c6366..7a7289749 100644
+--- a/inflate.c
++++ b/inflate.c
+@@ -763,9 +763,10 @@ int flush;
+                 copy = state->length;
+                 if (copy > have) copy = have;
+                 if (copy) {
++                    len = state->head->extra_len - state->length;
+                     if (state->head != Z_NULL &&
+-                        state->head->extra != Z_NULL) {
+-                        len = state->head->extra_len - state->length;
++                        state->head->extra != Z_NULL &&
++                        len < state->head->extra_max) {
+                         zmemcpy(state->head->extra + len, next,
+                                 len + copy > state->head->extra_max ?
+                                 state->head->extra_max - len : copy);
diff --git a/package/libzlib/0003-fix-CVE-2022-37434-regression.patch b/package/libzlib/0003-fix-CVE-2022-37434-regression.patch
new file mode 100644
index 0000000000..46a58710d2
--- /dev/null
+++ b/package/libzlib/0003-fix-CVE-2022-37434-regression.patch
@@ -0,0 +1,32 @@
+From 1eb7682f845ac9e9bf9ae35bbfb3bad5dacbd91d Mon Sep 17 00:00:00 2001
+From: Mark Adler <fork@madler.net>
+Date: Mon, 8 Aug 2022 10:50:09 -0700
+Subject: [PATCH] Fix extra field processing bug that dereferences NULL
+ state->head.
+
+The recent commit to fix a gzip header extra field processing bug
+introduced the new bug fixed here.
+
+Backported from: 1eb7682f845ac9e9bf9ae35bbfb3bad5dacbd91d
+Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
+---
+ inflate.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/inflate.c b/inflate.c
+index 7a7289749..2a3c4fe98 100644
+--- a/inflate.c
++++ b/inflate.c
+@@ -763,10 +763,10 @@ int flush;
+                 copy = state->length;
+                 if (copy > have) copy = have;
+                 if (copy) {
+-                    len = state->head->extra_len - state->length;
+                     if (state->head != Z_NULL &&
+                         state->head->extra != Z_NULL &&
+-                        len < state->head->extra_max) {
++                        (len = state->head->extra_len - state->length) <
++                            state->head->extra_max) {
+                         zmemcpy(state->head->extra + len, next,
+                                 len + copy > state->head->extra_max ?
+                                 state->head->extra_max - len : copy);
diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index 431c48739a..f75502326b 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -14,6 +14,9 @@ LIBZLIB_PROVIDES = zlib
 LIBZLIB_CPE_ID_VENDOR = zlib
 LIBZLIB_CPE_ID_PRODUCT = zlib
 
+# 0002-fix-CVE-2022-37434.patch
+LIBZLIB_IGNORE_CVES = CVE-2022-37434
+
 # It is not possible to build only a shared version of zlib, so we build both
 # shared and static, unless we only want the static libs, and we eventually
 # selectively remove what we do not want
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
