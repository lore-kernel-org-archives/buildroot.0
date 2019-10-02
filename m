From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 3 Oct 2019 00:36:12 +0200
Subject: [Buildroot] [PATCH v2] package/qt5base: fix building with
 correct optimization
In-Reply-To: <20191002222413.8382-1-giulio.benetti@benettiengineering.com>
References: <910c787-a8f7-53d7-0a89-fe99985c40b9@benettiengineering.com>
 <20191002222413.8382-1-giulio.benetti@benettiengineering.com>
Message-ID: <7ba75a76-5a1e-5ef5-c6fd-b8ef7db35933@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/3/19 12:24 AM, Giulio Benetti wrote:
> In Qt5 mkspecs/features/default_post.prf(included after our qmake.conf):
> debug {
>      QMAKE_CFLAGS += $$QMAKE_CFLAGS_DEBUG
>      QMAKE_CXXFLAGS += $$QMAKE_CXXFLAGS_DEBUG
>      QMAKE_LFLAGS += $$QMAKE_LFLAGS_DEBUG
>      QMAKE_LIBFLAGS += $$QMAKE_LIBFLAGS_DEBUG
> } else {
>      QMAKE_CFLAGS += $$QMAKE_CFLAGS_RELEASE
>      QMAKE_CXXFLAGS += $$QMAKE_CXXFLAGS_RELEASE
>      QMAKE_LFLAGS += $$QMAKE_LFLAGS_RELEASE
>      QMAKE_LIBFLAGS += $$QMAKE_LIBFLAGS_RELEASE
> }
> QMAKE_CFLAGS is set to QMAKE_CFLAGS_RELEASE that in order is set to one
> of QMAKE_CFLAGS_OPTIMIZE depending on qt5 optimization chosen.
> Unfortunately patch:
> https://git.buildroot.net/buildroot/commit/?id=7c0aa83527e0b0179f9e3f73a3e63df1fdc5a6e6
> is not enough, since QMAKE_CFLAGS_RELEASE is set to
> QMAKE_CFLAGS_OPTIMIZE in a unique file, resulting in resetting
> QMAKE_CFLAGS_OPTIMIZE only after QMAKE_FLAGS_RELEASE is set.

Forgot to mention:
QMAKE_CFLAGS_OPTIMIZE is set in mkspecs/common/gcc-base.conf (the unique 
file).

> The only way is to directly reset:
> QMAKE_CFLAGS_RELEASE
> QMAKE_CFLAGS_DEBUG
> QMAKE_CXXFLAGS_RELEASE
> QMAKE_CXXFLAGS_DEBUG
> in our qmake.conf.in.
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
> ---
> V1->V2:
> * rewritten entire commit log
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

-- 
Giulio Benetti
Benetti Engineering sas
