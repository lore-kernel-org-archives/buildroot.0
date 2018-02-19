From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Feb 2018 19:00:49 +0100
Subject: [Buildroot] [git commit] jq: compile as _GNU_SOURCE to fix segfault
 when compiled with gcc 6
Message-ID: <20180219180305.AF7C67F96A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21114013e83a67fd6b84e1d911ee503be3f0e35d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When compiling host-jq with gcc 6+, running it gives an immediate segfault.
Reported upstream: https://github.com/stedolan/jq/issues/1598

The issue can be solved by compiling with _GNU_SOURCE as extra preprocessor
define. Once the issue is solved upstream, this change can be reverted.

As the issue will normally be the same for target, apply the same fix there.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
