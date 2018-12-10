From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Dec 2018 20:50:49 +0100
Subject: [Buildroot] [PATCH v1] qt5base: do not change QMAKE_COMPILER in
 g++-base.conf
In-Reply-To: <20181210194615.21904-1-ps.report@gmx.net>
References: <20181210194615.21904-1-ps.report@gmx.net>
Message-ID: <20181210205049.2fc39576@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Dec 2018 20:46:15 +0100, Peter Seiderer wrote:
> The variable QMAKE_COMPILER determines the compiler flavour (e.g.
> gcc, clang, llvm, msvc etc.) and not a compiler path. Changing
> it confuses the platform test of the qt5webengine package
> (mkspecs/features/platform.prf):
> 
>   defineTest(isPlatformSupported) {
>     QT_FOR_CONFIG += gui-private
>     linux {
>       if(!gcc:!clang)|intel_icc {
>         skipBuild("Qt WebEngine on Linux requires clang or GCC.")
>         return(false)
>       }
>       gcc:!clang:!isGCCVersionSupported(): return(false)
>     }
>   }
> 
> Revert the variable change introduced by commit 'package/qt5/qt5base: use
> ccache for building host code' ([2]).
> 
> Fixes raspberrypi3_qt5we_defconfig/qt5webengine build ([1]):
> 
>   Qt WebEngine on Linux requires clang or GCC.
>   QtWebEngine will not be built.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/131217091
> [2] https://git.buildroot.net/buildroot/commit/?id=c2ea056a1b34fd1354100d08e603b9374e225968
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt5/qt5base/qt5base.mk | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks. Thanks a lot for tracking this down and
fixing my mistake :-/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
