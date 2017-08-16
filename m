From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 16 Aug 2017 06:40:27 +0300
Subject: [Buildroot] [PATCH v2 1/2] whois: fix build with NLS disabled
In-Reply-To: <a73c8c9cceb698f9b2fa61339baa694087a00377.1502824481.git.baruch@tkos.co.il>
References: <a73c8c9cceb698f9b2fa61339baa694087a00377.1502824481.git.baruch@tkos.co.il>
Message-ID: <20170816034027.flnapeznknwvkllk@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Tue, Aug 15, 2017 at 10:14:40PM +0300, Baruch Siach wrote:
> whois build uses the xgettext utility to build translation files.
> This utility may not be available when NLS is disabled. Add a patch that
> allows skipping the generation of translation files. Use that to skip
> the translation when NLS is disabled.
> 
> Fixes:
> http://autobuild.buildroot.net/results/862/862d8165a59711c970c65d90009a527315a1a6b4/
> http://autobuild.buildroot.net/results/b62/b62ec9d6f350e409731d47ffb585344c516944e8/
> http://autobuild.buildroot.net/results/be2/be28d06ae004a46c87133d6f07709c6f909288d8/
> 
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2: patch to add HAVE_GETTEXT that allows disable for gettext (Thomas P)

Upstream rejected[1] the patch, basically suggesting the approach of v1[2], 
that is, make only the targets we want while omitting the gettext targets. So 
we can either carry this patch forever, or apply [2].

[1] https://github.com/rfc1036/whois/pull/58

[2] https://patchwork.ozlabs.org/patch/801031/

baruch

> ---
>  ...0001-Makefile-allow-build-without-gettext.patch | 54 ++++++++++++++++++++++
>  package/whois/whois.mk                             |  4 ++
>  2 files changed, 58 insertions(+)
>  create mode 100644 package/whois/0001-Makefile-allow-build-without-gettext.patch
> 
> diff --git a/package/whois/0001-Makefile-allow-build-without-gettext.patch b/package/whois/0001-Makefile-allow-build-without-gettext.patch
> new file mode 100644
> index 000000000000..ed27129fe37c
> --- /dev/null
> +++ b/package/whois/0001-Makefile-allow-build-without-gettext.patch
> @@ -0,0 +1,54 @@
> +From c75502b8b23a16704d02ae85fd325b181a8e909a Mon Sep 17 00:00:00 2001
> +From: Baruch Siach <baruch@tkos.co.il>
> +Date: Tue, 15 Aug 2017 21:50:18 +0300
> +Subject: [PATCH] Makefile: allow build without gettext
> +
> +Build fails when gettext is not installed, because the xgettext and
> +msgfmt utilities are not available. With this patch, setting
> +HAVE_GETTEXT to an empty string allows the build to succeed. This is
> +useful for space constrained targets where translation files are not
> +needed.
> +
> +Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> +---
> +Upstream status: https://github.com/rfc1036/whois/pull/58
> +
> + Makefile | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/Makefile b/Makefile
> +index 74ccb0063238..abe4a46a003a 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -58,6 +58,8 @@ endif
> + mkpasswd_LDADD += -lcrypt
> + endif
> + 
> ++HAVE_GETTEXT ?= YES
> ++
> + CPPFLAGS += $(DEFS) $(INCLUDES)
> + 
> + ##############################################################################
> +@@ -132,7 +134,9 @@ install-mkpasswd: mkpasswd
> + 	$(INSTALL) -m 0644 mkpasswd.1 $(BASEDIR)$(prefix)/share/man/man1/
> + 
> + install-pos:
> ++ifdef HAVE_GETTEXT
> + 	cd po && $(MAKE) install
> ++endif
> + 
> + distclean: clean
> + 	rm -f po/whois.pot
> +@@ -143,7 +147,9 @@ clean:
> + 	rm -f po/*.mo
> + 
> + pos:
> ++ifdef HAVE_GETTEXT
> + 	cd po && $(MAKE)
> ++endif
> + 
> + depend: Makefile.depend
> + Makefile.depend:
> +-- 
> +2.14.1
> +
> diff --git a/package/whois/whois.mk b/package/whois/whois.mk
> index f22446b83917..54966ac9073f 100644
> --- a/package/whois/whois.mk
> +++ b/package/whois/whois.mk
> @@ -27,6 +27,10 @@ WHOIS_DEPENDENCIES += libidn
>  WHOIS_MAKE_ENV += HAVE_LIBIDN=1
>  endif
>  
> +ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
> +WHOIS_MAKE_ENV += HAVE_GETTEXT=
> +endif
> +
>  define WHOIS_BUILD_CMDS
>  	$(WHOIS_MAKE_ENV) $(MAKE) $(WHOIS_MAKE_OPTS) -C $(@D)
>  endef

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
