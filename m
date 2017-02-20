From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 20 Feb 2017 08:32:01 +0100
Subject: [Buildroot] [PATCH 00/58] python pypi library mass version bump.
In-Reply-To: <CAFSsvmrv9m80RA+tc5YMwgbLpHs8-R0hw4ivmxHiNo++Nnyujg@mail.gmail.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
 <20170219211718.42744cc8@free-electrons.com>
 <20170219212054.2x6hosogfxbztldl@localhost.localdomain>
 <CAFSsvmrv9m80RA+tc5YMwgbLpHs8-R0hw4ivmxHiNo++Nnyujg@mail.gmail.com>
Message-ID: <CAGm1_ktgxJzn-8p_PnEJ3uu8nUC+_SFW_xQwiNxSgMHAabA6oQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 19, 2017 at 11:41 PM, Adam Duskett <aduskett@gmail.com> wrote:
> On Sun, Feb 19, 2017 at 4:20 PM, Lionel Flandrin <lionel@svkt.org> wrote:
>> On Sun, Feb 19, 2017 at 09:17:18PM +0100, Thomas Petazzoni wrote:
>>> Hello,
>>>
>>> On Sun, 19 Feb 2017 14:11:57 -0500, Adam Duskett wrote:
>>>
>>> > I personally tested to make sure that all of these changes build properly on my
>>> > machine before submitting.
>>>
>>> The one problem I have with such a mass version bump is precisely that
>>> a build test for Python modules is completely insufficient. Only a
>>> runtime test can determine whether the bump is OK or not. As Yegor
>>> said, a number of those modules gain new dependencies between one
>>> version and another, and those can sometimes only be noticed by doing a
>>> runtime test.
>>>
> Fair enough; I ran through and imported every single package I updated, and
> if there was an example I ran the example as well.

Have you tried to invoke "crossbar version"? This way crossbar checks
whether all packages are available via setuptools. And this causes a
lot of issues with the newest version.

crossbar requires a recent setuptools version and the newest version
has circular dependencies. So I'm still searching for the way to fix
this.

> I rejected any of them that didn't work in the set.  Hopefully that's enough!

Basically this is the way I do bumps. In addition I look at setup.py
and check whether new dependencies appear or change.

>>> Thomas
>>
>> Could we automate that somehow? Would simply importing the package be
>> sufficient for a basic runtime test? Alternatively could we run the
>> package-provided tests (if they exist)?
>>
>> In general I wonder if this python package situation is going to be
>> maintainable in buildroot in the long run. There are nearly 200 python
>> packages at the moment on the master branch, more than 10% of all
>> buildroot packages.
>>
> I agree, it's also a nightmare looking at the packages/ folder when such
> a large amount are prefixed with python-.
>
>> There are more than 20 thousand packages on pypi.python.org.
>>
>> If you're writing any non-trivial python application with buildroot
>> you're almost certain to hit missing and/or outdated packages. It's
>> been my experience in the past few weeks, almost all the python
>> packages I've wanted to use were either missing or outdated, some of
>> them quite severely.
>>
> I noticed this as well while writing this small utility.  Some of these packages
> are outdated by 5+ point revisions!
>
>
>> Furthermore as "embedded" platforms become less and less constrained
>> more and more people will want to move to higher level languages like
>> python.
>>
>> In this situation how can buildroot integrate *and* maintain
>> potentially thousands of python packages "by hand"?
>>
>> I hope this doesn't come off as whiny, I'm extremely thankful for all
>> the work people have put building and maintaining the current
>> infrastructure, and once all the packages you want to use are in there
>> it's a pleasure to use. I just wanted to offer a piece of constructive
>> criticism.
>>
>
> I was thinking, would it be possible to run pypi as a host?  I think
> that's a bit extreme,
> but there's also no support for whl files yet as well.
>
> Just a thought.
>
>> Cheers,
>> --
>> Lionel Flandrin
>
> Adam
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
