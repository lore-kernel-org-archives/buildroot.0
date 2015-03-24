From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Mar 2015 00:26:55 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-10-04
In-Reply-To: <CANQCQpbYMUU64NYZshBXa-pMXJ2q1gB4pLZODUDB1V5Ch9yO1A@mail.gmail.com>
References: <20141005063015.846CF101508@stock.ovh.net>
 <CANQCQpYkPJATN4b8hYwCWtLpz3XhO5ZtESWb9crSChA2jYgrjQ@mail.gmail.com>
 <20141007094832.01c0f443@free-electrons.com>
 <CANQCQpZQ0PKOrMR_D-43oiUTQg3vvCub=i8aU=Wndx+FKdQvOQ@mail.gmail.com>
 <CANQCQpbYMUU64NYZshBXa-pMXJ2q1gB4pLZODUDB1V5Ch9yO1A@mail.gmail.com>
Message-ID: <20150325002655.1d4b2f3d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthew Weber,

On Tue, 7 Oct 2014 20:52:15 -0500, Matthew Weber wrote:

> > Yeah, I believe the GCC version check is arbitrary.  I was going to
> > take a look at the generic atomics implementations and see if they
> > were stub functions.  If so, we could patch in a workaround to allow
> > GCC  >= 4.3 to build (with that being an arbitrarily old compiler
> > version.....)  or just open it up to any version and test if we get
> > compiler failures.
> 
> It does look like the version check is correct.  They implemented
> atomics in the latest release and the generic implementation for arch
> not supporting the custom atomics uses the built-in GCC >= 4.7
> functions.  I was looking at conditionally setting
> BR2_ARCH_HAS_ATOMICS and to get it completely correct is quite
> invasive like you mentioned.  What about if we just set it for
> buildroot and external toolchains that we where we know if they are
> >=4.7.  Leaving any user defined external toolchains to possibly run
> into this issue, but maybe that's ok?

Reviving an old discussion, but someone pinged me about this, so I had
a second look. I looked at one of the build failures we originally
discussed:
http://autobuild.buildroot.net/results/3c1/3c1c620684a23b4cbb1cfa560096094cd9bf09ec/build-end.log.
This is a PowerPC build, failing with:

./google/protobuf/stubs/platform_macros.h:77:2: error: #error Host architecture was not detected as supported by protobuf

And here is what the protobuf code looks like:

#if defined(_M_X64) || defined(__x86_64__)
#define GOOGLE_PROTOBUF_ARCH_X64 1
#define GOOGLE_PROTOBUF_ARCH_64_BIT 1
#elif defined(_M_IX86) || defined(__i386__)
#define GOOGLE_PROTOBUF_ARCH_IA32 1
#define GOOGLE_PROTOBUF_ARCH_32_BIT 1
#elif defined(__QNX__)
#define GOOGLE_PROTOBUF_ARCH_ARM_QNX 1
#define GOOGLE_PROTOBUF_ARCH_32_BIT 1
#elif defined(__ARMEL__)
#define GOOGLE_PROTOBUF_ARCH_ARM 1
#define GOOGLE_PROTOBUF_ARCH_32_BIT 1
#elif defined(__aarch64__)
#define GOOGLE_PROTOBUF_ARCH_AARCH64 1
#define GOOGLE_PROTOBUF_ARCH_64_BIT 1
#elif defined(__MIPSEL__)
#if defined(__LP64__)
#define GOOGLE_PROTOBUF_ARCH_MIPS64 1
#define GOOGLE_PROTOBUF_ARCH_64_BIT 1
#else
#define GOOGLE_PROTOBUF_ARCH_MIPS 1
#define GOOGLE_PROTOBUF_ARCH_32_BIT 1
#endif
#elif defined(__pnacl__)
#define GOOGLE_PROTOBUF_ARCH_32_BIT 1
#elif defined(__ppc__)
#define GOOGLE_PROTOBUF_ARCH_PPC 1
#define GOOGLE_PROTOBUF_ARCH_32_BIT 1
#elif defined(__GNUC__) && \
 (((__GNUC__ == 4) && (__GNUC_MINOR__ >= 7)) || (__GNUC__ > 4))
// We fallback to the generic GCC >= 4.7 implementation in atomicops.h
# if __LP64__
#  define GOOGLE_PROTOBUF_ARCH_64_BIT 1
# else
#  define GOOGLE_PROTOBUF_ARCH_32_BIT 1
# endif
#else
#error Host architecture was not detected as supported by protobuf
#endif

So, when the architecture is not supported it indeed falls back on
using atomic intrinsics provided by gcc >= 4.7. However, before that
there is a:

#elif defined(__ppc__)

which should indicate that the PowerPC architecture specifically should
be supported without having to rely on the compiler intrinsics. Do we
know why this is not working?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
