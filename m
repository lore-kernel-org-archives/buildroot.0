From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Tue, 24 Dec 2013 10:15:24 +0200
Subject: [Buildroot] [PATCH] qt5: install headers into /usr/include/qt5
In-Reply-To: <20131224084720.55ea41c3@skate>
References: <1387868037-31734-1-git-send-email-fatih.asici@gmail.com>
 <20131224084720.55ea41c3@skate>
Message-ID: <201312241015.24272.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 24 December 2013 09:47:20 Thomas Petazzoni wrote:
> Dear Fatih A??c?,
> 
> On Tue, 24 Dec 2013 08:53:57 +0200, Fatih A??c? wrote:
> > There are places in Qt's source where headers included with the name of
> > the module subdirectory (e.g. #include <QtCore/QHash>). Therefore, the
> > build system passes the top header directory to the compiler; but this
> > results in a error when building host tools since sysroot/usr/include
> > directory includes architecture specific system headers.
> > 
> > In order to prevent this, install all Qt headers into a subdirectory in
> > /usr/include.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/4f1/4f16c0b38bdd6e40efcc781c12fae
> > 81c0bfabb72/
> > 
> > Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
> 
> With this change, what does the compilation command line of host tools
> look like?

g++ -c -pipe -O2 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -fno-exceptions -Wall -W -D_REENTRANT -DQT_NO_LIBUDEV -DQT_NO_XCB -DQT_NO_XKBCOMMON -
DQT_BUILD_QMLDEVTOOLS_LIB -DQT_BUILDING_QT -DQT_NO_CAST_TO_ASCII -DQT_ASCII_CAST_WARNINGS -DQT_MOC_COMPAT -DQT_USE_QSTRINGBUILDER -DQT_DEPRECATED_WARNINGS -
DQT_DISABLE_DEPRECATED_BEFORE=0x050000 -DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_NO_DEBUG -DQT_BOOTSTRAP_LIB -DQT_BOOTSTRAPPED -
DQT_LITE_UNICODE -DQT_NO_CAST_TO_ASCII -DQT_NO_CODECS -DQT_NO_DATASTREAM -DQT_NO_LIBRARY -DQT_NO_QOBJECT -DQT_NO_SYSTEMLOCALE -DQT_NO_THREAD -DQT_NO_UNICODETABLES -
DQT_NO_USING_NAMESPACE -DQT_NO_DEPRECATED -DQT_NO_TRANSLATION -DQT_QMAKE_LOCATION="/home/fatih/git/buildroot/output/build/qt5base-5.2.0/bin/qmake" -
I/home/fatih/git/buildroot/output/host/usr/mkspecs/linux-g++ -I. -I../../include -I../../include/QtQml -I../../include/QtQml/5.2.0 -I../../include/QtQml/5.2.0/QtQml 
-I/home/fatih/git/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/qt5 -I/home/fatih/git/buildroot/output/host/usr/arm-buildroot-
linux-uclibcgnueabi/sysroot/usr/include/qt5/QtCore -I/home/fatih/git/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/qt5/QtXml -
I/home/fatih/git/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/qt5/QtCore/5.2.0 -I/home/fatih/git/buildroot/output/host/usr/arm-
buildroot-linux-uclibcgnueabi/sysroot/usr/include/qt5/QtCore/5.2.0/QtCore -I/home/fatih/git/buildroot/output/host/usr/arm-buildroot-linux-
uclibcgnueabi/sysroot/usr/include/qt5/QtXml/5.2.0 -I/home/fatih/git/buildroot/output/host/usr/arm-buildroot-linux-
uclibcgnueabi/sysroot/usr/include/qt5/QtXml/5.2.0/QtXml -o .obj/qqmljsparser.o ../qml/parser/qqmljsparser.cpp


> To me, this change seems more like work-arounding a problem in the Qt
> build system rather than a real fix.

Upstream states[1] that including qt headers from sysroot is not a problem
since they don't contain anything platform-specific.

[1] https://bugreports.qt-project.org/browse/QTBUG-35330?focusedCommentId=224486&page=com.atlassian.jira.plugin.system.issuetabpanels:comment-tabpanel#comment-224486
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131224/31cb87b4/attachment-0001.html>
