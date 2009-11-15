From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Nov 2009 23:58:50 +0100
Subject: [Buildroot] [git commit master] openssl: bump to 0.9.8l + security
	fixes
Message-ID: <20091115225943.BEA3377785@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=48ed49e91d2e5e8b73a7392296f6ef5622a27e11
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #703

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                     |    1 +
 package/openssl/openssl-CVE-2009-1377.patch |   45 +++++++++++++++++++++++++++
 package/openssl/openssl-CVE-2009-1378.patch |   21 ++++++++++++
 package/openssl/openssl-CVE-2009-1379.patch |   20 ++++++++++++
 package/openssl/openssl-ditch.reject.patch  |   20 ++++++++++++
 package/openssl/openssl.mk                  |    2 +-
 6 files changed, 108 insertions(+), 1 deletions(-)
 create mode 100644 package/openssl/openssl-CVE-2009-1377.patch
 create mode 100644 package/openssl/openssl-CVE-2009-1378.patch
 create mode 100644 package/openssl/openssl-CVE-2009-1379.patch
 create mode 100644 package/openssl/openssl-ditch.reject.patch

diff --git a/CHANGES b/CHANGES
index 98525ce..584fa74 100644
--- a/CHANGES
+++ b/CHANGES
@@ -37,6 +37,7 @@
 	#657: Bug in imagemagick-clean target
 	#665: [PATCH] Samba package
 	#667: [PATCH] e2fsprogs
+	#703: [SECURITY] Update openssl package to 0.9.8l
 	#709: Bump lighttpd package to 1.4.24
 	#713: Migrate openntpd package to Makefile.autotools.in
 	#715: Bump libidn package to 1.15 and other fixes
