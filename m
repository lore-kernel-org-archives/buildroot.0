From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Aug 2020 00:09:14 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Analysis of build results
In-Reply-To: <20200815080146.EBD3186EA1@fraxinus.osuosl.org>
References: <20200815080146.EBD3186EA1@fraxinus.osuosl.org>
Message-ID: <20200816000914.5ad801d9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Frank, Gwenhael, Romain, Adam, ARC maintainers, Peter, there are some
questions/issues for you below.

Everybody else: please help fixing autobuilder issues !

See below some preliminary analysis of all build failures that occurred
on August 14.

On Sat, 15 Aug 2020 08:01:40 -0000
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

>     master   | 121 | 67  |  0  | 188 |

So we're still at about ~30% of failures, which isn't exactly good.


>     arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>     arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/2899bcd58dcce8a1b820c1f310e1af7ebec1e1f0 | ORPH

/nvme/rc-buildroot-test/scripts/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: src/foundation/startup.o: in function `reset_handler':
/nvme/rc-buildroot-test/scripts/instance-1/output-1/build/am33x-cm3-11107db2f1e9e58ee75d4fe9cc38423c9a6e4365/src/foundation/startup.c:177: undefined reference to `memcpy'

Looking at the history of this failure:

http://autobuild.buildroot.net/?reason=am33x-cm3%

We had some failures until November 2019, with a different error. And
then since yesterday (August 14), two failures with this memcpy()
issue. Interestingly, the two failed builds are using gcc 10. At line
177 in startup.c, we have:

        for(puldest = &_start_data; puldest < &_end_data; )
        {
            *puldest++ = *pulsrc++;
        }

I.e, we don't have a call to memcpy(), but gcc detects it's a memory
copy, and generates a call to memcpy().

I'm not sure what's the right gcc option to make it not emit such
memcpy() function call...


>   mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/a9cdf1454920a264447665a241d0904a83a2fd06 |     

Error message:

relocation truncated to fit: R_MIPS_CALL16

This build issue occurs only on mips64, but several variants of the
architecture, and with both uClibc and glibc.

It seems like we're hitting the issue described at
https://lists.debian.org/debian-mips/2016/11/msg00008.html, and we
already have a work around for assimp for m68k:

# relocation truncated to fit: R_68K_GOT16O
ifeq ($(BR2_m68k),y)
ASSIMP_CXXFLAGS += -mxgot
endif

Should we do the same for mips64 ?

>   aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/b31aae410feaef5ff70a8b644b1be337e4e27338 | ORPH

This is being worked by Adam, he has proposed a patch, but I made some
comments.

>    x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/84eb9bb82255878d6a58772cb96d253a5c02f625 |     
>    x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/2ddfabda83a42d06b6b9689bc83882c59d1b8db6 |     
>    x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/ce3f75b5a259924924c934e784b58feed2705be8 |     

A wonderful:

./boost/thread/thread_time.hpp:32:60: internal compiler error: Segmentation fault

