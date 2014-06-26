From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 27 Jun 2014 00:42:39 +0400
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-06-25
In-Reply-To: <CAAXf6LXGNsjsH8pUNtAckzTuCGsGQJMkre3h+sQAN1Gd-cVqHA@mail.gmail.com>
References: <20140626063011.68A1B1011DF@stock.ovh.net>
 <20140626063519.GQ4155@tarshish>
 <CAMo8BfKzjF4CsbgZZKw_orUOBkTNLKTS2q__OeSu7fugNr1zPg@mail.gmail.com>
 <CAMo8BfKdyq=Sw84=Z=yZL4fjVDzpvLWMf=E22od=5cUDs9396g@mail.gmail.com>
 <CAAXf6LXGNsjsH8pUNtAckzTuCGsGQJMkre3h+sQAN1Gd-cVqHA@mail.gmail.com>
Message-ID: <CAMo8BfJ=k-LZcFoszurWz=9=PSvPV84O6VRKu0-bQ4J3iXO8Cw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 26, 2014 at 11:11 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Hi,
>
> On Thu, Jun 26, 2014 at 3:45 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
>> On Thu, Jun 26, 2014 at 1:27 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
>>> Hi Baruch,
>>>
>>> On Thu, Jun 26, 2014 at 10:35 AM, Baruch Siach <baruch@tkos.co.il> wrote:
>>>> On Thu, Jun 26, 2014 at 08:30:11AM +0200, Thomas Petazzoni wrote:
>>>>>     xtensa |                   dhcpcd-6.4.0 | NOK | http://autobuild.buildroot.net/results/ecbba5682e3a8065f3cf3e0a9670c2febc71949a/
>>>>
>>>> This is strange. It seems like xtensa toolchains don't like /dev/null as
>>>> output file:
>>>>
>>>> $ .../output/host/usr/bin/xtensa-buildroot-linux-uclibc-gcc -o /dev/null test.c
>>>> .../output/host/usr/lib/gcc/xtensa-buildroot-linux-uclibc/4.8.3/../../../../xtensa-buildroot-linux-uclibc/bin/ld: Final link failed: File truncated
>>>>
>>>> Toolchains for other architectures are just fine with /dev/null. Any Idea?
>>
>> It wants to read back just written .xt.lit.plt section to rearrange it
>> a bit in the
>> following call chain:
>>
>> main
>>   ldwrite
>>     bfd_elf_final_link
>>       elf_xtensa_finish_dynamic_sections
>>         elf_xtensa_combine_prop_entries
>>
>> and obviously fails. This only happens when the result is dynamic object,
>> static linking completes successfully.
>> I don't see why this might be considered invalid behaviour, and rather
>> think that
>> the check in the dhcpcd configure script is wrong.
>
> I think it is debatable whether output to /dev/null in gcc is legal or not.
> My personal feeling is that this should work, and that if xtensa
> cannot deal with it then they should buffer internally and write out
> the file as the last step.

It just doesn't seem practical to fix in ld what can be fixed (and actually
once was fixed) in the configure script. AFAIU the configure script should
be as conservative as possible, so e.g. autoconf-generated scripts don't
use such trick.

> Note that we are using the same /dev/null trick in the check-arm-abi code.

Haven't found that, can you point me to a specific file?

-- 
Thanks.
-- Max
