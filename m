From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 14 Oct 2016 10:56:55 +0200
Subject: [Buildroot] qt5webkit: host-python dependency issue in Python3
	environment
In-Reply-To: <CAGm1_ksAHMEYWSpdsdB9CD1soJkLyxppE=n=nokuN0ho-sktew@mail.gmail.com>
References: <CAGm1_ktbKzd7jbaTRryp27yZF94HMPZnZTfMw+sC1vCC8-mVvA@mail.gmail.com>
 <CAGm1_ksAHMEYWSpdsdB9CD1soJkLyxppE=n=nokuN0ho-sktew@mail.gmail.com>
Message-ID: <CAGm1_ktOxQfj5mFH1SH_7vB8O0bAjKo6RWVbikLMgp4S5xhDfA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 14, 2016 at 9:56 AM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> On Fri, Oct 14, 2016 at 9:53 AM, Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
>> My project uses both Python3 and Qt5 including qt5webkit package. The
>> problem in this particular constellation is, that
>> output/target/usr/bin/python is a symlink to
>> output/host/usr/bin/python2. i.e. host-python2 will be also built.
>> This makes python usage on target impossible.
>>
>> I think this happens because qt5webkit has host-python dependency
>> regardless of the selected Python flavor.
>>
>> Can qt5webkit be also built with host-python3?
>
> I've just seen that Johan Derycke encounters this issue too.

I've removed output/build/host-python-2.7.12 and made following hack:

diff --git a/package/qt5/qt5webkit/qt5webkit.mk
b/package/qt5/qt5webkit/qt5webkit.mk
index a47a235..b2db756 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -9,7 +9,7 @@ QT5WEBKIT_VERSION = b889f460280ad98c89ede179bd3b9ce9cb02002b
 # The http://code.qt.io/cgit/qt/qtwebkit.git/ repo doesn't allow to do so.
 QT5WEBKIT_SITE = $(call github,qtproject,qtwebkit,$(QT5WEBKIT_VERSION))
 QT5WEBKIT_DEPENDENCIES = \
-       host-bison host-flex host-gperf host-python host-ruby \
+       host-bison host-flex host-gperf host-python3 host-ruby \
        qt5base sqlite
 QT5WEBKIT_INSTALL_STAGING = YES

@@ -37,11 +37,11 @@ endif
 # around this by forcing python2 early in the PATH, via a python->python2
 # symlink.
 QT5WEBKIT_ENV = PATH=$(@D)/bin:$(BR_PATH)
-define QT5WEBKIT_PYTHON2_SYMLINK
-       mkdir -p $(@D)/bin
-       ln -sf $(HOST_DIR)/usr/bin/python2 $(@D)/bin/python
-endef
-QT5WEBKIT_PRE_CONFIGURE_HOOKS += QT5WEBKIT_PYTHON2_SYMLINK
+#define QT5WEBKIT_PYTHON2_SYMLINK
+#      mkdir -p $(@D)/bin
+#      ln -sf $(HOST_DIR)/usr/bin/python2 $(@D)/bin/python
+#endef
+#QT5WEBKIT_PRE_CONFIGURE_HOOKS += QT5WEBKIT_PYTHON2_SYMLINK

 # Since we get the source from git, generated header files are not included.
 # qmake detects that header file generation (using the syncqt tool) must be

After this I've removed output/build/qt5webkit and rebuilt it. It worked.

@Johan, @Yann could you test this?

I've seen some commits regarding Python 3 build support. Even from
Samuel Martin.

Yegor
