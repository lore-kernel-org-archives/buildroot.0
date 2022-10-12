Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA0AC4332F
	for <buildroot@archiver.kernel.org>; Wed, 12 Oct 2022 21:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EAAE4071E;
	Wed, 12 Oct 2022 21:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EAAE4071E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p4YbVb744x9o; Wed, 12 Oct 2022 21:50:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DD8C40340;
	Wed, 12 Oct 2022 21:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DD8C40340
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECAEA1BF3D5
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 21:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C675D40340
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 21:50:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C675D40340
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8CUyzmICOruR for <buildroot@lists.busybox.net>;
 Wed, 12 Oct 2022 21:50:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10F104032A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10F104032A
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 21:50:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id A07EAE0005;
 Wed, 12 Oct 2022 21:50:13 +0000 (UTC)
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 Peter Korsgaard <peter@korsgaard.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot List <buildroot@buildroot.org>
Date: Wed, 12 Oct 2022 23:50:08 +0200
Message-Id: <20221012215008.2918444-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665611414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=rYk20LF4GKQH5TJYfqqQ0+f76HVsqNXZGNwpAJ/2D1s=;
 b=Uas4a1DStVDfSIFDxtOmRarwIkR7Ge7ClzhZMBXT5+iRti7bv/HGvoJ9xW8DNi1W6hhGUK
 SOowi2va75U2/vVjpjNcFvVNA1ALvFm9ppM4/LFCjGDjdFW9DKR9v5QZX7Qr90HQZlg1Kr
 XZy2ulHK3gXclKa4QYLHu2dJ89OXYCKQuvwtKeGAMJo3ehvXPOd+bH/ThR34+Gu6zmL77W
 n1Ei75w7zgmY71ZPG/poYWWDwBsVCeLawLySQE6Rs3oZ/2hr0pJJ775xM4oaasF41WApv+
 XV1VEPXzbLAgNksAsnilfJ+Fi9dAqejlRqWpW65tlxjLf00IT6htH6g+PytpYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Uas4a1DS
Subject: [Buildroot] [PATCH] Config.in: introduce BR2_TIME_BITS_64 option
 for Y2038 compatibility
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
 Config.in           | 16 ++++++++++++++++
 package/Makefile.in |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/Config.in b/Config.in
index 3c57c591a8..46c80fe2f0 100644
--- a/Config.in
+++ b/Config.in
@@ -753,6 +753,22 @@ config BR2_PER_PACKAGE_DIRECTORIES
 
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
+	  Notes:
+	    - This option only has an effect with glibc >= 2.34.
+	    - The musl C library since its version 1.20 is
+	      unconditionally Y2038 compliant.
+	    - The uClibc-ng library is not Y2038 compliant.
+
 comment "Security Hardening Options"
 
 config BR2_PIC_PIE_ARCH_SUPPORTS
diff --git a/package/Makefile.in b/package/Makefile.in
index 43d214bcbe..59d88bb97e 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -163,6 +163,9 @@ TARGET_HARDENED += -D_FORTIFY_SOURCE=2
 endif
 
 TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
+ifeq ($(BR2_TIME_BITS_64),y)
+TARGET_CPPFLAGS += -D_TIME_BITS=64
+endif
 TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) $(TARGET_HARDENED)
 TARGET_CXXFLAGS = $(TARGET_CFLAGS)
 TARGET_FCFLAGS = $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
