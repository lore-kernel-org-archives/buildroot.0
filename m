From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 23:38:31 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] ncurses: make
 host-ncurses use host terminfo
Message-ID: <20180719214007.9A88A8909A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00e775b76cfb1b5c0704b136ffd8c4bfb70ca769
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Host GDB suffers a serious problem: pressing backspace (or ^W ^U or any other
"delete" key) results in a plain space being printed instead, making the
command prompt almost completely unusable.

That's because it's using host-ncurses, which embeds a path for the terminfo
database into the library itself. That path ends up being something like
/home/hollisb/buildroot.git/output/host/share/terminfo, which obviously doesn't
generally exist other hosts. ('relocate-sdk.sh' cannot and does not edit
binaries like libncurses.so.6, so doesn't resolve this problem.)

/usr/share/terminfo is a far better path to use, since it almost certainly
exists on the host. Theoretically, it could be from a different ncurses version
with incompatible terminfo database format, but this doesn't seem to be a
problem in practice. (Future patches could address the theoretical problem if
it actually appears in real life.)

This change allows buildroot's host gdb, which uses ncurses 6.x, to work on
RHEL5, RHEL6, and RHEL7, which all provide terminfo from ncurses 5.x.

Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b35ad5d0b45e5288f4019aeaa06b87ef0f2ef016)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncurses/ncurses.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index e63b6e4aed..8d0eb1e086 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -151,6 +151,7 @@ HOST_NCURSES_CONF_OPTS = \
 	--without-cxx \
 	--without-cxx-binding \
 	--without-ada \
+	--with-default-terminfo-dir=/usr/share/terminfo \
 	--without-normal
 
 $(eval $(autotools-package))
