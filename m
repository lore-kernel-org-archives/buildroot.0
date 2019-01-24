From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 21:54:49 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/systemd: add
 upstream fix for CVE-2018-16865
Message-ID: <20190124214757.1D3018E69E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b3dd1787204d087b4b55d7a5e23ae530a7f60e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f4d3d62b1014f63c028a1ed1089f533bfb249ccb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ld-set-a-limit-on-the-number-of-fields-1k.patch |  57 +++++++++++
 ...al-remote-verify-entry-length-from-header.patch | 112 +++++++++++++++++++++
 ...ote-set-a-limit-on-the-number-of-fields-i.patch |  81 +++++++++++++++
 3 files changed, 250 insertions(+)

diff --git a/package/systemd/0010-journald-set-a-limit-on-the-number-of-fields-1k.patch b/package/systemd/0010-journald-set-a-limit-on-the-number-of-fields-1k.patch
new file mode 100644
index 0000000000..df1ed806a4
--- /dev/null
+++ b/package/systemd/0010-journald-set-a-limit-on-the-number-of-fields-1k.patch
@@ -0,0 +1,57 @@
+From 052c57f132f04a3cf4148f87561618da1a6908b4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Wed, 5 Dec 2018 22:45:02 +0100
+Subject: [PATCH] journald: set a limit on the number of fields (1k)
+
+We allocate a iovec entry for each field, so with many short entries,
+our memory usage and processing time can be large, even with a relatively
+small message size. Let's refuse overly long entries.
+
+CVE-2018-16865
+https://bugzilla.redhat.com/show_bug.cgi?id=1653861
+
+What from I can see, the problem is not from an alloca, despite what the CVE
+description says, but from the attack multiplication that comes from creating
+many very small iovecs: (void* + size_t) for each three bytes of input message.
+
+[james.hilliard1 at gmail.com: backport from upstream commit
+052c57f132f04a3cf4148f87561618da1a6908b4]
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ src/journal/journald-native.c | 5 +++++
+ src/shared/journal-importer.h | 3 +++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/src/journal/journald-native.c b/src/journal/journald-native.c
+index e86178e..d0fee2a 100644
+--- a/src/journal/journald-native.c
++++ b/src/journal/journald-native.c
+@@ -141,6 +141,11 @@ static int server_process_entry(
+                 }
+ 
+                 /* A property follows */
++                if (n > ENTRY_FIELD_COUNT_MAX) {
++                        log_debug("Received an entry that has more than " STRINGIFY(ENTRY_FIELD_COUNT_MAX) " fields, ignoring entry.");
++                        r = 1;
++                        goto finish;
++                }
+ 
+                 /* n existing properties, 1 new, +1 for _TRANSPORT */
+                 if (!GREEDY_REALLOC(iovec, m,
+diff --git a/src/shared/journal-importer.h b/src/shared/journal-importer.h
+index 53354b7..7914c0c 100644
+--- a/src/shared/journal-importer.h
++++ b/src/shared/journal-importer.h
+@@ -21,6 +21,9 @@
+ #endif
+ #define LINE_CHUNK 8*1024u
+ 
++/* The maximum number of fields in an entry */
++#define ENTRY_FIELD_COUNT_MAX 1024
++
+ struct iovec_wrapper {
+         struct iovec *iovec;
+         size_t size_bytes;
+-- 
+2.7.4
+
diff --git a/package/systemd/0011-journal-remote-verify-entry-length-from-header.patch b/package/systemd/0011-journal-remote-verify-entry-length-from-header.patch
new file mode 100644
index 0000000000..7b74a31d35
--- /dev/null
+++ b/package/systemd/0011-journal-remote-verify-entry-length-from-header.patch
@@ -0,0 +1,112 @@
+From 7fdb237f5473cb8fc2129e57e8a0039526dcb4fd Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Fri, 7 Dec 2018 12:47:14 +0100
+Subject: [PATCH] journal-remote: verify entry length from header
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Calling mhd_respond(), which ulimately calls MHD_queue_response() is
+ineffective at point, becuase MHD_queue_response() immediately returns
+MHD_NO signifying an error, because the connection is in state
+MHD_CONNECTION_CONTINUE_SENT.
+
+As Christian Grothoff kindly explained:
+> You are likely calling MHD_queue_repsonse() too late: once you are
+> receiving upload_data, HTTP forces you to process it all. At this time,
+> MHD has already sent "100 continue" and cannot take it back (hence you
+> get MHD_NO!).
+>
+> In your request handler, the first time when you are called for a
+> connection (and when hence *upload_data_size == 0 and upload_data ==
+> NULL) you must check the content-length header and react (with
+> MHD_queue_response) based on this (to prevent MHD from automatically
+> generating 100 continue).
+
+If we ever encounter this kind of error, print a warning and immediately
+abort the connection. (The alternative would be to keep reading the data,
+but ignore it, and return an error after we get to the end of data.
+That is possible, but of course puts additional load on both the
+sender and reciever, and doesn't seem important enough just to return
+a good error message.)
+
+Note that sending of the error does not work (the connection is always aborted
+when MHD_queue_response is used with MHD_RESPMEM_MUST_FREE, as in this case)
+with lib??httpd 0.59, but works with 0.61:
+https://src.fedoraproject.org/rpms/libmicrohttpd/pull-request/1
+
+[james.hilliard1 at gmail.com: backport from upstream commit
+7fdb237f5473cb8fc2129e57e8a0039526dcb4fd]
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ src/journal-remote/journal-remote-main.c | 34 ++++++++++++++++++++++----------
+ 1 file changed, 24 insertions(+), 10 deletions(-)
+
+diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journal-remote-main.c
+index e1748cb..8543dba 100644
+--- a/src/journal-remote/journal-remote-main.c
++++ b/src/journal-remote/journal-remote-main.c
+@@ -221,16 +221,14 @@ static int process_http_upload(
+                                    journal_remote_server_global->seal);
+                 if (r == -EAGAIN)
+                         break;
+-                else if (r < 0) {
+-                        log_warning("Failed to process data for connection %p", connection);
++                if (r < 0) {
+                         if (r == -E2BIG)
+-                                return mhd_respondf(connection,
+-                                                    r, MHD_HTTP_PAYLOAD_TOO_LARGE,
+-                                                    "Entry is too large, maximum is " STRINGIFY(DATA_SIZE_MAX) " bytes.");
++                                log_warning_errno(r, "Entry is too above maximum of %u, aborting connection %p.",
++                                                  DATA_SIZE_MAX, connection);
+                         else
+-                                return mhd_respondf(connection,
+-                                                    r, MHD_HTTP_UNPROCESSABLE_ENTITY,
+-                                                    "Processing failed: %m.");
++                                log_warning_errno(r, "Failed to process data, aborting connection %p: %m",
++                                                  connection);
++                        return MHD_NO;
+                 }
+         }
+ 
+@@ -264,6 +262,7 @@ static int request_handler(
+         const char *header;
+         int r, code, fd;
+         _cleanup_free_ char *hostname = NULL;
++        size_t len;
+ 
+         assert(connection);
+         assert(connection_cls);
+@@ -283,12 +282,27 @@ static int request_handler(
+         if (!streq(url, "/upload"))
+                 return mhd_respond(connection, MHD_HTTP_NOT_FOUND, "Not found.");
+ 
+-        header = MHD_lookup_connection_value(connection,
+-                                             MHD_HEADER_KIND, "Content-Type");
++        header = MHD_lookup_connection_value(connection, MHD_HEADER_KIND, "Content-Type");
+         if (!header || !streq(header, "application/vnd.fdo.journal"))
+                 return mhd_respond(connection, MHD_HTTP_UNSUPPORTED_MEDIA_TYPE,
+                                    "Content-Type: application/vnd.fdo.journal is required.");
+ 
++        header = MHD_lookup_connection_value(connection, MHD_HEADER_KIND, "Content-Length");
++        if (!header)
++                return mhd_respond(connection, MHD_HTTP_LENGTH_REQUIRED,
++                                   "Content-Length header is required.");
++        r = safe_atozu(header, &len);
++        if (r < 0)
++                return mhd_respondf(connection, r, MHD_HTTP_LENGTH_REQUIRED,
++                                    "Content-Length: %s cannot be parsed: %m", header);
++
++        if (len > ENTRY_SIZE_MAX)
++                /* When serialized, an entry of maximum size might be slightly larger,
++                 * so this does not correspond exactly to the limit in journald. Oh well.
++                 */
++                return mhd_respondf(connection, 0, MHD_HTTP_PAYLOAD_TOO_LARGE,
++                                    "Payload larger than maximum size of %u bytes", ENTRY_SIZE_MAX);
++
+         {
+                 const union MHD_ConnectionInfo *ci;
+ 
+-- 
+2.7.4
+
diff --git a/package/systemd/0012-journal-remote-set-a-limit-on-the-number-of-fields-i.patch b/package/systemd/0012-journal-remote-set-a-limit-on-the-number-of-fields-i.patch
new file mode 100644
index 0000000000..e0aae98d90
--- /dev/null
+++ b/package/systemd/0012-journal-remote-set-a-limit-on-the-number-of-fields-i.patch
@@ -0,0 +1,81 @@
+From ef4d6abe7c7fab6cbff975b32e76b09feee56074 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Fri, 7 Dec 2018 10:48:10 +0100
+Subject: [PATCH] journal-remote: set a limit on the number of fields in a
+ message
+
+Existing use of E2BIG is replaced with ENOBUFS (entry too long), and E2BIG is
+reused for the new error condition (too many fields).
+
+This matches the change done for systemd-journald, hence forming the second
+part of the fix for CVE-2018-16865
+(https://bugzilla.redhat.com/show_bug.cgi?id=1653861).
+
+[james.hilliard1 at gmail.com: backport from upstream commit
+ef4d6abe7c7fab6cbff975b32e76b09feee56074]
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ src/journal-remote/journal-remote-main.c | 7 +++++--
+ src/journal-remote/journal-remote.c      | 3 +++
+ src/shared/journal-importer.c            | 5 ++++-
+ 3 files changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journal-remote-main.c
+index 8543dba..802c3ea 100644
+--- a/src/journal-remote/journal-remote-main.c
++++ b/src/journal-remote/journal-remote-main.c
+@@ -222,9 +222,12 @@ static int process_http_upload(
+                 if (r == -EAGAIN)
+                         break;
+                 if (r < 0) {
+-                        if (r == -E2BIG)
+-                                log_warning_errno(r, "Entry is too above maximum of %u, aborting connection %p.",
++                        if (r == -ENOBUFS)
++                                log_warning_errno(r, "Entry is above the maximum of %u, aborting connection %p.",
+                                                   DATA_SIZE_MAX, connection);
++                        else if (r == -E2BIG)
++                                log_warning_errno(r, "Entry with more fields than the maximum of %u, aborting connection %p.",
++                                                  ENTRY_FIELD_COUNT_MAX, connection);
+                         else
+                                 log_warning_errno(r, "Failed to process data, aborting connection %p: %m",
+                                                   connection);
+diff --git a/src/journal-remote/journal-remote.c b/src/journal-remote/journal-remote.c
+index 3c0916c..1da32c5 100644
+--- a/src/journal-remote/journal-remote.c
++++ b/src/journal-remote/journal-remote.c
+@@ -407,6 +407,9 @@ int journal_remote_handle_raw_source(
+                 log_debug("%zu active sources remaining", s->active);
+                 return 0;
+         } else if (r == -E2BIG) {
++                log_notice("Entry with too many fields, skipped");
++                return 1;
++        } else if (r == -ENOBUFS) {
+                 log_notice("Entry too big, skipped");
+                 return 1;
+         } else if (r == -EAGAIN) {
+diff --git a/src/shared/journal-importer.c b/src/shared/journal-importer.c
+index b0e6192..8638cd3 100644
+--- a/src/shared/journal-importer.c
++++ b/src/shared/journal-importer.c
+@@ -23,6 +23,9 @@ enum {
+ };
+ 
+ static int iovw_put(struct iovec_wrapper *iovw, void* data, size_t len) {
++        if (iovw->count >= ENTRY_FIELD_COUNT_MAX)
++                return -E2BIG;
++
+         if (!GREEDY_REALLOC(iovw->iovec, iovw->size_bytes, iovw->count + 1))
+                 return log_oom();
+ 
+@@ -97,7 +100,7 @@ static int get_line(JournalImporter *imp, char **line, size_t *size) {
+ 
+                 imp->scanned = imp->filled;
+                 if (imp->scanned >= DATA_SIZE_MAX)
+-                        return log_error_errno(SYNTHETIC_ERRNO(E2BIG),
++                        return log_error_errno(SYNTHETIC_ERRNO(ENOBUFS),
+                                                "Entry is bigger than %u bytes.",
+                                                DATA_SIZE_MAX);
+ 
+-- 
+2.7.4
+
