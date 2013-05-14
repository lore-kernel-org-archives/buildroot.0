From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 14 May 2013 22:13:16 +0200
Subject: [Buildroot] [PATCH] libxml2: depend on zlib and libiconv if
	appropriate
In-Reply-To: <1368520183-8049-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Tue, 14 May 2013 09:29:43 +0100")
References: <1368520183-8049-1-git-send-email-spdawson@gmail.com>
Message-ID: <87obcdqq03.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>
 spdawson> ---
 spdawson>  package/libxml2/libxml2.mk | 14 ++++++++++++++
 spdawson>  1 file changed, 14 insertions(+)

 spdawson> diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
 spdawson> index 6a974ef..1a98cdd 100644
 spdawson> --- a/package/libxml2/libxml2.mk
 spdawson> +++ b/package/libxml2/libxml2.mk
 spdawson> @@ -34,6 +34,20 @@ else
 spdawson>  HOST_LIBXML2_CONF_OPT += --without-python
 spdawson>  endif
 
 spdawson> +ifeq ($(BR2_PACKAGE_ZLIB),y)
 spdawson> +LIBXML2_DEPENDENCIES += zlib
 spdawson> +LIBXML2_CONF_OPT += --with-zlib
 spdawson> +else
 spdawson> +LIBXML2_CONF_OPT += --without-zlib
 spdawson> +endif
 spdawson> +
 spdawson> +ifeq ($(BR2_PACKAGE_LIBICONV),y)
 spdawson> +LIBXML2_DEPENDENCIES += libiconv
 spdawson> +LIBXML2_CONF_OPT += --with-iconv
 spdawson> +else
 spdawson> +LIBXML2_CONF_OPT += --without-iconv
 spdawson> +endif

Hmm, that seems wrong. If the toolchain has locale support, then it has
iconv(), so we shouldn't disable iconv support.

Something like:

LIBXML2_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)

ifeq ($(BR2_ENABLE_LOCALE)$(BR2_PACKAGE_LIBICONV),y)
LIBXML2_CONF_OPT += --with-iconv
else
LIBXML2_CONF_OPT += --without-iconv
endif

-- 
Bye, Peter Korsgaard
