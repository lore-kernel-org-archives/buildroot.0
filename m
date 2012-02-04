From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  4 Feb 2012 15:48:43 +0100
Subject: [Buildroot] [PATCH 2/7] lttng-tools: fix build on uClibc due to
	sync_file_range()
In-Reply-To: <cover.1328366921.git.thomas.petazzoni@free-electrons.com>
References: <cover.1328366921.git.thomas.petazzoni@free-electrons.com>
Message-ID: <cd91ba13b014d9e86a017ab35858badd0a4b69cb.1328366921.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to use fdatasync() instead of sync_file_range() when the
latter is not available.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ls-2.0-pre15-no-sync-file-range-in-uclibc.patch |   87 ++++++++++++++++++++
 package/lttng-tools/lttng-tools.mk                 |    2 +
 2 files changed, 89 insertions(+), 0 deletions(-)
 create mode 100644 package/lttng-tools/lttng-tools-2.0-pre15-no-sync-file-range-in-uclibc.patch

diff --git a/package/lttng-tools/lttng-tools-2.0-pre15-no-sync-file-range-in-uclibc.patch b/package/lttng-tools/lttng-tools-2.0-pre15-no-sync-file-range-in-uclibc.patch
new file mode 100644
index 0000000..861686b
--- /dev/null
+++ b/package/lttng-tools/lttng-tools-2.0-pre15-no-sync-file-range-in-uclibc.patch
@@ -0,0 +1,87 @@
+Make sync_file_range() usage optional
+
+Under uClibc, sync_file_range() is not available under all
+architectures, so we fall back to fdatasync() in this case.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: lttng-tools-2.0-pre15/configure.ac
+===================================================================
+--- lttng-tools-2.0-pre15.orig/configure.ac	2012-02-01 16:31:31.140978817 +0100
++++ lttng-tools-2.0-pre15/configure.ac	2012-02-01 16:31:42.110783708 +0100
+@@ -96,7 +96,7 @@
+ 
+ AM_CONDITIONAL([HAVE_LIBLTTNG_UST_CTL], [ test "x$ac_cv_lib_lttng_ust_ctl_ustctl_create_session" = "xyes" ])
+ 
+-AC_CHECK_FUNCS([sched_getcpu sysconf])
++AC_CHECK_FUNCS([sched_getcpu sysconf sync_file_range])
+ 
+ # Option to only build the consumer daemon and its libraries
+ AC_ARG_WITH([consumerd-only],
+Index: lttng-tools-2.0-pre15/liblttng-consumer/lttng-consumer.c
+===================================================================
+--- lttng-tools-2.0-pre15.orig/liblttng-consumer/lttng-consumer.c	2012-02-01 16:36:00.876292596 +0100
++++ lttng-tools-2.0-pre15/liblttng-consumer/lttng-consumer.c	2012-02-01 16:36:23.435901163 +0100
+@@ -527,11 +527,15 @@
+ 	if (orig_offset < stream->chan->max_sb_size) {
+ 		return;
+ 	}
++#ifdef HAVE_SYNC_FILE_RANGE
+ 	sync_file_range(outfd, orig_offset - stream->chan->max_sb_size,
+ 			stream->chan->max_sb_size,
+ 			SYNC_FILE_RANGE_WAIT_BEFORE
+ 			| SYNC_FILE_RANGE_WRITE
+ 			| SYNC_FILE_RANGE_WAIT_AFTER);
++#else
++	fdatasync(outfd);
++#endif
+ 	/*
+ 	 * Give hints to the kernel about how we access the file:
+ 	 * POSIX_FADV_DONTNEED : we won't re-access data in a near future after
+Index: lttng-tools-2.0-pre15/liblttng-kconsumer/lttng-kconsumer.c
+===================================================================
+--- lttng-tools-2.0-pre15.orig/liblttng-kconsumer/lttng-kconsumer.c	2012-02-01 16:36:36.215679416 +0100
++++ lttng-tools-2.0-pre15/liblttng-kconsumer/lttng-kconsumer.c	2012-02-01 16:59:08.622203348 +0100
+@@ -71,8 +71,12 @@
+ 			goto end;
+ 		}
+ 		/* This won't block, but will start writeout asynchronously */
++#ifdef HAVE_SYNC_FILE_RANGE
+ 		sync_file_range(outfd, stream->out_fd_offset, ret,
+ 				SYNC_FILE_RANGE_WRITE);
++#else
++		fdatasync(outfd);
++#endif
+ 		stream->out_fd_offset += ret;
+ 	}
+ 
+@@ -121,8 +125,12 @@
+ 		}
+ 		len -= ret;
+ 		/* This won't block, but will start writeout asynchronously */
++#ifdef HAVE_SYNC_FILE_RANGE
+ 		sync_file_range(outfd, stream->out_fd_offset, ret,
+ 				SYNC_FILE_RANGE_WRITE);
++#else
++		fdatasync(outfd);
++#endif
+ 		stream->out_fd_offset += ret;
+ 	}
+ 	lttng_consumer_sync_trace_file(stream, orig_offset);
+Index: lttng-tools-2.0-pre15/liblttng-ustconsumer/lttng-ustconsumer.c
+===================================================================
+--- lttng-tools-2.0-pre15.orig/liblttng-ustconsumer/lttng-ustconsumer.c	2012-02-01 16:37:11.495067263 +0100
++++ lttng-tools-2.0-pre15/liblttng-ustconsumer/lttng-ustconsumer.c	2012-02-01 16:37:31.224724916 +0100
+@@ -70,8 +70,12 @@
+ 			goto end;
+ 		}
+ 		/* This won't block, but will start writeout asynchronously */
++#ifdef HAVE_SYNC_FILE_RANGE
+ 		sync_file_range(outfd, stream->out_fd_offset, ret,
+ 				SYNC_FILE_RANGE_WRITE);
++#else
++		fdatasync(outfd);
++#endif
+ 		stream->out_fd_offset += ret;
+ 	}
+ 
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 9e87480..bcf2f67 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -8,4 +8,6 @@ LTTNG_TOOLS_SOURCE  = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 # trace format into an human readable format.
 LTTNG_TOOLS_DEPENDENCIES = liburcu popt host-lttng-babeltrace lttng-libust
 
+LTTNG_AUTORECONF = YES
+
 $(eval $(call AUTOTARGETS))
-- 
1.7.4.1
