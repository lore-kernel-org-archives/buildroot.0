Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C90C54E41
	for <buildroot@archiver.kernel.org>; Wed,  6 Mar 2024 07:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC86682538;
	Wed,  6 Mar 2024 07:30:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id URz3dffNNXZU; Wed,  6 Mar 2024 07:30:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6A4C825C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6A4C825C3;
	Wed,  6 Mar 2024 07:30:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E7F781BF584
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 07:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D58FC60900
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 07:30:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LG2dcz_i-sVm for <buildroot@lists.busybox.net>;
 Wed,  6 Mar 2024 07:30:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E3116085A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E3116085A
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 07:30:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA0A78815F; Wed,  6 Mar 2024 07:30:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Mar 2024 08:25:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c2dbcdcf0bb589d325c379246acaa39bb07b7be
X-Git-Newrev: 85acd9b5b9b46808749d1618b26789c782cc81a0
X-Patchwork-Hint: ignore
Message-Id: <20240306073036.EA0A78815F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/restorecond: fix build with
 BR2_TIME_BITS_64
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

commit: https://git.buildroot.net/buildroot/commit/?id=85acd9b5b9b46808749d1618b26789c782cc81a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do not remove _FILE_OFFSET_BITS=64 from CFLAGS and CPPFLAGS to avoid the
following build failure with BR2_TIME_BITS_64 raised since commit
3c427c64726560ea1743282a3fdb78f5b28692eb:

In file included from /home/fabrice/buildroot/output/host/mips-buildroot-linux-gnu/sysroot/usr/include/features.h:394,
                 from /home/fabrice/buildroot/output/host/mips-buildroot-linux-gnu/sysroot/usr/include/fts.h:53,
                 from restore.h:6,
                 from restore.c:1:
/home/fabrice/buildroot/output/host/mips-buildroot-linux-gnu/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
   26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
      |     ^~~~~

Indeed, this LFS workaround was there since the addititon of the package
in commit 9d6da7a264a5b36ad641a0d26b3a3d27188d3624 and is only needed to
fix a build failure with the old codesourcery-arm toolchain from 2014
which uses glibc < 2.23. as glibc 2.23 was released in February 2016:
https://sourceware.org/glibc/wiki/Release/2.23, drop this workaround as
already done for libselinux in commit
c1fa9bc2f7a4e5481edf4fce5c03dd45862fe72c. A follow-up patch will also
drop codesourcery-arm toolchain.

Fixes: 3c427c64726560ea1743282a3fdb78f5b28692eb
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/restorecond/restorecond.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/restorecond/restorecond.mk b/package/restorecond/restorecond.mk
index cd40905230..96ef8d2a50 100644
--- a/package/restorecond/restorecond.mk
+++ b/package/restorecond/restorecond.mk
@@ -11,13 +11,8 @@ RESTORECOND_LICENSE_FILES = LICENSE
 
 RESTORECOND_DEPENDENCIES = libglib2 libsepol libselinux dbus-glib
 
-# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
-# large file support.
-# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
 RESTORECOND_MAKE_OPTS += \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
-	CPPFLAGS="$(TARGET_CPPFLAGS) -U_FILE_OFFSET_BITS" \
 	ARCH="$(BR2_ARCH)"
 
 # We need to pass DESTDIR at build time because it's used by
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