This is failing only with this toolchain, which uses gcc 6.2.0. We're
using the version 2016.11-19 of this toolchain, which is really old,
and Mentor Graphics has published newer versions
(https://sourcery.mentor.com/GNUToolchain/subscription51456) but they
are no longer publicly available.

So I would advocate for dropping support for this toolchain. I'll send
a patch doing that.

>     arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/81e50a5b565fba0b5703730671d9e9dd86db3b93 | ORPH
>     arm      |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/119aeffa1c3d1eaad929cc40af073c71b46cd17b |     
>   riscv32    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/b2e4b144b4270cee0e1efb29ca86da322e403213 |     
>    xtensa    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/2ac9a7f329289532c8a3a75257f349e5662efb70 |     
>   mips64el   | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/e2ea73ab636d3493ef0c1db07d2fb4fba1bbbbab |     
>   riscv32    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/44863a6c6bcf0021298fcd9dba7b2b10ef1dbc93 |     
>     m68k     | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/5cdeb12ba89285a96c4eeefce47bf72a86e2d1f7 |     
>     arm      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/e71f315ebd29230c746f687e457e898b75fbc464 |     
> microblazeel | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/d6001c4f5e294524739ff422e192786f76fe8a92 |     

This was a download issue. I've placed a dvb-apps tarball on
sources.buildroot.net. However, our CDN is still caching the
non-existence of this file, so we need those cache results to expire
for the build issues to disappear.

>     arm      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/0b972b4e63cac9ae95dcac78e031d7b19e2e4e0d |     

Detects Fortran (even though that dependency is not expressed in the
eigen package), but fails to use it.

It would be good to explicitly disable using Fortran in this package.
Romain, is this something you could have a look at ?

>     mips     |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/3bb8d678aaa782b70c14a8f9cd3e1df2e55bc613 |     

mips-linux-gnu-g++: ERROR: unsafe header/library path used in cross-compilation: '-isystem' '/usr/include'
mips-linux-gnu-g++: ERROR: unsafe header/library path used in cross-compilation: '-isystem' '/usr/include'

Gwenhael, could you take care of this, at least do some preliminary
analysis to find where this bogus -isystem invocation comes from ?

>     arm      |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/5cedf537d2e947a2a7f492611ec4a8323c6e2b97 | ORPH

/home/peko/autobuild/instance-1/output-1/host/bin/meson --internal msgfmthelper daemon/org.gtk.vfs.file-operations.policy.in daemon/org.gtk.vfs.file-operations.policy xml /home/peko/autobuild/instance-1/output-1/build/gvfs-1.44.1/po
msgfmt: cannot locate ITS rules for daemon/org.gtk.vfs.file-operations.policy.in

This is with BR2_SYSTEM_ENABLE_NLS=y, so we have the full gettext
available. There is some background at
https://github.com/mesonbuild/meson/issues/1565.

>     i686     |       host-elixir-1.9.4        | NOK | http://autobuild.buildroot.net/results/a3a37eb724ca5689f8e83c9b2af04d07afa80315 |     

make[1]: Entering directory '/tmp/instance-1/output-1/build/host-elixir-1.9.4'
make[1]: erlc: Command not found

We have this once in a while, on different machines:
http://autobuild.buildroot.net/?reason=host-elixir%

Weird that it doesn't appear more often. Is there some kind of race condition?

Frank: you added the host-elixir package, could you have a look ?

>  powerpc64   |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/37847b16d8ece2f4f6ed34ef15c0a185e13a9055 |     
>     arm      |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/b920d98e17e99f32c535cf046dd0e83d80271dd7 |     
>   aarch64    |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/d76edbda32622ff7cae2e8ac7a39e3fb46590796 |     

This is the infamous host-grpc build issue on Yann's machine. Adam, I
thought you had made some progress with this? Do you have a status?
Some ideas/leads?

>  aarch64_be  |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/6c2fe35b309ae06eb4ada9a9292e03b7aa77a1b5 |     

This was fixed by 235636409fddadfdfcaaaaf69f815fc349bcd69f.

>   riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/d01139419fdb0976754ee69dd35f8b8e78716820 |     
>     arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/139eec08e9a138f59dcd8b91503716e73dad547f |     

Both fixed by 19bd08900448aa45b506320ad2ab912f789e6e5e.

>    mipsel    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/453d38d0ef5b2a3825bc5f923a6b59055c651b11 |     
>     arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/34cfaf0e7dd459f62792fc414df604c8ff04fc86 |     
>     arc      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/79bde26aca95860a2e77cc9d70de97387c6a1be0 |     
>   riscv64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/9b2ef7932c9fd74d72214b831ac203d3c74dd4ce |     
>   aarch64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/5dd83b33ef54a4a6ecf0be47adb3a4672a5bb067 |     
>  powerpc64   |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/4567e3b0a0510e8a615781178ff5bbbd835a92c3 |     
>  aarch64_be  |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/bbd1597534df46895a6736629ffc44bcc0150618 |     
>     arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/c8e994a3d78910a2239211386b4ca6688ad8bb05 |  

Fixed by
https://git.buildroot.org/buildroot/commit/?id=97b3e2be0cb53415ab20ba4ae0d8638c087f7819

   
>     arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/07dca0689044777cd6533dfe244f22abc7c3084d | ORPH
>   powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/50e314b341fb46acfc81c84b6aff3381cb89cf75 | ORPH
>    xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/718dd77dd44cd4bc43761900c1e0746074de038c | ORPH

socket.h:289:33: error: flexible array member 'cmsghdr::__cmsg_data' not at end of 'struct<unnamed>'

Reported in Debian as well:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=954636, but not fixed.

>     arm      | kmsxx-cb0786049f960f2bd3836... | NOK | http://autobuild.buildroot.net/results/7777cd9496e8f8cdb093c3f82c550eebedda0b5d |     

Fixed by d82fa9e022f7f7781df8f1124430aa31688bf827

>    x86_64    | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/c28500d4cc55fbd2bac87f2c11759ddc9163bc91 |     

/home/peko/autobuild/instance-1/output-1/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/glib/gatomic.h:128:15: error: variable 'gapg_temp_atomic' set but not used [-Werror=unused-but-set-variable]

Meh, it is built with -Werror... and the issue is actually in a header
from libglib2, so nothing that libcamera can fix.

>   riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/2f05d672560a9e9dfb4412146b73f36667fe7e29 |     
>   riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/4ba63b6df6229462cee9be880bec89216307acb3 |     
>   riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/0839ee8b268dd010bef243d4b91a2a86f6e22655 |     
>   riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/be8ce63d6053ecff4e51e210dfaf58a4a8f772bb |     
>   riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/79d035ef9ae878d593c330f4b2e690d05651673d |     
>   riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/0d1525c2e73a03650a1999c118108cb19fe7673d |     
>   riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/5ee78c831db40d3e7fbe11d3538f9f311a886969 |     
>   riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/e1c56bce298ea0276edb46b48b8d0681d2b539e1 |     

Fixed by
https://git.buildroot.org/buildroot/commit/?id=e7d631c0df1698b4edc94f148e7247869430e108


>     arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/a7732fdb2ba526a114d9fb759814236c5332f8d7 |     

undefined reference to `std::__atomic_futex_unsigned_base::_M_futex_notify_all(unsigned int*)'

This is happening only on ARC700. Perhaps a variant of ARC that doesn't
support atomic instructions?

ARC maintainers, could you have a look please ?

>   riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/d50171c7a90b38daf6b1c7af97dd61c816fcfac3 |     

/tmp/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-musl/9.2.0/../../../../riscv64-buildroot-linux-musl/bin/ld: video/out/vo_libmpv.c.19.o: undefined reference to symbol '__atomic_compare_exchange_1@@LIBATOMIC_1.0'
/tmp/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-musl/9.2.0/../../../../riscv64-buildroot-linux-musl/bin/ld: /tmp/instance-1/output-1/host/riscv64-buildroot-linux-musl/sysroot/lib64/libatomic.so.1: error adding symbols: DSO missing from command line

mpv has a:

        depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8

probably it should link against libatomic when available ? It means
that RISC-V 64 doesn't have support for sync 8 built-ins ?

>     arc      |        opencv-2.4.13.7         | NOK | http://autobuild.buildroot.net/results/949630bb8bd63eed740abee4600deb238a6cbb0b |     
>     arc      |        opencv-2.4.13.7         | NOK | http://autobuild.buildroot.net/results/db622456c121cef9ed54931abb5c59603b25e1a8 |     
>  powerpc64   |        opencv-2.4.13.7         | NOK | http://autobuild.buildroot.net/results/52d99beb5c7512429264e265545ddc0f05d53781 |     

grfmt_jpeg2000.cpp:341:71: error: lvalue required as unary '&' operand

Needs investigation.

>     arc      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/e21dae6b7680d720b00558212a42206f6aaaa107 |     
> powerpc64le  |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/87a49185211d0238aeb028f0c3607f3fa05e8c61 |     

Same issue as with opencv:

grfmt_jpeg2000.cpp:380:71: error: lvalue required as unary '&' operand

>    nios2     | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/a1bb21a275e78de450f73e30821cbadb3a796d95 | ORPH

-- Looking for __atomic_load_8 in atomic
-- Looking for __atomic_load_8 in atomic - not found
CMake Error at CMakeModules/CheckAtomic.cmake:76 (message):
  Host compiler appears to require libatomic for 64-bit operations, but
  cannot find it.
Call Stack (most recent call first):
  CMakeLists.txt:19 (include)

Needs to link against libatomic perhaps ?

>     i686     |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/48165633b841ce6468b7c34d7e47a6fb2a4555ef |     
>     arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/bcf68bf4cbb7cb6d1bf902ac6c288806d6c50588 |     

Peter (Seiderer), any idea ?

/home/buildroot/autobuild/run/instance-2/output-1/build/qt5base-5.15.0/include/QtCore/../../src/corelib/kernel/qmetatype.h:1160:135: error: ambiguous class template instantiation for 'struct QtMetaTypePrivate::ContainerCapabilitiesImpl<QList<QVariant>, void>'


>   aarch64    |       qt5wayland-5.15.0        | NOK | http://autobuild.buildroot.net/results/f673d4bd730b029bda29357f0b1442cc22475895 |     

Checking for wayland-scanner... yes
Checking for EGL 1.5 with Wayland Platform... no
Project ERROR: Test config.qtwayland_client.tests.dmabuf-server-buffer tries to use undeclared library 'drm'

Meh :/

>     arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/7014f905b9a678cec0699f4bb1d9b6d61535704e |     
>     arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/3776d2302f389691db972de35e077dcf2a07afab |     
>     arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/72f6f1aca4f1c9e19850ceccef7fed756af0e403 |     

Ouch:

during RTL pass: cprop_hardreg
db/memtable.cc:232:1: internal compiler error: in extract_constrain_insn, at recog.c:2205

Could someone figure out if this gcc 8.3 issue still exists ?


>  aarch64_be  |         supertux-0.6.0         | NOK | http://autobuild.buildroot.net/results/0f02877a665b2281266df4b23c72a7c113906c31 |     

/tmp/instance-0/output-1/build/supertux-0.6.0/src/editor/object_settings.cpp:223:26: error: 'remove_if' is not a member of 'std'
     m_options.erase(std::remove_if(m_options.begin(), m_options.end(),

Romain, supertux is your thing, could you have a look ?


>   sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/028efb98838163b0c697bba30cedbc4f0704748d |     

Gah: error: redefinition of 'struct termio'

>     arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0333faabe50ac103324085cc219fbfe06a1718bb |     

This looks like a top-level parallel build failure, the log is not long
enough to show the real problem.

> powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/542e97923620b2135fe5c846ad97c324cc108f43 |     

Ditto.

>     arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/93d88fcfe723e91846a68a9d87de585a741f3c5b |     

And again. I'm not sure how to improve this. Upload the full build log
? This could be huge :-/

>     arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/c3b67d8a5faf7ff06b08a0591f22b1fa4963c2ee | ORPH

/home/test/autobuild/run/instance-3/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/9.3.1/../../../../arc-buildroot-linux-uclibc/bin/ld: ../libs/wampcc/libwampcc.so.6.0.0: undefined reference to `std::__atomic_futex_unsigned_base::_M_futex_notify_all(unsigned int*)'
collect2: error: ld returned 1 exit status

This looks very similar to the log4cplus build issue above, also
happens only on ARC:

  http://autobuild.buildroot.net/?reason=wampcc-1.6

ARC maintainers, could you have a look ?

>     or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/538474abda90082eec91ca9017e91b4427e4f54b |     

Broken binutils:

  /home/test/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: BFD (GNU Binutils) 2.32 assertion fail elf32-or1k.c:2331

Would be useful to test with newer binutils.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
