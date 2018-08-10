From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Fri, 10 Aug 2018 19:41:52 +0200
Subject: [Buildroot] [PATCH] ncurses: disable terminfo database install
 for host-ncurses
In-Reply-To: <20180809221210.1e145caf@windsurf>
References: <20180809145722.388-1-peter@korsgaard.com>
 <20180809221210.1e145caf@windsurf>
Message-ID: <20180810174152.GC13619@australia.be.alcatel-lucent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Aug 09, 2018 at 10:12:10PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu,  9 Aug 2018 16:57:22 +0200, Peter Korsgaard wrote:
> > Since commit b35ad5d0b45e (ncurses: make host-ncurses use host terminfo), we
> > are now pointing host-ncurses to the host terminfo (typically) located in
> > /usr/share/terminfo.
> > 
> > With this change we are reusing the existing host terminfo database, so
> > there is no point in trying to install our own on top.  The user running
> > buildroot typically will have no write access to /usr/share/terminfo, but
> > tic in that case falls back to writing the database to $HOME/.terminfo.
> > Neither of which are desirable.
> > 
> > In case $HOME/.terminfo also isn't writable, tic fails, breaking the install
> > step for host-ncurses:
> > 
> > ** Building terminfo database, please wait...
> > Running sh ./shlib tic to install /usr/share/terminfo ...
> > 
> >         You may see messages regarding extended capabilities, e.g., AX.
> >         These are extended terminal capabilities which are compiled
> >         using
> >                 tic -x
> >         If you have ncurses 4.2 applications, you should read the INSTALL
> >         document, and install the terminfo without the -x option.
> > 
> > "terminfo.tmp", line 21272, terminal 'v3220': /home/peko/.terminfo: permission denied (errno 30)
> > 
> > To fix all of this, simply disable the terminfo database install.
> > 
> > Suggested-by: Arnout Vandecappelle <arnout@mind.be>
> > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> > ---
> >  package/ncurses/ncurses.mk | 1 +
> >  1 file changed, 1 insertion(+)
> 
> Applied to master, thanks.

As the breaking commit b35ad5d0b45e went onto the 2018.02.x branch (as
00e775b76cfb), I think the fix should be applied there as well.

Similarly for 2018.05.x if any more releases are planned from that branch.

Thanks,
Thomas
