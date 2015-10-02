From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Fri, 02 Oct 2015 12:33:13 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-09-27
In-Reply-To: <20150928063014.85E79102A48@stock.ovh.net>
References: <20150928063014.85E79102A48@stock.ovh.net>
Message-ID: <560E4F59.2050506@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 09/28/2015 09:30 AM, Thomas Petazzoni wrote:
>          arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/11a4c19638ca211bd2a424fd92602166235c9433/

  This, and some other builds [1], fail because of the BR2_STATIC_LIBS configuration. The pre-built toolchain in this case does not have dlfcn.h. The failing source file src/corelib/plugin/qlibrary_unix.cpp has a QT_NO_DYNAMIC_LIBRARY guard constant for this case, which was added to qt by the patch [2]. It makes the module behave correctly when plugins cannot be loaded dynamically, which is the case for BR2_STATIC_LIBS in Buildroot:

#if (defined(Q_OS_VXWORKS) && !defined(VXWORKS_RTP)) || defined (Q_OS_NACL)
#define QT_NO_DYNAMIC_LIBRARY
#endif

QT_BEGIN_NAMESPACE

#if !defined(QT_HPUX_LD) && !defined(QT_NO_DYNAMIC_LIBRARY)
QT_BEGIN_INCLUDE_NAMESPACE
#include <dlfcn.h>
QT_END_INCLUDE_NAMESPACE
#endif

static QString qdlerror()
{
#if defined(QT_NO_DYNAMIC_LIBRARY)
    const char *err = "This platform does not support dynamic libraries.";
#elif !defined(QT_HPUX_LD)
    const char *err = dlerror();
#else
    const char *err = strerror(errno);
#endif
    return err ? QLatin1Char('(') + QString::fromLocal8Bit(err) + QLatin1Char(')'): QString();
}
...and so on.

  The QT_NO_DYNAMIC_LIBRARY constant is defined in the same file for Q_OS_VXWORKS or Q_OS_NACL (from src/corelib/global/qglobal.h). There are also two other constants related to inclusion of dlfcn.h: QT_HPUX_LD (from a platform mkspec's qplatformdefs.h, e.g. for hpux-acc-o64) and VXWORKS_RTP (defined elsewhere than qt package).

  One way to fix the failing builds [1] would be to make this QT_NO_DYNAMIC_LIBRARY defined if BR2_STATIC_LIBS is chosen in the Buildroot configuration, and to do this preferably in an upstream-friendly way but I don't see how this could be done. One option could be to define an mkspec for Buildroot, which seems too heavy. Another is to make a "constant defined elsewhere" available in the qt's compilation environment (like VXWORKS_RTP above). How this could be done? Does adding a Qt-wide BUILDROOT_STATIC (or some such) constant to QT_CXXFLAGS in qt.mk in seem a good idea? Would such a patch (that examines this Buildroot-specific constant in src/corelib/plugin/qlibrary_unix.cpp) look good in Qt's upstream?

  References:
  [1] http://autobuild.buildroot.net/?status=NOK&reason=qt-4.8.7&arch=arm
  [2] https://github.com/mirror/qt/commit/468142db15fe99c70505f507f6c2941706172853

--
Best regards,
  Alexander Lukichev
