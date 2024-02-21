Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29D4C5478A
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 20:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B70A681415;
	Wed, 21 Feb 2024 20:10:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 83Kft1FNmxLQ; Wed, 21 Feb 2024 20:10:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2E4A81570
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2E4A81570;
	Wed, 21 Feb 2024 20:10:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 332671BF41B
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 20:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FD60417BA
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 20:10:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1mPnXdufx_d2 for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 20:10:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B434240412
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B434240412
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 20:10:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9D0C87A2B; Wed, 21 Feb 2024 20:10:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 21 Feb 2024 21:08:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2e08963a2c45e6036566687788b812383e80820
X-Git-Newrev: 5aade5ced5edc40a4ad848cd276813d273d2d04e
X-Patchwork-Hint: ignore
Message-Id: <20240221201046.A9D0C87A2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sudo: drop legacy, useless,
 and broken post-configure hook
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

commit: https://git.buildroot.net/buildroot/commit/?id=5aade5ced5edc40a4ad848cd276813d273d2d04e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b9e89b340e27 (sudo: bump version) introduced the explicit build
of mksigname and mksiglist as host tools, as they were required to run
on the build machine, to generate C code then used to build the target
program.

This is now failing to build since the bump to sudo 1.9.15p5 in commit
c87746afefe7 (package/sudo: security bump to version 1.9.15p5)
(lines manually wrapped and slightly elided for ease of reviewing):

    /usr/bin/cpp \
        -I/home/ymorin/dev/buildroot/O/master/per-package/sudo/host/include \
        -I../../include \
        -I../.. \
        ./sys_signame.h \
    | /usr/bin/sed -e '1,/^int sudo_end_of_headers;/d' -e '/^#/d' > mksigname.h
    In file included from /usr/include/features.h:394,
                     from /usr/include/sys/types.h:25,
                     from ./sys_signame.h:4:
    /usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
       26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
          |     ^~~~~
    /usr/bin/gcc -I../../include -I../.. -I. -I. \
        -D_PATH_SUDO_CONF=\"/etc/sudo.conf\"
        -I/home/ymorin/dev/buildroot/O/master/per-package/sudo/host/include \
        -DDEFAULT_TEXT_DOMAIN=\"sudo\" \
        -O2 \
        -I/home/ymorin/dev/buildroot/O/master/per-package/sudo/host/include \
        ./mksigname.c -o mksigname
    In file included from /usr/include/features.h:394,
                     from /usr/include/bits/libc-header-start.h:33,
                     from /usr/include/stdlib.h:26,
                     from ./mksigname.c:27:
    /usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
       26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
          |     ^~~~~
    make[2]: *** [Makefile:263: mksigname] Error 1

The core of the issue has not been really identified, but it turns out
that neither mksiglist nor mksignames is used during the build. This has
been tested with a minimal sudo with no option, and with a sudo with all
options enabled (linux-pam, zlib, opensldap, and openssl), with the
three types of C libraries (glibc, musl, and uClibc-ng).

Digging in the sudo buildsystem did not reveal an obvious reason when
those would be needed either.

Drop the hook now it seems it is no longer used and is atually breaking
the build.

Fixes: http://autobuild.buildroot.org/results/72f/72ff18fb9b41394a29006f881ee1fbea67a66a09/

Note that there is a second issue in there: the call to the host cpp
fails, but since it is on the LHS of a pipe, the error is lost, as the
RHS of the pipe (the sed call) succeeds; a fix for that will be sent
in a separate patch.

Reported-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Christian Stewart <christian@aperture.us>
---
 package/sudo/sudo.mk | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index a4e838dd94..7961a99002 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -58,15 +58,6 @@ else
 SUDO_CONF_OPTS += --disable-openssl
 endif
 
-# mksigname/mksiglist needs to run on build host to generate source files
-define SUDO_BUILD_MKSIGNAME_MKSIGLIST_HOST
-	$(MAKE) $(HOST_CONFIGURE_OPTS) \
-		CPPFLAGS="$(HOST_CPPFLAGS) -I../../include -I../.." \
-		-C $(@D)/lib/util mksigname mksiglist
-endef
-
-SUDO_POST_CONFIGURE_HOOKS += SUDO_BUILD_MKSIGNAME_MKSIGLIST_HOST
-
 define SUDO_PERMISSIONS
 	/usr/bin/sudo f 4755 0 0 - - - - -
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
