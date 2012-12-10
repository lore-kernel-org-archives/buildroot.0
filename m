From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Dec 2012 12:10:28 +0100
Subject: [Buildroot] [git commit] dnsmasq: fix build failure without DHCP
Message-ID: <20121210112009.4EE9F9A187@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24d9771337d88dae6298db12dd3fb284282c684b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/26a9e152f533e467f68b72a373d0fc84d561eb87

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../dnsmasq/dnsmasq-fix-parse-server-no-dhcp.patch |   37 ++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/dnsmasq/dnsmasq-fix-parse-server-no-dhcp.patch b/package/dnsmasq/dnsmasq-fix-parse-server-no-dhcp.patch
new file mode 100644
index 0000000..817d3b2
--- /dev/null
+++ b/package/dnsmasq/dnsmasq-fix-parse-server-no-dhcp.patch
@@ -0,0 +1,37 @@
+From acd702292afebb8550acbfbe80638995545ccd10 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Mon, 10 Dec 2012 07:47:10 -0300
+Subject: [PATCH] Move parse_server outside the HAVE_DHCP ifdef
+
+Fixes build breakage when building without DHCP support.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ src/option.c |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/src/option.c b/src/option.c
+index c1643a1..d6e323b 100644
+--- a/src/option.c
++++ b/src/option.c
+@@ -641,6 +641,8 @@ static char *set_prefix(char *arg)
+    return arg;
+ }
+ 
++#endif
++
+ char *parse_server(char *arg, union mysockaddr *addr, union mysockaddr *source_addr, char *interface, int *flags)
+ {
+   int source_port = 0, serv_port = NAMESERVER_PORT;
+@@ -728,6 +730,8 @@ char *parse_server(char *arg, union mysockaddr *addr, union mysockaddr *source_a
+   return NULL;
+ }
+ 
++#ifdef HAVE_DHCP
++
+ /* This is too insanely large to keep in-line in the switch */
+ static int parse_dhcp_opt(char *errstr, char *arg, int flags)
+ {
+-- 
+1.7.8.6
+
