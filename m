From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 09:28:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/eigen: fix package detection
 with CMake
In-Reply-To: <20200613161643.609929-1-juju@cotds.org>
References: <20200613161643.609929-1-juju@cotds.org>
Message-ID: <20200614072836.GB2346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, Matt, all,

On 2020-06-13 18:16 +0200, Julien Olivain spake thusly:
> Eigen3 library normally installs a signature file named
> "signature_of_eigen3_matrix_library" to help library detection:
> https://gitlab.com/libeigen/eigen/-/blob/3.3.7/CMakeLists.txt#L423
> 
> This Buildroot package does not use CMake for installing files, as only
> the headers are needed in the STAGING_DIR. A generic-package is used
> instead with simple copies.

Why can't we use the cmake-package infra, rahter than duplicate what
upstream does?

Regards,
Yann E. MORIN.

> The library also provide a CMake macro that use this file to
> detect it:
> https://gitlab.com/libeigen/eigen/-/blob/3.3.7/cmake/FindEigen3.cmake#L76
> 
> Without the signature file installed, packages searching for this
> library with this method will fail. Other packages usings pkg-config are
> not affected by this issue.
> 
> This patch install the signature file at the expected path, to fix
> detections.
> 
> Signed-off-by: Julien Olivain <juju@cotds.org>
> ---
>  package/eigen/eigen.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
> index 5c9e028442..68ffe84cb4 100644
> --- a/package/eigen/eigen.mk
> +++ b/package/eigen/eigen.mk
> @@ -34,6 +34,7 @@ define EIGEN_INSTALL_STAGING_CMDS
>  	$(RM) -r $(EIGEN_DEST_DIR)
>  	mkdir -p $(EIGEN_DEST_DIR)
>  	cp -a $(@D)/Eigen $(EIGEN_DEST_DIR)
> +	cp -a $(@D)/signature_of_eigen3_matrix_library $(EIGEN_DEST_DIR)
>  	$(EIGEN_INSTALL_UNSUPPORTED_MODULES_CMDS)
>  	$(INSTALL) -D -m 0644 $(@D)/eigen3.pc \
>  		$(STAGING_DIR)/usr/lib/pkgconfig/eigen3.pc
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
