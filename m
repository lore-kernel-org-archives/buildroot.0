From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 12 Sep 2018 10:10:57 +0000
Subject: [Buildroot] [Bug 11346] New: qt5base-5.11.1 Assertion failed: ret
 == 0 after getentropy() inside fillBuffer() on arm
Message-ID: <bug-11346-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11346

            Bug ID: 11346
           Summary: qt5base-5.11.1 Assertion failed: ret == 0 after
                    getentropy() inside fillBuffer() on arm
           Product: buildroot
           Version: unspecified
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: richterphilipp.pops at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7781
  --> https://bugs.busybox.net/attachment.cgi?id=7781&action=edit
Config file used to build

Hello,

I noticed while trying to run qbittorrent-nox on arm there was an assertion
failure in qt5base.
First there's a SIGILL in _armv7_tick () in OPENSSL_cpuid_setup () that is
handled.
And then there's the assertion failure Assertion failed: ret == 0 in
src/corelib/global/qrandom.cpp
Which looks like this :

###################
# BEGIN qrandom.cpp
###################
...
struct QRandomGenerator::SystemGenerator
{
#if QT_CONFIG(getentropy)
    static qsizetype fillBuffer(void *buffer, qsizetype count) Q_DECL_NOTHROW
    {
        // getentropy can read at most 256 bytes, so break the reading
        qsizetype read = 0;
        while (count - read > 256) {
            // getentropy can't fail under normal circumstances
            int ret = getentropy(reinterpret_cast<uchar *>(buffer) + read,
256);
            Q_ASSERT(ret == 0);
            Q_UNUSED(ret);
            read += 256;
        }

        int ret = getentropy(reinterpret_cast<uchar *>(buffer) + read, count -
read);
        Q_ASSERT(ret == 0);
        Q_UNUSED(ret);
        return count;
    }

#elif defined(Q_OS_UNIX)
...
#################
# END qrandom.cpp
#################

The debug log looks like follows:

#########
# BEGIN gdb log
#########
Starting program: /usr/bin/qbittorrent-nox 

Program received signal SIGILL, Illegal instruction.
_armv7_tick () at armv4cpuid.S:94
94      armv4cpuid.S: No such file or directory.
#0  _armv7_tick () at armv4cpuid.S:94
No locals.
#1  0xb5fb7b48 in OPENSSL_cpuid_setup () at armcap.c:157
        e = <optimized out>
        ill_oact = {__sa_handler = {sa_handler = 0x0, sa_sigaction = 0x0},
sa_mask = {__bits = {0, 0, 0, 74636, 832, 8, 17, 0, 0, 75468, 0, 0, 0, 0, 0, 0,
0, 0, 3201457664, 3069381184, 3068977088, 3069646984, 10370172, 0, 40, 696320,
244, 56704, 25936, 0, 0, 
              0}}, sa_flags = 0, sa_restorer = 0x10}
        ill_act = {__sa_handler = {sa_handler = 0xb5fb77a0 <ill_handler>,
sa_sigaction = 0xb5fb77a0 <ill_handler>}, sa_mask = {__bits = {2147482407,
4294967292, 0 <repeats 30 times>}}, sa_flags = 0, sa_restorer = 0x0}
        oset = {__bits = {0, 0, 3068948480, 0, 453196, 0, 8080, 8080, 65534,
65534, 3201457888, 635095, 100, 0, 0, 0, 0, 0, 0, 0, 3201457872, 0, 0, 0, 0, 0,
3201458147, 3068979056, 3069646984, 0, 0, 3201457396}}
        trigger = 1
#2  0xb6f2e558 in do_init_fini (p=0xb600c660) at ldso/dynlink.c:1310
        n = 0
        fn = 0xb5ff55d8
        dyn = {513768574, 79894, 888, 1597440, 244, 138796, 70716, 0, 0, 0,
79974, 16, 286396, 1290996, 79955, 0, 0, 218772, 66736, 8, 17, 0, 0, 285508, 0,
1541588, 1541596, 8, 4, 0, 0, 0}
        need_locking = 0
#3  0xb6f30838 in __libc_start_init () at ldso/dynlink.c:1322
No locals.
#4  0xb6eeeeec in __libc_start_main (main=0x69a28 <main(int, char**)>, argc=1,
argv=0xbed25e04) at src/env/__libc_start_main.c:73
        envp = 0xbed25e0c
