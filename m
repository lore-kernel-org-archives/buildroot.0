Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3862CCD184
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 18:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CBA781420;
	Sun, 19 Oct 2025 18:59:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_iMM7YFNnCZ; Sun, 19 Oct 2025 18:59:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 243FC813D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 243FC813D5;
	Sun, 19 Oct 2025 18:59:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C146C43F
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 18:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD72540BDE
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 18:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K-SklZDHLcx4 for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 18:59:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CAAC40A8B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CAAC40A8B
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 18:59:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFAA78760C; Sun, 19 Oct 2025 18:59:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Oct 2025 20:58:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a36b7cf77e7d44e7abf5c939baabc67e030282e8
X-Git-Newrev: 3980698ecea3db1d8154940acd61fda9e16c578d
X-Patchwork-Hint: ignore
Message-Id: <20251019185900.EFAA78760C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ifupdown: bump to version 0.8.44
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8047896970493236003=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8047896970493236003==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3980698ecea3db1d8154940acd61fda9e16c578d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding PKGLIBDIR to CFLAGS was necessary to fix the following error
raised during the compilation of the new version:

execute.c: In function ‘set_environ’:
execute.c:107:48: error: ‘PKGLIBDIR’ undeclared (first use in this function)
  107 |         *ppch++ = setlocalenv("%s=%s", "PATH", PKGLIBDIR ":/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin");
      |                                                ^~~~~~~~~
execute.c:107:48: note: each undeclared identifier is reported only once for each function it appears in
execute.c:107:57: error: expected ‘)’ before string constant
  107 |         *ppch++ = setlocalenv("%s=%s", "PATH", PKGLIBDIR ":/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin");

This PKGLIBDIR define was added upstream in commit [1] in the Makefile
default CFLAGS, but since Buildroot redefines those it needs to be added
back.

Release notes since 0.8.41:
https://salsa.debian.org/debian/ifupdown/-/blob/master/debian/changelog#L1

[1] https://salsa.debian.org/debian/ifupdown/-/commit/1eee7a3040eb7ba295c44beddbfb44abf342ca2c

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ifupdown/ifupdown.hash | 4 ++--
 package/ifupdown/ifupdown.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ifupdown/ifupdown.hash b/package/ifupdown/ifupdown.hash
index f5c2d2d34c..6412cf9d90 100644
--- a/package/ifupdown/ifupdown.hash
+++ b/package/ifupdown/ifupdown.hash
@@ -1,4 +1,4 @@
-# From http://snapshot.debian.org/archive/debian/20230222T205615Z/pool/main/i/ifupdown/ifupdown_0.8.41.dsc
-sha256  222c5bef313a9e71d9be4b946c73c8606c98f9e0229153191d9c6d8fb9b3599c  ifupdown_0.8.41.tar.xz
+# From http://snapshot.debian.org/archive/debian/20240917T144520Z/pool/main/i/ifupdown/ifupdown_0.8.44.dsc
+sha256  6121a19702e2e86b8f3aaac90d486ae8d557477f769718f3eb838945b697bcad  ifupdown_0.8.44.tar.xz
 # Locally computed
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/ifupdown/ifupdown.mk b/package/ifupdown/ifupdown.mk
index 14c36db0db..395e462082 100644
--- a/package/ifupdown/ifupdown.mk
+++ b/package/ifupdown/ifupdown.mk
@@ -4,16 +4,16 @@
 #
 ################################################################################
 
-IFUPDOWN_VERSION = 0.8.41
+IFUPDOWN_VERSION = 0.8.44
 IFUPDOWN_SOURCE = ifupdown_$(IFUPDOWN_VERSION).tar.xz
-IFUPDOWN_SITE = http://snapshot.debian.org/archive/debian/20230222T205615Z/pool/main/i/ifupdown
+IFUPDOWN_SITE = http://snapshot.debian.org/archive/debian/20240917T144520Z/pool/main/i/ifupdown
 IFUPDOWN_LICENSE = GPL-2.0+
 IFUPDOWN_LICENSE_FILES = COPYING
 IFUPDOWN_CPE_ID_VENDOR = debian
 
 define IFUPDOWN_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS) -std=gnu99 -D'IFUPDOWN_VERSION=\"$(IFUPDOWN_VERSION)\"'" \
+		CFLAGS="$(TARGET_CFLAGS) -std=gnu99 -D'PKGLIBDIR=\"/lib/ifupdown\"' -D'IFUPDOWN_VERSION=\"$(IFUPDOWN_VERSION)\"'" \
 		ARCH=linux \
 		-C $(@D)
 endef

--===============8047896970493236003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8047896970493236003==--
