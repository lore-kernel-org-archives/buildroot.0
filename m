From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 22:12:10 +0200
Subject: [Buildroot] [PATCH] ncurses: disable terminfo database install
 for host-ncurses
In-Reply-To: <20180809145722.388-1-peter@korsgaard.com>
References: <20180809145722.388-1-peter@korsgaard.com>
Message-ID: <20180809221210.1e145caf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Aug 2018 16:57:22 +0200, Peter Korsgaard wrote:
> Since commit b35ad5d0b45e (ncurses: make host-ncurses use host terminfo), we
> are now pointing host-ncurses to the host terminfo (typically) located in
> /usr/share/terminfo.
> 
> With this change we are reusing the existing host terminfo database, so
> there is no point in trying to install our own on top.  The user running
> buildroot typically will have no write access to /usr/share/terminfo, but
> tic in that case falls back to writing the database to $HOME/.terminfo.
> Neither of which are desirable.
> 
> In case $HOME/.terminfo also isn't writable, tic fails, breaking the install
> step for host-ncurses:
> 
> ** Building terminfo database, please wait...
> Running sh ./shlib tic to install /usr/share/terminfo ...
> 
>         You may see messages regarding extended capabilities, e.g., AX.
>         These are extended terminal capabilities which are compiled
>         using
>                 tic -x
>         If you have ncurses 4.2 applications, you should read the INSTALL
>         document, and install the terminfo without the -x option.
> 
> "terminfo.tmp", line 21272, terminal 'v3220': /home/peko/.terminfo: permission denied (errno 30)
> 
> To fix all of this, simply disable the terminfo database install.
> 
> Suggested-by: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/ncurses/ncurses.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
