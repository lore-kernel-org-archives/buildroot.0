Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F521C433F5
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 17:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE4AC60E0D;
	Fri,  4 Feb 2022 17:47:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j97uYW95KX5Y; Fri,  4 Feb 2022 17:47:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A700160D88;
	Fri,  4 Feb 2022 17:47:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ADE111BF368
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 17:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9227F60D88
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 17:47:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T9AsCWP350Ek for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 17:47:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0088760AAB
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 17:47:18 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 13A14C0003;
 Fri,  4 Feb 2022 17:47:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nG2fx-0000Ig-Vq; Fri, 04 Feb 2022 18:47:14 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri,  4 Feb 2022 18:47:11 +0100
Message-Id: <20220204174712.1109-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/{glibc,
 localedef}: security bump for additional post-2.34.x fixes
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

  CVE-2022-23219: Passing an overlong file name to the clnt_create
  legacy function could result in a stack-based buffer overflow when
  using the "unix" protocol.  Reported by Martin Sebor.

  CVE-2022-23218: Passing an overlong file name to the svcunix_create
  legacy function could result in a stack-based buffer overflow.

  CVE-2021-3998: Passing a path longer than PATH_MAX to the realpath
  function could result in a memory leak and potential access of
  uninitialized memory.  Reported by Qualys.

  CVE-2021-3999: Passing a buffer of size exactly 1 byte to the getcwd
  function may result in an off-by-one buffer underflow and overflow
  when the current working directory is longer than PATH_MAX and also
  corresponds to the / directory through an unprivileged mount
  namespace.  Reported by Qualys.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-sysdeps-unix-sysv-linux-microblaze-pselect32.c-add-m.patch | 0
 .../glibc.hash                                                  | 2 +-
 package/glibc/glibc.mk                                          | 2 +-
 .../0001-HACK-only-build-and-install-localedef.patch            | 0
 ...02-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch | 0
 .../localedef.hash                                              | 2 +-
 package/localedef/localedef.mk                                  | 2 +-
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename package/glibc/{2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4 => 2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c}/0001-sysdeps-unix-sysv-linux-microblaze-pselect32.c-add-m.patch (100%)
 rename package/glibc/{2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4 => 2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c}/glibc.hash (70%)
 rename package/localedef/{2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4 => 2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c}/0001-HACK-only-build-and-install-localedef.patch (100%)
 rename package/localedef/{2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4 => 2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c}/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch (100%)
 rename package/localedef/{2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4 => 2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c}/localedef.hash (70%)

diff --git a/package/glibc/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/0001-sysdeps-unix-sysv-linux-microblaze-pselect32.c-add-m.patch b/package/glibc/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/0001-sysdeps-unix-sysv-linux-microblaze-pselect32.c-add-m.patch
similarity index 100%
rename from package/glibc/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/0001-sysdeps-unix-sysv-linux-microblaze-pselect32.c-add-m.patch
rename to package/glibc/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/0001-sysdeps-unix-sysv-linux-microblaze-pselect32.c-add-m.patch
diff --git a/package/glibc/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/glibc.hash b/package/glibc/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/glibc.hash
similarity index 70%
rename from package/glibc/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/glibc.hash
rename to package/glibc/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/glibc.hash
index 595de95a58..dfd939020f 100644
--- a/package/glibc/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/glibc.hash
+++ b/package/glibc/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  1c7ed0f69ed268bd66f9754d0cb8fb65e0dafc1f9a1048ea50d1e96d60399686  glibc-2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4.tar.gz
+sha256  3c299a21468a80356b848ca341f45551616c4928a6c871e6d45cee942e8b0f24  glibc-2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 5c26b0e6df..9b591aa2a3 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4
+GLIBC_VERSION = 2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
diff --git a/package/localedef/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/0001-HACK-only-build-and-install-localedef.patch b/package/localedef/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/0001-HACK-only-build-and-install-localedef.patch
similarity index 100%
rename from package/localedef/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/0001-HACK-only-build-and-install-localedef.patch
rename to package/localedef/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/0001-HACK-only-build-and-install-localedef.patch
diff --git a/package/localedef/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch b/package/localedef/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
similarity index 100%
rename from package/localedef/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
rename to package/localedef/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
diff --git a/package/localedef/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/localedef.hash b/package/localedef/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/localedef.hash
similarity index 70%
rename from package/localedef/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/localedef.hash
rename to package/localedef/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/localedef.hash
index 595de95a58..dfd939020f 100644
--- a/package/localedef/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/localedef.hash
+++ b/package/localedef/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/localedef.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  1c7ed0f69ed268bd66f9754d0cb8fb65e0dafc1f9a1048ea50d1e96d60399686  glibc-2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4.tar.gz
+sha256  3c299a21468a80356b848ca341f45551616c4928a6c871e6d45cee942e8b0f24  glibc-2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 87d921cffe..f8f0b42984 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4
+LOCALEDEF_VERSION = 2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
