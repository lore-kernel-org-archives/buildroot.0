From: Jan Heylen <heyleke@gmail.com>
Date: Fri, 6 Nov 2015 08:06:55 +0100
Subject: [Buildroot] [PATCH] bind: fix intermittent build issues with
	high BR2_JLEVEL
In-Reply-To: <CAGszK3iEXWFBRz4zmG5ky9AptekEX34sVYmRoK8JDremEbNPgA@mail.gmail.com>
References: <1446721054-15603-1-git-send-email-heyleke@gmail.com>
 <20151105224203.77337e4b@free-electrons.com>
 <CAGszK3iEXWFBRz4zmG5ky9AptekEX34sVYmRoK8JDremEbNPgA@mail.gmail.com>
Message-ID: <CAGszK3jYPm77NQZXA7RP6U-0juxqvfe-bbWGfx8r_g8mPVDuCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 6, 2015 at 8:04 AM, Jan Heylen <heyleke@gmail.com> wrote:

> Hi,
>
> On Thu, Nov 5, 2015 at 10:42 PM, Thomas Petazzoni <
> thomas.petazzoni at free-electrons.com> wrote:
>
>> Dear Jan Heylen,
>>
>> Thanks for your patch!
>>
>> On Thu,  5 Nov 2015 11:57:34 +0100, Jan Heylen wrote:
>> > From: Peter Korsgaard <jacmet@sunsite.dk>
>>
>> I am not sure it is appropriate to send a patch in the name of someone
>> else. Maybe you're taking one of Peter's previous commit, and
>> re-applying it, but the context is different, so I believe it should be
>> under your own name.
>>
> OK, just wanted to point out it is the same issue (and the same solution).
>
>>
>> >
>> > Build sometimes breaks with:
>> >
>> > libtool: link: `unix/os.lo' is not a valid libtool object
>> > make[3]: *** [rndc-confgen] Error 1
>> > make[3]: *** Waiting for unfinished jobs....
>> > make[4]: Leaving directory
>> `/scratch/peko/build/bind-9.6-ESV-R4/bin/rndc/unix'
>> >
>> > So disable parallel builds.
>>
>> I've been trying to reproduce the parallel build issue, and I haven't
>> been able to do so. It seems our autobuilders also didn't catch it.
>>
>
> Example of the output (paths shrink-ed):
>
>
> <during compilation of bind>
> libtool: link: `unix/os.lo' is not a valid libtool object
> make[3]: *** [named] Error 1
> make[3]: *** Waiting for unfinished jobs....
> make[4]: Leaving directory `<CUT>/output/build/bind-9.9.7/bin/named/unix'
> make[3]: Leaving directory `<CUT>/output/build/bind-9.9.7/bin/named'
> make[2]: *** [subdirs] Error 1
> make[2]: Leaving directory `<CUT>/output/build/bind-9.9.7/bin'
> make[1]: *** [subdirs] Error 1
> make[1]: Leaving directory `<CUT>/output/build/bind-9.9.7'
> make: *** [<CUT>/output/build/bind-9.9.7/.stamp_built] Error 2
>
> How often are you able to reproduce it ? On what type of build machine ?
>>
>
> We are on the  2015.05, Released May 31st, 2015 Buildroot release.
>
> We build a couple of times a day on a centos 7 environment: 8 cores, 32G
> mem.
>

To be correct: 4 physical, 8 virtual cores


>
>  processor : 7
> vendor_id : GenuineIntel
> cpu family : 6
> model : 60
> model name : Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz
> stepping : 3
> microcode : 0x1c
> cpu MHz : 3390.171
> cache size : 8192 KB
> physical id : 0
> siblings : 8
> core id : 3
> cpu cores : 4
> apicid : 7
> initial apicid : 7
> fpu : yes
> fpu_exception : yes
> cpuid level : 13
> wp : yes
> flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat
> pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb
> rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology
> nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx smx
> est tm2 ssse3 fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt
> tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm ida arat epb
> xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority ept vpid fsgsbase
> tsc_adjust bmi1 avx2 smep bmi2 erms invpcid
> bogomips : 6784.08
> clflush size : 64
> cache_alignment : 64
> address sizes : 39 bits physical, 48 bits virtual
> power management:
>
> So nothing special?
>
> BR2_JLEVEL is set to '0' (so auto)
>
> We do build multiple defconfigs (up to 8) (in separate buildroot working
> folders) at once on the same machine. But I see from the buildroot output
> that BR2_JLEVEL is set to '9' (cores +1) for each of these jobs?
>
> >>> bind 9.9.7 Building
> PATH="<CUT>/output/host/bin:<CUT>/output/host/sbin:<CUT>/output/host/usr/bin:<CUT>/output/host/usr/sbin:/usr/local/bin:/usr/bin"  /usr/bin/make -j9  -C <CUT>/output/build/bind-9.9.7/
> make[1]: Entering directory `<CUT>/output/build/bind-9.9.7'
> making all in <CUT>/output/build/bind-9.9.7/make
>
>
> Maybe the exact condition is to have multiple buildroot jobs (8) on 8
> cores with BR2_JLEVEL set to 8 (so 8*8 = 64 'jobs').
>
To be correct: 8 jobs * -j9 = 72 'jobs'


> So we might optimize that on our side ;-), but still it shouldn't trigger
> this error?
>
> Jan
>
>
>> Thanks,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151106/fa9645dc/attachment.html>
