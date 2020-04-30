From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Apr 2020 14:38:32 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libid3tag: needs
 host-gperf
Message-ID: <20200430124925.75E71811F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c83d14b8cd830697e5ea31c4bb4201417fc65bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Since switch to debian in commit
210ccaef5784011bc035d0ae13611cb4e76f389f, host-gperf is needed to
generate frametype.c because debian/patches/add-m4-directory.patch
patches Makefile.am. As a side effect, libid3tag tries to generate
frametype.c from frametype.gperf due to following rule:

$(srcdir)/frametype.c: $(srcdir)/frametype.gperf Makefile.am
        cd $(srcdir) &&  \
        gperf -tCcTonD -K id -N id3_frametype_lookup -s -3 -k '*'  \
                frametype.gperf |  \
        sed -e 's/\(struct id3_frametype\);/\1/' |  \
        sed -e '/\$$''Id: /s/\$$//g' >frametype.c

If host-gperf is not available, frametype.c will be empty and build with
madplay will fail on:

configure:17243: checking for snd_pcm_open in -lasound
configure:17268: /home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/powerpc64-linux-gcc -o conftest -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=1  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -lasound  -L/home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/../powerpc64-buildroot-linux-gnu/sysroot/usr/lib -lasound  -L/home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/../powerpc64-buildroot-linux-gnu/sysroot/usr/lib -lid3tag  >&5
/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/8.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: /home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/../powerpc64-buildroot-linux-gnu/sysroot/usr/lib/libid3tag.so: undefined reference to `id3_frametype_lookup'

Fixes:
 - http://autobuild.buildroot.org/results/15a8c7f6e34b26446179c04383719ea71495403e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7ecd0e4edf9f42795ef70097a8f205b2aaa67a6d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libid3tag/libid3tag.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libid3tag/libid3tag.mk b/package/libid3tag/libid3tag.mk
index 14a7f3f938..5d7b219bb1 100644
--- a/package/libid3tag/libid3tag.mk
+++ b/package/libid3tag/libid3tag.mk
@@ -12,7 +12,7 @@ LIBID3TAG_SITE = \
 LIBID3TAG_LICENSE = GPL-2.0+
 LIBID3TAG_LICENSE_FILES = COPYING COPYRIGHT
 LIBID3TAG_INSTALL_STAGING = YES
-LIBID3TAG_DEPENDENCIES = zlib
+LIBID3TAG_DEPENDENCIES = host-gperf zlib
 
 # debian/patches/10_utf16.dpatch
 LIBID3TAG_IGNORE_CVES += CVE-2004-2779 CVE-2017-11551
