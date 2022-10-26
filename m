Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB48C38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 18:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B645540571;
	Wed, 26 Oct 2022 18:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B645540571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jmn59H7pLFIx; Wed, 26 Oct 2022 18:34:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF3FA40136;
	Wed, 26 Oct 2022 18:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF3FA40136
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F41731BF279
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 18:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC0D060D7F
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 18:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC0D060D7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6OtVn8xT8DVE for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 18:34:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D8EE60D78
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D8EE60D78
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 18:34:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 9AB6EE0008;
 Wed, 26 Oct 2022 18:34:31 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Wed, 26 Oct 2022 20:34:26 +0200
Message-Id: <20221026183427.3933387-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666809272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=KQwAf066rauTWNFqp8vAI79wNvgkILJoRe8umW5/c/c=;
 b=QCWkEpq6iXVh0Wwy90OwZoEZFfn7E2IRHLn/rVASLfGwcvtHmRrInhIEdcE9sBuVzRzI0L
 qiCjGN3+KLK7XUPuzlJ74IluNTv7eJnafkfi7l0wu78y+XhV2LHPowS8/Jan0kYWqVD9wI
 OfU0r4WWymHkQltXkY5E9JMdXoG1QhS5ZMqQlIeGfnMQcpt0jECCbZOTKdNP/3RiQNaH6I
 MEExibm1sDbiw8C134r3EWJIan57CLF9ZLaJ2OOURvDrRA8x5ZSFFYNIpKscvFD4GDpgkf
 xOYIeELyaLqVf99MHqVkvVECqO7IARQTsx8f2XbknjE7oq6bsdw5eorM0sDm9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QCWkEpq6
Subject: [Buildroot] [PATCH 1/2] toolchain/toolchain-buildroot: introduce
 BR2_TOOLCHAIN_BUILDROOT_NONE
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In the internal toolchain backend, we have a choice..endchoice block
to allow the user to select the C library, between glibc, uClibc and
musl.

However, there are situations were no C library at all is
supported. In this case, the choice does not appear, and does not
allow to see the Config.in comments that are within the
choice..endchoice block and that may explain why no C library is
available.

For example, on RISC-V 32-bit, the only C library supported is glibc,
and the minimum kernel header version required by glibc on this
architecture is 5.4.0. In a future commit, we are going to add this
dependency on glibc (to fix build issues on configurations that have
headers < 5.4.0). But since glibc is the only supported C library on
RISC-V 32-bit, it means that the choice..endchoice for the C library
contains no entry, preventing from seeing the Config.in comment.

To address this issue, this commit adds a "dummy"
BR2_TOOLCHAIN_BUILDROOT_NONE option that shows up in the
choice..endchoice only when no C library is available. Thanks to this,
the choice..endchoice is never empty, and the Config.in comments can
be seen.

If the user keeps BR2_TOOLCHAIN_BUILDROOT_NONE selected, then the
build will anyway abort early because package/Makefile.in has a check
to verify that a C library is selected, and aborts the build if not.

Some could say that the problem should be resolved by instead
preventing the selection of headers < 5.4.0 on RISC-V 32-bit, but that
is difficult to do as the user can choose a custom header version, or
simply specific that (s)he wants to use the headers of the kernel
being built. In those situations, it's difficult to prevent selecting
headers < 5.4.0.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/toolchain-buildroot/Config.in | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 6d55f87435..26d731d976 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -80,6 +80,18 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
 
 	  https://www.musl-libc.org/
 
+config BR2_TOOLCHAIN_BUILDROOT_NONE
+	bool "none"
+	depends on !BR2_PACKAGE_UCLIBC_SUPPORTS && \
+		!BR2_PACKAGE_GLIBC_SUPPORTS && \
+		!BR2_PACKAGE_MUSL_SUPPORTS
+	help
+	  This option is visible if no C library is available for the
+	  currently selected configuration. If you select this option,
+	  the build will refuse to start as Buildroot needs a C
+	  library to build a toolchain. Change your configuration
+	  settings to make sure one of the C libraries is selected.
+
 endchoice
 
 config BR2_TOOLCHAIN_BUILDROOT_LIBC
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
