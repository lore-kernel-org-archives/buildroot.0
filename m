From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Aug 2016 21:30:44 +0200
Subject: [Buildroot] the problem with Xorg, QT5 and imx vivant dirver
In-Reply-To: <CAMWiJUu_C8sJ+gaQdxQjAUS5wk_HEwzOdtEp4komzqOeB5XCBA@mail.gmail.com>
References: <CAMWiJUu_C8sJ+gaQdxQjAUS5wk_HEwzOdtEp4komzqOeB5XCBA@mail.gmail.com>
Message-ID: <20160802213044.264e63f8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 2 Aug 2016 17:21:25 +0200, Zhaozhou Meng wrote:
> Hello,
> 
> I'am new to buildroot and I'am working on the buildroot 2016.05 for a
> project based on the board nitrogen6x, freescale imx6q.
> I want to build the QT5 using eglfs, egl and opengl and the Xorg using the
> imx vivant driver.

eglfs is about using Qt5 *without* X.org.

In Qt5, you have the following possibilities

 - linuxfb (raw framebuffer, no acceleration)
 - directfb
 - xcb (which means with X.org support, potentially with OpenGL)
 - eglfs (OpenGL ES without X.org, i.e by using EGL)

> So I choosed :
> X11 as freescale imx-gpu-viv output option ,
> xf86-video-imx-viv as X11R7 driver,
> QT5 Desktop Opengl as opengl support

I don't think you can select Qt5 Desktop OpenGL, as this depends on
full OpenGL support, while the i.MX6 GPU only provides OpenGL ES.

> Another question is that when I choosed the xf86-video-imx-viv as X11R7
> driver, the mesa3D is choosed, it means the imx vivant driver depends on
> mesa3D ?

I'm not sure to remember why Mesa3D is needed for the
xf86-video-imx-viv. Maybe Gary can chime in.

> The output of building like this:
> 
> ln -s libQt5Widgets.so.5.6.0 libQt5Widgets.so
> ln -s libQt5Widgets.so.5.6.0 libQt5Widgets.so.5
> ln -s libQt5Widgets.so.5.6.0 libQt5Widgets.so.5.6
> rm -f ../../lib/libQt5Widgets.so.5.6.0
> mv -f libQt5Widgets.so.5.6.0  ../../lib/
> rm -f ../../lib/libQt5Widgets.so
> rm -f ../../lib/libQt5Widgets.so.5
> rm -f ../../lib/libQt5Widgets.so.5.6
> mv -f libQt5Widgets.so ../../lib/
> mv -f libQt5Widgets.so.5 ../../lib/
> mv -f libQt5Widgets.so.5.6 ../../lib/
> Makefile:45 : la recette pour la cible ? sub-src-make_first ? a ?chou?e
> make[2]: *** [sub-src-make_first] Erreur 2
> package/pkg-generic.mk:195 : la recette pour la cible
> ? /home/plateau/Zhaozhou/buildroot-2016.05/output/build/qt5base-5.6.0/.stamp_built
> ?
> a ?chou?e
> make[1]: ***
> [/home/plateau/Zhaozhou/buildroot-2016.05/output/build/qt5base-5.6.0/.stamp_built]
> Erreur 2
> Makefile:36 : la recette pour la cible ? _all ? a ?chou?e
> make: *** [_all] Erreur 2

Please provide a longer build log: here you're not showing the
interesting message.

Alternatively, please provide the Buildroot .config file that allows to
reproduce the issue.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
