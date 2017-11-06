From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Nov 2017 18:41:14 +0100
Subject: [Buildroot] [PATCH] qt5base: add qmake.conf fixup for i.MX
 platforms
In-Reply-To: <20170815161428.7765-1-gary.bisson@boundarydevices.com> (Gary
 Bisson's message of "Tue, 15 Aug 2017 18:14:28 +0200")
References: <20170815161428.7765-1-gary.bisson@boundarydevices.com>
Message-ID: <87375rxq2t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <gary.bisson@boundarydevices.com> writes:

 > As stated in QTBUG-61156 [1], since Qt5.9 all the Qt apps fail to start
 > on i.MX platforms.

 > The reason is that the qmake.conf should apparently now specify which
 > eglfs backend to use.

 > It can be seen in the qmake.conf example for i.MX [2].

 > It has also been integrated into the Yocto meta-freescale layer [3].

 > Although this issue can be worked around by exporting a variable
 > (QT_QPA_EGLFS_INTEGRATION=eglfs_viv), this patch aims at providing
 > a more user-friendly approach by modifying qmake.conf when created.

 > [1]: https://bugreports.qt.io/browse/QTBUG-61156
 > [2]: https://github.com/qt/qtbase/blob/5.9/mkspecs/devices/linux-imx6-g%2B%2B/qmake.conf#L35
 > [3]: https://github.com/Freescale/meta-freescale/blob/master/dynamic-layers/qt5-layer/recipes-qt/qt5/qtbase/0015-Add-eglfs-to-IMX-GPU.patch

 > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
 > ---
 > Hi all,

 > Not sure if this approach is acceptable but my idea was to make this
 > patch as small as possible.

I also don't find it very nice, but OK - Nobody suggested any better
option - So committed after a minor cleanup, thanks.

>  QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_DBUS) += Qt5DBus
 
 > +ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 > +ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)

It is simpler to handle these in a single conditionl - E.G.:

ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST)$(BR2_PACKAGE_IMX_GPU_VIV),yy)

Like it is already done elsewhere in qt5base.mk.

I also added a comment explaining why we do this.

-- 
Bye, Peter Korsgaard
