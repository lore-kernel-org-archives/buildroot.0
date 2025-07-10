Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E963C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6504A6072A;
	Fri, 11 Jul 2025 10:22:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xoiqgu72ZGMz; Fri, 11 Jul 2025 10:22:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B24861480
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B24861480;
	Fri, 11 Jul 2025 10:22:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E2061E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CBA140E9E
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HnMskyBqK5IM for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:21:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6966B40DEA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6966B40DEA
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6752186337; Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 11:39:04 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: aab7ddec16a664122b1cb9734bd99c5363974bb2
X-Git-Newrev: a073d51398fb0691cf53b5608a9b487a4b60afb5
X-Patchwork-Hint: ignore
Message-Id: <20250711102104.6752186337@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/libsoup: add many
 security patches
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a073d51398fb0691cf53b5608a9b487a4b60afb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Import all security patches from OpenEmbedded for libsoup.
This fixes the following 18 known vulnerabilities:

- CVE-2024-52530:
    GNOME libsoup before 3.6.0 allows HTTP request smuggling in some
    configurations because '\0' characters at the end of header names are
    ignored, i.e., a "Transfer-Encoding\0: chunked" header is treated the
    same as a "Transfer-Encoding: chunked" header.
    https://www.cve.org/CVERecord?id=CVE-2024-52530

- CVE-2024-52531:
    GNOME libsoup before 3.6.1 allows a buffer overflow in applications that
    perform conversion to UTF-8 in soup_header_parse_param_list_strict.
    There is a plausible way to reach this remotely via
    soup_message_headers_get_content_type (e.g., an application may want to
    retrieve the content type of a request or response).
    https://www.cve.org/CVERecord?id=CVE-2024-52531

- CVE-2024-52532:
    GNOME libsoup before 3.6.1 has an infinite loop, and memory consumption.
    During the reading of certain patterns of WebSocket data from clients.
    https://www.cve.org/CVERecord?id=CVE-2024-52532

- CVE-2025-2784:
    Libsoup: heap buffer over-read in `skip_insignificant_space`
    when sniffing content
    https://www.cve.org/CVERecord?id=CVE-2025-2784

- CVE-2025-4476:
    Libsoup: null pointer dereference in libsoup may lead to denial of service
    https://www.cve.org/CVERecord?id=CVE-2025-4476

- CVE-2025-4948:
    Libsoup: integer underflow in soup_multipart_new_from_message() leading to
    denial of service in libsoup
    https://www.cve.org/CVERecord?id=CVE-2025-4948

- CVE-2025-4969:
    Libsoup: off-by-one out-of-bounds read in find_boundary() in soup-multipart.c
    https://www.cve.org/CVERecord?id=CVE-2025-4969

- CVE-2025-32050:
    Libsoup: integer overflow in append_param_quoted
    https://www.cve.org/CVERecord?id=CVE-2025-32050

- CVE-2025-32052:
    Libsoup: heap buffer overflow in sniff_unknown()
    https://www.cve.org/CVERecord?id=CVE-2025-32052

- CVE-2025-32053:
    Libsoup: heap buffer overflows in sniff_feed_or_html() and
    skip_insignificant_space()
    https://www.cve.org/CVERecord?id=CVE-2025-32053

- CVE-2025-32906:
    Libsoup: out of bounds reads in soup_headers_parse_request()
    https://www.cve.org/CVERecord?id=CVE-2025-32906

- CVE-2025-32910:
    Libsoup: null pointer deference on libsoup via /auth/soup-auth-digest.c
    through "soup_auth_digest_authenticate" on client when server omits the
    "realm" parameter in an unauthorized response with digest authentication
    https://www.cve.org/CVERecord?id=CVE-2025-32910

- CVE-2025-32911:
    Libsoup: double free on soup_message_headers_get_content_disposition()
    through "soup-message-headers.c" via "params" ghashtable value
    https://www.cve.org/CVERecord?id=CVE-2025-32911

- CVE-2025-32912:
    Libsoup: null pointer dereference in client when server omits the "nonce"
    parameter in an unauthorized response with digest authentication
    https://www.cve.org/CVERecord?id=CVE-2025-32912

- CVE-2025-32913:
    Libsoup: null pointer dereference in
    soup_message_headers_get_content_disposition when "filename" parameter is
    present, but has no value in content-disposition header
    https://www.cve.org/CVERecord?id=CVE-2025-32913

- CVE-2025-32914:
    Libsoup: oob read on libsoup through function
    "soup_multipart_new_from_message" in soup-multipart.c leads to crash or
    exit of process
    https://www.cve.org/CVERecord?id=CVE-2025-32914

- CVE-2025-46420:
    Libsoup: memory leak on soup_header_parse_quality_list() via soup-headers.c
    https://www.cve.org/CVERecord?id=CVE-2025-46420

- CVE-2025-46421:
    Libsoup: information disclosure may leads libsoup client sends authorization
    header to a different host when being redirected by a server
    https://www.cve.org/CVERecord?id=CVE-2025-46421

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit eee0f6c078e192c7cd66394fb0b58e96cb645499)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0003-sniffer-fix-potential-overflow.patch      |  59 +++++++++
 ...004-headers-Strictly-dont-allow-NUL-bytes.patch |  60 +++++++++
 ...ders-Be-more-robust-against-invalid-input.patch | 136 +++++++++++++++++++++
 ...process-the-frame-as-soon-as-we-read-data.patch |  40 ++++++
 .../0007-Fix-using-int-instead-of-size_t.patch     |  32 +++++
 .../libsoup/0008-Fix-heap-buffer-overflow.patch    |  35 ++++++
 .../libsoup/0009-Fix-heap-buffer-overflow.patch    |  42 +++++++
 ...0010-headers-Handle-parsing-only-newlines.patch |  46 +++++++
 ...11-auth-digest-Handle-missing-realm-nonce.patch |  35 ++++++
 .../0012-auth-digest-Handle-missing-nonce.patch    |  97 +++++++++++++++
 package/libsoup/0013-auth-digest-Fix-leak.patch    |  31 +++++
 package/libsoup/0014-CVE-2025-32911.patch          |  77 ++++++++++++
 .../0015-auth-digest-Handle-missing-nonce.patch    |  35 ++++++
 package/libsoup/0016-CVE-2025-32914.patch          |  38 ++++++
 package/libsoup/0017-auth-digest-fix-crash.patch   |  41 +++++++
 ...8-soup_header_parse_quality_list-Fix-leak.patch |  64 ++++++++++
 ...-session-Strip-authentication-credentials.patch |  50 ++++++++
 ...020-soup-multipart-Verify-boundary-limits.patch |  41 +++++++
 .../0021-soup-multipart-Verify-array-bounds.patch  |  40 ++++++
 package/libsoup/libsoup.mk                         |  37 ++++++
 20 files changed, 1036 insertions(+)

