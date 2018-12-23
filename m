From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Dec 2018 22:21:27 +0100
Subject: [Buildroot] [PATCH 2/2] package/gettext-tiny: Add new package
In-Reply-To: <20181223150448.21980-3-vadim4j@gmail.com>
References: <20181223150448.21980-1-vadim4j@gmail.com>
 <20181223150448.21980-3-vadim4j@gmail.com>
Message-ID: <20181223212127.GA24194@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vadim, All,

On 2018-12-23 17:04 +0200, Vadim Kochan spake thusly:
> Add gettext-tiny package from the sabotage-linux project:
> 
> gettext-tiny provides lightweight replacements for tools typically used
> from the GNU gettext suite, which is incredibly bloated and takes a lot
> of time to build (in the order of an hour on slow devices). the most
> notable component is msgfmt which is used to create binary translation
> files in the .mo format out of textual input files in .po format. this
> is the most important tool for building software from source, because it
> is used from the build processes of many software packages.

I know you copy-pasted this part from upstream's README, but that is not
the important thing we want to see in a commit log.

A commit log should explain the tricks and treats of a change: why it is
needed, how it was made to work, why we have specific stuff that is not
obvious.

For example...

> Some files were taken from built gettext gnu (po/* and gettextize) to
> make possible perform gettextizing of packages. They will be removed
> once they will be added to the gettext-tiny project.

... why do we need to carry those files at all?

Her's what you could have said about ABOUT-NLS:

    ABOUT-NLS only exists because, when a package uses gettect,
    autoreconf expects that file to exist, which is usually done
    by gettextize.

However ABOUT-NLS is *huge*, and I dobt autoreconf really requires that
exact file. We could provide just a stub, that is created at build time,
like so:

    define HOST_GETTEXT_TINY_ABOUT_NLS
        $(Q)mkdir -p $(HOST_DIR)/share/gettext-tiny
        $(Q)touch $(HOST_DIR)/share/gettext-tiny/ABOUT-NLS
    endef
    HOST_GETTEXT_TINY_POST_INSTALL_HOOKS += HOST_GETTEXT_TINY_ABOUT_NLS

That would cut out about 1/3rd of that big patch. ;-)

For gettextize itself, I guess there is not much we can do about... I
was thinking we could maybe use:

    GETTEXT_TINY_EXTRA_DOWNLOADS = https://git.savannah.gnu.org/cgit/gettext.git/tree/gettext-tools/misc/gettextize.in?h=v0.19.8.1

and then sed the place holders, but that's not so nice, and anyway there
are a bunch of other files to handle as well... It's just that
gettextize is so huge too... :-/

But we could maybe do something like:

    GETTEXT_TINY_GRAB_GETTEXT_FILES_URI = https://git.savannah.gnu.org/cgit/gettext.git/tree
    GETTEXT_TINY_GRAB_GETTEXT_FILES_VERSION = v0.19.8.1
    GETTEXT_TINY_GRAB_GETTEXT_FILES = \
        gettext-runtime/po/Makefile.in.in \
        gettext-tools/misc/gettextize.in \
        gettext-tools/po/Makevars.template \
        [...]

    GETTEXT_TINY_EXTRA_DOWNLOADS = \
        $(patsubst %,\
            $(GETTEXT_TINY_GRAB_GETTEXT_FILES_URI)/%?h=$(GETTEXT_TINY_GRAB_GETTEXT_FILES_VERSION),\
            $(GETTEXT_TINY_GRAB_GETTEXT_FILES))

    define HOST_GETTEXT_TINY_COPY_FILE
        $(foreach f,$(GETTEXT_TINY_GRAB_GETTEXT_FILES),\
            cp $(GETTEXT_TINY_DL_DIR)/$(notdir $(f)) $(@D)/$(notdir $(f))
        )
    endef
    HOST_GETTEXT_TINY_POST_EXTRACT_HOOKS += HOST_GETTEXT_TINY_COPY_FILE

    define HOST_GETTEXT_TINY_BUILD_CMDS
        cp $(@D)/gettetize.in $(@D)/gettextize
        $(SED) 's, at prefix@,$(HOST_DIR,; [...]' $(@D)/gettextize
    endef

    define HOST_GETTEXT_TINY_INSTALL_CMDS
        $(INSTALL) -m 0755 -D $(@D)/gettextize $(HOST_DIR)/bin/gettextize
    endef

(and so on for extra files. Untested, use with caution; may contain nuts.)

> Allow to select it to be as gettext gnu alternative for the host &
> target builds.
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/gettext-tiny/0001-libintl-Fix-format-not-a-string-literal-error-for-gc.patch b/package/gettext-tiny/0001-libintl-Fix-format-not-a-string-literal-error-for-gc.patch
> new file mode 100644
> index 0000000000..57a7f3dd53
> --- /dev/null
> +++ b/package/gettext-tiny/0001-libintl-Fix-format-not-a-string-literal-error-for-gc.patch
> @@ -0,0 +1,51 @@
> +From 9483ad60f8a39d2e8173add070ecb9839a54d140 Mon Sep 17 00:00:00 2001
> +From: Vadim Kochan <vadim.kochan@petcube.com>
> +Date: Sun, 21 Oct 2018 11:16:14 +0300
> +Subject: [PATCH] libintl: Add 'format_arg' attribute

You need to give a little bit more details here, because it is not a
trivial patch, and it is not obvious what's going on.

Also the filename doest not match the title:
    0001-libintl-Fix-format-not-a-string-literal-error-for-gc.patch
vs.
    libintl: Add 'format_arg' attribute

Also, did you try to submit this patch upstream? (you should.)

> +Signed-off-by: Vadim Kochan <vadim.kochan@petcube.com>
> +---
> + include/libintl.h | 27 +++++++++++++++++++++------
> + 1 file changed, 21 insertions(+), 6 deletions(-)
> +
> +diff --git a/include/libintl.h b/include/libintl.h
> +index b7123a9..173b3f3 100644
> +--- a/include/libintl.h
> ++++ b/include/libintl.h
> +@@ -1,12 +1,27 @@
> + #ifndef LIBINTL_H
> + #define LIBINTL_H
> + 
> +-char *gettext(const char *msgid);
> +-char *dgettext(const char *domainname, const char *msgid);
> +-char *dcgettext(const char *domainname, const char *msgid, int category);
> +-char *ngettext(const char *msgid1, const char *msgid2, unsigned long n);
> +-char *dngettext(const char *domainname, const char *msgid1, const char *msgid2, unsigned long n);
> +-char *dcngettext(const char *domainname, const char *msgid1, const char *msgid2, unsigned long n, int category);
> ++/* _INTL_MAY_RETURN_STRING_ARG(n) declares that the given function may return
> ++ *    its n-th argument literally.  This enables GCC to warn for example about
> ++ *       printf (gettext ("foo %y")).  */
> ++#if defined __GNUC__ && __GNUC__ >= 3 && !(defined __APPLE_CC__ && __APPLE_CC__ > 1 && defined __cplusplus)
> ++# define _INTL_MAY_RETURN_STRING_ARG(n) __attribute__ ((__format_arg__ (n)))
> ++#else
> ++# define _INTL_MAY_RETURN_STRING_ARG(n)
> ++#endif

It looks like you took the code verbatime from GNU gettext, but that
code is LGPLv2.1-or-later, while gettext-tiny is MIT. Both licenses
are compatible, but then you have to update the licensing terms in
gettext-tiny.mk.

Alternatively, I would prefer if code of your own were to be used,
without copying the coe from GNU gettext. Can you try to provide
something? Hint: we don;t need the Apple stuff because we're only ever
on Linux, and the oldest gcc version we support is 4.3.

> ++char *gettext(const char *msgid)
> ++	_INTL_MAY_RETURN_STRING_ARG(1);
> ++char *dgettext(const char *domainname, const char *msgid)
> ++	_INTL_MAY_RETURN_STRING_ARG(2);
> ++char *dcgettext(const char *domainname, const char *msgid, int category)
> ++	_INTL_MAY_RETURN_STRING_ARG(2);
> ++char *ngettext(const char *msgid1, const char *msgid2, unsigned long n)
> ++	_INTL_MAY_RETURN_STRING_ARG(1) _INTL_MAY_RETURN_STRING_ARG(2);
> ++char *dngettext(const char *domainname, const char *msgid1, const char *msgid2, unsigned long n)
> ++	_INTL_MAY_RETURN_STRING_ARG(2) _INTL_MAY_RETURN_STRING_ARG(3);
> ++char *dcngettext(const char *domainname, const char *msgid1, const char *msgid2, unsigned long n, int category)
> ++	_INTL_MAY_RETURN_STRING_ARG(2) _INTL_MAY_RETURN_STRING_ARG(3);
> + 
> + char *textdomain(const char *domainname);
> + char *bind_textdomain_codeset(const char *domainname, const char *codeset);
> +-- 
> +2.14.1
> +
> diff --git a/package/gettext-tiny/0002-libintl-Use-gettext-wrappers-if-NLS-is-disabled.patch b/package/gettext-tiny/0002-libintl-Use-gettext-wrappers-if-NLS-is-disabled.patch
> new file mode 100644
> index 0000000000..a6a4fcb892
> --- /dev/null
> +++ b/package/gettext-tiny/0002-libintl-Use-gettext-wrappers-if-NLS-is-disabled.patch
> @@ -0,0 +1,26 @@
> +From 8d6897b7b9df3dc8228fcdab42bcb9a915b64cef Mon Sep 17 00:00:00 2001
> +From: Vadim Kochan <vadim.kochan@petcube.com>
> +Date: Sun, 21 Oct 2018 19:00:03 +0300
> +Subject: [PATCH] libintl: Use gettext wrappers if NLS is disabled

Ditto, you need to provide a bit more explanations here.

However, can't we just include -LIBINTL_NO_MACROS=1 in our CPPFLAGS,
instead? E.g.:

    diff --git a/package/Makefile.in b/package/Makefile.in
    index 44761b79c5..95b6825aa3 100644
    --- a/package/Makefile.in
    +++ b/package/Makefile.in
    @@ -159,6 +159,7 @@ TARGET_HARDENED += -D_FORTIFY_SOURCE=2
     endif
     
     TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
    +TARGET_CPPFLAGS += $(if $(BR2_PACKAGE_GETTEXT_TINY),-DLIBINTL_NO_MACROS=1)
     TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) $(TARGET_HARDENED)
     TARGET_CXXFLAGS = $(TARGET_CFLAGS)
     TARGET_FCFLAGS = $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)

