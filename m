From: Dimitrios Siganos <dimitris@siganos.org>
Date: Fri, 08 Feb 2013 09:03:07 +0000
Subject: [Buildroot] crda and m2crypto
Message-ID: <5114BF4B.7080007@siganos.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am integrating crda with buildroot and I have run into a problem that
I'd like some feedback on.

The crda makefile depends on python-m2crypto to translate a key to a C
file representation. However, when I run the crda makefile using
TARGET_CONFIGURE_OPTS like this:

$(TARGET_CONFIGURE_OPTS) $(MAKE) all_noverify -C $(@D)

It fails.

It fails because TARGET_CONFIGURE_OPTS places the HOST_BIN directory in
the PATH and the python installed there doesn't have the m2crypto
library, which is needed during compilation.

I can workaround the problem by not using TARGET_CONFIGURE_OPTS and
hence not using the python interpreter in HOST_DIR. Instead the
workaround can use the python installed on the host computer where it is
easy to install the m2python library (apt-get install pyhton-m2crypto).
For example:

CC="$(TARGET_CC)" LD="$(TARGET_LD)" \
CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" \
LDFLAGS="$(TARGET_LDFLAGS)" $(MAKE) all_noverify -C $(@D)

Is such a solution acceptable?

In general what is the buildroot approach to such problems? Should all
the resources needed to build a package exist in the HOST_DIR?

Regards,
Dimitris
