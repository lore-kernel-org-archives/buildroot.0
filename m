From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Mar 2013 22:48:39 +0100
Subject: [Buildroot] [PATCH 4/5] flite: new package
In-Reply-To: <359a800fb351cc1d10532e184d9dc7d30c5cd991.1363063832.git.s.martin49@gmail.com>
 (Samuel Martin's message of "Tue, 12 Mar 2013 05:58:42 +0100")
References: <cover.1363063832.git.s.martin49@gmail.com>
 <cover.1363063832.git.s.martin49@gmail.com>
 <359a800fb351cc1d10532e184d9dc7d30c5cd991.1363063832.git.s.martin49@gmail.com>
Message-ID: <87vc8p3dfs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> Cc: Eric Jarrige <eric.jarrige@armadeus.org>
 Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 Samuel> ---
 Samuel> Changes since v1:
 Samuel> - fix dependencies
 Samuel> ---
 Samuel>  package/multimedia/Config.in       |  1 +
 Samuel>  package/multimedia/flite/Config.in | 15 ++++++++++
 Samuel>  package/multimedia/flite/flite.mk  | 58 ++++++++++++++++++++++++++++++++++++++
 Samuel>  3 files changed, 74 insertions(+)
 Samuel>  create mode 100644 package/multimedia/flite/Config.in
 Samuel>  create mode 100644 package/multimedia/flite/flite.mk

 Samuel> diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
 Samuel> @@ -0,0 +1,58 @@
 Samuel> +#############################################################
 Samuel> +#
 Samuel> +# flite
 Samuel> +#
 Samuel> +#############################################################
 Samuel> +
 Samuel> +FLITE_VERSION = 1.4
 Samuel> +FLITE_SOURCE = flite-$(FLITE_VERSION)-release.tar.bz2
 Samuel> +FLITE_SITE = http://www.speech.cs.cmu.edu/flite/packed/flite-$(FLITE_VERSION)
 Samuel> +FLITE_LICENSE = BSD-4c
 Samuel> +FLITE_LICENSE_FILES = COPYING
 Samuel> +
 Samuel> +FLITE_INSTALL_STAGING = YES
 Samuel> +
 Samuel> +# Sadly, Flite does not support parallel build,
 Samuel> +# especially when building its shared libraries.
 Samuel> +FLITE_MAKE = $(MAKE1)
 Samuel> +
 Samuel> +FLITE_CONF_OPT = \
 Samuel> +	$(if $(BR2_PREFER_STATIC_LIB),,--enable-shared)

We're already pass --enable-shared in the autotools infrastructure, so
why is this needed?

 Samuel> +
 Samuel> +FLITE_INSTALL_STAGING_OPT = \
 Samuel> +	INSTALLBINDIR=$(STAGING_DIR)/usr/bin \
 Samuel> +	INSTALLLIBDIR=$(STAGING_DIR)/usr/lib \
 Samuel> +	INSTALLINCDIR=$(STAGING_DIR)/usr/include/flite \
 Samuel> +	install
 Samuel> +
 Samuel> +FLITE_INSTALL_TARGET_OPT = \
 Samuel> +	INSTALLBINDIR=$(TARGET_DIR)/usr/bin \
 Samuel> +	INSTALLLIBDIR=$(TARGET_DIR)/usr/lib \
 Samuel> +	INSTALLINCDIR=$(TARGET_DIR)/usr/include/flite \
 Samuel> +	install

It could be good with a note about why this is needed (E.G. flite used a
handwritten a Makefile which doesn't handle DESTDIR even though it uses
autoconf).

 Samuel> +
 Samuel> +# Flite totally screw up their tarball generation, so that:
 Samuel> +#
 Samuel> +#   $ tar tf flite-1.4-release.tar.bz2

Argh :/

-- 
Bye, Peter Korsgaard
