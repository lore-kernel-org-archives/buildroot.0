From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Jan 2021 23:57:05 +0100
Subject: [Buildroot] [PATCH v1 1/1] package/balena-engine: new package
In-Reply-To: <20201216084246.102616-1-christian@paral.in>
References: <20201216084246.102616-1-christian@paral.in>
Message-ID: <ef6c1ff5-5b4d-051a-f088-74cfb7b19127@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16/12/2020 09:42, Christian Stewart wrote:
> Reviewed-by: Christian Stewart <christian@paral.in>

 I guess this implies that Tian is the actual author? In that case, you should
set the author line to them, using `git commit --author=...`.

 I have done that now, I hope this is correct...

> Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/Config.in                      |   1 +
>  package/balena-engine/Config.in        |  27 ++++++
>  package/balena-engine/balena-engine.mk | 109 +++++++++++++++++++++++++

 You forgot to add a hash file. I've added it.

>  3 files changed, 137 insertions(+)
>  create mode 100644 package/balena-engine/Config.in
>  create mode 100644 package/balena-engine/balena-engine.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index dc7139a49a..0fe88511dd 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2377,6 +2377,7 @@ menu "System tools"
>  	source "package/atop/Config.in"
>  	source "package/attr/Config.in"
>  	source "package/audit/Config.in"
> +	source "package/balena-engine/Config.in"
>  	source "package/bubblewrap/Config.in"
>  	source "package/cgroupfs-mount/Config.in"
>  	source "package/circus/Config.in"
> diff --git a/package/balena-engine/Config.in b/package/balena-engine/Config.in
> new file mode 100644
> index 0000000000..d7764c3f65
> --- /dev/null
> +++ b/package/balena-engine/Config.in
> @@ -0,0 +1,27 @@
> +config BR2_PACKAGE_BALENA_ENGINE
> +	bool "balena-engine"
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS

 I don't think there is a real dependency on threads - it's pretty unlikely for
a go package since go has its own thread implementation. And anyway, musl and
glibc always have threads.

> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC

 Please add a comment why this is needed. In this case:

depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve

> +	depends on BR2_USE_MMU

depends on BR2_USE_MMU # util-linux

> +	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD
> +	select BR2_PACKAGE_IPTABLES

select BR2_PACKAGE_IPTABLES # runtime

etc.


 Applied to master with those changes, thanks!

 Regards,
 Arnout


> +	select BR2_PACKAGE_SQLITE
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_BINARIES
> +	select BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
> +	select BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT
> +	select BR2_PACKAGE_UTIL_LINUX_MOUNT
> +	help
> +	  balenaEngine is a new container engine purpose-built for
> +	  embedded and IoT use cases and compatible with Docker
> +	  containers.
> +
> +	  https://github.com/balena-os/balena-engine
> +
> +comment "balena-engine needs a glibc or musl toolchain w/ threads"
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
> +	depends on BR2_USE_MMU[snip]
