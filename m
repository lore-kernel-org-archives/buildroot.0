From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 11 Jul 2013 13:36:28 +0200
Subject: [Buildroot] [PATCH] Makefile: unset MAKEFLAGS
In-Reply-To: <20130711130113.02ef2730@skate>
References: <1373222539-8915-1-git-send-email-s.martin49@gmail.com>
 <CAAXf6LVC=vqL0mCFVMpKs2A99QtBviHXsmXZp3B+fo+32-+dXA@mail.gmail.com>
 <20130711130113.02ef2730@skate>
Message-ID: <CAAXf6LUoX1iSW94RREcyOrX1_4QQf1dHFhDmynLoOy18js4fwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Jul 11, 2013 at 1:01 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Thu, 11 Jul 2013 11:37:10 +0200, Thomas De Schampheleire wrote:
>
>> What is the strategy with respect to cleaning up the user's
>> environment when building buildroot?
>> Because there are a number of other variables that users can have (and
>> do have) that corrupt the build, for example:
>>
>> C_INCLUDE_PATH
>> CPLUS_INCLUDE_PATH
>> LIBRARY_PATH
>> LD_LIBRARY_PATH
>> PERL5LIB
>> GCC_EXEC_PREFIX
>>
>> In the twisted environments that I'm working in, I'm unsetting these
>> from a wrapper around buildroot make. However, it seems that there
>> already are a number of cleanups done inside buildroot itself, so it
>> makes sense to add the above variables to the list.
>>
>> What do you think?
>
> We have are a bit inconsistent on this. Some variables are unset from
> the main Makefile, and a bunch of others are checked in
> support/dependencies/dependencies.sh. For example, LD_LIBRARY_PATH
> which you mentioned get checked in support/dependencies/dependencies.sh.
>
> Looks like a bit of cleanup in this area might be useful.

dependencies.sh does not complain on the existence of LD_LIBRARY_PATH
in the environment, only on the presence of the current working
directory inside of it. But of course, if we decide to unexport this
variable, then checking its contents is no longer needed.
Is there any valid use case for someone setting LD_LIBRARY_PATH during
a buildroot build?

For the check on the presence of the current working dir in PATH, we
could question whether it makes sense to raise a message and exit, or
to manipulate PATH during the build and continue.

Another variable checked in dependencies.sh is PERL_MM_OPT. This seems
a good candidate to add to the existing list in Makefile.

Is there any particular reason why some unexports are done always, and
some are done inside a check on BR2_HAVE_DOT_CONFIG ?
