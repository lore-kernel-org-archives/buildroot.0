From: Kamel Bouhara <kamel.bouhara@bootlin.com>
Date: Tue, 7 Jul 2020 09:36:17 +0200
Subject: [Buildroot] [PATCH] package/cryptopp: add a target build
 configuration
In-Reply-To: <20200706182458.033bd268@windsurf>
References: <20200706153128.428098-1-kamel.bouhara@bootlin.com>
 <20200706182458.033bd268@windsurf>
Message-ID: <20200707073617.GF2116@kb-xps>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 06, 2020 at 06:24:58PM +0200, Thomas Petazzoni wrote:
> Hello,
>

Hello,

> Thanks for the patch! See below for some comments.
>
> On Mon,  6 Jul 2020 17:31:28 +0200
> Kamel Bouhara <kamel.bouhara@bootlin.com> wrote:
>
> >  package/Config.in                             |  1 +
> >  ...ied-SONAME-to-shared-object-for-Linu.patch | 27 ++++++++++++++
> >  package/cryptopp/Config.in                    |  4 +++
> >  package/cryptopp/Config.in.host               |  4 +++
>
> This file is added, but not used anywhere. In fact, we don't need it at
> all.
>

Ok thanks.

>
> > diff --git a/package/cryptopp/0001-Add-fully-qualified-SONAME-to-shared-object-for-Linu.patch b/package/cryptopp/0001-Add-fully-qualified-SONAME-to-shared-object-for-Linu.patch
> > new file mode 100644
> > index 0000000000..e7edc76313
> > --- /dev/null
> > +++ b/package/cryptopp/0001-Add-fully-qualified-SONAME-to-shared-object-for-Linu.patch
> > @@ -0,0 +1,27 @@
> > +From 78eb43f50978ffd780cf31b1cea6736dadc6b155 Mon Sep 17 00:00:00 2001
> > +From: Kamel Bouhara <kamel.bouhara@bootlin.com>
> > +Date: Mon, 6 Jul 2020 17:10:55 +0200
> > +Subject: [PATCH] Add fully-qualified SONAME to shared object for Linux
> > +
> > +From: http://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html
> > +
> > +Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> > +---
> > + GNUmakefile | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/GNUmakefile b/GNUmakefile
> > +index e7b7b3a6..730e2a6f 100755
> > +--- a/GNUmakefile
> > ++++ b/GNUmakefile
> > +@@ -1256,6 +1256,7 @@ ifneq ($(wildcard libcryptopp.so$(SOLIB_VERSION_SUFFIX)),)
> > + 	$(CHMOD) 0755 $(DESTDIR)$(LIBDIR)/libcryptopp.so$(SOLIB_VERSION_SUFFIX)
> > + ifeq ($(HAS_SOLIB_VERSION),1)
> > + 	-$(LN) libcryptopp.so$(SOLIB_VERSION_SUFFIX) $(DESTDIR)$(LIBDIR)/libcryptopp.so
> > ++	-$(LN) libcryptopp.so$(SOLIB_VERSION_SUFFIX) $(DESTDIR)$(LIBDIR)/libcryptopp.so$(SOLIB_COMPAT_SUFFIX)
>
> Is there something creating the .so symlink then ?
>

Actually the .so is the realname here which is not the way it should be
as I understand the shared libs conventions, here it should be:

 - libcryptopp.so$(SOLIB_VERSION_SUFFIX} -> realname, not a symlink
 - libcryptopp.so -> symlink to realname
 - libcryptopp.so$(SOLIB_COMPAT_SUFFIX) -> symlink to realname

Is it right ?

