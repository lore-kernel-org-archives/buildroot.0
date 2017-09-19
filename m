From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 19 Sep 2017 20:54:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/apache: add patch to fix
	CVE-2017-9798
Message-ID: <20170919185434.25976-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apache/0003-CVS-2017-9798.patch | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/apache/0003-CVS-2017-9798.patch

diff --git a/package/apache/0003-CVS-2017-9798.patch b/package/apache/0003-CVS-2017-9798.patch
new file mode 100644
index 0000000000..dc0a67a1b7
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
-- 
2.11.0
