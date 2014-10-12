From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 11:07:26 +0200
Subject: [Buildroot] [PATCH 1/2] automake: update gtk-doc.m4 to serial 2
In-Reply-To: <1412936897-8478-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 10 Oct 2014 07:28:16 -0300")
References: <1412936897-8478-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ppdx1ws1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Update gtk-doc.m4 infra to serial (version) 2.
 > Some packages start to need/ship with the new version and can't be
 > properly autoreconf'ed, like kmod 18+.
 > The file was picked up from kmod-18 itself actually.
 > Also add host-pkgconf to DEPENDENCIES since it's required by gtk-doc.m4
 > and rather than tweak it we'd prefer to use vanilla - it's actually a
 > small price in build time if we are autoreconfiguring anyway.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/automake/automake.mk |  2 +-
 >  package/automake/gtk-doc.m4  | 47 ++++++++++++++++++++++++++++++++++----------
 >  2 files changed, 38 insertions(+), 11 deletions(-)

 > diff --git a/package/automake/automake.mk b/package/automake/automake.mk
 > index 8d7e291..ab17c5d 100644
 > --- a/package/automake/automake.mk
 > +++ b/package/automake/automake.mk
 > @@ -10,7 +10,7 @@ AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
 >  AUTOMAKE_LICENSE = GPLv2+
 >  AUTOMAKE_LICENSE_FILES = COPYING
 
 > -HOST_AUTOMAKE_DEPENDENCIES = host-autoconf
 > +HOST_AUTOMAKE_DEPENDENCIES = host-autoconf host-pkgconf
 
 >  define GTK_DOC_M4_INSTALL
 >   $(INSTALL) -D -m 0644 package/automake/gtk-doc.m4 $(HOST_DIR)/usr/share/aclocal/gtk-doc.m4
 > diff --git a/package/automake/gtk-doc.m4 b/package/automake/gtk-doc.m4
 > index 2cfa1e7..3675543 100644
 > --- a/package/automake/gtk-doc.m4
 > +++ b/package/automake/gtk-doc.m4
 > @@ -27,17 +44,22 @@ AC_DEFUN([GTK_DOC_CHECK],
 >                     [use gtk-doc to build documentation [[default=no]]]),,
 >      [enable_gtk_doc=no])
 
 > -  if test x$enable_gtk_doc = xyes; then
 > -    ifelse([$1],[],
 > -      [PKG_CHECK_EXISTS([gtk-doc],,
 > -                        AC_MSG_ERROR([gtk-doc not installed and --enable-gtk-doc requested]))],
 > -      [PKG_CHECK_EXISTS([gtk-doc >= $1],,
 > -                        AC_MSG_ERROR([You need to have gtk-doc >= $1 installed to build $PACKAGE_NAME]))])
 > -  fi
 > -

So the old version of gtk-doc.m4 already needed host-pkgconf when
autoreconfiguring, and the bump shouldn't cause any more breakage.

We discussed it during the dev days. Considering how fast host-pkgconf
builds we should probably just automatically pull it in for all
autotools packages (even if they don't autoreconf) so we don't need to
add it everywhere, but that's for later.

-- 
Bye, Peter Korsgaard
