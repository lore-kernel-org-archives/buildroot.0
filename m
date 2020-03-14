From: Nimai Mahajan <nimaim@gmail.com>
Date: Sat, 14 Mar 2020 14:04:30 -0400
Subject: [Buildroot] [PATCH-for-2020.02.x v2] package/qt5xmlpatterns:
 enable qml module
In-Reply-To: <20200314185314.7504a984@gmx.net>
References: <20200313204415.2036-1-ps.report@gmx.net>
 <20200314151823.39b5c55f@windsurf>
 <CALoSW666gHbAPrO71=5yMA1f-=7Xj=DZ1mcAeRmWkJfUuTwmvQ@mail.gmail.com>
 <20200314185314.7504a984@gmx.net>
Message-ID: <CALoSW67Z3XQYic0uL6=FsPSDy5ZdzW6UyB778K9p8MV0TKAxgg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Mar 14, 2020 at 1:53 PM Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Nimai,
>
> On Sat, 14 Mar 2020 11:22:31 -0400, Nimai Mahajan <nimaim@gmail.com>
> wrote:
>
> > On Sat, Mar 14, 2020 at 10:18 AM Thomas Petazzoni <
> > thomas.petazzoni at bootlin.com> wrote:
> >
> > > Hello Peter,
> > >
> > > On Fri, 13 Mar 2020 21:44:15 +0100
> > > Peter Seiderer <ps.report@gmx.net> wrote:
> > >
> > > > qt5declarative:
> > > >  - remove unneded dependency on qt5mlpatterns
> > > >
> > > > qt5xmlpatterns:
> > > >  - add optional dependency on qt5declarative
> > > >  - add target install step of the optional qml files
> > > >
> > > > Reported-by: Nimai Mahajan <nimaim@gmail.com>
> > > > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > >
> > > Will you send a similar patch for master ?
> > >
> > > Thanks,
> > >
> > > Thomas
> > >
> >
> > Thomas,
> >
> > Please wait for my Tested-by: :)
> >
> > Peter,
> >
> > This is not working for me after using your V2 patch. Perhaps it is my
> own
> > user error. The patch simply seems to change some dependencies around
> > (which looks correct now) and explicitly copies a XmlListModel folder
> into
> > $(TARGET_DIR)/usr/qml/QtQuick, but there is nothing to copy, even with
> the
> > qt5declarative and qt5xmlpatterns packages checked. For reference, here
> is
> > everything mentioning xmllistmodel in the qt5 build directory:
>
> In this case your should get a buildroot error for the copy command..., or
> your .config is wrong..., or you did no re-build of the package?
>

I rebuilt from scratch after patching, so definitely is strange why I did
not get output like yours below. But I will wipe out the entire project,
re-clone, patch, and try again.

>
> >
> > ~/Desktop/test_defconfig_output/build$ find . -iname "*xmllistmodel*"
> > ./qt5declarative-5.12.7/src/quick/doc/images/qml-xmllistmodel-example.png
> >
> ./qt5declarative-5.12.7/tests/testapplications/elements/content/XmlListModelElement.qml
> > ./qt5xmlpatterns-5.12.7/src/imports/xmllistmodel
> > ./qt5xmlpatterns-5.12.7/src/imports/xmllistmodel/xmllistmodel.pro
> > ./qt5xmlpatterns-5.12.7/src/imports/xmllistmodel/qqmlxmllistmodel_p.h
> > ./qt5xmlpatterns-5.12.7/src/imports/xmllistmodel/qqmlxmllistmodel.cpp
> > ./qt5xmlpatterns-5.12.7/tests/auto/qquickxmllistmodel
> > ./qt5xmlpatterns-5.12.7/tests/auto/qquickxmllistmodel/
> qquickxmllistmodel.pro
> >
> ./qt5xmlpatterns-5.12.7/tests/auto/qquickxmllistmodel/tst_qquickxmllistmodel.cpp
> >
> > It seems like the xmllistmodel.pro file there is indeed compiling it as
> a
> > plugin, but there is no XmlListModel in $(STAGING_DIR)/usr/qml because
> > again, it doesn't seem to be compiling it. I don't see anything in the
> > xmlpatterns Makefile that explicitly goes into src/imports and compiles
> it.
>
> The decision is made in the file build/qt5xmlpatterns-5.12.7/src/src.pro:
>
> TEMPLATE = subdirs
> SUBDIRS +=  xmlpatterns
>
> qtHaveModule(qml){
>     SUBDIRS += imports
>     imports.depends = xmlpatterns
> }
>
Ahh I see, thanks!


