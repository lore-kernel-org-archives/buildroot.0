From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 May 2015 13:33:00 +0200
Subject: [Buildroot] Build Issue when depending on systemd
In-Reply-To: <55506021.60705@gmail.com> (Roman Akopov's message of "Mon, 11
 May 2015 11:54:09 +0400")
References: <55506021.60705@gmail.com>
Message-ID: <87twvjic2b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Roman" == Roman Akopov <adontz@gmail.com> writes:

 > Hello,
 > I have C++/Qt application which does a lot of things, and among them,
 > forwards journald logs to web service. I failed to build it correctly
 > under buildroot-2015-02.

 > Config.in looks like this

 > config BR2_PACKAGE_DASHBOARD_CLIENT
 >     bool "dashboard-client"
 >     depends on BR2_PACKAGE_HAS_LIBEGL
 >     depends on BR2_PACKAGE_QT5
 >     depends on BR2_PACKAGE_QT5_GL_AVAILABLE
 >     depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 >     depends on BR2_PACKAGE_QT5BASE_EGLFS
 >     depends on BR2_PACKAGE_QT5BASE_NETWORK
 >     depends on BR2_PACKAGE_QT5BASE_PNG
 >     depends on BR2_PACKAGE_QT5BASE_WIDGETS
 >     depends on BR2_PACKAGE_QT5GRAPHICALEFFECTS
 >     depends on BR2_PACKAGE_SYSTEMD
 >     help
 >       DASHBOARD client

 > and I get the following compilation error on clean build

 > fatal error: systemd/sd-journal.h: No such file or directory
 >  #include <systemd/sd-journal.h>
 >                                 ^
 > compilation terminated.

 > This is because systemd is build after my package, I see this from
 > log. If I unselect my package, build system, reselect my package and
 > build again everything build just fine. Also,

Did you add systemd to DASHBOARD_CLIENT_DEPENDENCIES? The select/depends
on in Kconfig only ensures that the packages get built, but it doesn't
affect the build order. If you need systemd to be built before your
application you have to add it to the _DEPENDENCIES make variable.

See the manual for further information:

http://buildroot.net/downloads/manual/manual.html#generic-package-reference

-- 
Bye, Peter Korsgaard
