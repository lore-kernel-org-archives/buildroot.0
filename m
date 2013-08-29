From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 29 Aug 2013 23:32:18 +0200
Subject: [Buildroot] [PATCH 1/2] libssh2: add support for new package
 libssh2
In-Reply-To: <1377804423-31230-2-git-send-email-rjbarnet@rockwellcollins.com>
References: <1377804423-31230-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1377804423-31230-2-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <521FBDE2.9060104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Ryan,

  Thank you for your patch. A few comments below. Care to fix and resubmit?

On 08/29/13 21:27, Ryan Barnett wrote:
> Adding new package - libssh2 - under
> Target packages > Libraries > Crypto > libssh2
>
> libssh2 is a client-side C library implementing the SSH2 protocol.
>
> For more information on this package - see their website:
> http://www.libssh2.org/

  For new packages, we usually limit the commit message to:

libssh2: new package

  The rest is obvious from the patch itself.

>
> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> ---
>   package/Config.in          |    1 +
>   package/libssh2/Config.in  |   18 ++++++++++++++++
>   package/libssh2/libssh2.mk |   49 ++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 68 insertions(+), 0 deletions(-)
>   create mode 100644 package/libssh2/Config.in
>   create mode 100644 package/libssh2/libssh2.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 97cd7da..668f550 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -424,6 +424,7 @@ source "package/libmcrypt/Config.in"
>   source "package/libmhash/Config.in"
>   source "package/libnss/Config.in"
>   source "package/libsha1/Config.in"
> +source "package/libssh2/Config.in"
>   source "package/nettle/Config.in"
>   source "package/openssl/Config.in"
>   source "package/polarssl/Config.in"
> diff --git a/package/libssh2/Config.in b/package/libssh2/Config.in
> new file mode 100644
> index 0000000..73df86e
> --- /dev/null
> +++ b/package/libssh2/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_LIBSSH2
> +	bool "libssh2"
> +	help
> +	  libssh2 is a client-side C library implementing the SSH2 protocol
> +	  as defined by Internet Drafts: SECSH-TRANS(22), SECSH-USERAUTH(25),
> +	  SECSH-CONNECTION(23), SECSH-ARCH(20), SECSH-FILEXFER(06)*,
> +	  SECSH-DHGEX(04), and SECSH-NUMBERS(10)
> +
> +	  The package has support to use either OpenSSL or libgcrypt for
> +	  cryptographic operations. Please select one of these packages in
> +	  build configuration
> +
> +	  The package will default to selecting OpenSSL if neither libgcrypt
> +	  or OpenSSL are selected. Also if OpenSSL and libgcrypt are both present,
> +	  OpenSSL will be used over libgcrypt.

  We don't usually write all these details. Something like

	  This package uses either OpenSSL or libgcrypt for cryptographic
	  operations.

  Also, you should select the appropriate package:

	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBGCRYPT

  However, I would rather default to libgcrypt, which is much smaller 
than openssl.

> +
> +	  http://www.libssh2.org/
> +
> diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
> new file mode 100644
> index 0000000..aef391e
> --- /dev/null
> +++ b/package/libssh2/libssh2.mk
> @@ -0,0 +1,49 @@
> +#############################################################
> +#
> +# libssh2
> +#
> +#############################################################
> +
> +LIBSSH2_VERSION = 1.4.3
> +LIBSSH2_SITE = http://www.libssh2.org/download/
> +LIBSSH2_LICENSE = BSD
> +LIBSSH2_LICENSE_FILES = COPYING
> +LIBSSH2_INSTALL_STAGING = YES
> +LIBSSH2_CONF_OPT = --disable-examples-buildg

  buildg?

> +
> +# libssh2 must use either libgcrypt or OpenSSL - OpenSSL will take precedence over libgcrypt
> +# However, if neither is selected, OpenSSL will be added to the build
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +LIBSSH2_DEPENDENCIES += openssl
> +LIBSSH2_CONF_OPT += --with-openssl --without-libgcrypt
> +else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)

  With the select in the Config.in, you can be sure that one of them is 
selected so no second condition is needed.

> +LIBSSH2_DEPENDENCIES += libgcrypt
> +LIBSSH2_CONF_OPT += --with-libgcrypt --without-openssl
> +else
> +LIBSSH2_DEPENDENCIES += openssl
> +LIBSSH2_CONF_OPT += --with-openssl --without-libgcrypt
> +endif
> +
> +# Remove Documentation
> +ifneq ($(BR2_HAVE_DOCUMENTATION),y)
> +define LIBSSH2_TARGET_REMOVE_DOCUMENTATION
> +	rm -f $(TARGET_DIR)/usr/share/man/man3/libssh2*

  This isn't needed, target-finalize will do that.

> +endef
> +LIBSSH2_POST_INSTALL_TARGET_HOOKS += LIBSSH2_TARGET_REMOVE_DOCUMENTATION
> +endif
> +
> +# Remove unneeded files from target
> +LIBSSH2_UNNEEDED_FILES = \
> +	usr/include/libssh2.h \
> +	usr/include/libssh2_publickey.h \
> +	usr/include/libssh2_sftp.h \
> +	usr/lib/pkgconfig/libssh2.pc \
> +	usr/lib/libssh2.la \
> +	usr/lib/libssh2.a
> +
> +define LIBSSH2_TARGET_REMOVE_UNNEEDED_FILES
> +	rm -rf $(addprefix $(TARGET_DIR)/, $(LIBSSH2_UNNEEDED_FILES))

  Same here.


  Otherwise looks good, but I haven't tested.

  Regards,
  Arnout

> +endef
> +LIBSSH2_POST_INSTALL_TARGET_HOOKS += LIBSSH2_TARGET_REMOVE_UNNEEDED_FILES
> +
> +$(eval $(autotools-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
