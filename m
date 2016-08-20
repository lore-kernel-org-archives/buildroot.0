From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 14:41:39 +0200
Subject: [Buildroot] [PATCH 1/1] trousers: fix build issue with musl
In-Reply-To: <1471694164-2094-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1471694164-2094-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160820144139.77d3e36a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Aug 2016 17:26:04 +0530, Rahul Bedarkar wrote:
> With musl C library, we get following build error when building trousers:
> 
>   tsp_tcsi_param.c:14:28: fatal error: bits/local_lim.h: No such file or directory
>    #include <bits/local_lim.h>
>                               ^
>   compilation terminated.
> 
> Header <bits/local_lim.h> is not available in musl. tsp_tcsi_param.c
> uses this for macro HOST_NAME_MAX.
> 
> This patch add support for checking presence of header <bits/local_lim.h>.
> And based on that we include it or define macro HOST_NAME_MAX to 64 if
> it is not already defined.
> 
> Value 64 is chosen because <bits/local_lim.h> also uses same value.

This seems like the wrong approach to fix the problem. Indeed, musl
does have a definition of HOST_NAME_MAX, except it's in <limits.h>.

uClibc and glibc also have HOST_NAME_MAX defined when <limits.h> is
included, so the right fix is to drop completely the <bits/local_lim.h>
inclusion, and include <limits.h> instead.

I've tested the following program:

==
#include <limits.h>
#include <stdio.h>

int main(void)
{
	printf("%d\n", HOST_NAME_MAX);
	return 0;
}
==

and it builds fine with glibc, uClibc and musl.

Could you rework your patch accordingly, and also submit the patch
upstream to the trousers project?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
