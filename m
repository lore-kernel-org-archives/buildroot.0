Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8614FE7716F
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 22:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42BE660837;
	Wed,  4 Dec 2024 22:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ymY_JKJgcZCc; Wed,  4 Dec 2024 22:08:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4829B6084B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4829B6084B;
	Wed,  4 Dec 2024 22:08:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 501721DD9
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 22:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1915D6084B
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 22:08:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQ-JvPpo9B3F for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 22:08:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B765A60837
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B765A60837
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B765A60837
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 22:08:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 2FC291BF204;
 Wed,  4 Dec 2024 22:08:34 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  4 Dec 2024 23:08:31 +0100
Message-ID: <20241204220832.206342-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1733350114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=HyrPC1LI25oEC118LMtggksXdFfgvXBiYsYa3H/YOmI=;
 b=pr7fs7gcMT2hk1xomZCO+7ru3aUzdYrunplPTlBm8ZrfUw7jv5D6FMDN+KIuX/3QTwckAe
 sAH1mthz7Lgqja6vvKwksuypVFr5/XOAfqGKX9WiNazUwU3K5j2uB1/ejuKbNVuYpp+5/L
 qo4DQhcSue1lDM4omDc9T5zuh9SV7kIeu7FwblkQSGKB5Y0tFvFwsT+9RaLA+DFRm1vVqb
 jGOp3TOo7WiB1SMqBHnS8MRK9Vmvz22t2VNSXOQtUTRcjrF70twjGtMwZdGIfbfL7PG48F
 UrMIt7oNa1J+Y+UG4wQ5oxwmjmXgXUU/SL13XXDAdccv+lkJSOvEWqrg1W2Msg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pr7fs7gc
Subject: [Buildroot] [PATCH] package/lmbench: fix build by adjusting LDLIBS
 logic
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

The lmbench package (largely unmaintained upstream, last release in
2006) uses a home-grown build system. The scripts/build script sets
LDLIBS to -lm and Buildroot's makefile changes that to:

LDLIBS+=-lm

Except that when Buildroot passes LDLIBS="`$(PKG_CONFIG_HOST_BINARY)
--libs libtirpc`", the LDLIBS variable ends up being equal to:

       -ltirpc-lm

Yes, without any space between -ltirpc and -lm.

Due to this, the checks in scripts/build that use ${LDLIBS} all fail,
and in particular the test that checks when socklen_t is a known type
fails, causing lmbench to provide its own definition, which clashes
with the C library headers definition, and therefore causing build
failures such as:

bench.h:81:13: error: conflicting types for 'socklen_t'; have 'int'

This commit fixes that by adjusting scripts/build using a patch to
properly allow passing additional ${LDLIBS} value, with the needed
space to separate the value from -lm.

Fixes:

  http://autobuild.buildroot.net/results/f1715de95b46a1d08143e529bd4574bc7dbcfb3e/

We have been unable to determine exactly when this issue was
introduced. The first build failure we could find is the one
referenced above, which dates back from Aug 19, 2024. Since this date,
lmbench has been consistently failing on a very regular
basis. However, prior to Aug 19, 2024, the previous failure was from
December 2022, and was unrelated. It is unclear what changed in Aug
2024 to cause this issue to surface. The one thing that changed right
before commit ce3dedc2 (first failing commit) are changes to
genrandconfig, which ensures all autobuilders now generated fully
random configurations instead of configurations based on a
well-defined list of arch/toolchain configurations. But even with
this, this lmbench issue should have appeared earlier, and we have
been unable to find a scientific explanation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...build-make-it-possible-to-set-LDLIBS.patch | 30 +++++++++++++++++++
 package/lmbench/lmbench.mk                    |  1 -
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 package/lmbench/0005-scripts-build-make-it-possible-to-set-LDLIBS.patch

diff --git a/package/lmbench/0005-scripts-build-make-it-possible-to-set-LDLIBS.patch b/package/lmbench/0005-scripts-build-make-it-possible-to-set-LDLIBS.patch
new file mode 100644
index 0000000000..6d5599763e
--- /dev/null
+++ b/package/lmbench/0005-scripts-build-make-it-possible-to-set-LDLIBS.patch
@@ -0,0 +1,30 @@
+From 2c7ff6989bc6161d8a2cc823d3aa7c9cb1deca80 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Wed, 4 Dec 2024 22:59:31 +0100
+Subject: [PATCH] scripts/build: make it possible to set LDLIBS
+
+LDLIBS is currently unconditionnally set to '-lm', but doesn't allow
+the user to provide additional libraries to link with.
+
+Upstream: dead, last release in 2006
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ scripts/build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/build b/scripts/build
+index 60b755c..4820d80 100755
+--- a/scripts/build
++++ b/scripts/build
+@@ -18,7 +18,7 @@ done
+ 
+ trap 'rm -f ${BASE}$$.s ${BASE}$$.c ${BASE}$$.o ${BASE}$$; exit 1' 1 2 15
+ 
+-LDLIBS=-lm
++LDLIBS="${LDLIBS} -lm"
+ 
+ # check for HP-UX's ANSI compiler
+ echo "main(int ac, char *av[]) { int i; }" > ${BASE}$$.c
+-- 
+2.47.0
+
diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index b0f99ff106..3d942779ad 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -26,7 +26,6 @@ LMBENCH_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
 
 define LMBENCH_CONFIGURE_CMDS
 	sed -i 's/CFLAGS=/CFLAGS+=/g' $(@D)/src/Makefile
-	sed -i 's/LDLIBS=/LDLIBS+=/g' $(@D)/scripts/build
 	sed -i '/cd .*doc/d' $(@D)/src/Makefile
 	sed -i '/include/d' $(@D)/src/Makefile
 	touch $@
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
