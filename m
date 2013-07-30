From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 30 Jul 2013 14:28:05 +0200
Subject: [Buildroot] Removing/solving gettext dependencies in libuio
Message-ID: <CAAXf6LWskVXQjvLYeEBx_JJxuTujMZEq2JzqLMftXXUSaPTQHg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm adding the library libuio to buildroot
(https://github.com/Linutronix/libuio/).
This library expects gettext to be present, but I want to avoid adding
this dependency to buildroot because it really isn't needed.

What is the best way to solve this?
The first alternative is to patch the package and remove the
problematic code. These changes are in configure.ac, Makefile.am, the
patch is fairly short. This change is not acceptable upstream (I
guess).

A second alternative is to change libuio to recognize --disable-nls.
However, I'm not sure how to do that.
The configure.ac file contains:

  AM_GNU_GETTEXT([external])
  AM_GNU_GETTEXT_VERSION([0.17])

This macro is provided by gettext itself, so without gettext this doesn't work.
I tried something like:

AC_ARG_ENABLE([nls], AC_HELP_STRING([--disable-nls], [Do not use
Native Language Support]),
              USE_NLS=$enableval, USE_NLS=yes)

AC_SUBST(USE_NLS)

AS_IF([test "x$enable_nls" == xyes],
  AM_GNU_GETTEXT([external])
  AM_GNU_GETTEXT_VERSION([0.17])
)

but I still get complaints about AM_GNU_GETTEXT not recognized.
I have tried finding good examples of implementing --disable-nls
without requiring gettext, but I can't find any.


Any input welcome,

Thomas
