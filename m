From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 14 Nov 2011 16:32:11 +0100
Subject: [Buildroot] [PATCH 7/8] package: change ordering of steps
In-Reply-To: <201109281827.30500.arnout@mind.be>
References: <cover.1316290714.git.thomas.petazzoni@free-electrons.com>
 <20110928162807.10dcbaef@skate>
 <CAAXf6LUzxwPwbTZ1xK7eUXuCWqzdsJcLMtq=c5nfgFJW8kZnsw@mail.gmail.com>
 <201109281827.30500.arnout@mind.be>
Message-ID: <CAAXf6LWMgobcvDnQnc0afQsiTUc8sdsLjy+qXz4EWGWz8eA4Hw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Wed, Sep 28, 2011 at 6:27 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
> On Wednesday 28 September 2011 16:44:46, Thomas De Schampheleire wrote:
>
>> >> * after this, I stumbled upon another problem: if I removed both the
>
>> >> linux and the xenomai output directories, and ran make, then linux was
>
>> >> the first to come into play. After extraction of linux, the PRE_PATCH
>
>> >> hook of xenomai is executed, but Xenomai is not yet extracted! Indeed,
>
>> >> the current dependency tree does not enforce this.
>
>> >> I can fix my scenario by changing the order of -patch and -depends :
>
>> >>
>
>> >> -$(1)-configure: ? ? ? ? ? ? ? ?$(1)-patch $(1)-depends \
>
>> >> +$(1)-configure: ? ? ? ? ? ? ? ?$(1)-depends $(1)-patch \
>
>> >>
>
>> >> but I'm not sure whether this breaks other cases...
>
>> >> What do you think?
>
>> >
>
>> > Aaaah, yes, dammit. Technically speaking, it's a bit ugly that the
>
>> > patch step of one package depends on the dependencies being available.
>
>> > This needs some more thought I guess...
>
>>
>
>> Ok.
>
>> One solution would be to first extract all packages, and then do all
>
>> the rest, but I guess you don't think this is cleaner...
>
> Or you could split the depends step in a depends-extract and depends-install
> step. A package's extract step would then depend on the extracts of all the
> packages it depends on. Or am I completely confused now? :-)

This bug is still hanging around, and can manifest itself when
selecting xenomai, which is now in 2011.11-rc1.

The patch proposed above (change order of depend and patch steps) is
working fine, and does not look 'ugly' to me. Since it fixes a bug, I
think we should apply it anyway.
If later, someone would like to make a change that would not require
the patch step of linux to depend on the xenomai package, we can do
that then. However, I'm not sure if that is at all possible, unless
you want to move the xenomai kernel patches to the buildroot sources
(which I don't think is maintainable and uglier than the patch above).

Best regards,
Thomas
