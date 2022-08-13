Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35481C19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 10:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F25F82C9C;
	Sat, 13 Aug 2022 10:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F25F82C9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8NPQxzPubyNW; Sat, 13 Aug 2022 10:52:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 354AC82A0E;
	Sat, 13 Aug 2022 10:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 354AC82A0E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82C2A1BF3DA
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 10:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E15A82A0E
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 10:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E15A82A0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QaS60qcLI58n for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 10:52:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5640829EE
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5640829EE
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 10:52:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 6946B1C0005;
 Sat, 13 Aug 2022 10:51:57 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sat, 13 Aug 2022 12:51:51 +0200
Message-Id: <20220813105152.1403602-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660387918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=c0Te5Sh2zzjyn7iMtmDDO42vkeoLmwOrNf+T/si40vo=;
 b=ZD7De2W7vNzsAvfpqMLNEqn53LhlrBAGd3voDtaBEwYIZh6rpDu3/EGkp9Z91XR4qc5tLq
 EdPCu4+SdBso11VB6WvMpubQ6AWXbb/lCwaPqyBo8Z23yzvJewEXIqOZJUrFZyz8TyCARm
 j/4OFgS9Ds2u4qpTTx59UkIGliNzzqL8wX0mJApzTU8xwVXb6fVa2NB8CV3UeMCO2Zrakr
 /OzqewlCD4P8CYAMUc3bkfbq+ZHhgY1d7Xm8CT8UVBN/FzZrXGzE2tUHkicacu6fmh7dek
 cX1j9s/BM1fYWjVaJA+U9ZgSlUvXaFhUhPX63ZaQWybwEITpwq3POEhy6uZrsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZD7De2W7
Subject: [Buildroot] [PATCH] package/binutils: handle gprofng as an optional
 feature
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
