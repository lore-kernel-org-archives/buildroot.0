Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A437CA0EED
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 16:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DC97612AE;
	Sat, 23 Aug 2025 16:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5sizr6TIqIly; Sat, 23 Aug 2025 16:45:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44F9160608
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44F9160608;
	Sat, 23 Aug 2025 16:45:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FB0A71E
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 16:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 012A64006D
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 16:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZI-w3SgszeTW for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 16:45:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56D6840012
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56D6840012
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 16:45:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45A61876C8; Sat, 23 Aug 2025 16:45:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Aug 2025 18:40:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 41463deed46b1085d7e6d327d0846805c110d7fe
X-Git-Newrev: 103f75bfabbf5a837e6036be8851711f06171283
X-Patchwork-Hint: ignore
Message-Id: <20250823164501.45A61876C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/p11-kit: fix build with GCC 15.x
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=103f75bfabbf5a837e6036be8851711f06171283
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The AC_HEADER_STDBOOL macro used in configure.ac is expanded in the
shipped ./configure by a fairly old version, which misdetects our
<stdbool.h> as being not usable. Consequently, the code defines its
own bool type, with true/false, clashing with GCC 15.x.

Doing a pass of autoreconf addresses the problem.

The autoreconf needs pkg.m4, which comes from host-pkgconf, added as a
dependency.

Note that host-pkgconf was already a dependency for one of the
optional dependencies of p11-kit, and we're keeping it there even
though host-pkgconf is now also an unconditional dependency as we
expect this unconditional host-pkgconf dependency to be removed when
we drop autoreconf.

Fixes:

  https://autobuild.buildroot.net/results/760df1a8c21afa893ade5181ce797e14c1f6bdce/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/p11-kit/p11-kit.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 154a34e634..42de3e1065 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -14,6 +14,12 @@ P11_KIT_CONF_ENV = ac_cv_have_decl_program_invocation_short_name=yes \
 P11_KIT_LICENSE = BSD-3-Clause
 P11_KIT_LICENSE_FILES = COPYING
 P11_KIT_CPE_ID_VALID = YES
+# Needed because the pre-generated ./configure script has an old
+# broken expansion of AC_HEADER_STDBOOL, which incorrectly detects
+# that <stdbool.h> cannot be used, causing breakage down the road.
+P11_KIT_AUTORECONF = YES
+# Needed for autoreconf
+P11_KIT_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_LIBFFI),y)
 P11_KIT_DEPENDENCIES += host-pkgconf libffi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
