From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Aug 2016 17:00:07 +0200
Subject: [Buildroot] [PATCH] package/ustr: don't run ldconfig (and
 certainly not concurrently)
In-Reply-To: <1471096801-9875-1-git-send-email-yann.morin.1998@free.fr>
References: <1471096801-9875-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <28ed24c9-fb7d-e0ce-653d-993c01d1d341@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 [Back from a month in Benin with almost no Internet access - yey!]

On 13-08-16 16:00, Yann E. MORIN wrote:
> The ustr Makefile.in (as introduced by the Debian patch we apply), is
> probably not parallel-safe:
[snip]
> We fix that in three ways:
> 
>   - first, no need to run ldconfig at all in Buildroot, we just pass
>     LDCONFIG=/bin/true ;

 For Buildroot purposes, this is actually sufficient, no?

> 
>   - second, no need to run LDCONFIG more than once, so we patch ustr to
>     only run it once, once all libs have been installed;
> 
>   - third, we patch ustr to use ln -f to redo the symlink if it already
>     exists.
> 
> Fixes (hopefully, since I was not even able to reproduce the failure):
>     http://autobuild.buildroot.org/?reason=ustr-1.0.4
>     http://autobuild.buildroot.org/results/936/93626f55625ed7900c147bfd79ff7802366639b1/
>     http://autobuild.buildroot.org/results/18b/18b6ec537da9e9055f58a8649c0719dc64df1bcf/
>     [...]
> 
> [0] http://lists.busybox.net/pipermail/buildroot/2016-May/161923.html
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> ---
>  package/ustr/0001-run-ldconfig-only-once.patch | 34 ++++++++++++++++++++++
>  package/ustr/0002-ln-force.patch               | 39 ++++++++++++++++++++++++++
>  package/ustr/ustr.mk                           |  2 ++
>  3 files changed, 75 insertions(+)
>  create mode 100644 package/ustr/0001-run-ldconfig-only-once.patch
>  create mode 100644 package/ustr/0002-ln-force.patch
> 
> diff --git a/package/ustr/0001-run-ldconfig-only-once.patch b/package/ustr/0001-run-ldconfig-only-once.patch
> new file mode 100644
> index 0000000..594f985
> --- /dev/null
> +++ b/package/ustr/0001-run-ldconfig-only-once.patch
> @@ -0,0 +1,34 @@
> +Makefile: run ldconfig only once
> +
> +No need to run ldconfig for each library we install; we can run it once,
> +when both libs are installed.
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 Upstream status?

 Upstream is git so we prefer git patches.

> +
> +diff -durN ustr-1.0.4.orig/Makefile.in ustr-1.0.4/Makefile.in
> +--- ustr-1.0.4.orig/Makefile.in	2016-08-13 15:24:18.644185100 +0200
> ++++ ustr-1.0.4/Makefile.in	2016-08-13 15:25:46.437325978 +0200
> +@@ -400,6 +400,7 @@
> + 		@echo Done all dbg
> + 
> + install: install-opt install-dbg
> ++		$(LDCONFIG) -n $(DESTDIR)$(libdir)
> + 
> + install-opt: install-dirs install-opt-lib install-common
> + 
> +@@ -431,7 +432,6 @@
> + 		ln -s $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
> + 		-rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV_BSO)
> + 		ln -s $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV_BSO)
> +-		$(LDCONFIG) -n $(DESTDIR)$(libdir)
> + 		install -pm 644 -t $(DESTDIR)$(libdir)/pkgconfig ustr.pc
> + 
> + install-dbg-lib: $(DBG_LIB_STATIC) $(DBG_LIB_SHARED) ustr-debug.pc
> +@@ -444,7 +444,6 @@
> + 		ln -s $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
> + 		-rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV_BSO)
> + 		ln -s $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV_BSO)
> +-		$(LDCONFIG) -n $(DESTDIR)$(libdir)
> + 		install -pm 644 -t $(DESTDIR)$(libdir)/pkgconfig ustr-debug.pc
> + 
> + install-common:
> diff --git a/package/ustr/0002-ln-force.patch b/package/ustr/0002-ln-force.patch
> new file mode 100644
> index 0000000..18afe4d
> --- /dev/null
> +++ b/package/ustr/0002-ln-force.patch
> @@ -0,0 +1,39 @@
> +Makefile: forcibly create library symlinks
> +
> +Aboids failures when the symlink already exists (it is re-symlinked).
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +
> +diff -durN ustr-1.0.4.orig/Makefile.in ustr-1.0.4/Makefile.in
> +--- ustr-1.0.4.orig/Makefile.in	2016-08-13 15:54:40.220043291 +0200
> ++++ ustr-1.0.4/Makefile.in	2016-08-13 15:55:25.600641886 +0200
> +@@ -427,11 +427,11 @@
> + 		install -m 644 -t $(DESTDIR)$(libdir) $(OPT_LIB_STATIC)
> + 		install -m 755 -t $(DESTDIR)$(libdir) $(OPT_LIB_SHARED)
> + 		-rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
> +-		ln -s $(OPT_LIB_SHARED) $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
> ++		ln -fs $(OPT_LIB_SHARED) $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)

 This is fairly useless. 'ln -f' just does stat - unlink - symlink, so almost
the same as 'rm -f; ln -s'. There is a timing difference, so it makes the race
condition somewhat more difficult to hit, but it still exists. There is no
race-free way to do parallel symlinks.


> + 		-rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
> +-		ln -s $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
> ++		ln -fs $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
> + 		-rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV_BSO)
> +-		ln -s $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV_BSO)
> ++		ln -fs $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV_BSO)
> + 		install -pm 644 -t $(DESTDIR)$(libdir)/pkgconfig ustr.pc
> + 
> + install-dbg-lib: $(DBG_LIB_STATIC) $(DBG_LIB_SHARED) ustr-debug.pc
> +@@ -439,11 +439,11 @@
> + 		install -m 644 -t $(DESTDIR)$(libdir) $(DBG_LIB_STATIC)
> + 		install -m 755 -t $(DESTDIR)$(libdir) $(DBG_LIB_SHARED)
> + 		-rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)
> +-		ln -s $(DBG_LIB_SHARED) $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)
> ++		ln -fs $(DBG_LIB_SHARED) $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)
> + 		-rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
> +-		ln -s $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
> ++		ln -fs $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
> + 		-rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV_BSO)
> +-		ln -s $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV_BSO)
> ++		ln -fs $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV_BSO)
> + 		install -pm 644 -t $(DESTDIR)$(libdir)/pkgconfig ustr-debug.pc
> + 
> + install-common:
> diff --git a/package/ustr/ustr.mk b/package/ustr/ustr.mk
> index 174f055..1d629ab 100644
> --- a/package/ustr/ustr.mk
> +++ b/package/ustr/ustr.mk
> @@ -23,5 +23,7 @@ USTR_INSTALL_STAGING = YES
>  # 'all-shared' to the default 'all' rule.
>  USTR_MAKE_OPTS = all all-shared
>  
> +USTR_MAKE_OPTS += LDCONFIG=/bin/true

 Perhaps on the same line as _MAKE_OPTS above?

 Regards,
 Arnout

> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
