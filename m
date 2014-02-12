From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Feb 2014 10:29:58 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <87iosku1n0.fsf@dell.be.48ers.dk>
References: <20140212073007.B3242100CEB@stock.ovh.net>
 <20140212093245.49e2b6ac@skate> <87iosku1n0.fsf@dell.be.48ers.dk>
Message-ID: <20140212102958.343a7ba8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 12 Feb 2014 10:21:55 +0100, Peter Korsgaard wrote:

>  >> aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/6635f7149cd0f5192d49276b2cc3edc5be3b5868/
> 
>  > Ah, yes. I have the beginning of a patch that bumps libv4l, which
>  > solves this problem. But it is not a straightforward bump since libv4l
>  > has changed quite a bit (more tools available, for example).
> 
> Nice, care to send a patch? I had a quick look at updating it (and
> probably renaming to v4l-utils) last week as I could use some of the new
> features, but ran out of time.

Yeah, just need a bit of time. Many patch sets in progress at the same
time :)

>  > What should we do in the mean time?
> 
> If you say just mark it as !BR2_aarch64 for 2014.02.

Ok, will send a patch.

>  >> bfin |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/dd64c2aed5291b6c083f061709d6179150440a7e/
> 
>  > configure: error: no code allocation backend
>  > make: *** [/home/test/test/3/output/build/orc-0.4.18/.stamp_configured] Error 1
> 
> Looks like it should be !BR2_bfin.

Not sure if it's BR2_bfin or !MMU. What we have is:

case "${host_os}" in
  nobody_is_using_this_currently)
    AC_DEFINE(HAVE_CODEMEM_MALLOC, 1, [Use malloc to allocate code for execution])
    ;;
  mingw*|pw32*|cygwin*)
    AC_DEFINE(HAVE_CODEMEM_VIRTUALALLOC, 1, [Use VirtualAlloc to allocate code for execution])
    ;;
  linux*|darwin*|solaris*|netbsd*|freebsd*|openbsd*|kfreebsd*|dragonfly*|gnu*)
    AC_DEFINE(HAVE_CODEMEM_MMAP, 1, [Use mmap to allocate code for execution])
    ;;
  *)
    AC_ERROR([no code allocation backend])
    ;;
esac

So when the host is uclinux (such as on !MMU platforms), nothing
matches. Which seems to match the fact that it needs a proper mmap() to
operate. So I believe it's really a "depends BR2_USE_MMU" that we need
here.

>  >> x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/23caf6deef3cbd8fd6b150e133d493d26d16d80b/
> 
>  > Same as yesterday:
> 
>  > /home/test/test/2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/include/boost/cstdint.hpp:314:42: error:                 typedef boost::ulong_long_type boost::uint64_t
>  > src/thrift/transport/TSSLSocket.cpp:351:1: error: 'uint64_t' does not name a type
> 
> Boost version compatibility issue?

Don't know :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
