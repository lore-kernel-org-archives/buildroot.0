From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jun 2016 22:01:50 +0200
Subject: [Buildroot] [git commit] gettext: drop host-gettextize eye candy
	fixups
Message-ID: <20160628200348.83E6F81794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d1ebe5a691797ad757fdb6b44b0d74fa87a4456
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The real functional change (to not wait for confirmation) was alredy handled
below in HOST_GETTEXT_GETTEXTIZE_CONFIRMATION, and we otherwise don't patch
upstream purely for cosmetical reasons so drop it.

gettextize is also quite noisy as is, so the single 'Press return' line imho
isn't a big issue:

>>> fetchmail 6.3.26 Gettextizing
Copying file config.rpath
Not copying intl/ directory.
Copying file po/Makefile.in.in
Copying file po/Makevars.template
Copying file po/Rules-quot
Copying file po/boldquot.sed
Copying file po/en at boldquot.header
Copying file po/en at quot.header
Copying file po/insert-header.sin
Copying file po/quot.sed
Copying file po/remove-potcdate.sin
Creating po/ChangeLog
Copying file m4/gettext.m4
Copying file m4/iconv.m4
Copying file m4/lib-ld.m4
Copying file m4/lib-link.m4
Copying file m4/lib-prefix.m4
Copying file m4/nls.m4
Copying file m4/po.m4
Copying file m4/progtest.m4
Creating m4/ChangeLog
Updating configure.ac (backup is in configure.ac~)
Creating ChangeLog

Please update po/Makevars so that it defines all the variables mentioned
in po/Makevars.template.
You can then remove po/Makevars.template.

Please run 'aclocal -I m4 -I m4-local' to regenerate the aclocal.m4 file.
You need aclocal from GNU automake 1.9 (or newer) to do this.
Then run 'autoconf' to regenerate the configure file.

You might also want to copy the convenience header file gettext.h
from the /home/peko/source/buildroot/output-test/host/usr/share/gettext directory into your package.
It is a wrapper around <libintl.h> that implements the configure --disable-nls
option.

Press Return to acknowledge the previous three paragraphs.
>>> fetchmail 6.3.26 Autoreconfiguring

CC: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gettext/gettext.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 71fcb00..8cbb112 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -60,12 +60,6 @@ endef
 
 GETTEXT_POST_INSTALL_TARGET_HOOKS += GETTEXT_REMOVE_UNNEEDED
 
-define GETTEXT_GETTEXTIZE_EYE_CANDY
-	$(SED) '/Press Return\|read dummy/d' $(HOST_DIR)/usr/bin/gettextize
-endef
-
-HOST_GETTEXT_POST_INSTALL_HOOKS += GETTEXT_GETTEXTIZE_EYE_CANDY
-
 # Force build with NLS support, otherwise libintl is not built
 # This is needed because some packages (eg. libglib2) requires
 # locales, but do not properly depend on BR2_ENABLE_LOCALE, and
