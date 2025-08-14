Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6820CA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC0AD6074E;
	Thu, 14 Aug 2025 20:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KMhWcKrL1xiE; Thu, 14 Aug 2025 20:17:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C082960760
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C082960760;
	Thu, 14 Aug 2025 20:17:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04EC4228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAD8160758
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:17:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aOGiST78jMuD for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:17:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA65960757
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA65960757
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:17:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C98AE8760E; Thu, 14 Aug 2025 20:17:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:08:50 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 71fe0f583a6252317e850054377bab28c156cbc6
X-Git-Newrev: 678c631c5e5b8ca3d6b50ef55b16274516fdff8b
X-Patchwork-Hint: ignore
Message-Id: <20250814201728.C98AE8760E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libglib2: fix
 CVE-2025-6052
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0702106949142198662=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0702106949142198662==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=678c631c5e5b8ca3d6b50ef55b16274516fdff8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Buildroot LTS 2025.02.x utilises libglib2 version 2.82.5 which is prone
to CVE-2025-6052 [1].
0001-gstring-Fix-overflow-check-when-expanding-the-string.patch is
included in the package/libglib2 directory. This patch mitigates
CVE-2025-6052 as seen in [1], by backporting to libglib2 2.82.5.
libglib2 shares part of its infrastructure with libglib2-bootstrap,
by adding the patch in package/libglib2 the patch isn't applied to
libglib2-bootstrap.
When building libglib2, the patch was correctly applied in
output/build/host-libglib2-2.82.5/glib/gstring.c .  When building
libglib2-bootstrap it was verified that the patch was not applied here.

Signed-off-by: Tim Soubry <tim.soubry@mind.be>
[Arnout: fix checkpackage error]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 ...-overflow-check-when-expanding-the-string.patch | 71 ++++++++++++++++++++++
 package/libglib2/libglib2.mk                       |  3 +
 2 files changed, 74 insertions(+)

diff --git a/package/libglib2/0001-gstring-Fix-overflow-check-when-expanding-the-string.patch b/package/libglib2/0001-gstring-Fix-overflow-check-when-expanding-the-string.patch
new file mode 100644
index 0000000000..3f9f06954b
--- /dev/null
+++ b/package/libglib2/0001-gstring-Fix-overflow-check-when-expanding-the-string.patch
@@ -0,0 +1,71 @@
+From 9c403f787eee69be850ba5f92348ecea65f9badc Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Tue, 3 Jun 2025 11:31:04 +0100
+Subject: [PATCH] gstring: Fix overflow check when expanding the string
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+After commit 34b7992fd6e3894bf6d2229b8aa59cac34bcb1b5 the overflow check
+was only done when expanding the string, but we need to do it before
+checking whether to expand the string, otherwise that calculation could
+overflow and falsely decide that the string is big enough already.
+
+As a concrete example, consider a `GString` which has:
+ * `.len = G_MAXSIZE / 2 + 1`
+ * `.allocated_len = G_MAXSIZE / 2 + 1`
+and `g_string_append()` is called on it with an input string of length
+`G_MAXSIZE / 2`.
+
+This results in a call `g_string_maybe_expand (string, G_MAXSIZE / 2)`,
+which calculates `string->len + len` as `(G_MAXSIZE / 2 + 1) +
+(G_MAXSIZE / 2)` which evaluates to `1` as it overflows. This is not
+greater than `string->allocated_len` (which is `G_MAXSIZE / 2 + 1`), so
+`g_string_expand()` is *not* called, and `g_string_maybe_expand()`
+returns successfully. The caller then assumes that there’s enough space
+in the buffer, and happily continues to cause a buffer overflow.
+
+It’s unlikely anyone could hit this in practice because it requires
+ludicrously big strings and `GString` allocations, which likely would
+have been blocked by other code, but if we’re going to have the overflow
+checks in `GString` then they should be effective.
+
+Spotted by code inspection.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+Upstream: https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4655/diffs
+CVE: CVE-2025-6052
+Signed-off-by: Tim Soubry <tim.soubry@mind.be>
+---
+ glib/gstring.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/glib/gstring.c b/glib/gstring.c
+index bdd068344..45a6f68b1 100644
+--- a/glib/gstring.c
++++ b/glib/gstring.c
+@@ -68,10 +68,6 @@ static void
+ g_string_expand (GString *string,
+                  gsize    len)
+ {
+-  /* Detect potential overflow */
+-  if G_UNLIKELY ((G_MAXSIZE - string->len - 1) < len)
+-    g_error ("adding %" G_GSIZE_FORMAT " to string would overflow", len);
+-
+   string->allocated_len = g_nearest_pow (string->len + len + 1);
+   /* If the new size is bigger than G_MAXSIZE / 2, only allocate enough
+    * memory for this string and don't over-allocate.
+@@ -86,6 +82,10 @@ static inline void
+ g_string_maybe_expand (GString *string,
+                        gsize    len)
+ {
++  /* Detect potential overflow */
++  if G_UNLIKELY ((G_MAXSIZE - string->len - 1) < len)
++    g_error ("adding %" G_GSIZE_FORMAT " to string would overflow", len);
++
+   if (G_UNLIKELY (string->len + len >= string->allocated_len))
+     g_string_expand (string, len);
+ }
+-- 
+2.39.5
+
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 6c012c79c7..b8c853b752 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -22,6 +22,9 @@ ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 LIBGLIB2_CFLAGS += -marm
 endif
 
+# 0001-gstring-Fix-overflow-check-when-expanding-the-string.patch
+LIBGLIB2_IGNORE_CVES += CVE-2025-6052
+
 HOST_LIBGLIB2_CONF_OPTS = \
 	-Ddtrace=false \
 	-Dglib_debug=disabled \

--===============0702106949142198662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0702106949142198662==--
