Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB07C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C30C584C01;
	Fri, 28 Feb 2025 16:52:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MEOkpkDUt_tL; Fri, 28 Feb 2025 16:52:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0FAE84BE5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0FAE84BE5;
	Fri, 28 Feb 2025 16:52:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 078F51DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B6BA42F3F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKGzzEhb60QG for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16D9542CF0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16D9542CF0
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0EB1887C2C; Fri, 28 Feb 2025 16:30:00 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 8 Jan 2025 23:00:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 001e777d507b972a580d75e3ac8d892eff72fbf2
X-Git-Newrev: 5c0a91f7293523254e9c48667df4468370fda58d
X-Patchwork-Hint: ignore
Message-Id: <20250228163000.0EB1887C2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libxcrypt: make
 available only with glibc
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

commit: https://git.buildroot.net/buildroot/commit/?id=5c0a91f7293523254e9c48667df4468370fda58d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

libxcrypt has been added as a replacement for the libcrypt
implementation that was part of glibc, but dropped from glibc starting
from version 2.39.

However, libxcrypt was made available for all C libraries, and this is
unfortunately causing some problems as it can clash with the libcrypt
implementation provided by the C library.

In particular, linux-pam has been consistently failing with uclibc, in
BR2_PER_PACKAGE_DIRECTORIES=y builds, with the following build
failure:

opasswd.c: In function 'compare_password':
opasswd.c:133:27: error: invalid application of 'sizeof' to incomplete type 'struct crypt_data'

What happens is relatively tricky, but let's try to break it down:

- uclibc-ng install a stub libcrypt.a (no shared variant, as for
  shared libraries, everything is in libc.so), and crypt.h

- libxcrypt installs libcrypt.so.* and crypt.h

So there is no "clash" on the library itself, but there is a clash on
the header file.

Since we're using BR2_PER_PACKAGE_DIRECTORIES=y, when building
linux-pam, we are creating the per-package STAGING_DIR by copying the
STAGING_DIR of linux-pam dependencies, i.e both the libxcrypt
STAGING_DIR and the uclibc-ng STAGING_DIR. But the latter ends up
being copied last, which means that at the end of the day, we have in
the per-package STAGING_DIR of linux-pam:

- The libcrypt.so from libxcrypt
- The crypt.h header from uclibc-ng
- The libcrypt.a from uclibc-ng

When the ./configure script of linux-pam tests whether the library has
crypt_r(), it concludes that yes it's available: and indeed
libcrypt.so from libxcrypt has it.

So it tries to use 'struct crypt_data' and 'crypt_r()', but those are
not supported in uClibc-ng, and so cannot be found in the <crypt.h>
header. So even if the ./configure script and the linux-pam code has
some logic to fallback to crypt() if crypt_r() isn't available, this
fallback doesn't trigger because the installed libcrypt.so does have
crypt_r().

Basically what happens is that uclibc-ng + libxcrypt is a combo that
violates a golden rule of our BR2_PER_PACKAGE_DIRECTORIES=y
implementation: packages shouldn't overwrite files from each other.

To avoid this situation, we make libxcrypt only installable on
glibc. This isn't a problem because as of today, BR2_PACKAGE_LIBXCRYPT
is always selected "if BR2_TOOLCHAIN_USES_GLIBC".

It should be noted though that the case of an older glibc (which still
had its own internal libcrypt) + libxcrypt continues to exist. It's
less likely to cause trouble though, as the libcrypt implementations
are much more similar.

Fixes:

  http://autobuild.buildroot.net/results/560f66b0311d02dc884732221d6870ae3c38067c/

Note: we do not add a Config.in comment for this glibc dependency,
because libxcrypt really is a "replacement" library to fill in the
void left by libcrypt's removal from glibc. There isn't realy a point
showing "libxcrypt needs a toolchain w/ glibc", because with musl or
uclibc-ng, the libcrypt functionality is directly part of the C
library.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libxcrypt/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libxcrypt/Config.in b/package/libxcrypt/Config.in
index 57ae8f67a3..38c75b5e63 100644
--- a/package/libxcrypt/Config.in
+++ b/package/libxcrypt/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBXCRYPT
 	bool "libxcrypt"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  libxcrypt is a modern library for one-way hashing
 	  of passwords. It supports a wide variety of both
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
