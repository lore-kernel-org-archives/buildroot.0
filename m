From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 26 Feb 2015 18:35:25 +0100
Subject: [Buildroot] [PATCH v2] libgtk2: skip tutorial and faq build
In-Reply-To: <877fv57f9j.fsf@dell.be.48ers.dk>
References: <20150224235024.844FBE0447@smtp.hushmail.com>
 <877fv57f9j.fsf@dell.be.48ers.dk>
Message-ID: <20150226173525.GA3914@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-02-26 00:17 +0100, Peter Korsgaard spake thusly:
> >>>>> "justin" == justin swartz <justin.swartz@nym.hush.com> writes:
> 
>  > Fixes: http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/65165
>  > Credit to Yann E. MORIN for discovering and describing a fix for the
>  > HAVE_DOCBOOK bug in "configure.ac", as well as the
>  > "--disable-gtk-doc-pdf" and "--disable-gtk-doc-html" additions to
>  > LIBGTK2_CONF_OPTS.
> 
>  > Signed-off-by: Justin Swartz <justin.swartz@nym.hush.com>
> 
>  > ---
>  > Changes v1 -> v2:
>  >   - Commit log added to the head of "0002-configure-have_docbook.patch"
>  >   - Moved "--disable-gtk-doc-pdf" and "--disable-gtk-doc-html" to the
>  >     end of LIBGTK2_CONF_OPTS
>  > ---
>  >  package/libgtk2/0002-configure-have_docbook.patch | 15 +++++++++++++++
>  >  package/libgtk2/libgtk2.mk                        |  9 +++++++--
>  >  2 files changed, 22 insertions(+), 2 deletions(-)
>  >  create mode 100644 package/libgtk2/0002-configure-have_docbook.patch
> 
>  > diff --git a/package/libgtk2/0002-configure-have_docbook.patch b/package/libgtk2/0002-configure-have_docbook.patch
>  > new file mode 100644
>  > index 0000000..aece8f1
>  > --- /dev/null
>  > +++ b/package/libgtk2/0002-configure-have_docbook.patch
>  > @@ -0,0 +1,15 @@
>  > +Improvement of the HAVE_DOCBOOK test criteria.
>  > +
>  > +Signed-off-by: Justin Swartz <justin.swartz@nym.hush.com>
>  > +
>  > +--- libgtk2-2.24.18/configure.ac.orig	2015-02-24 00:28:18.128745222 +0200
>  > ++++ libgtk2-2.24.18/configure.ac	2015-02-24 00:29:10.739087501 +0200
>  > +@@ -1612,7 +1612,7 @@
>  > + GTK_DOC_CHECK([1.11])
>  > + 
>  > + AC_CHECK_PROG(DB2HTML, db2html, true, false)
>  > +-AM_CONDITIONAL(HAVE_DOCBOOK, $DB2HTML)
>  > ++AM_CONDITIONAL([HAVE_DOCBOOK], [test ! "$DB2HTML" = "no"])
> 
> Why not just pass DB2HTML=false in LIBGTK2_CONF_ENV?

Weird, I was under the impression I did try that and that it did not
work... But Justin is reporting that it does work, so my memory are
obviously flawed...

>  > + AC_ARG_ENABLE(man,
>  > +               [AC_HELP_STRING([--enable-man],
>  > diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
>  > index dfc1f5b..d468117 100644
>  > --- a/package/libgtk2/libgtk2.mk
>  > +++ b/package/libgtk2/libgtk2.mk
>  > @@ -69,9 +69,14 @@ LIBGTK2_CONF_ENV = \
>  >  	ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_DIR)/usr/bin/gtk-update-icon-cache \
>  >  	ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/usr/bin/gdk-pixbuf-csource \
>  >  	ac_cv_prog_F77=no \
>  > -	ac_cv_path_CUPS_CONFIG=no
>  > +	ac_cv_path_CUPS_CONFIG=no \
>  > +	ac_cv_prog_DB2HTML=no
>  
>  > -LIBGTK2_CONF_OPTS = --disable-glibtest --enable-explicit-deps=no
>  > +LIBGTK2_CONF_OPTS = \
>  > +	--disable-glibtest \
>  > +	--enable-explicit-deps=no \
>  > +	--disable-gtk-doc-pdf \
>  > +	--disable-gtk-doc-html
> 
> What does that buy us? gtk-doc is disabled unless --enable-gtk-doc is
> passed (which we don't), so these shouldn't change anything.

Fact is, documentation is still generated even with --disable-gtk-doc.

I'll do another test-build to double-check all that mess...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
