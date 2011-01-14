From: Michael S. Zick <minimod@morethan.org>
Date: Fri, 14 Jan 2011 09:40:58 -0600
Subject: [Buildroot] freetype: fix for multilib toolchain
In-Reply-To: <20110114154430.4952dca7@surf>
References: <BAY145-w16379D55CDD8378B320C74C2F30@phx.gbl>
	<AANLkTi=4rF27ON=McqUWPnM3g7JrjBtGto2q3rMrNKbG@mail.gmail.com>
	<20110114154430.4952dca7@surf>
Message-ID: <201101140941.00805.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri January 14 2011, Thomas Petazzoni wrote:
> On Fri, 14 Jan 2011 13:47:54 +0100
> Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:
> 
> > AFAIK, ld does not have an "-march" option (just looked at the man page).
> > So I'd say that it is the freetype (and sshd?) package that needs to be fixed
> > (and not BR) because they are using LDFLAGS wrong.
> 
> I clearly overlooked this, and I think you're correct.
> 
> So, as I said in another e-mail, I think ld does allows to choose
> between different ld variants. So the link should always be done with
> gcc, which then drives ld, giving it the correct path to the
> appropriate libraries and runtime.
> 

In my limited experience, that seems to be the most general solution;
call ld through the "gcc" front-end.

After all, that is one of the purposes of that front end driver, to
either process options or call the proper option processor helper.

That __should__ handle any vendor introduced changes to options.

Although there are option combinations that break the path generation
in the Code Sourcery, MIPS-4.3 tool chain build and I suppose that
could happen in other vendors/builds.

The "tuple-specific-gcc ..." call, 
minus input/output files, 
plus --print-multi-dir
should always output the resolved path for the full set of other options passed.

If it doesn't, then some combination of the other options are breaking the
path resolution (or the toolchain doesn't have libraries supporting that combination).

And the "tuple-specific-gcc -print-multi-lib" call should produce a list of
the available paths / option combinations.
Which comes into play with the fact that vendors are known to sometimes invent
their own naming scheme for the multi-library paths.

It might be possible to invent some sort of general purpose sanity test
based on this behavior to help in the situation when things break unexpectedly.

Mike

> Regards,
> 
> Thomas
