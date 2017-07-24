From: Glenn Coombs <glenn.coombs@gmail.com>
Date: Mon, 24 Jul 2017 14:19:04 +0800
Subject: [Buildroot] [PATCH 1/1] Add option to the gst1-plugins-bad
 package to enable/disable the qt plugin.
In-Reply-To: <20170721112225.748ac7a5@windsurf>
References: <CADujc4qKisW=6QyDZjDSUo50Yj+_H4-+7V=2KW32cAzRB_d2Qw@mail.gmail.com>
 <20170721112225.748ac7a5@windsurf>
Message-ID: <CADujc4owoQzFY-7exkd5EBe1m=YMhpfa=-KFsV_k0dffhBgUdA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I think the code needs Qt5 rather than Qt4 as it uses the scene graph
rendering model that only exists in Qt5.  The code in the
output/build/gst1-plugins-bad-1.12.1/ext/qt/ directory needs the following
Qt header files in order to compile:

#include <QtGui/QOpenGLContext>
#include <QtGui/QOpenGLFunctions>
#include <QtQuick/QQuickItem>
#include <QtQuick/QSGTexture>

and ldd shows that libgstqmlgl.so is linked against these Qt libraries:

        libQt5Quick.so.5 => /lib/libQt5Quick.so.5 (0x768e5000)
        libQt5Gui.so.5 => /lib/libQt5Gui.so.5 (0x764b8000)
        libQt5Qml.so.5 => /lib/libQt5Qml.so.5 (0x7611d000)
        libQt5Network.so.5 => /lib/libQt5Network.so.5 (0x75f78000)
        libQt5Core.so.5 => /lib/libQt5Core.so.5 (0x75aa1000)

I've changed the gst1-plugins-bad/Config.in file like this:

config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_QT
    bool "qt"
        depends on BR2_PACKAGE_QT5
    help
      Qt plugin

comment "qt plugin available if Qt5 enabled"
        depends on !BR2_PACKAGE_QT5

which only allows the gst-plugins-bad/qt option to be selected if the Qt5
package has already been selected.  I'm not sure how to handle the
dependencies in the gst1-plugins-bad.mk file.  I think you're right that if
I add a dependency on Qt5 then it will introduce a circular dependency as
the qt5base.mk file has this section:

ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
    # gstreamer 0.10 support is broken in qt5multimedia
    ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
        QT5BASE_CONFIGURE_OPTS += -gstreamer 1.0
        QT5BASE_DEPENDENCIES   += gst1-plugins-base
    else
        QT5BASE_CONFIGURE_OPTS += -no-gstreamer
    endif
endif

Any thoughts on how best to break that circular dependency ?

--
Glenn


On 21 July 2017 at 17:22, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Fri, 21 Jul 2017 17:13:07 +0800, Glenn Coombs wrote:
>
> > +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_QT
> > +       bool "qt"
>
> Don't you need Qt to be built for this plugin to be compiled?
>
> I would expect some "depends on" on Qt here.
>
> Also, what about qt4 vs. qt5 ?
>
> > +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_QT),y)
> > +GST1_PLUGINS_BAD_CONF_OPTS += --enable-qt
>
> I would expect a GST1_PLUGINS_BAD_DEPENDENCIES += statement here, to
> make sure qt or qt5 get built before GStreamer.
>
> Or is Qt not needed to built GStreamer Qt support ?
>
> Also, we have to be careful, because qt5base itself can depend on
> gst1-plugins-base, so we need to be careful to not introduce a circular
> dependency.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170724/6c9baf44/attachment.html>
