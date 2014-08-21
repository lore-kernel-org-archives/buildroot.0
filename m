From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 21 Aug 2014 15:56:07 +0200
Subject: [Buildroot] [PATCH 2/2] package/procps-ng: fix linking with intl
In-Reply-To: <1408629367-7336-1-git-send-email-romain.naour@openwide.fr>
References: <1408629367-7336-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1408629367-7336-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

procps-ng doesn't build with (e)glibc toolchain when gettext package is
selected.

With (e)glibc libintl is provided by the libc whereas with uClibc it's provided
by gettext.

Linking with intl is only needed if the toolchain needs gettext and locale is
set.

Fixes:
http://autobuild.buildroot.net/results/3e8/3e8464e0b00ce22fa02a6337159fca250d86425c/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/procps-ng/procps-ng.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 7628c21..8f9caf3 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -12,7 +12,7 @@ PROCPS_NG_LICENSE_FILES = COPYING COPYING.LIB
 
 PROCPS_NG_DEPENDENCIES = ncurses
 
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 PROCPS_NG_DEPENDENCIES += gettext
 PROCPS_NG_CONF_OPT += LIBS=-lintl
 endif
-- 
1.9.3
