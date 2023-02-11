Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B154C636CC
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 15:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2799D40386;
	Sat, 11 Feb 2023 15:02:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2799D40386
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dnP7zAx5pC49; Sat, 11 Feb 2023 15:02:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BCD14039D;
	Sat, 11 Feb 2023 15:02:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BCD14039D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 18C2A1BF369
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 15:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6E4260ADE
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 15:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6E4260ADE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SXb-IVoKfW-J for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 15:02:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D133F60AA5
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 15:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D133F60AA5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8AD184A7C; Sat, 11 Feb 2023 15:02:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 15:58:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bf4d02ff35bd8a0d5aace354c987a166437db88
X-Git-Newrev: 451672e890b5f605aa9ad7a386491a31397c737f
X-Patchwork-Hint: ignore
Message-Id: <20230211150203.B8AD184A7C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chrony: run as unprivileged user
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=451672e890b5f605aa9ad7a386491a31397c737f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are three ways to run chronyd:
  - start as root, and continue running as root;
  - start as root, then setuid() to a non-root user via either a command
    line option or a configuration directive;
  - start as root, and setuid() to a build-time specified non-root user.

Currently, the first situation is used by Buildroot, which does not
follow security best practices of dropping elevated privileges for
daemon at runtime when that is possible.

We switch to the third situation, where a compile-time default non-root
user is then used at runtime to drop privileges, with libcap used to
keep the capabilities required to call the appropriate syscalls to
adjust the system time (typically, CAP_SYS_TIME to call adjtimex() or
clock_settime() et al.).

This means that libcap is now a mandatory dependency.

To be noted: users who previously had configured their systems to run
chronyd as non root, would have done so with either the command-line
option (`-u`), or the configuration directive (`user`). Those take
precedence over the compile-time default, so this should not break their
systems (presumably, they also run as the `chrony` user). They would
also have taken care to run chronyc as the appropriate user to
manipulate chronyd at runtime via the UNIX socket.

For those who were running chronyd as root, this does not change either:
the functionality is unchanged, and they were running chronyc as root,
which should still be capable of manipulating chronyd via its UNIX
socket.

Take that opportunity to brine chrony's Config.in to current coding
style: enclose sub-option in an if-endif block.

Signed-off-by: James Kent <james.kent@orchestrated-technology.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/chrony/Config.in |  6 +++++-
 package/chrony/chrony.mk | 11 +++++------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/package/chrony/Config.in b/package/chrony/Config.in
index 158dc20530..c22b756c11 100644
--- a/package/chrony/Config.in
+++ b/package/chrony/Config.in
@@ -1,16 +1,20 @@
 config BR2_PACKAGE_CHRONY
 	bool "chrony"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBCAP
 	help
 	  Chrony is a pair of programs which are used to maintain the
 	  accuracy of the system clock.
 
 	  http://chrony.tuxfamily.org/
 
+if BR2_PACKAGE_CHRONY
+
 config BR2_PACKAGE_CHRONY_DEBUG_LOGGING
 	bool "enable debug logging support"
-	depends on BR2_PACKAGE_CHRONY
 	help
 	  Enable support for debug logging output from Chrony when
 	  enabled at runtime. If disabled, code for debug logging will
 	  not be compiled in.
+
+endif
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 379e95a778..86f23d9060 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -10,20 +10,19 @@ CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
 CHRONY_CPE_ID_VENDOR = tuxfamily
 CHRONY_SELINUX_MODULES = chronyd
-CHRONY_DEPENDENCIES = host-pkgconf
+CHRONY_DEPENDENCIES = host-pkgconf libcap
 
 CHRONY_CONF_OPTS = \
 	--host-system=Linux \
 	--host-machine=$(BR2_ARCH) \
 	--prefix=/usr \
 	--without-tomcrypt \
+	--with-user=chrony \
 	$(if $(BR2_PACKAGE_CHRONY_DEBUG_LOGGING),--enable-debug,--disable-debug)
 
-ifeq ($(BR2_PACKAGE_LIBCAP),y)
-CHRONY_DEPENDENCIES += libcap
-else
-CHRONY_CONF_OPTS += --without-libcap
-endif
+define CHRONY_USERS
+	chrony -1 chrony -1 * /run/chrony - - Time daemon
+endef
 
 ifeq ($(BR2_PACKAGE_LIBNSS),y)
 CHRONY_DEPENDENCIES += libnss
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
