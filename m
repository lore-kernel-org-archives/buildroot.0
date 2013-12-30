From: Axel Lin <axel.lin@ingics.com>
Date: Mon, 30 Dec 2013 12:10:42 +0800
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-12-28
In-Reply-To: <20131229073008.BA8E5101B76@stock.ovh.net>
References: <20131229073008.BA8E5101B76@stock.ovh.net>
Message-ID: <CAFRkauCBgSkKwC+93gFMyrBYSAYugj0FNGL0uXtZUm=WaVZChA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>    powerpc |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/9cad1cf49ee6b5c58d8260ee33beef2e6c1ada4d/
>    powerpc |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/d0dbddba3b6dc5b25e9440b7f7d6ff713b4d6d79/

Hi,
To fix this build error, I added below changes:

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 6ea3aae..cabf944 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -17,4 +17,6 @@ ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lintl"
 endif

+CRYPTSETUP_AUTORECONF = YES
+
 $(eval $(autotools-package))

diff -Nru cryptsetup-1.6.3.ori/configure.ac cryptsetup-1.6.3/configure.ac
--- cryptsetup-1.6.3.ori/configure.ac 2013-12-28 22:59:37.888444142 +0800
+++ cryptsetup-1.6.3/configure.ac 2013-12-28 23:01:42.260446120 +0800
@@ -49,7 +49,8 @@
 AC_SUBST(UUID_LIBS, $LIBS)
 LIBS=$saved_LIBS

-AC_CHECK_FUNCS([posix_memalign])
+AC_SEARCH_LIBS([clock_gettime],[rt posix4])
+AC_CHECK_FUNCS([posix_memalign clock_gettime])

 if test "x$enable_largefile" = "xno" ; then
   AC_MSG_ERROR([Building with --disable-largefile is not supported,
it can cause data corruption.])

However, I hit another build error when making install in po:

make[2]: Entering directory
`/opt/test/br-ppc/buildroot/output/build/cryptsetup-1.6.3/po'
/opt/test/br-ppc/buildroot/output/target/usr/share
make[2]: execvp: /opt/test/br-ppc/buildroot/output/target/usr/share:
Permission denied
make[2]: *** [install-data-yes] Error 127
make[2]: Leaving directory
`/opt/test/br-ppc/buildroot/output/build/cryptsetup-1.6.3/po'
make[1]: *** [install-recursive] Error 1
make[1]: Leaving directory
`/opt/test/br-ppc/buildroot/output/build/cryptsetup-1.6.3'
make: *** [/opt/test/br-ppc/buildroot/output/build/cryptsetup-1.6.3/.stamp_target_installed]
Error 2

Looks like $(MKDIR_P) is empty.
In output/build/cryptsetup-1.6.3/po/Makefile:
Add "MKDIR_P= /bin/mkdir -p" before "mkdir_p = $(MKDIR_P)" fixes it.
But I don't figure out how to fix it correctly.
Comments are welcome.
