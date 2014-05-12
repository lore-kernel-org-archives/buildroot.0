From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 May 2014 22:49:42 +0200
Subject: [Buildroot] [git commit] sysstat: fix passing CFLAGS to make
Message-ID: <20140512205829.851459CBAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bb7271b9fe7e4fc3611e9ae0f3cf3171149a8ec0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SYSSTAT_MAKE_OPT is a string used to pass options to make, '+=' operator
doesn't have any special meaning inside it, so CFLAGS+=... is passed to
shell, overwriting previous CFLAGS value.

Replace CFLAGS+="..." with CFLAGS="$(TARGET_CFLAGS) ...".

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysstat/sysstat.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index d3d7519..23486b6 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -14,7 +14,7 @@ SYSSTAT_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 SYSSTAT_DEPENDENCIES += gettext
-SYSSTAT_MAKE_OPT += CFLAGS+=-lintl
+SYSSTAT_MAKE_OPT += CFLAGS="$(TARGET_CFLAGS) -lintl"
 endif
 
 # The isag tool is a post processing script that depends on tcl/tk