diff --git a/package/openssl/openssl-CVE-2009-1377.patch b/package/openssl/openssl-CVE-2009-1377.patch
new file mode 100644
index 0000000..931370a
--- /dev/null
+++ b/package/openssl/openssl-CVE-2009-1377.patch
@@ -0,0 +1,45 @@
+diff -Nura openssl-0.9.8l/crypto/pqueue/pqueue.c openssl-0.9.8l-CVE-2009-1377/crypto/pqueue/pqueue.c
+--- openssl-0.9.8l/crypto/pqueue/pqueue.c	2005-06-28 09:53:33.000000000 -0300
++++ openssl-0.9.8l-CVE-2009-1377/crypto/pqueue/pqueue.c	2009-11-10 13:19:42.000000000 -0300
+@@ -234,3 +234,17 @@
+ 
+ 	return ret;
+ 	}
++
++int
++pqueue_size(pqueue_s *pq)
++{
++	pitem *item = pq->items;
++	int count = 0;
++	
++	while(item != NULL)
++	{
++		count++;
++		item = item->next;
++	}
++	return count;
++}
+diff -Nura openssl-0.9.8l/crypto/pqueue/pqueue.h openssl-0.9.8l-CVE-2009-1377/crypto/pqueue/pqueue.h
+--- openssl-0.9.8l/crypto/pqueue/pqueue.h	2005-05-30 19:34:27.000000000 -0300
++++ openssl-0.9.8l-CVE-2009-1377/crypto/pqueue/pqueue.h	2009-11-10 13:19:42.000000000 -0300
+@@ -91,5 +91,6 @@
+ pitem *pqueue_next(piterator *iter);
+ 
+ void   pqueue_print(pqueue pq);
++int    pqueue_size(pqueue pq);
+ 
+ #endif /* ! HEADER_PQUEUE_H */
+diff -Nura openssl-0.9.8l/ssl/d1_pkt.c openssl-0.9.8l-CVE-2009-1377/ssl/d1_pkt.c
+--- openssl-0.9.8l/ssl/d1_pkt.c	2009-11-05 12:21:28.000000000 -0300
++++ openssl-0.9.8l-CVE-2009-1377/ssl/d1_pkt.c	2009-11-10 13:19:42.000000000 -0300
+@@ -167,6 +167,10 @@
+     DTLS1_RECORD_DATA *rdata;
+ 	pitem *item;
+ 
++	/* Limit the size of the queue to prevent DOS attacks */
++	if (pqueue_size(queue->q) >= 100)
++		return 0;
++		
+ 	rdata = OPENSSL_malloc(sizeof(DTLS1_RECORD_DATA));
+ 	item = pitem_new(priority, rdata);
+ 	if (rdata == NULL || item == NULL)
diff --git a/package/openssl/openssl-CVE-2009-1378.patch b/package/openssl/openssl-CVE-2009-1378.patch
new file mode 100644
index 0000000..dba1b39
--- /dev/null
+++ b/package/openssl/openssl-CVE-2009-1378.patch
@@ -0,0 +1,21 @@
+diff -Nura openssl-0.9.8l/ssl/d1_both.c openssl-0.9.8l-CVE-2009-1378/ssl/d1_both.c
+--- openssl-0.9.8l/ssl/d1_both.c	2007-10-17 18:17:49.000000000 -0300
++++ openssl-0.9.8l-CVE-2009-1378/ssl/d1_both.c	2009-11-10 13:20:02.000000000 -0300
+@@ -561,7 +561,16 @@
+ 	if ((msg_hdr->frag_off+frag_len) > msg_hdr->msg_len)
+ 		goto err;
+ 
+-	if (msg_hdr->seq <= s->d1->handshake_read_seq)
++	/* Try to find item in queue, to prevent duplicate entries */
++	pq_64bit_init(&seq64);
++	pq_64bit_assign_word(&seq64, msg_hdr->seq);
++	item = pqueue_find(s->d1->buffered_messages, seq64);
++	pq_64bit_free(&seq64);
++	
++	/* Discard the message if sequence number was already there, is
++	 * too far in the future or the fragment is already in the queue */
++	if (msg_hdr->seq <= s->d1->handshake_read_seq ||
++		msg_hdr->seq > s->d1->handshake_read_seq + 10 || item != NULL)
+ 		{
+ 		unsigned char devnull [256];
+ 
diff --git a/package/openssl/openssl-CVE-2009-1379.patch b/package/openssl/openssl-CVE-2009-1379.patch
new file mode 100644
index 0000000..e4e05f1
--- /dev/null
+++ b/package/openssl/openssl-CVE-2009-1379.patch
@@ -0,0 +1,20 @@
+diff -Nura openssl-0.9.8l/ssl/d1_both.c openssl-0.9.8l-CVE-2009-1379/ssl/d1_both.c
+--- openssl-0.9.8l/ssl/d1_both.c	2007-10-17 18:17:49.000000000 -0300
++++ openssl-0.9.8l-CVE-2009-1379/ssl/d1_both.c	2009-11-10 13:36:55.000000000 -0300
+@@ -519,6 +519,7 @@
+ 
+ 	if ( s->d1->handshake_read_seq == frag->msg_header.seq)
+ 		{
++		unsigned long frag_len = frag->msg_header.frag_len;
+ 		pqueue_pop(s->d1->buffered_messages);
+ 
+ 		al=dtls1_preprocess_fragment(s,&frag->msg_header,max);
+@@ -536,7 +537,7 @@
+ 		if (al==0)
+ 			{
+ 			*ok = 1;
+-			return frag->msg_header.frag_len;
++			return frag_len;
+ 			}
+ 
+ 		ssl3_send_alert(s,SSL3_AL_FATAL,al);
diff --git a/package/openssl/openssl-ditch.reject.patch b/package/openssl/openssl-ditch.reject.patch
new file mode 100644
index 0000000..b50bf37
--- /dev/null
+++ b/package/openssl/openssl-ditch.reject.patch
@@ -0,0 +1,20 @@
+diff -Nura openssl-0.9.8l/Configure.rej openssl-0.9.8l-ditch-rej/Configure.rej
+--- openssl-0.9.8l/Configure.rej	2009-11-05 09:07:06.000000000 -0300
++++ openssl-0.9.8l-ditch-rej/Configure.rej	1969-12-31 21:00:00.000000000 -0300
+@@ -1,16 +0,0 @@
+-***************
+-*** 162,167 ****
+-  "debug-ben-openbsd","gcc:-DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DPEDANTIC -DDEBUG_SAFESTACK -DOPENSSL_OPENBSD_DEV_CRYPTO -DOPENSSL_NO_ASM -O2 -pedantic -Wall -Wshadow -Werror -pipe::(unknown)::::",
+-  "debug-ben-openbsd-debug","gcc:-DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DPEDANTIC -DDEBUG_SAFESTACK -DOPENSSL_OPENBSD_DEV_CRYPTO -DOPENSSL_NO_ASM -g3 -O2 -pedantic -Wall -Wshadow -Werror -pipe::(unknown)::::",
+-  "debug-ben-debug",	"gcc:$gcc_devteam_warn -DBN_DEBUG -DREF_CHECK -DCONF_DEBUG  -DDEBUG_SAFESTACK -g3 -O2 -pipe::(unknown)::::::",
+-  "debug-ben-strict",	"gcc:-DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DCONST_STRICT -O2 -Wall -Wshadow -Werror -Wpointer-arith -Wcast-qual -Wwrite-strings -pipe::(unknown)::::::",
+-  "debug-rse","cc:-DTERMIOS -DL_ENDIAN -pipe -O -g -ggdb3 -Wall::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}",
+-  "debug-bodo",	"gcc:-DL_ENDIAN -DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DBIO_PAIR_DEBUG -DPEDANTIC -g -march=i486 -pedantic -Wshadow -Wall -Wcast-align -Wstrict-prototypes -Wmissing-prototypes -Wno-long-long -Wundef -Wconversion -pipe::-D_REENTRANT:::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}",
+---- 162,168 ----
+-  "debug-ben-openbsd","gcc:-DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DPEDANTIC -DDEBUG_SAFESTACK -DOPENSSL_OPENBSD_DEV_CRYPTO -DOPENSSL_NO_ASM -O2 -pedantic -Wall -Wshadow -Werror -pipe::(unknown)::::",
+-  "debug-ben-openbsd-debug","gcc:-DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DPEDANTIC -DDEBUG_SAFESTACK -DOPENSSL_OPENBSD_DEV_CRYPTO -DOPENSSL_NO_ASM -g3 -O2 -pedantic -Wall -Wshadow -Werror -pipe::(unknown)::::",
+-  "debug-ben-debug",	"gcc:$gcc_devteam_warn -DBN_DEBUG -DREF_CHECK -DCONF_DEBUG  -DDEBUG_SAFESTACK -g3 -O2 -pipe::(unknown)::::::",
+-+ "debug-ben-no-renegotiation",	"gcc:$gcc_devteam_warn -DBN_DEBUG -DREF_CHECK -DCONF_DEBUG  -DDEBUG_SAFESTACK -DNO_RENEGOTIATION -g3 -O2 -pipe::(unknown)::::::",
+-  "debug-ben-strict",	"gcc:-DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DCONST_STRICT -O2 -Wall -Wshadow -Werror -Wpointer-arith -Wcast-qual -Wwrite-strings -pipe::(unknown)::::::",
+-  "debug-rse","cc:-DTERMIOS -DL_ENDIAN -pipe -O -g -ggdb3 -Wall::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}",
+-  "debug-bodo",	"gcc:-DL_ENDIAN -DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DBIO_PAIR_DEBUG -DPEDANTIC -g -march=i486 -pedantic -Wshadow -Wall -Wcast-align -Wstrict-prototypes -Wmissing-prototypes -Wno-long-long -Wundef -Wconversion -pipe::-D_REENTRANT:::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}",
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index dcfcf4b..1af7d4a 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -3,7 +3,7 @@
 # openssl
 #
 #############################################################
-OPENSSL_VERSION:=0.9.8k
+OPENSSL_VERSION:=0.9.8l
 OPENSSL_SITE:=http://www.openssl.org/source
 
 OPENSSL_TARGET_ARCH=generic32
-- 
1.6.3.3
