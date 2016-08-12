From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Aug 2016 00:41:07 +0200
Subject: [Buildroot] [PATCH] package/lshw: fix musl build
In-Reply-To: <70811547-4ef0-d4cc-5074-3786f51f406e@gmail.com>
References: <1470327886-29273-1-git-send-email-romain.naour@gmail.com>
 <20160804183732.7319a9c8@free-electrons.com>
 <70811547-4ef0-d4cc-5074-3786f51f406e@gmail.com>
Message-ID: <20160812224107.GB5656@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, Khem, All,

On 2016-08-04 21:25 -0700, Khem Raj spake thusly:
> On 8/4/16 9:37 AM, Thomas Petazzoni wrote:
> > Hello,
> > 
> > On Thu,  4 Aug 2016 18:24:46 +0200, Romain Naour wrote:
> > 
> >> +diff --git a/src/core/dasd.cc b/src/core/dasd.cc
> >> +index 626b8a8..18d19c3 100644
> >> +--- a/src/core/dasd.cc
> >> ++++ b/src/core/dasd.cc
> >> +@@ -4,6 +4,7 @@
> >> + #include <glob.h>
> >> + #include <string.h>
> >> + #include <fcntl.h>
> >> ++#include <libgen.h>
> > 
> > Is this related?
> 
> if we want to use POSIX compliant version of basename() then we need to
> include this yes.

Confirmed. ;-)

> >> + #include <unistd.h>
> >> + #include <inttypes.h>
> >> + #include <sys/ioctl.h>
> >> +@@ -42,7 +43,7 @@ bool scan_dasd(hwNode & n)
> >> +   {
> >> +     for(dev_num=0;dev_num<devices.gl_pathc;dev_num++)
> >> +     {
> >> +-      dev_name = basename(devices.gl_pathv[dev_num]);
> >> ++      dev_name = basename(const_cast<char *>(devices.gl_pathv[dev_num]));
> > 
> > I'm not super familiar with C++ stuff, but why is this problem musl
> > specific? The basename() function is "char *basename(char *)"
> > regardless of the C library being used. What makes it error out with
> > musl and not with other C libraries?
> 
> glibc and uclibc implement the GNU version of basename() API which does
> not modify the argument ( const char*) and when including string.h and
> not libgen.h we are saying we want gnu version. musl does not implement
> the gnu extention, it only has POSIX version. Hence you see the issue
> just on musl.
> 
> So the patch makes it compile for all libcs. however, it should be
> tested on glibc/uclibc since there were bugs in the posix implementation
> of basename()  see
> 
> http://man7.org/linux/man-pages/man3/basename.3.html
> 
> if it cant be tested then make the posix version use only for musl
> which I would not recommend, but its an option

Note however that upstream already did a similar change in an other
file (src/core/pci.cc, by the end of the commit):
    https://github.com/lyonel/lshw/commit/cd690bff1516b40fecd5ec4a7f6619e5bffc3cf0

Romain did open a pull request, but it has not yet been merged:
    https://github.com/lyonel/lshw/pull/17

However, I believe casting is utterly wrong: c_str() returns a
const char* and C++98 states that that string must *not* be modified,
but the POSIX basename() *does* modify its argument.

So, I really believe that the correct fix is completely different
(abstracting away basename, maybe?).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
