From: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
Date: Sun, 17 Jul 2016 11:06:42 +0900
Subject: [Buildroot] qt5: QT5_QMAKE spec bug
In-Reply-To: <815daf75-807a-f510-bd73-d87e50b72073@stu.hosei.ac.jp>
References: <5f3cc15c-6a24-e41a-993b-7c00d35e5a26@stu.hosei.ac.jp>
 <83bdbc0d-5521-02c6-cffa-c35a6297c0d6@stu.hosei.ac.jp>
 <ADAE54FA6BC6A040A89AC44D7C863F8379FC549B@MAIL-SINTERS-01.sinters-int.fr>
 <c7b1de47-7662-cd58-def1-f82fd70aa533@stu.hosei.ac.jp>
 <20160707160636.505b2da4@free-electrons.com>
 <815daf75-807a-f510-bd73-d87e50b72073@stu.hosei.ac.jp>
Message-ID: <21b75eff-731c-5c5b-d0d1-4b1958d59b11@stu.hosei.ac.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 2016-07-07 23:53, Thomas Petazzoni wrote:
 > Hello,
 >
 > On Thu, 7 Jul 2016 23:31:14 +0900, Akihiko Odaki wrote:
 >
 >> qtwaylandscanner in qt5wayland, a package I made. Actually it can be
 >> built without host-qt5base.
 >
 > No, it cannot (from the link you pointed) :
 >
 > #include <QCoreApplication>
 > #include <QFile>
 > #include <QXmlStreamReader>
 >
 > If it builds on your build machine, it's because you have the Qt5
 > development files installed. But you cannot rely on them being
 > available on the build machine of every Buildroot user.

They seems to be provided by libQt5Bootstrap.

$ grep LIBS output/build/qt5wayland-5.6.1-1/src/qtwaylandscanner/Makefile
LIBS          = $(SUBLIBS) -L/home/root3/buildroot/output/host/usr/lib 
-lQt5Bootstrap -lpthread
	$(LINK) $(LFLAGS) -o $(TARGET) $(OBJECTS) $(OBJCOMP) $(LIBS)

Qt provides the option of host_build and the patch is to utilize it. I 
guess it is limited for use of compiling tools necessary for target build.

See qmake documentation for host_build option.
http://doc.qt.io/qt-5/qmake-environment-reference.html

 >>> Using Python and being a Python package are completely different 
things.
 >>>
 >>> The Python package infrastructure is used by Python modules that use
 >>> distutils or setuptools.
 >>>
 >>> But besides that, lots of packages use Python in their build process,
 >>> even if they are not at all Python modules.
 >>
 >> Anyway, such building tools have no variables for their pathes?
 >
 > Not necessarily. The QT5_QMAKE variable exists precisely because some
 > arguments must be passed to qmake to make it build code for the target.

qmake can have a system for persistent configuration and it is intended 
for such uses, and also allows to distinguish the target build and the 
host build. Shouldn't QT5_QMAKE be removed and use the system?

By the way, the system is already used for some configurations. See 
commit 86db2a76e2f07d003464d5e0383d3ea437dc47d9.

Regards,
Akihiko Odaki