[--SNIP--]
> diff --git a/package/gettext-tiny/gettext-tiny.hash b/package/gettext-tiny/gettext-tiny.hash
> new file mode 100644
> index 0000000000..3b0b73d047
> --- /dev/null
> +++ b/package/gettext-tiny/gettext-tiny.hash
> @@ -0,0 +1,2 @@
> +# Locally Computed:
> +sha256 40a003e850ae8c29b8e6e6321925596c3a57d7ae8296d880dc1e88a07aebcd93  gettext-tiny-f733dd3fdd7be973f523a464165aae827a17d838.tar.gz

Here, you'll need to add a hash file for each file in EXTRA_DOWNLOADS.

> diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
> new file mode 100644
> index 0000000000..cd4fdc9005
> --- /dev/null
> +++ b/package/gettext-tiny/gettext-tiny.mk
> @@ -0,0 +1,84 @@
> +################################################################################
> +#
> +# gettext-tiny
> +#
> +################################################################################
> +
> +GETTEXT_TINY_VERSION = f733dd3fdd7be973f523a464165aae827a17d838

Why don't you use a version? 0.3.1 has just been released, although it
needs a backport:

    https://github.com/sabotage-linux/gettext-tiny/releases/tag/v0.3.1
    https://github.com/sabotage-linux/gettext-tiny/commit/58187329ad9f00eb8c39379e7ee0b608dd14bab8

