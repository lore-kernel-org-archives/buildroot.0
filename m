From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Dec 2018 22:47:01 +0100
Subject: [Buildroot] [git commit branch/next] package/quagga: bump to
 version 1.2.3
Message-ID: <20181201214354.040C88A2BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ab5fd69bcfc942d307dc7330aa9c8b9afc5b13d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Remove all patches except the first one as they are already in this
  version
- Remove AUTORECONF = YES as we're not patching any *.ac files anymore
- Disable new nhrpd option
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...onfigure-fix-static-linking-with-readline.patch |  41 --------
 ...memory-fix-indirect-static-link-with-zlib.patch | 108 -------------------
 ...x-AS_PATH-size-calculation-for-long-paths.patch |  33 ------
 ...ty-invalid-attr-length-sends-NOTIFY-with-.patch |  69 -------------
 ...rity-Fix-double-free-of-unknown-attribute.patch | 112 --------------------
 ...ty-debug-print-of-received-NOTIFY-data-ca.patch | 114 ---------------------
 ...ty-fix-infinite-loop-on-certain-invalid-O.patch |  43 --------
 package/quagga/quagga.hash                         |   5 +-
 package/quagga/quagga.mk                           |   8 +-
 9 files changed, 7 insertions(+), 526 deletions(-)