>
> > +	  A free C++ class library of cryptographic schemes
> > diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
> > index f1d19386ab..f62713a2cd 100644
> > --- a/package/cryptopp/cryptopp.mk
> > +++ b/package/cryptopp/cryptopp.mk
> > @@ -12,26 +12,46 @@ CRYPTOPP_LICENSE_FILES = License.txt
> >  CRYPTOPP_INSTALL_STAGING = YES
> >
> >  define HOST_CRYPTOPP_EXTRACT_CMDS
> > -	$(UNZIP) $(HOST_CRYPTOPP_DL_DIR)/$(CRYPTOPP_SOURCE) -d $(@D)
> > +       $(UNZIP) $(HOST_CRYPTOPP_DL_DIR)/$(CRYPTOPP_SOURCE) -d $(@D)
>
> You've broken the indentation here: a TAB is correct, your change to
> spaces is not. This is an issue globally.

Sorry, I'll fix that.

>
> >  endef
> >
> > -HOST_CRYPTOPP_CXXFLAGS = $(HOST_CFLAGS) -fPIC
> > -
> >  # _mm256_broadcastsi128_si256 has been added only in gcc 4.9
> >  ifneq ($(BR2_HOST_GCC_AT_LEAST_4_9),y)
>
> So you're testing the host compiler capabilities...
>
> > -HOST_CRYPTOPP_CXXFLAGS += -DCRYPTOPP_DISABLE_AVX2
> > +	CRYPTOPP_CXXFLAGS = -DCRYPTOPP_DISABLE_AVX2
>
> ... to then decide something compiled for the target ? Not good.
>
> >  endif
>
> You need to keep separate HOST_CRYPTOPP_CXXFLAGS and CRYPTOPP_CXXFLAGS,
> and test on the compiler version separately, as the host compiler and
> target compiler can be different.
>

Indeed, I missed that for the target

> Note that on the target variant, you need to test a configuration with
> static libraries only, because you're passing unconditionally -fPIC and
> the Makefile seems to be building only shared libraries, so that will
> likely fail on static only configuration. Perhaps a "depends on
> !BR2_STATIC_LIBS" is needed in the Config.in.
>
> >  HOST_CRYPTOPP_MAKE_OPTS = \
> > -	$(HOST_CONFIGURE_OPTS) \
> > -	CXXFLAGS="$(HOST_CRYPTOPP_CXXFLAGS)"
> > +       $(HOST_CONFIGURE_OPTS) \
> > +       CXXFLAGS="$(HOST_CFLAGS) -fPIC $(CRYPTOPP_CXXFLAGS)"
> >
> >  define HOST_CRYPTOPP_BUILD_CMDS
> > -	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_CRYPTOPP_MAKE_OPTS) shared
> > +       $(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_CRYPTOPP_MAKE_OPTS) shared
> >  endef
> >
> >  define HOST_CRYPTOPP_INSTALL_CMDS
> > -	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install-lib
> > +       $(HOST_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install-lib
> > +endef
>
> Please fix the indentation. It seems like you didn't review the diff
> you're sending.
>
> > +CRYPTOPP_MAKE_OPTS = \
> > +	$(TARGET_CONFIGURE_OPTS) \
> > +	CXXFLAGS="$(TARGET_CFLAGS) -fPIC $(CRYPTOPP_CXXFLAGS)"
> > +
> > +define CRYPTOPP_EXTRACT_CMDS
> > +       $(UNZIP) $(CRYPTOPP_DL_DIR)/$(CRYPTOPP_SOURCE) -d $(@D)
> > +endef
> > +
> > +define CRYPTOPP_BUILD_CMDS
> > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(CRYPTOPP_MAKE_OPTS) shared
>
> Ah, there's a "shared" target, so in fact perhaps it can also build a
> static library ?
>

Yes, by default the static library is built.

> > +define CRYPTOPP_INSTALL_TARGET_CMDS
> > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(TARGET_DIR) install-lib
> > +endef
> > +
> > +define CRYPTOPP_INSTALL_STAGING_CMDS
> > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(STAGING_DIR)/usr libcryptopp.pc
> > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(STAGING_DIR)/usr install-lib
>
> It is strange that the PREFIX is just $(TARGET_DIR) in one case, and
> $(STAGING_DIR)/usr in the other. Could you explain ?
>

This shall be "/usr" in any case.

Thanks for the review,

Best regards,
Kamel

> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
