From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 29 Mar 2021 13:21:29 +0200
Subject: [Buildroot] [PATCH 2/2] package/qpid-proton: needs C++
In-Reply-To: <20210329101810.793099-2-luca@lucaceresoli.net>
References: <20210329101810.793099-1-luca@lucaceresoli.net>
 <20210329101810.793099-2-luca@lucaceresoli.net>
Message-ID: <CAPi7W80fMRqK4VU45e2VCY_Xi7Y05b079D4LkBOY0Z_+yWPDVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca,

Le lun. 29 mars 2021 ? 12:18, Luca Ceresoli <luca@lucaceresoli.net> a ?crit :
>
> qpid-proton needs C++ since commit d4c0fde91da0 ("package/qpid-proton: bump
> to version 0.33.0"), otherwise it fails with:
>
>   CMake Error at cpp/CMakeLists.txt:22 (enable_language):
>     The CMAKE_CXX_COMPILER:
>
>       /home/murray/temp/f5eafd10f45fde1e3655928e3469eec8cdc4945d/output/host/bin/arm-linux-g++
>
>     is not a full path to an existing compiler tool.
Thanks for taking care of this build failure, however I think that C++
is not really needed and there is probably  "just" an issue with
CMakeLists.txt which wrongly enable C++ because it thinks that C++ is
available:

check_language (CXX)
if (CMAKE_CXX_COMPILER)
  enable_language(CXX)

Perhaps, there is some kind of bug with check_language. I'll investigate.
>
> Fixes:
>   - http://autobuild.buildroot.net/results/e54/e54531509e2268ce3e6f1b6fd087163397e69110/
>   - http://autobuild.buildroot.net/results/f5e/f5eafd10f45fde1e3655928e3469eec8cdc4945d/
>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  package/qpid-proton/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/package/qpid-proton/Config.in b/package/qpid-proton/Config.in
> index 05ba452c5c48..989de661933c 100644
> --- a/package/qpid-proton/Config.in
> +++ b/package/qpid-proton/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_QPID_PROTON
>         bool "qpid-proton"
>         depends on !BR2_STATIC_LIBS # build a shared library
>         depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on BR2_INSTALL_LIBSTDCPP
>         select BR2_PACKAGE_UTIL_LINUX
>         select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>         help
> @@ -14,5 +15,5 @@ config BR2_PACKAGE_QPID_PROTON
>
>           https://qpid.apache.org/proton/
>
> -comment "qpid-proton needs a toolchain w/ dynamic library, threads"
> -       depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
> +comment "qpid-proton needs a toolchain w/ dynamic library, threads, C++"
> +       depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
> --
> 2.25.1
>
Best Regards,

Fabrice
