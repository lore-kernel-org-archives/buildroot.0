From: =?UTF-8?Q?C=C3=A9dric_Marie?= <cedric.marie@openmailbox.org>
Date: Mon, 07 Sep 2015 12:25:39 +0200
Subject: [Buildroot] [PATCH] Handle verbosity in infrastructures
In-Reply-To: <55ECB52C.3070806@mind.be>
References: <1441487237-10040-1-git-send-email-cedric.marie@openmailbox.org>
 <55ECB52C.3070806@mind.be>
Message-ID: <e7d3e11a111e0f1a4da139146991a588@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 2015-09-06 23:50, Arnout Vandecappelle a ?crit?:

>  Perhaps the removal of KBUILD_VERBOSE and quiet should be a separate 
> patch,
> since that's a change that shouldn't make any difference. The 
> verbose-handling
> in cmake and autotools, on the other hand, do change the behaviour.

OK for two patches.
By the way, I think that this part of code could be removed from 
support/scripts/mkmakefile:

if [ "${quiet}" != "silent_" ]; then

because quiet is currently never set to "silent_". And moreover I'm 
removing it.
But this code comes from the kernel I believe, so I'm not sure it's a 
good idea to simply change it.


>  Add a comment here that we use the package's default unless V=0/1 was 
> passed on
> the command line.

Yes, I agree that it's not very clear.


>> +AUTOTOOLS_VERBOSE =
> 
>  Not needed to initialize it empty.


What if I export AUTOTOOLS_VERBOSE=1 in my shell? Not necessarily to 
hack Buildroot, but maybe because this variable has to be set in my 
shell environnement for another purpose.
Isn't it more robust if I prevent this kind of (very) particular use 
case?



>> +ifeq ("$(origin V)", "command line")
>> +ifeq ($(V),0)
>> +  AUTOTOOLS_VERBOSE = V=0
>> +else ifeq ($(V),1)
>> +  AUTOTOOLS_VERBOSE = V=1
>> +endif
> 
>  This can just be:
> AUTOTOOLS_VERBOSE = V=$(V)

Shouldn't we check that the value makes sense for autotools?
What if I use make V=3, make V=zzz, or make V=


>  Also, no indentation inside make conditions.

OK, I will change it, but this rule is not always respected :-)
The code in root Makefile was indented this way, with 2 spaces.


>  I also don't really like that the $(origin V) condition is repeated, 
> but the
> alternatives don't look better either.

What I don't like with this syntax, is that there is no way to check "if 
condition AND condition". That's why I initialize the variable with a 
value that may be changed a few lines below...
Using BR2_VERBOSE sounded nice to me, but I'm respecting your 
preferences :)


>> +CMAKE_VERBOSE =
> 
>  Again, not needed to initialize it empty.

Same remark as above.


>  Otherwise, looks good to me :-)

Thanks :)

By the way, as mentioned in another mail (the initial discussion 
thread), shouldn't I modify docs/manual/make-tips.txt with the new V=0 
possibility?
I said that V=0 was very specific to autotools, but in fact V=1 is 
already specific to cmake and some autotools packages (the ones that 
have support for this option).

Regards,

-- 
C?dric
