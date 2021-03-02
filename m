From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 2 Mar 2021 21:59:50 +0100
Subject: [Buildroot] [git commit] package/perl: link with -lintl if needed
Message-ID: <20210302203903.F157986248@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0a291244002ab19f8fc8a0adb215b51888eb5aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Link with TARGET_NLS_LIBS if needed to avoid the following build failure
with perl in version 5.32:

/home/buildroot/autobuild/instance-3/output-1/host/bin/arm-linux-gcc -lm -Wl,-E -o perl perlmain.o libperl.a  -lm -lcrypt -lpthread -ldl
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: libperl.a(locale.o): in function `S_emulate_setlocale':
/home/buildroot/autobuild/instance-3/output-1/build/perl-5.32.1/locale.c:1182: undefined reference to `libintl_textdomain'

An upstream issue has been opened in:
https://github.com/Perl/perl5/issues/18467

Fixes:
 - http://autobuild.buildroot.org/results/9df8d8d28006845b4f927548f8856dfa8f79802b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/perl/perl.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index ec1cfd4d0a..0ff288db0e 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -11,6 +11,7 @@ PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
 PERL_LICENSE_FILES = Artistic Copying README
+PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 PERL_INSTALL_STAGING = YES
 
 PERL_CROSS_VERSION = 1.3.5
@@ -50,7 +51,7 @@ PERL_CONF_OPTS = \
 	--prefix=/usr \
 	-Dld="$(TARGET_CC)" \
 	-Dccflags="$(TARGET_CFLAGS)" \
-	-Dldflags="$(TARGET_LDFLAGS) -lm" \
+	-Dldflags="$(TARGET_LDFLAGS) -lm $(TARGET_NLS_LIBS)" \
 	-Dmydomain="" \
 	-Dmyhostname="noname" \
 	-Dmyuname="Buildroot $(BR2_VERSION_FULL)" \
