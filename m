From: Daniel Price <daniel.price@gmail.com>
Date: Tue, 8 Nov 2016 16:07:59 -0800
Subject: [Buildroot] [PATCH for/next] krb5: new package
In-Reply-To: <20161108005032.11340-1-arnout@mind.be>
References: <20161108005032.11340-1-arnout@mind.be>
Message-ID: <CAKduhSvzRJj12j1nzgqX+R5va0Z7RqWcOvGpz=q0WxTF+K+BZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks!  Based on the earlier recipe, we have krb5 and pam-krb5 at least
compiling.  We will get it installed and work on some testing.  I'll see if
I can get us rebased onto this patch.

Thank-you to the community.  I really appreciate the help.

     -dp

On Mon, Nov 7, 2016 at 4:50 PM, Arnout Vandecappelle (Essensium/Mind) <
arnout@mind.be> wrote:

> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Daniel Price <daniel.price@gmail.com>
> Cc: Charles Hardin <ckhardin@exablox.com>
> ---
> Note: I do NOT want to be added to DEVELOPERS for this package, it's
> just something I cobbled together quickly.
> ---
>  package/Config.in      |  1 +
>  package/krb5/Config.in | 13 ++++++++++++
>  package/krb5/krb5.hash |  2 ++
>  package/krb5/krb5.mk   | 55 ++++++++++++++++++++++++++++++
> ++++++++++++++++++++
>  4 files changed, 71 insertions(+)
>  create mode 100644 package/krb5/Config.in
>  create mode 100644 package/krb5/krb5.hash
>  create mode 100644 package/krb5/krb5.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 0d449dc..83ce629 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1189,6 +1189,7 @@ menu "Networking"
>         source "package/gupnp-dlna/Config.in"
>         source "package/ibrcommon/Config.in"
>         source "package/ibrdtn/Config.in"
> +       source "package/krb5/Config.in"
>         source "package/libcgi/Config.in"
>         source "package/libcgicc/Config.in"
>         source "package/libcoap/Config.in"
> diff --git a/package/krb5/Config.in b/package/krb5/Config.in
> new file mode 100644
> index 0000000..43fd799
> --- /dev/null
> +++ b/package/krb5/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_KRB5
> +       bool "krb5"
> +       depends on BR2_USE_MMU # fork()
> +       help
> +         KRB5 is the MIT Kerberos Version 5 implementation
> +
> +         Kerberos is a network authentication protocol. It is designed
> +         to provide strong authentication for client/server
> +         applications by using secret-key cryptography. A free
> +         implementation of this protocol is available from the
> +         Massachusetts Institute of Technology.
> +
> +         http://web.mit.edu/Kerberos
> diff --git a/package/krb5/krb5.hash b/package/krb5/krb5.hash
> new file mode 100644
> index 0000000..22cd970
> --- /dev/null
> +++ b/package/krb5/krb5.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated after checking pgp signature from
> https://web.mit.edu/kerberos/krb5-1.14/krb5-1.14.4.sig
> +sha256  03a61a4280c9161771fb39019085dbe6a57aa602080515ff93b43cd6137e0b95
> krb5-1.14.4.tar.gz
> diff --git a/package/krb5/krb5.mk b/package/krb5/krb5.mk
> new file mode 100644
> index 0000000..59603c5
> --- /dev/null
> +++ b/package/krb5/krb5.mk
> @@ -0,0 +1,55 @@
> +###########################################################
> #####################
> +#
> +# krb5
> +#
> +###########################################################
> #####################
> +
> +KRB5_VERSION_MAJOR = 1.14
> +KRB5_VERSION = $(KRB5_VERSION_MAJOR).4
> +KRB5_SITE = http://web.mit.edu/kerberos/dist/krb5/$(KRB5_VERSION_MAJOR)
> +KRB5_LICENSE = BSD-2c, others
> +KRB5_LICENSE_FILES = NOTICE
> +KRB5_SUBDIR = src
> +KRB5_INSTALL_STAGING = YES
> +
> +KRB5_CONF_ENV = \
> +       krb5_cv_attr_constructor_destructor=yes,yes \
> +       ac_cv_func_regcomp=yes \
> +       krb5_cv_sys_rcdir=/tmp \
> +       ac_cv_printf_positional=yes \
> +       WARN_CFLAGS='-Wall'
> +
> +KRB5_CONF_OPTS = \
> +       --without-tcl \
> +       --without-hesiod \
> +       --without-ldap \
> +       --without-libedit \
> +       --without-libreadline
> +
> +# No buildroot packages exist for these so use the bundled ones.
> +KRB5_CONF_OPTS += \
> +       --without-system-libverto \
> +       --without-system-ss \
> +       --without-system-et
> +
> +# Buildroot's berkeleydb does not provide API 1.85
> +KRB5_CONF_OPTS += --without-system-db
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +KRB5_CONF_OPTS += --enable-thread-support
> +else
> +KRB5_CONF_OPTS += --disable-thread-support
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +KRB5_CONF_OPTS += --with-crypto-impl=openssl
> +KRB5_DEPENDENCIES += openssl
> +else ifeq ($(BR2_PACKAGE_LIBNSS),y)
> +KRB5_CONF_OPTS += --with-crypto-impl=nss
> +KRB5_DEPENDENCIES += libnss
> +else
> +KRB5_CONF_OPTS += --with-crypto-impl=builtin
> +endif
> +
> +
> +$(eval $(autotools-package))
> --
> 2.10.2
>
>


-- 
Daniel.Price at gmail.com; Twitter: @danielbprice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161108/b474d382/attachment-0001.html>
