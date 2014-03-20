From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 20 Mar 2014 10:38:23 +0100
Subject: [Buildroot] [PATCH 6/6] Makefile: do not add the toolchain
 target to the TARGETS variable
In-Reply-To: <532983A0.9050107@mind.be>
References: <1394540278-28740-1-git-send-email-fabio.porcedda@gmail.com>
 <1394540278-28740-7-git-send-email-fabio.porcedda@gmail.com>
 <5326A778.7070507@mind.be>
 <CAHkwnC8+MsDLUd5XMU1GDmfNBCVU0p9JTaUmpWiYReTrSsAnKQ@mail.gmail.com>
 <532983A0.9050107@mind.be>
Message-ID: <CAHkwnC9=EDb8aBGGF_KxR_=1=0PumYOnn68S7b1T5_hXuKA1cQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 19, 2014 at 12:46 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 19/03/14 12:10, Fabio Porcedda wrote:
>> On Mon, Mar 17, 2014 at 8:42 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>> On 03/11/14 13:17, Fabio Porcedda wrote:
>>>> Do not add the toolchain target to the TARGETS variable because now the
>>>> toolchain target is a dependency added automatically so it is not
>>>> necessary to add it anymore.
>>>
>>>  I disagree with this one. When you run make, you expect buildroot to
>>> build the toolchain even if no target package is selected. One use case I
>>> can think of: when preparing an internal toolchain for use as an external
>>> toolchain in later builds.
>>
>> Take in account that the "toolchain" target is always built because is
>> a dependency of the "busybox" package that is always build and cannot
>> be disabled and
>> the "toolchain-buildroot" and "toolchain-external" are always enabled
>> in the Config.in.
>
>  busybox can be disabled (if you set the init system to "none").

I didn't know that, great!

>  toolchain, toolchain-buildroot and toolchain-external are not added to
> TARGETS because BR2_PACKAGE_TOOLCHAIN... is not defined.

They are added to targets, just use this command to check it:

$ make defconfig && make show-targets

toolchain-buildroot toolchain busybox target-generic-securetty
target-generic-hostname target-generic-issue target-root-passwd
target-generic-getty-busybox target-generic-do-remount-rw rootfs-tar

>>
>> I was thinking that the "toolchain" target is a package that uses tha
>> package infrastructure, what about using the Config.in:
>>
>> diff --git a/toolchain/Config.in b/toolchain/Config.in
>> index 44f3ac6..94a0c7d 100644
>> --- a/toolchain/Config.in
>> +++ b/toolchain/Config.in
>> @@ -1,5 +1,9 @@
>>  menu "Toolchain"
>>
>> +config BR2_TOOLCHAIN
>> +       bool
>> +       default y
>
>  That would indeed be an option (it would have to be
> BR2_PACKAGE_TOOLCHAIN, but that's a minor detail). I'm not sure, however,
> if this is better than TARGETS := toolchain in the Makefile.

I've not used the PACKAGE prefix because it's not used at all for the
toolchain config options, like the  BR2_TOOLCHAIN_BUILDROOT option.

>
>  Actually, I am in favour of adding blind options for everything that
> uses the package infrastructure. That will allow us to do things like
> checking select/DEPENDENCIES consistency, and generally makes things more
> consistent.

In next revision of the patch i will send the proposed patch.

Thanks and regards
-- 
Fabio Porcedda
