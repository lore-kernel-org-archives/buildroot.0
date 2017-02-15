From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 09:33:51 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-13
In-Reply-To: <8760kbj44g.fsf@dell.be.48ers.dk>
References: <20170214072856.3AE8320B8C@mail.free-electrons.com>
 <20170214142725.1b9e98ae@free-electrons.com>
 <20170214232912.42d8a2df@free-electrons.com>
 <8760kbj44g.fsf@dell.be.48ers.dk>
Message-ID: <20170215093351.46cf9b57@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Feb 2017 08:38:07 +0100, Peter Korsgaard wrote:

>  > I'm not sure how to fix this. Adding __STDC_LIMIT_MACROS to the build
>  > of libraw would fix it, but it's rather weird to have this
>  > implementation "detail" of jasper creep in all the way to users of the
>  > library.  
> 
> I didn't look at libraw yet, but couldn't the jasper include just be
> moved to the top of the file?

Haven't tried that. Could be an option, but it still seems weird.

However, I had a second thought about this: according to
http://autobuild.buildroot.net/?reason=libraw-0.17.1, we only have this
issue with toolchains using rather old gcc versions:

 - SH4 toolchain is using 4.7
 - the Buildroot i686/pentium4 toolchain is using gcc 4.5
 - the older build results on Blackfin were with the Analog Devices
   toolchain, gcc 4.3 based

With more recent toolchains (starting with gcc 4.8) this issue does not
occur. Is it something that has changed in the C/C++ standard
implemented starting from 4.8 ? Or is it C library version related ?

Indeed in the SH4 toolchain, the stdint.h header only provides the
SIZE_MAX and related definitions if you're *not* in C++ *or*
__STDC_LIMIT_MACROS is defined. But on my system, stdint.h doesn't have
anything like that: SIZE_MAX and related macros are unconditionally
defined.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
