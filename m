From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 23:15:44 +0200
Subject: [Buildroot] [PATCH v2] package/eigen: use cmake-package infra
In-Reply-To: <20200614173754.702855-1-juju@cotds.org>
References: <20200614173754.702855-1-juju@cotds.org>
Message-ID: <20200614211544.GO2346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On 2020-06-14 19:37 +0200, Julien Olivain spake thusly:
> The eigen package was introduced as a generic package, but upstream was
> in fact using CMake.
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
>   as this option is not proposed by the upstream CMake

    ... but they are unconditionally installed. A such, no need to
    introduce a legacy entry for BR2_PACKAGE_EIGEN_UNSUPPORTED_MODULES:
    users that had it enabled will still get the files installed, while
    those that did not will get them installed now.

> - Updated hash for source package

... because the first component in the stored paths changed from
eigen-eigen-323c052e1731/ to eigen-3.3.7/ and some mercurial related
files (.hg_archival.txt, .hgtags) got dropped after the conversion to
git.

> - Reformat hash file with two spaces delimiters
> - Define EIGEN_CONF_OPTS to set pkg-config .pc install path

This one I am having a hard time with, see below...

> Signed-off-by: Julien Olivain <juju@cotds.org>
[--SNIP--]
> +# Default Eigen CMake installs .pc file in
> +# $(STAGING)/usr/share/pkgconfig
> +# change it to lib/pkgconfig, to be consistent with other packages.
> +EIGEN_CONF_OPTS = -DPKGCONFIG_INSTALL_DIR:PATH=lib/pkgconfig

So this is a syntax that I am not familiar with.

First, it uses a non-absolute path "lib/pkgconfig". This is strange to
me. Second, it uses a variable with a colon PKGCONFIG_INSTALL_DIR:PATH,
and I don't know that either.

Yes, it works as expected, but I like to understand what's going on. Can
you shed a light on this, please?

I've tested -DPKGCONFIG_INSTALL_DIR=/usr/lib/pkgconfig which is the
usual way we're used to in Buildroot, and that works too.

I'll wait for your feedback on the above, but I'd prefer we use the more
traditional form unless there is a good reason not to.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
