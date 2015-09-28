From: Brendan Heading <brendanheading@gmail.com>
Date: Mon, 28 Sep 2015 15:04:16 +0100
Subject: [Buildroot] [PATCH RFC v1 1/1] gcc: improve checking of stack
 smashing support with uclibc
In-Reply-To: <56007E78.1090001@mind.be>
References: <1442685931-20556-1-git-send-email-brendanheading@gmail.com>
 <56007E78.1090001@mind.be>
Message-ID: <CA+BsyQ5a01JK7Cb7GoZK9jkhsPDHTx0NE0j3YHCde=HMPdXoJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, sorry for the delay in replying.

>> Note that I manually modified configure, rather than regenerating it from
>> configure.ac.
>
>  I think it would be a good idea to send this patch upstream in parallel to get
> feedback from there as well. But then you should make it against 5.2.0 of course.

Happy to follow your guidance on this (and your other notes) but first
I should explain my rationale.

There's most likely zero chance of getting patches accepted against
any of the GCC releases which are in maintenance. That means all of
the releases which are currently supported by buildroot. We *might*
get patches accepted against mainline, but Thomas suggested that it's
hard to get patches into GCC in any case. Either way, I have a feeling
that it might not be straightforward to backport patches from GCC 6.0
(the next release) all the way back to our oldest supported release
which is 4.7.x.

So my approach has been to aim at building a set of patches knowing
that they are not likely to be integrated, meaning we can focus on
keeping the maintenance as simple as possible on the buildroot side.
Separately, I can start the conversation over on the GCC list about
improving it in the future.

If you look at the GCC configure script, you will see that its
last-ditch fallback is to try to detect the presence of the stack
smashing helper functions. I don't understand why they don't just use
this check by itself as it should work 100% reliably in all possible
cases. In terms of lines of code it's an invasive change to move to
that way of working, so my idea is to propose that for the upstream
head, and the simpler approach for the older releases here.

>> Original plan was to reverse the order of the existing __GLIBC_MINOR__ and
>> uclibc check. However, the uclibc check falls through if it does not
>> detect uclibc, so I figure it better to add the separate case statement.
>
>  IMHO it's better to leave this kind of comment in the commit log itself (i.e.
> before the ---). Then there is an easy trace of it if someone, years down the
> line, wonders why it was not done that way.

Sure.

>  Also, it would be possible to move the condition up by just splitting it:
>
>  if __UCLIBC__; then
>     if __UCLIBC_HAS_SSP__; then
>        yes
>     else
>        no
>   elif __GLIBC__ ...

Looks reasonable. I will revise my patch do do this.

>  Please avoid the 1/1 bit, by adding -N to format-patch.

OK.

>> +          # All versions of musl provide stack protector
>> +      gcc_cv_libc_provides_ssp=yes;;
>> ++       *-*-uclibc*)
>
>  Can we be sure that uclibc will always have this in the tuple? Well, _we_ can
> be sure of course, but can upstream be sure?

No, we can't be sure as you note. I think this way of checking it is
pretty poor.

And I don't really understand why they even do all this. If you look
further down you will see that the default case is to perform a check
for the presence of the stack-smashing helper functions.

I'll resubmit the patch with your suggestions accounted for.

What do you think of the idea of doing a wholesale change that gets
rid of the entire check and simply uses the check for the helper
functions ?

Brendan
