From: Michael J. Hammel <buildroot@graphics-muse.org>
Date: Mon, 25 Apr 2011 11:16:42 -0600
Subject: [Buildroot] tic compile stops
In-Reply-To: <1303749477.1283.5.camel@feynman.coloradoengineeringinc.com>
References: <1303749477.1283.5.camel@feynman.coloradoengineeringinc.com>
Message-ID: <1303751802.1283.12.camel@feynman.coloradoengineeringinc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2011-04-25 at 10:37 -0600, Michael J. Hammel wrote:
> I've got a 2010.11 build that I run under Fedora.  It works fine there.
> I was asked to make sure it builds under CentOS.  I built a CentOS vm
> (kvm) and ran the build.  For some reason it stops with ncurses tic
> compile.  No errors, strace just shows it sitting there.  I can't tell
> what the problem is.

FYI: Found something that is probably related but I need to investigate
more.  The version of ncurses with 2010.11 is 5.7.

This comes from
http://invisible-island.net/ncurses/ncurses.faq.html#cross_compiles

Ncurses 5.7 introduced a separate problem. The terminal database
distributed with it uses a feature that causes older versions of tic to
hang. If you are cross-compiling, the database is installed using your
system's copy of tic. You can work around the problem by either updating
ncurses (5.7 was released in 2008), or substituting an older version of
misc/terminfo.src in the build tree.

So I can either try a patch to rev to 5.8 or 5.9 or use the suggested
fix in some manner.  I noticed that 5.8 an 5.9 were rejected due to some
seg-faults in the buildroot master (see
http://git.buildroot.net/buildroot/commit/?id=7d584285c8b32d8a419f8a5fb40efce66e8e5e24).
So it may be the best solution is to pull an a replacement for
misc/terminfo.src from an older version of ncurses.
-- 
Michael J. Hammel <buildroot@graphics-muse.org>
