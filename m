From: Nimai Mahajan <nimaim@gmail.com>
Date: Sat, 14 Mar 2020 11:22:31 -0400
Subject: [Buildroot] [PATCH-for-2020.02.x v2] package/qt5xmlpatterns:
 enable qml module
In-Reply-To: <20200314151823.39b5c55f@windsurf>
References: <20200313204415.2036-1-ps.report@gmx.net>
 <20200314151823.39b5c55f@windsurf>
Message-ID: <CALoSW666gHbAPrO71=5yMA1f-=7Xj=DZ1mcAeRmWkJfUuTwmvQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Mar 14, 2020 at 10:18 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Peter,
>
> On Fri, 13 Mar 2020 21:44:15 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > qt5declarative:
> >  - remove unneded dependency on qt5mlpatterns
> >
> > qt5xmlpatterns:
> >  - add optional dependency on qt5declarative
> >  - add target install step of the optional qml files
> >
> > Reported-by: Nimai Mahajan <nimaim@gmail.com>
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>
> Will you send a similar patch for master ?
>
> Thanks,
>
> Thomas
>

Thomas,

Please wait for my Tested-by: :)

Peter,

This is not working for me after using your V2 patch. Perhaps it is my own
user error. The patch simply seems to change some dependencies around
(which looks correct now) and explicitly copies a XmlListModel folder into
$(TARGET_DIR)/usr/qml/QtQuick, but there is nothing to copy, even with the
qt5declarative and qt5xmlpatterns packages checked. For reference, here is
everything mentioning xmllistmodel in the qt5 build directory:

~/Desktop/test_defconfig_output/build$ find . -iname "*xmllistmodel*"
./qt5declarative-5.12.7/src/quick/doc/images/qml-xmllistmodel-example.png
./qt5declarative-5.12.7/tests/testapplications/elements/content/XmlListModelElement.qml
./qt5xmlpatterns-5.12.7/src/imports/xmllistmodel
./qt5xmlpatterns-5.12.7/src/imports/xmllistmodel/xmllistmodel.pro
./qt5xmlpatterns-5.12.7/src/imports/xmllistmodel/qqmlxmllistmodel_p.h
./qt5xmlpatterns-5.12.7/src/imports/xmllistmodel/qqmlxmllistmodel.cpp
./qt5xmlpatterns-5.12.7/tests/auto/qquickxmllistmodel
./qt5xmlpatterns-5.12.7/tests/auto/qquickxmllistmodel/qquickxmllistmodel.pro
./qt5xmlpatterns-5.12.7/tests/auto/qquickxmllistmodel/tst_qquickxmllistmodel.cpp

It seems like the xmllistmodel.pro file there is indeed compiling it as a
plugin, but there is no XmlListModel in $(STAGING_DIR)/usr/qml because
again, it doesn't seem to be compiling it. I don't see anything in the
xmlpatterns Makefile that explicitly goes into src/imports and compiles it.

Also, in the case there are more imports there in the future, should it not
be compiling all the projects in build/qt5xmlpatterns-5.12.7/src/imports/
imports.pro? This would compile all the projects listed in SUBDIRS there,
and output the appropriate folder with it's .so, plugins.qmltypes, and
qmldir, which then could be copied over.

Let me know if I'm missing something.

Thanks,
Nimai



> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200314/a7e06bba/attachment.html>
