Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E15E77376
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 14:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F33AF83DB3;
	Sat, 30 Sep 2023 14:16:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F33AF83DB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tw3nAPexCon9; Sat, 30 Sep 2023 14:16:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3BF08305A;
	Sat, 30 Sep 2023 14:16:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3BF08305A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F16E21BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAA2381E06
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAA2381E06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nn_Un_dYBcIG for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 14:16:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD81A81B26
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 14:16:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD81A81B26
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CAF8D83A4C; Sat, 30 Sep 2023 14:16:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 16:15:19 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 30956141119ab55409442c743acdbb1c487a8ece
X-Git-Newrev: c35b052d9703ee1f3bd5ad97b6de14cc1b8b6a19
X-Patchwork-Hint: ignore
Message-Id: <20230930141641.CAF8D83A4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/{glibc,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c35b052d9703ee1f3bd5ad97b6de14cc1b8b6a19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

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
Reviewed-by: Romain Naour <romain.naour@smile.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
