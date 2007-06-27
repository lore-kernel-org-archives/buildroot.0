From: Tom <fivemiletom@gmail.com>
Date: Wed, 27 Jun 2007 10:44:23 -0700
Subject: [Buildroot] ARM EABI builds
In-Reply-To: <20070627081954.GR31791@trinity.fluff.org>
References: <20070626133327.GA5989@trinity.fluff.org>
	<468182D7.30509@gmail.com>
	<20070626222500.GP31791@trinity.fluff.org>
	<20070627081954.GR31791@trinity.fluff.org>
Message-ID: <4682A1F7.3020402@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ben Dooks wrote:
> On Tue, Jun 26, 2007 at 11:25:00PM +0100, Ben Dooks wrote:
>> On Tue, Jun 26, 2007 at 02:19:19PM -0700, Tom wrote:
>>> Ben Dooks wrote:
>>>> Has anyone had success with building an EABI buildroot? I have tried
>>>> building ARM (arm920t,gcc 4.1.2) and the image produced hangs (it
>>>> seems vfprintf does not work)
>>>>
>>>> I have succesfully built images with gcc 4.1.2 and a patch to make it
>>>> build gcc with OABI.
>>>>
>>> Yes, I had success. (After an issue described in "[Buildroot] Arm / 
>>> buildroot / kernel issue: init crashes?", maybe this is your problem too.)
>> Next time, could you please post an URL, it doesn't seem to be trivially
>> findable with google.
>>
>> I have tried EABI build with what should be an EABI only kernel, and this
>> still shows that /bin/sh is not running to a point where you can interact
>> with it.
> 
> I have finally tracked down the problem, and will be submitting a
> fix as soon as I have reviewed the patch.
> 
> The basic problem is as so:
> 
> 1) Buildroot asks for the processor type (ARM920,etc)
> 2) Buildroot does not pass this to gcc when building
> 3) GCC makes a guess about architecture based on internal configuration
> 4) GCC EABI defaults to ARMv5
> 5) ARMv5 produces instructions that cannot execute on ARMv4
> 6) applications fail to work due to invalid instructions in libgcc
> 
> The first part of the solution is to pass --with-cpu=<cpu> to the
> gcc configuration, thus forcing the use of a particular cpu and
> architecture.
> 
> The next thing is, do we then need to produce our compiler and
> libraries in toolchain_arm_<cpu>_<fp> and build_arm_<cpu>_<fp> ?
> 
We need to keep in mind that the same gcc toolchain can support several 
subarchitectures, thus this naming would be somewhat misleading (for 
example, in our cases it did produce both ARMv4 (in the kernel) and 
ARMv5 (in user libs)).

To me it would be great if the gcc toolchain always printed out whatever 
the default SUBTARGET / CPU is as part of its specs. (It does this only 
if one is passed with the --with-cpu option, so if it's not passed, you 
can't easily find the default.) This would have helped me immensely to 
find the --with-cpu workaround, but I am afraid this is not really a 
buildroot issue.
