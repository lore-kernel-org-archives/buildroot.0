From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 28 Sep 2011 16:44:46 +0200
Subject: [Buildroot] [PATCH 7/8] package: change ordering of steps
In-Reply-To: <20110928162807.10dcbaef@skate>
References: <cover.1316290714.git.thomas.petazzoni@free-electrons.com>
 <5a8e557f8f35394252c05dd5176e143b38a3469f.1316290714.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LUszDVY6zf4dLx6SPknjzQEeXR-yP=zAuBw3FSWaaNkww@mail.gmail.com>
 <20110928162807.10dcbaef@skate>
Message-ID: <CAAXf6LUzxwPwbTZ1xK7eUXuCWqzdsJcLMtq=c5nfgFJW8kZnsw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 28, 2011 at 4:28 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Wed, 28 Sep 2011 16:13:00 +0200,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> I'm experiencing a problem now with Xenomai:
>> * First of all, there was no dependencies to linux anymore in the
>> Xenomai .mk file, which caused incorrect ordering of builds. To
>> address this, I copied the approach of RTAI that Thomas added (add a
>> linux dependency to xenomai-patch and add a xenomai dependency to
>> linux).
>
> Normally, the Xenomai package in package/xenomai/ does not depend on
> Linux being extracted/configured/compiled. It's the opposite: the Linux
> build process depends on the Xenomai package to be extracted, so that
> the package can be applied.
>
> The case of RTAI is different, because the kernel modules of RTAI are
> built by package/rtai/, so RTAI depends on Linux.
>
> Could you expand on which problem you have when the Xenomai package in
> package/xenomai does not depend on Linux ?

On second thought, you're right. I was still thinking too much in
terms of my old xenomai.mk file where kernel and userspace were
combined.

>
>> * after this, I stumbled upon another problem: if I removed both the
>> linux and the xenomai output directories, and ran make, then linux was
>> the first to come into play. After extraction of linux, the PRE_PATCH
>> hook of xenomai is executed, but Xenomai is not yet extracted! Indeed,
>> the current dependency tree does not enforce this.
>> I can fix my scenario by changing the order of -patch and -depends :
>>
>> -$(1)-configure: ? ? ? ? ? ? ? ?$(1)-patch $(1)-depends \
>> +$(1)-configure: ? ? ? ? ? ? ? ?$(1)-depends $(1)-patch \
>>
>> but I'm not sure whether this breaks other cases...
>> What do you think?
>
> Aaaah, yes, dammit. Technically speaking, it's a bit ugly that the
> patch step of one package depends on the dependencies being available.
> This needs some more thought I guess...

Ok.
One solution would be to first extract all packages, and then do all
the rest, but I guess you don't think this is cleaner...

~Thomas
