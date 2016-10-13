From: Johan Derycke <johanderycke@gmail.com>
Date: Thu, 13 Oct 2016 15:36:06 +0000
Subject: [Buildroot] [git commit] package/qt5webkit: needs host-python
In-Reply-To: <20160727194132.9961281E64@busybox.osuosl.org>
References: <20160727194132.9961281E64@busybox.osuosl.org>
Message-ID: <CAKHhJn2hktrsp8+5fuqAZqM8Tk9C=BShM8mOnZVyR=uRT042sA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I think there is an issue with this patch.

We make a link in $(@D)/bin/python:

define QT5WEBKIT_PYTHON2_SYMLINK
  echo  $(@D)
  mkdir -p $(@D)/bin
  ln -sf $(HOST_DIR)/usr/bin/python2 $(@D)/bin/python
endef


But QT5WEBKIT_INSTALL_TARGET_CMDS copies $(@D)/bin/python to the target dir:

define QT5WEBKIT_INSTALL_TARGET_CMDS
  cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebKit*.so.* $(TARGET_DIR)/usr/lib
  cp -dpf $(@D)/bin/* $(TARGET_DIR)/usr/bin/
  $(QT5WEBKIT_INSTALL_TARGET_QMLS)
endef

This overwrites the target python link with a bogus one.

The bin folder only contains 'jsc' which don't need. So removing the cp
solves it for me.

best regards,

Johan




On Wed, 27 Jul 2016 at 21:41 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

commit:
https://git.buildroot.net/buildroot/commit/?id=ac16793eaaabfced0312420759e3a66cdaa1ea8e

branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master



The Qt5Webkit build system hard-codes calls to 'python', but only really

supports python2.



We fix that similarly as we did in nodejs, by adding a python->python2

symlink early in the PATH when configuring/building Qt5Webkit, and

adding host-python in the dependency list.



Fixes:


http://autobuild.buildroot.org/results/ea4/ea4dd00ee585f9f9ea1927b8b5fd9035e6733420/


http://autobuild.buildroot.org/results/323/323ba220fae70d94c81bab9a348be844e90ace91/


http://autobuild.buildroot.org/results/6c2/6c20c9e222f94e6b70b97b87e1393dd16da2718c/



Also slightly reorganise the dependency list, now that it no longer fits

on a single line.



Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---

 package/qt5/qt5webkit/qt5webkit.mk | 20 ++++++++++++++++----

 1 file changed, 16 insertions(+), 4 deletions(-)



diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/
qt5webkit.mk

index e6e8fe3..a47a235 100644

--- a/package/qt5/qt5webkit/qt5webkit.mk

+++ b/package/qt5/qt5webkit/qt5webkit.mk

@@ -8,7 +8,9 @@ QT5WEBKIT_VERSION = b889f460280ad98c89ede179bd3b9ce9cb02002b

 # Using GitHub since it supports downloading tarballs from random commits.

 # The http://code.qt.io/cgit/qt/qtwebkit.git/ repo doesn't allow to do so.

 QT5WEBKIT_SITE = $(call github,qtproject,qtwebkit,$(QT5WEBKIT_VERSION))

-QT5WEBKIT_DEPENDENCIES = qt5base sqlite host-ruby host-gperf host-bison
host-flex

+QT5WEBKIT_DEPENDENCIES = \

+       host-bison host-flex host-gperf host-python host-ruby \

+       qt5base sqlite

 QT5WEBKIT_INSTALL_STAGING = YES



 QT5WEBKIT_LICENSE_FILES = Source/WebCore/LICENSE-LGPL-2
Source/WebCore/LICENSE-LGPL-2.1

@@ -31,6 +33,16 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)

 QT5WEBKIT_DEPENDENCIES += qt5declarative

 endif



+# QtWebkit's build system uses python, but only supports python2. We work

+# around this by forcing python2 early in the PATH, via a python->python2

+# symlink.

+QT5WEBKIT_ENV = PATH=$(@D)/bin:$(BR_PATH)

+define QT5WEBKIT_PYTHON2_SYMLINK

+       mkdir -p $(@D)/bin

+       ln -sf $(HOST_DIR)/usr/bin/python2 $(@D)/bin/python

+endef

+QT5WEBKIT_PRE_CONFIGURE_HOOKS += QT5WEBKIT_PYTHON2_SYMLINK

+

 # Since we get the source from git, generated header files are not
included.

 # qmake detects that header file generation (using the syncqt tool) must be

 # done based on the existence of a .git directory (cfr. the git_build
config

@@ -39,15 +51,15 @@ endif

 # create an empty .git directory.

 define QT5WEBKIT_CONFIGURE_CMDS

        mkdir -p $(@D)/.git

-       (cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)

+       (cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV)
$(HOST_DIR)/usr/bin/qmake)

 endef



 define QT5WEBKIT_BUILD_CMDS

-       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)

+       $(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(MAKE) -C $(@D)

 endef



 define QT5WEBKIT_INSTALL_STAGING_CMDS

-       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install

+       $(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(MAKE) -C $(@D) install

        $(QT5_LA_PRL_FILES_FIXUP)

 endef



_______________________________________________

buildroot mailing list

buildroot at busybox.net

http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161013/b292357a/attachment.html>
