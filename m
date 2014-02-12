From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 12 Feb 2014 10:39:16 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140212102958.343a7ba8@skate> (Thomas Petazzoni's message of
 "Wed, 12 Feb 2014 10:29:58 +0100")
References: <20140212073007.B3242100CEB@stock.ovh.net>
 <20140212093245.49e2b6ac@skate> <87iosku1n0.fsf@dell.be.48ers.dk>
 <20140212102958.343a7ba8@skate>
Message-ID: <87eh38u0u3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> > Ah, yes. I have the beginning of a patch that bumps libv4l, which
 >> > solves this problem. But it is not a straightforward bump since libv4l
 >> > has changed quite a bit (more tools available, for example).
 >> 
 >> Nice, care to send a patch? I had a quick look at updating it (and
 >> probably renaming to v4l-utils) last week as I could use some of the new
 >> features, but ran out of time.

 > Yeah, just need a bit of time. Many patch sets in progress at the same
 > time :)

Ok, no problem.


 >> > What should we do in the mean time?
 >> 
 >> If you say just mark it as !BR2_aarch64 for 2014.02.

Ehh, I naturally meant 'I would say' ;)


 >> >> bfin |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/dd64c2aed5291b6c083f061709d6179150440a7e/
 >> 
 >> > configure: error: no code allocation backend
 >> > make: *** [/home/test/test/3/output/build/orc-0.4.18/.stamp_configured] Error 1
 >> 
 >> Looks like it should be !BR2_bfin.

 > Not sure if it's BR2_bfin or !MMU. What we have is:

 > case "${host_os}" in
 >   nobody_is_using_this_currently)
 >     AC_DEFINE(HAVE_CODEMEM_MALLOC, 1, [Use malloc to allocate code for execution])
 >     ;;
 >   mingw*|pw32*|cygwin*)
 >     AC_DEFINE(HAVE_CODEMEM_VIRTUALALLOC, 1, [Use VirtualAlloc to allocate code for execution])
 >     ;;
 >   linux*|darwin*|solaris*|netbsd*|freebsd*|openbsd*|kfreebsd*|dragonfly*|gnu*)
 >     AC_DEFINE(HAVE_CODEMEM_MMAP, 1, [Use mmap to allocate code for execution])
 >     ;;
 >   *)
 >     AC_ERROR([no code allocation backend])
 >     ;;
 > esac

 > So when the host is uclinux (such as on !MMU platforms), nothing
 > matches. Which seems to match the fact that it needs a proper mmap() to
 > operate. So I believe it's really a "depends BR2_USE_MMU" that we need
 > here.


But orc is a JIT code generator, and from the source code it seems it
only handles ARM/PowerPC/x86.



-- 
Bye, Peter Korsgaard
