From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Nov 2015 23:00:46 +0100
Subject: [Buildroot] [PATCH 1/1] libnet: explicitly pass
 libnet_cv_have_packet_socket=yes because PF_PACKET is always available on
 Linux
In-Reply-To: <1447848930-3090-1-git-send-email-joris.lijssens@gmail.com>
References: <1447848930-3090-1-git-send-email-joris.lijssens@gmail.com>
Message-ID: <20151119230046.78a68843@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joris,

Like your other patch, the commit title of this is too long. But
there's another issue, read below.

On Wed, 18 Nov 2015 13:15:30 +0100, Joris Lijssens wrote:
> Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
> ---
>  package/libnet/libnet.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/libnet/libnet.mk b/package/libnet/libnet.mk
> index 3b62a79..7004417 100644
> --- a/package/libnet/libnet.mk
> +++ b/package/libnet/libnet.mk
> @@ -10,4 +10,9 @@ LIBNET_INSTALL_STAGING = YES
>  LIBNET_LICENSE = BSD-2c, BSD-3c
>  LIBNET_LICENSE_FILES = doc/COPYING
>  
> +# PF_PACKET is always available on Linux, but build breaks for musl
> +ifneq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +LIBNET_CONF_OPTS = libnet_cv_have_packet_socket=yes
> +endif

In fact, even without defining libnet_cv_have_packet_socket=yes, libnet
does not build with musl. So either the build problem should be fixed
(it's a typical structure redefinition problem due to using the kernel
headers instead of the C library headers), but it is not super simple
to fix because libnet's code is somewhat convoluted.

I would suggest to simply mark the package as not available on musl
(and therefore netsniff-ng as well). Can you send a patch doing this,
and on top of this send a new version of this patch?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
