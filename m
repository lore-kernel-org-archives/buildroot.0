Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A38C433F5
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 15:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 658964091E;
	Sat, 19 Feb 2022 15:44:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jw5Qh-OYyhKj; Sat, 19 Feb 2022 15:44:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AC9D4054A;
	Sat, 19 Feb 2022 15:44:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C52CD1BF30B
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 15:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBD068139A
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 15:44:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=metanate.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cv-dEzlWK43p for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 15:44:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D705281360
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 15:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
 In-Reply-To:References; bh=4knKzEup0YNUyh6Oawqw9rsMkO48YR52jifpwoHNS3Y=; b=qg
 PVSRL7VTJsU5ODQ6EmvWwszRX+PEFtesndeV52V8VAWZXF5QcxaBEjSSNQWEiveQLqLch51Fyqu1r
 yUgx9W4lEjq5NDz8OZSATt8BhE7NqVdHhDLeC6n/JN43P3X4cwhYY0HPwT5LcvxZ6vTQM6rgWsD0W
 07+tEOesa6cLwLJeXsYebtxEUYyHYlMQDKECFKpOzR8difLhFM9wWm0p8p9Q6LE8QDYWmY/pfZsTX
 G8Z6XYbfYF/Tq7vJmJGaT4S8GfE5h1KLoJI04Jr2TFQjAhYhkyS5BzdyW6FMOOp/QeQHjZHtlogPS
 GA43+Ynl+veeYRJz9UuhxBTlgfw8UG5w==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1nLRtr-0001c9-O4; Sat, 19 Feb 2022 15:43:55 +0000
From: John Keeping <john@metanate.com>
To: buildroot@buildroot.org
Date: Sat, 19 Feb 2022 15:43:50 +0000
Message-Id: <20220219154350.1552021-1-john@metanate.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Authenticated: YES
Subject: [Buildroot] [PATCH] package/gdb: fix when gmp is installed on the
 host machine
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
Cc: John Keeping <john@metanate.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gdb's AC_LIB_HAVE_LINKFLAGS macro hardcodes a search starting with
/usr/lib/ which can lead to libgmp from the wrong architecture with the
result that the test fails.  Even if a libgmp is found there it is now
the one that should be used.

This is the same macro used for expat and lzma for which there are
already specific CONF_OPTS flags added here.  Add the same flag for
libgmp and move the handling down so that it is logically grouped with
the other similar options.

Note that there is no --with(out)-gmp flag to configure, as the
dependency is mandatory, so only the --with-libgmp-prefix option is
specified.

Signed-off-by: John Keeping <john@metanate.com>
---
 package/gdb/gdb.mk | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 05de3c14d1..9bde2beea1 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -77,14 +77,6 @@ ifeq ($(BR2_GDB_VERSION_11),y)
 HOST_GDB_DEPENDENCIES += host-gmp
 endif
 
-# When BR2_GDB_VERSION_11=y (because it's enabled for the host) and
-# we're building the full gdb for the target, we need gmp as a
-# dependency. For now the default gdb version in Buildroot doesn't
-# require gmp.
-ifeq ($(BR2_GDB_VERSION_11)$(BR2_PACKAGE_GDB_DEBUGGER),yy)
-GDB_DEPENDENCIES += gmp
-endif
-
 # When gdb sources are fetched from the binutils-gdb repository, they
 # also contain the binutils sources, but binutils shouldn't be built,
 # so we disable it (additionally the option --disable-install-libbfd
@@ -169,6 +161,16 @@ GDB_CONF_OPTS += \
 	--without-curses
 endif
 
+# When BR2_GDB_VERSION_11=y (because it's enabled for the host) and
+# we're building the full gdb for the target, we need gmp as a
+# dependency. For now the default gdb version in Buildroot doesn't
+# require gmp.
+ifeq ($(BR2_GDB_VERSION_11)$(BR2_PACKAGE_GDB_DEBUGGER),yy)
+GDB_CONF_OPTS += \
+	--with-libgmp-prefix=$(STAGING_DIR)/usr
+GDB_DEPENDENCIES += gmp
+endif
+
 ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
 GDB_CONF_OPTS += --enable-gdbserver
 GDB_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
