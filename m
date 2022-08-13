Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65EBC19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 21:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0029C60803;
	Sat, 13 Aug 2022 21:38:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0029C60803
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b5uleS9U-AkT; Sat, 13 Aug 2022 21:38:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A27D607F7;
	Sat, 13 Aug 2022 21:38:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A27D607F7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC7341BF846
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 21:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 948E080F5D
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 21:38:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 948E080F5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CZ1aZ5jYHGTj for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 21:38:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 825D280F5C
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 21:38:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 825D280F5C
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id DE3A7872E9; Sat, 13 Aug 2022 21:24:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Aug 2022 23:28:20 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a09768a3c19347728e4f9ad079f3e5990032a9a6
X-Git-Newrev: 7ff21f8d4b94e859ce95aa24ad361f2c5df9e284
X-Patchwork-Hint: ignore
Message-Id: <20220813212422.DE3A7872E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/binutils: handle
 gprofng as an optional feature
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ff21f8d4b94e859ce95aa24ad361f2c5df9e284
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

binutils 2.39 added support for gprofng, a new profiler (see
https://www.phoronix.com/news/GNU-Profiler-gprofng).

This new profiler is enabled by default, but it requires bison on the
host.

In order to handle this, this commit:

 - Adds a new option BR2_BINUTILS_GPROFNG, which allows to
   enable/disable gprofng in host-binutils

 - Unconditionnally disables gprofng for the target binutils, based on
   the idea that in a Buildroot context the analysis of profiling data
   is generally done on the host system. This can of course always be
   revisited later by adding a new option to the target binutils
   package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/binutils/Config.in.host | 6 ++++++
 package/binutils/binutils.mk    | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 907b63de13..51802db043 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -34,6 +34,12 @@ config BR2_BINUTILS_VERSION
 	default "2.38"		if BR2_BINUTILS_VERSION_2_38_X
 	default "2.39"		if BR2_BINUTILS_VERSION_2_39_X
 
+config BR2_BINUTILS_GPROFNG
+	bool "gprofng support"
+	depends on BR2_BINUTILS_VERSION_2_39_X
+	help
+	  This option enables support for gprofng, a new profiler.
+
 config BR2_BINUTILS_EXTRA_CONFIG_OPTIONS
 	string "Additional binutils options"
 	default ""
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index a3fece27dc..e4cb19896d 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -52,6 +52,7 @@ BINUTILS_CONF_OPTS = \
 	--enable-install-libiberty \
 	--enable-build-warnings=no \
 	--with-system-zlib \
+	--disable-gprofng \
 	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
 	$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
@@ -91,6 +92,13 @@ HOST_BINUTILS_CONF_OPTS = \
 	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
 	$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
+ifeq ($(BR2_BINUTILS_GPROFNG),y)
+HOST_BINUTILS_DEPENDENCIES += host-bison
+HOST_INBUTILS_CONF_OPTS += --enable-gprofng
+else
+HOST_INBUTILS_CONF_OPTS += --disable-gprofng
+endif
+
 # binutils run configure script of subdirs at make time, so ensure
 # our TARGET_CONFIGURE_ARGS are taken into consideration for those
 BINUTILS_MAKE_ENV = $(TARGET_CONFIGURE_ARGS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
