Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A08BE77374
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 14:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3352083DFB;
	Sat, 30 Sep 2023 14:18:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3352083DFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kZNr0VPmEgFg; Sat, 30 Sep 2023 14:18:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CD5683DE8;
	Sat, 30 Sep 2023 14:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CD5683DE8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 378D41BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10CED40635
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:18:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10CED40635
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m8Nrxt1cGjeF for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 14:18:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3ACBC400E4
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 14:18:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3ACBC400E4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 244BA83A60; Sat, 30 Sep 2023 14:18:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 16:15:44 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 9cbf9db69111a72346c7b9419222f10d939a09a2
X-Git-Newrev: 7c3e9fbe121fb80863f4d3ca0b137e2d6818fff0
X-Patchwork-Hint: ignore
Message-Id: <20230930141837.244BA83A60@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/{glibc,
 localedef}: security bump to 2.36-117
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c3e9fbe121fb80863f4d3ca0b137e2d6818fff0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 4ce4c6f6d1..1a66b66984 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  666482e657c319f7e139121121a0d97d303c65207b9f9730f42a3ee83c79f686  glibc-2.36-81-g4f4d7a13edfd2fdc57c9d76e1fd6d017fb47550c.tar.gz
+sha256  a4351e60a33e84236c1866c39eeab321f419dfdc274411b7d2615c9382ace351  glibc-2.36-117-g32957eb6a86acdbeec9f38a60a7d5a0ff32db03d.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 354f035d33..42de53ffc5 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.36-81-g4f4d7a13edfd2fdc57c9d76e1fd6d017fb47550c
+GLIBC_VERSION = 2.36-117-g32957eb6a86acdbeec9f38a60a7d5a0ff32db03d
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 6699840854..e71424490b 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.36-81-g4f4d7a13edfd2fdc57c9d76e1fd6d017fb47550c
+LOCALEDEF_VERSION = 2.36-117-g32957eb6a86acdbeec9f38a60a7d5a0ff32db03d
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
