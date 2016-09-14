From: Vineet Gupta <vgupta@synopsys.com>
Date: Wed, 14 Sep 2016 12:18:32 -0700
Subject: [Buildroot] Stripping kernel modules for ARC
In-Reply-To: <1473852437.3766.15.camel@synopsys.com>
References: <1473852437.3766.15.camel@synopsys.com>
Message-ID: <d1ed5472-3500-45fc-eb0f-bdd2d6afb441@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/14/2016 04:29 AM, Alexey Brodkin wrote:
> Hello,
> 
> This is a follow-up of discussion started here
> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/issues/86
> 
> The problem in hand is kernel stack unwinding on ARC historically was done
> with use of debug_frame instead of more common eh_frame. 

Just for the record, I will be switching kernel unwinder to .eh_frame anyways -
it's just taking longer than I hoped to. So there is no need to do anything
special for .debug_frame - not as of now.

The question is if we enable BR2_STRIP_NONE=y in buildroot, what strip is run
on kernel / modules. And also does it strip build and target/install modules
differently such that target ones are stripped, but not those for debugging etc.

-Vineet

> And if stripping
> of target binaries is enabled in Buildroot invocation of strip with
> "--strip-unneeded" gets rid of debug_frame section effectively making
> kernel unwinder helpless.
> 
> I'm wondering what would be a better way to strip modules on ARC in Buildroot?
> 
> I may see at least following solutions:
>  1. Empty STRIP_STRIP_UNNEEDED or even KSTRIPCMD for ARC
>     This together with http://lists.infradead.org/pipermail/linux-snps-arc/2016-September/001483.html
>     will still produce pretty compact .ko files on target
>  2. Use objdump instead of strip with explicitly mentioned sections to keep or remove
> 
> Any thoughts are much appreciated.
> 
> -Alexey
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
