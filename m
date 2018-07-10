From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Jul 2018 11:50:34 +0200
Subject: [Buildroot] [PATCH 1/1] wampcc: needs atomic
In-Reply-To: <20180707160855.1179-1-fontaine.fabrice@gmail.com>
References: <20180707160855.1179-1-fontaine.fabrice@gmail.com>
Message-ID: <20180710115034.7c4c7a6f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sat,  7 Jul 2018 18:08:55 +0200, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.net/results/2f994762d4e01a904c50cf2728a4103e6e79da2a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/wampcc/wampcc.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/wampcc/wampcc.mk b/package/wampcc/wampcc.mk
> index d8e093f679..dcd65f49d5 100644
> --- a/package/wampcc/wampcc.mk
> +++ b/package/wampcc/wampcc.mk
> @@ -11,4 +11,9 @@ WAMPCC_INSTALL_STAGING = YES
>  WAMPCC_LICENSE = MIT
>  WAMPCC_LICENSE_FILES = LICENSE
>  
> +# Uses __atomic_fetch_add_8
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +WAMPCC_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
> +endif

As usual, it would be nicer to handle this directly within the
CMakeLists.txt, but OK.

However, there's one thing we have not handled completely correctly for
all those libatomic issues. Linking with libatomic when
BR2_TOOLCHAIN_HAS_LIBATOMIC is OK, but you're not guaranteed that
libatomic exists. Indeed, libatomic only exists since gcc 4.8.

So a package that use atomic built-ins should both:

 (1) depends on BR2_TOOLCHAIN_HAS_ATOMIC

 (2) link with libatomic if BR2_TOOLCHAIN_HAS_LIBATOMIC

Your commit does (2) correctly, but forgets to do (1). For example, if
you try to build wampcc for Sparc with a gcc 4.7 toolchain, it will
still fail with your commit because libatomic didn't exist back in the
gcc 4.7 days.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
