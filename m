From: Trent Piepho <tpiepho@impinj.com>
Date: Fri, 17 Nov 2017 18:21:40 +0000
Subject: [Buildroot] Conditional setup of TARGET_ABI
In-Reply-To: <1510906984.31683.79.camel@synopsys.com>
References: <1510906984.31683.79.camel@synopsys.com>
Message-ID: <1510942899.15881.70.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2017-11-17 at 08:23 +0000, Alexey Brodkin wrote:
> 
> Let me explain what is encrypted in the log above.
> 
> 1. __do_global_dtors_aux() gets built as a part of libgcc and is supposed to
>    be then used as it is with all the apps we build later on.
>    And what's also important our GCC by default tries to use as compact
>    relocations as possible to save memory footprint, instruction cache
>    utilization etc. So given libgcc is very compact GCC simply decides
>    to use so-called R_ARC_S25W_PCREL relocation which means +-16MiB
>    offset from the current location.
> 
> 2. Qt5WebKit [as well as all other libs and apps] uses functions from libgcc.
>    In that case it's our __do_global_dtors_aux() which in its turn uses another
>    function called __st_r13_to_r15(). And from (1) we know that distance
>    between them should be less than 16MiB. Now given libQt5WebKit is much larger
>    that means if the functions in question end-up placed closer to opposite ends
>    of libQtxxx they won't be reachable to each other... and that's what we see here.

I don't know if this works with current ld, maybe some things have
changed and the assumptions no longer hold.  But what I've been able to
do is to incrementally link multiple objects into one object, so that
the relative distance between code in those objects is fixed at the
incremental link step.  Then the combined object can be come part of a
static library and then linked into a much larger DSO or executable. 
Because ld treats each (section,object) blob as indivisible, the code
inside the incremetally linked objected will not be moved throughout
the larger final product.

In your case, I think one would need to link crtbeginS.o with
_millicodethunk_st.o to produce a replacement crtbeginS.o file.
