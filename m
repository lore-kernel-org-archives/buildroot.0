Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E07E78480
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 19:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 630588145D;
	Sun,  1 Oct 2023 19:15:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 630588145D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wBAMkl23WS7L; Sun,  1 Oct 2023 19:15:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 535C181E84;
	Sun,  1 Oct 2023 19:15:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 535C181E84
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B15BB1BF588
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 19:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97F4840490
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 19:15:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97F4840490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aj2j2uK68GlB for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 19:15:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD9E240383
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 19:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD9E240383
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9CD983F73; Sun,  1 Oct 2023 19:15:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Oct 2023 21:14:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83ffe153faa97b08acbfd0d15d4ca7f77604c17a
X-Git-Newrev: 3c427c64726560ea1743282a3fdb78f5b28692eb
X-Patchwork-Hint: ignore
Message-Id: <20231001191539.A9CD983F73@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Config.in: introduce BR2_TIME_BITS_64
 option for Y2038 compatibility
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3c427c64726560ea1743282a3fdb78f5b28692eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Y2038 is now almost only 15 years away, and embedded systems built
today are potentially going to still be operational in 15 years, and
even though they are supposed to receive updates by then, we all know
how things go, and potentially some of these embedded systems will not
receive any update.

In 2038, the signed 32-bit representation of time_t used on 32-bit
architectures will overflow, causing all time-related functions to go
back in time in a surprising way.

The Linux kernel has already been modified to support a 64-bit
representation of time_t on 32-bit architectures, but from a C library
perspective, the situation varies:

 - glibc uses this 64-bit time_t representation on 32-bit systems
   since glibc 2.34, but only if -D_TIME_BITS=64 is
   specified. Therefore, this commit adds an option to add this flag
   globally to the build, when glibc is the C library and the
   architecture is not 64-bit.

 - musl uses unconditionally a 64-bit time_t representation on 32-bit
   systems since musl 1.2.0. So there is nothing to do here since
   Buildroot has been using a musl >= 1.2.0, used since Buildroot
   2020.05. No Buildroot option is needed here.

 - uClibc-ng does not support a 64-bit time_t representation on 32-bit
   systems, so systems using uClibc-ng will not be Y2038 compliant, at
   least for now. No Buildroot option is needed here.

It should be noted that being Y2038-compliant will only work if all
application/library code is correct. For example if an
application/library stores a timestamp in an "int" instead of using
the proper time_t type, then the mechanisms described above will not
fix this, and the application/library will continue to be broken in
terms of Y2038 support.

Possible discussions points about this patch:

 - Should we have an option at all, or should we unconditionally pass
   -D_TIME_BITS=64, like we have been doing for _FILE_OFFSET_BITS=64
   for quite some time. The reasoning for having an option is that
   the mechanism is itself opt-in in glibc, and generally relatively
   new, so it seemed logical for now to make it optional as well in
   Buildroot.

 - Should we show something (a Config.in comment?) in the musl and
   uClibc-ng case to let the user know that the code is Y2038
   compliant (musl) or not Y2038 compliant (uClibc-ng). Or should this
   discussion be part of the Buildroot documentation?

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in           | 14 ++++++++++++++
 package/Makefile.in |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/Config.in b/Config.in
index 670e199c0b..dbcca4c55a 100644
--- a/Config.in
+++ b/Config.in
@@ -736,6 +736,20 @@ config BR2_PER_PACKAGE_DIRECTORIES
 
 endmenu
 
+config BR2_TIME_BITS_64
+	bool "Build Y2038-ready code"
+	depends on BR2_TOOLCHAIN_USES_GLIBC && !BR2_ARCH_IS_64
+	help
+	  This option will pass -D_TIME_BITS=64 in the compiler flags
+	  to ensure the glibc C library uses a 64-bit representation
+	  for time_t and other time types, which ensures that
+	  programs/libraries will correctly handle time past year
+	  2038.
+
+	  This option only has an effect with glibc >= 2.34, as
+	  earlier glibc versions did not have support for 64-bit
+	  time_t.
+
 comment "Security Hardening Options"
 
 config BR2_PIC_PIE_ARCH_SUPPORTS
diff --git a/package/Makefile.in b/package/Makefile.in
index 5c11cae732..9fbe960759 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -167,6 +167,9 @@ TARGET_HARDENED += -D_FORTIFY_SOURCE=3
 endif
 
 TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
+ifeq ($(BR2_TIME_BITS_64),y)
+TARGET_CPPFLAGS += -D_TIME_BITS=64
+endif
 TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) $(TARGET_HARDENED)
 TARGET_CXXFLAGS = $(TARGET_CFLAGS)
 TARGET_FCFLAGS = $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
