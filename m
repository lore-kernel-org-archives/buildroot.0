From: Piet Delaney <pdelaney@tensilica.com>
Date: Wed, 21 Sep 2011 01:08:45 -0700
Subject: [Buildroot] Xtensa support
In-Reply-To: <20110921085245.149d3c03@skate>
References: <1D6034426110564DA0DEA9EE9793B3835815AE17BF@NBE-MBX01.americas.swk.pri>	<20110315180743.5e34890b@surf>	<1D6034426110564DA0DEA9EE9793B3835815AE19D2@NBE-MBX01.americas.swk.pri>	<20110315192211.3c59f861@surf>	<1D6034426110564DA0DEA9EE9793B3835815AE1A1F@NBE-MBX01.americas.swk.pri>	<20110315210538.1973f87f@surf>	<779935.72384.qm@web161802.mail.bf1.yahoo.com>	<4D81FB3E.7060307@carallon.com>	<20110318165939.651bf88b@surf>	<4D87C0B5.1090503@tensilica.com>	<20110920203530.2cc44bee@skate>	<522C1DF17AF50042AD8AE87F7887BD3D020C5F4943@exch.hq.tensilica.com>
 <20110921085245.149d3c03@skate>
Message-ID: <4E799B8D.2010402@tensilica.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:

Hi Thomas:

> Hello Marc,
>
> Le Tue, 20 Sep 2011 21:01:35 -0700,
> Marc Gauthier <marc@tensilica.com> a ?crit :
>
>   
>> If you're curious, some of it is here, but far from cleaned up!!:
>>
>> http://git.linux-xtensa.org/cgi-bin/git.cgi?p=buildroot/buildroot-new.git;a=shortlog;h=Xtensa-Patches
>>     
>
> Sounds like most of those patches are patches against uClibc, binutils
> or gdb. It'd be better to have those patches merged in their respective
> upstreams rather than integrating those patches into Buildroot.
>
>   
>>> I am remain concerned by the fact that we carry some special stuff
>>> to support Xtensa, but he Xtensa architecture support has never been
>>> updated since it was merged in Buildroot. Of course, it is our goal
>>> to support configurable architectures such as Xtensa, but the
>>> support for those architectures needs to be actively maintained in
>>> Buildroot upstream.
>>>       
>> Yes.  For example, some of the xtensa files under /target/ need to be
>> moved and/or refactored.  And a defconfig added in /configs/.
>> (Hopefully you now take pull requests?  easier than patches)
>>     
>
> We do take pull requests, but we like when patches are posted on the
> mailing list as well. This is easy to do with a combination of git
> pull-request + git send-email. I can share my little script to do that
> if you're interested.
>
>   
>>> Unfortunately, none of the main Buildroot developers have
>>> Xtensa-capable hardware, so it's a bit hard to contribute to this
>>> effort.
>>>       
>> Do I hear volunteers? :-)  We've discussed sending out boards in the
>> past, but that turned out to be a bit more sideline effort than hoped.
>> Looks like an easier approach is to use an instruction set simulator.
>> It can boot Linux, so should be fine.  If you're interested I'll be
>> very happy to share the details.  Helping hands are most appreciated.
>>     
>
> Having a working emulator setup would definitely be nice. However, to
> get volunteers working on something freely, one needs to put some
> incentive on the table. And usually, in the embedded space, this
> incentive is a nice hardware platform, that the open-source developer
> is so happy to receive that he will be interested in contributing. The
> charm of having a real hardware platform is a lot higher than the charm
> of the emulator, as is the incentive to contribute things :-)
>   
*I also thought having access to "a nice hardware platform' was helpful
for open Buildroot development. My thoughts were that you would be best 
off with
a ML605 that we are currently preparing. They cost about $2,000.00  and can
be configured "concurrently" with multiple VARIANTS. A small set of bit 
streams for
various VARIANT can be stored in the 2GB Flash. We have designed an add 
on daughter
card that has a JTAG connector as well as a high speed FT2232H and support
in our Xtensa Tools environment in the next release.
*
    *  http://www.xilinx.com/products/boards/ml605/reference_designs.htm

This board has an FPGA which I believe is a bit larger that our older LX200
board which supports up to three cores running SMP linux. There boards
cost $8,000 and are is very short supply. I'll send you a jpeg of the ML605
at my desk which I've just set up for FT2232 JTAG development. I'm getting
download speeds of 17MBytes/sec and hope to be at 40Mbytes/sec shortly.
I suspect unlike our linux-xtensa.org mailing list that the buildroot mailer
will reject attachments.
*
*We also have some older development boards that aren't as sexy but might be
of interest. The oldest is a XT2000 which we are discarding but my last 
attempt
at installing a bit stream on wasn't successful. We also have LX60 and 
LX110 boards
that are a bit cheaper than the ML605.  My preference is to beef up the 
ML605
to support 1Gb of memory for customer Linux development and it also makes
it an attractive board for Open Source development.
*
> Of course, regardless of whether boards are made available or not, we
> will gladly take patches, review them, comment them, and help you
> merging as much as possible of the Xtensa support into the mainline
> Buildroot.
>   
* We are having gdb problems that we are currently trying to sort out; 
particularly with
pthreads. I currently suspect changes introduce between binutils-2.20 
and binutils-2.21.

I'll make a uClibc git repo available on linux-xtensa.org with details 
on what's
being done on that front. We need to fix an unresolved symbol that has 
surfaced
recently and perhaps a bit more.

I've recently updated the strace patch but haven't tried it. Your 
current Buildroot
uses a new strace release and needed heavy patching. Once I've got it 
tested I'll
try to get the changes upstream to the strace maintainers and interim 
patches to
your buildroot git repo.

The newer buildroot environment isn't as good for debugging with gdb yet 
and is a bit
less stable. It's a bit rough and needs work. However it's much better 
that our snapshot
from two years ago, that the C development environment is now compatible 
with X11
and large software packages like DDD are easily built for the target.

We need to resolve if the current VARIANT patching mechanism is 
acceptable for the
Buildroot community. It's still in place in the uClibc and gdb 
sub-systems but was removed
from the binutils subsystem when it was moved from the toolchain to 
package directories.
It seems fine to me, do you have any objection to our updating the 
binutils package makefiles
to support Variant patching like we currently to for uClibc and gdb?

I suppose I should keep this relatively short and stop here.

I'll send you the jpeg of the ML605 I'm working on at my desk. I'll Cc 
the buildroot
mailing list but don't expect it to get through. If any developers are 
interested in a copy
write to me or Thomas for a copy.

-piet
*
> Regards,
>
> Thomas
>   

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110921/ed6f5c2c/attachment-0001.html>
