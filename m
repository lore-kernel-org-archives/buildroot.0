From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 29 Mar 2021 12:57:16 +0200
Subject: [Buildroot] [PATCH 1/2] package/qpid-proton: needs threads
In-Reply-To: <20210329101810.793099-1-luca@lucaceresoli.net>
References: <20210329101810.793099-1-luca@lucaceresoli.net>
Message-ID: <CAPi7W83tgTSz6k_94yH4yV5kKeypoRxXwHK95m0v4jixVXbJsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca,

Le lun. 29 mars 2021 ? 12:18, Luca Ceresoli <luca@lucaceresoli.net> a ?crit :
>
> qpid-proton needs threads since commit d4c0fde91da0 ("package/qpid-proton:
> bump to version 0.33.0"), otherwise it fails with:
>
>   /home/buildroot/autobuild/run/instance-0/output-1/build/qpid-proton-0.33.0/c/src/proactor/epoll-internal.h:37:10: fatal error: pthread.h: No such file or directory
>      37 | #include <pthread.h>
>         |          ^~~~~~~~~~~
>   compilation terminated.
Thanks for taking care of this build failure, another option would be
to explicitly set PROACTOR to none.
>
> Fixes:
>   - http://autobuild.buildroot.net/results/8e3/8e3dc1086f58fe3426ab4ac9ea314a3d4e932652/
>   - http://autobuild.buildroot.net/results/e4f/e4f09ea5504ef7746a9e124cade483e430a844bb/
>   - http://autobuild.buildroot.net/results/e6c/e6c122cabc6a21be0277a25aee2df92d74965385/
>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  package/qpid-proton/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/package/qpid-proton/Config.in b/package/qpid-proton/Config.in
> index b49a2afa7eb4..05ba452c5c48 100644
> --- a/package/qpid-proton/Config.in
> +++ b/package/qpid-proton/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_QPID_PROTON
>         bool "qpid-proton"
>         depends on !BR2_STATIC_LIBS # build a shared library
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
>         select BR2_PACKAGE_UTIL_LINUX
>         select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>         help
> @@ -13,5 +14,5 @@ config BR2_PACKAGE_QPID_PROTON
>
>           https://qpid.apache.org/proton/
>
> -comment "qpid-proton needs a toolchain w/ dynamic library"
> -       depends on BR2_STATIC_LIBS
> +comment "qpid-proton needs a toolchain w/ dynamic library, threads"
> +       depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
> --
> 2.25.1
>
Best Regards,

Fabrice
