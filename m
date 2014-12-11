From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 22:52:32 +0100
Subject: [Buildroot] [git commit] ncurses: speed up host build by disabling
	static library building
Message-ID: <20141211215300.C9BDE80193@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8639c79d8f8af4ac01176e64d69062ac4644561
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the host variant of packages, we normally only build the shared
libraries. However, ncurses uses non-standard options to select
between shared/static and therefore the host variant was building both
of them, even though the static libraries were unused.

By passing --without-normal, we disable the build of static
libraries. It saves a bit of disk space, and on my laptop,
host-ncurses takes 26 seconds to build instead of 40 seconds.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/ncurses/ncurses.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 1ce3818..645c25c 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -145,7 +145,8 @@ HOST_NCURSES_CONF_OPTS = \
 	--without-manpages \
 	--without-cxx \
 	--without-cxx-binding \
-	--without-ada
+	--without-ada \
+	--without-normal
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
