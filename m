From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Sep 2013 16:55:12 +0200
Subject: [Buildroot] [PATCH 1/1] libssh2: fix library search path issues
In-Reply-To: <1380203974-16321-1-git-send-email-rjbarnet@rockwellcollins.com>
 (Ryan Barnett's message of "Thu, 26 Sep 2013 08:59:34 -0500")
References: <1380203974-16321-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <87eh8b7hv3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <rjbarnet@rockwellcollins.com> writes:

 Ryan> Fix issues with some toolchains not finding libssl or libgcrypt.
 Ryan> Fixes http://autobuild.buildroot.net/results/eeaaf41c0c5f88357af8445750dce776774c2b5d
 Ryan> Fixes http://autobuild.buildroot.net/results/7a2590a7c3a1f52590f3e886b7cf9d04ad966a10

 Ryan> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
 Ryan> ---
 Ryan>  package/libssh2/libssh2.mk |    6 ++++--
 Ryan>  1 files changed, 4 insertions(+), 2 deletions(-)

 Ryan> diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
 Ryan> index 10eb5ed..ff35d9e 100644
 Ryan> --- a/package/libssh2/libssh2.mk
 Ryan> +++ b/package/libssh2/libssh2.mk
 Ryan> @@ -15,10 +15,12 @@ LIBSSH2_CONF_OPT = --disable-examples-build
 Ryan>  # Only select openssl if libgcrypt is not selected
 Ryan>  ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 Ryan>  LIBSSH2_DEPENDENCIES += libgcrypt
 Ryan> -LIBSSH2_CONF_OPT += --with-libgcrypt --without-openssl
 Ryan> +LIBSSH2_CONF_OPT += --with-libgcrypt --with-libgcrypt-prefix=$(STAGING_DIR)/usr \
 Ryan> +	 --without-openssl
 Ryan>  else
 Ryan>  LIBSSH2_DEPENDENCIES += openssl
 Ryan> -LIBSSH2_CONF_OPT += --with-openssl --without-libgcrypt
 Ryan> +LIBSSH2_CONF_OPT += --with-openssl --with-libssl-prefix=$(STAGING_DIR)/usr \
 Ryan> +	--without-libgcrypt

Committed with minor indentation fixup, thanks.

-- 
Bye, Peter Korsgaard
