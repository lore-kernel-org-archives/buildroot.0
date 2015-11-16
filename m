From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Nov 2015 23:16:05 +0100
Subject: [Buildroot] [PATCH 1/1] libnet:explicitly pass
 libnet_cv_have_packet_socket=yes
In-Reply-To: <1447323989-6331-1-git-send-email-joris.lijssens@gmail.com>
References: <1447323989-6331-1-git-send-email-joris.lijssens@gmail.com>
Message-ID: <564A55A5.7050705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12-11-15 11:26, Joris Lijssens wrote:
> Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
> ---
>  package/libnet/libnet.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libnet/libnet.mk b/package/libnet/libnet.mk
> index 3b62a79..ab825a4 100644
> --- a/package/libnet/libnet.mk
> +++ b/package/libnet/libnet.mk
> @@ -7,6 +7,7 @@
>  LIBNET_VERSION = 1.1.6
>  LIBNET_SITE = http://sourceforge.net/projects/libnet-dev/files
>  LIBNET_INSTALL_STAGING = YES
> +LIBNET_CONF_OPTS = libnet_cv_have_packet_socket=yes

 Unfortunately, this breaks the build for musl toolchains. Both the autoconf
test and the actual code in src/libnet_link_linux.c have stupid __GLIBC__ checks
which make it include linux/if_ether.h instead of the toolchain header, and that
triggers a failure because of multiple definitions. The fundamental solution is
to add AC_CHECK_HEADERS of netinet/if_ether.h and act accordingly. But for me
it's sufficient to just make it:

# PF_PACKET is always available on Linux, but build breaks for musl
ifneq ($(BR2_TOOLCHAIN_USES_MUSL),y)
LIBNET_CONF_OPTS = libnet_cv_have_packet_socket=yes
endif


 Regards,
 Arnout

>  LIBNET_LICENSE = BSD-2c, BSD-3c
>  LIBNET_LICENSE_FILES = doc/COPYING
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
