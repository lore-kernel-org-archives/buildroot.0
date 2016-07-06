From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 13:50:13 +0200
Subject: [Buildroot] [PATCH 1/1] shellinabox: new package
In-Reply-To: <1467772051-1522-1-git-send-email-olivier.singla@gmail.com>
References: <1467772051-1522-1-git-send-email-olivier.singla@gmail.com>
Message-ID: <20160706135013.05fac66d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks. I've applied your patch, but after doing some changes. Read on
below for the details.

When sending a new version, you should make sure the prefix of the
patch is "PATCH v2". This can be achieved by using the --subject-prefix
option of git format-patch.

On Tue,  5 Jul 2016 22:27:31 -0400, Olivier Singla wrote:

> diff --git a/package/shellinabox/0001-Makefile.am-fix-static.patch b/package/shellinabox/0001-Makefile.am-fix-static.patch
> new file mode 100644
> index 0000000..0fadde0
> --- /dev/null
> +++ b/package/shellinabox/0001-Makefile.am-fix-static.patch
> @@ -0,0 +1,15 @@
> +Makefile: disable always building statically.
> +
> +Signed-off-by:  "Olivier Singla" <olivier.singla@gmail.com>

Looks good. Please submit this patch to the upstream shellinabox
developers.


> +config BR2_PACKAGE_SHELLINABOX
> +	bool "shellinabox"
> +	select BR2_PACKAGE_ZLIB
> +	depends on BR2_PACKAGE_OPENSSL

This should have been a "select" not a "depends on". And they should be
ordered alphabetically.

> +	help
> +	  Shell In A Box implements a web server that can export arbitrary command
> +	  line tools to a web based terminal emulator. This emulator is accessible
> +	  to any JavaScript and CSS enabled web browser and does not require any
> +	  additional browser plugins.

Those lines were slightly too long, so I rewrapped the Config.in help
text.

> +
> +	  https://github.com/shellinabox/shellinabox
> diff --git a/package/shellinabox/shellinabox.hash b/package/shellinabox/shellinabox.hash
> new file mode 100644
> index 0000000..b7d4523
> --- /dev/null
> +++ b/package/shellinabox/shellinabox.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated after checking pgp signature
> +sha256	d25ba9f72f04471fc1a8a564c65ef466c4553280ff3eeb365ed9c897d05ed2da	v2.19.tar.gz
> diff --git a/package/shellinabox/shellinabox.mk b/package/shellinabox/shellinabox.mk
> new file mode 100644
> index 0000000..94e49e0
> --- /dev/null
> +++ b/package/shellinabox/shellinabox.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# shellinabox
> +#
> +################################################################################
> +
> +SHELLINABOX_VERSION = v2.19
> +SHELLINABOX_SOURCE = $(SHELLINABOX_VERSION).tar.gz
> +SHELLINABOX_SITE = https://github.com/shellinabox/shellinabox/archive

In the previous review, I think you were told to use the github helper
function, but didn't take into account this comment. So I've done the
necessary change.

> +
> +# Fetching from Github, and patching Makefile.am, so we need to autoreconf
> +SHELLINABOX_AUTORECONF = YES
> +
> +SHELLINABOX_DEPENDENCIES = zlib
> +
> +SHELLINABOX_LICENSE = GPLv2 with OpenSSL exception
> +SHELLINABOX_CONF_OPTS += --enable-ssl
> +SHELLINABOX_DEPENDENCIES += openssl

It would have been good to indicate why you force enable the OpenSSL
support, while it seemed to be optional. I've tested, and indeed with
OpenSSL disabled, it fails to build. I've reported this issue upstream.

So, I've grouped things together and added a comment:

# The OpenSSL support is supposed to be optional, but in practice,
# with OpenSSL disabled, it fails to build. See
# https://github.com/shellinabox/shellinabox/issues/385.
SHELLINABOX_DEPENDENCIES = zlib openssl
SHELLINABOX_CONF_OPTS = \
        --disable-runtime-loading \
        --enable-ssl

As said above, I've fixed those issues and applied your patch.

Since shellinaboxd is a daemon, it would be great to have it started
automatically at boot time. Could you submit a follow-up patch that
adds either a init script or a systemd service file (or ideally both) ?

Thanks a lot for your contribution!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
