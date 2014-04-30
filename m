From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 30 Apr 2014 14:32:19 +0200
Subject: [Buildroot] [PATCH 1/1] libwebsockets : bump version to v1.23
In-Reply-To: <CAAXf6LWycxjzrtxBYwfxUyLFQrKyA98JLYXMBN_NuLTSwCCpGA@mail.gmail.com>
References: <1398852411-17462-1-git-send-email-sagaert.johan@skynet.be>
 <CAAXf6LWycxjzrtxBYwfxUyLFQrKyA98JLYXMBN_NuLTSwCCpGA@mail.gmail.com>
Message-ID: <090CCA1294CF41F2B38B5B7D8F593CF2@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Dear Thomas

Only cmake is supported, check the v1.23-chrome32-firefox24 sources.
The previous version supported both cmake and autotools.

-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Thomas De Schampheleire
Verzonden: woensdag 30 april 2014 14:01
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] [PATCH 1/1] libwebsockets : bump version to v1.23

On Wed, Apr 30, 2014 at 12:06 PM, Sagaert Johan <sagaert.johan@skynet.be> wrote:
> bump to v1.23-chrome32-firefox24
> The latest releases use the cmake build infrastructure.
> Converted the makefile to the cmake infrastructure.
>
> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
> ---
>  package/libwebsockets/libwebsockets.mk | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/package/libwebsockets/libwebsockets.mk 
> b/package/libwebsockets/libwebsockets.mk
> index ec5244c..1d76bc9 100644
> --- a/package/libwebsockets/libwebsockets.mk
> +++ b/package/libwebsockets/libwebsockets.mk
> @@ -4,14 +4,18 @@
>  #
>  
> ######################################################################
> ##########
>
> -LIBWEBSOCKETS_VERSION = v1.22-chrome26-firefox18
> +LIBWEBSOCKETS_VERSION = v1.23-chrome32-firefox24
>  LIBWEBSOCKETS_SOURCE = libwebsockets-$(LIBWEBSOCKETS_VERSION).tar.xz
>  LIBWEBSOCKETS_SITE = 
> http://git.libwebsockets.org/cgi-bin/cgit/libwebsockets/snapshot
>  LIBWEBSOCKETS_LICENSE = LGPLv2.1
>  LIBWEBSOCKETS_LICENSE_FILES = COPYING  LIBWEBSOCKETS_DEPENDENCIES = 
> zlib -LIBWEBSOCKETS_AUTORECONF = YES -LIBWEBSOCKETS_CONF_OPT = 
> --without-testapps  LIBWEBSOCKETS_INSTALL_STAGING = YES
>
> -$(eval $(autotools-package))
> +LIBWEBSOCKETS_CONF_OPT += -DWITHOUT_TESTAPPS=ON
> +
> +ifeq ($(BR2_PACKAGE_OPENSSL),)
> +       LIBWEBSOCKETS_CONF_OPT += -DWITH_SSL=OFF endif
> +
> +$(eval $(cmake-package))

In fact, libwebsockets provides both an autotools as a cmake-based build infrastructure.
The question is which one we prefer if both are provided.

Personally, since there are more packages using autotools (and thus host-automake and host-autoconf need to be built anyhow) and
host-cmake build time is significant, I prefer autotools in such a case as it avoids to build host-cmake for this one package
(assuming it's the only one being enabled).

Best regards,
Thomas

> --
> 1.9.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
