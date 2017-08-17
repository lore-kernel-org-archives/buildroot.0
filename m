From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Aug 2017 14:15:10 +0200
Subject: [Buildroot] Analysis of build results for 2017-08-14
In-Reply-To: <CANQCQpZ8econGG8ZsX9Nv0PCkzWfXq8gGw=Rmus9nxjoFPvRCg@mail.gmail.com>
References: <20170815063102.ED3612091A@mail.free-electrons.com>
 <20170815142032.329e8103@windsurf>
 <CANQCQpbHChJOk0=8Mo0U==BRdYRL9=W9kwxkJFZAK=bCXx944A@mail.gmail.com>
 <83b89591-a9f6-8df5-ab5b-5d244fb87708@mind.be>
 <CANQCQpZ34VDsBhnZjTdaCrc=-pn0HgYvGs-S1oHXKhRA=uJPGA@mail.gmail.com>
 <CANQCQpa+hXqae9hXk52+Ne0JBpTGUby5NSNnm2MyHma+cDHRew@mail.gmail.com>
 <20170817090941.1c8f98fe@windsurf>
 <CANQCQpZ8econGG8ZsX9Nv0PCkzWfXq8gGw=Rmus9nxjoFPvRCg@mail.gmail.com>
Message-ID: <6e8939b4-a0c7-511c-2407-58a36683bc17@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-08-17 14:01, Matthew Weber wrote:
> Thomas,
> 
> On Thu, Aug 17, 2017 at 2:09 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> On Wed, 16 Aug 2017 21:00:26 -0500, Matthew Weber wrote:
>>
>>>>  I think it's best to put the empty _SITE check in an
>>>> ifneq ($(BR2_PRIMARY_SITE_ONLY),y)
>>>
>>> https://patchwork.ozlabs.org/patch/802290/
>>
>> I know this is what Arnout suggested, but I'm not sure it's my
>> preferred fix. Indeed, what about instead dropping the:
>>
>> if !BR2_PRIMARY_SITE_ONLY
>> ...
>> endif
>>
>> condition in Config.in that encloses the definition of BR2_GNU_MIRROR,
>> BR2_LUAROCKS_MIRROR, etc. ?
>>
>> Even though I agree such variables are not used when
>> BR2_PRIMARY_SITE_ONLY=y, I don't see why we hide them. Removing this
>> condition in Config.in avoids the need for adding another condition in
>> pkg-generic.mk, and it seems more logical to me.
>>
> 
> So still keep the condition around BR2_BACKUP_SITE, right?  (remove
> from around the rest(LUA/CPAN/GNU/KERNEL))

 Also remove it from backup site, I think. That way, you can toggle the
PRIMARY_ONLY condition without loosing the rest of your _SITE configurations. I
think that that's why Thomas calls it more logical. The purpose of PRIMARY_ONLY
is to be able to toggle it, cfr. the commit log that added it:

commit 5a83e0849964c5160b980bb57ce89e28684a7dbb
Author: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date:   Fri Jun 22 07:37:03 2012

    Package downloads: allow restricting to primary site only

    This patch adds a new config option BR2_PRIMARY_SITE_ONLY that, when set,
    restricts package downloads to the specified BR2_PRIMARY_SITE. If the package
    is not present on the primary site, the download fails.

    This is useful for project developers who want to ensure that the project can
    be built even if the upstream tarball locations disappear.

    [thomas.petazzoni at free-electrons.com:
     Extend config option help message with more details coming from the
     commit log. Added a dependency on the fact that a primary site has
     been defined. Without any primary site (the default configuration),
     this new option does not make any sense.]

    Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
    Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>



 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
