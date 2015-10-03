From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Oct 2015 18:27:24 +0100
Subject: [Buildroot] [PATCH RFC v1 1/1] gcc: improve checking of stack
 smashing support with uclibc
In-Reply-To: <CA+BsyQ5a01JK7Cb7GoZK9jkhsPDHTx0NE0j3YHCde=HMPdXoJQ@mail.gmail.com>
References: <1442685931-20556-1-git-send-email-brendanheading@gmail.com>
 <56007E78.1090001@mind.be>
 <CA+BsyQ5a01JK7Cb7GoZK9jkhsPDHTx0NE0j3YHCde=HMPdXoJQ@mail.gmail.com>
Message-ID: <56100FFC.6020805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28-09-15 15:04, Brendan Heading wrote:
> Hi Arnout, sorry for the delay in replying.
> 
>>> Note that I manually modified configure, rather than regenerating it from
>>> configure.ac.
>>
>>  I think it would be a good idea to send this patch upstream in parallel to get
>> feedback from there as well. But then you should make it against 5.2.0 of course.
> 
> Happy to follow your guidance on this (and your other notes) but first
> I should explain my rationale.
> 
> There's most likely zero chance of getting patches accepted against
> any of the GCC releases which are in maintenance. That means all of
> the releases which are currently supported by buildroot. We *might*
> get patches accepted against mainline, but Thomas suggested that it's
> hard to get patches into GCC in any case. 

 I don't think that that's what he told you. He just told you that you need to
do copyright assignment for non-trivial changes, but your changes is probably
considered trivial, and anyway you may not have a problem with doing copyright
assignment.


> Either way, I have a feeling
> that it might not be straightforward to backport patches from GCC 6.0
> (the next release) all the way back to our oldest supported release
> which is 4.7.x.

 I don't agree at all. It's true that that piece of code has changed in current
master, but at least the principle still applies. I.e., in which order things
are checked.

> So my approach has been to aim at building a set of patches knowing
> that they are not likely to be integrated, meaning we can focus on
> keeping the maintenance as simple as possible on the buildroot side.

 Well, no, diverging from upstream makes maintenance harder, not simpler.

> Separately, I can start the conversation over on the GCC list about
> improving it in the future.

 Separately is OK, as long as the upstream conversation is started in parallel.

> If you look at the GCC configure script, you will see that its
> last-ditch fallback is to try to detect the presence of the stack
> smashing helper functions. I don't understand why they don't just use
> this check by itself as it should work 100% reliably in all possible
> cases. In terms of lines of code it's an invasive change to move to
> that way of working, so my idea is to propose that for the upstream
> head, and the simpler approach for the older releases here.

 Well, since as you say the check for the existence of the functions is more
reliable, I would prefer to have that one for the old gcc versions as well.


>>> Original plan was to reverse the order of the existing __GLIBC_MINOR__ and
>>> uclibc check. However, the uclibc check falls through if it does not
>>> detect uclibc, so I figure it better to add the separate case statement.
>>
>>  IMHO it's better to leave this kind of comment in the commit log itself (i.e.
>> before the ---). Then there is an easy trace of it if someone, years down the
>> line, wonders why it was not done that way.
> 
> Sure.
> 
>>  Also, it would be possible to move the condition up by just splitting it:
>>
>>  if __UCLIBC__; then
>>     if __UCLIBC_HAS_SSP__; then
>>        yes
>>     else
>>        no
>>   elif __GLIBC__ ...
> 
> Looks reasonable. I will revise my patch do do this.
> 
>>  Please avoid the 1/1 bit, by adding -N to format-patch.
> 
> OK.

 It seems you forgot to do that in v2.

> 
>>> +          # All versions of musl provide stack protector
>>> +      gcc_cv_libc_provides_ssp=yes;;
>>> ++       *-*-uclibc*)
>>
>>  Can we be sure that uclibc will always have this in the tuple? Well, _we_ can
>> be sure of course, but can upstream be sure?
> 
> No, we can't be sure as you note. I think this way of checking it is
> pretty poor.
> 
> And I don't really understand why they even do all this. If you look
> further down you will see that the default case is to perform a check
> for the presence of the stack-smashing helper functions.
> 
> I'll resubmit the patch with your suggestions accounted for.
> 
> What do you think of the idea of doing a wholesale change that gets
> rid of the entire check and simply uses the check for the helper
> functions ?

 As mentioned above, I think that that is the better approach, but it's really
worthwhile to discuss this upstream as well.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
