From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Mon, 27 Apr 2020 12:58:18 +0530
Subject: [Buildroot] [PATCH 1/1] package/gflags: force Release mode
In-Reply-To: <20200425162244.1289359-1-fontaine.fabrice@gmail.com>
References: <20200425162244.1289359-1-fontaine.fabrice@gmail.com>
Message-ID: <CA+NV+V=_q_XTaYSfcYDE9xunqd4SAo+AB_5c6oNDS-kXNq6yUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Apr 25, 2020 at 9:51 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Force Release otherwise libraries will be suffixed by _debug which will raise
> unexpected build failures with packages that use gflags (e.g. rocksdb)
>
> Fixes:
>  - http://autobuild.buildroot.org/results/3545774258babc3584f69e7d523efdf7fff1acb5
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gflags/gflags.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/package/gflags/gflags.mk b/package/gflags/gflags.mk
> index c4fce45b3e..f32869f70d 100644
> --- a/package/gflags/gflags.mk
> +++ b/package/gflags/gflags.mk
> @@ -10,8 +10,12 @@ GFLAGS_INSTALL_STAGING = YES
>  GFLAGS_LICENSE = BSD-3-Clause
>  GFLAGS_LICENSE_FILES = COPYING.txt
>
> +# Force Release otherwise libraries will be suffixed by _debug which will raise
> +# unexpected build failures with packages that use gflags (e.g. rocksdb)
> +GFLAGS_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release

I think pkgconfig can solve this problem. Rocksdb has CMake support
which uses pkgconfig to find gflags.

Regards,
Rahul

> +
>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
> -GFLAGS_CONF_OPTS = -DBUILD_gflags_LIB=OFF \
> +GFLAGS_CONF_OPTS += -DBUILD_gflags_LIB=OFF \
>         -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -DNO_THREADS"
>  endif
>
> --
> 2.25.1
>
