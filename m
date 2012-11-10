From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Nov 2012 22:42:41 +0100
Subject: [Buildroot] [PATCH 04/11] libtirpc: handle the case where uClibc
	may have RPC support
In-Reply-To: <cover.1352583641.git.thomas.petazzoni@free-electrons.com>
References: <cover.1352583641.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5863a180ea3dd2e145070efa109e54b2c1093102.1352583641.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When uClibc has RPC support, it is not needed to define the 'struct
rpcent' structure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...out-RPC-support-does-not-install-rpcent.h.patch |   15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/libtirpc/libtirpc-0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch b/package/libtirpc/libtirpc-0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch
index b950cb3..3ad25af 100644
--- a/package/libtirpc/libtirpc-0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch
+++ b/package/libtirpc/libtirpc-0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch
@@ -5,19 +5,22 @@ Subject: [PATCH] uClibc without RPC support does not install rpcent.h
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
- tirpc/rpc/rpcent.h |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ tirpc/rpc/rpcent.h |    5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/tirpc/rpc/rpcent.h b/tirpc/rpc/rpcent.h
-index 7fd93d9..df1f5ed 100644
+index 7fd93d9..8ce05ed 100644
 --- a/tirpc/rpc/rpcent.h
 +++ b/tirpc/rpc/rpcent.h
-@@ -47,7 +47,7 @@
+@@ -46,8 +46,9 @@
+ 
  __BEGIN_DECLS
  
- /* These are defined in /usr/include/rpc/netdb.h */
+-/* These are defined in /usr/include/rpc/netdb.h */
 -#if 0
-+#if __UCLIBC__
++/* These are defined in /usr/include/rpc/netdb.h, unless we are using
++   the C library without RPC support. */
++#if defined(__UCLIBC__) && !defined(__UCLIBC_HAS_RPC__)
  struct rpcent {
  	char	*r_name;	/* name of server for this rpc program */
  	char	**r_aliases;	/* alias list */
-- 
1.7.9.5