#5  0x0006eaa8 in _start_c (p=<optimized out>) at crt/crt1.c:17
        argc = <optimized out>
        argv = <optimized out>
#6  0x0006ea6c in _start () at
../../../host/arm-buildroot-linux-musleabihf/sysroot/usr/include/qt5/QtCore/qscopedpointer.h:104
No symbol table info available.
Backtrace stopped: previous frame identical to this frame (corrupt stack?)
Dump of assembler code for function _start_c:
   0x0006ea70 <+0>:     push    {lr}            ; (str lr, [sp, #-4]!)
   0x0006ea74 <+4>:     sub     sp, sp, #12
   0x0006ea78 <+8>:     mov     r2, r0
   0x0006ea7c <+12>:    ldr     r1, [r2], #4
   0x0006ea80 <+16>:    mov     r3, #0
   0x0006ea84 <+20>:    str     r3, [sp, #4]
   0x0006ea88 <+24>:    movw    r3, #2252       ; 0x8cc
   0x0006ea8c <+28>:    movt    r3, #30
   0x0006ea90 <+32>:    str     r3, [sp]
   0x0006ea94 <+36>:    movw    r3, #17168      ; 0x4310
   0x0006ea98 <+40>:    movt    r3, #6
   0x0006ea9c <+44>:    movw    r0, #39464      ; 0x9a28
   0x0006eaa0 <+48>:    movt    r0, #6
   0x0006eaa4 <+52>:    bl      0x652a8 <__libc_start_main@plt>
End of assembler dump.
Saved corefile qbittorrent-nox.openssl.core
Continuing.

Program received signal SIGABRT, Aborted.
__restore_sigs (set=set at entry=0xbed2580c) at ./arch/arm/syscall_arch.h:75
75      ./arch/arm/syscall_arch.h: No such file or directory.
#0  __restore_sigs (set=set at entry=0xbed2580c) at ./arch/arm/syscall_arch.h:75
No locals.
#1  0xb6f15a00 in raise (sig=sig at entry=6) at src/signal/raise.c:11
        set = {__bits = {0, 0, 1936, 0, 3069644800, 6, 851725401, 5,
3069646368, 632, 39, 3069645736, 1702064961, 1869182066, 1634082926,
1684368489, 1701978170, 1027416180, 673198112, 1651469415, 1898933345,
1684955506, 1663987055, 540700784, 1819044198, 
            1717990722, 540701285, 691025201, 3061346314, 4, 0, 3069644800}}
        ret = 0
#2  0xb6eef600 in abort () at src/exit/abort.c:14
No locals.
#3  0xb6eef6e4 in __assert_fail (expr=<optimized out>, file=<optimized out>,
line=line at entry=150, func=<optimized out>) at src/exit/assert.c:8
No locals.
#4  0xb62b1304 in QRandomGenerator::SystemGenerator::fillBuffer
(count=<optimized out>, buffer=<optimized out>) at global/qrandom.cpp:376
        read = 0
        ret = <optimized out>
        __func__ = "fillBuffer"
#5  QRandomGenerator::SystemGenerator::generate (this=<optimized out>,
begin=0xbed25920, end=<optimized out>) at global/qrandom.cpp:373
        bytesFilled = <optimized out>
        buffer = 0xbed25920
        count = 1
        filled = 0
#6  0xb62b1cd0 in QRandomGenerator::_fillRange (this=0xb678ae84
<QRandomGenerator::SystemAndGlobalGenerators::self()::g+4>, buffer=0xbed25920,
buffer at entry=0xbed25918, bufferEnd=0xbed25924, bufferEnd at entry=0xbed2591c) at
global/qrandom.cpp:1273
        __func__ = "_fillRange"
        begin = 0xbed25920
        end = 0xbed25924
