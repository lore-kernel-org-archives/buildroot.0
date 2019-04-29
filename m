From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 29 Apr 2019 23:59:30 +0200
Subject: [Buildroot] [PATCH 1/1] New package:
 https://github.com/ndilieto/uacme
In-Reply-To: <20190429205511.GA18242@einstein.dilieto.eu>
References: <20190429205511.GA18242@einstein.dilieto.eu>
Message-ID: <c15eaa0b-dd79-0350-81c1-59c434049430@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Nicola,

 Thank you for your submission. It doesn't completely follow the Buildroot
coding style, so I have some comments.

 First of all, the subject line of a new package is normally:

package/uacme: new package

On 29/04/2019 22:55, Nicola Di Lieto wrote:
> Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
> ---
> package/uacme/Config.in? | 34 ++++++++++++++++++++++++++++++++++
> package/uacme/uacme.hash |? 3 +++
> package/uacme/uacme.mk?? | 29 +++++++++++++++++++++++++++++

 Please also add yourself to the DEVELOPERS file. This way, you'll be put in Cc
when somebody makes modifications to the package, and you'll also get a message
when the package fails to build in the autobuilders.

 You are not adding the package to package/Config.in, so it can't be selected.
You have to choose in which menu to put it - probably the networking tools menu
is most appropriate. Make sure things stays alphabetically ordered.

> 3 files changed, 66 insertions(+)
> create mode 100644 package/uacme/Config.in
> create mode 100644 package/uacme/uacme.hash
> create mode 100644 package/uacme/uacme.mk
> 
> diff --git a/package/uacme/Config.in b/package/uacme/Config.in
> new file mode 100644
> index 0000000..a84c4a6
> --- /dev/null
> +++ b/package/uacme/Config.in
> @@ -0,0 +1,34 @@
> +config BR2_PACKAGE_UACME
> +??? bool "uacme"

 Indentation is one tab in Config.in. Please use the utils/check-package script
to verify all files you add.

> +??? depends on BR2_USE_MMU # fork()
> +??? select BR2_PACKAGE_LIBCURL
> +??? select BR2_PACKAGE_LIBCURL_TLS_SUPPORT

 You cannot select that option. Well, you can, but you shouldn't :-). It's
supposed to indicate if any package was selected that curl can use to implement
TLS support, so you're only supposed to depend on it, not select it.

 However, since you require either gnutls or mbedtls, I think you should do
something like:

	select BR2_PACKAGE_MBEDTLS if !BR2_PACKAGE_GNUTLS

 Note that this type of conditional select is tricky. If some other package does

	select BR2_PACKAGE_GNUTLS if !BR2_PACKAGE_MBEDTLS

you can get a circular dependency. Fortunately, no other package is doing
anything like that, so you can choose which one of those two you prefer. But
since gnutls has additional dependencies (!static and wchar), it's better to
prefer mbedtls.


> +??? help
> +????? uacme is a client for the ACMEv2 protocol described in
> +????? RFC8555, written in plain C code with minimal dependencies
> +????? (libcurl and GnuTLS or mbedTLS). The ACMEv2 protocol allows
> +????? a Certificate Authority (https://letsencrypt.org is a
> +????? popular one) and an applicant to automate the process of
> +????? verification and certificate issuance.
> +
> +????? https://github.com/ndilieto/uacme
> +
> +if BR2_PACKAGE_UACME
> +
> +choice
> +??? prompt "SSL/TLS library to use"
> +
> +config BR2_PACKAGE_UACME_GNUTLS
> +??? bool "GnuTLS"
> +??? depends on BR2_PACKAGE_GNUTLS

 We generally don't give a choice for something like that, but choose something
automatically.

> +
> +config BR2_PACKAGE_UACME_MBEDTLS
> +??? bool "mbed TLS"
> +??? depends on BR2_PACKAGE_MBEDTLS
> +
> +endchoice
> +
> +comment "uacme needs either GnuTLS or mbedTLS"
> +??? depends on !BR2_PACKAGE_GNUTLS && !BR2_PACKAGE_UACME_MBEDTLS

 With the conditional select I proposed this is not needed.

> +
> +endif
> diff --git a/package/uacme/uacme.hash b/package/uacme/uacme.hash
> new file mode 100644
> index 0000000..d0e9fbf
> --- /dev/null
> +++ b/package/uacme/uacme.hash
> @@ -0,0 +1,3 @@
> +# Locally computed:
> +sha256??? 7de471fc4ce5bcc7071628a2d1e992fc6e30272909d4ce18b93e036eb48dfa5e???
> uacme-1.0.7.tar.gz
> +sha256??? 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903???
> COPYING
> diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
> new file mode 100644
> index 0000000..494656e
> --- /dev/null
> +++ b/package/uacme/uacme.mk
> @@ -0,0 +1,29 @@
> +################################################################################
> +#
> +# uacme
> +#
> +################################################################################
> +
> +UACME_VERSION = upstream/1.0.7

 I don't understand what these upstream/ tags are, but v1.0.7 seems equally
appropriate to me.

> +UACME_SOURCE = uacme-1.0.7.tar.gz
> +UACME_SITE = git://github.com/ndilieto/uacme

 We prefer http over git to access git repositories. But for github, we prefer
to use either an uploaded tarball (not available in this case, except if we
would use the debian tarball) or the github helper. Thus, it would become
something like:

UACME_VERSION = 1.0.7
UACME_SITE = $(call github,ndilieto,uacme,upstream/$(UACME_VERSION))

or

UACME_SITE = $(call github,ndilieto,uacme,v$(UACME_VERSION))

 Note that UACME_SOURCE doesn't need to be set, it is set automatically to the
correct value (uacme-$(UACME_VERSION).tar.gz).

> +UACME_LICENSE = GPL-3.0+
> +UACME_LICENSE_FILES = COPYING
> +
> +UACME_CONF_OPTS = --disable-maintainer-mode --disable-debug

 I don't think these are needed, are they?

> +
> +ifeq ($(BR2_PACKAGE_UACME_GNUTLS),y)

 So here (assuming mbedtls is preferred), you'd have:

ifeq ($(BR2_PACKAGE_MBEDTLS),y)
...
else
# Must have gnutls selected
...
endif

 Note that the preference here does not need to correspond to the Config.in. In
other words, if the user has selected both gnutls and mbedtls, you can choose
which of the two should be used for uacme.

> +UACME_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr

 Normally, --with-gnutls (without argument) should be enough. It is even
preferred, because then pkg-config will be used and it will set LIBS correctly.


 Regards,
 Arnout

> +UACME_DEPENDENCIES += gnutls
> +else
> +UACME_CONF_OPTS += --without-gnutls
> +endif
> +
> +ifeq ($(BR2_PACKAGE_UACME_MBEDTLS),y)
> +UACME_CONF_OPTS += --with-mbedtls=$(STAGING_DIR)/usr
> +UACME_DEPENDENCIES += mbedtls
> +else
> +UACME_CONF_OPTS += --without-mbedtls
> +endif
> +
> +$(eval $(autotools-package))
