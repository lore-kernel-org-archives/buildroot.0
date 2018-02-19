From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Mon, 19 Feb 2018 16:57:34 +0100
Subject: [Buildroot] [PATCH master 1/1] jq: compile as _GNU_SOURCE to fix
 segfault after compilation with gcc 6
Message-ID: <20180219155734.31427-1-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When compiling host-jq with gcc 6+, running it gives an immediate segfault.
Reported upstream: https://github.com/stedolan/jq/issues/1598

The issue can be solved by compiling with _GNU_SOURCE as extra preprocessor
define. Once the issue is solved upstream, this change can be reverted.

As the issue will normally be the same for target, apply the same fix there.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/jq/jq.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index aecdba2280..79629faa5e 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -11,8 +11,10 @@ JQ_LICENSE_FILES = COPYING
 JQ_INSTALL_STAGING = YES
 
 # uses c99 specific features
-JQ_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
-HOST_JQ_CONF_ENV += CFLAGS="$(HOST_CFLAGS) -std=c99"
+# _GNU_SOURCE added to fix gcc6+ host compilation
+# (https://github.com/stedolan/jq/issues/1598)
+JQ_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99 -D_GNU_SOURCE"
+HOST_JQ_CONF_ENV += CFLAGS="$(HOST_CFLAGS) -std=c99 -D_GNU_SOURCE"
 
 # jq explicitly enables maintainer mode, which we don't need/want
 JQ_CONF_OPTS += --disable-maintainer-mode
-- 
2.13.6
