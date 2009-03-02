From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  2 Mar 2009 15:33:07 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20090302153307.923377747D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-02 15:33:07 +0000 (Mon, 02 Mar 2009)
New Revision: 25487

Log:
busybox: additional 1.13.2 fixes

Added:
   trunk/buildroot/package/busybox/busybox-1.13.2-awk.patch
   trunk/buildroot/package/busybox/busybox-1.13.2-unzip.patch
   trunk/buildroot/package/busybox/busybox-1.13.2-wget.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.13.2-awk.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.2-awk.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.13.2-awk.patch	2009-03-02 15:33:07 UTC (rev 25487)
@@ -0,0 +1,46 @@
+diff -urpN busybox-1.13.2/editors/awk.c busybox-1.13.2-awk/editors/awk.c
+--- busybox-1.13.2/editors/awk.c	2008-11-09 18:28:21.000000000 +0100
++++ busybox-1.13.2-awk/editors/awk.c	2009-02-26 12:17:05.000000000 +0100
+@@ -392,8 +392,12 @@ static const uint16_t PRIMES[] ALIGN2 = 
+ 
+ 
+ /* Globals. Split in two parts so that first one is addressed
+- * with (mostly short) negative offsets */
++ * with (mostly short) negative offsets.
++ * NB: it's unsafe to put members of type "double"
++ * into globals2 (gcc may fail to align them).
++ */
+ struct globals {
++	double t_double;
+ 	chain beginseq, mainseq, endseq;
+ 	chain *seq;
+ 	node *break_ptr, *continue_ptr;
+@@ -442,16 +446,16 @@ struct globals2 {
+ 	tsplitter exec_builtin__tspl;
+ 
+ 	/* biggest and least used members go last */
+-	double t_double;
+ 	tsplitter fsplitter, rsplitter;
+ };
+ #define G1 (ptr_to_globals[-1])
+ #define G (*(struct globals2 *)ptr_to_globals)
+ /* For debug. nm --size-sort awk.o | grep -vi ' [tr] ' */
+-/* char G1size[sizeof(G1)]; - 0x6c */
+-/* char Gsize[sizeof(G)]; - 0x1cc */
++/*char G1size[sizeof(G1)]; - 0x74 */
++/*char Gsize[sizeof(G)]; - 0x1c4 */
+ /* Trying to keep most of members accessible with short offsets: */
+-/* char Gofs_seed[offsetof(struct globals2, evaluate__seed)]; - 0x90 */
++/*char Gofs_seed[offsetof(struct globals2, evaluate__seed)]; - 0x90 */
++#define t_double     (G1.t_double    )
+ #define beginseq     (G1.beginseq    )
+ #define mainseq      (G1.mainseq     )
+ #define endseq       (G1.endseq      )
+@@ -479,7 +483,6 @@ struct globals2 {
+ #define t_info       (G.t_info      )
+ #define t_tclass     (G.t_tclass    )
+ #define t_string     (G.t_string    )
+-#define t_double     (G.t_double    )
+ #define t_lineno     (G.t_lineno    )
+ #define t_rollback   (G.t_rollback  )
+ #define intvar       (G.intvar      )

Added: trunk/buildroot/package/busybox/busybox-1.13.2-unzip.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.2-unzip.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.13.2-unzip.patch	2009-03-02 15:33:07 UTC (rev 25487)
@@ -0,0 +1,12 @@
+diff -urpN busybox-1.13.2/archival/unzip.c busybox-1.13.2-unzip/archival/unzip.c
+--- busybox-1.13.2/archival/unzip.c	2008-11-09 18:28:02.000000000 +0100
++++ busybox-1.13.2-unzip/archival/unzip.c	2009-02-26 12:17:21.000000000 +0100
+@@ -140,7 +140,7 @@ struct BUG_cde_header_must_be_16_bytes {
+ };
+ 
+ #define FIX_ENDIANNESS_CDE(cde_header) do { \
+-	(cde_header).formatted.cds_offset = SWAP_LE16((cde_header).formatted.cds_offset); \
++	(cde_header).formatted.cds_offset = SWAP_LE32((cde_header).formatted.cds_offset); \
+ } while (0)
+ 
+ enum { zip_fd = 3 };

Added: trunk/buildroot/package/busybox/busybox-1.13.2-wget.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.2-wget.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.13.2-wget.patch	2009-03-02 15:33:07 UTC (rev 25487)
@@ -0,0 +1,41 @@
+diff -urpN busybox-1.13.2/networking/wget.c busybox-1.13.2-wget/networking/wget.c
+--- busybox-1.13.2/networking/wget.c	2008-11-09 18:27:59.000000000 +0100
++++ busybox-1.13.2-wget/networking/wget.c	2009-03-02 16:07:12.000000000 +0100
+@@ -417,15 +417,17 @@ int wget_main(int argc UNUSED_PARAM, cha
+ 		KEY_content_length = 1, KEY_transfer_encoding, KEY_chunked, KEY_location
+ 	};
+ 	enum {
+-		WGET_OPT_CONTINUE   = 0x1,
+-		WGET_OPT_SPIDER	    = 0x2,
+-		WGET_OPT_QUIET      = 0x4,
+-		WGET_OPT_OUTNAME    = 0x8,
+-		WGET_OPT_PREFIX     = 0x10,
+-		WGET_OPT_PROXY      = 0x20,
+-		WGET_OPT_USER_AGENT = 0x40,
+-		WGET_OPT_PASSIVE    = 0x80,
+-		WGET_OPT_HEADER     = 0x100,
++		WGET_OPT_CONTINUE   = (1 << 0),
++		WGET_OPT_SPIDER	    = (1 << 1),
++		WGET_OPT_QUIET      = (1 << 2),
++		WGET_OPT_OUTNAME    = (1 << 3),
++		WGET_OPT_PREFIX     = (1 << 4),
++		WGET_OPT_PROXY      = (1 << 5),
++		WGET_OPT_USER_AGENT = (1 << 6),
++		WGET_OPT_RETRIES    = (1 << 7),
++		WGET_OPT_NETWORK_READ_TIMEOUT = (1 << 8),
++		WGET_OPT_PASSIVE    = (1 << 9),
++		WGET_OPT_HEADER     = (1 << 10),
+ 	};
+ #if ENABLE_FEATURE_WGET_LONG_OPTIONS
+ 	static const char wget_longopts[] ALIGN1 =
+@@ -437,6 +439,10 @@ int wget_main(int argc UNUSED_PARAM, cha
+ 		"directory-prefix\0" Required_argument "P"
+ 		"proxy\0"            Required_argument "Y"
+ 		"user-agent\0"       Required_argument "U"
++		/* Ignored: */
++		// "tries\0"            Required_argument "t"
++		// "timeout\0"          Required_argument "T"
++		/* Ignored (we always use PASV): */
+ 		"passive-ftp\0"      No_argument       "\xff"
+ 		"header\0"           Required_argument "\xfe"
+ 		;
