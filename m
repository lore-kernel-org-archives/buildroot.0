Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F238E92731
	for <buildroot@archiver.kernel.org>; Thu,  5 Oct 2023 19:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C88541BD7;
	Thu,  5 Oct 2023 19:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C88541BD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f7oQMn2tozBm; Thu,  5 Oct 2023 19:43:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11C9341BF0;
	Thu,  5 Oct 2023 19:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11C9341BF0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE9C51BF312
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 19:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8C4660FB2
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 19:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8C4660FB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xlmiSA-Kbkhn for <buildroot@lists.busybox.net>;
 Thu,  5 Oct 2023 19:43:23 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 104B860F94
 for <buildroot@buildroot.org>; Thu,  5 Oct 2023 19:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 104B860F94
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4C0D60005;
 Thu,  5 Oct 2023 19:43:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@48ers.dk>)
 id 1qoUFe-004Nmr-EC; Thu, 05 Oct 2023 21:43:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu,  5 Oct 2023 21:43:12 +0200
Message-Id: <20231005194313.1044692-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH] package/{glibc,
 localedef}: security bump to version
 glibc-2.38-27-g750a45a783906a19591fb8ff6b7841470f1f5701
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

  CVE-2023-4911: If a tunable of the form NAME=NAME=VAL is passed in the
  environment of a setuid program and NAME is valid, it may result in a
  buffer overflow, which could be exploited to achieve escalated
  privileges.  This flaw was introduced in glibc 2.34.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 4d2e9fbbd2..00d9f1c985 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  06d73b1804767f83885ab03641e2a7bf8d73f0a6cf8caee4032d8d1cc2e76cce  glibc-2.38-13-g92201f16cbcfd9eafe314ef6654be2ea7ba25675.tar.gz
+sha256  fd991e43997ff6e4994264c3cbc23fa87fa28b1b3c446eda8fc2d1d3834a2cfb  glibc-2.38-27-g750a45a783906a19591fb8ff6b7841470f1f5701.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 844bed5051..0b71530310 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.38-13-g92201f16cbcfd9eafe314ef6654be2ea7ba25675
+GLIBC_VERSION = 2.38-27-g750a45a783906a19591fb8ff6b7841470f1f5701
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 650b319a25..ed6d4b4968 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.38-13-g92201f16cbcfd9eafe314ef6654be2ea7ba25675
+LOCALEDEF_VERSION = 2.38-27-g750a45a783906a19591fb8ff6b7841470f1f5701
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
