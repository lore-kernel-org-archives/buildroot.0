From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Jan 2013 01:01:58 +0100
Subject: [Buildroot] [PATCH 2/2] gnuplot : use new --without-doc and
 --without-demo configure options
In-Reply-To: <1357577933-26446-2-git-send-email-viallard@syscom-instruments.com>
References: <1357577933-26446-1-git-send-email-viallard@syscom-instruments.com>
 <1357577933-26446-2-git-send-email-viallard@syscom-instruments.com>
Message-ID: <50EE04F6.5070801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/07/13 17:58, Anthony Viallard wrote:
> create a generic patch to disable compilation/installation of docs and demo
> with configure options.
>
> use theses options and remove basic old patch.
>
> Signed-off-by: Anthony Viallard<viallard@syscom-instruments.com>
> ---
>   ...ot-0001-configure-add-without-demo-option.patch |   59 ++++++++++++++++++++
>   package/gnuplot/gnuplot.mk                         |    4 +-
>   package/gnuplot/gnuplot.patch                      |   26 ---------
>   3 files changed, 62 insertions(+), 27 deletions(-)
>   create mode 100644 package/gnuplot/gnuplot-0001-configure-add-without-demo-option.patch
>   delete mode 100644 package/gnuplot/gnuplot.patch
>
> diff --git a/package/gnuplot/gnuplot-0001-configure-add-without-demo-option.patch b/package/gnuplot/gnuplot-0001-configure-add-without-demo-option.patch
> new file mode 100644
> index 0000000..acdc91d
> --- /dev/null
> +++ b/package/gnuplot/gnuplot-0001-configure-add-without-demo-option.patch
> @@ -0,0 +1,59 @@

  The patch should start with a comment explaining what it does (similar 
to a commit message), including a Signed-off-by line.

  And don't forget to upstream the patch. If it happens to get accepted 
before the buildroot patch is accepted, you can take the upstream commit 
as the buildroot patch instead.


> +Index: gnuplot-4.6.0/configure.in
> +===================================================================
> +--- gnuplot-4.6.0.orig/configure.in	2012-03-08 05:34:42.000000000 +0100
> ++++ gnuplot-4.6.0/configure.in	2013-01-07 11:50:03.003804463 +0100
> +@@ -748,6 +748,16 @@
> + AC_ARG_WITH(lisp-files,dnl
> + [  --without-lisp-files    do not build emacs lisp files])
> +
> ++dnl Whether we want to build the demo files
> ++dnl Does nothing here, is passed on to the demo subdir
> ++AC_ARG_WITH(demo,dnl
> ++[  --without-demo    do not build demo files])

  AC_ARG_ENABLE would be more appropriate. It also allows you to merge 
the AC_CONFIG_SUBDIRS(demo) into the AC_ARG_ENABLE. It also means you 
don't need to add --without-doc to the .mk file, because it's already 
included in the common configure arguments.

