From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Nov 2020 22:36:52 +0100
Subject: [Buildroot] [git commit] package/xinetd: add upstream security fix
 for CVE-2013-4342
Message-ID: <20201123213324.DEC327FA55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5abf5ff6188593dfc701decf8d33d38a924b45b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xinetd does not enforce the user and group configuration directives for
TCPMUX services, which causes these services to be run as root and makes it
easier for remote attackers to gain privileges by leveraging another
vulnerability in a service.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...42-xinetd-ignores-user-and-group-directiv.patch | 29 ++++++++++++++++++++++
 package/xinetd/xinetd.mk                           |  3 +++
 2 files changed, 32 insertions(+)

diff --git a/package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch b/package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch
new file mode 100644
index 0000000000..bb2ee1fc9a
--- /dev/null
+++ b/package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch
@@ -0,0 +1,29 @@
+From 91e2401a219121eae15244a6b25d2e79c1af5864 Mon Sep 17 00:00:00 2001
+From: Thomas Swan <thomas.swan@gmail.com>
+Date: Wed, 2 Oct 2013 23:17:17 -0500
+Subject: [PATCH] CVE-2013-4342: xinetd: ignores user and group directives for
+ TCPMUX services
+
+Originally reported to Debian in 2005 <http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=324678> and rediscovered <https://bugzilla.redhat.com/show_bug.cgi?id=1006100>, xinetd would execute TCPMUX services without dropping privilege to match the service configuration allowing the service to run with same privilege as the xinetd process (root).
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ xinetd/builtins.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xinetd/builtins.c b/xinetd/builtins.c
+index 3b85579..34a5bac 100644
+--- a/xinetd/builtins.c
++++ b/xinetd/builtins.c
+@@ -617,7 +617,7 @@ static void tcpmux_handler( const struct server *serp )
+    if( SC_IS_INTERNAL( scp ) ) {
+       SC_INTERNAL(scp, nserp);
+    } else {
+-      exec_server(nserp);
++      child_process(nserp);
+    }
+ }
+ 
+-- 
+2.20.1
+
diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
index a2ba10df74..6d6767766b 100644
--- a/package/xinetd/xinetd.mk
+++ b/package/xinetd/xinetd.mk
@@ -9,6 +9,9 @@ XINETD_SITE = $(call github,xinetd-org,xinetd,xinetd-$(XINETD_VERSION))
 XINETD_LICENSE = xinetd license
 XINETD_LICENSE_FILES = COPYRIGHT
 
+# 0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch
+XINETD_IGNORE_CVES += CVE-2013-4342
+
 XINETD_CFLAGS = $(TARGET_CFLAGS)
 
 # Three cases here:
