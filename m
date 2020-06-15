From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 15 Jun 2020 18:50:59 -0500
Subject: [Buildroot] [PATCH v3] package/eigen: use cmake-package infra
In-Reply-To: <20200615184911.71434-1-juju@cotds.org>
References: <20200614173754.702855-1-juju@cotds.org>
 <20200615184911.71434-1-juju@cotds.org>
Message-ID: <CANQCQpamzLJeWXCWb_ZeT9S1K=XCdMZHO5ir=5Lqd7N4ZErorQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien,


On Mon, Jun 15, 2020 at 1:50 PM Julien Olivain <juju@cotds.org> wrote:
>
> The eigen package was introduced as a generic package, but upstream was
> in fact using CMake.

The original reason for going the generic route was because the pkg
suggested just copying the headers and that documentation used CMake.
Hindsight being what it is, looks like a good point to now clean
things up and go the CMake route :)

>
> The motivation of this change is to fix package detection with CMake.
>
> Eigen3 library normally installs a signature file named
> "signature_of_eigen3_matrix_library" to help library detection:
> https://gitlab.com/libeigen/eigen/-/blob/3.3.7/CMakeLists.txt#L423
>
> The library also provide a CMake macro that use this file to
> detect it:
> https://gitlab.com/libeigen/eigen/-/blob/3.3.7/cmake/FindEigen3.cmake#L76
>
> Without the signature file installed, packages searching for this
> library with this method will fail. Other packages usings pkg-config are
> not affected by this issue.
>
> By using the cmake-package infrastructure, all the needed files
> are now installed, fixing this CMake detection issue.
>
> Other changes in this patch:
> - Updated the Eigen git repository to the new url:
>   https://gitlab.com/libeigen/eigen
> - Removed all build and install staging commands
>   (now included in upstream cmake)
> - Package needs EIGEN_SUPPORTS_IN_SOURCE_BUILD = NO
> - Removed the BR2_PACKAGE_EIGEN_UNSUPPORTED_MODULES option,
>   as this option is not proposed by the upstream CMake.
>   Unsupported module header files are now unconditionally installed. As
>   such, no need to introduce a legacy entry for
>   BR2_PACKAGE_EIGEN_UNSUPPORTED_MODULES: users that had it enabled will
>   still get the files installed, while those that did not will get them
>   installed now.

I've built the package and confirmed the .files-list-staging.txt
includes the additional signature file, unsupported modules and cmake
helpers.

Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>

> - Updated hash for source package, because the first component in the
>   stored paths changed from eigen-eigen-323c052e1731/ to eigen-3.3.7/
>   and some mercurial related files (.hg_archival.txt, .hgtags) got
>   dropped after the conversion to git.
> - Reformat hash file with two spaces delimiters
> - Define EIGEN_CONF_OPTS to set pkg-config .pc install path
>
> Signed-off-by: Julien Olivain <juju@cotds.org>
>
> ---
> Changes v2 -> v3:
> Suggested by Yann:
>   - clarified commit log about hash change
>   - clarified commit log about unsupported module option removal
>   - Use absolute path to set PKGCONFIG_INSTALL_DIR CMake variable
>
> Changes v1 -> v2:
>   - use cmake package infra, instead of fixing cmake detection
>     issue by duplicating upstream commands, as suggested by Yann.
> ---
>  package/eigen/Config.in  |  8 --------
>  package/eigen/eigen.hash | 14 +++++++-------
>  package/eigen/eigen.mk   | 36 +++++++-----------------------------
>  3 files changed, 14 insertions(+), 44 deletions(-)
>
> diff --git a/package/eigen/Config.in b/package/eigen/Config.in
> index 48752e0c8d..ef0a16f2f7 100644
> --- a/package/eigen/Config.in
> +++ b/package/eigen/Config.in
> @@ -13,13 +13,5 @@ config BR2_PACKAGE_EIGEN
>
>           http://eigen.tuxfamily.org/
>
> -if BR2_PACKAGE_EIGEN
> -
> -config BR2_PACKAGE_EIGEN_UNSUPPORTED_MODULES

Do we need to add a legacy config for this?

Thanks for cleaning this up!
Matt
