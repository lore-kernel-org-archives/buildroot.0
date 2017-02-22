From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 22 Feb 2017 21:39:00 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-02-20
In-Reply-To: <20170221072902.80C59207F9@mail.free-electrons.com>
References: <20170221072902.80C59207F9@mail.free-electrons.com>
Message-ID: <20170222213900.4ba95a1f@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 Feb 2017 08:29:02 +0100 (CET), Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

>        sparc |                  libv4l-1.12.2 | NOK | http://autobuild.buildroot.net/results/3f13042565df20087e007949f653942c0462e334


From build-end.log:

  CXXLD    qv4l2

qv4l2-qv4l2.o: In function `QtPrivate::RefCount::deref()':
qv4l2.cpp:(.text._ZN9QtPrivate8RefCount5derefEv[_ZN9QtPrivate8RefCount5derefEv]+0x24): undefined reference to `__sync_fetch_and_add_4'
qv4l2-qv4l2.o: In function `QString::QString(QString const&)':
qv4l2.cpp:(.text._ZN7QStringC2ERKS_[_ZN7QStringC5ERKS_]+0x54): undefined reference to `__sync_fetch_and_add_4'
qv4l2-vbi-tab.o: In function `QtPrivate::RefCount::ref()':
vbi-tab.cpp:(.text._ZN9QtPrivate8RefCount3refEv[_ZN9QtPrivate8RefCount3refEv]+0x24): undefined reference to `__sync_fetch_and_add_4'
collect2: error: ld returned 1 exit status
make[4]: *** [qv4l2] Error 1
make[4]: Leaving directory `/home/test/autobuild/run/instance-2/output/build/libv4l-1.12.2/utils/qv4l2'


This can be fixed by adding the following two lines to package/libv4l/libv4l.mk:

LIBV4L_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=gnu++0x"
LIBV4L_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -latomic"

This forces the same compile/link flags as would be used when (successfully)
compiling using the libv4l-1.12.2/utils/qv4l2/qv4l2.pro file...

I am not sure if this is a feasible solution? And when yes on which config
parameters this additional compile/link flags should depend?


ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8)$(BR2_PACKAGE_QT5_VERSION_5_6),yy)
LIBV4L_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=gnu++0x"
ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
LIBV4L_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -latomic"
endif
endif


Regards,
Peter
