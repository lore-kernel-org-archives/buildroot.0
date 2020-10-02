From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2020 10:04:43 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/socketcand: fix
 build with gcc 10
Message-ID: <20201002082506.C5DC081429@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=211b6a4b99f260155864ba04d7ece8d8ee012cdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Also update socketcand.hash as the patch is updating socketcand.c

Fixes:
 - http://autobuild.buildroot.org/results/a72f3e34c161a012e8091db331d02bbf2da6ad94

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 460bfb9e052b8053fdcddcf79982a1d804d0a4e4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../socketcand/0001-Fix-GCC10-build-failure.patch  | 113 +++++++++++++++++++++
 package/socketcand/socketcand.hash                 |   2 +-
 2 files changed, 114 insertions(+), 1 deletion(-)

diff --git a/package/socketcand/0001-Fix-GCC10-build-failure.patch b/package/socketcand/0001-Fix-GCC10-build-failure.patch
new file mode 100644
index 0000000000..057cd40657
--- /dev/null
+++ b/package/socketcand/0001-Fix-GCC10-build-failure.patch
@@ -0,0 +1,113 @@
+From ae0af080058a576d62c72ffc011d644d0b4dcb98 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Tue, 7 Jul 2020 19:39:41 +0200
+Subject: [PATCH] Fix GCC10 build failure (#17)
+
+GCC10 breaks on multiple definitions:
+
+ld: /tmp/ccFiGYO7.o:(.bss+0x114): multiple definition of `tv'; /tmp/cc7f6J5h.o:(.bss+0x80): first defined here
+
+Change the scope of the related variables.
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+
+[Retrieved from:
+https://github.com/linux-can/socketcand/commit/ae0af080058a576d62c72ffc011d644d0b4dcb98]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ socketcand.c  | 3 ++-
+ state_bcm.c   | 4 ++--
+ state_isotp.c | 2 +-
+ state_raw.c   | 2 +-
+ 4 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/socketcand.c b/socketcand.c
+index 8d84754..6125be9 100644
+--- a/socketcand.c
++++ b/socketcand.c
+@@ -102,7 +102,6 @@ socklen_t unaddrlen;
+ struct sockaddr_un remote_unaddr;
+ socklen_t remote_unaddrlen;
+ char* interface_string;
+-struct ifreq ifr, ifr_brd;
+ 
+ int state_changed(char *buf, int current_state)
+ {
+@@ -666,6 +665,8 @@ int receive_command(int socket, char *buffer) {
+ }
+ 
+ void determine_adress() {
++	struct ifreq ifr, ifr_brd;
++
+ 	int probe_socket = socket(AF_INET, SOCK_DGRAM, 0);
+ 
+ 	if(probe_socket < 0) {
+diff --git a/state_bcm.c b/state_bcm.c
+index cfaa8ed..05a5f7c 100644
+--- a/state_bcm.c
++++ b/state_bcm.c
+@@ -28,8 +28,6 @@
+ #define RXLEN 128
+ 
+ int sc = -1;
+-fd_set readfds;
+-struct timeval tv;
+ 
+ void state_bcm() {
+ 	int i, j, ret;
+@@ -38,6 +36,7 @@ void state_bcm() {
+ 	struct ifreq ifr;
+ 	char rxmsg[RXLEN];
+ 	char buf[MAXLEN];
++	fd_set readfds;
+ 
+ 	struct {
+ 		struct bcm_msg_head msg_head;
+@@ -91,6 +90,7 @@ void state_bcm() {
+ 	}
+ 
+ 	if (FD_ISSET(sc, &readfds)) {
++		struct timeval tv;
+ 
+ 		ret = recvfrom(sc, &msg, sizeof(msg), 0,
+ 			       (struct sockaddr*)&caddr, &caddrlen);
+diff --git a/state_isotp.c b/state_isotp.c
+index 5c671f9..e1b944b 100644
+--- a/state_isotp.c
++++ b/state_isotp.c
+@@ -25,7 +25,6 @@
+ #include <linux/sockios.h>
+ 
+ int si = -1;
+-fd_set readfds;
+ 
+ void state_isotp() {
+ 	int i, items, ret;
+@@ -39,6 +38,7 @@ void state_isotp() {
+ 	char buf[MAXLEN]; /* inet commands to can */
+ 	unsigned char isobuf[ISOTPLEN+1]; /* binary buffer for isotp socket */
+ 	unsigned char tmp;
++	fd_set readfds;
+ 	
+ 	while(previous_state != STATE_ISOTP) {
+ 
+diff --git a/state_raw.c b/state_raw.c
+index e83e6ec..2c49975 100644
+--- a/state_raw.c
++++ b/state_raw.c
+@@ -25,7 +25,6 @@
+ int raw_socket;
+ struct ifreq ifr;
+ struct sockaddr_can addr;
+-fd_set readfds;
+ struct msghdr msg;
+ struct can_frame frame;
+ struct iovec iov;
+@@ -36,6 +35,7 @@ struct cmsghdr *cmsg;
+ void state_raw() {
+ 	char buf[MAXLEN];
+ 	int i, ret, items;
++	fd_set readfds;
+ 
+ 	if(previous_state != STATE_RAW) {
+ 
diff --git a/package/socketcand/socketcand.hash b/package/socketcand/socketcand.hash
index 6ee0c314a8..713939897d 100644
--- a/package/socketcand/socketcand.hash
+++ b/package/socketcand/socketcand.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256  3c5cc7af4ff707ac344e62d2e37a74b59aeccd14b88e837cc142c52b69d64a39  socketcand-69e2201222f015a1abe7a58ecf61325012cd91b1.tar.gz
-sha256  b32028a4080be38208ee951c6e8afc6f3bfb3d5496559b260ab0dce9472740f6  socketcand.c
+sha256  18bda0db4e3c56cefdb1b9b01b7eada7764c0746f6321378c30d78f5ee81cfee  socketcand.c
