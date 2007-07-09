From: Allan Clark <allanc@chickenandporn.com>
Date: Mon, 9 Jul 2007 17:41:16 -0400
Subject: [Buildroot] [buildroot 0001415]: SVN buildroot does not build
	configuration package
In-Reply-To: <20070709191645.GA25250@aon.at>
References: <6b74b6a0ff9392d0dc56e671767727a0@busybox.net>
	<20070709182752.GB24951@aon.at>
	<37c712e0707091150q216848bqfb06055300b50398@mail.gmail.com>
	<20070709191645.GA25250@aon.at>
Message-ID: <37c712e0707091441k1cfde222j52c621c4dc9b0423@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 7/9/07, Bernhard Fischer <rep.dot.nop@gmail.com> wrote:
> On Mon, Jul 09, 2007 at 02:50:19PM -0400, Allan Clark wrote:
> >On 7/9/07, Bernhard Fischer <rep.dot.nop@gmail.com> wrote:
>
> >>There's no need to touch foo.h
> >
> >Actually, there is, and I discussed it in the list
>
> You said something about it, have to revisit the details.
> >
> >>>patching file toolchain/gcc/4.2.0/500-bsd-no-map_anonymous.patch
> >>>patching file toolchain/dependencies/dependencies.sh
> >>>patching file toolchain/dependencies/dependencies.mk
> >>>patching file package/make/make.mk
> >>
> >>Is there a newer version of make out there?
> >
> >I think it was updated in r19056; this change is used with following:
> >
> >>>patching file toolchain/dependencies/check-host-make.sh
> >
> >See also bug #1422
>
> ah, i thought that was already in. My bad, it was automake for the host.
>
> >>>:~/src/buildroot Allan$ chmod +x
> >>>toolchain/dependencies/check-host-make.sh
> >>
> >>I don't think that you really need this to be executable
> >
> >Fails if it isn't executable.
>
> It is called via
> $(shell $(CONFIG_SHELL) $(check-lxdialog)
> I fail to see how this would require it to be executable unless you
> don't have a shell (which is unlikely since then you couldn't run it
> either way ;)

Fails.  chmod +x, it succeeds.

check-host-sed.sh is already chmod +x, so I'm not the only guy who needs that.

> >I assume if my bug#1422, resolved by file#1072 and 1073 is
> >incorporated, then I won't need to make this file executable, it'll
> >checkout executable just as check-host-sed.sh does.
>
> That late-binding of MAKE1 would be really, really ugly. hm.

Yeah, works for me though.  In this case, the := binding to = binding
is only done in us "broken" cases, so the additional load doesn't
affect the usual people, and it works.  I tested on both Linux and Mac
(PPC and intel) and the change is functional for both.  The Linux
remains bound as it currently is but the Mac gets the late-bound,
allowing me to replace it.

> head -1
> this is deprecated (didn't look if sed does the same; if so both need
> fixing).
>
> Re your change to dependencies.mk. Please explain why you do not use the
> very same scheme for host-make as for sed-make?

I started with the same scheme; problem is, by the time the check is
done for sed, the make is already set.  I had to do it in the included
Makefile fragment to build and switch over to a replacement $(MAKE)
before the dependencies.sh is run.

I would reverse the question: can you do it with the same scheme,
exactly, without the late-binding I was forced to do?  I would see it
as a great alternative.  As my comments in the patch, I tried ot keep
them similar to reduce complexity for maintenance, but that's as close
as I could keep them and still work "invisibly".

I wanted to pass a value forward so that the report that dependencies
puts out shows "no, using make-$(MAKE_VERSION) instead" similar to how
the sed is reported, but that's a cosmetic change, the core
functionality is as patched.

Allan

>


-- 
allanc at chickenandporn.com  "??" http://linkedin.com/in/goldfish
please, no proprietary attachments (http://tinyurl.com/cbgq)
