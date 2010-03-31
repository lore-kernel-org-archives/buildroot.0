From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 31 Mar 2010 11:02:34 +0200
Subject: [Buildroot] [git commit master] openssl: bump version
Message-ID: <20100331090328.EAD147F99F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=aa3486fd52f6cfd034b4d31d7821cf83206953bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1411

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                     |    5 ++-
 package/openssl/openssl-CVE-2009-1377.patch |   45 ---------------------------
 package/openssl/openssl-CVE-2009-1378.patch |   21 ------------
 package/openssl/openssl-CVE-2009-1379.patch |   20 ------------
 package/openssl/openssl-ditch.reject.patch  |   20 ------------
 package/openssl/openssl.mk                  |    2 +-
 6 files changed, 4 insertions(+), 109 deletions(-)
 delete mode 100644 package/openssl/openssl-CVE-2009-1377.patch
 delete mode 100644 package/openssl/openssl-CVE-2009-1378.patch
 delete mode 100644 package/openssl/openssl-CVE-2009-1379.patch
 delete mode 100644 package/openssl/openssl-ditch.reject.patch

diff --git a/CHANGES b/CHANGES
index 6500960..585f984 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,8 +9,8 @@
 
 	Updated/fixed packages: busybox, dosfstools, e2fsprogs,
 	freetype, iperf, less, libgcrypt, libglib2, libpng, libxml2,