diff --git a/package/quagga/0002-configure-fix-static-linking-with-readline.patch b/package/quagga/0002-configure-fix-static-linking-with-readline.patch
deleted file mode 100644
index 243dfaf75d..0000000000
--- a/package/quagga/0002-configure-fix-static-linking-with-readline.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 62ede7482da15d276b880f6d8540dce400dc50a7 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Thu, 26 Nov 2015 15:59:07 +0100
-Subject: [PATCH] configure: fix static linking with readline
-
-When static linking is used, the order of the libraries is important,
-and the libraries using a symbol from another library should be listed
-*before* the library providing that symbol (see
-http://eli.thegreenplace.net/2013/07/09/library-order-in-static-linking)
-for details.
-
-When vtysh is linked statically, the command line contains "-lcurses
--lreadline", which causes a build failure due to unresolved
-symbols. This is because readline is using symbols from the curses
-library: the order should be the opposite.
-
-This patch fixes that problem by putting the -lreadline at the
-beginning of the LIBREADLINE variable calcualted by the configure
-script.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3003e62..290953d 100755
---- a/configure.ac
-+++ b/configure.ac
-@@ -652,7 +652,7 @@ dnl	 [TODO] on Linux, and in [TODO] on Solaris.
- 	      )]
- 	    )]
- 	  )
--         AC_CHECK_LIB(readline, main, LIBREADLINE="$LIBREADLINE -lreadline",,
-+         AC_CHECK_LIB(readline, main, LIBREADLINE="-lreadline $LIBREADLINE",,
-                       "$LIBREADLINE")
-          if test $ac_cv_lib_readline_main = no; then
-            AC_MSG_ERROR([vtysh needs libreadline but was not found and usable on your system.])
--- 
-2.6.3
-
diff --git a/package/quagga/0003-lib-memory-fix-indirect-static-link-with-zlib.patch b/package/quagga/0003-lib-memory-fix-indirect-static-link-with-zlib.patch
deleted file mode 100644
index 6990f47cda..0000000000
--- a/package/quagga/0003-lib-memory-fix-indirect-static-link-with-zlib.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From 008dd9771057dbbd7ce971c43bce2a0b05e2cf97 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Sun, 21 Aug 2016 08:56:57 +0300
-Subject: [PATCH] lib/memory: fix indirect static link with zlib
-
-quagga SNMP support depends on netsnmp, that optionally depends on OpenSSL,
-which in turn requires zlib. zlib exports the 'zcalloc' symbol, which collides
-with a function of the same name in memory.c. This is not a problem when
-linking dynamically, since quagga does not use zlib directly. But static
-linking fails with the error:
-
-  CCLD     ospfd
-.../output/host/usr/mips64el-buildroot-linux-uclibc/sysroot/usr/lib/libz.a(zutil.o): In function `zcalloc':
-zutil.c:(.text+0x48): multiple definition of `zcalloc'
-.../output/build/quagga-1.0.20160315/lib/.libs/libzebra.a(memory.o):memory.c:(.text+0x1a0): first defined here
-
-Rename 'zcalloc' to 'zzcalloc' to avoid symbol collision.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: posted upstream
-https://lists.quagga.net/pipermail/quagga-dev/2016-August/016109.html
-
- lib/memory.c | 14 ++++++++------
- lib/memory.h |  4 ++--
- 2 files changed, 10 insertions(+), 8 deletions(-)
-
-diff --git a/lib/memory.c b/lib/memory.c
-index 269520d5a435..b1680a5e6f07 100644
---- a/lib/memory.c
-+++ b/lib/memory.c
-@@ -80,9 +80,11 @@ zmalloc (int type, size_t size)
- 
- /*
-  * Allocate memory as in zmalloc, and also clear the memory.
-+ * Add an extra 'z' prefix to function name to avoid collision when linking
-+ * statically with zlib that exports the 'zcalloc' symbol.
-  */
- void *
--zcalloc (int type, size_t size)
-+zzcalloc (int type, size_t size)
- {
-   void *memory;
- 
-@@ -97,9 +99,9 @@ zcalloc (int type, size_t size)
- }
- 
- /* 
-- * Given a pointer returned by zmalloc or zcalloc, free it and
-+ * Given a pointer returned by zmalloc or zzcalloc, free it and
-  * return a pointer to a new size, basically acting like realloc().
-- * Requires: ptr was returned by zmalloc, zcalloc, or zrealloc with the
-+ * Requires: ptr was returned by zmalloc, zzcalloc, or zrealloc with the
-  * same type.
-  * Effects: Returns a pointer to the new memory, or aborts.
-  */
-@@ -109,7 +111,7 @@ zrealloc (int type, void *ptr, size_t size)
-   void *memory;
- 
-   if (ptr == NULL)              /* is really alloc */
--      return zcalloc(type, size);
-+      return zzcalloc(type, size);
- 
-   memory = realloc (ptr, size);
-   if (memory == NULL)
-@@ -122,7 +124,7 @@ zrealloc (int type, void *ptr, size_t size)
- 
- /*
-  * Free memory allocated by z*alloc or zstrdup.
-- * Requires: ptr was returned by zmalloc, zcalloc, or zrealloc with the
-+ * Requires: ptr was returned by zmalloc, zzcalloc, or zrealloc with the
-  * same type.
-  * Effects: The memory is freed and may no longer be referenced.
-  */
-@@ -196,7 +198,7 @@ mtype_zcalloc (const char *file, int line, int type, size_t size)
-   mstat[type].c_calloc++;
-   mstat[type].t_calloc++;
- 
--  memory = zcalloc (type, size);
-+  memory = zzcalloc (type, size);
-   mtype_log ("xcalloc", memory, file, line, type);
- 
-   return memory;
-diff --git a/lib/memory.h b/lib/memory.h
-index 23962235dbfe..501352993d21 100644
---- a/lib/memory.h
-+++ b/lib/memory.h
-@@ -56,7 +56,7 @@ extern struct mlist mlists[];
-   mtype_zstrdup (__FILE__, __LINE__, (mtype), (str))
- #else
- #define XMALLOC(mtype, size)       zmalloc ((mtype), (size))
--#define XCALLOC(mtype, size)       zcalloc ((mtype), (size))
-+#define XCALLOC(mtype, size)       zzcalloc ((mtype), (size))
- #define XREALLOC(mtype, ptr, size) zrealloc ((mtype), (ptr), (size))
- #define XFREE(mtype, ptr)          do { \
-                                      zfree ((mtype), (ptr)); \
-@@ -67,7 +67,7 @@ extern struct mlist mlists[];
- 
- /* Prototypes of memory function. */
- extern void *zmalloc (int type, size_t size);
--extern void *zcalloc (int type, size_t size);
-+extern void *zzcalloc (int type, size_t size);
- extern void *zrealloc (int type, void *ptr, size_t size);
- extern void  zfree (int type, void *ptr);
- extern char *zstrdup (int type, const char *str);
--- 
-2.8.1
-
diff --git a/package/quagga/0004-bgpd-Fix-AS_PATH-size-calculation-for-long-paths.patch b/package/quagga/0004-bgpd-Fix-AS_PATH-size-calculation-for-long-paths.patch
deleted file mode 100644
index 1425cf0426..0000000000
--- a/package/quagga/0004-bgpd-Fix-AS_PATH-size-calculation-for-long-paths.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 7a42b78be9a4108d98833069a88e6fddb9285008 Mon Sep 17 00:00:00 2001
-From: Andreas Jaggi <aj@open.ch>
-Date: Mon, 2 Oct 2017 19:38:43 +0530
-Subject: [PATCH] bgpd: Fix AS_PATH size calculation for long paths
-
-If you have an AS_PATH with more entries than
-what can be written into a single AS_SEGMENT_MAX
-it needs to be broken up.  The code that noticed
-that the AS_PATH needs to be broken up was not
-correctly calculating the size of the resulting
-message.  This patch addresses this issue.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- bgpd/bgp_aspath.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/bgpd/bgp_aspath.c b/bgpd/bgp_aspath.c
-index b7af5e88..d813bfba 100644
---- a/bgpd/bgp_aspath.c
-+++ b/bgpd/bgp_aspath.c
-@@ -903,7 +903,7 @@ aspath_put (struct stream *s, struct aspath *as, int use32bit )
-               assegment_header_put (s, seg->type, AS_SEGMENT_MAX);
-               assegment_data_put (s, seg->as, AS_SEGMENT_MAX, use32bit);
-               written += AS_SEGMENT_MAX;
--              bytes += ASSEGMENT_SIZE (written, use32bit);
-+              bytes += ASSEGMENT_SIZE (AS_SEGMENT_MAX, use32bit);
-             }
-           
-           /* write the final segment, probably is also the first */
--- 
-2.11.0
-
diff --git a/package/quagga/0005-bgpd-security-invalid-attr-length-sends-NOTIFY-with-.patch b/package/quagga/0005-bgpd-security-invalid-attr-length-sends-NOTIFY-with-.patch
deleted file mode 100644
index b64109d0f7..0000000000
--- a/package/quagga/0005-bgpd-security-invalid-attr-length-sends-NOTIFY-with-.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From cc2e6770697e343f4af534114ab7e633d5beabec Mon Sep 17 00:00:00 2001
-From: Paul Jakma <paul@jakma.org>
-Date: Wed, 3 Jan 2018 23:57:33 +0000
-Subject: [PATCH] bgpd/security: invalid attr length sends NOTIFY with data
- overrun
-
-Security issue: Quagga-2018-0543
-
-See: https://www.quagga.net/security/Quagga-2018-0543.txt
-
-* bgpd/bgp_attr.c: (bgp_attr_parse) An invalid attribute length is correctly
-  checked, and a NOTIFY prepared.  The NOTIFY can include the incorrect
-  received data with the NOTIFY, for debug purposes.  Commit
-  c69698704806a9ac5 modified the code to do that just, and also send the
-  malformed attr with the NOTIFY.  However, the invalid attribute length was
-  used as the length of the data to send back.
-
-  The result is a read past the end of data, which is then written to the
-  NOTIFY message and sent to the peer.
-
-  A configured BGP peer can use this bug to read up to 64 KiB of memory from
-  the bgpd process, or crash the process if the invalid read is caught by
-  some means (unmapped page and SEGV, or other mechanism) resulting in a DoS.
-
-  This bug _ought_ /not/ be exploitable by anything other than the connected
-  BGP peer, assuming the underlying TCP transport is secure.  For no BGP
-  peer should send on an UPDATE with this attribute.  Quagga will not, as
-  Quagga always validates the attr header length, regardless of type.
-
-  However, it is possible that there are BGP implementations that do not
-  check lengths on some attributes (e.g.  optional/transitive ones of a type
-  they do not recognise), and might pass such malformed attrs on.  If such
-  implementations exists and are common, then this bug might be triggerable
-  by BGP speakers further hops away.  Those peers will not receive the
-  NOTIFY (unless they sit on a shared medium), however they might then be
-  able to trigger a DoS.
-
-  Fix: use the valid bound to calculate the length.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- bgpd/bgp_attr.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
-index ef58beb1..9564637e 100644
---- a/bgpd/bgp_attr.c
-+++ b/bgpd/bgp_attr.c
-@@ -2147,6 +2147,8 @@ bgp_attr_parse (struct peer *peer, struct attr *attr, bgp_size_t size,
-   memset (seen, 0, BGP_ATTR_BITMAP_SIZE);
- 
-   /* End pointer of BGP attribute. */
-+  assert (size <= stream_get_size (BGP_INPUT (peer)));
-+  assert (size <= stream_get_endp (BGP_INPUT (peer)));
-   endp = BGP_INPUT_PNT (peer) + size;
-   
-   /* Get attributes to the end of attribute length. */
-@@ -2228,7 +2230,7 @@ bgp_attr_parse (struct peer *peer, struct attr *attr, bgp_size_t size,
-           bgp_notify_send_with_data (peer,
-                                      BGP_NOTIFY_UPDATE_ERR,
-                                      BGP_NOTIFY_UPDATE_ATTR_LENG_ERR,
--                                     startp, attr_endp - startp);
-+                                     startp, endp - startp);
- 	  return BGP_ATTR_PARSE_ERROR;
- 	}
- 	
--- 
-2.11.0
-
diff --git a/package/quagga/0006-bgpd-security-Fix-double-free-of-unknown-attribute.patch b/package/quagga/0006-bgpd-security-Fix-double-free-of-unknown-attribute.patch
deleted file mode 100644
index 0e32817f06..0000000000
--- a/package/quagga/0006-bgpd-security-Fix-double-free-of-unknown-attribute.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From e69b535f92eafb599329bf725d9b4c6fd5d7fded Mon Sep 17 00:00:00 2001
-From: Paul Jakma <paul@jakma.org>
-Date: Sat, 6 Jan 2018 19:52:10 +0000
-Subject: [PATCH] bgpd/security: Fix double free of unknown attribute
-
-Security issue: Quagga-2018-1114
-See: https://www.quagga.net/security/Quagga-2018-1114.txt
-
-It is possible for bgpd to double-free an unknown attribute. This can happen
-via bgp_update_receive receiving an UPDATE with an invalid unknown attribute.
-bgp_update_receive then will call bgp_attr_unintern_sub and bgp_attr_flush,
-and the latter may try free an already freed unknown attr.
-
-* bgpd/bgp_attr.c: (transit_unintern) Take a pointer to the caller's storage
-  for the (struct transit *), so that transit_unintern can NULL out the
-  caller's reference if the (struct transit) is freed.
-  (cluster_unintern) By inspection, appears to have a similar issue.
-  (bgp_attr_unintern_sub) adjust for above.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- bgpd/bgp_attr.c | 33 +++++++++++++++++++--------------
- bgpd/bgp_attr.h |  4 ++--
- 2 files changed, 21 insertions(+), 16 deletions(-)
-
-diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
-index 9564637e..0c2806b5 100644
---- a/bgpd/bgp_attr.c
-+++ b/bgpd/bgp_attr.c
-@@ -199,15 +199,17 @@ cluster_intern (struct cluster_list *cluster)
- }
- 
- void
--cluster_unintern (struct cluster_list *cluster)
-+cluster_unintern (struct cluster_list **cluster)
- {
--  if (cluster->refcnt)
--    cluster->refcnt--;
-+  struct cluster_list *c = *cluster;
-+  if (c->refcnt)
-+    c->refcnt--;
- 
--  if (cluster->refcnt == 0)
-+  if (c->refcnt == 0)
-     {
--      hash_release (cluster_hash, cluster);
--      cluster_free (cluster);
-+      hash_release (cluster_hash, c);
-+      cluster_free (c);
-+      *cluster = NULL;
-     }
- }
- 
-@@ -357,15 +359,18 @@ transit_intern (struct transit *transit)
- }
- 
- void
--transit_unintern (struct transit *transit)
-+transit_unintern (struct transit **transit)
- {
--  if (transit->refcnt)
--    transit->refcnt--;
-+  struct transit *t = *transit;
-+  
-+  if (t->refcnt)
-+    t->refcnt--;
- 
--  if (transit->refcnt == 0)
-+  if (t->refcnt == 0)
-     {
--      hash_release (transit_hash, transit);
--      transit_free (transit);
-+      hash_release (transit_hash, t);
-+      transit_free (t);
-+      *transit = NULL;
-     }
- }
- 
-@@ -820,11 +825,11 @@ bgp_attr_unintern_sub (struct attr *attr)
-       UNSET_FLAG(attr->flag, ATTR_FLAG_BIT (BGP_ATTR_LARGE_COMMUNITIES));
-       
-       if (attr->extra->cluster)
--        cluster_unintern (attr->extra->cluster);
-+        cluster_unintern (&attr->extra->cluster);
-       UNSET_FLAG(attr->flag, ATTR_FLAG_BIT (BGP_ATTR_CLUSTER_LIST));
-       
-       if (attr->extra->transit)
--        transit_unintern (attr->extra->transit);
-+        transit_unintern (&attr->extra->transit);
-     }
- }
- 
-diff --git a/bgpd/bgp_attr.h b/bgpd/bgp_attr.h
-index 9ff074b2..052acc7d 100644
---- a/bgpd/bgp_attr.h
-+++ b/bgpd/bgp_attr.h
-@@ -187,10 +187,10 @@ extern unsigned long int attr_unknown_count (void);
- 
- /* Cluster list prototypes. */
- extern int cluster_loop_check (struct cluster_list *, struct in_addr);
--extern void cluster_unintern (struct cluster_list *);
-+extern void cluster_unintern (struct cluster_list **);
- 
- /* Transit attribute prototypes. */
--void transit_unintern (struct transit *);
-+void transit_unintern (struct transit **);
- 
- /* Below exported for unit-test purposes only */
- struct bgp_attr_parser_args {
--- 
-2.11.0
-
diff --git a/package/quagga/0007-bgpd-security-debug-print-of-received-NOTIFY-data-ca.patch b/package/quagga/0007-bgpd-security-debug-print-of-received-NOTIFY-data-ca.patch
deleted file mode 100644
index aeb50ae559..0000000000
--- a/package/quagga/0007-bgpd-security-debug-print-of-received-NOTIFY-data-ca.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From 9e5251151894aefdf8e9392a2371615222119ad8 Mon Sep 17 00:00:00 2001
-From: Paul Jakma <paul@jakma.org>
-Date: Sat, 6 Jan 2018 22:31:52 +0000
-Subject: [PATCH] bgpd/security: debug print of received NOTIFY data can
- over-read msg array
-
-Security issue: Quagga-2018-1550
-See: https://www.quagga.net/security/Quagga-2018-1550.txt
-
-* bgpd/bgp_debug.c: (struct message) Nearly every one of the NOTIFY
-  code/subcode message arrays has their corresponding size variables off
-  by one, as most have 1 as first index.
-
-  This means (bgp_notify_print) can cause mes_lookup to overread the (struct
-  message) by 1 pointer value if given an unknown index.
-
-  Fix the bgp_notify_..._msg_max variables to use the compiler to calculate
-  the correct sizes.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- bgpd/bgp_debug.c | 21 ++++++++++++---------
- 1 file changed, 12 insertions(+), 9 deletions(-)
-
-diff --git a/bgpd/bgp_debug.c b/bgpd/bgp_debug.c
-index ba797228..43faee7c 100644
---- a/bgpd/bgp_debug.c
-+++ b/bgpd/bgp_debug.c
-@@ -29,6 +29,7 @@ Software Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
- #include "log.h"
- #include "sockunion.h"
- #include "filter.h"
-+#include "memory.h"
- 
- #include "bgpd/bgpd.h"
- #include "bgpd/bgp_aspath.h"
-@@ -73,7 +74,8 @@ const struct message bgp_status_msg[] =
-   { Clearing,    "Clearing"    },
-   { Deleted,     "Deleted"     },
- };
--const int bgp_status_msg_max = BGP_STATUS_MAX;
-+#define BGP_DEBUG_MSG_MAX(msg) const int msg ## _max = array_size (msg)
-+BGP_DEBUG_MSG_MAX (bgp_status_msg);
- 
- /* BGP message type string. */
- const char *bgp_type_str[] =
-@@ -84,7 +86,8 @@ const char *bgp_type_str[] =
-   "NOTIFICATION",
-   "KEEPALIVE",
-   "ROUTE-REFRESH",
--  "CAPABILITY"
-+  "CAPABILITY",
-+  NULL,
- };
- 
- /* message for BGP-4 Notify */
-@@ -98,15 +101,15 @@ static const struct message bgp_notify_msg[] =
-   { BGP_NOTIFY_CEASE, "Cease"},
-   { BGP_NOTIFY_CAPABILITY_ERR, "CAPABILITY Message Error"},
- };
--static const int bgp_notify_msg_max = BGP_NOTIFY_MAX;
-+BGP_DEBUG_MSG_MAX (bgp_notify_msg);
- 
- static const struct message bgp_notify_head_msg[] = 
- {
-   { BGP_NOTIFY_HEADER_NOT_SYNC, "/Connection Not Synchronized"},
-   { BGP_NOTIFY_HEADER_BAD_MESLEN, "/Bad Message Length"},
--  { BGP_NOTIFY_HEADER_BAD_MESTYPE, "/Bad Message Type"}
-+  { BGP_NOTIFY_HEADER_BAD_MESTYPE, "/Bad Message Type"},
- };
--static const int bgp_notify_head_msg_max = BGP_NOTIFY_HEADER_MAX;
-+BGP_DEBUG_MSG_MAX (bgp_notify_head_msg);
- 
- static const struct message bgp_notify_open_msg[] = 
- {
-@@ -119,7 +122,7 @@ static const struct message bgp_notify_open_msg[] =
-   { BGP_NOTIFY_OPEN_UNACEP_HOLDTIME, "/Unacceptable Hold Time"}, 
-   { BGP_NOTIFY_OPEN_UNSUP_CAPBL, "/Unsupported Capability"},
- };
--static const int bgp_notify_open_msg_max = BGP_NOTIFY_OPEN_MAX;
-+BGP_DEBUG_MSG_MAX (bgp_notify_open_msg);
- 
- static const struct message bgp_notify_update_msg[] = 
- {
-@@ -136,7 +139,7 @@ static const struct message bgp_notify_update_msg[] =
-   { BGP_NOTIFY_UPDATE_INVAL_NETWORK, "/Invalid Network Field"},
-   { BGP_NOTIFY_UPDATE_MAL_AS_PATH, "/Malformed AS_PATH"},
- };
--static const int bgp_notify_update_msg_max = BGP_NOTIFY_UPDATE_MAX;
-+BGP_DEBUG_MSG_MAX (bgp_notify_update_msg);
- 
- static const struct message bgp_notify_cease_msg[] =
- {
-@@ -150,7 +153,7 @@ static const struct message bgp_notify_cease_msg[] =
-   { BGP_NOTIFY_CEASE_COLLISION_RESOLUTION, "/Connection collision resolution"},
-   { BGP_NOTIFY_CEASE_OUT_OF_RESOURCE, "/Out of Resource"},
- };
--static const int bgp_notify_cease_msg_max = BGP_NOTIFY_CEASE_MAX;
-+BGP_DEBUG_MSG_MAX (bgp_notify_cease_msg);
- 
- static const struct message bgp_notify_capability_msg[] = 
- {
-@@ -159,7 +162,7 @@ static const struct message bgp_notify_capability_msg[] =
-   { BGP_NOTIFY_CAPABILITY_INVALID_LENGTH, "/Invalid Capability Length"},
-   { BGP_NOTIFY_CAPABILITY_MALFORMED_CODE, "/Malformed Capability Value"},
- };
--static const int bgp_notify_capability_msg_max = BGP_NOTIFY_CAPABILITY_MAX;
-+BGP_DEBUG_MSG_MAX (bgp_notify_capability_msg);
- 
- /* Origin strings. */
- const char *bgp_origin_str[] = {"i","e","?"};
--- 
-2.11.0
-
diff --git a/package/quagga/0008-bgpd-security-fix-infinite-loop-on-certain-invalid-O.patch b/package/quagga/0008-bgpd-security-fix-infinite-loop-on-certain-invalid-O.patch
deleted file mode 100644
index 0a06da9330..0000000000
--- a/package/quagga/0008-bgpd-security-fix-infinite-loop-on-certain-invalid-O.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From ce07207c50a3d1f05d6dd49b5294282e59749787 Mon Sep 17 00:00:00 2001
-From: Paul Jakma <paul@jakma.org>
-Date: Sat, 6 Jan 2018 21:20:51 +0000
-Subject: [PATCH] bgpd/security: fix infinite loop on certain invalid OPEN
- messages
-
-Security issue: Quagga-2018-1975
-See: https://www.quagga.net/security/Quagga-2018-1975.txt
-
-* bgpd/bgp_packet.c: (bgp_capability_msg_parse) capability parser can infinite
-  loop due to checks that issue 'continue' without bumping the input
-  pointer.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- bgpd/bgp_packet.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/bgpd/bgp_packet.c b/bgpd/bgp_packet.c
-index b3d601fc..f9338d8d 100644
---- a/bgpd/bgp_packet.c
-+++ b/bgpd/bgp_packet.c
-@@ -2328,7 +2328,8 @@ bgp_capability_msg_parse (struct peer *peer, u_char *pnt, bgp_size_t length)
- 
-   end = pnt + length;
- 
--  while (pnt < end)
-+  /* XXX: Streamify this */
-+  for (; pnt < end; pnt += hdr->length + 3)
-     {      
-       /* We need at least action, capability code and capability length. */
-       if (pnt + 3 > end)
-@@ -2416,7 +2417,6 @@ bgp_capability_msg_parse (struct peer *peer, u_char *pnt, bgp_size_t length)
-           zlog_warn ("%s unrecognized capability code: %d - ignored",
-                      peer->host, hdr->code);
-         }
--      pnt += hdr->length + 3;
-     }
-   return 0;
- }
--- 
-2.11.0
-
diff --git a/package/quagga/quagga.hash b/package/quagga/quagga.hash
index 6da37cf806..93fc42c8fc 100644
--- a/package/quagga/quagga.hash
+++ b/package/quagga/quagga.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	b5a94e5bdad3062e04595a5692b8cc435f0a85102f75dfdca0a06d093b4ef63f	quagga-1.1.1.tar.gz
+sha256	ee2c0907a106902abbdcaf63b4f28c67241c4f3396989ed54da7b4976eecad31	quagga-1.2.3.tar.gz
+
+# Hash for license file
+sha256	b39c1bad4e51e2a3389cd25fc4addebe41a3ae7c11100795683f9330de1536e5	COPYING
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index b2b4e2a1f7..7049e968a9 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUAGGA_VERSION = 1.1.1
+QUAGGA_VERSION = 1.2.3
 QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
 QUAGGA_DEPENDENCIES = host-gawk host-pkgconf
 QUAGGA_LICENSE = GPL-2.0+
@@ -16,10 +16,8 @@ QUAGGA_LICENSE_FILES = COPYING
 QUAGGA_CONF_OPTS = \
 	--program-transform-name='' \
 	--sysconfdir=/etc/quagga \
-	--localstatedir=/var/run/quagga
-
-# 0002-configure-fix-static-linking-with-readline.patch
-QUAGGA_AUTORECONF = YES
+	--localstatedir=/var/run/quagga \
+	--disable-nhrpd
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 QUAGGA_CONF_OPTS += --enable-capabilities