#7  0xb62fc9c8 in QRandomGenerator::fillRange<unsigned int, true> (count=1,
buffer=0xbed25918, this=<optimized out>) at global/qrandom.h:141
No locals.
#8  QRandomGenerator::generate (this=<optimized out>) at global/qrandom.h:87
        ret = 16
#9  qt_create_qhash_seed () at tools/qhash.cpp:299
        seed = 0
        envSeed = {d = 0xb65ae3ac <QArrayData::shared_null>}
#10 0xb62fcafc in qt_initialize_qhash_seed () at tools/qhash.cpp:325
        x = <optimized out>
#11 0xb62fd290 in QHashData::detach_helper (this=0xb65b0010
<QHashData::shared_null>, node_duplicate=0xb19e8 <QHash<QString,
QHashDummyValue>::duplicateNode(QHashData::Node*, void*)>, 
    node_delete=0xb62fd290 <QHashData::detach_helper(void (*)(QHashData::Node*,
void*), void (*)(QHashData::Node*), int, int)+220>, node_delete at entry=0x77b28
<QHash<QString, QHashDummyValue>::deleteNode2(QHashData::Node*)>,
nodeSize=nodeSize at entry=12, 
    nodeAlign=nodeAlign at entry=4) at tools/qhash.cpp:502
No locals.
#12 0x0006d1b4 in QHash<QString, QHashDummyValue>::detach_helper
(this=0xbed25984) at
../../../host/arm-buildroot-linux-musleabihf/sysroot/usr/include/qt5/QtCore/qhash.h:595
        x = <optimized out>
#13 QHash<QString, QHashDummyValue>::detach (this=0xbed25984) at
../../../host/arm-buildroot-linux-musleabihf/sysroot/usr/include/qt5/QtCore/qhash.h:275
No locals.
#14 QHash<QString, QHashDummyValue>::insert (avalue=..., akey=...,
this=0xbed25984) at
../../../host/arm-buildroot-linux-musleabihf/sysroot/usr/include/qt5/QtCore/qhash.h:769
        h = <optimized out>
        node = <optimized out>
#15 QSet<QString>::insert (value=..., this=0xbed25984) at
../../../host/arm-buildroot-linux-musleabihf/sysroot/usr/include/qt5/QtCore/qset.h:205
No locals.
#16 QSet<QString>::operator<< (value=..., this=0xbed25984) at
../../../host/arm-buildroot-linux-musleabihf/sysroot/usr/include/qt5/QtCore/qset.h:226
No locals.
#17 __static_initialization_and_destruction_0 (__priority=65535,
__initialize_p=1) at base/torrentfilter.cpp:34
No locals.
#18 _GLOBAL__sub_I_torrentfilter.cpp(void) ()@base/torrentfilter.cpp:192
No locals.
#19 0xb6f2e558 in do_init_fini (p=0xb6f717c0 <app>, p at entry=0xb6f319b8
<dlopen+644>) at ldso/dynlink.c:1310
        n = 13
        fn = 0x5e10f4
        dyn = {515783806, 50596, 9360, 6172672, 65900, 193264, 121808, 0, 0, 0,
197883, 16, 410384, 1968332, 0, 0, 0, 400368, 656, 8, 17, 3069653228, 0,
401024, 0, 6164616, 6164780, 164, 144, 0, 0, 0}
        need_locking = 0
