From: Robert Urban <urban@unix-beratung.de>
Date: Fri, 14 May 2010 13:57:21 +0200
Subject: [Buildroot] ipsec-tools bzero/memmove/etc 'patch' for config.h
	seems to be wrong
Message-ID: <4BED3AA1.3060809@unix-beratung.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

my buildroot make failed in ipsec-tools with following error messages:

-snip-
libtool: compile:
/data/home/urban/Build/Buildroot/current/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-gcc
-Os -pipe -Os -mtune=i586 -march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
-I/data/home/urban/Build/Buildroot/current/buildroot/output/staging/usr/include
-I/data/home/urban/Build/Buildroot/current/buildroot/output/staging/include
--sysroot=/data/home/urban/Build/Buildroot/current/buildroot/output/staging/
-isysroot /data/home/urban/Build/Buildroot/current/buildroot/output/staging
-DHAVE_CONFIG_H -I. -I../.. -D_GNU_SOURCE -include
./src/include-glibc/glibc-bugs.h -I./src/include-glibc -I./src/include-glibc
-I./../../src/racoon/missing -include ../../src/include-glibc/glibc-bugs.h
-I../../src/include-glibc -I../../src/include-glibc -g -O2 -Wall -Werror
-Wno-unused -MT ipsec_get_policylen.lo -MD -MP -MF .deps/ipsec_get_policylen.Tpo
-c ipsec_get_policylen.c -o ipsec_get_policylen.o
In file included from ipsec_dump_policy.c:49:
/data/home/urban/Build/Buildroot/current/buildroot/output/staging/usr/include/string.h:306:
error: conflicting types for ?memmove?
/data/home/urban/Build/Buildroot/current/buildroot/output/staging/usr/include/string.h:310:
error: expected declaration specifiers or ?...? before ?(? token
/data/home/urban/Build/Buildroot/current/buildroot/output/staging/usr/include/string.h:310:
error: expected declaration specifiers or ?...? before numeric constant
/data/home/urban/Build/Buildroot/current/buildroot/output/staging/usr/include/string.h:310:
error: expected declaration specifiers or ?...? before ?(? token
/data/home/urban/Build/Buildroot/current/buildroot/output/staging/usr/include/string.h:310:
error: conflicting types for ?memset?
-snip-

after commenting out (in config.h) the bzero/memmove cpp definitions added in
ipsec-tools.mk:

        # simpler than patching that cruft..
        (echo '#undef bzero'; \
         echo '#define bzero(a, b) memset((a), 0, (b))'; \
         echo '#undef bcopy'; \
         echo '#define bcopy(src, dest, len) memmove(dest, src, len)'; \
         echo '#undef index'; \
         echo '#define index(a, b) strchr(a, b)'; \
        ) >> $(IPSEC_TOOLS_DIR)/config.h


the build continued without errors.  I did *not* remove
output/build/ipsec-tools-0.7.2 and restart.

are these 'fixed' perhaps no longer needed for ipsec-tools-0.7.2?

I 'git cloned' buildroot yesterday.

Rob Urban
