From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Aug 2013 21:32:05 +0200
Subject: [Buildroot] [PATCH] tar: avoid ccache chicken and egg problem
 when bootstrapping tar
In-Reply-To: <20130703205733.GA11235@berrier.lan>
References: <20130703205733.GA11235@berrier.lan>
Message-ID: <20130810213205.4ad62101@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Wade Berrier,

On Wed, 3 Jul 2013 14:57:35 -0600, Wade Berrier wrote:
> Signed-off-by: Wade Berrier <wberrier@gmail.com>
> ---
>  package/tar/tar.mk |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/tar/tar.mk b/package/tar/tar.mk
> index 3ffeaf0..56443a8 100644
> --- a/package/tar/tar.mk
> +++ b/package/tar/tar.mk
> @@ -20,6 +20,11 @@ $(eval $(autotools-package))
>  # host-tar: use cpio.gz instead of tar.gz to prevent chicken-egg problem
>  # of needing tar to build tar.
>  HOST_TAR_SOURCE = tar-$(TAR_VERSION).cpio.gz
> +
> +# ccache isn't available yet when building for the host
> +HOST_TAR_CONF_ENV = \
> +	CC="$(HOSTCC_NOCCACHE)"
> +
>  define HOST_TAR_EXTRACT_CMDS
>  	mkdir -p $(@D)
>  	cd $(@D) && \

With the patch series from Thomas De Schampheleire that I have just
committed, I think this patch is no longer necessary: all dependencies
that are pulled by the support/dependencies/dependencies.mk code are no
longer built through ccache, they are all built with HOSTCC_NOCCACHE.

Note that the patches from Thomas have been committed in the 'next'
branch, they will be part in the 2013.11 release of Buildroot. They
will land in the 'master' branch of Buildroot when 2013.08 is released.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
