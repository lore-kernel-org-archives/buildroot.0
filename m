From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Oct 2015 22:38:16 +0200
Subject: [Buildroot] [PATCH v2] qt: fix build for arm with
	BR2_STATIC_LIBS
In-Reply-To: <1444201366-354-1-git-send-email-alexander.lukichev@gmail.com>
 (Alexander Lukichev's message of "Wed, 7 Oct 2015 10:02:46 +0300")
References: <1444128975-17943-1-git-send-email-alexander.lukichev@gmail.com>
 <1444201366-354-1-git-send-email-alexander.lukichev@gmail.com>
Message-ID: <87io6baklj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Lukichev <alexander.lukichev@gmail.com> writes:

 > Some Buildroot-generated static toolchains for ARM do not have
 > dlfcn.h header, which breaks builds of qt-4.8.7 because its
 > QtCore's plugin loader expects this header to be present (and
 > dynamic libraries to be supported). For certain platforms without
 > dynamic libraries, there is a QT_NO_DYNAMIC_LIBRARY constant
 > defined in plugin loader's source. This patch puts that constant
 > into Qt's build environment if Buildroot is configured without
 > shared library support.

 > Fixes:
 > - http://autobuild.buildroot.net/results/11a4c19638ca211bd2a424fd92602166235c9433
 > - http://autobuild.buildroot.net/results/c056e8781558267f6971a5f017f47e90dcf24e07
 > - http://autobuild.buildroot.net/results/b8f34afa8686e890a1a3882a52081bb6a3b9c13b
 > and several others.

 > Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
 > ---
 > Changes
 > v2: unnecessary Qt patch removed (Arnout).
 > ---
 >  package/qt/qt.mk | 4 ++++
 >  1 file changed, 4 insertions(+)

 > diff --git a/package/qt/qt.mk b/package/qt/qt.mk
 > index e0e5d22..a64d32f 100644
 > --- a/package/qt/qt.mk
 > +++ b/package/qt/qt.mk
 > @@ -203,6 +203,10 @@ else
 >  QT_CONFIGURE_OPTS += -static
 >  endif
 
 > +ifeq ($(BR2_STATIC_LIBS),y)
 > +QT_CONFIGURE_OPTS += -D QT_NO_DYNAMIC_LIBRARY

Hmm, shouldn't this be checking BR2_PACKAGE_QT_STATIC instead?

-- 
Bye, Peter Korsgaard