#20 0xb6f319b8 in dlopen (file=0xb600c920 "", file at entry=0xb61fe6d0 "libz.so",
mode=0) at ldso/dynlink.c:1858
        p = 0x5e5020
        orig_tail = 0xb6f319b8 <dlopen+644>
        orig_syms_tail = 0xb600c920
        orig_lazy_head = 0xb6e9de94
        next = <optimized out>
        orig_tls_tail = 0x2
        orig_tls_cnt = 3055544016
        orig_tls_offset = 0
        orig_tls_align = 3
        i = <optimized out>
        cs = 0
        jb = {{__jb = {13123461070452686850, 1, 6205344, 0,
13182906960083835512, 0, 0, 0, 0, 0, 0, 0, 0, 13123461622355984383,
13750153770438584952, 13182592032700366848, 9223372001255614167, 0, 0, 0, 0,
13182590469332271104, 13750153475327524864, 0, 0, 0, 
              18446744073709486080, 13750152805312626688, 0, 0, 0, 0}, __fl =
0, __ss = {0, 0, 0, 0, 0, 40, 16, 1, 851725401, 3069653356, 3055544016, 1, 0,
3055543888, 3069311476, 3069653356, 3069292984, 3201457152, 851725401,
3055544000, 3055544000, 
              3052565140, 3053283960, 3055544000, 3053503488, 0, 357,
3055544000, 3055543888, 1, 0, 6205344}}}
        first_load = <optimized out>
#21 0xb5f27624 in dlfcn_load (dso=0xb61fe650) at dso_dlfcn.c:185
        ptr = 0x0
        filename = 0xb61fe6d0 "libz.so"
        flags = <optimized out>
#22 0xb5f27f40 in DSO_load (dso=<optimized out>, filename=<optimized out>,
meth=<optimized out>, flags=<optimized out>) at dso_lib.c:232
        ret = 0xb61fe650
        allocated = 1
#23 0xb5f9a648 in COMP_zlib () at c_zlib.c:352
        meth = 0xb6007ab0 <zlib_method_nozlib>
#24 0xb604d6e8 in load_builtin_compressions () at ssl_ciph.c:489
        comp = 0xb61fe630
        got_write_lock = 1
#25 0xb604f7a8 in SSL_COMP_get_compression_methods () at ssl_ciph.c:1962
No locals.
#26 0xb6055e40 in SSL_library_init () at ssl_algs.c:150
No locals.
#27 0xb6a919d0 in boost::asio::ssl::detail::openssl_init_base::do_init::do_init
(this=<optimized out>) at
../../../host/arm-buildroot-linux-musleabihf/sysroot/usr/include/boost/asio/ssl/detail/impl/openssl_init.ipp:40
No locals.
#28 boost::asio::ssl::detail::openssl_init_base::instance () at
../../../host/arm-buildroot-linux-musleabihf/sysroot/usr/include/boost/asio/ssl/detail/impl/openssl_init.ipp:147
        init =
{<std::__shared_ptr<boost::asio::ssl::detail::openssl_init_base::do_init,
(__gnu_cxx::_Lock_policy)2>> =
{<std::__shared_ptr_access<boost::asio::ssl::detail::openssl_init_base::do_init,
(__gnu_cxx::_Lock_policy)2, false, false>> = {<No data fields>}, _M_ptr = 0x0,
_M_refcount = {_M_pi = 0x0}}, <No data fields>}
#29 0xb6a891ec in boost::asio::ssl::detail::openssl_init<true>::openssl_init
(this=0xb6e9bafc <boost::asio::ssl::detail::openssl_init<true>::instance_>) at
../../../host/arm-buildroot-linux-musleabihf/sysroot/usr/include/boost/asio/detail/noncopyable.hpp:29
No locals.
#30 __static_initialization_and_destruction_0
(__initialize_p=__initialize_p at entry=1, __priority=__priority at entry=65535) at
../../../host/arm-buildroot-linux-musleabihf/sysroot/usr/include/boost/asio/ssl/detail/openssl_init.hpp:90
No locals.
#31 0xb6a8f440 in _GLOBAL__sub_I_bt_peer_connection.cpp(void) () at
bt_peer_connection.cpp:3645
No locals.
#32 0xb6f2e558 in do_init_fini (p=0xb6e9d8c0) at ldso/dynlink.c:1310
        n = 102
        fn = 0xb6e89be0
        dyn = {513703038, 212859, 10664, 4935680, 244, 79272, 37880, 0, 0, 0,
213090, 16, 365112, 4299636, 212931, 0, 0, 297728, 56720, 8, 17, 0, 0, 354448,
0, 4910012, 4910460, 448, 368, 0, 0, 0}
        need_locking = 0
