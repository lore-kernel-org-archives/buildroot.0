From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 23:00:11 +0100
Subject: [Buildroot] [git commit] libtirpc: handle the case where uClibc may
	have RPC support
Message-ID: <20121114220320.B7E3499FD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c54af0a294de09ecb8699d0d9a0fca8b39247a79
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When uClibc has RPC support, it is not needed to define the 'struct
rpcent' structure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...out-RPC-support-does-not-install-rpcent.h.patch |   15 +++++++++------
 1 files changed, 9 insertions(+), 6 deletions(-)

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
