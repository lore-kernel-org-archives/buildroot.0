From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  2 Mar 2018 07:22:36 +0200
Subject: [Buildroot] [PATCH master] dash: fix static link with libedit
Message-ID: <d4eb7198beaca0f2f6322f926c736e1147f5cf53.1519968156.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/dash/dash.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 87c9cc9f8b87..2ee292b8d3e7 100644
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
-- 
2.16.1
