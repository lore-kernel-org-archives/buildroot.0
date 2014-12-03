From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  3 Dec 2014 22:41:33 +0100
Subject: [Buildroot] [PATCH 6/8] ncurses: speed up host build by disabling
	static library building
In-Reply-To: <1417642895-29606-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417642895-29606-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417642895-29606-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For the host variant of packages, we normally only build the shared
libraries. However, ncurses uses non-standard options to select
between shared/static and therefore the host variant was building both
of them, even though the static libraries were unused.

By passing --without-normal, we disable the build of static
libraries. It saves a bit of disk space, and on my laptop,
host-ncurses takes 26 seconds to build instead of 40 seconds.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ncurses/ncurses.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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
-- 
2.1.0
