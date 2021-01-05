From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Jan 2021 23:46:14 +0100
Subject: [Buildroot] [PATCH 10/10 v3] package/tar: drop specific version
 for host variant
In-Reply-To: <a3b05faa57b2c10861825f5f00a4ab32d8fe5d81.1609239666.git.yann.morin.1998@free.fr>
References: <cover.1609239666.git.yann.morin.1998@free.fr>
 <a3b05faa57b2c10861825f5f00a4ab32d8fe5d81.1609239666.git.yann.morin.1998@free.fr>
Message-ID: <6cf63267-6202-575f-9d64-1612612fdaf6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/12/2020 12:01, Yann E. MORIN wrote:
> Now that we can generate reproducible archives, with all known tar
> versions starting with 1.27, we don't need to clamp the host-tar
> version to the old 1.29, and can now bump to any later version.
> 
> Drop the host-tar version, and use the same as the target variant.
> 
> Note that we still need the _SOURCE trick, to avoid depending on tar
> to extract the tar tarball...

 Note that e185f62c58f97378785fd46476cc8ec099989230 also changed TAR_VERSION to
HOST_TAR_VERSION in the HOST_TAR_EXTRACT_CMDS, but I think the current
HOST_TAR_VERSION is indeed more appropriate.

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  package/tar/tar.mk | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/package/tar/tar.mk b/package/tar/tar.mk
> index 9e0a40e561..7822b1dada 100644
> --- a/package/tar/tar.mk
> +++ b/package/tar/tar.mk
> @@ -29,14 +29,10 @@ endif
>  
>  $(eval $(autotools-package))
>  
> -# host-tar is used to create the archives in the VCS download backends and tar
> -# 1.30 and forward have changed the archive format. So archives generated with
> -# earlier versions are not bit-for-bit reproducible and the hashes would not
> -# match. Hence host-tar must be kept at version 1.29.
> -HOST_TAR_VERSION = 1.29
>  # host-tar: use cpio.gz instead of tar.gz to prevent chicken-egg problem
>  # of needing tar to build tar.
> -HOST_TAR_SOURCE = tar-$(HOST_TAR_VERSION).cpio.gz
> +HOST_TAR_SOURCE = tar-$(TAR_VERSION).cpio.gz
> +
>  define HOST_TAR_EXTRACT_CMDS
>  	mkdir -p $(@D)
>  	cd $(@D) && \
> 
