Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D74E92734
	for <buildroot@archiver.kernel.org>; Thu,  5 Oct 2023 19:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57C88403ED;
	Thu,  5 Oct 2023 19:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57C88403ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZjZq59FObg_r; Thu,  5 Oct 2023 19:54:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2D3740350;
	Thu,  5 Oct 2023 19:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2D3740350
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 253CF1BF40E
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 19:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C0FE40280
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 19:54:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C0FE40280
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PlucvJ7JumTR for <buildroot@lists.busybox.net>;
 Thu,  5 Oct 2023 19:54:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDD14400C6
 for <buildroot@buildroot.org>; Thu,  5 Oct 2023 19:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDD14400C6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA29D84251; Thu,  5 Oct 2023 19:54:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 5 Oct 2023 21:54:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07a03a8549b0e1ed92993311be337c7a382b6446
X-Git-Newrev: 8519de517e222c36108f0b573585de3057865ba7
X-Patchwork-Hint: ignore
Message-Id: <20231005195451.DA29D84251@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{glibc,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8519de517e222c36108f0b573585de3057865ba7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
