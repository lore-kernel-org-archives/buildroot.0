From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Jul 2014 14:29:40 +0200
Subject: [Buildroot] [git commit] busybox: fix interaction with version
	selection removal and lzo fix
Message-ID: <20140712122952.358219D213@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f28b7011f748886fc4275cce2cd492711dfd6a07
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The fix for the LZO issue in Busybox was merged between the moment the
patch removing the Busybox version selection was posted and
merged. This patch adjusts the Busybox patches to take into account
this issue: it removes the LZO patches for the no-longer existing
Busybox versions, and moves the LZO fix for the 1.22.1 Busybox version
as appropriate.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../0006-lzop-add-overflow-check.patch             |    0
 .../1.19.4/0001-lzop-add-overflow-check.patch      |   66 --------------------
 .../1.20.2/0001-lzop-add-overflow-check.patch      |   66 --------------------
 .../1.21.1/0004-lzop-add-overflow-check.patch      |   66 --------------------
 4 files changed, 0 insertions(+), 198 deletions(-)

diff --git a/package/busybox/1.22.1/0006-lzop-add-overflow-check.patch b/package/busybox/0006-lzop-add-overflow-check.patch
similarity index 100%
rename from package/busybox/1.22.1/0006-lzop-add-overflow-check.patch
rename to package/busybox/0006-lzop-add-overflow-check.patch
diff --git a/package/busybox/1.19.4/0001-lzop-add-overflow-check.patch b/package/busybox/1.19.4/0001-lzop-add-overflow-check.patch
deleted file mode 100644
index d3f6c67..0000000
--- a/package/busybox/1.19.4/0001-lzop-add-overflow-check.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From a9dc7c2f59dc5e92870d2d46316ea5c1f14740e3 Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Mon, 30 Jun 2014 10:14:34 +0200
-Subject: [PATCH] lzop: add overflow check
-
-See CVE-2014-4607
-http://www.openwall.com/lists/oss-security/2014/06/26/20
-
-function                                             old     new   delta
-lzo1x_decompress_safe                               1010    1031     +21
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
----
- archival/libarchive/liblzo.h  | 2 ++
- archival/libarchive/lzo1x_d.c | 3 +++
- 2 files changed, 5 insertions(+)
-
-diff --git a/archival/libarchive/liblzo.h b/archival/libarchive/liblzo.h
-index 843997c..4596620 100644
---- a/archival/libarchive/liblzo.h
-+++ b/archival/libarchive/liblzo.h
-@@ -76,11 +76,13 @@
- #    define TEST_IP             (ip < ip_end)
- #    define NEED_IP(x) \
-             if ((unsigned)(ip_end - ip) < (unsigned)(x))  goto input_overrun
-+#    define TEST_IV(x)          if ((x) > (unsigned)0 - (511)) goto input_overrun
- 
- #    undef TEST_OP              /* don't need both of the tests here */
- #    define TEST_OP             1
- #    define NEED_OP(x) \
-             if ((unsigned)(op_end - op) < (unsigned)(x))  goto output_overrun
-+#    define TEST_OV(x)          if ((x) > (unsigned)0 - (511)) goto output_overrun
- 
- #define HAVE_ANY_OP 1
- 
-diff --git a/archival/libarchive/lzo1x_d.c b/archival/libarchive/lzo1x_d.c
-index 9bc1270..40b167e 100644
---- a/archival/libarchive/lzo1x_d.c
-+++ b/archival/libarchive/lzo1x_d.c
-@@ -92,6 +92,7 @@ int lzo1x_decompress_safe(const uint8_t* in, unsigned in_len,
- 				ip++;
- 				NEED_IP(1);
- 			}
-+			TEST_IV(t);
- 			t += 15 + *ip++;
- 		}
- 		/* copy literals */
-@@ -224,6 +225,7 @@ int lzo1x_decompress_safe(const uint8_t* in, unsigned in_len,
- 						ip++;
- 						NEED_IP(1);
- 					}
-+					TEST_IV(t);
- 					t += 31 + *ip++;
- 				}
- #if defined(COPY_DICT)
-@@ -265,6 +267,7 @@ int lzo1x_decompress_safe(const uint8_t* in, unsigned in_len,
- 						ip++;
- 						NEED_IP(1);
- 					}
-+					TEST_IV(t);
- 					t += 7 + *ip++;
- 				}
- #if defined(COPY_DICT)
--- 
-1.8.5.5
-
diff --git a/package/busybox/1.20.2/0001-lzop-add-overflow-check.patch b/package/busybox/1.20.2/0001-lzop-add-overflow-check.patch
deleted file mode 100644
index d3f6c67..0000000
--- a/package/busybox/1.20.2/0001-lzop-add-overflow-check.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From a9dc7c2f59dc5e92870d2d46316ea5c1f14740e3 Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Mon, 30 Jun 2014 10:14:34 +0200
-Subject: [PATCH] lzop: add overflow check
-
-See CVE-2014-4607
-http://www.openwall.com/lists/oss-security/2014/06/26/20
-
-function                                             old     new   delta
-lzo1x_decompress_safe                               1010    1031     +21
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
----
- archival/libarchive/liblzo.h  | 2 ++
- archival/libarchive/lzo1x_d.c | 3 +++
- 2 files changed, 5 insertions(+)
-
-diff --git a/archival/libarchive/liblzo.h b/archival/libarchive/liblzo.h
-index 843997c..4596620 100644
---- a/archival/libarchive/liblzo.h
-+++ b/archival/libarchive/liblzo.h
-@@ -76,11 +76,13 @@
- #    define TEST_IP             (ip < ip_end)
- #    define NEED_IP(x) \
-             if ((unsigned)(ip_end - ip) < (unsigned)(x))  goto input_overrun
-+#    define TEST_IV(x)          if ((x) > (unsigned)0 - (511)) goto input_overrun
- 
- #    undef TEST_OP              /* don't need both of the tests here */
- #    define TEST_OP             1
- #    define NEED_OP(x) \
-             if ((unsigned)(op_end - op) < (unsigned)(x))  goto output_overrun
-+#    define TEST_OV(x)          if ((x) > (unsigned)0 - (511)) goto output_overrun
- 
- #define HAVE_ANY_OP 1
- 
-diff --git a/archival/libarchive/lzo1x_d.c b/archival/libarchive/lzo1x_d.c
-index 9bc1270..40b167e 100644
---- a/archival/libarchive/lzo1x_d.c
-+++ b/archival/libarchive/lzo1x_d.c
-@@ -92,6 +92,7 @@ int lzo1x_decompress_safe(const uint8_t* in, unsigned in_len,
- 				ip++;
- 				NEED_IP(1);
- 			}
-+			TEST_IV(t);
- 			t += 15 + *ip++;
- 		}
- 		/* copy literals */
-@@ -224,6 +225,7 @@ int lzo1x_decompress_safe(const uint8_t* in, unsigned in_len,
- 						ip++;
- 						NEED_IP(1);
- 					}
-+					TEST_IV(t);
- 					t += 31 + *ip++;
- 				}
- #if defined(COPY_DICT)
-@@ -265,6 +267,7 @@ int lzo1x_decompress_safe(const uint8_t* in, unsigned in_len,
- 						ip++;
- 						NEED_IP(1);
- 					}
-+					TEST_IV(t);
- 					t += 7 + *ip++;
- 				}
- #if defined(COPY_DICT)
--- 
-1.8.5.5
-
diff --git a/package/busybox/1.21.1/0004-lzop-add-overflow-check.patch b/package/busybox/1.21.1/0004-lzop-add-overflow-check.patch
deleted file mode 100644
index d3f6c67..0000000
--- a/package/busybox/1.21.1/0004-lzop-add-overflow-check.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From a9dc7c2f59dc5e92870d2d46316ea5c1f14740e3 Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Mon, 30 Jun 2014 10:14:34 +0200
-Subject: [PATCH] lzop: add overflow check
-
-See CVE-2014-4607
-http://www.openwall.com/lists/oss-security/2014/06/26/20
-
-function                                             old     new   delta
-lzo1x_decompress_safe                               1010    1031     +21
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
----
- archival/libarchive/liblzo.h  | 2 ++
- archival/libarchive/lzo1x_d.c | 3 +++
- 2 files changed, 5 insertions(+)
-
-diff --git a/archival/libarchive/liblzo.h b/archival/libarchive/liblzo.h
-index 843997c..4596620 100644
---- a/archival/libarchive/liblzo.h
-+++ b/archival/libarchive/liblzo.h
-@@ -76,11 +76,13 @@
- #    define TEST_IP             (ip < ip_end)
- #    define NEED_IP(x) \
-             if ((unsigned)(ip_end - ip) < (unsigned)(x))  goto input_overrun
-+#    define TEST_IV(x)          if ((x) > (unsigned)0 - (511)) goto input_overrun
- 
- #    undef TEST_OP              /* don't need both of the tests here */
- #    define TEST_OP             1
- #    define NEED_OP(x) \
-             if ((unsigned)(op_end - op) < (unsigned)(x))  goto output_overrun
-+#    define TEST_OV(x)          if ((x) > (unsigned)0 - (511)) goto output_overrun
- 
- #define HAVE_ANY_OP 1
- 
-diff --git a/archival/libarchive/lzo1x_d.c b/archival/libarchive/lzo1x_d.c
-index 9bc1270..40b167e 100644
---- a/archival/libarchive/lzo1x_d.c
-+++ b/archival/libarchive/lzo1x_d.c
-@@ -92,6 +92,7 @@ int lzo1x_decompress_safe(const uint8_t* in, unsigned in_len,
- 				ip++;
- 				NEED_IP(1);
- 			}
-+			TEST_IV(t);
- 			t += 15 + *ip++;
- 		}
- 		/* copy literals */
-@@ -224,6 +225,7 @@ int lzo1x_decompress_safe(const uint8_t* in, unsigned in_len,
- 						ip++;
- 						NEED_IP(1);
- 					}
-+					TEST_IV(t);
- 					t += 31 + *ip++;
- 				}
- #if defined(COPY_DICT)
-@@ -265,6 +267,7 @@ int lzo1x_decompress_safe(const uint8_t* in, unsigned in_len,
- 						ip++;
- 						NEED_IP(1);
- 					}
-+					TEST_IV(t);
- 					t += 7 + *ip++;
- 				}
- #if defined(COPY_DICT)
--- 
-1.8.5.5
-
