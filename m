From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Jan 2015 14:37:12 +0100
Subject: [Buildroot] [git commit] mrouted: bump to version 3.9.7
Message-ID: <20150102133731.660C07FE10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e2db1daacff21133e2c03967e4b65a67df746ce8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bcopy patch removed since code is upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mrouted/mrouted-bcopy.patch |   39 -----------------------------------
 package/mrouted/mrouted.mk          |   10 ++++++++-
 2 files changed, 9 insertions(+), 40 deletions(-)

diff --git a/package/mrouted/mrouted-bcopy.patch b/package/mrouted/mrouted-bcopy.patch
deleted file mode 100644
index 74af02d..0000000
--- a/package/mrouted/mrouted-bcopy.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 2d33110ee18fb59a1d6917d598fc1f4eb3c4cf83 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Mon, 7 May 2012 16:32:10 -0300
-Subject: [PATCH] Switch from bcopy to memmove
-
-The bcopy() function is marked as legacy per POSIX.1-2001 and removed by
-POSIX-1.2008 thus shouldn't be used.
-So switch over to memmove()
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- mtrace.c |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/mtrace.c b/mtrace.c
-index c982a67..64630bf 100644
---- a/mtrace.c
-+++ b/mtrace.c
-@@ -556,7 +556,7 @@ int send_recv(u_int32_t dst, int type, int code, int tries, struct resp_buf *sav
- 		save->rtime = ((tr.tv_sec + JAN_1970) << 16) +
- 		    (tr.tv_usec << 10) / 15625;
- 		save->len = len;
--		bcopy((char *)igmp, (char *)&save->igmp, ipdatalen);
-+		memmove((char *)&save->igmp, (char *)igmp, ipdatalen);
- 	    }
- 	    return recvlen;
- 	}
-@@ -646,7 +646,7 @@ void passive_mode(void)
- 	base.rtime = ((tr.tv_sec + JAN_1970) << 16) +
- 	    (tr.tv_usec << 10) / 15625;
- 	base.len = len;
--	bcopy((char *)igmp, (char *)&base.igmp, ipdatalen);
-+	memmove((char *)&base.igmp, (char *)igmp, ipdatalen);
- 	/*
- 	 * If the user specified which traces to monitor,
- 	 * only accept traces that correspond to the
--- 
-1.7.3.4
-
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 78fe98a..01b4a9f 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -4,9 +4,17 @@
 #
 ################################################################################
 
-MROUTED_VERSION = 3.9.6
+MROUTED_VERSION = 3.9.7
 MROUTED_SITE = $(call github,troglobit,mrouted,$(MROUTED_VERSION))
 MROUTED_DEPENDENCIES = host-bison
+MROUTED_LICENSE = BSD-3c
+MROUTED_LICENSE_FILES = LICENSE
+
+define MROUTED_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(TARGET_MAKE_ENV) $(@D)/configure --enable-rsrr \
+	)
+endef
 
 define MROUTED_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
