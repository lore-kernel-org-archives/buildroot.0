From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Nov 2018 23:04:06 +0100
Subject: [Buildroot] [git commit] bind: security bump to version 9.11.5
Message-ID: <20181107220149.19B28815BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=955df7463b0747620b744e19a78cfc84e1c99965
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2018-5738: Some versions of BIND can improperly permit recursive query
  service to unauthorized clients

- CVE-2018-5740: A flaw in the "deny-answer-aliases" feature can cause an
  INSIST assertion failure in named

For more details, see the release notes:

https://ftp.isc.org/isc/bind9/9.11.5/RELEASE-NOTES-bind-9.11.5.html

Drop patch 0003-Rename-ptrsize-to-ptr_size.patch as the uClibc-ng issue was
fixed upstream in commit 931fd627f6195 (mips: fix clashing symbols), which
is included in uclibc-1.0.12 (January 2016).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../bind/{0002-cross.patch => 0001-cross.patch}    |  0
 package/bind/0003-Rename-ptrsize-to-ptr_size.patch | 74 ----------------------
 package/bind/bind.hash                             |  4 +-
 package/bind/bind.mk                               |  2 +-
 4 files changed, 3 insertions(+), 77 deletions(-)

diff --git a/package/bind/0002-cross.patch b/package/bind/0001-cross.patch
similarity index 100%
rename from package/bind/0002-cross.patch
rename to package/bind/0001-cross.patch
diff --git a/package/bind/0003-Rename-ptrsize-to-ptr_size.patch b/package/bind/0003-Rename-ptrsize-to-ptr_size.patch
deleted file mode 100644
index e3b58e202d..0000000000
--- a/package/bind/0003-Rename-ptrsize-to-ptr_size.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 254dc19788ba2a03504fc6d1036fef477a60035f Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Fri, 22 Jan 2016 08:31:02 -0300
-Subject: [PATCH] Rename ptrsize to ptr_size
-
-This is to compensate for a uClibc mess caused by commit
-70a04a287a2875c82e6822c36e071afba5b63a62 where ptrsize is defined for
-mips, hence causing build breakage under certain conditions for programs
-that use this variable name.
-
-Status: definitely not upstreamable.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- lib/dns/rbt.c   | 6 +++---
- lib/dns/rbtdb.c | 4 ++--
- 2 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/lib/dns/rbt.c b/lib/dns/rbt.c
-index 86b5183..5fd55de 100644
---- a/lib/dns/rbt.c
-+++ b/lib/dns/rbt.c
-@@ -113,7 +113,7 @@ struct file_header {
- 	 * information about the system on which the map file was generated
- 	 * will be used to tell if we can load the map file or not
- 	 */
--	isc_uint32_t ptrsize;
-+	isc_uint32_t ptr_size;
- 	unsigned int bigendian:1;	/* big or little endian system */
- 	unsigned int rdataset_fixed:1;	/* compiled with --enable-rrset-fixed */
- 	unsigned int nodecount;		/* shadow from rbt structure */
-@@ -517,7 +517,7 @@ write_header(FILE *file, dns_rbt_t *rbt, isc_uint64_t first_node_offset,
- 	memmove(header.version1, FILE_VERSION, sizeof(header.version1));
- 	memmove(header.version2, FILE_VERSION, sizeof(header.version2));
- 	header.first_node_offset = first_node_offset;
--	header.ptrsize = (isc_uint32_t) sizeof(void *);
-+	header.ptr_size = (isc_uint32_t) sizeof(void *);
- 	header.bigendian = (1 == htonl(1)) ? 1 : 0;
- 
- #ifdef DNS_RDATASET_FIXED
-@@ -902,7 +902,7 @@ dns_rbt_deserialize_tree(void *base_address, size_t filesize,
- 	}
- #endif
- 
--	if (header->ptrsize != (isc_uint32_t) sizeof(void *)) {
-+	if (header->ptr_size != (isc_uint32_t) sizeof(void *)) {
- 		result = ISC_R_INVALIDFILE;
- 		goto cleanup;
- 	}
-diff --git a/lib/dns/rbtdb.c b/lib/dns/rbtdb.c
-index c7168cb..dbcf944 100644
---- a/lib/dns/rbtdb.c
-+++ b/lib/dns/rbtdb.c
-@@ -114,7 +114,7 @@ typedef struct rbtdb_file_header rbtdb_file_header_t;
- 
- struct rbtdb_file_header {
- 	char version1[32];
--	isc_uint32_t ptrsize;
-+	isc_uint32_t ptr_size;
- 	unsigned int bigendian:1;
- 	isc_uint64_t tree;
- 	isc_uint64_t nsec;
-@@ -7593,7 +7593,7 @@ rbtdb_write_header(FILE *rbtfile, off_t tree_location, off_t nsec_location,
- 	memset(&header, 0, sizeof(rbtdb_file_header_t));
- 	memmove(header.version1, FILE_VERSION, sizeof(header.version1));
- 	memmove(header.version2, FILE_VERSION, sizeof(header.version2));
--	header.ptrsize = (isc_uint32_t) sizeof(void *);
-+	header.ptr_size = (isc_uint32_t) sizeof(void *);
- 	header.bigendian = (1 == htonl(1)) ? 1 : 0;
- 	header.tree = (isc_uint64_t) tree_location;
- 	header.nsec = (isc_uint64_t) nsec_location;
--- 
-2.4.10
-
diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 19d5f61f6d..ea76108cc0 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.11.4-P1/bind-9.11.4-P1.tar.gz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.11.5/bind-9.11.5.tar.gz.asc
 # with key BE0E9748B718253A28BB89FFF1B11BF05CF02E57
-sha256 a85af7b629109d41285c7adeae1515daac638bbe4d5dc30d1f4b343dff09d811 bind-9.11.4-P2.tar.gz
+sha256 a4cae11dad954bdd4eb592178f875bfec09fcc7e29fe0f6b7a4e5b5c6bc61322 bind-9.11.5.tar.gz
 sha256 336f3c40e37a1a13690efb4c63e20908faa4c40498cc02f3579fb67d3a1933a5 COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 95f615bf81..19d9d1cf5c 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.4-P2
+BIND_VERSION = 9.11.5
 BIND_SITE = http://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
