From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 7 Sep 2015 14:09:06 +0200
Subject: [Buildroot] [PATCH] Handle verbosity in infrastructures
In-Reply-To: <e7d3e11a111e0f1a4da139146991a588@openmailbox.org>
References: <1441487237-10040-1-git-send-email-cedric.marie@openmailbox.org>
 <55ECB52C.3070806@mind.be> <e7d3e11a111e0f1a4da139146991a588@openmailbox.org>
Message-ID: <55ED7E62.6080806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07-09-15 12:25, C?dric Marie wrote:
> Le 2015-09-06 23:50, Arnout Vandecappelle a ?crit :
> 
>>  Perhaps the removal of KBUILD_VERBOSE and quiet should be a separate patch,
>> since that's a change that shouldn't make any difference. The verbose-handling
>> in cmake and autotools, on the other hand, do change the behaviour.
> 
> OK for two patches.
> By the way, I think that this part of code could be removed from
> support/scripts/mkmakefile:
> 
> if [ "${quiet}" != "silent_" ]; then
> 
> because quiet is currently never set to "silent_". And moreover I'm removing it.

 Correct! I did a git grep to verify, but there were so many hits in patches and
such that I proceeded to look only at .mk files, so this one slipped by.


> But this code comes from the kernel I believe, so I'm not sure it's a good idea
> to simply change it.

 Don't worry about that, we don't keep this file in sync with the kernel (same
for the top-level makefile). The only thing we do keep in sync is the kconfig infra.

> 
> 
>>  Add a comment here that we use the package's default unless V=0/1 was passed on
>> the command line.
> 
> Yes, I agree that it's not very clear.
> 
> 
>>> +AUTOTOOLS_VERBOSE =
>>
>>  Not needed to initialize it empty.
> 
> 
> What if I export AUTOTOOLS_VERBOSE=1 in my shell? Not necessarily to hack
> Buildroot, but maybe because this variable has to be set in my shell
> environnement for another purpose.
> Isn't it more robust if I prevent this kind of (very) particular use case?

 Good point, you're right. Perhaps add a comment to clarify that.
# Override value passed in the environment

> 
> 
> 
>>> +ifeq ("$(origin V)", "command line")
>>> +ifeq ($(V),0)
>>> +  AUTOTOOLS_VERBOSE = V=0
>>> +else ifeq ($(V),1)
>>> +  AUTOTOOLS_VERBOSE = V=1
>>> +endif
>>
>>  This can just be:
>> AUTOTOOLS_VERBOSE = V=$(V)
> 
> Shouldn't we check that the value makes sense for autotools?
> What if I use make V=3, make V=zzz, or make V=

 Garbage in, garbage out :-) The documentation clearly states that it should be
V=1. In fact, V=0 is currently not documented, perhaps that could be added. But
I don't see that as very important.


>>  Also, no indentation inside make conditions.
> 
> OK, I will change it, but this rule is not always respected :-)
> The code in root Makefile was indented this way, with 2 spaces.

 If you do a git blame, you should see that all the lines with wrong indentation
are more than 2 years old. Lately we've been paying attention to consistent
indentation, but nobody has bothered to update existing Makefiles.

> 
> 
>>  I also don't really like that the $(origin V) condition is repeated, but the
>> alternatives don't look better either.
> 
> What I don't like with this syntax, is that there is no way to check "if
> condition AND condition". That's why I initialize the variable with a value that
> may be changed a few lines below...

 Well, you can actually put the two conditions on a single line but it looks
even worse:

ifeq ("$(origin V)"$(V), "command line"1)

> Using BR2_VERBOSE sounded nice to me, but I'm respecting your preferences :)

 I don't remember saying anything about BR2_VERBOSE, and I also can't find it in
the mails I sent (but I didn't check too carefully). I may have said something
about exporting such a variable - since nobody uses it there's no point
exporting it. Also, it doesn't match the naming convention: if it is a purely
internal (non-exported) variable, it should be just VERBOSE; if it is an
exported variable, it should be BR_VERBOSE because it is not user-visible or
Kconfig related (only user-visible or Kconfig options should have the BR2_
prefix, all others should have a BR_ prefix).

> 
> 
>>> +CMAKE_VERBOSE =
>>
>>  Again, not needed to initialize it empty.
> 
> Same remark as above.
> 
> 
>>  Otherwise, looks good to me :-)
> 
> Thanks :)
> 
> By the way, as mentioned in another mail (the initial discussion thread),
> shouldn't I modify docs/manual/make-tips.txt with the new V=0 possibility?

 Exactly :-)

> I said that V=0 was very specific to autotools, but in fact V=1 is already
> specific to cmake and some autotools packages (the ones that have support for
> this option).

 Well, V=1 is specific to buildroot, and we also export it to autotools and
cmake packages. So indeed, that could be added to the documentation as well.

 Documentation updates should probably be in a separate patch since it usually
gets some more discussion about wording etc. and that shouldn't stop the
acceptance of the code change itself.

 Regards,
 Arnout

> 
> Regards,
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
