From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 16 Aug 2017 18:58:40 -0500
Subject: [Buildroot] Analysis of build results for 2017-08-14
In-Reply-To: <83b89591-a9f6-8df5-ab5b-5d244fb87708@mind.be>
References: <20170815063102.ED3612091A@mail.free-electrons.com>
 <20170815142032.329e8103@windsurf>
 <CANQCQpbHChJOk0=8Mo0U==BRdYRL9=W9kwxkJFZAK=bCXx944A@mail.gmail.com>
 <83b89591-a9f6-8df5-ab5b-5d244fb87708@mind.be>
Message-ID: <CANQCQpZ34VDsBhnZjTdaCrc=-pn0HgYvGs-S1oHXKhRA=uJPGA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Thomas

On Aug 16, 2017 3:23 PM, "Arnout Vandecappelle" <arnout@mind.be> wrote:



On 15-08-17 14:58, Matthew Weber wrote:
> You're going to see some more unknown builds today (end log snippets
> below).  I've updated my autobuilder and trying to figure out the
> following new error.  At this point I disabled my result submissions
> and doing further testing offline.
>
> http://autobuild.buildroot.net/results/e19/e196ceb333f554748081e78858eafb
2739e0e317//
>  [7m>>>   Sanitizing RPATH in target tree [27m
> /accts/mlweber1/instance-3/buildroot/support/scripts/fix-rpath target
> make: Leaving directory `/accts/mlweber1/instance-3/buildroot'
> make: Entering directory `/accts/mlweber1/instance-3/buildroot'
> package/coxpcall/coxpcall.mk:11: *** COXPCALL_SITE cannot be empty
> when COXPCALL_SOURCE is not.  Stop.
> make: Leaving directory `/accts/mlweber1/instance-3/buildroot'

 Yes, it's a bug!

 if BR2_PRIMARY_SITE_ONLY=y, then BR2_LUAROCKS_MIRROR is not defined in
Config.in so any lua package has its _SITE set to none so you get this
error...
There's a similar issue with the other mirrors, but those always have some
path
appended to them (e.g. $(BR2_GNU_MIRROR)/libc) so the _SITE is never empty.

 I think it's best to put the empty _SITE check in an
ifneq ($(BR2_PRIMARY_SITE_ONLY),y)


I'll send a patch out tonight.


 Regards,
 Arnout
--
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170816/7e8a501c/attachment.html>
