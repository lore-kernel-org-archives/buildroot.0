From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 24 Jul 2015 21:19:30 +0200
Subject: [Buildroot] [PATCH RFC 1/1] ltp-testsuite: support building
 with toolchains without native RPC
In-Reply-To: <1437750198-21171-1-git-send-email-patrickdepinguin@gmail.com>
References: <1437750198-21171-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <CAAXf6LVG8ZtTDjzm2N56M2=2suOuibjOC1GswupboZ+Z0qHf0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 24, 2015 at 5:03 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ltp-testsuite needs RPC, but this could also be provided by libtirpc.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  package/ltp-testsuite/Config.in        |  6 +++---
>  package/ltp-testsuite/ltp-testsuite.mk | 14 ++++++++++++--
>  2 files changed, 15 insertions(+), 5 deletions(-)
>
> Important note: while this works fine on glibc toolchains, I tested with
> http://autobuild.buildroot.org/toolchains/configs/br-arm-cortex-a9-musl.config
> and found that the compiler cannot correctly link an empty C program (as done
> by the ltp-testsuite configure script) when -ltirpc is given, due to:
>
>     libtirpc.so: undefined reference to `authdes_seccreate'
>
> This method is part of file src/auth_des.c in libtirpc, but that file is not
> compiled due to the patch:
> 0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
>
> It is unclear to me how this can work at all for non-RPC toolchains.
> Any suggestions on how this should be handled are welcome...


This problem has now been fixed by a patch on libtirpc by J?rg Krause.

After this patch, ltp-testsuite still doesn't build on musl
toolchains, but I wonder if it makes sense to try and fix that now.
Instead, we could disable the package on musl toolchains?

What do you think?

Thanks,
Thomas
