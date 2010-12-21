From: Sergey Naumov <sknaumov@gmail.com>
Date: Tue, 21 Dec 2010 15:27:42 +0300
Subject: [Buildroot] gcc-target compilation error due to TARGET_CFLAGS bug
Message-ID: <AANLkTinS3oGOx855_HJKiugih0Q3nbh1w+tEo5NkhBYC@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.

I encountered problems with compiling gcc-target with enabled c++:
file <fenv.h> (with _FENV_H) was not included and it caused
compilation errors due to undeclared symbols.
It seems that the problem was in package/Makefile.in:
ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
    TARGET_CFLAGS+=-I... -I...
endif
If we look at compilation of gcc-final we can notice that these files
was included there as -isystem and all was compiled well (because
#include_next <fenv.h> in fenv.h with _GLIBCXX_FENV_H work there as it
should).
I changed -I to -isystem and error with <fenv.h> disappeared, but can
the change affect other packages?

It seems that now I have problems with gettext's gnulib-lib, but do
not know whether it is related to my changes.

Sergey Naumov.
