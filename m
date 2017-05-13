From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 May 2017 15:14:30 +0200
Subject: [Buildroot] [PATCH] radvd: fix build with 4.11 kernel headers
In-Reply-To: <1494488270-10121-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1494488270-10121-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170513151430.19c863d9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 May 2017 09:37:50 +0200, Thomas Petazzoni wrote:
> Since the introduction of 4.11 kernel headers in Buildroot, radvd has
> failed to build with all toolchains using this kernel header version.
> 
> The issue comes from the fact that radvd includes both <net/if_arp.h>
> and <linux/if_arp.h> if they are available. Until 4.11,
> <linux/if_arp.h> was in fact not included, because the
> AC_CHECK_HEADERS() test concluded this header was unsuitable. This has
> been fixed in the upstream kernel by commit
> 2618be7dccf8739b89e1906b64bd8d551af351e6 ("uapi: fix linux/if.h
> userspace compilation errors"). So now, the radvd configure script
> considers both <net/if_arp.h> and <linux/if_arp.h> as suitable
> headers, and includes both of them, leading to the duplicate
> definition of various types.
> 
> Since it's redundant to include both <net/if_arp.h> and
> <linux/if_arp.h>, we simply force radvd to believe that
> <linux/if_arp.h> is not available by passing the appropriate autoconf
> cache variable. This gets us back to the previous situation, where
> <linux/if_arp.h> was never used.
> 
> This has been tested with a uClibc toolchain using 4.11 kernel
> headers, and verified to work on glibc and musl with older kernel
> headers as well.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/949a75d96299394e4ac957746fa23a4b52f31b43/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/radvd/radvd.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
