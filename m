From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 Dec 2012 00:20:36 +0100
Subject: [Buildroot] [PATCH] package/keyutils: disable on avr32 & microblaze
Message-ID: <1356650436-20697-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

keyutils builds on neither avr32, nor microblaze (probably because
the toolchains used fot those archictectures are way too old), with:

    ..../microblazeel-unknown-linux-gnu-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
    -D_FILE_OFFSET_BITS=64 -I. -DPKGBUILD="\"2012-12-27\"" -DPKGVERSION="\"keyutils-1.5.5\""
    -DAPIVERSION="\"libkeyutils-1.4\"" -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
    -D_FILE_OFFSET_BITS=64  -pipe -Os  -g -Wall -Werror -UNO_GLIBC_KEYERR -o keyutils.o -c keyutils.c
    cc1: warnings being treated as errors
    key.dns_resolver.c: In function 'main':
    key.dns_resolver.c:690: warning: dereferencing type-punned pointer will break strict-aliasing rules

Fixing with -fno-strict-aliasing only partially solves the issue for these
two archs, since the C library does not export the resolver symbols so the
link fails down the road...
  - on microblaze, glibc-2.3.6 is tool old and does not set these symbols
    as GLOBALs;
  - on avr32, uClibc does not have these symbols.

It is much more easy to just disable keyutils for avr32 and microblaze.

Fixes both (avr2, microblaze):
    http://autobuild.buildroot.net/results/aa86f6a68f5d0ea4914ab259ed270615bc9d6a99/
    http://autobuild.buildroot.net/results/70ae127a6e353fd5c64c0c3b4e19a2e93d54ce52/

Merry X-Mas!

PS. Thanks Richard for the help understanding those issues.

Cc: Richard Braun <rbraun@sceen.net>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/keyutils/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/keyutils/Config.in b/package/keyutils/Config.in
index 9b5a24b..9b9f9bc 100644
--- a/package/keyutils/Config.in
+++ b/package/keyutils/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KEYUTILS
 	bool "keyutils"
+	depends on !BR2_avr32 && !BR2_microblaze
 	help
 	  These tools are used to control the key management system
 	  built into the Linux kernel.
-- 
1.7.2.5