-	mdadm, memstat, mtd-utils, nano, php, pppd, setserial,
-	squashfs, wget, xlib_libXfont
+	mdadm, memstat, mtd-utils, nano, openssl, php, pppd,
+	setserial, squashfs, wget, xlib_libXfont
 
 	Issues resolved (http://bugs.uclibc.org):
 
@@ -27,6 +27,7 @@
 	#1303: Add librsync package
 	#1327: mtd-utils compile failure due to lack of --sysroot in CFLAGS
 	#1345: Bump pppd to 2.4.5 and convert to Makefile.autotools.in
+	#1411: [SECURITY] Update openssl package to 0.9.8n
 	#1429: [SECURITY] Update php to 5.2.13
 	#1441: Add binutils 2.20.1
 	#1447: Package installation on target with debug symbols is broken
diff --git a/package/openssl/openssl-CVE-2009-1377.patch b/package/openssl/openssl-CVE-2009-1377.patch
deleted file mode 100644
index 931370a..0000000
--- a/package/openssl/openssl-CVE-2009-1377.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-diff -Nura openssl-0.9.8l/crypto/pqueue/pqueue.c openssl-0.9.8l-CVE-2009-1377/crypto/pqueue/pqueue.c
---- openssl-0.9.8l/crypto/pqueue/pqueue.c	2005-06-28 09:53:33.000000000 -0300
-+++ openssl-0.9.8l-CVE-2009-1377/crypto/pqueue/pqueue.c	2009-11-10 13:19:42.000000000 -0300
-@@ -234,3 +234,17 @@
- 
- 	return ret;
- 	}
-+
-+int
-+pqueue_size(pqueue_s *pq)
-+{
-+	pitem *item = pq->items;
-+	int count = 0;
-+	
-+	while(item != NULL)
-+	{
-+		count++;
-+		item = item->next;
-+	}
-+	return count;
-+}
-diff -Nura openssl-0.9.8l/crypto/pqueue/pqueue.h openssl-0.9.8l-CVE-2009-1377/crypto/pqueue/pqueue.h
---- openssl-0.9.8l/crypto/pqueue/pqueue.h	2005-05-30 19:34:27.000000000 -0300
-+++ openssl-0.9.8l-CVE-2009-1377/crypto/pqueue/pqueue.h	2009-11-10 13:19:42.000000000 -0300
-@@ -91,5 +91,6 @@
- pitem *pqueue_next(piterator *iter);
- 
- void   pqueue_print(pqueue pq);
-+int    pqueue_size(pqueue pq);
- 
- #endif /* ! HEADER_PQUEUE_H */
-diff -Nura openssl-0.9.8l/ssl/d1_pkt.c openssl-0.9.8l-CVE-2009-1377/ssl/d1_pkt.c
---- openssl-0.9.8l/ssl/d1_pkt.c	2009-11-05 12:21:28.000000000 -0300
-+++ openssl-0.9.8l-CVE-2009-1377/ssl/d1_pkt.c	2009-11-10 13:19:42.000000000 -0300
-@@ -167,6 +167,10 @@
-     DTLS1_RECORD_DATA *rdata;
- 	pitem *item;
- 
-+	/* Limit the size of the queue to prevent DOS attacks */
-+	if (pqueue_size(queue->q) >= 100)
-+		return 0;
-+		
- 	rdata = OPENSSL_malloc(sizeof(DTLS1_RECORD_DATA));
- 	item = pitem_new(priority, rdata);
- 	if (rdata == NULL || item == NULL)
diff --git a/package/openssl/openssl-CVE-2009-1378.patch b/package/openssl/openssl-CVE-2009-1378.patch
deleted file mode 100644
index dba1b39..0000000
--- a/package/openssl/openssl-CVE-2009-1378.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-diff -Nura openssl-0.9.8l/ssl/d1_both.c openssl-0.9.8l-CVE-2009-1378/ssl/d1_both.c
---- openssl-0.9.8l/ssl/d1_both.c	2007-10-17 18:17:49.000000000 -0300
-+++ openssl-0.9.8l-CVE-2009-1378/ssl/d1_both.c	2009-11-10 13:20:02.000000000 -0300
-@@ -561,7 +561,16 @@
- 	if ((msg_hdr->frag_off+frag_len) > msg_hdr->msg_len)
- 		goto err;
- 
--	if (msg_hdr->seq <= s->d1->handshake_read_seq)
-+	/* Try to find item in queue, to prevent duplicate entries */
-+	pq_64bit_init(&seq64);
-+	pq_64bit_assign_word(&seq64, msg_hdr->seq);
-+	item = pqueue_find(s->d1->buffered_messages, seq64);
-+	pq_64bit_free(&seq64);
-+	
-+	/* Discard the message if sequence number was already there, is
-+	 * too far in the future or the fragment is already in the queue */
-+	if (msg_hdr->seq <= s->d1->handshake_read_seq ||
-+		msg_hdr->seq > s->d1->handshake_read_seq + 10 || item != NULL)
- 		{
- 		unsigned char devnull [256];
- 
diff --git a/package/openssl/openssl-CVE-2009-1379.patch b/package/openssl/openssl-CVE-2009-1379.patch
deleted file mode 100644
index e4e05f1..0000000
--- a/package/openssl/openssl-CVE-2009-1379.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-diff -Nura openssl-0.9.8l/ssl/d1_both.c openssl-0.9.8l-CVE-2009-1379/ssl/d1_both.c
---- openssl-0.9.8l/ssl/d1_both.c	2007-10-17 18:17:49.000000000 -0300
-+++ openssl-0.9.8l-CVE-2009-1379/ssl/d1_both.c	2009-11-10 13:36:55.000000000 -0300
-@@ -519,6 +519,7 @@
- 
- 	if ( s->d1->handshake_read_seq == frag->msg_header.seq)
- 		{
-+		unsigned long frag_len = frag->msg_header.frag_len;
- 		pqueue_pop(s->d1->buffered_messages);
- 
- 		al=dtls1_preprocess_fragment(s,&frag->msg_header,max);
-@@ -536,7 +537,7 @@
- 		if (al==0)
- 			{
- 			*ok = 1;
--			return frag->msg_header.frag_len;
-+			return frag_len;
- 			}
- 
- 		ssl3_send_alert(s,SSL3_AL_FATAL,al);
diff --git a/package/openssl/openssl-ditch.reject.patch b/package/openssl/openssl-ditch.reject.patch
deleted file mode 100644
index b50bf37..0000000
--- a/package/openssl/openssl-ditch.reject.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-diff -Nura openssl-0.9.8l/Configure.rej openssl-0.9.8l-ditch-rej/Configure.rej
---- openssl-0.9.8l/Configure.rej	2009-11-05 09:07:06.000000000 -0300
-+++ openssl-0.9.8l-ditch-rej/Configure.rej	1969-12-31 21:00:00.000000000 -0300
-@@ -1,16 +0,0 @@
--***************
--*** 162,167 ****
--  "debug-ben-openbsd","gcc:-DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DPEDANTIC -DDEBUG_SAFESTACK -DOPENSSL_OPENBSD_DEV_CRYPTO -DOPENSSL_NO_ASM -O2 -pedantic -Wall -Wshadow -Werror -pipe::(unknown)::::",
--  "debug-ben-openbsd-debug","gcc:-DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DPEDANTIC -DDEBUG_SAFESTACK -DOPENSSL_OPENBSD_DEV_CRYPTO -DOPENSSL_NO_ASM -g3 -O2 -pedantic -Wall -Wshadow -Werror -pipe::(unknown)::::",
--  "debug-ben-debug",	"gcc:$gcc_devteam_warn -DBN_DEBUG -DREF_CHECK -DCONF_DEBUG  -DDEBUG_SAFESTACK -g3 -O2 -pipe::(unknown)::::::",
--  "debug-ben-strict",	"gcc:-DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DCONST_STRICT -O2 -Wall -Wshadow -Werror -Wpointer-arith -Wcast-qual -Wwrite-strings -pipe::(unknown)::::::",
--  "debug-rse","cc:-DTERMIOS -DL_ENDIAN -pipe -O -g -ggdb3 -Wall::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}",
--  "debug-bodo",	"gcc:-DL_ENDIAN -DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DBIO_PAIR_DEBUG -DPEDANTIC -g -march=i486 -pedantic -Wshadow -Wall -Wcast-align -Wstrict-prototypes -Wmissing-prototypes -Wno-long-long -Wundef -Wconversion -pipe::-D_REENTRANT:::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}",
----- 162,168 ----
--  "debug-ben-openbsd","gcc:-DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DPEDANTIC -DDEBUG_SAFESTACK -DOPENSSL_OPENBSD_DEV_CRYPTO -DOPENSSL_NO_ASM -O2 -pedantic -Wall -Wshadow -Werror -pipe::(unknown)::::",
--  "debug-ben-openbsd-debug","gcc:-DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DPEDANTIC -DDEBUG_SAFESTACK -DOPENSSL_OPENBSD_DEV_CRYPTO -DOPENSSL_NO_ASM -g3 -O2 -pedantic -Wall -Wshadow -Werror -pipe::(unknown)::::",
--  "debug-ben-debug",	"gcc:$gcc_devteam_warn -DBN_DEBUG -DREF_CHECK -DCONF_DEBUG  -DDEBUG_SAFESTACK -g3 -O2 -pipe::(unknown)::::::",
--+ "debug-ben-no-renegotiation",	"gcc:$gcc_devteam_warn -DBN_DEBUG -DREF_CHECK -DCONF_DEBUG  -DDEBUG_SAFESTACK -DNO_RENEGOTIATION -g3 -O2 -pipe::(unknown)::::::",
--  "debug-ben-strict",	"gcc:-DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DCONST_STRICT -O2 -Wall -Wshadow -Werror -Wpointer-arith -Wcast-qual -Wwrite-strings -pipe::(unknown)::::::",
--  "debug-rse","cc:-DTERMIOS -DL_ENDIAN -pipe -O -g -ggdb3 -Wall::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}",
--  "debug-bodo",	"gcc:-DL_ENDIAN -DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DBIO_PAIR_DEBUG -DPEDANTIC -g -march=i486 -pedantic -Wshadow -Wall -Wcast-align -Wstrict-prototypes -Wmissing-prototypes -Wno-long-long -Wundef -Wconversion -pipe::-D_REENTRANT:::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}",
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 1af7d4a..0f8c83c 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -3,7 +3,7 @@
 # openssl
 #
 #############################################################
-OPENSSL_VERSION:=0.9.8l
+OPENSSL_VERSION:=0.9.8n
 OPENSSL_SITE:=http://www.openssl.org/source
 
 OPENSSL_TARGET_ARCH=generic32
-- 
1.6.3.3
