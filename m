From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Mon, 30 Jan 2017 18:19:52 +0100
Subject: [Buildroot] [PATCH v5 10/10] python-pyqt5: Fix for Qt 5.8.0
In-Reply-To: <1485439461-4797-11-git-send-email-anaumann@ultratronik.de>
References: <1485439461-4797-1-git-send-email-anaumann@ultratronik.de>
 <1485439461-4797-11-git-send-email-anaumann@ultratronik.de>
Message-ID: <13f3f018-3e37-2937-67c1-0460e7302622@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andreas,

pls see my comment below

On 01/26/2017 03:04 PM, Andreas Naumann wrote:
> Just follow https://code.qt.io/cgit/qt/qtbase.git/commit/?id=2be25273e1fc81c5a9e5124f1444100bdb3d458a
>
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> ---
>  package/python-pyqt5/0002-fix-qt-5.6.2.patch    | 28 -------------------------
>  package/python-pyqt5/0002-fix-qt5.8-build.patch | 28 +++++++++++++++++++++++++
>  2 files changed, 28 insertions(+), 28 deletions(-)
>  delete mode 100644 package/python-pyqt5/0002-fix-qt-5.6.2.patch
>  create mode 100644 package/python-pyqt5/0002-fix-qt5.8-build.patch
>
> diff --git a/package/python-pyqt5/0002-fix-qt-5.6.2.patch b/package/python-pyqt5/0002-fix-qt-5.6.2.patch
> deleted file mode 100644
> index a56af09..0000000
> --- a/package/python-pyqt5/0002-fix-qt-5.6.2.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Fix the build with Qt 5.6.2
> -
> -Building PyQt 5.7 with versions of Qt older than Qt 5.7 is supposed to
> -work, but currently fails in practice. In fact, this is due to the
> -fact that the %Timeline variable in QtCoremod.sip didn't contain the
> -5.6.2 Qt version, so if this version was used, PyQt was assuming it
> -was the later version 5.7, and therefore started enabling APIs only
> -available in Qt 5.7, causing build failures when building against Qt
> -5.6.2.
> -
> -Adding Qt_5_6_2 to the timeline fixes this problem. This fix was
> -suggested by Phil Thompson <phil@riverbankcomputing.com>.
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -
> -Index: PyQt5_gpl-5.7/sip/QtCore/QtCoremod.sip
> -===================================================================
> ---- PyQt5_gpl-5.7.orig/sip/QtCore/QtCoremod.sip	2016-07-25 15:55:37.000000000 +0200
> -+++ PyQt5_gpl-5.7/sip/QtCore/QtCoremod.sip	2016-10-26 15:45:43.577153825 +0200
> -@@ -22,7 +22,7 @@
> - 
> - %Module(name=PyQt5.QtCore, call_super_init=True, default_VirtualErrorHandler=PyQt5, keyword_arguments="Optional", version=1)
> - 
> --%Timeline {Qt_5_0_0 Qt_5_0_1 Qt_5_0_2 Qt_5_1_0 Qt_5_1_1 Qt_5_2_0 Qt_5_2_1 Qt_5_3_0 Qt_5_3_1 Qt_5_3_2 Qt_5_4_0 Qt_5_4_1 Qt_5_4_2 Qt_5_5_0 Qt_5_5_1 Qt_5_6_0 Qt_5_6_1 Qt_5_7_0}
> -+%Timeline {Qt_5_0_0 Qt_5_0_1 Qt_5_0_2 Qt_5_1_0 Qt_5_1_1 Qt_5_2_0 Qt_5_2_1 Qt_5_3_0 Qt_5_3_1 Qt_5_3_2 Qt_5_4_0 Qt_5_4_1 Qt_5_4_2 Qt_5_5_0 Qt_5_5_1 Qt_5_6_0 Qt_5_6_1 Qt_5_6_2 Qt_5_7_0}
> - 
> - %Platforms {WS_X11 WS_WIN WS_MACX}
> - 
> diff --git a/package/python-pyqt5/0002-fix-qt5.8-build.patch b/package/python-pyqt5/0002-fix-qt5.8-build.patch
> new file mode 100644
> index 0000000..d0cf250
> --- /dev/null
> +++ b/package/python-pyqt5/0002-fix-qt5.8-build.patch
> @@ -0,0 +1,28 @@
> +Fix the build with Qt 5.8.0
> +
> +WindowCancelButtonHint and WindowOkButtonHint were removed in qt5 qtbase
> +commit 2be25273e1fc81c5a9e5124f1444100bdb3d458a.
> +
> +Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> +
> +
> +Index: python-pyqt5-5.7/QtCore/sipQtCoreQt.cpp
> +===================================================================
> +--- python-pyqt5-5.7.orig/QtCore/sipQtCoreQt.cpp	2016-12-20 14:53:14.240498721 +0100
> ++++ python-pyqt5-5.7/QtCore/sipQtCoreQt.cpp	2016-12-20 15:01:28.604481049 +0100
> +@@ -1090,7 +1090,6 @@
> +     {sipName_WindingFill, static_cast<int>(Qt::WindingFill), 345},
> +     {sipName_Window, static_cast<int>(Qt::Window), 418},
> +     {sipName_WindowActive, static_cast<int>(Qt::WindowActive), 416},
> +-    {sipName_WindowCancelButtonHint, static_cast<int>(Qt::WindowCancelButtonHint), 418},
> +     {sipName_WindowCloseButtonHint, static_cast<int>(Qt::WindowCloseButtonHint), 418},
> +     {sipName_WindowContextHelpButtonHint, static_cast<int>(Qt::WindowContextHelpButtonHint), 418},
> +     {sipName_WindowDoesNotAcceptFocus, static_cast<int>(Qt::WindowDoesNotAcceptFocus), 418},
> +@@ -1103,7 +1102,6 @@
> +     {sipName_WindowMinimized, static_cast<int>(Qt::WindowMinimized), 416},
> +     {sipName_WindowModal, static_cast<int>(Qt::WindowModal), 415},
> +     {sipName_WindowNoState, static_cast<int>(Qt::WindowNoState), 416},
> +-    {sipName_WindowOkButtonHint, static_cast<int>(Qt::WindowOkButtonHint), 418},
> +     {sipName_WindowOverridesSystemGestures, static_cast<int>(Qt::WindowOverridesSystemGestures), 418},
> +     {sipName_WindowShadeButtonHint, static_cast<int>(Qt::WindowShadeButtonHint), 418},
> +     {sipName_WindowShortcut, static_cast<int>(Qt::WindowShortcut), 391},
This seems to be bogus, the 0002-fix-qt5.8-build.patch tries to patch
the QtCore/sipQtCoreQt.cpp file, which is generated by SIP, so it's not
available during the patching phase directly after extracting. What was
your intention here?
Wouldn't be enough just to remove those 2 members from the
qnamespace.sip file? (I'm totally new to sip, that's why i'm asking ;)

Thanks in advance, regards

Zoltan Gyarmati
https://zgyarmati.de


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170130/07ebd55d/attachment.asc>
