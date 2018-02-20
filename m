From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Tue, 20 Feb 2018 21:38:06 +0100
Subject: [Buildroot] __mcount on ARC
In-Reply-To: <1519141605.6393.78.camel@synopsys.com>
References: <8e90a87a-7e64-6662-3309-ce0325bc686f@gmail.com>
 <20180219090939.1f050545@windsurf.lan>
 <1519030700.14718.9.camel@synopsys.com>
 <f0f25d75-38f2-8587-61a8-76bf0259247f@gmail.com>
 <1519141605.6393.78.camel@synopsys.com>
Message-ID: <1d71348a-9b76-633c-da22-9056159942d5@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey&All,

On 02/20/2018 04:46 PM, Alexey Brodkin wrote:
> Hi Zoltan,
>
> On Mon, 2018-02-19 at 21:02 +0100, Zoltan Gyarmati wrote:
>> Dear All
>> On 02/19/2018 09:58 AM, Alexey Brodkin wrote:
>>> Hi Zoltan,
>>>
>>> On Mon, 2018-02-19 at 09:09 +0100, Thomas Petazzoni wrote:
>>>> Hello,
> [snip]
>  
>> Thanks for the background info!
>> According to the gprof documentation [1]:
>>
>> "which causes every function to call mcount (or _mcount, or __mcount, depending on the OS and compiler) as one of its first operations."
>>
>>  And a couldn't find any note about difference between the 3 so it seems we are safe to assume that these are the same. 
>> Is there any intention to patch the ARC glibc in Buildroot with the mentioned strong_alias (or at later point even the upstream source tree?)
>> Any opinions?
>>
>>
>> [1] https://sourceware.org/binutils/docs/gprof/Implementation.html
> Keeping in mind your input I really think it worth addressing in glibc for ARC.
> And given our port was not yet upstreamed maybe we may squeeze that approach with
> an alias as on AArch64 into the next respin of Vineet's patches and we'll
> just get new set of patches on top of the most recent glibc in Buildroot.
>
> Or as a short-term solution just to get rid of that build failure right before
> Buildroot release we may just hand-copy "strong_alias (__mcount, _mcount);" in
> sysdeps/arc/machine-gmon.h.
>
> Which option do you prefer?
>
> -Alexey
I think for the upcoming BR release I can just disable the GPSD
profiling option on ARC without touching glibc, and then re-enable it
once ARC glibc is patched and released.
Given that the issue is rather a corner case (i think it's rare that
someone wants to do profiling of gpsd on the target platform anyway, we
just hit it via a random config during autobuild), i think this is the
easiest and least risky solution.
I'm going to send in a BR patch in this spirit.
@Thomas, what do you think?

Regards,

Zoltan Gyarmati
https://zgyarmati.de


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180220/bcbc4d34/attachment.asc>