I think I prefer if we were to use a released version and carry a
baclported patch, rather than point to an arbitrary git commit...

> +GETTEXT_TINY_SITE = $(call github,sabotage-linux,gettext-tiny,$(GETTEXT_TINY_VERSION))
> +GETTEXT_TINY_LICENSE = MIT
> +GETTEXT_TINY_INSTALL_STAGING = YES
> +GETTEXT_TINY_LICENSE_FILES = LICENSE
> +GETTEXT_TINY_PROVIDES = gettext
> +
> +ifneq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
> +GETTEXT_TINY_OPTS = LIBINTL=NONE
> +endif
> +
> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +GETTEXT_TINY_OPTS = LIBINTL=MUSL
> +endif

These two conditions do not seem to be mutually exclusive on first
sight, and they are not: BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL is 'y'
only for glibc, so under musl the first condition is true, and the
second is true too, so we end up with GETTEXT_TINY_OPTS = LIBINTL=MUSL

I don't know if this is what we want, but it looks like it (given the
explanations in their README).

However, when using uClibc-ng, we end up with the first definition,
GETTEXT_TINY_OPTS = LIBINTL=NONE.

For that last one, I am a bit more skeptical. I still think we should
provide aminimalist libintl, and thus we should use LIBINTL=NOOP

> +ifeq ($(BR2_ENABLE_LOCALE),)
> +GETTEXT_TINY_DEPENDENCIES = libiconv
> +endif
> +
> +define GETTEXT_TINY_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		$(GETTEXT_TINY_OPTS)
> +endef
> +
> +define HOST_GETTEXT_TINY_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
> +		$(HOST_CONFIGURE_OPTS) \
> +		$(GETTEXT_TINY_OPTS)
> +endef
> +
> +define HOST_GETTEXT_TINY_INSTALL_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
> +		$(HOST_CONFIGURE_OPTS) \
> +		prefix=$(HOST_DIR) install
> +
> +	$(INSTALL) -D -m 0755 $(GETTEXT_TINY_PKGDIR)/files/gettextize \
> +		$(HOST_DIR)/bin
> +	$(SED) "s:@prefix@:$(HOST_DIR):" $(HOST_DIR)/bin/gettextize
> +
> +	cp -r $(GETTEXT_TINY_PKGDIR)/files/po \
> +		$(HOST_DIR)/share/gettext-tiny

