Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95AFE71D58
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 21:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 360AB4159D;
	Fri, 29 Sep 2023 21:45:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 360AB4159D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VigtpcwR3EDt; Fri, 29 Sep 2023 21:45:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEA5B4150E;
	Fri, 29 Sep 2023 21:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEA5B4150E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C0AB31BF397
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 21:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7ECF40A95
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 21:45:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7ECF40A95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mCN9kCzQrJuT for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 21:45:06 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29D1A40150
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 21:45:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29D1A40150
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89E4340007;
 Fri, 29 Sep 2023 21:45:03 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.94.2)
 (envelope-from <peko@48ers.dk>)
 id 1qmLIE-008lra-RI; Fri, 29 Sep 2023 23:45:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 23:44:41 +0200
Message-Id: <20230929214441.2090519-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH-2023.08.x] package/{glibc,
 localedef}: security bump to 2.37-43
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

CVE-2023-25139: When the printf family of functions is called with a
format specifier that uses an <apostrophe> (enable grouping) and a
minimum width specifier, the resulting output could be larger than
reasonably expected by a caller that computed a tight bound on the
buffer size.  The resulting larger than expected output could result
in a buffer overflow in the printf family of functions.

CVE-2023-4527: If the system is configured in no-aaaa mode via
/etc/resolv.conf, getaddrinfo is called for the AF_UNSPEC address
family, and a DNS response is received over TCP that is larger than
2048 bytes, getaddrinfo may potentially disclose stack contents via
the returned address data, or crash.

CVE-2023-4806: When an NSS plugin only implements the
_gethostbyname2_r and _getcanonname_r callbacks, getaddrinfo could use
memory that was freed during buffer resizing, potentially causing a
crash or read or write to arbitrary memory.

CVE-2023-5156: The fix for CVE-2023-4806 introduced a memory leak when
an application calls getaddrinfo for AF_INET6 with AI_CANONNAME,
AI_ALL and AI_V4MAPPED flags set.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 453aadae11..ab310498b8 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  0f8bfad0b853a0c6e1dd1c3254a30b58d4c7050870fe2b0da90ad40f4d450ce2  glibc-2.37-2-g9f8513dc64119a424b312db97cef5d87d376defa.tar.gz
+sha256  7129dfadea29e8f20865186a7fdec3dc3e65d055a81dc8fc399189491bba493c  glibc-2.37-43-g94ef70136587c40a357f775677997c753b3de56c.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 79e6c76cb4..666d9e4a8c 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.37-2-g9f8513dc64119a424b312db97cef5d87d376defa
+GLIBC_VERSION = 2.37-43-g94ef70136587c40a357f775677997c753b3de56c
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 6f8b170516..d368121a1a 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.37-2-g9f8513dc64119a424b312db97cef5d87d376defa
+LOCALEDEF_VERSION = 2.37-43-g94ef70136587c40a357f775677997c753b3de56c
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
