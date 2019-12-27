From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 27 Dec 2019 22:40:59 +0100
Subject: [Buildroot] [PATCH v3] package/qt5base: fix building with
 correct optimization
In-Reply-To: <20191125112614.93405-1-giulio.benetti@benettiengineering.com>
References: <20191125112614.93405-1-giulio.benetti@benettiengineering.com>
Message-ID: <c61b8d4e-e09b-1db9-6f0d-26701a66fb44@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

+Fabrice.

On 11/25/19 12:26 PM, Giulio Benetti wrote:
> Qt5 has predefined optimization flags depending if you're building for
> size, for debug etc. These flags are defined in
> mkspecs/common/gcc-base.conf:
> 
> QMAKE_CFLAGS_OPTIMIZE      = -O2
> QMAKE_CFLAGS_OPTIMIZE_FULL = -O3
> QMAKE_CFLAGS_OPTIMIZE_DEBUG = -Og
> QMAKE_CFLAGS_OPTIMIZE_SIZE = -Os
> 
> Then, in the same file, they use them to set
> QMAKE_CFLAGS_RELEASE/QMAKE_CXXFLAGS_RELEASE:
> 
> QMAKE_CFLAGS_RELEASE       += $$QMAKE_CFLAGS_OPTIMIZE
> QMAKE_CXXFLAGS_RELEASE    += $$QMAKE_CFLAGS_RELEASE
> 
> At this point there is our chance to override QMAKE_CFLAGS_OPTIMIZE_* in
> qmake.conf, but it's too late, because QMAKE_CFLAGS_RELEASE is already
> set(i.e. -O2) so trying to add or remove QMAKE_CFLAGS_OPTIMIZE(that is
> reset now on) from QMAKE_CLAGS_RELEASE in
> common/features/default_post.prf won't work:
> 
> optimize_size {
>      !isEmpty(QMAKE_CFLAGS_OPTIMIZE):!isEmpty(QMAKE_CFLAGS_OPTIMIZE_SIZE)  {
>          QMAKE_CFLAGS_RELEASE -= $$QMAKE_CFLAGS_OPTIMIZE
>          QMAKE_CXXFLAGS_RELEASE -= $$QMAKE_CFLAGS_OPTIMIZE
>          QMAKE_CFLAGS_RELEASE += $$QMAKE_CFLAGS_OPTIMIZE_SIZE
>          QMAKE_CXXFLAGS_RELEASE += $$QMAKE_CFLAGS_OPTIMIZE_SIZE
>      }
> } else: optimize_full {
>      !isEmpty(QMAKE_CFLAGS_OPTIMIZE):!isEmpty(QMAKE_CFLAGS_OPTIMIZE_FULL)  {
>          QMAKE_CFLAGS_RELEASE -= $$QMAKE_CFLAGS_OPTIMIZE
>          QMAKE_CXXFLAGS_RELEASE -= $$QMAKE_CFLAGS_OPTIMIZE
>          QMAKE_CFLAGS_RELEASE += $$QMAKE_CFLAGS_OPTIMIZE_FULL
>          QMAKE_CXXFLAGS_RELEASE += $$QMAKE_CFLAGS_OPTIMIZE_FULL
>      }
> }
> 
> So let's reset:
> QMAKE_CFLAGS_RELEASE
> QMAKE_CFLAGS_DEBUG
> QMAKE_CXXFLAGS_RELEASE
> QMAKE_CXXFLAGS_DEBUG
> in our qmake.conf.in since the only assignment done in
> mkspecs/common/gcc-base.conf only regards optimization.
> 
> This package is also affected by BR2_TOOLCHAIN_HAS_GCC_BUG_90620 and
> it's been worked around by appending -O0 to CFLAGS/CXXFLAGS. This bug
> prevented workaround to work overriding optimization flags, so solving
> this also solves workaround problem.
> 
> Fixes:
> http://autobuild.buildroot.net/results/ada/adaa9b4bcc6f9d2b5e82c479859a07e8abf5cf13/
> http://autobuild.buildroot.net/results/a83/a83bdd1f3bf309c07abebe871b017c331ed36e67/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

According to: https://patchwork.ozlabs.org/patch/1215790/

Tested-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

-- 
Giulio Benetti
Benetti Engineering sas

> ---
> V1->V2:
> * rewritten entire commit log
> V2->V3:
> * rewritten entire commit log again trying to explain better
> ---
>   package/qt5/qt5base/qmake.conf.in | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/qt5/qt5base/qmake.conf.in b/package/qt5/qt5base/qmake.conf.in
> index 2eb564e172..ae25b2e20f 100644
> --- a/package/qt5/qt5base/qmake.conf.in
> +++ b/package/qt5/qt5base/qmake.conf.in
> @@ -19,6 +19,10 @@ QMAKE_CFLAGS_OPTIMIZE       =
>   QMAKE_CFLAGS_OPTIMIZE_DEBUG =
>   QMAKE_CFLAGS_OPTIMIZE_FULL  =
>   QMAKE_CFLAGS_OPTIMIZE_SIZE  =
> +QMAKE_CFLAGS_DEBUG =
> +QMAKE_CXXFLAGS_DEBUG =
> +QMAKE_CFLAGS_RELEASE =
> +QMAKE_CXXFLAGS_RELEASE =
>   CONFIG                 += nostrip
>   
>   QMAKE_LIBS             += -lrt -lpthread -ldl
> 
