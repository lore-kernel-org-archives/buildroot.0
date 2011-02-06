From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Feb 2011 21:48:53 +0100
Subject: [Buildroot] [git commit master 1/1] busybox: 1.18.2 fixes for ping,
	tar and udhcp
Message-ID: <20110206204913.3A6598F3DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9f31e2ffa005095206824e08f69da75503e998ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.18.2/busybox-1.18.2-ping.patch       |   11 +++++++++++
 .../busybox-1.18.2/busybox-1.18.2-tar.patch        |   15 +++++++++++++++
 .../busybox-1.18.2/busybox-1.18.2-udhcp.patch      |   11 +++++++++++
 3 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.18.2/busybox-1.18.2-ping.patch
 create mode 100644 package/busybox/busybox-1.18.2/busybox-1.18.2-tar.patch
 create mode 100644 package/busybox/busybox-1.18.2/busybox-1.18.2-udhcp.patch

diff --git a/package/busybox/busybox-1.18.2/busybox-1.18.2-ping.patch b/package/busybox/busybox-1.18.2/busybox-1.18.2-ping.patch
new file mode 100644
index 0000000..34262d6
--- /dev/null
+++ b/package/busybox/busybox-1.18.2/busybox-1.18.2-ping.patch
@@ -0,0 +1,11 @@
+--- busybox-1.18.2/networking/ping.c
++++ busybox-1.18.2-ping/networking/ping.c
+@@ -394,7 +394,7 @@ static void sendping4(int junk UNUSED_PA
+ #if ENABLE_PING6
+ static void sendping6(int junk UNUSED_PARAM)
+ {
+-	struct icmp6_hdr *pkt = alloca(datalen + sizeof(struct icmp6_hdr) + 4);
++	struct icmp6_hdr *pkt = G.snd_packet;
+ 
+ 	//memset(pkt, 0, datalen + sizeof(struct icmp6_hdr) + 4);
+ 	pkt->icmp6_type = ICMP6_ECHO_REQUEST;
diff --git a/package/busybox/busybox-1.18.2/busybox-1.18.2-tar.patch b/package/busybox/busybox-1.18.2/busybox-1.18.2-tar.patch
new file mode 100644
index 0000000..5d5f721
--- /dev/null
+++ b/package/busybox/busybox-1.18.2/busybox-1.18.2-tar.patch
@@ -0,0 +1,15 @@
+--- busybox-1.18.2/archival/tar.c
++++ busybox-1.18.2-tar/archival/tar.c
+@@ -1037,8 +1037,10 @@ int tar_main(int argc UNUSED_PARAM, char
+ 			tar_handle->src_fd = tar_fd;
+ 			tar_handle->seek = seek_by_read;
+ 		} else {
+-			if (ENABLE_FEATURE_TAR_AUTODETECT && flags == O_RDONLY) {
+-				get_header_ptr = get_header_tar;
++			if (ENABLE_FEATURE_TAR_AUTODETECT
++			 && flags == O_RDONLY
++			 && get_header_ptr == get_header_tar
++			) {
+ 				tar_handle->src_fd = open_zipped(tar_filename);
+ 				if (tar_handle->src_fd < 0)
+ 					bb_perror_msg_and_die("can't open '%s'", tar_filename);
diff --git a/package/busybox/busybox-1.18.2/busybox-1.18.2-udhcp.patch b/package/busybox/busybox-1.18.2/busybox-1.18.2-udhcp.patch
new file mode 100644
index 0000000..bed4f4d
--- /dev/null
+++ b/package/busybox/busybox-1.18.2/busybox-1.18.2-udhcp.patch
@@ -0,0 +1,11 @@
+--- busybox-1.18.2/networking/udhcp/common.c
++++ busybox-1.18.2-udhcp/networking/udhcp/common.c
+@@ -375,7 +375,7 @@ static NOINLINE void attach_option(
+ 		new->data = xmalloc(length + OPT_DATA);
+ 		new->data[OPT_CODE] = optflag->code;
+ 		new->data[OPT_LEN] = length;
+-		memcpy(new->data + OPT_DATA, buffer, length);
++		memcpy(new->data + OPT_DATA, (allocated ? allocated : buffer), length);
+ 
+ 		curr = opt_list;
+ 		while (*curr && (*curr)->data[OPT_CODE] < optflag->code)
-- 
1.7.3.4
