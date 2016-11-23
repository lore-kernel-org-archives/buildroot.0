From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Tue, 22 Nov 2016 19:57:32 -0500
Subject: [Buildroot] Uclibc shm performance issue
In-Reply-To: <CAK7rcp9bGf5WfLK1YQ_v3kauZW5q7uGZSVPqE_mmr-SvOtEGoA@mail.gmail.com>
References: <CAK7rcp_18Ygbkafq--7qii_9gF-7FrXq7W2iv6EL2vd9efLUxw@mail.gmail.com>
 <CAK7rcp_Z6M4aTp_f8v_Qr5ZEXjnR96pK8eAhx9D7Gs1n6_c_ig@mail.gmail.com>
 <CAK7rcp8e9cAKD0hMrhjE0Fjd64sc_8MdYk1Mnc4D0zozpSMv1w@mail.gmail.com>
 <CAK7rcp9DChiLzazH3gA-YSZ9+HFtQakLbwo6zK-BLAeDqMTHYw@mail.gmail.com>
 <CAK7rcp9R=4had7MJx5MQwqROZh39pYU7WVkgqoFj=qvNV-vzQw@mail.gmail.com>
 <CAK7rcp-LTN68VXOUZOKu_jET9WN5-F1iAQivLe3WsU0zO6iQcg@mail.gmail.com>
 <CAK7rcp_MQbDUFtr2F-GNYU=Mz_5N-0Jv-Yh3aYqr6HOFqvGPxw@mail.gmail.com>
 <CAK7rcp9Rv-JMX=inPMinGZ22LHe+rt0HHfNDTrkj5xaU-hQi3A@mail.gmail.com>
 <CAK7rcp_J_LFvzHyCSbNrgZOz==zFHQ4H2fRrPe0pYJFUwPeX9g@mail.gmail.com>
 <CAK7rcp-2ANhykJACZdPJfmaHm106-Z6W3O80jzogYgk1m3+_mg@mail.gmail.com>
 <af3ce912-0cf7-231a-9919-76ad84cca006@mind.be>
 <CAK7rcp_28bsfbt_WVD4a7FhM_Owag-pH_eeJqCO69nYariNn8g@mail.gmail.com>
 <06663991-b120-8679-00b3-5b7ea07c4df3@mind.be>
 <CAK7rcp_HV=rjGFRR7BWx50s65LAoTyb+snv+aVQnNcF8LSqf-Q@mail.gmail.com>
 <e6031f99-efc2-44b8-ae7e-680ae02f3819@mind.be>
 <CAK7rcp8=w34BeBumR-gCVoJwufuTAovCHVdWMwb0uyiNaBYc+g@mail.gmail.com>
 <CAK7rcp-877BtQvxF+PxGG_4heoWF_besSyW0iJ3-XeV7o7rkng@mail.gmail.com>
 <CAK7rcp9bGf5WfLK1YQ_v3kauZW5q7uGZSVPqE_mmr-SvOtEGoA@mail.gmail.com>
Message-ID: <CAK7rcp_-ikZ0-t52zRO9Q2e1o++w1rBH3Bac7ba+qVUuz6tRCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey, so as it would turn out, I turned on multi core scheduler preemption
and up the highest it would go, and now the performance in our custom linux
is comparable to what I get running tests locally. That makes sense, since
I ruled everything else out.

On Nov 22, 2016 4:18 AM, "Kenneth Adam Miller" <kennethadammiller@gmail.com>
wrote:

Well, I did do a strace on my benchmark test that runs so fast on mine.

