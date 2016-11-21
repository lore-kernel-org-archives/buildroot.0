From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 21 Nov 2016 23:19:36 +0100
Subject: [Buildroot] Uclibc shm performance issue
In-Reply-To: <CAK7rcp_28bsfbt_WVD4a7FhM_Owag-pH_eeJqCO69nYariNn8g@mail.gmail.com>
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
Message-ID: <06663991-b120-8679-00b3-5b7ea07c4df3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-11-16 23:01, Kenneth Adam Miller wrote:
> On Mon, Nov 21, 2016 at 4:40 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>  Hi Kenneth,
>>
>> On 21-11-16 20:10, Kenneth Adam Miller wrote:
>>> Hello,
>>>
>>> I'm using an absolutely miniscule fully compiled test inside a custom linux
>>> built by buildroot with uclibc, and I'm opening and memcpy'ing raw data into a
>>> shm region shared between two processes. On my host, I get fantastic performance
>>> of course, gigabytes per second as expected. Therefore I know that the code that
>>> I wrote is fast. But when I move it to run inside our booted image, I take a
>>> huge performance hit. I'm not sure what the source is, but I wanted to know if
>>> anybody would think that uclibc would affect performance so dramatically, or if
>>> there could be some buildroot specific option that I could change that would
>>> improve things. There are two layers of performance penalty in fact, one just
>>> moving into the custom linux, and another when we drive our C library with Ruby.
>>> I understand that that is to be expected but for me, i dont think that the
>>> penalty should be so enormous for that as well. Perhaps grsec could be affecting it?
>>
>>  It sounds like you're stacking a huge number of changes on top of each other,
>> and any of them could be the cause. So I think it's better to test each of them
>> separately.
>>
>> - Buildroot: change your configuration so it can run on your host, select glibc
>> as your library and the same gcc version as you use on your host, chroot into
>> the rootfs and execute your test application. Do you get the same performance?
>>
> 
> So, there's several different performances that I've already measured
> - what you're talking about has already been measured, and it's the
> basis against which I want everything else to compare. I understand if
> there's some minor performance difference, but I don't expect to fall
> out of the gigabytes per second range just going into a custom linux
> image.
> 
>> - uClibc: like above, but use uClibc as the C library
>>
> 
> I don't know what you're saying here.
> 
>> - gcc: switch to the gcc version you use for your target
> 
> Gcc versions between host and the target produced are each 4.8.4
> 
>>
>> - linux: build the same linux version (but the upstream one) as for your target
>> with the configuration for your host, and boot into it natively
>>
> 
> Could something like linux 3.13 to 3.14 really make such a huge difference?
> 
>> - grsec: like above but use the grsec-patches linux
> 
> I only just started down the path of building a grsec disabled linux
> to test with.
> 
>>
>> - CPU arch: now run it on your target
> 
> Both my host and the produced linux use x86_64, so we're good there.

 In that case, you can just chroot into the output/target directory and execute
your test application on the host. That immediately will tell you if it's
Buildroot+uClibc that is the culprit, or the CPU/kernel (config or grsec).

 Note that a different CPU + memory architecture, even if it's still x86_64, can
make a lot of difference.

 Regards,
 Arnout

> 
>>
>> and you can do all that in a different order of course.
>>
>>  Regards,
>>  Arnout
>>
>> --
>> Arnout Vandecappelle                          arnout at mind be
>> Senior Embedded Software Architect            +32-16-286500
>> Essensium/Mind                                http://www.mind.be
>> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
>> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
