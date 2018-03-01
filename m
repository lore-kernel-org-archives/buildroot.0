From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Mar 2018 21:21:46 +0100
Subject: [Buildroot] [NEXT 01/26] cpe-info: new make target
In-Reply-To: <CANQCQpZcZy-BXL+=R9fWPMVBOyBad2qtVo=OhX5ZkDc59WP2hA@mail.gmail.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1519697441-54194-2-git-send-email-matthew.weber@rockwellcollins.com>
 <20180227224038.30ae1e48@windsurf.lan>
 <CANQCQpZcZy-BXL+=R9fWPMVBOyBad2qtVo=OhX5ZkDc59WP2hA@mail.gmail.com>
Message-ID: <819bc7c3-936d-741f-6dcd-74e13aa0b00e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-02-18 05:30, Matthew Weber wrote:
> On Tue, Feb 27, 2018 at 3:40 PM, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>> Hello,
>>
>> On Mon, 26 Feb 2018 20:10:16 -0600, Matt Weber wrote:
>>> Similar to make legal-info, produce a csv delimited
>>> file containing all selected packages CPE
>>> identification.
>>>
>>> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> [snip]
>>
>> A question is: do we need a new make target, or can an external script
>> do the same thing ?
>>
>> After all, "make printvars" gives you pretty much the needed
>> information.

 Indeed. and other things that are currently in the infra could also work that
way. E.g. graph-depends would speed up dramatically if it could make use of
printvars.

 One limitation, however: we currently have quite a few where something like
'make foo-cpe-info' is a useful feature. In the infra, it comes for free; in a
script, it needs special treatment.

 On the positive side, however, it should be possible to write a python module
that generalizes all this: gather of packages, doing printvars, filtering the
output.

 Oh, one more thing: if we go that route, then I think printvars should gain a
feature to do output a Python dictionary. Or a JSON object. Or something like
that. Now, the QUOTED_VARS is OK for shell but not for Python. And it doesn't
fully work in shell eval, because some variable names (e.g. 4TH_xxx) are not
valid shell variable names.


>> All what is missing is that you can't easily get the list
>> of selected packages in the current configuration, but that would be
>> useful for me for the pkg-stats script as well. So a "make
>> show-packages" or "make list-packages" could be useful.

 PACKAGES comes pretty close - but since we don't have full Config.in.host it's
incomplete, of course. So we indeed need a recursive list-packages rule.


>> Perhaps that's how we can make our two different needs converge: by
>> having external scripts rather than adding more stuff to the package
>> infrastructure. A ./utils/cpe-report script could do pretty much what
>> you've done here.
>>
>> Thoughts ?
> 
> I was on the fence when I looked at where to make the change.  I went
> the infra route because it ended up being really simple to generate
> that data and the whole process seamed clean.

 That is indeed true: make basically has the infra already to do the recursive
expansion we need. We'd have to duplicate that into Python. But as I said, it
can be done once and then used by several scripts.

 There is one reason why I would really prefer things to move to scripts: every
additional inner-generic-package variable and rule slows down make a little bit.
It's not by a huge amount, but I think I once tested that removing all those
extra rules and their variables from inner-generic-packages sped up 'make -qp'
by about 10%.


> I could see after
> creating some of the CPE maintaining scripting we could easily convert
> to your suggested approach for the report generation as well.

 I agree.

 Regards,
 Arnout

> I just
> didn't want the creation of the CPE scripting holding up the reporting
> function, as I can get more developers to focus on improving the CPE
> information across a few products over the next quarter if I have the
> reports.
> 
> We have been looking at the pkg-stats script and thinking about the
> impl steps to take.  hoping to get more time on them next month.
> 
> Matt
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
