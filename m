From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 3 Oct 2015 23:43:37 +0200
Subject: [Buildroot] [PATCH 12/18] qt5base: remove now-redundant ccache
 handling
In-Reply-To: <1442777030-24036-4-git-send-email-arnout@mind.be>
References: <1442774504-22799-1-git-send-email-arnout@mind.be>
 <1442777030-24036-1-git-send-email-arnout@mind.be>
 <1442777030-24036-4-git-send-email-arnout@mind.be>
Message-ID: <56104C09.4020403@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

Le 20/09/2015 21:23, Arnout Vandecappelle (Essensium/Mind) a ?crit :
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Note that ccache was not and still is not used for the host tools (e.g.
> qmake). This commit only affects the target builds.
> ---

Reviewed-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
Romain

>  package/qt5/qt5base/0002-mkspecs-files.patch       |  6 ++-
>  .../qt5/qt5base/0009-fix-build-with-ccache.patch   | 49 ----------------------
>  package/qt5/qt5base/qt5base.mk                     |  1 -
>  3 files changed, 4 insertions(+), 52 deletions(-)
>  delete mode 100644 package/qt5/qt5base/0009-fix-build-with-ccache.patch
> 
> diff --git a/package/qt5/qt5base/0002-mkspecs-files.patch b/package/qt5/qt5base/0002-mkspecs-files.patch
> index 09c1b67..adeabdf 100644
> --- a/package/qt5/qt5base/0002-mkspecs-files.patch
> +++ b/package/qt5/qt5base/0002-mkspecs-files.patch
> @@ -9,6 +9,8 @@ allows us to easily pass the cross-compiler paths and flags from our
>  qt5.mk.
>  
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +[Arnout: remove ccache support]
> +Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>  
>  Index: b/mkspecs/devices/linux-buildroot-g++/qmake.conf
>  ===================================================================
> @@ -18,8 +20,8 @@ Index: b/mkspecs/devices/linux-buildroot-g++/qmake.conf
>  +include(../common/linux_device_pre.conf)
>  +
>  +# modifications to g++-unix.conf
> -+QMAKE_CC                = $${BR_CCACHE} $${CROSS_COMPILE}gcc
> -+QMAKE_CXX               = $${BR_CCACHE} $${CROSS_COMPILE}g++
> ++QMAKE_CC                = $${CROSS_COMPILE}gcc
> ++QMAKE_CXX               = $${CROSS_COMPILE}g++
>  +
>  +#modifications to gcc-base.conf
>  +QMAKE_CFLAGS           += $${BR_COMPILER_CFLAGS}
> diff --git a/package/qt5/qt5base/0009-fix-build-with-ccache.patch b/package/qt5/qt5base/0009-fix-build-with-ccache.patch
> deleted file mode 100644
> index 896c0ef..0000000
> --- a/package/qt5/qt5base/0009-fix-build-with-ccache.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -Fix QMAKE_CXX/CROSS_COMPILE verification with ccache
> -
> -The use of ccache leads to QMAKE_CXX definitions of the form:
> -
> -    QMAKE_CXX = $${CCACHE} $${CROSS_COMPILE}g++
> -
> -The previous test required QMAKE_CXX to be a single valid (absolute or
> -QMAKE_PATH_ENV-relative) path to an existing file, which was not
> -compatible with definitions of QMAKE_CXX like the one above.
> -
> -Fix this by using only the first value in QMAKE_CXX, which usually
> -points to the compiler executable, or to the ccache executable in the
> -above case.
> -
> -Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
> ----
> - mkspecs/features/device_config.prf | 9 +++++++--
> - 1 file changed, 7 insertions(+), 2 deletions(-)
> -
> -diff --git a/mkspecs/features/device_config.prf b/mkspecs/features/device_config.prf
> -index cd3a0cf..eee4ac6 100644
> ---- a/mkspecs/features/device_config.prf
> -+++ b/mkspecs/features/device_config.prf
> -@@ -19,10 +19,15 @@ defineTest(deviceSanityCheckCompiler) {
> -     else: \
> -         sfx =
> - 
> -+    # Build the compiler filename using the first value in QMAKE_CXX in order to
> -+    # support tools like ccache, which give QMAKE_CXX values of the form:
> -+    #     ccache <path_to_compiler>
> -+    compiler = $$first(QMAKE_CXX)$$sfx
> -+
> -     # Check if the binary exists with an absolute path. Do this check
> -     # before the CROSS_COMPILE empty check below to allow the mkspec
> -     # to derive the compiler path from other device options.
> --    exists($$QMAKE_CXX$$sfx):return()
> -+    exists($$compiler):return()
> - 
> -     # Check for possible reasons of failure
> -     # check if CROSS_COMPILE device-option is set
> -@@ -31,7 +36,7 @@ defineTest(deviceSanityCheckCompiler) {
> -     # Check if QMAKE_CXX points to an executable.
> -     ensurePathEnv()
> -     for (dir, QMAKE_PATH_ENV) {
> --        exists($$dir/$${QMAKE_CXX}$$sfx): \
> -+        exists($$dir/$${compiler}): \
> -             return()
> -     }
> - 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index e783b4d..570cd35 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -189,7 +189,6 @@ define QT5BASE_CONFIGURE_CMDS
>  		-nomake tests \
>  		-device buildroot \
>  		-device-option CROSS_COMPILE="$(TARGET_CROSS)" \
> -		-device-option BR_CCACHE="$(CCACHE)" \
>  		-device-option BR_COMPILER_CFLAGS="$(TARGET_CFLAGS) $(QT5BASE_EXTRA_CFLAGS)" \
>  		-device-option BR_COMPILER_CXXFLAGS="$(TARGET_CXXFLAGS) $(QT5BASE_EXTRA_CFLAGS)" \
>  		$(QT5BASE_CONFIGURE_OPTS) \
> 
