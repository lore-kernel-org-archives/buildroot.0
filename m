From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  2 Apr 2013 19:29:48 -0300
Subject: [Buildroot] [PATCH] dropbear: add vfork fix
Message-ID: <1364941788-15890-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Causes scp to fail badly.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dropbear/dropbear-fix-vfork-logic.patch | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 package/dropbear/dropbear-fix-vfork-logic.patch

diff --git a/package/dropbear/dropbear-fix-vfork-logic.patch b/package/dropbear/dropbear-fix-vfork-logic.patch
new file mode 100644
index 0000000..2706bc8
--- /dev/null
+++ b/package/dropbear/dropbear-fix-vfork-logic.patch
@@ -0,0 +1,21 @@
+
+# HG changeset patch
+# User Matt Johnston <matt@ucc.asn.au>
+# Date 1364743743 -28800
+# Node ID fedfb8ede1fdebad5d19df7bd4d452c3264d9545
+# Parent  f27058078d61a8c3a057530d3ddcd19bd5062569
+Fix incorrect logic for USE_VFORK and calling arg_setup()
+
+diff -r f27058078d61 -r fedfb8ede1fd scp.c
+--- a/scp.c	Sun Mar 31 23:15:35 2013 +0800
++++ b/scp.c	Sun Mar 31 23:29:03 2013 +0800
+@@ -230,7 +230,7 @@
+ 		close(pin[0]);
+ 		close(pout[1]);
+ 
+-#ifdef USE_VFORK
++#ifndef USE_VFORK
+ 		arg_setup(host, remuser, cmd);
+ #endif
+ 
+
-- 
1.8.1.5
