From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Aug 2018 21:05:45 +0200
Subject: [Buildroot] [PATCH 1/1] qt: fix build on powerpc_e500mc
In-Reply-To: <20180829173654.25751-1-fontaine.fabrice@gmail.com>
References: <20180829173654.25751-1-fontaine.fabrice@gmail.com>
Message-ID: <20180829210545.44e98407@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

Thanks for looking into these annoying remaining build failures, much
appreciated!

On Wed, 29 Aug 2018 19:36:54 +0200, Fabrice Fontaine wrote:
> gcc bug internal compiler error: in validate_condition_mode, at
> config/rs6000/rs6000.c:180744. Bug is fixed since gcc 7.2.
> Workaround is to set -mno-isel, see
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60818 and
> https://gcc.gnu.org/ml/gcc-patches/2016-02/msg01036.html
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/9b9d11b3281a72c8f54fc675408acb96d24d8e7e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/qt/qt.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/package/qt/qt.mk b/package/qt/qt.mk
> index 1dcb05d6af..24ebbfdfdb 100644
> --- a/package/qt/qt.mk
> +++ b/package/qt/qt.mk
> @@ -32,6 +32,15 @@ QT_LDFLAGS = $(TARGET_LDFLAGS)
>  # use an older c++ standard to prevent build failure
>  QT_CXXFLAGS += -std=gnu++98
>  
> +# gcc bug internal compiler error: in validate_condition_mode, at
> +# config/rs6000/rs6000.c:180744. Bug is fixed since gcc 7.2.
> +# Workaround is to set -mno-isel, see
> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60818 and
> +# https://gcc.gnu.org/ml/gcc-patches/2016-02/msg01036.html
> +ifeq ($(BR2_powerpc_e500mc):$(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y:)
> +QT_CXXFLAGS += -mno-isel
> +endif

This looks good, but are you sure the problem is limited to e500mc ?
The e-mail at https://gcc.gnu.org/ml/gcc-patches/2016-02/msg01036.html
that you point says:

""
Target: e500v2 (I was able to reproduce with e500mc, e5500 targets as well).
""

So it would seem like e500mc is not the only affected target. So your
patch will fix the specific autobuilder failure because we happen to be
testing e500mc, but what about e500v2 (BR2_powerpc_8548) or
BR2_powerpc_e5500 ?

Interestingly, the last comment in
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60818 says that the patch
has been backported to gcc 6.x.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