>
> >
> > Also, in the case there are more imports there in the future, should it
> not
> > be compiling all the projects in build/qt5xmlpatterns-5.12.7/src/imports/
> > imports.pro? This would compile all the projects listed in SUBDIRS
> there,
> > and output the appropriate folder with it's .so, plugins.qmltypes, and
> > qmldir, which then could be copied over.
> >
> > Let me know if I'm missing something.
>
> Try a complete re-build (after make clean)...., in case of failure please
> provide your .config/defconfig...
>

Already provided here:
http://buildroot-busybox.2317881.n4.nabble.com/2020-02-Buildroot-Qt-5-12-missing-XmlListModel-tp249854p249918.html
.

>
> Regards,
> Peter
>
>
> Tested locally with the following defconfig:
>
> BR2_arm=y
> BR2_cortex_a53=y
> BR2_ARM_FPU_NEON_VFPV4=y
> BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
> BR2_BINUTILS_VERSION_2_33_X=y
> BR2_GCC_VERSION_9_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_SYSTEM_DHCP="eth0"
> BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
> BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
> BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay"
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call
> github,raspberrypi,linux,64d0a9870ac14d5eb5253f67d984ae348eec1393)/linux-64d0a9870ac14d5eb5253f67d984ae348eec1393.tar.gz"
> BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
> BR2_LINUX_KERNEL_DTS_SUPPORT=y
> BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-3-b-plus
> bcm2710-rpi-cm3"
> BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> BR2_PACKAGE_QT5=y
> BR2_PACKAGE_QT5BASE_EGLFS=y
> BR2_PACKAGE_QT5QUICKCONTROLS=y
> BR2_PACKAGE_QT5QUICKCONTROLS2=y
> BR2_PACKAGE_QT5XMLPATTERNS=y
> BR2_PACKAGE_RPI_FIRMWARE=y
> BR2_PACKAGE_RPI_USERLAND=y
> BR2_TARGET_ROOTFS_EXT2=y
> BR2_TARGET_ROOTFS_EXT2_4=y
> BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> # BR2_TARGET_ROOTFS_TAR is not set
> BR2_PACKAGE_HOST_DOSFSTOOLS=y
> BR2_PACKAGE_HOST_GENIMAGE=y
> BR2_PACKAGE_HOST_MTOOLS=y
>
>         $ find . -iname "*xmllistmodel*"
>
> ./build/qt5declarative-5.12.7/src/quick/doc/images/qml-xmllistmodel-example.png
>
> ./build/qt5declarative-5.12.7/tests/testapplications/elements/content/XmlListModelElement.qml
> ./build/qt5xmlpatterns-5.12.7/src/imports/xmllistmodel
> ./build/qt5xmlpatterns-5.12.7/src/imports/xmllistmodel/qqmlxmllistmodel.cpp
> ./build/qt5xmlpatterns-5.12.7/src/imports/xmllistmodel/qqmlxmllistmodel_p.h
> ./build/qt5xmlpatterns-5.12.7/src/imports/xmllistmodel/xmllistmodel.pro
>
> ./build/qt5xmlpatterns-5.12.7/src/imports/xmllistmodel/.obj/moc_qqmlxmllistmodel_p.o
>
> ./build/qt5xmlpatterns-5.12.7/src/imports/xmllistmodel/.obj/qqmlxmllistmodel.o
>
> ./build/qt5xmlpatterns-5.12.7/src/imports/xmllistmodel/.moc/moc_qqmlxmllistmodel_p.cpp
>
> ./build/qt5xmlpatterns-5.12.7/src/imports/xmllistmodel/.moc/qqmlxmllistmodel.moc
> ./build/qt5xmlpatterns-5.12.7/tests/auto/qquickxmllistmodel
> ./build/qt5xmlpatterns-5.12.7/tests/auto/qquickxmllistmodel/
> qquickxmllistmodel.pro
>
> ./build/qt5xmlpatterns-5.12.7/tests/auto/qquickxmllistmodel/tst_qquickxmllistmodel.cpp
> ./build/qt5xmlpatterns-5.12.7/qml/QtQuick/XmlListModel
>
> ./build/qt5xmlpatterns-5.12.7/qml/QtQuick/XmlListModel/libqmlxmllistmodelplugin.so
> ./host/arm-buildroot-linux-gnueabihf/sysroot/usr/qml/QtQuick/XmlListModel
>
> ./host/arm-buildroot-linux-gnueabihf/sysroot/usr/qml/QtQuick/XmlListModel/libqmlxmllistmodelplugin.so
> ./target/usr/qml/QtQuick/XmlListModel
> ./target/usr/qml/QtQuick/XmlListModel/libqmlxmllistmodelplugin.so
>
> >
> > Thanks,
> > Nimai
> >
> >
> >
> > > --
> > > Thomas Petazzoni, CTO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
> > >
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200314/817c4312/attachment.html>
