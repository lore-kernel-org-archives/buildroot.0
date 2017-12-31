From: Jan Heylen <heyleke@gmail.com>
Date: Sun, 31 Dec 2017 10:23:20 +0100
Subject: [Buildroot] [PATCH v2 1/2] Opentracing: add opentracing-cpp
 v1.2.0 package
In-Reply-To: <CAGszK3iD7PYCjtekPy2DxXnu3VpYto9bQsb_R20+GuVM9P4WtQ@mail.gmail.com>
References: <1513849309-550-2-git-send-email-heyleke@gmail.com>
 <1514014802-23736-1-git-send-email-heyleke@gmail.com>
 <1514014802-23736-2-git-send-email-heyleke@gmail.com>
 <20171230224628.746682f5@windsurf>
 <CAGszK3iD7PYCjtekPy2DxXnu3VpYto9bQsb_R20+GuVM9P4WtQ@mail.gmail.com>
Message-ID: <CAGszK3jy2faOBddMzamf9-0H9MuDxBP847vS22u3n2dH8GCc0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all,

The issue it a bit more complex than I anticipated,

it looks like for armv5 architecture(s), opentracing-cpp hits the
following issue:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58938

"std::exception_ptr is missing on architectures with incomplete atomic
int support"

which comes down to:

#if (__cplusplus >= 201103L) && (ATOMIC_INT_LOCK_FREE > 1)
#include <bits/exception_ptr.h>
#include <bits/nested_exception.h>
#endif

Also related to ATOMIC_INT_LOCK_FREE ==1 for armv5, is the following:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=727621

"
According the debian bug report [1], it is not possible to use std::future
on armv5 targetting toolchains. This is because libstdc++ will only enable
std::future if ATOMIC_INT_LOCK_FREE > 1.  There is no LDREX for armv5 and
older, so this definition is set to ATOMIC_INT_LOCK_FREE when compiling for
ARMv4t or ARMv5.
"

Now, for std::exception_ptr, it got fixed to work withouth atomic
support in libstdc++ begin of 2017, so I currently assume only gcc 6.4
(and maybe 5.5) includes that fix.

So now: I wonder what the best options are:
* remembering the libatomic story from a while ago: is there a chance
I can get it fixed by some dependency on libatomic or so? I don't
think so, but I could be wrong.
* Do I need to remove support for armv5 architectures
* or a construction that armv5 requires a very recent gcc version
(seems fixed in gcc 6.4).

any comment?

br,

Jan

On Sat, Dec 30, 2017 at 10:49 PM, Jan Heylen <heyleke@gmail.com> wrote:
> Thanks, I'll check it out.
>
> On 30 Dec 2017 22:46, "Thomas Petazzoni"
> <thomas.petazzoni@free-electrons.com> wrote:
>>
>> Hello,
>>
>> On Sat, 23 Dec 2017 08:40:01 +0100, Jan Heylen wrote:
>> > From: Jan Heylen <jan.heylen@nokia.com>
>> >
>> > Signed-off-by: Jan Heylen <jan.heylen@nokia.com>
>>
>> The commit title should be:
>>
>>         opentracing-cpp: new package
>>
>>
>> >  package/Config.in                            |  1 +
>> >  package/opentracing-cpp/Config.in            | 11 +++++++++++
>> >  package/opentracing-cpp/opentracing-cpp.hash |  3 +++
>> >  package/opentracing-cpp/opentracing-cpp.mk   | 14 ++++++++++++++
>>
>> Please add an entry in the DEVELOPERS file for this package.
>>
>> > diff --git a/package/opentracing-cpp/Config.in
>> > b/package/opentracing-cpp/Config.in
>> > new file mode 100644
>> > index 0000000..3f6f1ad
>> > --- /dev/null
>> > +++ b/package/opentracing-cpp/Config.in
>> > @@ -0,0 +1,11 @@
>> > +config BR2_PACKAGE_OPENTRACING_CPP
>> > +     bool "opentracing-cpp"
>> > +     depends on BR2_INSTALL_LIBSTDCPP
>> > +     depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
>> > +     help
>> > +       OpenTracing API for C++
>> > +
>> > +       http://opentracing.io
>> > +
>> > +comment "opentracing-cpp needs a toolchain w/ C++"
>> > +     depends on !BR2_INSTALL_LIBSTDCPP
>>
>> You forgot to include in the comment the gcc >= 4.8 dependency.
>>
>> Also, this package doesn't build with the following defconfig:
>>
>> BR2_arm=y
>> BR2_TOOLCHAIN_EXTERNAL=y
>> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
>>
>> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.11-rc1.tar.bz2"
>> BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
>> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
>> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
>> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
>> BR2_TOOLCHAIN_EXTERNAL_CXX=y
>> BR2_INIT_NONE=y
>> BR2_SYSTEM_BIN_SH_NONE=y
>> # BR2_PACKAGE_BUSYBOX is not set
>> BR2_PACKAGE_OPENTRACING_CPP=y
>> # BR2_TARGET_ROOTFS_TAR is not set
>>
>> It fails with:
>>
>> >>> opentracing-cpp v1.2.0 Building
>>
>> PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/usr/local/bin:/usr/bin:/bin:/home/thomas/.rvm/bin:/usr/local/sbin:/usr/sbin:/home/thomas/.rvm/bin:/home/thomas/sys/bin:/home/thomas/.gem/ruby/2.1.0/bin:/home/thomas/.rvm/bin"
>> /usr/bin/make -j5  -C
>> /home/thomas/projets/buildroot/output/build/opentracing-cpp-v1.2.0/
>> Scanning dependencies of target opentracing
>> [ 25%] Building CXX object CMakeFiles/opentracing.dir/src/tracer.cpp.o
>> [ 75%] Building CXX object
>> CMakeFiles/opentracing.dir/src/propagation.cpp.o
>> [ 75%] Building CXX object CMakeFiles/opentracing.dir/src/noop.cpp.o
>> In file included from
>> /home/thomas/projets/buildroot/output/build/opentracing-cpp-v1.2.0/include/opentracing/util.h:13:0,
>>                  from
>> /home/thomas/projets/buildroot/output/build/opentracing-cpp-v1.2.0/include/opentracing/propagation.h:5,
>>                  from
>> /home/thomas/projets/buildroot/output/build/opentracing-cpp-v1.2.0/include/opentracing/tracer.h:4,
>>                  from
>> /home/thomas/projets/buildroot/output/build/opentracing-cpp-v1.2.0/include/opentracing/noop.h:4,
>>                  from
>> /home/thomas/projets/buildroot/output/build/opentracing-cpp-v1.2.0/src/noop.cpp:1:
>>
>> /home/thomas/projets/buildroot/output/build/opentracing-cpp-v1.2.0/3rd_party/include/opentracing/expected/expected.hpp:230:24:
>> error: ?exception_ptr? is not a member of ?std?
>>  class unexpected_type< std::exception_ptr >
>>                         ^
>>
>> /home/thomas/projets/buildroot/output/build/opentracing-cpp-v1.2.0/3rd_party/include/opentracing/expected/expected.hpp:230:24:
>> error: ?exception_ptr? is not a member of ?std?
>>
>> /home/thomas/projets/buildroot/output/build/opentracing-cpp-v1.2.0/3rd_party/include/opentracing/expected/expected.hpp:230:43:
>> error: template argument 1 is invalid
>>  class unexpected_type< std::exception_ptr >
>>                                            ^
>> and many more of such errors.
>>
>> Could you verify with ./utils/test-pkg that your package builds
>> properly?
>>
>> Thanks a lot!
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux and Kernel engineering
>> http://free-electrons.com