diff --git a/package/libsoup/0003-sniffer-fix-potential-overflow.patch b/package/libsoup/0003-sniffer-fix-potential-overflow.patch
new file mode 100644
index 0000000000..13fa5b7ce2
--- /dev/null
+++ b/package/libsoup/0003-sniffer-fix-potential-overflow.patch
@@ -0,0 +1,59 @@
+From 2eacbd762332795e00692ddab2515c6da23198d3 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 12 May 2025 14:06:41 +0800
+Subject: [PATCH] sniffer: Add better coverage of skip_insignificant_space()
+
+CVE: CVE-2025-2784
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/435/diffs?commit_id=242a10fbb12dbdc12d254bd8fc8669a0ac055304;
+ https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/442/diffs?commit_id=c415ad0b6771992e66c70edf373566c6e247089d]
+
+Test code is not added since it uses some functions not defined in
+version 2.74. These tests are not used now, so just ignore them.
+
+Upstream: https://git.openembedded.org/meta-openembedded/plain/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libsoup/soup-content-sniffer.c |  9 +++----
+ 1 files changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sniffer.c
+index 5f2896e..9554636 100644
+--- a/libsoup/soup-content-sniffer.c
++++ b/libsoup/soup-content-sniffer.c
+@@ -612,8 +612,10 @@ sniff_text_or_binary (SoupContentSniffer *sniffer, SoupBuffer *buffer)
+ }
+ 
+ static gboolean
+-skip_insignificant_space (const char *resource, int *pos, int resource_length)
++skip_insignificant_space (const char *resource, gsize *pos, gsize resource_length)
+ {
++	if (*pos >= resource_length)
++		return TRUE;
+ 	while ((resource[*pos] == '\x09') ||
+ 	       (resource[*pos] == '\x20') ||
+ 	       (resource[*pos] == '\x0A') ||
+@@ -632,7 +634,7 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, SoupBuffer *buffer)
+ {
+ 	const char *resource = (const char *)buffer->data;
+ 	int resource_length = MIN (512, buffer->length);
+-	int pos = 0;
++	gsize pos = 0;
+ 
+ 	if (resource_length < 3)
+ 		goto text_html;
+@@ -642,9 +644,6 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, SoupBuffer *buffer)
+ 		pos = 3;
+ 
+  look_for_tag:
+-	if (pos > resource_length)
+-		goto text_html;
+-
+ 	if (skip_insignificant_space (resource, &pos, resource_length))
+ 		goto text_html;
+
+-- 
+2.34.1
+
diff --git a/package/libsoup/0004-headers-Strictly-dont-allow-NUL-bytes.patch b/package/libsoup/0004-headers-Strictly-dont-allow-NUL-bytes.patch
new file mode 100644
index 0000000000..120358b5fa
--- /dev/null
+++ b/package/libsoup/0004-headers-Strictly-dont-allow-NUL-bytes.patch
@@ -0,0 +1,60 @@
+From 4a2bb98e03d79146c729dca52c8d6edc635218ff Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Mon, 8 Jul 2024 12:33:15 -0500
+Subject: [PATCH] headers: Strictly don't allow NUL bytes
+
+In the past (2015) this was allowed for some problematic sites. However Chromium also does not allow NUL bytes in either header names or values these days. So this should no longer be a problem.
+
+CVE: CVE-2024-52530
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/402/diffs?commit_id=04df03bc092ac20607f3e150936624d4f536e68b]
+
+Upstream: https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+[Titouan: Remove changes on test files]
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libsoup/soup-headers.c      | 15 +++------
+ 1 file changed, 4 insertions(+), 11 deletions(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index eec28ad..e5d3c03 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -50,13 +50,14 @@ soup_headers_parse (const char *str, int len, SoupMessageHeaders *dest)
+ 	 * ignorable trailing whitespace.
+ 	 */
+ 
++	/* No '\0's are allowed */
++	if (memchr (str, '\0', len))
++		return FALSE;
++
+ 	/* Skip over the Request-Line / Status-Line */
+ 	headers_start = memchr (str, '\n', len);
+ 	if (!headers_start)
+ 		return FALSE;
+-	/* No '\0's in the Request-Line / Status-Line */
+-	if (memchr (str, '\0', headers_start - str))
+-		return FALSE;
+ 
+ 	/* We work on a copy of the headers, which we can write '\0's
+ 	 * into, so that we don't have to individually g_strndup and
+@@ -68,14 +69,6 @@ soup_headers_parse (const char *str, int len, SoupMessageHeaders *dest)
+ 	headers_copy[copy_len] = '\0';
+ 	value_end = headers_copy;
+ 
+-	/* There shouldn't be any '\0's in the headers already, but
+-	 * this is the web we're talking about.
+-	 */
+-	while ((p = memchr (headers_copy, '\0', copy_len))) {
+-		memmove (p, p + 1, copy_len - (p - headers_copy));
+-		copy_len--;
+-	}
+-
+ 	while (*(value_end + 1)) {
+ 		name = value_end + 1;
+ 		name_end = strchr (name, ':');
+ 
+-- 
+2.34.1
+
diff --git a/package/libsoup/0005-headers-Be-more-robust-against-invalid-input.patch b/package/libsoup/0005-headers-Be-more-robust-against-invalid-input.patch
new file mode 100644
index 0000000000..0665182d0a
--- /dev/null
+++ b/package/libsoup/0005-headers-Be-more-robust-against-invalid-input.patch
@@ -0,0 +1,136 @@
+From 12523a592f1216450d18706bcf6c16e0f1ab0ce0 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 16 May 2025 13:52:37 +0800
+Subject: [PATCH] headers: Be more robust against invalid input when
+ parsing params
+
+If you pass invalid input to a function such as soup_header_parse_param_list_strict()
+it can cause an overflow if it decodes the input to UTF-8.
+
+This should never happen with valid UTF-8 input which libsoup's client API
+ensures, however it's server API does not currently.
+
+CVE: CVE-2024-52531
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407/diffs?commit_id=a35222dd0bfab2ac97c10e86b95f762456628283]
+
+Upstream: https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libsoup/soup-headers.c | 45 +++++++++++++++++++++---------------------
+ 1 file changed, 23 insertions(+), 22 deletions(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index 67905b2..39e8d34 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -642,8 +642,9 @@ soup_header_contains (const char *header, const char *token)
+ }
+ 
+ static void
+-decode_quoted_string (char *quoted_string)
++decode_quoted_string_inplace (GString *quoted_gstring)
+ {
++	char *quoted_string = quoted_gstring->str;
+ 	char *src, *dst;
+ 
+ 	src = quoted_string + 1;
+@@ -657,10 +658,11 @@ decode_quoted_string (char *quoted_string)
+ }
+ 
+ static gboolean
+-decode_rfc5987 (char *encoded_string)
++decode_rfc5987_inplace (GString *encoded_gstring)
+ {
+ 	char *q, *decoded;
+ 	gboolean iso_8859_1 = FALSE;
++	const char *encoded_string = encoded_gstring->str;
+ 
+ 	q = strchr (encoded_string, '\'');
+ 	if (!q)
+@@ -689,14 +691,7 @@ decode_rfc5987 (char *encoded_string)
+ 		decoded = utf8;
+ 	}
+ 
+-	/* If encoded_string was UTF-8, then each 3-character %-escape
+-	 * will be converted to a single byte, and so decoded is
+-	 * shorter than encoded_string. If encoded_string was
+-	 * iso-8859-1, then each 3-character %-escape will be
+-	 * converted into at most 2 bytes in UTF-8, and so it's still
+-	 * shorter.
+-	 */
+-	strcpy (encoded_string, decoded);
++	g_string_assign (encoded_gstring, decoded);
+ 	g_free (decoded);
+ 	return TRUE;
+ }
+@@ -706,15 +701,16 @@ parse_param_list (const char *header, char delim, gboolean strict)
+ {
+ 	GHashTable *params;
+ 	GSList *list, *iter;
+-	char *item, *eq, *name_end, *value;
+-	gboolean override, duplicated;
+ 
+ 	params = g_hash_table_new_full (soup_str_case_hash, 
+ 					soup_str_case_equal,
+-					g_free, NULL);
++					g_free, g_free);
+ 
+ 	list = parse_list (header, delim);
+ 	for (iter = list; iter; iter = iter->next) {
++ 		char *item, *eq, *name_end;
++		gboolean override, duplicated;
++		GString *parsed_value = NULL;
+ 		item = iter->data;
+ 		override = FALSE;
+ 
+@@ -729,19 +725,19 @@ parse_param_list (const char *header, char delim, gboolean strict)
+ 
+ 			*name_end = '\0';
+ 
+-			value = (char *)skip_lws (eq + 1);
++			parsed_value = g_string_new ((char *)skip_lws (eq + 1));
+ 
+ 			if (name_end[-1] == '*' && name_end > item + 1) {
+ 				name_end[-1] = '\0';
+-				if (!decode_rfc5987 (value)) {
++				if (!decode_rfc5987_inplace (parsed_value)) {
++					g_string_free (parsed_value, TRUE);
+ 					g_free (item);
+ 					continue;
+ 				}
+ 				override = TRUE;
+-			} else if (*value == '"')
+-				decode_quoted_string (value);
+-		} else
+-			value = NULL;
++			} else if (parsed_value->str[0] == '"')
++				decode_quoted_string_inplace (parsed_value);
++			}
+ 
+ 		duplicated = g_hash_table_lookup_extended (params, item, NULL, NULL);
+ 
+@@ -749,11 +745,16 @@ parse_param_list (const char *header, char delim, gboolean strict)
+ 			soup_header_free_param_list (params);
+ 			params = NULL;
+ 			g_slist_foreach (iter, (GFunc)g_free, NULL);
++			if (parsed_value)
++				g_string_free (parsed_value, TRUE);
+ 			break;
+-		} else if (override || !duplicated)
+-			g_hash_table_replace (params, item, value);
+-		else
++		} else if (override || !duplicated) {
++			g_hash_table_replace (params, item, parsed_value ? g_string_free (parsed_value, FALSE) : NULL);
++		} else {
++			if (parsed_value)
++				g_string_free (parsed_value, TRUE);
+ 			g_free (item);
++		}
+ 	}
+ 
+ 	g_slist_free (list);
+-- 
+2.34.1
+
diff --git a/package/libsoup/0006-websocket-process-the-frame-as-soon-as-we-read-data.patch b/package/libsoup/0006-websocket-process-the-frame-as-soon-as-we-read-data.patch
new file mode 100644
index 0000000000..de33ac7b53
--- /dev/null
+++ b/package/libsoup/0006-websocket-process-the-frame-as-soon-as-we-read-data.patch
@@ -0,0 +1,40 @@
+From a693d49bff058fc20a448dc4e7d324ff0dc6597e Mon Sep 17 00:00:00 2001
+From: Ignacio Casal Quinteiro <qignacio@amazon.com>
+Date: Wed, 11 Sep 2024 11:52:11 +0200
+Subject: [PATCH] websocket: process the frame as soon as we read data
+
+Otherwise we can enter in a read loop because we were not
+validating the data until the all the data was read.
+
+Fixes #391
+
+CVE: CVE-2024-52532
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/6adc0e3eb74c257ed4e2a23eb4b2774fdb0d67be#f1d67ca0386b145ea201cf88d27f72724d7c6715]
+
+Upstream: https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libsoup/soup-websocket-connection.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocket-connection.c
+index a4095e1..65c1492 100644
+--- a/libsoup/soup-websocket-connection.c
++++ b/libsoup/soup-websocket-connection.c
+@@ -1140,9 +1140,8 @@ soup_websocket_connection_read (SoupWebsocketConnection *self)
+ 		}
+ 
+ 		pv->incoming->len = len + count;
+-	} while (count > 0);
+-
+-	process_incoming (self);
++		process_incoming (self);
++	} while (count > 0 && !pv->close_sent && !pv->io_closing);
+ 
+ 	if (end) {
+ 		if (!pv->close_sent || !pv->close_received) {
+-- 
+2.34.1
+
diff --git a/package/libsoup/0007-Fix-using-int-instead-of-size_t.patch b/package/libsoup/0007-Fix-using-int-instead-of-size_t.patch
new file mode 100644
index 0000000000..b057e8de98
--- /dev/null
+++ b/package/libsoup/0007-Fix-using-int-instead-of-size_t.patch
@@ -0,0 +1,32 @@
+From 5709dfffb6fdc5b66ce001bf82a755ad8ad1d992 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Mon, 28 Oct 2024 12:29:48 -0500
+Subject: [PATCH] Fix using int instead of size_t for strcspn return
+
+CVE: CVE-2025-32050
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/9bb0a55de55c6940ced811a64fbca82fe93a9323]
+
+Upstream: https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libsoup/soup-headers.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index 9707ca0..67905b2 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -902,7 +902,7 @@ append_param_quoted (GString    *string,
+ 		     const char *name,
+ 		     const char *value)
+ {
+-	int len;
++	gsize len;
+ 
+ 	g_string_append (string, name);
+ 	g_string_append (string, "=\"");
+-- 
+2.34.1
+
diff --git a/package/libsoup/0008-Fix-heap-buffer-overflow.patch b/package/libsoup/0008-Fix-heap-buffer-overflow.patch
new file mode 100644
index 0000000000..ece24baba2
--- /dev/null
+++ b/package/libsoup/0008-Fix-heap-buffer-overflow.patch
@@ -0,0 +1,35 @@
+From f4a67a9a3033586edaee715d40d5992e02d32893 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Sat, 16 Nov 2024 12:07:30 -0600
+Subject: [PATCH] Fix heap buffer overflow in soup_content_sniffer_sniff
+
+Co-Author: Ar Jun <pkillarjun@protonmail.com>
+
+CVE: CVE-2025-32052
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/commit/f182429e5b1fc034050510da20c93256c4fa9652#500da7cfde649872c49169be34b03a1c42a53ddb]
+
+Upstream: https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libsoup/soup-content-sniffer.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sniffer.c
+index 9554636..eac9e7b 100644
+--- a/libsoup/soup-content-sniffer.c
++++ b/libsoup/soup-content-sniffer.c
+@@ -504,7 +504,7 @@ sniff_unknown (SoupContentSniffer *sniffer, SoupBuffer *buffer,
+ 			guint index_pattern = 0;
+ 			gboolean skip_row = FALSE;
+ 
+-			while ((index_stream < resource_length) &&
++			while ((index_stream < resource_length - 1) &&
+ 			       (index_pattern <= type_row->pattern_length)) {
+ 				/* Skip insignificant white space ("WS" in the spec) */
+ 				if (type_row->pattern[index_pattern] == ' ') {
+-- 
+2.34.1
+
diff --git a/package/libsoup/0009-Fix-heap-buffer-overflow.patch b/package/libsoup/0009-Fix-heap-buffer-overflow.patch
new file mode 100644
index 0000000000..440b7c308a
--- /dev/null
+++ b/package/libsoup/0009-Fix-heap-buffer-overflow.patch
@@ -0,0 +1,42 @@
+From d9bcffd6cd5e8ec32889a594f7348d67a5101b3a Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 12 May 2025 13:58:42 +0800
+Subject: [PATCH] Fix heap buffer overflow in
+ soup-content-sniffer.c:sniff_feed_or_html()
+
+CVE: CVE-2025-32053
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/eaed42ca8d40cd9ab63764e3d63641180505f40a]
+
+Upstream: https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libsoup/soup-content-sniffer.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libsoup/soup-content-sniffer.c b/libsoup/soup-content-sniffer.c
+index 967ec61..5f2896e 100644
+--- a/libsoup/soup-content-sniffer.c
++++ b/libsoup/soup-content-sniffer.c
+@@ -620,7 +620,7 @@ skip_insignificant_space (const char *resource, int *pos, int resource_length)
+ 	       (resource[*pos] == '\x0D')) {
+ 		*pos = *pos + 1;
+ 
+-		if (*pos > resource_length)
++		if (*pos >= resource_length)
+ 			return TRUE;
+ 	}
+ 
+@@ -682,7 +682,7 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, SoupBuffer *buffer)
+ 		do {
+ 			pos++;
+ 
+-			if (pos > resource_length)
++			if ((pos + 1) > resource_length)
+ 				goto text_html;
+ 		} while (resource[pos] != '>');
+ 
+-- 
+2.34.1
+
diff --git a/package/libsoup/0010-headers-Handle-parsing-only-newlines.patch b/package/libsoup/0010-headers-Handle-parsing-only-newlines.patch
new file mode 100644
index 0000000000..b6b3f4f37f
--- /dev/null
+++ b/package/libsoup/0010-headers-Handle-parsing-only-newlines.patch
@@ -0,0 +1,46 @@
+From 4b8809cca4bbcbf9514314d86227f985362258b0 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Wed, 12 Feb 2025 11:30:02 -0600
+Subject: [PATCH] headers: Handle parsing only newlines
+
+Closes #404
+Closes #407
+
+CVE: CVE-2025-32906
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/af5b9a4a3945c52b940d5ac181ef51bb12011f1f]
+
+Upstream: https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+[Titouan: Remove changes on test files]
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libsoup/soup-headers.c      |  4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index e5d3c03..87bb3dc 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -185,7 +185,7 @@ soup_headers_parse_request (const char          *str,
+ 	/* RFC 2616 4.1 "servers SHOULD ignore any empty line(s)
+ 	 * received where a Request-Line is expected."
+ 	 */
+-	while ((*str == '\r' || *str == '\n') && len > 0) {
++	while (len > 0 && (*str == '\r' || *str == '\n')) {
+ 		str++;
+ 		len--;
+ 	}
+@@ -369,7 +369,7 @@ soup_headers_parse_response (const char          *str,
+ 	 * after a response, which we then see prepended to the next
+ 	 * response on that connection.
+ 	 */
+-	while ((*str == '\r' || *str == '\n') && len > 0) {
++	while (len > 0 && (*str == '\r' || *str == '\n')) {
+ 		str++;
+ 		len--;
+ 	}
+
+-- 
+2.34.1
+
diff --git a/package/libsoup/0011-auth-digest-Handle-missing-realm-nonce.patch b/package/libsoup/0011-auth-digest-Handle-missing-realm-nonce.patch
new file mode 100644
index 0000000000..8c7610237d
--- /dev/null
+++ b/package/libsoup/0011-auth-digest-Handle-missing-realm-nonce.patch
@@ -0,0 +1,35 @@
+From a7e711d0f162c6edc8acad2a96981d4890784ea3 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 12 May 2025 17:02:55 +0800
+Subject: [PATCH] auth-digest: Handle missing realm/nonce in authenticate
+ header
+
+CVE: CVE-2025-32910
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417/diffs?commit_id=e40df6d48a1cbab56f5d15016cc861a503423cfe]
+
+Upstream: https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libsoup/soup-auth-digest.c |  3 +++
+ 1 files changed, 3 insertions(+)
+
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
+index e8ba990..0ab3499 100644
+--- a/libsoup/soup-auth-digest.c
++++ b/libsoup/soup-auth-digest.c
+@@ -142,6 +142,9 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
+ 	guint qop_options;
+ 	gboolean ok = TRUE;
+ 
++	 if (!soup_auth_get_realm (auth))
++		return FALSE;
++
+ 	g_free (priv->domain);
+ 	g_free (priv->nonce);
+ 	g_free (priv->opaque);
+ 
+-- 
+2.34.1
+
diff --git a/package/libsoup/0012-auth-digest-Handle-missing-nonce.patch b/package/libsoup/0012-auth-digest-Handle-missing-nonce.patch
new file mode 100644
index 0000000000..7749491fd3
--- /dev/null
+++ b/package/libsoup/0012-auth-digest-Handle-missing-nonce.patch
@@ -0,0 +1,97 @@
+From eccfca1074fc485a0b60dfb9c8385429a226bf73 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 16 May 2025 13:19:38 +0800
+Subject: [PATCH] auth-digest: Handle missing nonce
+
+CVE: CVE-2025-32910
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417/diffs?commit_id=405a8a34597a44bd58c4759e7d5e23f02c3b556a]
+
+Upstream: https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libsoup/soup-auth-digest.c | 45 ++++++++++++++++++++++++++++----------
+ 1 files changed, 28 insertions(+), 10 deletions(-)
+
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
+index 0ab3499..10a8591 100644
+--- a/libsoup/soup-auth-digest.c
++++ b/libsoup/soup-auth-digest.c
+@@ -132,6 +132,19 @@ soup_auth_digest_get_qop (SoupAuthDigestQop qop)
+ 	return g_string_free (out, FALSE);
+ }
+ 
++static gboolean
++validate_params (SoupAuthDigest *auth_digest)
++{
++	SoupAuthDigestPrivate *priv = soup_auth_digest_get_instance_private (auth_digest);
++
++	if (priv->qop || priv->algorithm == SOUP_AUTH_DIGEST_ALGORITHM_MD5_SESS) {
++		if (!priv->nonce)
++			return FALSE;
++	}
++
++	return TRUE;
++}
++
+ static gboolean
+ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
+ 			 GHashTable *auth_params)
+@@ -169,17 +182,22 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
+ 	if (priv->algorithm == -1)
+ 		ok = FALSE;
+ 
+-	stale = g_hash_table_lookup (auth_params, "stale");
+-	if (stale && !g_ascii_strcasecmp (stale, "TRUE") && *priv->hex_urp)
+-		recompute_hex_a1 (priv);
+-	else {
+-		g_free (priv->user);
+-		priv->user = NULL;
+-		g_free (priv->cnonce);
+-		priv->cnonce = NULL;
+-		memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
+-		memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
+-        }
++	if (!validate_params (auth_digest))
++		ok = FALSE;
++
++	if (ok) {
++		stale = g_hash_table_lookup (auth_params, "stale");
++		if (stale && !g_ascii_strcasecmp (stale, "TRUE") && *priv->hex_urp)
++			recompute_hex_a1 (priv);
++		else {
++			g_free (priv->user);
++			priv->user = NULL;
++			g_free (priv->cnonce);
++			priv->cnonce = NULL;
++			memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
++			memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
++		}
++	}
+ 
+ 	return ok;
+ }
+@@ -359,6 +377,8 @@ soup_auth_digest_compute_response (const char        *method,
+ 	if (qop) {
+ 		char tmp[9];
+ 
++		g_assert (cnonce);
++
+ 		g_snprintf (tmp, 9, "%.8x", nc);
+ 		g_checksum_update (checksum, (guchar *)tmp, strlen (tmp));
+ 		g_checksum_update (checksum, (guchar *)":", 1);
+@@ -422,6 +442,9 @@ soup_auth_digest_get_authorization (SoupAuth *auth, SoupMessage *msg)
+ 	g_return_val_if_fail (uri != NULL, NULL);
+ 	url = soup_uri_to_string (uri, TRUE);
+ 
++	g_assert (priv->nonce);
++	g_assert (!priv->qop || priv->cnonce);
++
+ 	soup_auth_digest_compute_response (msg->method, url, priv->hex_a1,
+ 					   priv->qop, priv->nonce,
+ 					   priv->cnonce, priv->nc,
+ 
+-- 
+2.34.1
+
diff --git a/package/libsoup/0013-auth-digest-Fix-leak.patch b/package/libsoup/0013-auth-digest-Fix-leak.patch
new file mode 100644
index 0000000000..b7d5ec4de3
--- /dev/null
+++ b/package/libsoup/0013-auth-digest-Fix-leak.patch
@@ -0,0 +1,31 @@
+From 74c95d54fe42041fe161cb74c76d942ffd37a5dd Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 16 May 2025 13:21:43 +0800
+Subject: [PATCH] auth-digest: Fix leak
+
+CVE: CVE-2025-32910
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417/diffs?commit_id=ea16eeacb052e423eb5c3b0b705e5eab34b13832]
+
+Upstream: https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libsoup/soup-auth-digest.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
+index 10a8591..6d965d2 100644
+--- a/libsoup/soup-auth-digest.c
++++ b/libsoup/soup-auth-digest.c
+@@ -66,6 +66,7 @@ soup_auth_digest_finalize (GObject *object)
+ 	g_free (priv->nonce);
+ 	g_free (priv->domain);
+ 	g_free (priv->cnonce);
++	g_free (priv->opaque);
+ 
+ 	memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
+ 	memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
+-- 
+2.34.1
+
diff --git a/package/libsoup/0014-CVE-2025-32911.patch b/package/libsoup/0014-CVE-2025-32911.patch
new file mode 100644
index 0000000000..102acb4af3
--- /dev/null
+++ b/package/libsoup/0014-CVE-2025-32911.patch
@@ -0,0 +1,77 @@
+From 52c5859b82fe79f2c32d883e048d218e0d7f2182 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 30 Apr 2025 14:59:55 +0800
+Subject: [PATCH] CVE-2025-32911
+
+CVE: CVE-2025-32911 CVE-2025-32913
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/422/commits]
+
+Upstream: https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libsoup/soup-message-headers.c | 13 +++++++++----
+ tests/header-parsing-test.c    | 15 +++++++++++++++
+ 2 files changed, 24 insertions(+), 4 deletions(-)
+
+diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
+index 39ad14a..78b2455 100644
+--- a/libsoup/soup-message-headers.c
++++ b/libsoup/soup-message-headers.c
+@@ -1454,10 +1454,15 @@ soup_message_headers_get_content_disposition (SoupMessageHeaders  *hdrs,
+ 	 */
+ 	if (params && g_hash_table_lookup_extended (*params, "filename",
+ 						    &orig_key, &orig_value)) {
+-		char *filename = strrchr (orig_value, '/');
+-
+-		if (filename)
+-			g_hash_table_insert (*params, g_strdup (orig_key), filename + 1);
++                if (orig_value) {
++                        char *filename = strrchr (orig_value, '/');
++
++                        if (filename)
++                                g_hash_table_insert (*params, g_strdup (orig_key), g_strdup(filename + 1));
++                } else {
++                        /* filename with no value isn't valid. */
++                        g_hash_table_remove (*params, "filename");
++                }
+ 	}
+ 	return TRUE;
+ }
+diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
+index 946f118..752196e 100644
+--- a/tests/header-parsing-test.c
++++ b/tests/header-parsing-test.c
+@@ -1034,6 +1034,7 @@ do_param_list_tests (void)
+ #define RFC5987_TEST_HEADER_FALLBACK "attachment; filename*=Unknown''t%FF%FF%FFst.txt; filename=\"test.txt\""
+ #define RFC5987_TEST_HEADER_NO_TYPE  "filename=\"test.txt\""
+ #define RFC5987_TEST_HEADER_NO_TYPE_2  "filename=\"test.txt\"; foo=bar"
++#define RFC5987_TEST_HEADER_EMPTY_FILENAME ";filename"
+ 
+ static void
+ do_content_disposition_tests (void)
+@@ -1133,6 +1134,20 @@ do_content_disposition_tests (void)
+ 	g_assert_cmpstr (filename, ==, RFC5987_TEST_FALLBACK_FILENAME);
+         parameter2 = g_hash_table_lookup (params, "foo");
+         g_assert_cmpstr (parameter2, ==, "bar");
++	g_hash_table_destroy (params);
++
++	 /* Empty filename */
++	soup_message_headers_clear (hdrs);
++	soup_message_headers_append (hdrs, "Content-Disposition",
++								 RFC5987_TEST_HEADER_EMPTY_FILENAME);
++	if (!soup_message_headers_get_content_disposition (hdrs,
++													   &disposition,
++													   &params)) {
++			soup_test_assert (FALSE, "empty filename decoding FAILED");
++			return;
++	}
++	g_free (disposition);
++	g_assert_false (g_hash_table_contains (params, "filename"));
+ 	g_hash_table_destroy (params);
+ 
+ 	soup_message_headers_free (hdrs);
+-- 
+2.34.1
+
diff --git a/package/libsoup/0015-auth-digest-Handle-missing-nonce.patch b/package/libsoup/0015-auth-digest-Handle-missing-nonce.patch
new file mode 100644
index 0000000000..79fd727a55
--- /dev/null
+++ b/package/libsoup/0015-auth-digest-Handle-missing-nonce.patch
@@ -0,0 +1,35 @@
+From 0984dddb11daf14fdf5ca24077cd0ebda796439a Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 16 May 2025 13:25:32 +0800
+Subject: [PATCH] auth-digest: Handle missing nonce
+
+CVE: CVE-2025-32912
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/commit/cd077513f267e43ce4b659eb18a1734d8a369992?merge_request_iid=434
+https://gitlab.gnome.org/GNOME/libsoup/-/commit/910ebdcd3dd82386717a201c13c834f3a63eed7f]
+
+Upstream: https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libsoup/soup-auth-digest.c | 2 +-
+ 1 files changed, 1 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
+index 6d965d2..f1621ec 100644
+--- a/libsoup/soup-auth-digest.c
++++ b/libsoup/soup-auth-digest.c
+@@ -156,7 +156,7 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
+ 	guint qop_options;
+ 	gboolean ok = TRUE;
+ 
+-	 if (!soup_auth_get_realm (auth))
++	if (!soup_auth_get_realm (auth) || !g_hash_table_lookup (auth_params, "nonce"))
+ 		return FALSE;
+ 
+ 	g_free (priv->domain);
+
+-- 
+2.34.1
+
diff --git a/package/libsoup/0016-CVE-2025-32914.patch b/package/libsoup/0016-CVE-2025-32914.patch
new file mode 100644
index 0000000000..3bb206bfc3
--- /dev/null
+++ b/package/libsoup/0016-CVE-2025-32914.patch
@@ -0,0 +1,38 @@
+From ac844b9fc7945c38ea21fb7cf1a49a5c226d7c9c Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 12 May 2025 16:17:20 +0800
+Subject: [PATCH] Resolve "(CVE-2025-32914) (#YWH-PGM9867-23) OOB Read on
+ libsoup through function "soup_multipart_new_from_message" in
+ soup-multipart.c leads to crash or exit of process"
+
+CVE: CVE-2025-32914
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/450/diffs?commit_id=5bfcf8157597f2d327050114fb37ff600004dbcf]
+
+Test code are not added since some functions not aligned with version
+2.74.3
+
+Upstream: https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libsoup/soup-multipart.c |  2 +-
+ 1 files changed, 1 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
+index a7e550f..dd93973 100644
+--- a/libsoup/soup-multipart.c
++++ b/libsoup/soup-multipart.c
+@@ -181,7 +181,7 @@ soup_multipart_new_from_message (SoupMessageHeaders *headers,
+ 			return NULL;
+ 		}
+ 
+-		split = strstr (start, "\r\n\r\n");
++		split = g_strstr_len (start, body_end - start, "\r\n\r\n");
+ 		if (!split || split > end) {
+ 			soup_multipart_free (multipart);
+ 			soup_buffer_free (flattened);
+ 
+-- 
+2.34.1
+
diff --git a/package/libsoup/0017-auth-digest-fix-crash.patch b/package/libsoup/0017-auth-digest-fix-crash.patch
new file mode 100644
index 0000000000..f73cdf6614
--- /dev/null
+++ b/package/libsoup/0017-auth-digest-fix-crash.patch
@@ -0,0 +1,41 @@
+From 52a0f9234d384b9dab368835b22e5a5a01542168 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 16 May 2025 14:16:10 +0800
+Subject: [PATCH] auth-digest: fix crash in
+ soup_auth_digest_get_protection_space()
+
+We need to validate the Domain parameter in the WWW-Authenticate header.
+
+Unfortunately this crash only occurs when listening on default ports 80
+and 443, so there's no good way to test for this. The test would require
+running as root.
+
+Fixes #440
+
+CVE: CVE-2025-4476
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/e64c221f9c7d09b48b610c5626b3b8c400f0907c?merge_request_iid=457]
+
+Upstream: https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libsoup/soup-auth-digest.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
+index f1621ec..a2dc560 100644
+--- a/libsoup/soup-auth-digest.c
++++ b/libsoup/soup-auth-digest.c
+@@ -229,7 +229,7 @@ soup_auth_digest_get_protection_space (SoupAuth *auth, SoupURI *source_uri)
+ 			uri = soup_uri_new (d);
+ 			if (uri && uri->scheme == source_uri->scheme &&
+ 			    uri->port == source_uri->port &&
+-			    !strcmp (uri->host, source_uri->host))
++			    !g_strcmp0 (uri->host, source_uri->host))
+ 				dir = g_strdup (uri->path);
+ 			else
+ 				dir = NULL;
+-- 
+2.34.1
+
diff --git a/package/libsoup/0018-soup_header_parse_quality_list-Fix-leak.patch b/package/libsoup/0018-soup_header_parse_quality_list-Fix-leak.patch
new file mode 100644
index 0000000000..5dfe074d91
--- /dev/null
+++ b/package/libsoup/0018-soup_header_parse_quality_list-Fix-leak.patch
@@ -0,0 +1,64 @@
+From 81e03c538d6a102406114567f4f1c468033ce2e4 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Thu, 26 Dec 2024 18:31:42 -0600
+Subject: [PATCH] soup_header_parse_quality_list: Fix leak
+
+When iterating over the parsed list we now steal the allocated strings that we want and then free_full the list which may contain remaining strings.
+
+CVE: CVE-2025-46420
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/421/diffs?commit_id=c9083869ec2a3037e6df4bd86b45c419ba295f8e]
+
+Upstream: https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libsoup/soup-headers.c | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index 87bb3dc..9707ca0 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -528,7 +528,7 @@ soup_header_parse_quality_list (const char *header, GSList **unacceptable)
+ 	GSList *unsorted;
+ 	QualityItem *array;
+ 	GSList *sorted, *iter;
+-	char *item, *semi;
++	char *semi;
+ 	const char *param, *equal, *value;
+ 	double qval;
+ 	int n;
+@@ -541,9 +541,8 @@ soup_header_parse_quality_list (const char *header, GSList **unacceptable)
+ 	unsorted = soup_header_parse_list (header);
+ 	array = g_new0 (QualityItem, g_slist_length (unsorted));
+ 	for (iter = unsorted, n = 0; iter; iter = iter->next) {
+-		item = iter->data;
+ 		qval = 1.0;
+-		for (semi = strchr (item, ';'); semi; semi = strchr (semi + 1, ';')) {
++		for (semi = strchr (iter->data, ';'); semi; semi = strchr (semi + 1, ';')) {
+ 			param = skip_lws (semi + 1);
+ 			if (*param != 'q')
+ 				continue;
+@@ -575,15 +574,15 @@ soup_header_parse_quality_list (const char *header, GSList **unacceptable)
+ 		if (qval == 0.0) {
+ 			if (unacceptable) {
+ 				*unacceptable = g_slist_prepend (*unacceptable,
+-								 item);
++								 g_steal_pointer (&iter->data));
+ 			}
+ 		} else {
+-			array[n].item = item;
++			array[n].item = g_steal_pointer (&iter->data);
+ 			array[n].qval = qval;
+ 			n++;
+ 		}
+ 	}
+-	g_slist_free (unsorted);
++	g_slist_free_full (unsorted, g_free);
+ 
+ 	qsort (array, n, sizeof (QualityItem), sort_by_qval);
+ 	sorted = NULL;
+-- 
+2.34.1
+
diff --git a/package/libsoup/0019-session-Strip-authentication-credentials.patch b/package/libsoup/0019-session-Strip-authentication-credentials.patch
new file mode 100644
index 0000000000..4e766d066f
--- /dev/null
+++ b/package/libsoup/0019-session-Strip-authentication-credentials.patch
@@ -0,0 +1,50 @@
+From 5eb225f02bb35de56cfeedd87bde716bf1cb750b Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Wed, 5 Feb 2025 16:18:10 -0600
+Subject: [PATCH] session: Strip authentication credentails on
+ cross-origin redirect
+
+This should match the behavior of Firefox and Safari but not of Chromium.
+
+CVE: CVE-2025-46421
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/436/diffs?commit_id=3e5c26415811f19e7737238bb23305ffaf96f66b]
+
+Test code not added since it included some headers not in version 2.74.3
+
+Upstream: https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libsoup/soup-session.c |  8 ++++-
+ 2 files changed, 85 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-session.c b/libsoup/soup-session.c
+index 83421ef..8d6ac61 100644
+--- a/libsoup/soup-session.c
++++ b/libsoup/soup-session.c
+@@ -1189,12 +1189,18 @@ soup_session_redirect_message (SoupSession *session, SoupMessage *msg)
+ 						   SOUP_ENCODING_NONE);
+ 	}
+ 
++	/* Strip all credentials on cross-origin redirect. */
++	if (!soup_uri_host_equal (soup_message_get_uri (msg), new_uri)) {
++		soup_message_headers_remove (msg->request_headers, "Authorization");
++		soup_message_set_auth (msg, NULL);
++	}
++
+ 	soup_message_set_uri (msg, new_uri);
+ 	soup_uri_free (new_uri);
+ 
+ 	soup_session_requeue_message (session, msg);
+ 	return TRUE;
+-}
++}
+ 
+ static void
+ redirect_handler (SoupMessage *msg, gpointer user_data)
+ 
+-- 
+2.34.1
+
diff --git a/package/libsoup/0020-soup-multipart-Verify-boundary-limits.patch b/package/libsoup/0020-soup-multipart-Verify-boundary-limits.patch
new file mode 100644
index 0000000000..e6b8b2fb97
--- /dev/null
+++ b/package/libsoup/0020-soup-multipart-Verify-boundary-limits.patch
@@ -0,0 +1,41 @@
+From dfdc9b3cc73e6fe88cc12792ba00e14642572339 Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Thu, 15 May 2025 17:49:11 +0200
+Subject: [PATCH] soup-multipart: Verify boundary limits for multipart body
+
+It could happen that the boundary started at a place which resulted into
+a negative number, which in an unsigned integer is a very large value.
+Check the body size is not a negative value before setting it.
+
+Closes https://gitlab.gnome.org/GNOME/libsoup/-/issues/449
+
+Part-of: <https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/463>
+
+CVE: CVE-2025-4948
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/463/diffs?commit_id=f2f28afe0b3b2b3009ab67d6874457ec6bac70c0]
+
+Upstream: https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libsoup/soup-multipart.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
+index dd93973..ce2fc10 100644
+--- a/libsoup/soup-multipart.c
++++ b/libsoup/soup-multipart.c
+@@ -214,7 +214,7 @@ soup_multipart_new_from_message (SoupMessageHeaders *headers,
+ 		 */
+ 		part_body = soup_buffer_new_subbuffer (flattened,
+ 						       split - flattened->data,
+-						       end - 2 - split);
++						       end - 2 >= split ? end - 2 - split : 0);
+ 		g_ptr_array_add (multipart->bodies, part_body);
+ 
+ 		start = end;
+-- 
+2.34.1
+
diff --git a/package/libsoup/0021-soup-multipart-Verify-array-bounds.patch b/package/libsoup/0021-soup-multipart-Verify-array-bounds.patch
new file mode 100644
index 0000000000..7cd2a2c036
--- /dev/null
+++ b/package/libsoup/0021-soup-multipart-Verify-array-bounds.patch
@@ -0,0 +1,40 @@
+From a7d0c58608ed830bedfb6b92aea11e00feb55aa9 Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Mon, 19 May 2025 17:48:27 +0200
+Subject: [PATCH] soup-multipart: Verify array bounds before accessing its
+ members
+
+The boundary could be at a place which, calculated, pointed
+before the beginning of the array. Check the bounds, to avoid
+read out of the array bounds.
+
+Closes https://gitlab.gnome.org/GNOME/libsoup/-/issues/447
+
+CVE: CVE-2025-4969
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/467/diffs?commit_id=b5b4dd10d4810f0c87b4eaffe88504f06e502f33]
+
+Upstream: https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libsoup/soup-multipart.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
+index ce2fc10..a29cdf0 100644
+--- a/libsoup/soup-multipart.c
++++ b/libsoup/soup-multipart.c
+@@ -108,7 +108,7 @@ find_boundary (const char *start, const char *end,
+ 			continue;
+ 
+ 		/* Check that it's at start of line */
+-		if (!(b == start || (b[-1] == '\n' && b[-2] == '\r')))
++		if (!(b == start || (b - start >= 2 && b[-1] == '\n' && b[-2] == '\r')))
+ 			continue;
+ 
+ 		/* Check for "--" or "\r\n" after boundary */
+-- 
+2.34.1
+
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 81bf42cabe..4ac88a1178 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -22,6 +22,43 @@ LIBSOUP_DEPENDENCIES = \
 	sqlite \
 	$(TARGET_NLS_DEPENDENCIES)
 
+# 0003-sniffer-fix-potential-overflow.patch
+LIBSOUP_IGNORE_CVES += CVE-2025-2784
+# 0004-headers-Strictly-dont-allow-NUL-bytes.patch
+LIBSOUP_IGNORE_CVES += CVE-2024-52530
+# 0005-headers-Be-more-robust-against-invalid-input.patch
+LIBSOUP_IGNORE_CVES += CVE-2024-52531
+# 0006-websocket-process-the-frame-as-soon-as-we-read-data.patch
+LIBSOUP_IGNORE_CVES += CVE-2024-52532
+# 0007-Fix-using-int-instead-of-size_t.patch
+LIBSOUP_IGNORE_CVES += CVE-2025-32050
+# 0008-Fix-heap-buffer-overflow.patch
+LIBSOUP_IGNORE_CVES += CVE-2025-32052
+# 0009-Fix-heap-buffer-overflow.patch
+LIBSOUP_IGNORE_CVES += CVE-2025-32053
+# 0010-headers-Handle-parsing-only-newlines.patch
+LIBSOUP_IGNORE_CVES += CVE-2025-32906
+# 0011-auth-digest-Handle-missing-realm-nonce.patch
+# 0012-auth-digest-Handle-missing-nonce.patch
+# 0013-auth-digest-Fix-leak.patch
+LIBSOUP_IGNORE_CVES += CVE-2025-32910
+# 0014-CVE-2025-32911.patch
+LIBSOUP_IGNORE_CVES += CVE-2025-32911 CVE-2025-32913
+# 0015-auth-digest-Handle-missing-nonce.patch
+LIBSOUP_IGNORE_CVES += CVE-2025-32912
+# 0016-CVE-2025-32914.patch
+LIBSOUP_IGNORE_CVES += CVE-2025-32914
+# 0017-auth-digest-fix-crash.patch
+LIBSOUP_IGNORE_CVES += CVE-2025-4476
+# 0018-soup_header_parse_quality_list-Fix-leak.patch
+LIBSOUP_IGNORE_CVES += CVE-2025-46420
+# 0019-session-Strip-authentication-credentials.patch
+LIBSOUP_IGNORE_CVES += CVE-2025-46421
+# 0020-soup-multipart-Verify-boundary-limits.patch
+LIBSOUP_IGNORE_CVES += CVE-2025-4948
+# 0021-soup-multipart-Verify-array-bounds.patch
+LIBSOUP_IGNORE_CVES += CVE-2025-4969
+
 LIBSOUP_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 LIBSOUP_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
