From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 20 Nov 2014 11:51:37 +0000
Subject: [Buildroot] Split supported architectures for Qt Script and Qt
	Webkit
Message-ID: <546DD5C9.8090600@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

please I would like you read this email and provide some feedback before
I start writing a patch.

Currently in Buildroot we have a BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
variable indicating which architectures support Qt Webkit. We also make
Qt Script depending on that variable, so we are assuming that Qt Script
is supported for exactly the same architectures which support Qt Webkit,
and that's not true.

So I have done some tests to make clear which architectures support Qt
Script and which ones support Qt Webkit, in order to create another
variable called BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT.

That way we will be able to fix some problems we can't fix properly
right now. For instance, Qt Webkit is not supported for MIPS64 when
using the n32 ABI, but Qt Script is actually supported. So, if we make
BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT depending on !BR2_MIPS_NABI32 we
will also disable Qt Script, because as I said before, Qt Script depends
on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT, and we don't want that because
Qt Script works.

Related:
http://lists.busybox.net/pipermail/buildroot/2014-November/111760.html

I have also included Grantlee in the tests because is the only package
which depends on Qt Script, so at the same time I do the tests we can
know which architectures do support Qt Script but don't support
Grantlee. There isn't any package depending on Qt Webkit.

I have assigned a code to each kind of problem I have found, and the
meaning of those codes are just below the table.

+------------------+-----------+-----------+----------+--------------+
| Architecture     | Qt Script | Qt Webkit | Grantlee | Problem Code |
+------------------+-----------+-----------+----------+--------------+
| BR2_arcle        | NO        | NO        | NO       | 1            |
| BR2_arceb        | NO        | NO        | NO       | 1            |
| BR2_arm          | YES       | YES       | YES      |              |
| BR2_armeb        | YES       | YES       | YES      |              |
| BR2_aarch64      | YES       | NO        | YES      | 2            |
| BR2_bfin         | NO        | NO        | NO       | 1            |
| BR2_i386         | YES       | YES       | YES      |              |
| BR2_microblazeel | YES       | YES       | NO       | 3            |
| BR2_microblazebe | YES       | YES       | NO       | 3            |
| BR2_mips         | YES       | YES       | YES      |              |
| BR2_mipsel       | YES       | YES       | YES      |              |
| BR2_mips64       | YES       | YES       | YES      |              |
| BR2_mips64el     | YES       | YES       | YES      |              |
| BR2_nios2        | YES       | NO        | NO       | 4            |
| BR2_powerpc      | YES       | YES       | YES      |              |
| BR2_powerpc64    | YES       | YES       | YES      |              |
| BR2_powerpc64el  | YES       | YES       | YES      |              |
| BR2_sh           | YES       | YES       | YES      |              |
| BR2_sh64         | NO        | NO        | NO       | 5            |
| BR2_sparc        | NO        | NO        | NO       | 5            |
| BR2_x86_64       | YES       | YES       | YES      |              |
| BR2_xtensa       | NO        | NO        | NO       | 1            |
+------------------+-----------+-----------+----------+--------------+

Problem 1
---------
There is no toolchain with NPTL for this architecture

Problem 2
---------
Qt Webkit fails to compile for aarch64:

In file included from runtime/JSCell.h:31:0,
                 from runtime/JSObject.h:31,
                 from wtf/DateMath.cpp:79:
runtime/JSValueInlineMethods.h: In constructor
?JSC::JSValue::JSValue(JSC::JSCell*)?:
runtime/JSValueInlineMethods.h:230:57: error: cast from ?JSC::JSCell*?
to ?int32_t {aka int}? loses precision [-fpermissive]
         u.asBits.payload = reinterpret_cast<int32_t>(ptr);
                                                         ^

Problem 3
---------
Grantlee fails to link for microblaze:

microblaze-buildroot-linux-gnu/bin/ld: fde encoding in
CMakeFiles/grantlee_core.dir/engine.cpp.o(.eh_frame) prevents
.eh_frame_hdr table being created.
microblaze-buildroot-linux-gnu/4.9.2/../../../../microblaze-buildroot-linux-gnu/bin/ld:
fde encoding in
CMakeFiles/grantlee_core.dir/engine.cpp.o(.eh_framecollect2: error: ld
returned 1 exit status
microblaze-buildroot-linux-gnu/4.9.2/make[3]: ../.***
[textdocument/lib/libgrantlee_gui.so.0.2.0] Error 1.

Problem 4
---------
Qt Gui fails to link for nios2. Both Qt Webkit and Grantlee packages
depend on Qt Gui:

linking ../../lib/libQtGui.so.4.8.6
/home/ldap/vriera/work/mips-buildroots/mips32/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.8.3/../../../../nios2-linux-gnu/bin/ld:
BFD (Sourcery CodeBench Lite 2014.05-47) 2.24.51.20140217 assertion fail
/scratch/sandra/nios2-linux-respin/obj/binutils-src-2014.05-47-nios2-linux-gnu-i686-pc-linux-gnu/bfd/elf32-nios2.c:1037

Problem 5
---------
I'm unable to build a toolchain for this architecture, and there isn't
any external toolchain available.

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
