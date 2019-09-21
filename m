From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 13:42:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5base: fix icu detection
 in Qt 5.6.3
In-Reply-To: <20190913124753.24307-1-andrej.skvortzov@gmail.com>
References: <20190913124753.24307-1-andrej.skvortzov@gmail.com>
Message-ID: <ad2094a3-b3bf-defd-70ce-1519eb033032@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Andrey,

On 13/09/2019 14:47, Andrey Skvortsov wrote:
> icu is required to build Q5tWebkit.
> When UChar is defined as char16_t in ICU, then qtbase fails to detect ICU.
> The issue is described https://bugreports.qt.io/browse/QTBUG-49586
> 
> Build fails with following error messages:
> ...
> ustring.h:473:20: error: ?UChar? does not name a type
>  u_strCompare(const UChar *s1, int32_t length1,
>                     ^
>           ^
> make[2]: *** [Makefile:195: icu.o] Error 1
> ICU disabled.
> The ICU library support cannot be enabled.
> 
> Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> ---
>  .../0004-fix-icu-build-for-qt5webkit.patch    | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/qt5/qt5base/5.6.3/0004-fix-icu-build-for-qt5webkit.patch
> 
> diff --git a/package/qt5/qt5base/5.6.3/0004-fix-icu-build-for-qt5webkit.patch b/package/qt5/qt5base/5.6.3/0004-fix-icu-build-for-qt5webkit.patch
> new file mode 100644
> index 0000000000..849770e2e0
> --- /dev/null
> +++ b/package/qt5/qt5base/5.6.3/0004-fix-icu-build-for-qt5webkit.patch
> @@ -0,0 +1,39 @@
> +diff -purN qt5base-5.6.3.orig/config.tests/unix/compile.test qt5base-5.6.3/config.tests/unix/compile.test
> +--- qt5base-5.6.3.orig/config.tests/unix/compile.test	2019-08-11 00:35:33.181545706 +0300
> ++++ qt5base-5.6.3/config.tests/unix/compile.test	2017-09-06 15:13:54.000000000 +0300

 Patches must have a description (like a commit message), including a
signed-off-by. You should also specify the upstream status of the patch. And
since qt5base is a git project, preferably it should be a git formatted patch. See

 https://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches


 Regards,
 Arnout


> +@@ -47,7 +47,7 @@ while [ "$#" -gt 0 ]; do
> +         INC=`echo $PARAM | sed -e 's/^-I//'`
> +         INCLUDEPATH="$INCLUDEPATH \"$INC\""
> +         ;;
> +-    -f*|-D*)
> ++    -f*|-D*|-std=*)
> +         CFLAGS="$CFLAGS \"$PARAM\""
> +         CXXFLAGS="$CXXFLAGS \"$PARAM\""
> +         ;;
> +diff -purN qt5base-5.6.3.orig/configure qt5base-5.6.3/configure
> +--- qt5base-5.6.3.orig/configure	2019-08-11 00:57:45.488214036 +0300
> ++++ qt5base-5.6.3/configure	2017-09-06 15:13:54.000000000 +0300
> +@@ -5183,8 +5183,10 @@ fi
> + 
> + # auto-detect libicu support
> + if [ "$CFG_ICU" != "no" ]; then
> ++    QT_CXXFLAGS_ICU="-std=c++11"
> ++    if compileTest unix/icu "ICU" $QT_CXXFLAGS_ICU; then
> +-    if compileTest unix/icu "ICU"; then
> +         [ "$CFG_ICU" = "auto" ] && CFG_ICU=yes
> ++        QMakeVar set QT_CXXFLAGS_ICU "$QT_CXXFLAGS_ICU"
> +     else
> +         if [ "$CFG_ICU" = "auto" ]; then
> +             CFG_ICU=no
> +diff -purN qt5base-5.6.3.orig/doc/Makefile qt5base-5.6.3/doc/Makefile
> +diff -purN qt5base-5.6.3.orig/src/corelib/tools/tools.pri qt5base-5.6.3/src/corelib/tools/tools.pri
> +--- qt5base-5.6.3.orig/src/corelib/tools/tools.pri	2019-08-11 00:45:45.073818635 +0300
> ++++ qt5base-5.6.3/src/corelib/tools/tools.pri	2017-09-06 15:13:54.000000000 +0300
> +@@ -169,6 +169,7 @@ contains(QT_CONFIG,icu) {
> +                tools/qcollator_icu.cpp \
> +                tools/qtimezoneprivate_icu.cpp
> +     DEFINES += QT_USE_ICU
> ++    QMAKE_CXXFLAGS += $$QT_CXXFLAGS_ICU
> + } else: win32 {
> +     SOURCES += tools/qcollator_win.cpp
> + } else: macx {
> 
