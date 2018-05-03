From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu,  3 May 2018 09:58:08 +0200
Subject: [Buildroot] [PATCH] package/ncurses: enable widechar for host build
In-Reply-To: <20180426190845.21415-1-arnout@mind.be>
References: <20180426190845.21415-1-arnout@mind.be>
Message-ID: <20180503075808.26367-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kconfig uses either pkg-config or hard-coded /usr/include paths to find
the ncurses or ncursesw library. If ncursesw is found, it will include
<ncursesw.h>. Since Buildroot's host-ncurses doesn't install a .pc file,
and linux.mk anyway doesn't pass the pkg-config options to find the host
pkg-config files, Kconfig will always find the system's ncursesw.h.

However, since commit dde090c299 (linux: fix passing of host CFLAGS and
LDFLAGS) HOST_LDFLAGS is passed to the linux build system. Thus, if
host-ncurses was already built before 'make linux-menuconfig' is called,
the build will pick up libncurses from the host directory, which is NOT
widechar. Thus, two different ncurses configurations are mixed into the
final mconf program. This will result in serious breakage in the
rendering of the menus (lots of @ and question mark characters).

As a workaround, just build host-ncurses with widechar support. That
makes it compatible with ncursesw.h picked up from the host. Clearly,
this is not a robust solution. But it's simple, it works, and it
shouldn't hurt to build host-ncurses with widechar support (we can
safely assume that the system doesn't have a non-widechar uClibc
library...).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: David De Grave <david.degrave@essensium.com>
Cc: Scott Fan <fancp2007@gmail.com>
---
v2:
 - fix typo in commit message;
 - extend commit message;
 - keep alphabetic ordering of configure options (Scott)

Note: I haven't tested what happens on a system which doesn't have
ncursesw.h. But I guess such a system is so exotic that it's not
worthwhile to do something special for it.
---
 package/ncurses/ncurses.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 90cf4a4dc5..f9cd0d3fbd 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -147,6 +147,7 @@ define HOST_NCURSES_BUILD_CMDS
 endef
 
 HOST_NCURSES_CONF_OPTS = \
+	--enable-widec \
 	--with-shared \
 	--without-gpm \
 	--without-manpages \
-- 
2.17.0
