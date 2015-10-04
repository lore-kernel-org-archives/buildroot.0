From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2015 12:16:11 +0200
Subject: [Buildroot] [git commit] host-localdef fails under gcc5
Message-ID: <20151004102213.9AC8A80741@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=844f240185fc12c41a2f028d8ded43df98c83f88
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building host-localdef fails under gcc5.1 reporting multiple definitions and undefined references:

argp-help.o: In function `argp_fmtstream_write':
argp-help.c:(.text+0x1dc0): multiple definition of `argp_fmtstream_write'
argp-fmtstream.o:argp-fmtstream.c:(.text+0x750): first defined here
argp-help.o: In function `argp_fmtstream_puts':
argp-help.c:(.text+0x1e10): multiple definition of `argp_fmtstream_puts'
argp-fmtstream.o:argp-fmtstream.c:(.text+0x810): first defined here
argp-help.o: In function `argp_fmtstream_putc':
argp-help.c:(.text+0x1e80): multiple definition of `argp_fmtstream_putc'
argp-fmtstream.o:argp-fmtstream.c:(.text+0x7b0): first defined here
argp-help.o: In function `argp_fmtstream_set_lmargin':
argp-help.c:(.text+0x1ed0): multiple definition of `argp_fmtstream_set_lmargin'
argp-fmtstream.o:argp-fmtstream.c:(.text+0x590): first defined here
argp-help.o: In function `argp_fmtstream_set_rmargin':
argp-help.c:(.text+0x1f00): multiple definition of `argp_fmtstream_set_rmargin'
argp-fmtstream.o:argp-fmtstream.c:(.text+0x5c0): first defined here
argp-help.o: In function `argp_fmtstream_set_wmargin':
argp-help.c:(.text+0x1f30): multiple definition of `argp_fmtstream_set_wmargin'
argp-fmtstream.o:argp-fmtstream.c:(.text+0x5f0): first defined here
argp-help.o: In function `argp_fmtstream_point':
argp-help.c:(.text+0x1f60): multiple definition of `argp_fmtstream_point'
argp-fmtstream.o:argp-fmtstream.c:(.text+0x620): first defined here
charmap.o: In function `cmlr_open.constprop.2':
charmap.c:(.text+0x230a): undefined reference to `charmap_hash'
charmap.o: In function `charmap_read':
charmap.c:(.text+0x2397): undefined reference to `charmap_hash'
locfile.o: In function `locfile_read':
locfile.c:(.text+0x2e4): undefined reference to `locfile_hash'
locfile.c:(.text+0x8f4): undefined reference to `locfile_hash'
locfile.c:(.text+0x9b3): undefined reference to `locfile_hash'
locfile.c:(.text+0xa36): undefined reference to `locfile_hash'
collect2: error: ld returned 1 exit status
Makefile:58: recipe for target 'localedef' failed

Ref: http://permalink.gmane.org/gmane.comp.embedded.ptxdist.devel/12950

Signed-off-by: Stephen Agate <stephen.agate@talktalk.net>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Tested-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/localedef/localedef.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 4762e64..1fe431a 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -12,6 +12,8 @@ HOST_LOCALEDEF_CONF_OPTS += \
 	--prefix=/usr \
 	--with-glibc=./eglibc
 
+HOST_LOCALEDEF_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -fgnu89-inline"
+
 # The makefile does not implement an install target
 define HOST_LOCALEDEF_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/localedef $(HOST_DIR)/usr/bin/localedef
