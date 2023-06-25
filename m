Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE229EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 17:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58F1D81DE3;
	Sun, 25 Jun 2023 17:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58F1D81DE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Krm6m6FWGe6; Sun, 25 Jun 2023 17:51:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 858528196E;
	Sun, 25 Jun 2023 17:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 858528196E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 786BC1BF3BF
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 17:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EE8C8196E
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 17:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EE8C8196E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Do0t5JF3FJA for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 17:51:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E21A4818AC
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E21A4818AC
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 17:51:54 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::225])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id A6C00CF68C
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 17:47:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FBB31C0004;
 Sun, 25 Jun 2023 17:47:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@48ers.dk>)
 id 1qDTpN-0075A3-Bm; Sun, 25 Jun 2023 19:47:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 19:47:06 +0200
Message-Id: <20230625174707.1688088-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/dbus: security bump to version 1.2.28
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

- CVE-2023-34969: Fix an assertion failure in dbus-daemon when a privileged
  Monitoring connection (dbus-monitor, busctl monitor, gdbus monitor or
  similar) is active, and a message from the bus driver cannot be delivered
  to a client connection due to <deny> rules or outgoing message quota.
  This is a denial of service if triggered maliciously by a local attacker.

- Fix an incorrect assertion that could be used to crash dbus-daemon or
  other users of DBusServer prior to authentication, if libdbus was compiled
  with assertions enabled.

For details, see the NEWS file:
https://gitlab.freedesktop.org/dbus/dbus/blob/dbus-1.12/NEWS

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.hash | 4 ++--
 package/dbus/dbus.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 17c70004ba..0e48d4dafd 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.24.tar.gz.asc
+# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.28.tar.gz.asc
 # using key 36EC5A6448A4F5EF79BEFE98E05AE1478F814C4F
-sha256  bc42d196c1756ac520d61bf3ccd6f42013617def45dd1e591a6091abf51dca38  dbus-1.12.24.tar.gz
+sha256  9da1e3f2b73f75eec0a9e4509d64be43909d1f2853fe809528a0a53984d76420  dbus-1.12.28.tar.gz
 
 # Locally calculated
 sha256  0e46f54efb12d04ab5c33713bacd0e140c9a35b57ae29e03c853203266e8f3a1  COPYING
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index b3a79c431d..99d2c4301c 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -6,7 +6,7 @@
 
 # When updating dbus, check if there are changes in session.conf and
 # system.conf, and update the versions in the dbus-broker package accordingly.
-DBUS_VERSION = 1.12.24
+DBUS_VERSION = 1.12.28
 DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
 DBUS_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
