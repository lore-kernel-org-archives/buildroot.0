From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 29 Nov 2013 09:10:54 +0200
Subject: [Buildroot] [PATCH 2/2] qt5base: use ccache if enabled
In-Reply-To: <87eh60xjl4.fsf@dell.be.48ers.dk>
References: <1384436438-2119-1-git-send-email-fatih.asici@gmail.com>
 <1384436438-2119-2-git-send-email-fatih.asici@gmail.com>
 <87eh60xjl4.fsf@dell.be.48ers.dk>
Message-ID: <201311290910.54807.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 29 November 2013 00:11:35 Peter Korsgaard wrote:
>  >  --- /dev/null
>  >  +++ b/mkspecs/devices/linux-buildroot-g++/qmake.conf
>  > 
>  > -@@ -0,0 +1,11 @@
>  > +@@ -0,0 +1,15 @@
>  > 
>  >  +include(../common/linux_device_pre.conf)
>  >  +
>  > 
>  > ++# modifications to g++.conf
>  > ++QMAKE_CC                = $${BUILDROOT_CCACHE} $${QMAKE_CC}
>  > ++QMAKE_CXX               = $${BUILDROOT_CCACHE} $${QMAKE_CXX}
>  > ++
>  > 
>  >  +#modifications to gcc-base.conf
>  >  +QMAKE_CFLAGS           += $${BUILDROOT_COMPILER_CFLAGS}
>  >  +QMAKE_CXXFLAGS         += $${BUILDROOT_COMPILER_CXXFLAGS}
>  > 
>  > diff --git a/package/qt5/qt5base/qt5base.mk
>  > b/package/qt5/qt5base/qt5base.mk index febdc9b..a1d5dba 100644
>  > --- a/package/qt5/qt5base/qt5base.mk
>  > +++ b/package/qt5/qt5base/qt5base.mk
>  > @@ -168,6 +168,7 @@ define QT5BASE_CONFIGURE_CMDS
>  > 
>  >  		-nomake examples -nomake tests \
>  >  		-device buildroot \
>  >  		-device-option CROSS_COMPILE="$(TARGET_CROSS)" \
>  > 
>  > +		-device-option BUILDROOT_CCACHE="$(CCACHE)" \
> 
> Can't we just pass it in CROSS_COMPILE?

No. linux_device_pre.conf uses CROSS_COMPILE for other tools, too (ar, 
objcopy, ...).

# modifications to g++-unix.conf
QMAKE_CC                = $${CROSS_COMPILE}gcc
QMAKE_CXX               = $${CROSS_COMPILE}g++
QMAKE_LINK              = $${QMAKE_CXX}
QMAKE_LINK_SHLIB        = $${QMAKE_CXX}

# modifications to linux.conf
QMAKE_AR                = $${CROSS_COMPILE}ar cqs
QMAKE_OBJCOPY           = $${CROSS_COMPILE}objcopy
QMAKE_NM                = $${CROSS_COMPILE}nm -P
QMAKE_STRIP             = $${CROSS_COMPILE}strip
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131129/258754f8/attachment.html>
