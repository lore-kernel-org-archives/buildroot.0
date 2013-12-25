From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 18:18:13 +0100
Subject: [Buildroot] Qt5Webkit build failure
Message-ID: <20131225181813.09384b3e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fatih,

While testing your qt5 patches, I fell on a build issue in qt5webkit
(unrelated to your recent patches, as far as I can see), with the
following configuration:

BR2_arm=y
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_INIT_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
BR2_PACKAGE_QT5BASE_SQL=y
BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM=y
BR2_PACKAGE_QT5BASE_XML=y
BR2_PACKAGE_QT5CONNECTIVITY=y
BR2_PACKAGE_QT5GRAPHICALEFFECTS=y
BR2_PACKAGE_QT5IMAGEFORMATS=y
BR2_PACKAGE_QT5MULTIMEDIA=y
BR2_PACKAGE_QT5QUICK1=y
BR2_PACKAGE_QT5QUICKCONTROLS=y
BR2_PACKAGE_QT5SENSORS=y
BR2_PACKAGE_QT5SERIALPORT=y
BR2_PACKAGE_QT5SVG=y
BR2_PACKAGE_QT5WEBKIT=y
BR2_PACKAGE_RPI_USERLAND=y

I get the following build failure:

{standard input}: Assembler messages:
{standard input}:1186: Error: selected processor does not support ARM mode `vmov s2,r1'
{standard input}:1187: Error: selected processor does not support ARM mode `vcvt.f64.s32 d1,s2'
{standard input}:1191: Error: selected processor does not support ARM mode `vmov d1,r1,r4'
{standard input}:1194: Error: selected processor does not support ARM mode `vmov d0,r0,r2'
{standard input}:1195: Error: selected processor does not support ARM mode `vadd.f64 d0,d0,d1'
{standard input}:1197: Error: selected processor does not support ARM mode `vstr.64 d0,[r9,#0]'
{standard input}:1207: Error: selected processor does not support ARM mode `vmov s0,r0'
{standard input}:1208: Error: selected processor does not support ARM mode `vcvt.f64.s32 d0,s0'
{standard input}:1209: Error: selected processor does not support ARM mode `vmov d1,r1,r4'
{standard input}:1210: Error: selected processor does not support ARM mode `vadd.f64 d0,d0,d1'
{standard input}:1212: Error: selected processor does not support ARM mode `vstr.64 d0,[r9,#0]'
[...]
make[3]: *** [.obj/llint/LowLevelInterpreter.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: Leaving directory `/home/thomas/buildroot/output/build/qt5webkit-5.2.0/Source/JavaScriptCore'
make[2]: *** [sub-Target-pri-make_first-ordered] Error 2
make[2]: Leaving directory `/home/thomas/buildroot/output/build/qt5webkit-5.2.0/Source/JavaScriptCore'
make[1]: *** [sub-Source-JavaScriptCore-JavaScriptCore-pro-make_first-ordered] Error 2
make[1]: Leaving directory `/home/thomas/buildroot/output/build/qt5webkit-5.2.0'
make: *** [/home/thomas/buildroot/output/build/qt5webkit-5.2.0/.stamp_built] Error 2

Seems like it's trying to use FPU instructions on a soft-float
toolchain.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
