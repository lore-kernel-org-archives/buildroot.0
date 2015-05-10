From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2015 22:28:29 +0200
Subject: [Buildroot] [git commit] xlib_libXfont: work around missing __ELF__
	symbol on microblaze
Message-ID: <20150510203120.CF620818E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51136ebd1dc653bda8dfa4e1b708a03ffae37341
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/688/688a839ec57e7bc83b490535871b2dac0b1309ff/
http://autobuild.buildroot.net/results/75c/75c676b1baed6f39657578caf7fc213ce71c1089/
http://autobuild.buildroot.net/results/2b9/2b9e9ebaaabe4880e7d258d88f12ce90738ca779/
http://autobuild.buildroot.net/results/988/988022e559af81d9b7dfc716dfb84bd0fa3698f2/

And many more.

The microblaze toolchains don't define the __ELF__ preprocessor symbol even
though they do use the elf format.  LibXfont checks for this symbol to know
if weak symbols are supported, and otherwise falls back to emulation code
using dlopen - Causing linker issues for stuff using libXfont.

Work around it by defining the symbol here as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXfont/xlib_libXfont.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index 5b6de1f..adc22b4 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -16,5 +16,15 @@ XLIB_LIBXFONT_CONF_OPTS = --disable-devel-docs
 
 HOST_XLIB_LIBXFONT_CONF_OPTS = --disable-devel-docs
 
+ifeq ($(BR2_microblaze),y)
+# The microblaze toolchains don't define the __ELF__ preprocessor
+# symbol even though they do use the elf format. LibXfont checks for
+# this symbol to know if weak symbols are supported, and otherwise
+# falls back to emulation code using dlopen - Causing linker issues
+# for stuff using libXfont.
+# Work around it by defining the symbol here as well.
+XLIB_LIBXFONT_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D__ELF__"
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
