From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 16 Aug 2017 21:00:26 -0500
Subject: [Buildroot] Analysis of build results for 2017-08-14
In-Reply-To: <CANQCQpZ34VDsBhnZjTdaCrc=-pn0HgYvGs-S1oHXKhRA=uJPGA@mail.gmail.com>
References: <20170815063102.ED3612091A@mail.free-electrons.com>
 <20170815142032.329e8103@windsurf>
 <CANQCQpbHChJOk0=8Mo0U==BRdYRL9=W9kwxkJFZAK=bCXx944A@mail.gmail.com>
 <83b89591-a9f6-8df5-ab5b-5d244fb87708@mind.be>
 <CANQCQpZ34VDsBhnZjTdaCrc=-pn0HgYvGs-S1oHXKhRA=uJPGA@mail.gmail.com>
Message-ID: <CANQCQpa+hXqae9hXk52+Ne0JBpTGUby5NSNnm2MyHma+cDHRew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Wed, Aug 16, 2017 at 6:58 PM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Arnout, Thomas
>
> On Aug 16, 2017 3:23 PM, "Arnout Vandecappelle" <arnout@mind.be> wrote:
>
>
>
> On 15-08-17 14:58, Matthew Weber wrote:
>> You're going to see some more unknown builds today (end log snippets
>> below).  I've updated my autobuilder and trying to figure out the
>> following new error.  At this point I disabled my result submissions
>> and doing further testing offline.
>>
>>
>> http://autobuild.buildroot.net/results/e19/e196ceb333f554748081e78858eafb2739e0e317//
>>  [7m>>>   Sanitizing RPATH in target tree [27m
>> /accts/mlweber1/instance-3/buildroot/support/scripts/fix-rpath target
>> make: Leaving directory `/accts/mlweber1/instance-3/buildroot'
>> make: Entering directory `/accts/mlweber1/instance-3/buildroot'
>> package/coxpcall/coxpcall.mk:11: *** COXPCALL_SITE cannot be empty
>> when COXPCALL_SOURCE is not.  Stop.
>> make: Leaving directory `/accts/mlweber1/instance-3/buildroot'
>
>  Yes, it's a bug!
>
>  if BR2_PRIMARY_SITE_ONLY=y, then BR2_LUAROCKS_MIRROR is not defined in
> Config.in so any lua package has its _SITE set to none so you get this
> error...
> There's a similar issue with the other mirrors, but those always have some
> path
> appended to them (e.g. $(BR2_GNU_MIRROR)/libc) so the _SITE is never empty.
>
>  I think it's best to put the empty _SITE check in an
> ifneq ($(BR2_PRIMARY_SITE_ONLY),y)
>
>

https://patchwork.ozlabs.org/patch/802290/