This is not going to work if $(HOST_DIR)/share does not already exist,
so you need to create it first.

Also, if $(HOST_DIR)/share/gettext-tiny already exists, it will create a
sub-directory po/ in it.

Usually, we do something like:

    mkdir -p $(HOST_DIR)/share/gettext-tiny
    cp -a $(GETTEXT_TINY_PKGDIR)/files/po/* \
        $(HOST_DIR)/share/gettext-tiny/

However, given my suggestion, earlier, you may have to adapt the new
location of files. ;-)

> +endef
> +
> +define GETTEXT_TINY_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		DESTDIR=$(STAGING_DIR) prefix=/usr install
> +endef
> +
> +define GETTEXT_TINY_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
> +		DESTDIR=$(TARGET_DIR) prefix=/usr install
> +endef
> +
> +define GETTEXT_TINY_REMOVE_UNNEEDED
> +	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/gettext-tiny
> +endef
> +
> +GETTEXT_TINY_POST_INSTALL_TARGET_HOOKS += GETTEXT_TINY_REMOVE_UNNEEDED

Since this is a generic package, it is not really necessary to define
post-install hooks. Just include that in GETTEXT_TINY_INSTALL_TARGET_CMDS:

    define GETTEXT_TINY_INSTALL_TARGET_CMDS
        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
            DESTDIR=$(TARGET_DIR) prefix=/usr install
        rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/gettext-tiny
    endef

> +# autoreconf expects gettextize to install ABOUT-NLS
> +define HOST_GETTEXT_TINY_ADD_ABOUT_NLS
> +	$(INSTALL) -m 0644 $(GETTEXT_TINY_PKGDIR)/files/ABOUT-NLS \
> +		$(HOST_DIR)/share/gettext-tiny/ABOUT-NLS
> +endef
> +
> +HOST_GETTEXT_TINY_POST_INSTALL_HOOKS += HOST_GETTEXT_TINY_ADD_ABOUT_NLS

Ditto, include that directly in HOST_GETTEXT_TINY_INSTALL_CMDS

> +ifeq ($(BR2_PACKAGE_GETTEXT_TINY),y)
> +GETTEXTIZE = $(HOST_CONFIGURE_OPTS) \
> +	     AUTOM4TE=$(HOST_DIR)/bin/autom4te \
> +	     gettext_datadir=$(HOST_DIR)/usr/share/gettext-tiny \
> +	     $(HOST_DIR)/bin/gettextize -f
> +endif
> +
> +$(eval $(generic-package))
> +$(eval $(host-generic-package))
> diff --git a/package/gettext/Config.in b/package/gettext/Config.in
> index 9546468571..176c771161 100644
> --- a/package/gettext/Config.in
> +++ b/package/gettext/Config.in
> @@ -7,7 +7,7 @@ if BR2_PACKAGE_GETTEXT
>  config BR2_PACKAGE_GETTEXT_GNU
>  	bool "gettext-gnu"
>  	default y
> -	depends on BR2_USE_WCHAR
> +	depends on BR2_USE_WCHAR && !BR2_PACKAGE_GETTEXT_TINY

I think here we need to use a choice, as is done for example for the
jpeg libraries, in package/jpeg/Config.in.

>  	help
>  	  The GNU `gettext' utilities are a set of tools that provide a
>  	  framework to help other GNU packages produce multi-lingual
> @@ -22,6 +22,20 @@ config BR2_PACKAGE_GETTEXT_GNU
>  comment "gettext-gnu needs a toolchain w/ wchar"
>  	depends on !BR2_USE_WCHAR
>  
> +comment "gettext-gnu can't be enabled with gettext-tiny"
> +	depends on BR2_PACKAGE_GETTEXT_TINY
> +
> +config BR2_PACKAGE_GETTEXT_TINY
> +	bool "gettext-tiny"
> +	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
> +	help
> +	  gettext-tiny provides lightweight replacements for tools typically
> +	  used from the GNU gettext suite, which is incredibly bloated and
> +	  takes a lot of time to build (in the order of an hour on slow
> +	  devices).
> +
> +	  https://github.com/sabotage-linux/gettext-tiny
> +
>  config BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL
>  	bool
>  	default y if BR2_SYSTEM_ENABLE_NLS
> @@ -30,12 +44,14 @@ config BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL
>  config BR2_PACKAGE_PROVIDES_GETTEXT
>  	string
>  	default "gettext-gnu" if BR2_PACKAGE_GETTEXT_GNU
> +	default "gettext-tiny" if BR2_PACKAGE_GETTEXT_TINY
>  
>  config BR2_PACKAGE_HAS_GETTEXT
>  	bool
>  
>  config BR2_PACKAGE_PROVIDES_HOST_GETTEXT
>  	string
> -	default "host-gettext-gnu"
> +	default "host-gettext-gnu" if BR2_PACKAGE_GETTEXT_GNU
> +	default "host-gettext-tiny" if BR2_PACKAGE_GETTEXT_TINY

It does not sound logical that the host variant depends on the target
variant.

However, it makes sense: if one chooses the full-fledged GNU gettext for
the target, they really want to have treu localisation, so they need the
full gettext tools at build time too. However, if one chooses the
lightweight gettext-tiny on the target, they do not care about
localisation, so they don;t need the full tool suite at build either.

If my reasoning stands, then this should be explained in the commit log.

Thanks for working on this hard topic! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
