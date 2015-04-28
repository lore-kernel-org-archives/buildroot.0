From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Apr 2015 21:44:55 +0200
Subject: [Buildroot] [git commit] dhcpcd: fix ipv6 related compile failure
Message-ID: <20150428195516.5F3E9805A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b1f66643d782fc6f00e7436d41ceea6d88ad6bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add '-D_GNU_SOURCE' to gain missing struct in6_pktinfo definition.

Fixes [1]:

ipv6.h:211:41: error: invalid application of 'sizeof' to incomplete type 'struct in6_pktinfo'
  unsigned char sndbuf[CMSG_SPACE(sizeof(struct in6_pktinfo))];
                                         ^
ipv6.h:195:38: error: invalid application of 'sizeof' to incomplete type 'struct in6_pktinfo'
 #define IP6BUFLEN (CMSG_SPACE(sizeof(struct in6_pktinfo)) + \
                                      ^
ipv6.h:214:23: note: in expansion of macro 'IP6BUFLEN'
  unsigned char rcvbuf[IP6BUFLEN];

[1] http://autobuild.buildroot.net/results/523/523858fb930e74fe28f24989ff0697693b5fdd67

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcpcd/dhcpcd.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 4056351..756a660 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -20,8 +20,8 @@ endif
 
 define DHCPCD_CONFIGURE_CMDS
 	(cd $(@D); \
-	$(TARGET_CONFIGURE_OPTS) ./configure \
-		--os=linux \
+	$(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
+		./configure --os=linux \
 		$(DHCPCD_CONFIG_OPTS) )
 endef
 
