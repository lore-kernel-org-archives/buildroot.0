From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Aug 2015 18:38:39 +0200
Subject: [Buildroot] [PATCH RFC 1/1] package/libpthsem: cannot be sanely
 cross-compiled
In-Reply-To: <CA+BsyQ7vvdqgPUvFSzcF3aAyYE5UHJ-5VE8cxjAE+qs9GMwNug@mail.gmail.com>
References: <1438285530-320-1-git-send-email-brendanheading@gmail.com>
 <20150802221406.GL3647@free.fr>
 <CA+BsyQ7sxr2SJmeJuSod1+GbeHiMyqv=WN0DwvtkhY=dUjmyxw@mail.gmail.com>
 <CA+BsyQ7vvdqgPUvFSzcF3aAyYE5UHJ-5VE8cxjAE+qs9GMwNug@mail.gmail.com>
Message-ID: <20150803163839.GO3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brendan, All,

On 2015-08-03 16:11 +0100, Brendan Heading spake thusly:
> >> All those tests that can not be determined at build time because they
> >> need to run programs should be forced-guessed,with the appropriate ac_cv
> >> variables.
> >>
> >> See for example the atk package, which has quite a bunch of those;
> >>     package/atk/atk.mk
> >
> > Noted. I agree that this is a better approach.
> 
> I thought about this a bit more today.
> 
> The state of play, right now, is that we can't be completely sure that
> cross-compiling libpthsem will work correctly. We know for sure that
> on several architectures it definitely does not work. In other cases
> it may appear to compile, by accident, but there's no way to be sure
> that it works at run time. Of course this isn't buildroot's fault.

What are those archs which libpthsem does *not* support by design?

I.e. is it because there are arch-specific assembly code which is not
ported to some archs? Or because of some requirements (like an MMU or
some such)? Other reasons?

> I don't have hardware available to test the right force-guess values,
> so I don't think I'm the right person to fix it. Moreover, even with
> the right hardware, any bugs caused by using the wrong force-guess
> value could be very subtle. Maybe someone else can solve this, but so
> far, nobody has, and these packages must have been broken for quite a
> long time now (years ?).

Well, the problem can be quite easily solved. Nowadays, virtually all
architectures have the their stack all growing down (or is it up? I
never remember, but AFAIK, all archs in Buildroot are in the same
direction) so we can just skip over the test and force-guess it.

I guess a lot of the other tests can be just answered the same.

Again, pretty much all architectures nowadays are very similar in their
"standard" behaviour anyway. There might be a few exceptions for some
corner-cases tests but overall, hard-coding them would just be a matter
of identifying tho special cases.

However, it does not really matter if you do not have access to the
hardware just to decide the force-guess for those tests. And thos you
don't know or can't find the answer fo, just say so in the commit log.
Some knowledgeable individual will step up and tell you.

> So, given that there is no interest in the architectures, and there is
> nobody with time to fix the problems properly, isn't there a case for
> explicitly disabling libpthsem (and its dependents) for all
> cross-compiled builds ? Then, when someone comes along to complain, or
> even better proposes a patch, we can selectively re-enable the
> configurations that work ?

Well, there are a few packages that need libpthsem, of which gnupg2, so
it would be a shame and quite a loss to have to make without those
packages, especialy gnupg2...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
