From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 6 Jul 2016 10:42:56 -0400
Subject: [Buildroot] [PATCH v6 1/6] audit: bump to version 2.6
In-Reply-To: <CAFSsvmp7sABianSmyfWOUv+P3-Y+ZOFVqf5cctU8Acs_zUz+kQ@mail.gmail.com>
References: <1466980753-667-1-git-send-email-Aduskett@gmail.com>
 <1466980753-667-2-git-send-email-Aduskett@gmail.com>
 <20160705171615.GJ6533@free.fr>
 <CAFSsvmp7sABianSmyfWOUv+P3-Y+ZOFVqf5cctU8Acs_zUz+kQ@mail.gmail.com>
Message-ID: <CAFSsvmrb56wuAp5mo5r6e-ZrNK2SF=wFs_3OW_WtdezqGVrCqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All;

I think this is a bug in Audit actually.

Audit 2.6.x checks for AUDIT_FEATURE_VERSION to be defined in
include/linux/audit.h (this define was introduced in kernel version
3.13) and then blindly assumes that struct audit_status has
feature_bitmap.
However this looks like a problem as feature_bitmap wasn't introduced
until kernel 3.19, even though the requirements for audit state >
2.6.30 (http://people.redhat.com/sgrubb/audit/)

This causes a compile error when attempting to compile audit 2.6.x
against kernel headers younger than 3.19.

For the mean time i could add a conditional to require header versions
> 3.19, although I am going to submit a bug report to the audit team
as well.

Thoughts?

Adam


On Wed, Jul 6, 2016 at 9:47 AM, Adam Duskett <aduskett@gmail.com> wrote:
> Hey! Sorry about not getting back to you sooner; I will look into this
> right away!
>
> On Tue, Jul 5, 2016 at 1:16 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> Adam, All,
>>
>> On 2016-06-26 18:39 -0400, Adam Duskett spake thusly:
>>> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
>>> ---
>> [--SNIP--]
>>> diff --git a/package/audit/audit.mk b/package/audit/audit.mk
>>> index 1fbc623..937244d 100644
>>> --- a/package/audit/audit.mk
>>> +++ b/package/audit/audit.mk
>>> @@ -4,7 +4,7 @@
>>>  #
>>>  ################################################################################
>>>
>>> -AUDIT_VERSION = 2.4.4
>>> +AUDIT_VERSION = 2.6
>>
>> This is causing a bunch of autobuilder failures:
>>     http://autobuild.buildroot.org/?reason=audit-2.6.2
>>
>> Care to have a look at it, please?
>>
>> Regards,
>> Yann E. MORIN.
>>
>>>  AUDIT_SITE = http://people.redhat.com/sgrubb/audit
>>>  AUDIT_LICENSE = GPLv2
>>>  AUDIT_LICENSE_FILES = COPYING
>>> --
>>> 2.7.4
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>> --
>> .-----------------.--------------------.------------------.--------------------.
>> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
>> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
>> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
>> '------------------------------^-------^------------------^--------------------'
