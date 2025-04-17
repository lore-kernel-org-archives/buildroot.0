Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C39C369D1
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 19:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B5C081EF0;
	Tue, 22 Apr 2025 19:03:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lOiS2fbDl4Rd; Tue, 22 Apr 2025 19:03:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DF0A81EDF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DF0A81EDF;
	Tue, 22 Apr 2025 19:03:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C16AF1BC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B32AA4057B
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cbs_fMyT8UOp for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 19:03:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EB6940259
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EB6940259
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:03:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59045860EA; Tue, 22 Apr 2025 19:03:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 17 Apr 2025 08:54:13 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ffb96d7c7a4d326c473d684fc107720bf92924f4
X-Git-Newrev: dd0b07d51b6e80fefb6e21893b9e881848c5f799
X-Patchwork-Hint: ignore
Message-Id: <20250422190308.59045860EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/frr: security
 bump to version 10.3
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dd0b07d51b6e80fefb6e21893b9e881848c5f799
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Update FRR to the latest stable version (10.3, see [1]).

A new package option `BR2_PACKAGE_FRR_BFD` to enable or disable the
compilation of the BFD daemon. This one has now a dependencies with the
kernel headers 4.10 (i.e. IPV6_SRCRT_TYPE_4 from linux/ipv6.h [2]).

The configure options have been updated accordingly:
- Versions of FRR before 9.2 used `sysconfdir` and `localstatedir` as-is,
  without appending `/frr`. The `/frr` suffix had to be passed explicitly
  to `./configure`, which did not align with standard conventions.
  This behavior has since been fixed upstream [3]. As `sysconfdir` and
  `localstatedir` are already set by `pkg-autotools.mk`, they can now
  be removed from `frr.mk`.
- The `--enable-shell-access` option has been removed as of FRR 10 [4].

[1] https://frrouting.org/release/10.3/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1ababeba4a21f
[3] https://github.com/FRRouting/frr/commit/ff62df2e4484
[4] https://github.com/FRRouting/frr/commit/afb034b0bb42
Fixes: https://www.cve.org/CVERecord?id=CVE-2024-55553
Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit bdffdcfdac3e8f7f99556765ef0226a8bb10c506)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/frr/Config.in |  7 +++++++
 package/frr/frr.hash  |  2 +-
 package/frr/frr.mk    | 11 +++++++----
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/package/frr/Config.in b/package/frr/Config.in
index c26b160b2a..211eb83419 100644
--- a/package/frr/Config.in
+++ b/package/frr/Config.in
@@ -24,6 +24,13 @@ config BR2_PACKAGE_FRR
 
 if BR2_PACKAGE_FRR
 
+config BR2_PACKAGE_FRR_BFD
+	bool "BFD protocol"
+	default y
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
+	help
+	  Build Bidirectional Forwarding Detection daemon.
+
 config BR2_PACKAGE_FRR_BMP
 	bool "BMP protocol"
 	select BR2_PACKAGE_C_ARES
diff --git a/package/frr/frr.hash b/package/frr/frr.hash
index aa13ed5625..7786cc8009 100644
--- a/package/frr/frr.hash
+++ b/package/frr/frr.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  5323e5ec236346860301e57f6845443855e8f2508d7ccd87ead395a9991c01c2  frr-9.1.3.tar.gz
+sha256  0f10aca9074c773c12be8a07382c7560d625d4a2c842d82261d18bb8f4b26f6c  frr-10.3.tar.gz
 sha256  7bf053957d6c38e39a06a112c60ff35b228d3bd03edbe8c9a03508b051128d16  COPYING
 sha256  f9e0c21faf738da586281c0beaad3cd56204c19085a10fe05e4d3d7f8b5863d2  doc/licenses/BSD-2-Clause
 sha256  aca297b8fd3a43e3bb200f1e2e043c0db6c897325f5ff7f23f7530302a6bf713  doc/licenses/BSD-3-Clause
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 5391bcb265..78979e2beb 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FRR_VERSION = 9.1.3
+FRR_VERSION = 10.3
 FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
 FRR_LICENSE = GPL-2.0+
 FRR_LICENSE_FILES = \
@@ -38,14 +38,11 @@ FRR_CONF_ENV = \
 # Do not enable -fplugin=frr-format for production, see doc/developer/workflow.rst,
 # it is only intended for FRR's developments
 FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
-	--sysconfdir=/etc/frr \
-	--localstatedir=/var/run/frr \
 	--with-moduledir=/usr/lib/frr/modules \
 	--enable-configfile-mask=0640 \
 	--enable-logfile-mask=0640 \
 	--enable-multipath=256 \
 	--disable-ospfclient \
-	--enable-shell-access \
 	--enable-user=frr \
 	--enable-group=frr \
 	--enable-vty-group=frrvty \
@@ -86,6 +83,12 @@ else
 FRR_CONF_OPTS += --disable-zeromq
 endif
 
+ifeq ($(BR2_PACKAGE_FRR_BFD),y)
+FRR_CONF_OPTS += --enable-bfdd
+else
+FRR_CONF_OPTS += --disable-bfdd
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 FRR_CONF_ENV += LIBS=-latomic
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
