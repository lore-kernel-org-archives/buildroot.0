Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB30C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 305B981181;
	Fri, 28 Feb 2025 16:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lxJPMowaa8Hr; Fri, 28 Feb 2025 16:57:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18F0B84EE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18F0B84EE1;
	Fri, 28 Feb 2025 16:57:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 155B068
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73E9942DB2
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 60NvDIorwDRq for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D34A142D45
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D34A142D45
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE965821C6; Fri, 28 Feb 2025 16:30:08 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Jan 2025 18:33:13 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4ff3fcec5485646924bcf4d1abd3a42e35ee2c49
X-Git-Newrev: f93c3f16f00fa197224e82a3908fb0e0b6e497e4
X-Patchwork-Hint: ignore
Message-Id: <20250228163008.CE965821C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/igh-ethercat: backport
 upstream commit to fix build issue
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f93c3f16f00fa197224e82a3908fb0e0b6e497e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch backports an upstream igh-ethercat commit to fix build
issues at -O0 or -Os. The commit message says -O0, but in the context
of Buildroot, the issue was encountered at -Os, due to dead-code
elimination.

Fixes:

  https://autobuild.buildroot.org/results/bfa074afee8a70abe597b117ecf815e234f16b40/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...cessary-inline-statement-causing-build-O0.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/igh-ethercat/0004-Remove-unnecessary-inline-statement-causing-build-O0.patch b/package/igh-ethercat/0004-Remove-unnecessary-inline-statement-causing-build-O0.patch
new file mode 100644
index 0000000000..2cbb9c3ce7
--- /dev/null
+++ b/package/igh-ethercat/0004-Remove-unnecessary-inline-statement-causing-build-O0.patch
@@ -0,0 +1,38 @@
+From 39d065d5fb56525c1171c4fcb643b798ee10c6b9 Mon Sep 17 00:00:00 2001
+From: Richard Hacker <ha@igh.de>
+Date: Mon, 18 Nov 2024 10:54:00 +0100
+Subject: [PATCH] Remove unnecessary inline statement causing build -O0
+ problems
+
+Fixes #147
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://gitlab.com/etherlab.org/ethercat/-/commit/5802c72818df07d34469630a8943915cce738626
+---
+ lib/slave_config.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/slave_config.c b/lib/slave_config.c
+index 7bef3a99..58d6c7b4 100644
+--- a/lib/slave_config.c
++++ b/lib/slave_config.c
+@@ -40,6 +40,7 @@
+ void ec_slave_config_add_sdo_request(ec_slave_config_t *, ec_sdo_request_t *);
+ void ec_slave_config_add_reg_request(ec_slave_config_t *, ec_reg_request_t *);
+ void ec_slave_config_add_voe_handler(ec_slave_config_t *, ec_voe_handler_t *);
++void ec_slave_config_add_soe_request(ec_slave_config_t *, ec_soe_request_t *);
+ 
+ /****************************************************************************/
+ 
+@@ -625,7 +626,7 @@ ec_sdo_request_t *ecrt_slave_config_create_sdo_request(ec_slave_config_t *sc,
+ 
+ /****************************************************************************/
+ 
+-inline void ec_slave_config_add_soe_request(ec_slave_config_t *sc,
++void ec_slave_config_add_soe_request(ec_slave_config_t *sc,
+         ec_soe_request_t *req)
+ {
+     if (sc->first_soe_request) {
+-- 
+2.47.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