Any important point of my particular shared memory data structure
using shm_open is to tell the process how many messages total have
been written to it after a coordinated startup, but to still be able
to wake it up if there is need be. For this, I use atomics in my
shared memory region, and strongly preference keeping the userland
from making unnecessary trips to the kernel. But what I'm seeing is
that the strace file grows to be megabytes in size with read/writes to
named pipes (which I use as a semaphore since I have nothing else
smaller, as I don't want to use a domain socket to pass an eventfd).

I wonder if maybe there's something to do with atomics or the memory
operations that are preventing it from using the hardware to the best
of it's abilities?

On Mon, Nov 21, 2016 at 6:25 PM, Kenneth Adam Miller
<kennethadammiller@gmail.com> wrote:
> On Mon, Nov 21, 2016 at 6:20 PM, Arnout Vandecappelle <arnout@mind.be>
wrote:
>>
>>
>> On 21-11-16 23:23, Kenneth Adam Miller wrote:
>>> No no, my uclibc is different between my target and my host. So, I
>>> can't just run what buildroot built.
>>
>>  Yes you can: chroot into output/target.
>>
>
> And run a uclibc linked target binary on my glibc host?? I didn't know
that.
>
>>
>>> But I did try a statically compiled benchmark that leveraged musl, and
>>> performance is phenominally terrible.
>>
>>  Why do you drag musl in the equation now?
>
> Well, it's statically linked; it helps to eliminate the what the
> source of the slowdown is. So, if I link it statically with musl or
> glibc it doesn't matter, so long as I can eliminate whether uclibc is
> the source of problem or not.
>
>>
>>
>>> By the way, this is just shm files backed by /dev/shm using shm_open.
>>> Just to make sure that that is clear, I'm not sure what it is that is
>>> causing such awful performance.
>>>
>>> So far, this has isolated the issue from involving either the libc
>>> implementation or the actual test software itself. I think it is
>>> something to do with the way I built my custom linux image, possibly
>>> the architecture like you said. But one more thing is, I test my image
>>> by running it under qemu and by running it on dedicated hardware.
>>
>>  Aren't you contradicting yourself here? You're saying you have been
able to
>> isolate it to either libc or the the test software itself, but then you
say it's
>> due to the custom linux image or the architecture.
>
> Well, I only just ran my test as a statically compiled target with a
> different libc implementation, so that kind of narrows down about
> everything else since it's still slow as hell.
>
>>
>>
>>  Regards,
>>  Arnout
>>
>>>
>>> On Mon, Nov 21, 2016 at 5:19 PM, Arnout Vandecappelle <arnout@mind.be>
wrote:
>>>>
>>>>
>>>> On 21-11-16 23:01, Kenneth Adam Miller wrote:
>>>>> On Mon, Nov 21, 2016 at 4:40 PM, Arnout Vandecappelle <arnout@mind.be>
wrote:
>>>>>>  Hi Kenneth,
>>>>>>
>>>>>> On 21-11-16 20:10, Kenneth Adam Miller wrote:
>>>>>>> Hello,
>>>>>>>
>>>>>>> I'm using an absolutely miniscule fully compiled test inside a
custom linux
>>>>>>> built by buildroot with uclibc, and I'm opening and memcpy'ing raw
data into a
>>>>>>> shm region shared between two processes. On my host, I get
fantastic performance
>>>>>>> of course, gigabytes per second as expected. Therefore I know that
the code that
>>>>>>> I wrote is fast. But when I move it to run inside our booted image,
I take a
>>>>>>> huge performance hit. I'm not sure what the source is, but I wanted
to know if
>>>>>>> anybody would think that uclibc would affect performance so
dramatically, or if
>>>>>>> there could be some buildroot specific option that I could change
that would
>>>>>>> improve things. There are two layers of performance penalty in
fact, one just
>>>>>>> moving into the custom linux, and another when we drive our C
library with Ruby.
>>>>>>> I understand that that is to be expected but for me, i dont think
that the
>>>>>>> penalty should be so enormous for that as well. Perhaps grsec could
be affecting it?
>>>>>>
>>>>>>  It sounds like you're stacking a huge number of changes on top of
each other,
>>>>>> and any of them could be the cause. So I think it's better to test
each of them
>>>>>> separately.
>>>>>>
>>>>>> - Buildroot: change your configuration so it can run on your host,
select glibc
>>>>>> as your library and the same gcc version as you use on your host,
chroot into
>>>>>> the rootfs and execute your test application. Do you get the same
performance?
>>>>>>
>>>>>
>>>>> So, there's several different performances that I've already measured
>>>>> - what you're talking about has already been measured, and it's the
>>>>> basis against which I want everything else to compare. I understand if
>>>>> there's some minor performance difference, but I don't expect to fall
>>>>> out of the gigabytes per second range just going into a custom linux
>>>>> image.
>>>>>
>>>>>> - uClibc: like above, but use uClibc as the C library
>>>>>>
>>>>>
>>>>> I don't know what you're saying here.
>>>>>
>>>>>> - gcc: switch to the gcc version you use for your target
>>>>>
>>>>> Gcc versions between host and the target produced are each 4.8.4
>>>>>
>>>>>>
>>>>>> - linux: build the same linux version (but the upstream one) as for
your target
>>>>>> with the configuration for your host, and boot into it natively
>>>>>>
>>>>>
>>>>> Could something like linux 3.13 to 3.14 really make such a huge
difference?
>>>>>
>>>>>> - grsec: like above but use the grsec-patches linux
>>>>>
>>>>> I only just started down the path of building a grsec disabled linux
>>>>> to test with.
>>>>>
>>>>>>
>>>>>> - CPU arch: now run it on your target
>>>>>
>>>>> Both my host and the produced linux use x86_64, so we're good there.
>>>>
>>>>  In that case, you can just chroot into the output/target directory
and execute
>>>> your test application on the host. That immediately will tell you if
it's
>>>> Buildroot+uClibc that is the culprit, or the CPU/kernel (config or
grsec).
>>>>
>>>>  Note that a different CPU + memory architecture, even if it's still
x86_64, can
>>>> make a lot of difference.
>>>>
>>>>  Regards,
>>>>  Arnout
>>>>
>>>>>
>>>>>>
>>>>>> and you can do all that in a different order of course.
>>>>>>
>>>>>>  Regards,
>>>>>>  Arnout
>>>>>>
>>>>>> --
>>>>>> Arnout Vandecappelle                          arnout at mind be
>>>>>> Senior Embedded Software Architect            +32-16-286500
>>>>>> Essensium/Mind                                http://www.mind.be
>>>>>> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR
Leuven
>>>>>> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>>>>>> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>>>>>
>>>>
>>>> --
>>>> Arnout Vandecappelle                          arnout at mind be
>>>> Senior Embedded Software Architect            +32-16-286500
>>>> Essensium/Mind                                http://www.mind.be
>>>> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
>>>> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>>>> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>>
>> --
>> Arnout Vandecappelle                          arnout at mind be
>> Senior Embedded Software Architect            +32-16-286500
>> Essensium/Mind                                http://www.mind.be
>> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
>> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161122/fa229cef/attachment.html>
