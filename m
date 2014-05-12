From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 12 May 2014 07:27:06 +0400
Subject: [Buildroot] [PATCH 4/4] sysstat: fix passing CFLAGS to make
In-Reply-To: <1399865226-7054-1-git-send-email-jcmvbkbc@gmail.com>
References: <1399865226-7054-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1399865226-7054-5-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SYSSTAT_MAKE_OPT is a string used to pass options to make, '+=' operator
doesn't have any special meaning inside it, so CFLAGS+=... is passed to
shell, overwriting previous CFLAGS value.

Replace CFLAGS+="..." with CFLAGS="$(TARGET_CFLAGS) ...".

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
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
-- 
1.7.7.6
