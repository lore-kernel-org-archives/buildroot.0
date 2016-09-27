From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 Sep 2016 00:05:11 +0200
Subject: [Buildroot] [PATCH] package/acpitool: needs threads, shared;
	unavailable for bfin
Message-ID: <1475013911-32258-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

acpitool requires threads.

However, it does not check fo threads in its configure script, so
forgets to link with -pthreads, so fails to build in static-only
scenarii.

However, upstream has been dead for the past 7+ years now, so there is
not much point trying to fix this. Besides, a system with ACPI is most
probably a biggish system, so shared libs will probably be enabled, so
we just require shared libs.

As for bfin, the cryptic configure failure:
    configure: error: C++ compiler cannot create executables

is due to the order in which AC_PROG_CXX and AC_PROG_CC are called.
Calling AC_PROG_CC first fixes this error message.

But then we get linking errors:

    /home/ymorin/dev/buildroot/O/host/usr/bin/bfin-linux-g++  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os    -o acpitool main.o acpitool.o ac_adapter.o toshiba.o asus.o thinkpad.o cpu.o battery.o freq.o -lgcc
    acpitool.o: In function `Has_ACPI(char*)':
    acpitool.cpp:(.text+0x1be): undefined reference to `_Unwind_Resume'
    acpitool.o: In function `Get_Kernel_Version(char*, int)':
    acpitool.cpp:(.text+0x2aa): undefined reference to `_Unwind_Resume'
    acpitool.o: In function `Set_Kernel_Version()':
    acpitool.cpp:(.text+0x43e): undefined reference to `_Unwind_Resume'
    acpitool.o: In function `Do_Fan_Info(int)':
    acpitool.cpp:(.text+0x60a): undefined reference to `_Unwind_Resume'
    acpitool.o: In function `Show_WakeUp_Devices(int)':
    acpitool.cpp:(.text+0x770): undefined reference to `_Unwind_Resume'
    acpitool.o:acpitool.cpp:(.text+0x9ca): more undefined references to `_Unwind_Resume' follow
    /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/../../../../bfin-buildroot-linux-uclibc/bin/ld: acpitool: hidden symbol `___udivsi3' in /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/libgcc.a(_udivsi3.o) is referenced by DSO
    /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/../../../../bfin-buildroot-linux-uclibc/bin/ld: final link failed: Bad value
    collect2: error: ld returned 1 exit status

The last one of those (the hidden ___udivsi3 symbol) is most
concerning, and even the unwind stuff is not trivial.

Again, because upstream is dead, there's not much point trying to fix
this...

Since there's not many chances that a bfin board has ACPI, we just
disable acpitool for bfin.

Fixes various build failures:
    http://autobuild.buildroot.org/results/6fc/6fc568228b7c5c5be9e35aae73fb09b431896325/
    http://autobuild.buildroot.org/results/f1e/f1eb711123c2d8aea8399b8984a007afec4f65fb/
    http://autobuild.buildroot.org/results/70e/70eb7d7ed93a122b4c7a9890877e721b8d777b00/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Erico Nunes <nunes.erico@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v1 -> v2:
  - add dependencies on threads and !static
  - update commit log accordingly, fix typoes
---
 package/acpitool/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/acpitool/Config.in b/package/acpitool/Config.in
index 7992e0f..9081bf1 100644
--- a/package/acpitool/Config.in
+++ b/package/acpitool/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ACPITOOL
 	bool "acpitool"
+	depends on !BR2_bfin
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  A small, convenient command-line ACPI client with a lot of
@@ -8,4 +9,5 @@ config BR2_PACKAGE_ACPITOOL
 	  http://acpitool.sourceforge.net
 
 comment "acpitool needs a toolchain w/ C++"
+	depends on !BR2_bfin
 	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.7.4
