From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Apr 2017 19:21:28 +0200
Subject: [Buildroot] [PATCH 1/2] librhash: new package
In-Reply-To: <20170418154815.51039-1-Vincent.Riera@imgtec.com>
References: <20170418154815.51039-1-Vincent.Riera@imgtec.com>
Message-ID: <b575ca99-a24f-188f-6b25-bcfe29bbc0f6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Vicente,

 What a horrible package this is :-)

On 18-04-17 17:48, Vicente Olivert Riera wrote:
[snip]
> diff --git a/package/librhash/Config.in b/package/librhash/Config.in
> new file mode 100644
> index 0000000..c3b552d
> --- /dev/null
> +++ b/package/librhash/Config.in
> @@ -0,0 +1,23 @@
> +config BR2_PACKAGE_LIBRHASH
> +	bool "librhash"
> +	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
> +	help
> +	  RHash is a console utility for calculation and verification of magnet

 Since librhash is the library, not the binary, I think you should take the help
text of the library:

	  LibRHash is a professional,  portable,  thread-safe  C library for
	  computing a wide variety of hash sums, such as  CRC32, MD4, MD5,
	  SHA1, SHA256, SHA512, SHA3, AICH, ED2K, Tiger, DC++ TTH, BitTorrent
	  BTIH,  GOST R 34.11-94, RIPEMD-160, HAS-160, EDON-R, Whirlpool and
	  Snefru.


> +	  links and a wide range of hash sums like CRC32, MD4, MD5, SHA1,
> +	  SHA256, SHA512, SHA3, AICH, ED2K, Tiger, DC++ TTH,  BitTorrent BTIH,
> +	  GOST R 34.11-94, RIPEMD-160, HAS-160, EDON-R, Whirlpool and Snefru.
> +
> +	  https://github.com/rhash/RHash
> +
> +if BR2_PACKAGE_LIBRHASH
> +
> +config BR2_PACKAGE_RHASH

 Sub-config options should always start with the package name, so e.g.
BR2_PACKAGE_LIBRHASH_PROGRAM (or _BINARY, or _TOOLS, or ...).

> +	bool "rhash binary"
> +	depends on !BR2_STATIC_LIBS

 I had a quick look at the Makefile, and it *looks* like the program can also be
built statically (with the "all" target). If this doesn't work for some reason,
please explain either in the commit log or in a comment.

> +	help
> +	  Install rhash binary as well
> +
> +comment "rhash binary needs a toolchain w/ dynamic library"
> +	depends on BR2_STATIC_LIBS
> +
> +endif
> diff --git a/package/librhash/librhash.hash b/package/librhash/librhash.hash
> new file mode 100644
> index 0000000..5efc3a6
> --- /dev/null
> +++ b/package/librhash/librhash.hash
> @@ -0,0 +1,3 @@
> +# From https://sourceforge.net/projects/rhash/files/rhash/1.3.4/
> +md5 0b51010604659e9e99f6307b053ba13b  rhash-1.3.4-src.tar.gz
> +sha1 411d8c7ba84fa9763bc49fa2fd3a7587712fd52c  rhash-1.3.4-src.tar.gz
> diff --git a/package/librhash/librhash.mk b/package/librhash/librhash.mk
> new file mode 100644
> index 0000000..79806c9
> --- /dev/null
> +++ b/package/librhash/librhash.mk
> @@ -0,0 +1,64 @@
> +################################################################################
> +#
> +# librhash
> +#
> +################################################################################
> +
> +LIBRHASH_VERSION = 1.3.4
> +LIBRHASH_SOURCE = rhash-$(LIBRHASH_VERSION)-src.tar.gz

 Since upstream calls it rhash, the package should also be called rhash. True,
it's a bit ambiguous since upstream calls the library librhash and we primarily
target the library. But you can also compare it to openssl, which bundles both
the library and the tool and upstream calls it just openssl.

> +LIBRHASH_SITE = https://sourceforge.net/projects/rhash/files/rhash/$(LIBRHASH_VERSION)
> +LIBRHASH_LICENSE = MIT
> +LIBRHASH_LICENSE_FILES = COPYING
> +LIBRHASH_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
> +LIBRHASH_DEPENDENCIES += gettext
> +LIBRHASH_ADDCFLAGS += -DUSE_GETTEXT
> +LIBRHASH_ADDLDFLAGS += -lintl
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
> +LIBRHASH_DEPENDENCIES += openssl
> +LIBRHASH_ADDCFLAGS += -DOPENSSL_RUNTIME -rdynamic
> +LIBRHASH_ADDLDFLAGS += -ldl

 Does the static lib work correctly in the SHARED_STATIC case? Well, you
probably need to pass explicit options when linking against librhash but that's
up to the user then.

 [Note: if you have indeed tried this, it is very useful to mention this
explicitly in the commit message.]

 Oh, is this part even relevant for the library only? Or is it only for building
the program?

> +endif
> +
> +ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> +LIBRHASH_BUILD_TARGETS = lib-static lib-shared build-shared
> +LIBRHASH_INSTALL_TARGETS = install-lib-static install-lib-shared install-so-link
> +else ifeq ($(BR2_SHARED_LIBS),y)
> +LIBRHASH_BUILD_TARGETS = lib-shared build-shared
> +LIBRHASH_INSTALL_TARGETS = install-lib-shared install-so-link
> +else
> +LIBRHASH_BUILD_TARGETS = lib-static
> +LIBRHASH_INSTALL_TARGETS = install-lib-static

 I have a slight preference for structuring it as

if SHARED
else if STATIC
else

for the simple reason that you're more likely to grep for either BR2_SHARED_LIBS
or BR2_STATIC_LIBS, not so much for BR2_SHARED_STATIC_LIBS.


> +endif
> +
> +define LIBRHASH_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> +		ADDCFLAGS="$(LIBRHASH_ADDCFLAGS)" ADDLDFLAGS="$(LIBRHASH_ADDLDFLAGS)" \

 I have a slight preference for setting this part in LIBRHASH_MAKE_OPTS and
passing those both in the build and in the install commands. And I would also
pass the PREFIX part already in the build commands, just in case it ever gets
used to construct a path to something.


> +		$(LIBRHASH_BUILD_TARGETS)
> +endef
> +
> +define LIBRHASH_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/librhash \
> +		DESTDIR="$(STAGING_DIR)" PREFIX="/usr" \
> +		$(LIBRHASH_INSTALL_TARGETS) install-headers

 From a quick look at the Makefile, it looked like those install targets also
work from the top-level (they just do an additional make -C). That would
simplify things a lot because you can just add 'install-shared' to install the
program, instead of needing a post-install hook. And of course it doesn't matter
if you install the program in staging as well - in fact I prefer it, ideally
staging is a superset of target.


 Regards,
 Arnout


> +endef
> +
> +define LIBRHASH_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/librhash \
> +		DESTDIR="$(TARGET_DIR)" PREFIX="/usr" \
> +		$(LIBRHASH_INSTALL_TARGETS)
> +endef
> +
> +ifeq ($(BR2_PACKAGE_RHASH),y)
> +define LIBRHASH_INSTALL_RHASH_BINARY
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> +		DESTDIR="$(TARGET_DIR)" PREFIX="/usr" \
> +		install-shared
> +endef
> +LIBRHASH_POST_INSTALL_TARGET_HOOKS += LIBRHASH_INSTALL_RHASH_BINARY
> +endif
> +
> +$(eval $(generic-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
