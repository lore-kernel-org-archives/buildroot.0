From: Brendan Heading <brendanheading@gmail.com>
Date: Mon, 3 Aug 2015 16:11:54 +0100
Subject: [Buildroot] [PATCH RFC 1/1] package/libpthsem: cannot be sanely
	cross-compiled
In-Reply-To: <CA+BsyQ7sxr2SJmeJuSod1+GbeHiMyqv=WN0DwvtkhY=dUjmyxw@mail.gmail.com>
References: <1438285530-320-1-git-send-email-brendanheading@gmail.com>
 <20150802221406.GL3647@free.fr>
 <CA+BsyQ7sxr2SJmeJuSod1+GbeHiMyqv=WN0DwvtkhY=dUjmyxw@mail.gmail.com>
Message-ID: <CA+BsyQ7vvdqgPUvFSzcF3aAyYE5UHJ-5VE8cxjAE+qs9GMwNug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> All those tests that can not be determined at build time because they
>> need to run programs should be forced-guessed,with the appropriate ac_cv
>> variables.
>>
>> See for example the atk package, which has quite a bunch of those;
>>     package/atk/atk.mk
>
> Noted. I agree that this is a better approach.

Yann,

[cc Thomas, list]

I thought about this a bit more today.

The state of play, right now, is that we can't be completely sure that
cross-compiling libpthsem will work correctly. We know for sure that
on several architectures it definitely does not work. In other cases
it may appear to compile, by accident, but there's no way to be sure
that it works at run time. Of course this isn't buildroot's fault.

I don't have hardware available to test the right force-guess values,
so I don't think I'm the right person to fix it. Moreover, even with
the right hardware, any bugs caused by using the wrong force-guess
value could be very subtle. Maybe someone else can solve this, but so
far, nobody has, and these packages must have been broken for quite a
long time now (years ?).

So, given that there is no interest in the architectures, and there is
nobody with time to fix the problems properly, isn't there a case for
explicitly disabling libpthsem (and its dependents) for all
cross-compiled builds ? Then, when someone comes along to complain, or
even better proposes a patch, we can selectively re-enable the
configurations that work ?

Just my two cents .. since as things stand right now this package and
related packages are just adding noise in the autobuild logs, and it
might save time for people if the erroneous cases where expressly
disabled, rather than giving the false impression that it works and is
a supportable configuration.

regards

Brendan
