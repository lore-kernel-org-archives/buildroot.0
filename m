From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 23:16:48 +0200
Subject: [Buildroot] [PATCH] package/apr: fix compile for toolchains
 without thread support
In-Reply-To: <20190923195711.14797-1-ps.report@gmx.net>
References: <20190923195711.14797-1-ps.report@gmx.net>
Message-ID: <20190928231648.33eca396@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Sep 2019 21:57:11 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Do not trust apr_hints.m4 for setting '-D_REENTRANT', set it only for
> toolchains with thread support.
> 
> Fixes misleading configure error ([1]):
> 
>   checking whether int64_t and int use fmt %d... no
>   checking whether int64_t and long use fmt %ld... no
>   checking whether int64_t and long long use fmt %lld... no
>   configure: error: could not determine the string function for int64_t
> 
> which results from warning (promoted to error by '-Werror=cpp'), from
> config.log:
> 
>   configure:24288: checking whether int64_t and long long use fmt %lld
>   configure:24320: .../host/bin/arm-linux-gcc -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os    -Werror -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DLINUX -D_REENTRANT -D_GNU_SOURCE conftest.c >&5
>   In file included from .../host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/sys/types.h:26:0,
>                  from conftest.c:147:
>   .../host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/features.h:218:5: error: #warning requested reentrant code, but thread support was disabled [-Werror=cpp]
>    #   warning requested reentrant code, but thread support was disabled
>        ^~~~~~~
>   cc1: all warnings being treated as errors
>   configure:24320: $? = 1
>   configure: failed program was:
> 
> [1] http://autobuild.buildroot.net/results/4da73982f160305ac2d5d2b4f615fa98eec5a7a3
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/apr/apr.mk | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
