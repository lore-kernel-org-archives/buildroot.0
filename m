Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61908C4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 15:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 112D181B72;
	Sat, 15 Oct 2022 15:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 112D181B72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KrL7WWCH4T7A; Sat, 15 Oct 2022 15:41:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33D9381A33;
	Sat, 15 Oct 2022 15:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33D9381A33
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B5131BF5DE
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66C3481A33
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66C3481A33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id udPDplGgoyWa for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 15:41:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D69B81970
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 15:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D69B81970
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A18086DE1; Sat, 15 Oct 2022 15:41:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 17:39:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e37cfd2dcc867e71519439e3cd9c630866b6140
X-Git-Newrev: 29586aed965844ffb35b4d859e02f6973a67f33c
X-Patchwork-Hint: ignore
Message-Id: <20221015154123.6A18086DE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dbus: security bump to version
 1.12.24
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
Content-Type: multipart/mixed; boundary="===============0370529620639046751=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0370529620639046751==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=29586aed965844ffb35b4d859e02f6973a67f33c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Denial of service fixes:

Evgeny Vereshchagin discovered several ways in which an authenticated
local attacker could cause a crash (denial of service) in
dbus-daemon --system or a custom DBusServer. In uncommon configurations
these could potentially be carried out by an authenticated remote
attacker.

• An invalid array of fixed-length elements where the length of the
  array is not a multiple of the length of the element would cause an
  assertion failure in debug builds or an out-of-bounds read in
  production builds. This was a regression in version 1.3.0.
  (dbus#413, CVE-2022-42011; Simon McVittie)

• A syntactically invalid type signature with incorrectly nested
  parentheses and curly brackets would cause an assertion failure in
  debug builds. Similar messages could potentially result in a crash or
  incorrect message processing in a production build, although we are
  not aware of a practical example. (dbus#418, CVE-2022-42010;
  Simon McVittie)

• A message in non-native endianness with out-of-band Unix file
  descriptors would cause a use-after-free and possible memory
  corruption in production builds, or an assertion failure in debug
  builds. This was a regression in version 1.3.0. (dbus#417,
  CVE-2022-42012; Simon McVittie)

https://gitlab.freedesktop.org/dbus/dbus/-/blob/dbus-1.12.24/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.hash | 4 ++--
 package/dbus/dbus.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 176396fe2f..17c70004ba 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.22.tar.gz.asc
+# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.24.tar.gz.asc
 # using key 36EC5A6448A4F5EF79BEFE98E05AE1478F814C4F
-sha256  8d25785c798ec4f892e6f9d177fb0ceeb8b29867b119798f9d5228561d3ad474  dbus-1.12.22.tar.gz
+sha256  bc42d196c1756ac520d61bf3ccd6f42013617def45dd1e591a6091abf51dca38  dbus-1.12.24.tar.gz
 
 # Locally calculated
 sha256  0e46f54efb12d04ab5c33713bacd0e140c9a35b57ae29e03c853203266e8f3a1  COPYING
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index a3a21c1bcc..b3a79c431d 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -6,7 +6,7 @@
 
 # When updating dbus, check if there are changes in session.conf and
 # system.conf, and update the versions in the dbus-broker package accordingly.
-DBUS_VERSION = 1.12.22
+DBUS_VERSION = 1.12.24
 DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
 DBUS_LICENSE_FILES = COPYING

--===============0370529620639046751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0370529620639046751==--
