From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 9 Jul 2015 10:01:26 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2015-07-06
In-Reply-To: <20150707063015.5F59D100907@stock.ovh.net>
References: <20150707063015.5F59D100907@stock.ovh.net>
Message-ID: <1436436085.2860.19.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 2015-07-07 at 08:30 +0200, Thomas Petazzoni wrote:
> Those results are limited to the arc architecture.
> 
> Build statistics for 2015-07-06
> ===============================
> 
>         success : 3  
>        failures : 4  
>        timeouts : 0  
>           TOTAL : 7  
> 
> Classification of failures by reason
> ====================================
> 
>                   zeromq-4.0.5 | 1 
>               pure-ftpd-1.0.41 | 1 
>               quagga-0.99.24.1 | 1 
>                   boost-1.58.0 | 1 
> 
> Detail of failures
> ===================
> 
>          arc |                   boost-1.58.0 | NOK | 
> http://autobuild.buildroot.net/results/239a8faf16d3de5dbb0698d7afe2f2ba09e67596/

This happens clearly because ARC following Linux kernel's UAPI doesn't
define __NR_eventfd syscall.
If you look here https://github.com/torvalds/linux/blob/master/include/uapi/asm-generic/unistd.h#L771
you may notice that "eventfd" syscall with some others resides in
"#ifdef__ARCH_WANT_SYSCALL_NO_FLAGS".

And from what I may see only "score" architecture has this
__ARCH_WANT_SYSCALL_NO_FLAGS defined.

Most of other arches that don't use unistd.h from "include/uapi/asm-genereic"
folder have "eventfd" syscall defined. For example it's true for ARM (both
32 and 64 versions).

So I'd say it's not the best way to use directly a syscall that's being
obsoleted in "boost". And so real fix would be to modify boost's
"eventfd_select_interrupter::open_descriptors()" for example with use of
really generic "eventfd2" or even better use libc's eventfd() call instead of direct syscall.

Any thoughts?

>          arc |               pure-ftpd-1.0.41 | NOK | 
> http://autobuild.buildroot.net/results/57a6180809bc51f7206280533f0b9898ce4cfbb4/

Another problem with PIE on ARC.
Should be fixed with http://patchwork.ozlabs.org/patch/493346/
Also this one could be of interest: http://patchwork.ozlabs.org/patch/493350/
It adds already upstream fix for toolchains that have explicit_bzero().

>          arc |               quagga-0.99.24.1 | NOK | 
> http://autobuild.buildroot.net/results/ca0b1e271f29d7639b6a6e895472a35e2c1d8aba/

Another PIE manifestation.
Fixed with http://patchwork.ozlabs.org/patch/493358/

>          arc |                   zeromq-4.0.5 | NOK | 
> http://autobuild.buildroot.net/results/8984d725204936f3c2b040fe04fbb888a0d6a75e/

"cfi row mismatc" will be fixed in arc-2015.06-rc2 (patch is in works already).

-Alexey
