From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 00:10:57 +0200
Subject: [Buildroot] [PATCH v2] m68k: disable BR2_BINFMT_FLAT_SEP_DATA
 for coldfire
In-Reply-To: <20160821204029.GA14971@waldemar-brodkorb.de>
References: <20160821204029.GA14971@waldemar-brodkorb.de>
Message-ID: <20160823001057.01e7dfb6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 Aug 2016 22:40:29 +0200, Waldemar Brodkorb wrote:
> BR2_BINFMT_FLAT_SEP_DATA can be used to create XIP userland and works fine
> for m68k. Unfortunately a lot of basic packages as pcre are not compileable
> because of a CPU or hardware limitation. The reason for failing are very
> big functions used in the libraries or application code.
> 
> Typical errors are:
> 
> Fatal error: Tried to convert PC relative branch to absolute jump
> or
> error: value -yyyyy out of range
> 
> Add kernel patch from 4ec5542679264bc06a0356ef92f06ad7a0abe06d to make
> BR2_BINFMT_FLAT_ONE compiled firmware work fine.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/20b/20b1586757450d6aad8583ad7a787a7ca11acef1/
>   http://autobuild.buildroot.net/results/d31/d311955ada1ffcd7f69e82965c8fe33eabe488cd/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1 -> v2:
>  - add missing kernel patch from -next commit, requested by Thomas
>    Petazzoni
>  - add more verbose commit message, requested by Thomas Petazzoni
> ---
>  arch/Config.in                                     |  3 +-
>  .../patches/linux/m68knommu-fix-signal.patch       | 45 ++++++++++++++++++++++
>  configs/qemu_m68k_mcf5208_defconfig                |  2 +
>  3 files changed, 48 insertions(+), 2 deletions(-)
>  create mode 100644 board/qemu/m68k-mcf5208/patches/linux/m68knommu-fix-signal.patch

I've applied to master, but in a different form. I've first
cherry-picked from the next branch your patch that enables the FLAT_ONE
format, and then applied this patch with just the part that disables
FLAT_SEP_DATA on m68k. I've also added a comment in the Config.in file
itself about why FLAT_SEP_DATA is not available on m68k.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
