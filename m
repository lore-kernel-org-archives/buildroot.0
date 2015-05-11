From: Roman Akopov <adontz@gmail.com>
Date: Mon, 11 May 2015 11:54:09 +0400
Subject: [Buildroot] Build Issue when depending on systemd
Message-ID: <55506021.60705@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have C++/Qt application which does a lot of things, and among them, 
forwards journald logs to web service. I failed to build it correctly 
under buildroot-2015-02.

Config.in looks like this

config BR2_PACKAGE_DASHBOARD_CLIENT
     bool "dashboard-client"
     depends on BR2_PACKAGE_HAS_LIBEGL
     depends on BR2_PACKAGE_QT5
     depends on BR2_PACKAGE_QT5_GL_AVAILABLE
     depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
     depends on BR2_PACKAGE_QT5BASE_EGLFS
     depends on BR2_PACKAGE_QT5BASE_NETWORK
     depends on BR2_PACKAGE_QT5BASE_PNG
     depends on BR2_PACKAGE_QT5BASE_WIDGETS
     depends on BR2_PACKAGE_QT5GRAPHICALEFFECTS
     depends on BR2_PACKAGE_SYSTEMD
     help
       DASHBOARD client

and I get the following compilation error on clean build

fatal error: systemd/sd-journal.h: No such file or directory
  #include <systemd/sd-journal.h>
                                 ^
compilation terminated.

This is because systemd is build after my package, I see this from log. 
If I unselect my package, build system, reselect my package and build 
again everything build just fine. Also,

make dashboard-client-graph-depends

outputs

Getting dependencies for ['dashboard-client']
Getting dependencies for ['toolchain', 'qt5base', 'qt5multimedia', 
'qt5graphicaleffects', 'qt5imageformats', 'qt5declarative', 'qt5webkit']
Getting dependencies for ['host-flex', 'host-bison', 
'toolchain-buildroot', 'libpng', 'host-ruby', 'jpeg', 'host-pkgconf', 
'libegl', 'zlib', 'openssl', 'qt5xmlpatterns', 'sqlite', 'host-gperf', 
'fontconfig', 'pcre', 'icu', 'libgles']
Getting dependencies for ['host-gcc-final', 'jpeg-turbo', 'host-m4', 
'expat', 'readline', 'rpi-userland', 'ncurses', 'host-icu', 'freetype']
Getting dependencies for ['host-libtool', 'host-automake', 'host-gmp', 
'host-autoconf', 'host-mpfr', 'host-binutils', 'host-ncurses', 'glibc', 
'host-mpc', 'host-cmake']
Getting dependencies for ['host-gawk', 'linux-headers', 'host-gcc-initial']

And there is no mention of systemd in generated PDF too.

So either there I declare dependency on systemd incorrectly (then what 
is the correct way?), or there is some dependency resolution problem.

How can I debug this issue?

With best regards,
Roman
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150511/bbf246c8/attachment.html>
