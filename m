From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Date: Thu,  9 May 2019 00:09:33 +0200
Subject: [Buildroot] [PATCH 09/13] package/openrc: add patch to support
 busybox version of sysctl
In-Reply-To: <20190508220937.23200-1-michal.lyszczek@bofc.pl>
References: <20190508220937.23200-1-michal.lyszczek@bofc.pl>
Message-ID: <20190508220937.23200-9-michal.lyszczek@bofc.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Busybox version of sysctl does not support --system argument, and
files need to be loaded one by one. This patch adds code to sysctl
service in openrc to recognize busybox sysctl and execute proper
function based on that.

Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
---
 ...tl.in-add-support-for-busybox-sysctl.patch | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 package/openrc/0001-init.d-sysctl.in-add-support-for-busybox-sysctl.patch

diff --git a/package/openrc/0001-init.d-sysctl.in-add-support-for-busybox-sysctl.patch b/package/openrc/0001-init.d-sysctl.in-add-support-for-busybox-sysctl.patch
new file mode 100644
index 0000000000..da8cf042c6
--- /dev/null
+++ b/package/openrc/0001-init.d-sysctl.in-add-support-for-busybox-sysctl.patch
@@ -0,0 +1,66 @@
+From ec1a0c8fa2e7a7c6cf70f68bdabc07cbb1a567cf Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
+Date: Sun, 5 May 2019 23:43:40 +0200
+Subject: [PATCH] init.d/sysctl.in: add support for busybox sysctl
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Busybox version of sysctl does not support --system argument,
+and files need to be loaded one by one. This patch adds code
+to recognize busybox sysctl and execute proper function based
+on that.
+
+Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
+---
+ init.d/sysctl.in | 27 ++++++++++++++++++++++++++-
+ 1 file changed, 26 insertions(+), 1 deletion(-)
+
+diff --git a/init.d/sysctl.in b/init.d/sysctl.in
+index e49f4db2..a705b3d4 100644
+--- a/init.d/sysctl.in
++++ b/init.d/sysctl.in
+@@ -37,6 +37,23 @@ BSD_sysctl()
+ 	return $retval
+ }
+ 
++Busybox_sysctl()
++{
++	local quiet
++	yesno $rc_verbose || quiet=-q
++
++	eindent
++	for conf in /etc/sysctl.conf /etc/sysctl.d/*.conf; do
++		if [ -r "$conf" ]; then
++			vebegin "applying $conf"
++			sysctl $quiet -p "$conf" || retval=1
++			veend $retval
++		fi
++	done
++	eoutdent
++	return $retval
++}
++
+ Linux_sysctl()
+ {
+ 	local quiet
+@@ -52,7 +69,15 @@ start()
+ 	ebegin "Configuring kernel parameters"
+ 	case "$RC_UNAME" in
+ 	*BSD|GNU) BSD_sysctl; rc=$? ;;
+-	Linux) Linux_sysctl; rc=$? ;;
++	Linux)
++		sysctl -h > /dev/null 2>&1
++		if [ $? -ne 0 ]; then
++			# busybox version of sysctl does not recognize -h option
++			Busybox_sysctl
++		else
++			Linux_sysctl
++		fi
++		rc=$? ;;
+ 	esac
+ 	eend $rc "Unable to configure some kernel parameters"
+ }
+-- 
+2.18.1
+
-- 
2.18.1
