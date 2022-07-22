Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57867C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 07:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBEA14028D;
	Fri, 22 Jul 2022 07:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBEA14028D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qt-R-VDV3i4b; Fri, 22 Jul 2022 07:51:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB92B40C00;
	Fri, 22 Jul 2022 07:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB92B40C00
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A3A01BF36D
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3351242178
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3351242178
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iuG0uyOG0F1j for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 07:51:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F33741B73
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 07:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F33741B73
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 11AA9840C4; Fri, 22 Jul 2022 07:37:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 09:50:20 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 9f0e851d4991fc228838ee8590cb880878334067
X-Git-Newrev: 4a13baf05fffeed6d536e538da0cb2cabd18d390
X-Patchwork-Hint: ignore
Message-Id: <20220722073745.11AA9840C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libopenssl:
 security bump to version 1.1.1p
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a13baf05fffeed6d536e538da0cb2cabd18d390
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

The c_rehash script allows command injection (CVE-2022-2068)
============================================================

Severity: Moderate

In addition to the c_rehash shell command injection identified in
CVE-2022-1292, further circumstances where the c_rehash script does not
properly sanitise shell metacharacters to prevent command injection were
found by code review.

When the CVE-2022-1292 was fixed it was not discovered that there
are other places in the script where the file names of certificates
being hashed were possibly passed to a command executed through the
shell.

This script is distributed by some operating systems in a manner where
it is automatically executed.  On such operating systems, an attacker
could execute arbitrary commands with the privileges of the script.

Use of the c_rehash script is considered obsolete and should be replaced
by the OpenSSL rehash command line tool.

https://www.openssl.org/news/secadv/20220621.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 026f35d9e7294bdf51aa11932f74c9c4cf257250)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index ec5fd0fe84..2f76241c72 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-1.1.1o.tar.gz.sha256
-sha256  9384a2b0570dd80358841464677115df785edb941c71211f75076d72fe6b438f  openssl-1.1.1o.tar.gz
+# From https://www.openssl.org/source/openssl-1.1.1p.tar.gz.sha256
+sha256  bf61b62aaa66c7c7639942a94de4c9ae8280c08f17d4eac2e44644d9fc8ace6f  openssl-1.1.1p.tar.gz
 
 # License files
 sha256  c32913b33252e71190af2066f08115c69bc9fddadf3bf29296e20c835389841c  LICENSE
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 0c039dc7d6..195438c6b5 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 1.1.1o
+LIBOPENSSL_VERSION = 1.1.1p
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = OpenSSL or SSLeay
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
