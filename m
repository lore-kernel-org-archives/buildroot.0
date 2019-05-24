From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 May 2019 22:03:32 +0200
Subject: [Buildroot] [PATCH v2 10/12] package/libcpprestsdk: fix
 BUG_85180 build timeout
In-Reply-To: <20190521133932.81841-11-giulio.benetti@micronovasrl.com>
References: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
 <20190521133932.81841-11-giulio.benetti@micronovasrl.com>
Message-ID: <20190524220332.414e2a84@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 May 2019 15:39:30 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> With Microblaze Gcc version < 8.x build hangs on compiling first files.
> This is due to bug 85180:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
> Bug shows up building libcpprestsdk with optimization but not when
> building with -O0.
> 
> If BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y force using -O0 passing it to
> CXXFLAGS.
> 
> Fixes:
> http://autobuild.buildroot.net/results/706/7065e14917a8bbc0faf21b29183ac55b6c800ee3/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/libcpprestsdk/libcpprestsdk.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libcpprestsdk/libcpprestsdk.mk b/package/libcpprestsdk/libcpprestsdk.mk
> index e8dddeddd7..4be2cb20fb 100644
> --- a/package/libcpprestsdk/libcpprestsdk.mk
> +++ b/package/libcpprestsdk/libcpprestsdk.mk
> @@ -36,4 +36,8 @@ else
>  LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_WEBSOCKETS=ON
>  endif
>  
> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
> +LIBCPPRESTSDK_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -O0"
> +endif

This package is another example why this approach to override CXXFLAGS
is not good. Indeed, after your commit, the package contained this:

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
LIBCPPRESTSDK_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
endif

ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
LIBCPPRESTSDK_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -O0"
endif

Guess what happens when BR2_TOOLCHAIN_HAS_LIBATOMIC=y *and*
BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y ? You loose the -latomic flag. That's
why I really prefer that we define an intermediate <pkg>_CXXFLAGS
variable.

I fixed that up, improved the commit log and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
