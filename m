From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 19 Jul 2010 00:17:09 +0200
Subject: [Buildroot] [git commit master 1/1] ipsec-tools: replace sysv3
	legacy functions with modern equivalents
Message-ID: <20100718221729.8D99580800@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c835c3006b46b0dea9bbdadc1a2aa820744c8bf9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ipsec-tools/ipsec-tools-susv3-legacy.patch |   35 ++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 package/ipsec-tools/ipsec-tools-susv3-legacy.patch

diff --git a/package/ipsec-tools/ipsec-tools-susv3-legacy.patch b/package/ipsec-tools/ipsec-tools-susv3-legacy.patch
new file mode 100644
index 0000000..ea98505
--- /dev/null
+++ b/package/ipsec-tools/ipsec-tools-susv3-legacy.patch
@@ -0,0 +1,35 @@
+Replaces sysv3 legacy functions with modern equivalents.
+
+Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
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
1.7.1
