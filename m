From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 1 Apr 2016 17:54:47 +0200
Subject: [Buildroot] [V2 2/3] libtomcrypt: new package
In-Reply-To: <1459524973-26730-2-git-send-email-francois.perrad@gadz.org>
References: <1459524973-26730-1-git-send-email-francois.perrad@gadz.org>
 <1459524973-26730-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <CAGm1_kvytsVy0NdfBLfunZz9nj-N-FJzLexvbj86n_Dsh0fjXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 1, 2016 at 5:36 PM, Francois Perrad <fperrad@gmail.com> wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  package/Config.in                                  |  1 +
>  .../0001-install-without-USER-and-GROUP.patch      | 61 ++++++++++++++++++++++
>  package/libtomcrypt/Config.in                      | 11 ++++
>  package/libtomcrypt/libtomcrypt.hash               |  2 +
>  package/libtomcrypt/libtomcrypt.mk                 | 23 ++++++++
>  5 files changed, 98 insertions(+)
>  create mode 100644 package/libtomcrypt/0001-install-without-USER-and-GROUP.patch
>  create mode 100644 package/libtomcrypt/Config.in
>  create mode 100644 package/libtomcrypt/libtomcrypt.hash
>  create mode 100644 package/libtomcrypt/libtomcrypt.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 84df812..b38b24b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -839,6 +839,7 @@ menu "Crypto"
>         source "package/libsodium/Config.in"
>         source "package/libssh/Config.in"
>         source "package/libssh2/Config.in"
> +       source "package/libtomcrypt/Config.in"
>         source "package/libuecc/Config.in"
>         source "package/mbedtls/Config.in"
>         source "package/nettle/Config.in"
> diff --git a/package/libtomcrypt/0001-install-without-USER-and-GROUP.patch b/package/libtomcrypt/0001-install-without-USER-and-GROUP.patch
> new file mode 100644
> index 0000000..325d04b
> --- /dev/null
> +++ b/package/libtomcrypt/0001-install-without-USER-and-GROUP.patch
> @@ -0,0 +1,61 @@
> +install without USER and GROUP
> +
> +see https://github.com/libtom/libtomcrypt/pull/115
> +
> +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> +
> +diff --git a/makefile b/makefile
> +index f650ea1..b346bed 100644
> +--- a/makefile
> ++++ b/makefile
> +@@ -300,19 +300,19 @@ install: library docs
> + else
> + install: library
> + endif
> +-      install -d -g $(GROUP) -o $(USER) $(DESTDIR)$(LIBPATH)
> +-      install -d -g $(GROUP) -o $(USER) $(DESTDIR)$(INCPATH)
> +-      install -d -g $(GROUP) -o $(USER) $(DESTDIR)$(DATAPATH)
> +-      install -g $(GROUP) -o $(USER) $(LIBNAME) $(DESTDIR)$(LIBPATH)
> +-      install -g $(GROUP) -o $(USER) $(HEADERS) $(DESTDIR)$(INCPATH)
> ++      install -d $(DESTDIR)$(LIBPATH)
> ++      install -d $(DESTDIR)$(INCPATH)
> ++      install -d $(DESTDIR)$(DATAPATH)
> ++      install -m 644 $(LIBNAME) $(DESTDIR)$(LIBPATH)
> ++      install -m 644 $(HEADERS) $(DESTDIR)$(INCPATH)
> + ifndef NODOCS
> +-      install -g $(GROUP) -o $(USER) doc/crypt.pdf $(DESTDIR)$(DATAPATH)
> ++      install -m 644 doc/crypt.pdf $(DESTDIR)$(DATAPATH)
> + endif
> +
> + install_test: testprof/$(LIBTEST)
> +-      install -d -g $(GROUP) -o $(USER) $(DESTDIR)$(LIBPATH)
> +-      install -d -g $(GROUP) -o $(USER) $(DESTDIR)$(INCPATH)
> +-      install -g $(GROUP) -o $(USER) testprof/$(LIBTEST) $(DESTDIR)$(LIBPATH)
> ++      install -d $(DESTDIR)$(LIBPATH)
> ++      install -d $(DESTDIR)$(INCPATH)
> ++      install -m 644 testprof/$(LIBTEST) $(DESTDIR)$(LIBPATH)
> +
> + profile:
> +       CFLAGS="$(CFLAGS) -fprofile-generate" $(MAKE) timing EXTRALIBS="$(EXTRALIBS) -lgcov"
> +diff --git a/makefile.shared b/makefile.shared
> +index dd575d9..c5e97af 100644
> +--- a/makefile.shared
> ++++ b/makefile.shared
> +@@ -252,11 +252,11 @@ $(LIBNAME): $(OBJECTS) testprof/$(LIBTEST)
> +       libtool --silent --mode=link gcc $(CFLAGS) `find . -type f | grep "[.]lo" | grep "src/" | xargs` $(EXTRALIBS) -o $(LIBNAME) -rpath $(LIBPATH) -version-info $(VERSION)
> +
> + install: $(LIBNAME)
> +-      install -d -g $(GROUP) -o $(USER) $(DESTDIR)$(LIBPATH)
> +-      cd testprof ; CFLAGS="$(CFLAGS)" GROUP=$(GROUP) USER=$(USER) VERSION=$(VERSION) LIBPATH=$(LIBPATH) LIBTEST=$(LIBTEST) LIBTEST_S=$(LIBTEST_S) DESTDIR=$(DESTDIR) make -f makefile.shared install
> ++      install -d $(DESTDIR)$(LIBPATH)
> ++      cd testprof ; CFLAGS="$(CFLAGS)" VERSION=$(VERSION) LIBPATH=$(LIBPATH) LIBTEST=$(LIBTEST) LIBTEST_S=$(LIBTEST_S) DESTDIR=$(DESTDIR) make -f makefile.shared install
> +       libtool --silent --mode=install install -c libtomcrypt.la $(DESTDIR)$(LIBPATH)/libtomcrypt.la
> +-      install -d -g $(GROUP) -o $(USER) $(DESTDIR)$(INCPATH)
> +-      install -g $(GROUP) -o $(USER) $(HEADERS) $(DESTDIR)$(INCPATH)
> ++      install -d $(DESTDIR)$(INCPATH)
> ++      install -m 644 $(HEADERS) $(DESTDIR)$(INCPATH)
> +
> + #This rule makes the hash program included with libtomcrypt
> + hashsum: library
> +--
> +
> diff --git a/package/libtomcrypt/Config.in b/package/libtomcrypt/Config.in
> new file mode 100644
> index 0000000..6678b30
> --- /dev/null
> +++ b/package/libtomcrypt/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_LIBTOMCRYPT
> +       bool "libtomcrypt"
> +       select BR2_PACKAGE_LIBTOMMATH
> +       help
> +         LibTomCrypt is a fairly comprehensive, modular and portable
> +         cryptographic toolkit that provides developers with a vast array
> +         of well known published block ciphers, one-way hash functions,
> +         chaining modes, pseudo-random number generators, public key
> +         cryptography and a plethora of other routines.
> +
> +         http://www.libtom.net
> diff --git a/package/libtomcrypt/libtomcrypt.hash b/package/libtomcrypt/libtomcrypt.hash
> new file mode 100644
> index 0000000..562016d
> --- /dev/null
> +++ b/package/libtomcrypt/libtomcrypt.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256  e33b47d77a495091c8703175a25c8228aff043140b2554c08a3c3cd71f79d116  crypt-1.17.tar.bz2
> diff --git a/package/libtomcrypt/libtomcrypt.mk b/package/libtomcrypt/libtomcrypt.mk
> new file mode 100644
> index 0000000..073d6e7
> --- /dev/null
> +++ b/package/libtomcrypt/libtomcrypt.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# libtomcrypt
> +#
> +################################################################################
> +
> +LIBTOMCRYPT_VERSION = 1.17
> +LIBTOMCRYPT_SITE = https://github.com/libtom/libtomcrypt/releases/download/$(LIBTOMCRYPT_VERSION)
> +LIBTOMCRYPT_SOURCE = crypt-$(LIBTOMCRYPT_VERSION).tar.bz2
> +LIBTOMCRYPT_LICENSE = WTFPL
> +LIBTOMCRYPT_LICENSE_FILES = LICENSE
> +LIBTOMCRYPT_INSTALL_STAGING = YES
> +LIBTOMCRYPT_DEPENDENCIES = libtommath
> +
> +define LIBTOMCRYPT_BUILD_CMDS
> +       $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="-I./src/headers $(TARGET_CFLAGS) -DLTC_SOURCE -DLTM_DESC"
> +endef
> +
> +define LIBTOMCRYPT_INSTALL_STAGING_CMDS
> +       $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" NODOCS=1 install
> +endef
> +
> +$(eval $(generic-package))
> --
> 2.5.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
