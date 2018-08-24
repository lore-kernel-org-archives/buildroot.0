From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 09:34:51 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] ncurses: disable terminfo
 database install for host-ncurses
Message-ID: <20180824072708.3B0F78E56E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4272ba64e094cbdead386eafd9e24a3bfea12e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Since commit b35ad5d0b45e (ncurses: make host-ncurses use host terminfo), we
are now pointing host-ncurses to the host terminfo (typically) located in
/usr/share/terminfo.

With this change we are reusing the existing host terminfo database, so
there is no point in trying to install our own on top.  The user running
buildroot typically will have no write access to /usr/share/terminfo, but
tic in that case falls back to writing the database to $HOME/.terminfo.
Neither of which are desirable.

In case $HOME/.terminfo also isn't writable, tic fails, breaking the install
step for host-ncurses:

** Building terminfo database, please wait...
Running sh ./shlib tic to install /usr/share/terminfo ...

        You may see messages regarding extended capabilities, e.g., AX.
        These are extended terminal capabilities which are compiled
        using
                tic -x
        If you have ncurses 4.2 applications, you should read the INSTALL
        document, and install the terminfo without the -x option.

"terminfo.tmp", line 21272, terminal 'v3220': /home/peko/.terminfo: permission denied (errno 30)

To fix all of this, simply disable the terminfo database install.

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Hollis Blanchard <hollis_blanchard@mentor.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b42fb29048128a432a130c0652e086dfde641d75)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncurses/ncurses.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 5b36df564c..e27598bd42 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -154,6 +154,7 @@ HOST_NCURSES_CONF_OPTS = \
 	--without-cxx-binding \
 	--without-ada \
 	--with-default-terminfo-dir=/usr/share/terminfo \
+	--disable-db-install \
 	--without-normal
 
 $(eval $(autotools-package))
