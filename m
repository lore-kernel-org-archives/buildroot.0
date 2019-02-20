From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Feb 2019 22:31:37 +0100
Subject: [Buildroot] [PATCH 2/3] docker-containerd: propagate runc
 headers >= 3.11 dependency
In-Reply-To: <20190219223530.15956-2-christian@paral.in>
References: <20190219223530.15956-1-christian@paral.in>
 <20190219223530.15956-2-christian@paral.in>
Message-ID: <289f7e1d-c549-272a-f46f-b454d838da2d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/02/2019 23:35, Christian Stewart wrote:
> Add runc dependency on Linux headers >= 3.11 for O_TMPFILE.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

 By the way, this patch and the following one should be squashed into the first
one, otherwise the first patch breaks bisectability.

 Regards,
 Arnout

> ---
>  package/docker-containerd/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/docker-containerd/Config.in b/package/docker-containerd/Config.in
> index 5e0cc1e877..4065b8e3be 100644
> --- a/package/docker-containerd/Config.in
> +++ b/package/docker-containerd/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_DOCKER_CONTAINERD
>  	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 # runc
>  	depends on !BR2_TOOLCHAIN_USES_UCLIBC # runc
>  	depends on BR2_USE_MMU # util-linux
>  	select BR2_PACKAGE_RUNC # runtime dependency
> @@ -32,4 +33,5 @@ comment "docker-containerd needs a glibc or musl toolchain w/ threads"
>  	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
>  	depends on BR2_USE_MMU
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
> +  	!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 || BR2_TOOLCHAIN_USES_UCLIBC
> 
