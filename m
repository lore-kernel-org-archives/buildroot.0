From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 14 Sep 2016 20:00:27 +0000
Subject: [Buildroot] Stripping kernel modules for ARC
In-Reply-To: <87mvjafe5t.fsf@dell.be.48ers.dk>
References: <1473852437.3766.15.camel@synopsys.com>
 <d1ed5472-3500-45fc-eb0f-bdd2d6afb441@synopsys.com>
 <87mvjafe5t.fsf@dell.be.48ers.dk>
Message-ID: <1473883226.3994.7.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vineet,

On Wed, 2016-09-14 at 21:57 +0200, Peter Korsgaard wrote:
> > 
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > "Vineet" == Vineet Gupta <vgupta@synopsys.com> writes:
> 
> ?> On 09/14/2016 04:29 AM, Alexey Brodkin wrote:
> ?>> Hello,
> ?>>?
> ?>> This is a follow-up of discussion started here
> ?>> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/issues/86
> ?>>?
> ?>> The problem in hand is kernel stack unwinding on ARC historically was done
> ?>> with use of debug_frame instead of more common eh_frame.?
> 
> ?> Just for the record, I will be switching kernel unwinder to .eh_frame anyways -
> ?> it's just taking longer than I hoped to. So there is no need to do anything
> ?> special for .debug_frame - not as of now.
> 
> Ok, what kind of time frame are we looking at? Within the 2016.11 cycle
> or longer?
> 
> 
> ?> The question is if we enable BR2_STRIP_NONE=y in buildroot, what strip is run
> ?> on kernel / modules. And also does it strip build and target/install modules
> ?> differently such that target ones are stripped, but not those for debugging etc.
> 
> git grep -A3 STRIP_none package/Makefile.in
> package/Makefile.in:ifeq ($(BR2_STRIP_none),y)
> package/Makefile.in-TARGET_STRIP = true
> package/Makefile.in-STRIPCMD = $(TARGET_STRIP)
> package/Makefile.in-KSTRIPCMD = $(TARGET_STRIP)
> 
> So the stripping in target-finalize becomes a NOP when BR2_STRIP_none is
> selected.

Just to add buildroot doesn't do any stripping in "output/build/XXX" at all.
And depending on BR2_STRIP_xxx binaries in "output/target" folder could be stripped.
And different binaries could be stripped differently, this in particular is appled
to kernel modules (thus KSTRIPCMD is used along with normal STRIPCMD).

-Alexey
