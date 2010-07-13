From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Tue, 13 Jul 2010 17:35:31 +0200
Subject: [Buildroot] [PATCH] ipsec-tools: replaces sysv3 legacy functions
	with modern equivalents.
Message-ID: <1279035331-30851-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>


Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
 package/ipsec-tools/ipsec-tools-susv3-legacy.patch |   34 ++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 package/ipsec-tools/ipsec-tools-susv3-legacy.patch

diff --git a/package/ipsec-tools/ipsec-tools-susv3-legacy.patch b/package/ipsec-tools/ipsec-tools-susv3-legacy.patch
new file mode 100644
index 0000000..1bc5047
--- /dev/null
+++ b/package/ipsec-tools/ipsec-tools-susv3-legacy.patch
@@ -0,0 +1,34 @@
+Replaces sysv3 legacy functions with modern equivalents.
+
+Index: ipsec-tools-0.7.3/src/racoon/pfkey.c
+===================================================================
+--- ipsec-tools-0.7.3.orig/src/racoon/pfkey.c	2010-07-12 14:46:52.000000000 +0200
++++ ipsec-tools-0.7.3/src/racoon/pfkey.c	2010-07-12 15:01:39.000000000 +0200
+@@ -3008,12 +3008,12 @@
+ 				struct sockaddr *paddr;
+ 
+ 				paddr = (struct sockaddr *)(xisr + 1);
+-				bcopy(paddr, &(*p_isr)->saidx.src,
++				memmove(&(*p_isr)->saidx.src, paddr,
+ 					sysdep_sa_len(paddr));
+ 
+ 				paddr = (struct sockaddr *)((caddr_t)paddr
+ 							+ sysdep_sa_len(paddr));
+-				bcopy(paddr, &(*p_isr)->saidx.dst,
++				memmove(&(*p_isr)->saidx.dst, paddr,
+ 					sysdep_sa_len(paddr));
+ 			}
+ 
+Index: ipsec-tools-0.7.3/src/racoon/racoonctl.c
+===================================================================
+--- ipsec-tools-0.7.3.orig/src/racoon/racoonctl.c	2010-07-12 14:49:51.000000000 +0200
++++ ipsec-tools-0.7.3/src/racoon/racoonctl.c	2010-07-12 15:00:52.000000000 +0200
+@@ -785,7 +785,7 @@
+ 		errx(1, "cannot read source address");
+ 
+ 	/* We get "ip[port]" strip the port */
+-	if ((idx = index(srcaddr, '[')) == NULL) 
++	if ((idx = strchr(srcaddr, '[')) == NULL)
+ 		errx(1, "unexpected source address format");
+ 	*idx = '\0';
+ 
-- 
1.6.0.4
