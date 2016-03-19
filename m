From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 19 Mar 2016 23:12:30 +0300
Subject: [Buildroot] [PATCH] lttng-babeltrace: fix build with standalone
	gettext
Message-ID: <1458418350-13924-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lttng-babeltrace can't detect that uuid_generate is provided by -luuid
because the configure test fails with the following message:
  libuuid.a(libuuid_la-randutils.o): In function `random_get_bytes':
  randutils.c:(.text+0x204): undefined reference to `libintl_gettext'

Add LIBS=-lintl to configure options in case we're building with
standalone gettext.
Fixes:
  http://autobuild.buildroot.net/results/1ab89c6e8d704bc28c9ff8b5ffda3f60e57a25b4/

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/lttng-babeltrace/lttng-babeltrace.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index 5de77fb..cf57843 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -12,5 +12,9 @@ LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
 
 LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2
 
+ifeq ($(BR2_NEEDS_GETTEXT),y)
+LTTNG_BABELTRACE_CONF_OPTS += LIBS=-lintl
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.1.4
