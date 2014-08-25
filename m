From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Aug 2014 19:55:20 +0200
Subject: [Buildroot] [git commit] package/procps-ng: fix linking with intl
Message-ID: <20140825175526.B7A649D537@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47128a9b822657d6f9d8c4772ccf21a3e21343d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

procps-ng doesn't build with (e)glibc toolchain when gettext package is
selected.

With (e)glibc libintl is provided by the libc whereas with uClibc it's provided
by gettext.

Linking with intl is only needed if the toolchain needs gettext and locale is
set.

Fixes:
http://autobuild.buildroot.net/results/3e8/3e8464e0b00ce22fa02a6337159fca250d86425c/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/procps-ng/procps-ng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
