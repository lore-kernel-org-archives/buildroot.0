From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Mar 2018 07:59:27 +0100
Subject: [Buildroot] [git commit] dash: fix static link with libedit
Message-ID: <20180302073757.26EFF802D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3f24ac341d07f62f51d9951acdb7eac896d57a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libedit is an optional dependency of dash since commit 651af57cf011e
(dash: enable line editting if libedit is selected). Unfortunately, the
dash build system does not take into account the ncurses dependency of
libedit. Use pkgconf to get that right.

Fixes:
http://autobuild.buildroot.net/results/801/801e8bc06277978556a301ddf54f609169de37bb/
http://autobuild.buildroot.net/results/123/12367267735b9165afef77289460c247aaad494a/
http://autobuild.buildroot.net/results/aa7/aa7cc7315d778c15c5165ca6423257a84b957482/

Cc: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dash/dash.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 87c9cc9f8b..2ee292b8d3 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -10,8 +10,9 @@ DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBEDIT),y)
-DASH_DEPENDENCIES += libedit
+DASH_DEPENDENCIES += libedit host-pkgconf
 DASH_CONF_OPTS += --with-libedit
+DASH_CONF_ENV += LIBS=`pkg-config --libs libedit`
 
 # Enable line editing, Emacs style
 define DASH_INSTALL_PROFILE
