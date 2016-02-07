From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 19:06:24 +0100
Subject: [Buildroot] [PATCH] package/openpowerlink: bump to v2.2.2
In-Reply-To: <1454864216-11916-1-git-send-email-romain.naour@gmail.com>
References: <1454864216-11916-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160207190624.1954b5bc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun,  7 Feb 2016 17:56:56 +0100, Romain Naour wrote:
> From [1]
> With version 2.0, the source code has been cleanly split into
> an application-oriented user library and a time-critical stack
> driver. The latter may be moved to a dedicated communication
> processor or into a kernel module to deliver enhanced
> performance while still keeping the API in user space.
> 
> This new version break the API used in the v1.x but
> this is a complete rewrite of the Powerlink EPSG DS 301
> implementation. The v1.x is deprecated anyway.
> 
> The new build system has been split in several CMake projects
> which makes it difficult to package with the Buildroot CMake
> infra. So add a top level CMakeLists.txt to build each
> openpowerlink component without having to package each of them
> in a separate Buildroot packages. Also we need to fix the
> build system to support the top level CMake build.
> 
> [1] http://sourceforge.net/projects/openpowerlink/
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v8: remove the custom extract cmds and set STRIP_COMPONENTS to 0 (Thomas)
>     s/DRIVERS/DRIVER/
>     Fixes some typos
>     Remove BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL option
>     Ref: http://lists.busybox.net/pipermail/buildroot/2016-February/152158.html
> v7: Improve commit log
>     update Config.legacy
>     add a sha256 hash
>     add a comment about extract cmds
> v6: bump to v2.2.2.
>     Keep C++ dependency since CMake still check it even if
>     it's not used by the openpowerlink stack :(
> v5: bump to v2.2.1 and remove upstream patches
>     There is no change in the packaging
> v4: Add a top level CMakeLists.txt to be able to squash all
>     openpowerlink packages into one and fixes the build
>     system accordingly
>     Add legacy handling
> v3: Add patch info about patches status
>     bump to v2.2.0
>     remove old openpowerlink stack (v1.8.5)
>     Rename openpowerlin2 to openpowerlink
>     fix build with musl toolchains
> v2: switch to tar.gz archive
>     add hash file
>     merge openpowerlink2 and openpowerlink2-stack
>     Add a new patch to install headers files
>     add OPENPOWERLINK2_*_ONOFF
> ---
>  Config.in.legacy                                   |  24 +++
>  ...l-the-stack-libraries-to-lib-subdirectory.patch | 133 ++++++++++++++++
>  ...a-better-regex-for-cmake-system-processor.patch |  89 -----------
>  ...0002-FIX-cmake-install-oplk-headers-files.patch |  32 ++++
>  ...-fix-user-space-stack-enable-shared-build.patch |  54 -------
>  ...se-CMAKE_CURRENT_SOURCE_DIR-instead-of-CM.patch | 154 +++++++++++++++++++
>  ...ROJECT_NAME-instead-of-CMAKE_PROJECT_NAME.patch | 125 +++++++++++++++
>  .../0005-FIX-Add-top-level-CMakeLists.txt.patch    | 170 +++++++++++++++++++++
>  package/openpowerlink/Config.in                    | 117 +++++++-------
>  package/openpowerlink/openpowerlink.hash           |   5 +
>  package/openpowerlink/openpowerlink.mk             | 135 +++++++++++-----
>  11 files changed, 793 insertions(+), 245 deletions(-)
>  create mode 100644 package/openpowerlink/0001-FIX-install-the-stack-libraries-to-lib-subdirectory.patch
>  delete mode 100644 package/openpowerlink/0001-fix-use-a-better-regex-for-cmake-system-processor.patch
>  create mode 100644 package/openpowerlink/0002-FIX-cmake-install-oplk-headers-files.patch
>  delete mode 100644 package/openpowerlink/0002-fix-user-space-stack-enable-shared-build.patch
>  create mode 100644 package/openpowerlink/0003-FIX-cmake-use-CMAKE_CURRENT_SOURCE_DIR-instead-of-CM.patch
>  create mode 100644 package/openpowerlink/0004-FIX-Use-PROJECT_NAME-instead-of-CMAKE_PROJECT_NAME.patch
>  create mode 100644 package/openpowerlink/0005-FIX-Add-top-level-CMakeLists.txt.patch
>  create mode 100644 package/openpowerlink/openpowerlink.hash

I've applied, with some additional changes:

    [Thomas:
     - rename patches to not contain the [FIX] part in their title.
     - rewrap Config.in help text
     - rename "openPOWERLINK stack type" to "stack type"
     - rename ""openpowerlink demos" to "demos"]
    
Also, the demo gets installed directly under /usr, which is somewhat
weird, but can be fixed later.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
