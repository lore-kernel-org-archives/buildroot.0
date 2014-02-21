From: Frank Bergmann <bergmann@rosho.de>
Date: Fri, 21 Feb 2014 10:46:16 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140221100842.2d988a70@skate>
References: <20140221073009.2E62F10136B@stock.ovh.net>
 <20140221100842.2d988a70@skate>
Message-ID: <53072068.1020407@rosho.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 21.02.2014 10:08, Thomas Petazzoni wrote:
> Hello all,
>
> On Fri, 21 Feb 2014 08:30:08 +0100 (CET), Thomas Petazzoni wrote:
>
>>       nios2 |               e2fsprogs-1.42.9 | NOK | http://autobuild.buildroot.net/results/480d1337de3467520d629fa8bdee57436337ce05/
>
> Fixed by
> http://lists.busybox.net/pipermail/buildroot/2014-February/089981.html
> and
> http://lists.busybox.net/pipermail/buildroot/2014-February/089982.html,
> but I must say I don't necessarily understand the problem.

A short C-program test.c:



#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif

#include <fcntl.h>

int main(int argc, char **argv) {
   return fallocate(0, 0, 0, 0);
}



That makes no sense but compiles without errors:

$> nios2-linux-gnu-gcc test.c
$> ls
a.out  test.c

But when I provide _FILE_OFFSET_BITS=64 the library uses fallocate64 
instead of fallocate:

$> nios2-linux-gnu-gcc -D_FILE_OFFSET_BITS=64 test.c
/tmp/ccQbizFP.o: In function `main':
test.c:(.text+0x30): undefined reference to `fallocate64'
collect2: error: ld returned 1 exit status


Regards,
Frank.
