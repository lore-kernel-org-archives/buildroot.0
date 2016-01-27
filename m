From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Jan 2016 18:17:30 +0100
Subject: [Buildroot] [git commit] madplay: fix musl gettext support detection
Message-ID: <20160201224705.1B6C77F892@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0a244d26d8e7e7e5465c3e6e9fcd1c31e2c178d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/256/2561190b274d71666c4bdf3c569b02063cefdb30/
http://autobuild.buildroot.net/results/14e/14e6addcd3ec35f882da7ec489caa9b60ecd4b63/
http://autobuild.buildroot.net/results/cf0/cf011286be839674d358a8bccaf1c5c52de75e46/

madplay needs gettext when built with nls, and it support 3 variants:

- C library support gettext (E.G. glibc)
- Libintl (E.G. uClibc)
- An included libintl copy

The included libintl copy has unfortunately bitrotted and doesn't even build
any more.  With that said, musl DOES have gettext support, so that should be
used instead.

The configure script unfortunately uses an old AM_GNU_GETTEXT test, which
explicitly checks for nonstandard glibc extensions, which musl doesn't
support:

http://www.openwall.com/lists/musl/2015/04/16/3

Which causes the detection to fail:

configure:24770: checking for GNU gettext in libc
configure:24794: /home/peko/source/buildroot/output/host/usr/bin/i486-linux-musl-gcc \
   -o conftest -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 \
   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c  >&5
/tmp/ccboDFhK.o: In function `main':
conftest.c:(.text+0x39): undefined reference to `_nl_msg_cat_cntr'
conftest.c:(.text+0x40): undefined reference to `_nl_domain_bindings'
collect2: error: ld returned 1 exit status

Now, madplay itself doesn't actually use these glibc extensions, so just force the
detection of GNU gettext when musl is used.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/madplay/madplay.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/madplay/madplay.mk b/package/madplay/madplay.mk
index 2606ac8..65ae4f7 100644
--- a/package/madplay/madplay.mk
+++ b/package/madplay/madplay.mk
@@ -11,6 +11,11 @@ MADPLAY_LICENSE_FILES = COPYING COPYRIGHT
 MADPLAY_LIBTOOL_PATCH = NO
 MADPLAY_DEPENDENCIES = libmad libid3tag $(if $(BR2_PACKAGE_GETTEXT),gettext)
 
+# configure script misdetects musl gettext support
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+MADPLAY_CONF_ENV += gt_cv_func_gnugettext1_libc=yes
+endif
+
 # Check if ALSA is built, then we should configure after alsa-lib so
 # ./configure can find alsa-lib.
 ifeq ($(BR2_PACKAGE_MADPLAY_ALSA),y)
