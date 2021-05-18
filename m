From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 10:44:29 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/genuinetools-img: new host
 and target package
In-Reply-To: <20210516010521.1375959-3-christian@paral.in>
References: <20210516010521.1375959-1-christian@paral.in>
 <20210516010521.1375959-3-christian@paral.in>
Message-ID: <20210518084429.GN2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2021-05-15 18:05 -0700, Christian Stewart spake thusly:
> Img is a standalone, daemon-less, unprivileged Dockerfile and OCI compatible
> container image builder. It uses the moby-buildkit solver internally. The
> commands/UX mirror the Docker CLI for workflow compatibility.
> 
> Using the genuinetools- prefix due to the generic nature of the "img" name.
> 
> Adds both host and target variants. fuse-overlayfs can be used as an
> unprivileged and rootless overlay filesystem backend.
> 
> https://github.com/genuinetools/img
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
[--SNIP--]
> diff --git a/package/genuinetools-img/Config.in b/package/genuinetools-img/Config.in
> new file mode 100644
> index 0000000000..eb4992db07
> --- /dev/null
> +++ b/package/genuinetools-img/Config.in
> @@ -0,0 +1,23 @@
> +config BR2_PACKAGE_GENUINETOOLS_IMG
> +	bool "genuinetools-img"
> +	depends on BR2_USE_MMU # fuse-overlayfs libfuse3
> +	depends on !BR2_STATIC_LIBS # fuse-overlayfs libfuse3
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # fuse-overlayfs libfuse3
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15 # fuse-overlayfs
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS

You forgot to add those two to the comment, below...

> +	depends on BR2_TOOLCHAIN_HAS_THREADS

Duplicate. ;-)

> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC

... and this one too...

Also, keep arch-related dependencies first, then toolchain-related
dependencies, the package-related dependencies (with the comments):

    depends on BR2_USE_MMU
    depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
    depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
    depends on !BR2_STATIC_LIBS
    depends on BR2_TOOLCHAIN_HAS_THREADS
    depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15

> +	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime dependency
> +	select BR2_PACKAGE_FUSE_OVERLAYFS # runtime dependency
> +	select BR2_PACKAGE_LIBFUSE3 # fuse-overlayfs
> +	help
> +	  Img is a standalone, daemon-less, unprivileged Dockerfile
> +	  and OCI compatible container image builder.
> +
> +	  https://github.com/genuinetools/img
> +
> +comment "genuinetools-img needs a toolchain w/ threads, dynamic library, headers >= 3.15"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15

    comment "genuinetools-img needs a glibc or musl toolchain w/ ..."
        depends on BR2_USE_MMU
        depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
        depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
        depends on BR2_TOOLCHAIN_USES_UCLIB || !BR2_TOOLCHAIN_HAS_THREADS \
                || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15

[--SNIP--]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
