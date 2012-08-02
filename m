From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:24 -0000
Subject: [Buildroot] [git commit branch/next] lttng-tools: bump to version
	2.0.1
Message-ID: <20120802195240.DC77588D21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fb5d605638c359d008329dd9f8fb6c2c8a2c0537
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also update the sync_file_range patch.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...ls-2.0-pre15-no-sync-file-range-in-uclibc.patch |   87 --------------------
 .../lttng-tools-no-sync-file-range-in-uclibc.patch |   50 +++++++++++
 package/lttng-tools/lttng-tools.mk                 |    9 ++-
 3 files changed, 57 insertions(+), 89 deletions(-)

diff --git a/package/lttng-tools/lttng-tools-2.0-pre15-no-sync-file-range-in-uclibc.patch b/package/lttng-tools/lttng-tools-2.0-pre15-no-sync-file-range-in-uclibc.patch
deleted file mode 100644
index 861686b..0000000
--- a/package/lttng-tools/lttng-tools-2.0-pre15-no-sync-file-range-in-uclibc.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-Make sync_file_range() usage optional
-
-Under uClibc, sync_file_range() is not available under all
-architectures, so we fall back to fdatasync() in this case.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: lttng-tools-2.0-pre15/configure.ac
-===================================================================
---- lttng-tools-2.0-pre15.orig/configure.ac	2012-02-01 16:31:31.140978817 +0100
-+++ lttng-tools-2.0-pre15/configure.ac	2012-02-01 16:31:42.110783708 +0100
-@@ -96,7 +96,7 @@
- 
- AM_CONDITIONAL([HAVE_LIBLTTNG_UST_CTL], [ test "x$ac_cv_lib_lttng_ust_ctl_ustctl_create_session" = "xyes" ])
- 
--AC_CHECK_FUNCS([sched_getcpu sysconf])
-+AC_CHECK_FUNCS([sched_getcpu sysconf sync_file_range])
- 
- # Option to only build the consumer daemon and its libraries
- AC_ARG_WITH([consumerd-only],
-Index: lttng-tools-2.0-pre15/liblttng-consumer/lttng-consumer.c
-===================================================================
---- lttng-tools-2.0-pre15.orig/liblttng-consumer/lttng-consumer.c	2012-02-01 16:36:00.876292596 +0100
-+++ lttng-tools-2.0-pre15/liblttng-consumer/lttng-consumer.c	2012-02-01 16:36:23.435901163 +0100
-@@ -527,11 +527,15 @@
- 	if (orig_offset < stream->chan->max_sb_size) {
- 		return;
- 	}
-+#ifdef HAVE_SYNC_FILE_RANGE
- 	sync_file_range(outfd, orig_offset - stream->chan->max_sb_size,
- 			stream->chan->max_sb_size,
- 			SYNC_FILE_RANGE_WAIT_BEFORE
- 			| SYNC_FILE_RANGE_WRITE
- 			| SYNC_FILE_RANGE_WAIT_AFTER);
-+#else
-+	fdatasync(outfd);
-+#endif
- 	/*
- 	 * Give hints to the kernel about how we access the file:
- 	 * POSIX_FADV_DONTNEED : we won't re-access data in a near future after
-Index: lttng-tools-2.0-pre15/liblttng-kconsumer/lttng-kconsumer.c
-===================================================================
---- lttng-tools-2.0-pre15.orig/liblttng-kconsumer/lttng-kconsumer.c	2012-02-01 16:36:36.215679416 +0100
-+++ lttng-tools-2.0-pre15/liblttng-kconsumer/lttng-kconsumer.c	2012-02-01 16:59:08.622203348 +0100
-@@ -71,8 +71,12 @@
- 			goto end;
- 		}
- 		/* This won't block, but will start writeout asynchronously */
-+#ifdef HAVE_SYNC_FILE_RANGE
- 		sync_file_range(outfd, stream->out_fd_offset, ret,
- 				SYNC_FILE_RANGE_WRITE);
-+#else
-+		fdatasync(outfd);
-+#endif
- 		stream->out_fd_offset += ret;
- 	}
- 
-@@ -121,8 +125,12 @@
- 		}
- 		len -= ret;
- 		/* This won't block, but will start writeout asynchronously */
-+#ifdef HAVE_SYNC_FILE_RANGE
- 		sync_file_range(outfd, stream->out_fd_offset, ret,
- 				SYNC_FILE_RANGE_WRITE);
-+#else
-+		fdatasync(outfd);
-+#endif
- 		stream->out_fd_offset += ret;
- 	}
- 	lttng_consumer_sync_trace_file(stream, orig_offset);
-Index: lttng-tools-2.0-pre15/liblttng-ustconsumer/lttng-ustconsumer.c
-===================================================================
---- lttng-tools-2.0-pre15.orig/liblttng-ustconsumer/lttng-ustconsumer.c	2012-02-01 16:37:11.495067263 +0100
-+++ lttng-tools-2.0-pre15/liblttng-ustconsumer/lttng-ustconsumer.c	2012-02-01 16:37:31.224724916 +0100
-@@ -70,8 +70,12 @@
- 			goto end;
- 		}
- 		/* This won't block, but will start writeout asynchronously */
-+#ifdef HAVE_SYNC_FILE_RANGE
- 		sync_file_range(outfd, stream->out_fd_offset, ret,
- 				SYNC_FILE_RANGE_WRITE);
-+#else
-+		fdatasync(outfd);
-+#endif
- 		stream->out_fd_offset += ret;
- 	}
- 
diff --git a/package/lttng-tools/lttng-tools-no-sync-file-range-in-uclibc.patch b/package/lttng-tools/lttng-tools-no-sync-file-range-in-uclibc.patch
new file mode 100644
index 0000000..3a1807e
--- /dev/null
+++ b/package/lttng-tools/lttng-tools-no-sync-file-range-in-uclibc.patch
@@ -0,0 +1,50 @@
+Make sync_file_range() usage optional
+
+Under uClibc, sync_file_range() is not available under all
+architectures, so we fall back to fdatasync() in this case.
+
+Inspired by the patch done by Thomas Petazzoni for the
+2.0-pre25 version.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ configure.ac              |    2 +-
+ src/common/compat/fcntl.h |    5 +++++
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5808c79..065b9cf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -120,7 +120,7 @@ AS_IF([test "x$lttng_ust_support" = "xyes"], [
+
+ AM_CONDITIONAL([HAVE_LIBLTTNG_UST_CTL], [ test "x$ac_cv_lib_lttng_ust_ctl_ustctl_create_session" = "xyes" ])
+
+-AC_CHECK_FUNCS([sched_getcpu sysconf])
++AC_CHECK_FUNCS([sched_getcpu sysconf sync_file_range])
+
+ # check for dlopen
+ AC_CHECK_LIB([dl], [dlopen],
+diff --git a/src/common/compat/fcntl.h b/src/common/compat/fcntl.h
+index 58c1579..dafb33e 100644
+--- a/src/common/compat/fcntl.h
++++ b/src/common/compat/fcntl.h
+@@ -23,10 +23,15 @@
+
+ #ifdef __linux__
+
++#if defined(HAVE_SYNC_FILE_RANGE)
+ extern int compat_sync_file_range(int fd, off64_t offset, off64_t nbytes,
+ 		unsigned int flags);
+ #define lttng_sync_file_range(fd, offset, nbytes, flags) \
+ 	compat_sync_file_range(fd, offset, nbytes, flags)
++#else
++#define lttng_sync_file_range(fd, offset, nbytes, flags) \
++	fdatasync(fd);
++#endif
+
+ #elif defined(__FreeBSD__)
+
+--
+1.7.10
+
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 8e6fc1a..cd9a0be 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -1,5 +1,10 @@
-LTTNG_TOOLS_VERSION = 2.0-pre15
-LTTNG_TOOLS_SITE    = http://lttng.org/files/bundles/20111214/
+#############################################################
+#
+# LTTng-Tools: the trace control client
+#
+#############################################################
+LTTNG_TOOLS_VERSION = 2.0.1
+LTTNG_TOOLS_SITE    = http://lttng.org/files/lttng-tools/
 LTTNG_TOOLS_SOURCE  = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 
 # The host-lttng-babeltrace technically isn't a required build
