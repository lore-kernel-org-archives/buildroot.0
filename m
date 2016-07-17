From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jul 2016 19:56:00 +0200
Subject: [Buildroot] [PATCH] package/acpitool: not available for bfin
Message-ID: <1468778160-32413-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bfin is the only arch on which acpitool fails to build with the
autobuilders:

    http://autobuild.buildroot.org/?reason=acpitool-0.5.1
    http://autobuild.buildroot.org/results/802/802f6bbc74ad8e89b2bb6a2f592ac91ef9cd88e3/
    http://autobuild.buildroot.org/results/d2c/d2c708fc2aa18ecfc368a4ce93400cfc44366102/
    [...]

The cryptic error message;
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

The last one of those (the hidden ___udivsi3 symbol) is mopst
concerning, and even the unwind stuff is not trivial.

Because there's not many chances that a bfin board has ACPI, we just
disable acpitoll for bfin.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Erico Nunes <nunes.erico@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
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
