Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1FFC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52C0E70AF2;
	Fri, 28 Feb 2025 17:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9wwk5gD-18g; Fri, 28 Feb 2025 17:16:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3707B70C5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3707B70C5E;
	Fri, 28 Feb 2025 17:16:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 118EF68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5059438B8
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bTv08sR7i7ok for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B58344673
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B58344673
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 382FF87611; Fri, 28 Feb 2025 16:30:37 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 8 Feb 2025 20:58:49 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3af192d21b5507994bc2e410499487ae107e87b2
X-Git-Newrev: a05bed5aace0ed48f75255b34e54288fe4193ffc
X-Patchwork-Hint: ignore
Message-Id: <20250228163037.382FF87611@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/heimdal: host package
 needs host-libxcrypt
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a05bed5aace0ed48f75255b34e54288fe4193ffc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The host-heimdal package has always needed a crypt library, but now
that libcrypt is no longer part of glibc, we're seeing build failures
on machines with recent host glibc versions. To fix this, we add
host-libxcrypt to the dependencies, and ensure host-heimdal links with
it.

Fixes:

  http://autobuild.buildroot.net/results/864003e1005fcd847b4ec3bd94316638f8f56553/
  https://gitlab.com/buildroot.org/buildroot/-/issues/86

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/heimdal/heimdal.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index 786d94a1aa..155cb66e1f 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -6,7 +6,7 @@
 
 HEIMDAL_VERSION = f4faaeaba371fff3f8d1bc14389f5e6d70ca8e17
 HEIMDAL_SITE = $(call github,heimdal,heimdal,$(HEIMDAL_VERSION))
-HOST_HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf
+HOST_HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf host-libxcrypt
 HOST_HEIMDAL_AUTORECONF = YES
 HEIMDAL_INSTALL_STAGING = YES
 # static because of -fPIC issues with e2fsprogs on x86_64 host
@@ -29,7 +29,7 @@ HOST_HEIMDAL_CONF_OPTS = \
 	--disable-heimdal-documentation
 
 # Don't use compile_et from e2fsprogs as it raises a build failure with samba4
-HOST_HEIMDAL_CONF_ENV = ac_cv_prog_COMPILE_ET=no MAKEINFO=true
+HOST_HEIMDAL_CONF_ENV = ac_cv_prog_COMPILE_ET=no MAKEINFO=true LIBS=-lcrypt
 HEIMDAL_LICENSE = BSD-3-Clause
 HEIMDAL_LICENSE_FILES = LICENSE
 HEIMDAL_CPE_ID_VALID = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
