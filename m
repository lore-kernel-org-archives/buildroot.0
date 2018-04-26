From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 26 Apr 2018 21:08:45 +0200
Subject: [Buildroot] [PATCH] package/ncurses: enable widechar for host build
In-Reply-To: <cb69fcf8-5af1-eafd-5fbb-bb0339831877@mind.be>
References: <cb69fcf8-5af1-eafd-5fbb-bb0339831877@mind.be>
Message-ID: <20180426190845.21415-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kconfig uses pkg-config to find the ncurses or ncursesw library. If the
ncursesw package is found with pkg-config, it will #include <ncursesw.h>.
Since Buildroot's host-ncurses doesn't install a .pc file, and linux.mk
anyway doesn't pass the pkg-config options to find the host pkg-config
files, Kconfig will always find the system's ncursesw.h.

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
safely assume that the system doesn't have a non-widechare uClibc
library...).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: David De Grave <david.degrave@essensium.com>
---
 package/ncurses/ncurses.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 90cf4a4dc5..9942d3f0bd 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -153,6 +153,7 @@ HOST_NCURSES_CONF_OPTS = \
 	--without-cxx \
 	--without-cxx-binding \
 	--without-ada \
+	--enable-widec \
 	--without-normal
 
 $(eval $(autotools-package))
-- 
2.17.0