> ++
> ++dnl Whether we want to build the doc files
> ++dnl Does nothing here, is passed on to the doc subdir
> ++AC_ARG_WITH(doc,dnl
> ++[  --without-doc    do not build doc files])
> ++
> + dnl Sort help/subtopic tables by row or column
> + AC_ARG_WITH(row-help,dnl
> + [  --with-row-help         format help and subtopic tables by row (default)
> +@@ -1200,6 +1210,24 @@
> + fi
> + AC_SUBST(LISPDIR)
> +
> ++dnl build demo files
> ++if test "$with_demo" != no; then
> ++  AC_CONFIG_SUBDIRS(demo)
> ++  DEMODIR=demo
> ++else
> ++  DEMODIR=
> ++fi
> ++AC_SUBST(DEMODIR)
> ++
> ++dnl build doc files
> ++if test "$with_doc" != no; then
> ++  AC_CONFIG_SUBDIRS(docs)
> ++  DOCDIR=docs

  There is already a 'docdir' variable, so I'm not sure that DOCDIR is a 
good choice. Don't really have a better suggestion, however.

> ++else
> ++  DOCDIR=
> ++fi
> ++AC_SUBST(DOCDIR)
> ++
> + dnl Substitute variables
> + AC_SUBST(PACKAGE)
> + AC_SUBST(VERSION_MAJOR)
> +Index: gnuplot-4.6.0/Makefile.am
> +===================================================================
> +--- gnuplot-4.6.0.orig/Makefile.am	2013-01-04 14:07:02.239120935 +0100
> ++++ gnuplot-4.6.0/Makefile.am	2013-01-07 11:51:12.034846363 +0100
> +@@ -1,7 +1,7 @@
> + ## Process this file with automake to produce Makefile.in -*-Makefile-*-
> + AUTOMAKE_OPTIONS = foreign 1.2h
> +
> +-SUBDIRS = config m4 term src docs $(LISPDIR) man demo tutorial share
> ++SUBDIRS = config m4 term src $(DOCDIR) $(LISPDIR) $(DEMODIR) man tutorial share

  It's probably not important, but I wouldn't swap the man and demo subdirs.


  Regards,
  Arnout

> +
> + EXTRA_DIST = BUGS CodeStyle Copyright FAQ.pdf GNUmakefile INSTALL INSTALL.gnu \
> + Makefile.maint PATCHLEVEL PGPKEYS PORTING README README.1ST \
> diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
> index 40c3021..98e4a72 100644
> --- a/package/gnuplot/gnuplot.mk
> +++ b/package/gnuplot/gnuplot.mk
> @@ -7,6 +7,7 @@ GNUPLOT_VERSION = 4.6.0
>   GNUPLOT_SOURCE = gnuplot-$(GNUPLOT_VERSION).tar.gz
>   GNUPLOT_SITE = http://superb-dca2.dl.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
>
> +GNUPLOT_AUTORECONF = YES
>   GNUPLOT_INSTALL_STAGING = YES
>
>   GNUPLOT_LICENSE = gnuplot license (open source)
> @@ -16,7 +17,8 @@ GNUPLOT_CONF_OPT = --without-x \
>   		--disable-raise-console \
>   		--disable-mouse \
>   	        --without-tutorial \
> -		--without-demo --disable-demo \
> +		--without-demo \
> +		--without-doc \
>   	        --without-row-help \
>   		--disable-history-file \
>   	        --without-lisp-files \
> diff --git a/package/gnuplot/gnuplot.patch b/package/gnuplot/gnuplot.patch
> deleted file mode 100644
> index 7053a46..0000000
> --- a/package/gnuplot/gnuplot.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -diff --git a/Makefile.am b/Makefile.am
> -index bc0f2b2..5c00fe5 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -1,7 +1,7 @@
> - ## Process this file with automake to produce Makefile.in -*-Makefile-*-
> - AUTOMAKE_OPTIONS = foreign 1.2h
> -
> --SUBDIRS = config m4 term src docs $(LISPDIR) man demo tutorial share
> -+SUBDIRS = config m4 term src $(LISPDIR) man tutorial share
> -
> - EXTRA_DIST = BUGS CodeStyle Copyright FAQ.pdf GNUmakefile INSTALL INSTALL.gnu \
> - Makefile.maint PATCHLEVEL PGPKEYS PORTING README README.1ST \
> -diff --git a/Makefile.in b/Makefile.in
> -index 71118bc..86df133 100644
> ---- a/Makefile.in
> -+++ b/Makefile.in
> -@@ -250,7 +250,7 @@ top_build_prefix = @top_build_prefix@
> - top_builddir = @top_builddir@
> - top_srcdir = @top_srcdir@
> - AUTOMAKE_OPTIONS = foreign 1.2h
> --SUBDIRS = config m4 term src docs $(LISPDIR) man demo tutorial share
> -+SUBDIRS = config m4 term src $(LISPDIR) man tutorial share
> - EXTRA_DIST = BUGS CodeStyle Copyright FAQ.pdf GNUmakefile INSTALL INSTALL.gnu \
> - Makefile.maint PATCHLEVEL PGPKEYS PORTING README README.1ST \
> - VERSION configure.vms pm3d win


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
