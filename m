From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 13 Mar 2020 21:33:44 +0100
Subject: [Buildroot] 2020.02 Buildroot - Qt 5.12 missing XmlListModel
In-Reply-To: <CALoSW646KA6PdN=0dLd3h5vnmn8UUN7R=riLTXM2kk10VqTb7Q@mail.gmail.com>
References: <1584022828143-0.post@n4.nabble.com>
 <20200312192352.08aa5102@gmx.net>
 <CALoSW646KA6PdN=0dLd3h5vnmn8UUN7R=riLTXM2kk10VqTb7Q@mail.gmail.com>
Message-ID: <20200313213344.17be85be@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nimai,

On Thu, 12 Mar 2020 16:23:21 -0400, Nimai Mahajan <nimaim@gmail.com> wrote:

> On Thu, Mar 12, 2020, 2:23 PM Peter Seiderer <ps.report@gmx.net> wrote:
>
> > Hello,
> >
> > On Thu, 12 Mar 2020 09:20:28 -0500 (CDT), nimaim <nimaim@gmail.com> wrote:
> >
> > > To the Qt maintainers ... it seems Qt 5.12 moved some libs from the old,
> > now
> > > deprecated qt5declarative package to qt5xmlpatterns. See here:
> > > https://bugs.archlinux.org/task/60889. Some of the components such as
> > > XmlListModel are no longer working (as well as other libs that it
> > included,
> > > I'm guessing). See directory listing for this particular module between
> > 5.9
> > > and 5.12 builds in Buildroot:
> > >
> > > 5.9:
> > >
> > > find . -name *"xmllistmodel*"
> > > ./qt5declarative-5.9.4/src/quick/doc/images/qml-xmllistmodel-example.png
> > > ./qt5declarative-5.9.4/src/imports/xmllistmodel
> > > ./qt5declarative-5.9.4/src/imports/xmllistmodel/xmllistmodel.pro
> > > ./qt5declarative-5.9.4/src/imports/xmllistmodel/.obj/qqmlxmllistmodel.o
> > >
> > ./qt5declarative-5.9.4/src/imports/xmllistmodel/.obj/moc_qqmlxmllistmodel_p.o
> > >
> > ./qt5declarative-5.9.4/src/imports/xmllistmodel/.moc/moc_qqmlxmllistmodel_p.cpp
> > > ./qt5declarative-5.9.4/src/imports/xmllistmodel/.moc/qqmlxmllistmodel.moc
> > > ./qt5declarative-5.9.4/src/imports/xmllistmodel/qqmlxmllistmodel_p.h
> > > ./qt5declarative-5.9.4/src/imports/xmllistmodel/qqmlxmllistmodel.cpp
> > >
> > ./qt5declarative-5.9.4/qml/QtQuick/XmlListModel/libqmlxmllistmodelplugin.so
> > > ./qt5declarative-5.9.4/tests/auto/quick/qquickxmllistmodel
> > > ./qt5declarative-5.9.4/tests/auto/quick/qquickxmllistmodel/
> > qquickxmllistmodel.pro
> > >
> > ./qt5declarative-5.9.4/tests/auto/quick/qquickxmllistmodel/tst_qquickxmllistmodel.cpp
> > >
> > > 5.12:
> > >
> > > find . -iname "*xmllistmodel*"
> > > NO RESULTS
> >
> > Enable 'BR2_PACKAGE_QT5XMLPATTERNS=y' in your buildroot .config file?
> >
> > Regards,
> > Peter
> >
>
> Thank you for getting back to me Peter.
>
> No, that does not fix it as I already have it enabled. Explicitly adding QT
> += xmlpatterns to the .pro file. also does not work. It is unable to find
> it because it's never built. I showed the dir listing of Qt 5.12.x on my
> host because it shows it truly is a separate lib, so while it's part of the
> xmlpatterns package now, it should still build a qmlxmllistmodelplugin.so
> as far as I can see.
>
> >
> > Note: the suggestion is completely untested, in case it does not help
> > (maybe some target install handling is missing) please provide
> > a failing defconfig (and a failing example - best from qt5-examples
> > BR2_PACKAGE_QT5BASE_EXAMPLES=y and /usr/lib/qt/examples/... on
> > the target)...
> >
>
> I will post my defconfig in a bit, on mobile at the moment. I can also
> build the examples and run it if you think it would help, just to ensure Qt
> and other QtQuick components are working, but the simple error message you
> get if you have a dependency on "import QtQuick.XmlListModel" is: "module
> "QtQuick.XmlListModel" is not installed".

Thanks for the bug report, I think the main problem was a wrong/legacy
dependency qt5declarative --> qt5xmlpatterns, instead of the other
way round and a missing target install of the qml parts of the package
qt5xmlpatterns....should be fixed by [1] (only compile tested, not yet
runtime tested)...

Regards,
Peter

[1] https://patchwork.ozlabs.org/patch/1254668/

>
> I was just wondering if you saw something amiss at a quick glance to fix
> this. I'll dig around some more and compare it to the old Qt 5.9.x Makefile
> from an older BR.
>
> >
> > >
> > > Taking another directory listing from the official installer on my 64 bit
> > > Mint host shows they should be there:
> > >
> > > ~/Qt/5.12.5/gcc_64$ find . -iname "*xmllistmodel*"
> > > ./qml/QtQuick/XmlListModel
> > > ./qml/QtQuick/XmlListModel/libqmlxmllistmodelplugin.so
> > >
> > > I just wanted to make sure I'm not missing anything. This change broke my
> > > Qt5 project. Any simple patch to this?
> > >
> > >
> > >
> > >
> > >
> > > --
> > > Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> >
