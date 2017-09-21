From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 17:02:40 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/apache: add patch
	to fix CVE-2017-9798
Message-ID: <20170921151042.3CA1F8102A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43f910fc7d11b09044d2870bc2096f82ff22f997
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 6d24caf0cd97de39aa1d6f52b58db8c0d63a89ee)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/0003-CVS-2017-9798.patch | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/apache/0003-CVS-2017-9798.patch b/package/apache/0003-CVS-2017-9798.patch
new file mode 100644
index 0000000..dc0a67a
--- /dev/null
+++ b/package/apache/0003-CVS-2017-9798.patch
@@ -0,0 +1,30 @@
+core: Disallow Methods' registration at run time (.htaccess), they may
+be used only if registered at init time (httpd.conf).
+
+Calling ap_method_register() in children processes is not the right scope
+since it won't be shared for all requests.
+
+git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/trunk at 1807655 13f79535-47bb-0310-9956-ffa450edef68
+
+Fixes CVE-2017-9798: https://nvd.nist.gov/vuln/detail/CVE-2017-9798
+
+Downloaded from upstream repo:
+https://svn.apache.org/viewvc/httpd/httpd/branches/2.4.x/server/core.c?r1=1805223&r2=1807754&pathrev=1807754&view=patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- a/server/core.c	2017/08/16 16:50:29	1805223
++++ b/server/core.c	2017/09/08 13:13:11	1807754
+@@ -2266,6 +2266,12 @@
+             /* method has not been registered yet, but resource restriction
+              * is always checked before method handling, so register it.
+              */
++            if (cmd->pool == cmd->temp_pool) {
++                /* In .htaccess, we can't globally register new methods. */
++                return apr_psprintf(cmd->pool, "Could not register method '%s' "
++                                   "for %s from .htaccess configuration",
++                                    method, cmd->cmd->name);
++            }
+             methnum = ap_method_register(cmd->pool,
+                                          apr_pstrdup(cmd->pool, method));
+         }
