From: Will Newton <will.newton@gmail.com>
Date: Mon, 16 Apr 2012 17:27:51 +0100
Subject: [Buildroot] Problem with apply-patches.sh
In-Reply-To: <4F8C478E.8010002@atmel.com>
References: <CAFbHwiQUUsb2XPY_+nw--m1KTutFY_zXVYHaFNAfac_ftg78fA@mail.gmail.com>
 <4F8C4224.6040500@atmel.com>
 <CAFbHwiSjrxd39k7U2jMReBKT2sMmBp1PmLwQA3Kq_pAwqjc9RA@mail.gmail.com>
 <4F8C478E.8010002@atmel.com>
Message-ID: <CAFbHwiS0n-j33nq1pkA5N=y6kwwEL=084VxpB6F3Qk5HVu5-9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 16, 2012 at 5:23 PM, Ludovic Desroches
<ludovic.desroches@atmel.com> wrote:
> Le 04/16/2012 06:09 PM, Will Newton a ?crit :
>
>> On Mon, Apr 16, 2012 at 5:00 PM, Ludovic Desroches
>> <ludovic.desroches@atmel.com> ?wrote:
>>>
>>> Hi
>>>
>>> Le 04/16/2012 04:40 PM, Will Newton a ?crit :
>>>
>>>> Hi all,
>>>>
>>>> I noticed that in some cases apply-patches.sh will misbehave if you
>>>> have a file matching the glob '*.patch' in the top-level directory.
>>>> For example the patching of binutils fails in this case. The problem
>>>> is at the line:
>>>>
>>>> ? ? support/scripts/apply-patches.sh $(@D)
>>>> $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER) \*.patch \*.patch.$(ARCH)
>>>> || exit 1;
>>>>
>>>> in package/Makefile.package.in. The glob gets expanded prematurely (to
>>>> e.g. myfile.patch) and then the expanded glob is passed to
>>>> apply-patches.sh which will fail to find any patches matching the
>>>> glob. I've had a go at trying to stop this happening but with no
>>>> success so far. Can anyone think of any creative ways to suppress this
>>>> expansion?
>>>>
>>>> Thanks,
>>>
>>>
>>>
>>> I see what you mean but I can't reproduce your issue:
>>
>>
>> Hi Ludovic, thanks for the quick response!
>>
>> Did you have a dummy patch file in the top-level? e.g.:
>>
>> # cd buildroot
>> # touch mypatch.patch
>> # make
>>
>
> Yes I did this, I have created an empty patch file.
>
>
>> For me that causes the patch patterns passed to apply-patches.sh to
>> look like: mypatch.patch *.patch.arm. The arch specific glob in this
>> case does not match anything so it remains unexpanded.
>>
>
> I agree but I had no error. I didn't do the whole build so maybe I will
> encounter an issue later due to the "no-patched" binutils.

I don't think it will cause an obvious issue for most people - I
happen to have a patched binutils so that if the patch is missing
things go wrong quite obviously. I put an echo in the top of
apply-patches.sh and I was quite clearly seeing the glob had been
expanded by the time it was run (whilst building host-binutils).

For the record my make is 3.81 and bash is 4.1.2.
