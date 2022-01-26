Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945A1C2BA4C
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 20:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37F4B409A5;
	Wed, 26 Jan 2022 20:33:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ceKaJCcXkmU2; Wed, 26 Jan 2022 20:33:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69DD0409AA;
	Wed, 26 Jan 2022 20:33:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4378A1BF4D7
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44AC560F9F
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:33:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nZI4hVaWgnci for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 20:33:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74B7960FC6
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 20:33:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 25CFF825DF; Wed, 26 Jan 2022 20:26:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 21:32:10 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 942ed061d76a192bcd403cb1782964a89d74ae45
X-Git-Newrev: 6b40f28f808123748c87da7af323c26aa5dd9eee
X-Patchwork-Hint: ignore
Message-Id: <20220126202615.25CFF825DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/liburiparser:
 security bump to version 0.9.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b40f28f808123748c87da7af323c26aa5dd9eee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

- Fixed: [CVE-2021-46141]
  Fix a bug affecting both uriNormalizeSyntax* and uriMakeOwner*
  functions where the text range in .hostText would not be duped using
  malloc but remain unchanged (and hence "not owned") for URIs with
  an IPv4 or IPv6 address hostname; depending on how an application
  uses uriparser, this could lead the application into a use-after-free
  situation.
  As the second half, fix uriFreeUriMembers* functions that would not
  free .hostText memory for URIs with an IPv4 or IPv6 address host;
  also, calling uriFreeUriMembers* multiple times on a URI of this
  very nature would result in trying to free pointers to stack
  (rather than heap) memory.
- Fixed: [CVE-2021-46142]
  Fix functions uriNormalizeSyntax* for out-of-memory situations
  (i.e. malloc returning NULL) for URIs containing empty segments
  (any of user info, host text, query, or fragment) where previously
  pointers to stack (rather than heap) memory were freed.

https://github.com/uriparser/uriparser/blob/uriparser-0.9.6/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e00379361e16f24a348c12bb26eab4dc0af94e84)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/liburiparser/liburiparser.hash | 2 +-
 package/liburiparser/liburiparser.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
index 60acca2215..8b40807541 100644
--- a/package/liburiparser/liburiparser.hash
+++ b/package/liburiparser/liburiparser.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dd8061eba7f2e66c151722e6db0b27c972baa6215cf16f135dbe0f0a4bc6606c  uriparser-0.9.5.tar.bz2
+sha256  a288a06668528c19e85e38c508335938e1de6fdd4b8f2072401b4533fcebf644  uriparser-0.9.6.tar.xz
 sha256  287f09e6546a9610f949f89e8fb937cacfeabd7bfaa8c8a0c18312193bf04ad3  COPYING
diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
index c7bc604ece..c9903bd74f 100644
--- a/package/liburiparser/liburiparser.mk
+++ b/package/liburiparser/liburiparser.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBURIPARSER_VERSION = 0.9.5
-LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.bz2
+LIBURIPARSER_VERSION = 0.9.6
+LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.xz
 LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
 LIBURIPARSER_LICENSE = BSD-3-Clause
 LIBURIPARSER_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
