From: Claus Klein <claus.klein@arcormail.de>
Date: Wed, 17 Jan 2007 08:33:04 +0100
Subject: [Buildroot] install uClibc daily snapshot failes
Message-ID: <200701170833.04970.claus.klein@arcormail.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all!

I'm not able to build uClibc daily snapshot:

# Host: Linux P3linux 2.6.16.21-0.25-default #1 Tue Sep 19 07:26:15 UTC 2006 i686 i686 i386 GNU/Linux
# Target Architecture (powerpc)

make[1]: Leaving directory `/home/claus/src/buildroot/toolchain_build_powerpc/uClibc'
touch -c /home/claus/src/buildroot/toolchain_build_powerpc/uClibc/lib/libc.a
make -C /home/claus/src/buildroot/toolchain_build_powerpc/uClibc \
        PREFIX= \
        DEVEL_PREFIX=/tools/LinuxCDK/ \
        RUNTIME_PREFIX=/tools/LinuxCDK/ \
        install_runtime install_dev
make[1]: Entering directory `/home/claus/src/buildroot/toolchain_build_powerpc/uClibc'
install -d /tools/LinuxCDK/lib
install -m 644 lib/lib*-0.9.29.so \
        /tools/LinuxCDK/lib
cd lib && tar -cf - *.so.* | tar -xf - -C /tools/LinuxCDK/lib
tar: error while loading shared libraries: libpthread.so.0: ELF file data encoding not little-endian
tar: error while loading shared libraries: libpthread.so.0: ELF file data encoding not little-endian
make[1]: *** [install_runtime] Fehler 127
make[1]: Leaving directory `/home/claus/src/buildroot/toolchain_build_powerpc/uClibc'
make: *** [/tools/LinuxCDK/lib/libc.a] Fehler 2
You have new mail in /var/spool/mail/claus
claus at P3linux:~/src/buildroot>


It seems, the problem is in target:

# Installs run-time libraries
install_runtime:
...
	cd lib && $(TAR)  -cf - *.so.* | $(TAR) -xf - -C $(PREFIX)$(RUNTIME_PREFIX)lib
...
# failes! -:((


This version:
# Installs run-time libraries
install_runtime:
...
	$(TAR) -C lib -cf - $(notdir $(wildcard lib/*.so.*)) | $(TAR) -xf - -C $(PREFIX)$(RUNTIME_PREFIX)lib
...

# works fine; -:) ck

Bye

Claus
