Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1409C55822
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 20:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52FA44072C;
	Tue,  4 Aug 2026 20:52:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NHCN8E3Z7YHU; Tue,  4 Aug 2026 20:52:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F86D406D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785876729;
	bh=v8vCXmacGhuTIXqD1NZL44FFGC3MizsYoJy8WFG8Mv4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=VItO1wwdsakesM37pXDaTLKUbCaEH8lAI2qmh2foBI02w9HspWwJhIQq745pN3TgU
	 unKjOtFxsKBqy2wrc/LmJZb/XJBYqMpYIk2P8SDsMsc7zyMrBwHBSoblvXtBNg+nVv
	 lcvDHcWhwzEjhCNQzDDMuJgz3wnhvQE/P7oQc/Lngyrs2PHnpUjsCWv7aqKjwcVZEF
	 TS5iOJd+gdJHlpqV5XrfvytuZFzGCFU1WYgUSTniTYVXdmfbeSSJjYLB+QiWxF6jsM
	 1uN3+0/+9A3JRSqueva8iNj1eDKWLIU5Amsqu+DK7zpJYN4DvLSb9GX9z9w9fPlENk
	 N/FPpDT3JxyYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F86D406D2;
	Tue,  4 Aug 2026 20:52:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DDA6270
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 20:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F49C605EC
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 20:52:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ulosKUZjz-vM for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 20:52:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8AC53605E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AC53605E1
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8AC53605E1
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 20:52:05 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9nxn-1woJqJ3LSH-00H0ot; Tue, 04
 Aug 2026 22:52:02 +0200
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Tue,  4 Aug 2026 22:51:48 +0200
Message-ID: <20260804205148.2586329-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:XoW6VV4xgPm6XJ3IEFxZpkKoKoniCjoJck6S2AJxOczawd9HU2H
 qYIe7p8f+IqQNOZj2wWZsl+kgzxUbzpjAo/tnEg3m7lggln8UcTe+DG17VxDjuVXoQj5+tA
 eQvmNJJOk7npG8A46de3DAccN+BraK7bbBzvCkeHvhJJUG6kMV42ZNsbxQ7byn3+VPWhTxn
 /sx/OmYB9hHTLhef7QcCA==
UI-OutboundReport: notjunk:1;M01:P0:Zz7T9oFaDY4=;d1zsxz6ge7hLQh3Xni3MOzh+RuK
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1785876723; x=1786481523; i=fiona.klute@gmx.de;
 bh=Qvb+hlqKJg42l2SdJMX8WQgVEj/FyYldojcfhA9UfdE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=rv2twFBzwrROI4TetQQ8oRrUdYfKJcfS9CBJlmW2fh9m9d6wGKTmjN2M/xRHxY3/
 2QEjIBmh7/bWc+34J9xLFVfPinw9zwH3Zdl3HpfSOcNIc0sJWc4S9RMZkbJ9UJmN8
 2eQZKd/xvXK6pcAoGI50KXp+jHy8ztoMfL20gmGwnK6EpOnihEaEiiBr2R8uoHdoT
 9/Bx7NUdxrwgVsvmZi2E820bNVM3w376EpGApgUf4NHJwPYkcVEisYnHC3eZT/iJm
 VnvqRZO014UMWZ/xWhA+fKMwUrfoyMLgN+BKm2sOxdOXKjsvpt9nbhuCbms8fEmLN
 gudmz3Q2lE/w6bgH/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=rv2twFBz
Subject: [Buildroot] [PATCH v2 1/1] package/libglib2: security bump to
 version 2.88.3
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There have been a number of security fixes of mixed severity in
libglib2 since 2.86.0, sorted by release:

2.87.1
* CVE-2025-13601: Incorrect calculation of buffer size in
  g_escape_uri_string()
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3827
* CVE-2025-14087: Buffer underflow on Glib through glib/gvariant via
  bytestring_parse() or string_parse() leads to OOB Write
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3834
* CVE-2025-14512: GIO: Integer overflow in file attribute escaping
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3845

2.87.3
* CVE-2026-1484: Integer Overflow -> Buffer Underflow on Glib through
  glib/gbase64.c via g_base64_encode_close() leads to OOB Write
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3870
* CVE-2026-1485: Buffer underflow on Glib through
  gio/gcontenttype-fdo.c via parse_header() lead to OOB Read/Write
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3871
* CVE-2026-1489: Integer Overflow on Glib through glib/guniprop.c via
  output_marks() lead to OOB Write in glib/gutf8.c:g_unichar_to_utf8()
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3872

2.88.1
* CVE-2026-58010: Buffer Over-read on GLib through
  glib/gvariant-serialiser.c:1253 via gvs_tuple_is_normal()
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3915
* CVE-2026-58011: OOB Read on GLib through
  glib/gdatetime.c:g_date_time_get_ymd via invalid `GDateTime`
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3917
* CVE-2026-58012: Buffer Over-read on GLib's g_regex_replace() through
  glib/gregex.c:string_append() via g_utf8_next_char()
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3918
* CVE-2026-58013: Buffer Over-read on GLib through glib/giochannel.c
  via "g_io_channel_read_line_backend"
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3925
* CVE-2026-58014: Off-by-one Error on GLib through glib/gkeyfile.c via
  "g_key_file_get_locale_string_list"
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3930
* CVE-2026-58015: Path Traversal on GLib DBus through
  glib/gio/gdbusauthmechanismsha1.c via keyring_lookup_entry,
  mechanism_client_data_receive (COOKIE_SHA1 Client Authentication)
  leads to Arbitrary File Read (sort of)
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3931

2.88.3
* CVE-2026-15588: GDBusServer pre-authentication DoS via unbounded
  SASL line buffering
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3985

Full upstream changelog:
https://gitlab.gnome.org/GNOME/glib/-/blob/2.88.3/NEWS?ref_type=tags

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* fix URL of upstream hash file (I forgot to update that along with the
  hash itself)

 package/libglib2/libglib2.hash | 4 ++--
 package/libglib2/libglib2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 09cd8e9979..8970ef74e3 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.86/glib-2.86.5.sha256sum
-sha256  ce85a947bb8b3c0204dbeff79aec39bcb46371c6fafb64ba5b8726c71e038d5f  glib-2.86.5.tar.xz
+# https://download.gnome.org/sources/glib/2.88/glib-2.88.3.sha256sum
+sha256  ab24d24e698dfa1e408b7bcdb508f4aafc906185a8b8ce72fdf79bbbdc9b383b  glib-2.88.3.tar.xz
 # License files, locally calculated
 sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index ae4b653a15..bfe4920291 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.86
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).5
+LIBGLIB2_VERSION_MAJOR = 2.88
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
