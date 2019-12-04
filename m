From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Dec 2019 16:14:16 +0100
Subject: [Buildroot] [PATCH 6/7] libnetconf2: adjust dependencies
In-Reply-To: <8c74f9fdebe7eef326420f5354f3ec8163930074.1575456104.git.jan.kundrat@cesnet.cz>
References: <cover.1575456104.git.jan.kundrat@cesnet.cz>
 <8c74f9fdebe7eef326420f5354f3ec8163930074.1575456104.git.jan.kundrat@cesnet.cz>
Message-ID: <20191204161416.111467fc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Mar 2017 19:29:53 +0100
Jan Kundr?t <jan.kundrat@cesnet.cz> wrote:

> This package needs at least one of these two options, or both:
> 
> - openssl
> - libssh + the server option
> 
> Without these, it is not possible to produce a usable library, so let's
> reflect this in the dependencies.
> 
> I'm not sure that there is so much value in this; I would actually
> prefer to have both of these unconditionally enabled, but the package is
> already done in this way, so be it.
> 
> Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
> ---
>  package/libnetconf2/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libnetconf2/Config.in b/package/libnetconf2/Config.in
> index 0a735b5ed6..6d4c9c71d1 100644
> --- a/package/libnetconf2/Config.in
> +++ b/package/libnetconf2/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBNETCONF2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_USE_MMU
> +	depends on BR2_PACKAGE_LIBSSH_SERVER || BR2_PACKAGE_OPENSSL

If one of these is really mandatory for the package to work in any
meaningful way, then:

	select ONE_OPTION if !SECOND_OPTION

is preferred, so that it is more natural for users, and you don't need
the Config.in comment.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
