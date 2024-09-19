Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA01CCE8D78
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 11:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BED2B412AF;
	Thu, 19 Sep 2024 11:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id opwCH7Hk2GtJ; Thu, 19 Sep 2024 11:29:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23A9E41280
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23A9E41280;
	Thu, 19 Sep 2024 11:29:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E42B1BF33B
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 11:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9835C840EE
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 11:29:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJxjlkVYpXb4 for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 11:29:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 903F781425
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 903F781425
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 11:29:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8827783CBD; Thu, 19 Sep 2024 11:29:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 13:15:12 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 2c372847af86b104d8f75558239ae880370c0009
X-Git-Newrev: 328bd0be09b4c71e2650b85b3a075e9c5a4e7546
X-Patchwork-Hint: ignore
Message-Id: <20240919112922.8827783CBD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/bind: security
 bump to 9.18.28
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

commit: https://git.buildroot.net/buildroot/commit/?id=328bd0be09b4c71e2650b85b3a075e9c5a4e7546
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Fixes the following security issues:

- CVE-2024-0760: A flood of DNS messages over TCP may make the server
  unstable https://kb.isc.org/docs/cve-2024-0760

- CVE-2024-1737: BIND's database will be slow if a very large number of RRs
  exist at the same name https://kb.isc.org/docs/cve-2024-1737

- CVE-2024-1975: SIG(0) can be used to exhaust CPU resources
  https://kb.isc.org/docs/cve-2024-1975

- CVE-2024-4076: Assertion failure when serving both stale cache data and
  authoritative zone content https://kb.isc.org/docs/cve-2024-4076

Bind 9.16.x is EOL since April 2024.
See here for what version should be used in production:
https://kb.isc.org/docs/aa-01540

Remove patch 0001 as CC_FOR_BUILD is used in upstream code
to compile host utility gen.

Use BIND_AUTORECONF = YES to avoid a Debian 12 libtool bug.
Otherwise rndc linking fails. See here for a bug report to
bind9 project:
https://gitlab.isc.org/isc-projects/bind9/-/issues/4840

See here for a changelog:
https://downloads.isc.org/isc/bind9/9.18.28/doc/arm/html/notes.html

COPYRIGHT file has been updated, following Copyright holders were
added:
Copyright Joyent, Inc. and other Node contributors. All rights reserved.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit c9515c8b63bc9bc84b52b731c2c72031acd240d2)
[Peter: mark as security bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore           |  1 -
 package/bind/0001-cross.patch | 34 ----------------------------------
 package/bind/bind.hash        |  8 ++++----
 package/bind/bind.mk          |  9 +++++----
 4 files changed, 9 insertions(+), 43 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a824a50c49..b2cce42ebd 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -336,7 +336,6 @@ package/benejson/0001-c-std.patch lib_patch.Upstream
 package/benejson/0002-Use-print-as-a-function-for-Py3-compatibility.patch lib_patch.Upstream
 package/berkeleydb/0001-cwd-db_config.patch lib_patch.Upstream
 package/berkeleydb/0002-atomic_compare_exchange.patch lib_patch.Upstream
-package/bind/0001-cross.patch lib_patch.Upstream
 package/bind/S81named Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/bird/0001-configure.ac-fix-build-with-autoconf-2.70.patch lib_patch.Upstream
 package/bmx7/0001-Fix-schedule.c-378-36-error-SIOCGSTAMP-undeclared.patch lib_patch.Upstream
diff --git a/package/bind/0001-cross.patch b/package/bind/0001-cross.patch
deleted file mode 100644
index f39be2f837..0000000000
--- a/package/bind/0001-cross.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 505cc9fcadda5607dc4c5bacb03928c0b35162a8 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Wed, 4 Nov 2020 17:51:38 +0100
-Subject: [PATCH] Use host compiler to build 'gen' since it's run when
- building.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-[Fabrice: updated for 9.11.10]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
----
- lib/dns/Makefile.in | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/lib/dns/Makefile.in b/lib/dns/Makefile.in
-index 8fc4e94f26..4ac92857e0 100644
---- a/lib/dns/Makefile.in
-+++ b/lib/dns/Makefile.in
-@@ -184,10 +184,8 @@ code.h:	gen
- 	./gen -s ${srcdir} > code.h || { rm -f $@ ; exit 1; }
- 
- gen: gen.c
--	${BUILD_CC} ${BUILD_CFLAGS} -I${top_srcdir}/lib/isc/include \
--	${LFS_CFLAGS} ${LFS_LDFLAGS} \
--	${BUILD_CPPFLAGS} ${BUILD_LDFLAGS} -o $@ ${srcdir}/gen.c \
--	${BUILD_LIBS} ${LFS_LIBS}
-+	${HOSTCC} ${HOST_CFLAGS} -I${top_srcdir}/lib/isc/include \
-+	${HOST_LDFLAGS} -o $@ ${srcdir}/gen.c
- 
- timestamp: include libdns.@A@
- 	touch timestamp
--- 
-2.29.1
-
diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 482b046c8d..feb3430a73 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.16.48/bind-9.16.48.tar.xz.asc
-# with key AADBBA5074F1402F7B69D56BC5B4EE931A9F9DFD
-sha256  8d3814582348f90dead1ad410b1019094cd399d3d83930abebb2b3b1eb0b2bbb  bind-9.16.48.tar.xz
-sha256  13491a682dc0f5ee2273cebd3949e2be62f9470fe659419a03a308d4f444773b  COPYRIGHT
+# Verified from https://ftp.isc.org/isc/bind9/9.18.28/bind-9.18.28.tar.xz.asc
+# with key 706B6C28620E76F91D11F7DF510A642A06C52CEC
+sha256  e7cce9a165f7b619eefc4832f0a8dc16b005d29e3890aed6008c506ea286a5e7  bind-9.18.28.tar.xz
+sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 0d81ffabd6..217c9916fd 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.16.48
+BIND_VERSION = 9.18.28
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
@@ -24,13 +24,14 @@ BIND_TARGET_SERVER_SBIN += lwresd named named-checkconf named-checkzone
 BIND_TARGET_SERVER_SBIN += named-compilezone rndc rndc-confgen dnssec-dsfromkey
 BIND_TARGET_SERVER_SBIN += dnssec-keyfromlabel dnssec-signzone tsig-keygen
 BIND_TARGET_TOOLS_BIN = dig host nslookup nsupdate
-BIND_CONF_ENV = \
-	BUILD_CC="$(TARGET_CC)" \
-	LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
+# avoid potential Debian 12 libtool 2.4.7 bug
+# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=929396
+BIND_AUTORECONF = YES
 BIND_CONF_OPTS = \
 	--without-cmocka \
 	--without-lmdb \
 	--enable-epoll \
+	--disable-doh \
 	--disable-backtrace \
 	--with-openssl=$(STAGING_DIR)/usr
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