#33 0xb6f30838 in __libc_start_init () at ldso/dynlink.c:1322
No locals.
#34 0xb6eeeeec in __libc_start_main (main=0x69a28 <main(int, char**)>, argc=1,
argv=0xbed25e04) at src/env/__libc_start_main.c:73
        envp = 0xbed25e0c
#35 0x0006eaa8 in _start_c (p=<optimized out>) at crt/crt1.c:17
        argc = <optimized out>
        argv = <optimized out>
#36 0x0006ea6c in _start () at
../../../host/arm-buildroot-linux-musleabihf/sysroot/usr/include/boost/asio/detail/noncopyable.hpp:29
No symbol table info available.
Backtrace stopped: previous frame identical to this frame (corrupt stack?)
Dump of assembler code for function _start_c:
   0x0006ea70 <+0>:     push    {lr}            ; (str lr, [sp, #-4]!)
   0x0006ea74 <+4>:     sub     sp, sp, #12
   0x0006ea78 <+8>:     mov     r2, r0
   0x0006ea7c <+12>:    ldr     r1, [r2], #4
   0x0006ea80 <+16>:    mov     r3, #0
   0x0006ea84 <+20>:    str     r3, [sp, #4]
   0x0006ea88 <+24>:    movw    r3, #2252       ; 0x8cc
   0x0006ea8c <+28>:    movt    r3, #30
   0x0006ea90 <+32>:    str     r3, [sp]
   0x0006ea94 <+36>:    movw    r3, #17168      ; 0x4310
   0x0006ea98 <+40>:    movt    r3, #6
   0x0006ea9c <+44>:    movw    r0, #39464      ; 0x9a28
   0x0006eaa0 <+48>:    movt    r0, #6
   0x0006eaa4 <+52>:    bl      0x652a8 <__libc_start_main@plt>
End of assembler dump.
Saved corefile qbittorrent-nox.qt5base.core
#############
# END gdb log
#############

Here are links to the rootfs.tar and coredumps that can be used with gdb:
wget https://u.teknik.io/AitQe.xz -O qbittorrent-nox.rootfs.tar.xz
sha256 262cfbb54e32192b070f1acc0e6859bdf3d3ff313983105981b23286a3c66c2c
wget https://u.teknik.io/nQnKu.xz -O qbittorrent-nox.openssl.core.xz
sha256 137d8efa6959bd403ad1fcc48f57186f8b88d0f197da9e2f1ec8d413aa5c844d
wget https://u.teknik.io/tL1Ha.xz -O qbittorrent-nox.qt5base.core.xz
sha256 98c753625af258490c1a8d8585cf067010ed0f620485f5c983b2333e4cc13733
wget https://u.teknik.io/u0Jgl.xz -O config-qbittorrent-nox.xz
sha256 4c84efae0632fcf59969804df0d4e55fd58b07e4760801d21748df5dfa0e7624

The vault with the stuff is here: https://v.teknik.io/v/XJvC9

The patches for qbittorrent are here:
https://patchwork.ozlabs.org/patch/968472/
https://patchwork.ozlabs.org/patch/968473/

So is there an issue with the getentropy() function on arm hardware ?
There are no issues using qemu-arm-static on x86_64 to run the application.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
