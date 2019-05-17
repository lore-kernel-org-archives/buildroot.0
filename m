From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 May 2019 10:52:51 +0200
Subject: [Buildroot] [git commit branch/next] package/ifmetric: new package
Message-ID: <20190517084734.947758B568@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95ffee69cd22eb8c1fcb02707869b2d996a449e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add an upstream post-0.3 patch to fix netlink issues with modern kernels.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...ETLINK-Packet-too-small-or-truncated-92-1.patch | 29 ++++++++++++++++++++++
 package/ifmetric/Config.in                         | 10 ++++++++
 package/ifmetric/ifmetric.hash                     |  4 +++
 package/ifmetric/ifmetric.mk                       | 14 +++++++++++
 6 files changed, 59 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b1c82dc304..f1bed77fe9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1746,6 +1746,7 @@ F:	package/docker-compose/
 F:	package/dump1090/
 F:	package/flickcurl/
 F:	package/fscryptctl/
+F:	package/ifmetric/
 F:	package/jo/
 F:	package/jose/
 F:	package/libfastjson/
diff --git a/package/Config.in b/package/Config.in
index f592e74a99..3df091b608 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1903,6 +1903,7 @@ menu "Networking applications"
 	source "package/ibrdtn-tools/Config.in"
 	source "package/ibrdtnd/Config.in"
 	source "package/ifenslave/Config.in"
+	source "package/ifmetric/Config.in"
 	source "package/ifplugd/Config.in"
 	source "package/iftop/Config.in"
 	source "package/ifupdown/Config.in"
diff --git a/package/ifmetric/0001-Fix-issue-NETLINK-Packet-too-small-or-truncated-92-1.patch b/package/ifmetric/0001-Fix-issue-NETLINK-Packet-too-small-or-truncated-92-1.patch
new file mode 100644
index 0000000000..8986b4fc31
--- /dev/null
+++ b/package/ifmetric/0001-Fix-issue-NETLINK-Packet-too-small-or-truncated-92-1.patch
@@ -0,0 +1,29 @@
+From 0c80f9ead3eb1d938b3e8e68165c91e62db72de3 Mon Sep 17 00:00:00 2001
+From: Damjan Georgievski <gdamjan@gmail.com>
+Date: Wed, 15 Aug 2012 00:54:38 +0200
+Subject: [PATCH] Fix issue: NETLINK: Packet too small or truncated!
+ 92!=16!=244
+
+As reported in http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=514197#22
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/nlrequest.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/nlrequest.c b/src/nlrequest.c
+index 99fd3d0..3a1f794 100644
+--- a/src/nlrequest.c
++++ b/src/nlrequest.c
+@@ -44,7 +44,7 @@ int netlink_request(int s, struct nlmsghdr *n, int (*callback) (struct nlmsghdr
+ 
+     for (;;) {
+         int bytes;
+-        char replybuf[2048];
++        char replybuf[4096];
+         struct nlmsghdr *p = (struct nlmsghdr *) replybuf;
+         
+         if ((bytes = recv(s, &replybuf, sizeof(replybuf), 0)) < 0) {
+-- 
+2.11.0
+
diff --git a/package/ifmetric/Config.in b/package/ifmetric/Config.in
new file mode 100644
index 0000000000..64c8ace84b
--- /dev/null
+++ b/package/ifmetric/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_IFMETRIC
+	bool "ifmetric"
+	help
+	  Ifmetric is a Linux tool for setting the metrics of all IPv4
+	  routes attached to a given network interface@once. This
+	  may be used to change the priority of routing IPv4 traffic
+	  over the interface. Lower metrics correlate with higher
+	  priorities.
+
+	  http://0pointer.de/lennart/projects/ifmetric/
diff --git a/package/ifmetric/ifmetric.hash b/package/ifmetric/ifmetric.hash
new file mode 100644
index 0000000000..186522efab
--- /dev/null
+++ b/package/ifmetric/ifmetric.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256	0fa8510a4e34e555f136f9df81d26618313f2d69a4880c0fb5967f19502f1aec  ifmetric-0.3.tar.gz
+sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  LICENSE
+sha256	1e33d5a8750b4b3c2cb4fb89a916463f3c838f8eb361abbf72faf244c7dde771  README
diff --git a/package/ifmetric/ifmetric.mk b/package/ifmetric/ifmetric.mk
new file mode 100644
index 0000000000..29a6cbcdd6
--- /dev/null
+++ b/package/ifmetric/ifmetric.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# ifmetric
+#
+################################################################################
+
+IFMETRIC_VERSION = 0.3
+IFMETRIC_SITE = http://0pointer.de/lennart/projects/ifmetric
+IFMETRIC_LICENSE = GPL-2.0+
+IFMETRIC_LICENSE_FILES = LICENSE README
+# do not generate documentation
+IFMETRIC_CONF_OPTS = --disable-lynx --disable-xmltoman
+
+$(eval $(autotools-package))
