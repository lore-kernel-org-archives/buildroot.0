From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Feb 2017 08:38:07 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-13
In-Reply-To: <20170214232912.42d8a2df@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 14 Feb 2017 23:29:12 +0100")
References: <20170214072856.3AE8320B8C@mail.free-electrons.com>
 <20170214142725.1b9e98ae@free-electrons.com>
 <20170214232912.42d8a2df@free-electrons.com>
Message-ID: <8760kbj44g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> >         sh4a | libraw-0.17.1 | NOK |
 >> > http://autobuild.buildroot.net/results/908aef6c82d56060933713df217b6b2ba21a01b0
 >> 
 >> error: 'SIZE_MAX' was not declared in this scope
 >> 
 >> Missing header include I believe.

 > This one is annoying.

 > So libraw optionally depends on jasper, and it's when both are enabled
 > that the problem occurs.

 > The issue is that the jas_math.h header uses SIZE_MAX and other
 > definitions of <stdint.h>, but those definitions are not visible to C++
 > code, unless you define __STDC_LIMIT_MACROS.

 > So one would think "just define __STDC_LIMIT_MACROS before including
 > <stdint.h> in jas_math.h". Expect that libraw, before including jasper
 > headers, includes other headers that already include <stdint.h>. So by
 > the time jas_math.h includes <stdint.h>, it has already been included,
 > and therefore, the definition of __STDC_LIMIT_MACROS in jas_math.h has
 > no effect.

 > I'm not sure how to fix this. Adding __STDC_LIMIT_MACROS to the build
 > of libraw would fix it, but it's rather weird to have this
 > implementation "detail" of jasper creep in all the way to users of the
 > library.

I didn't look at libraw yet, but couldn't the jasper include just be
moved to the top of the file?


-- 
Bye, Peter Korsgaard
