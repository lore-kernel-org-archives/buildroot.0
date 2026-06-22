Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70192CDB471
	for <buildroot@archiver.kernel.org>; Mon, 22 Jun 2026 07:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC0BC616BA;
	Mon, 22 Jun 2026 07:17:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sdycxa4UEFav; Mon, 22 Jun 2026 07:17:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B57B06F7D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782112628;
	bh=mlNIpAdDrU0ap5JzOnwQHjBApyl19BaNn+77HrDdHa0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kVjx+32B68nzB8I03I6Y53j7jRNbWmpdsN0sMgpNbrPxI0rmlpnNMFM8GJ2P/1AvE
	 V/3KqfM9zdrt1k98sB6r+Q8jvd01l9uEBLPhkmeQr92xcbkMcAoWQSsMuTKI1PfBjj
	 VhKdSchY5YnCMpabRhecO9cyHZ8pD2c+XRNYJiDZE/zEZqaQNNKxDpjkTXkA6Kl8MR
	 ru1Vj+vwpXzqRRs5ZW/vAqF4xGnqNJCpLqZv2GKQpRJSLDOGKVzhfXxF9S+fj9RyYI
	 t5g0xVZ7Ize9bNSKlcmqdak+xilWIk+JNc9rtJJzZbybvKua4FAiKCQnoXBWWOuAdn
	 uBR7zqhPlUAuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B57B06F7D0;
	Mon, 22 Jun 2026 07:17:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DC54424D
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 07:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C02F66F7D0
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 07:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHOm16acWa6I for <buildroot@buildroot.org>;
 Mon, 22 Jun 2026 07:17:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0FAAE616BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FAAE616BA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FAAE616BA
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 07:17:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c132.dip0.t-ipconnect.de [79.214.193.50])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 616D9A4C246C
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 09:17:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58942)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wbYtx-000000000VV-2fOx
 for buildroot@buildroot.org; Mon, 22 Jun 2026 07:17:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 22 Jun 2026 09:17:01 +0200
Message-ID: <20260622071701.50248-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1782112622;
 bh=hld6WEu1ftwtmL9eHIyQzISausAiFWy1v6SrZB0bvxI=;
 h=From:To:Subject:Date:From;
 b=flV5A7Y8CeNNs/pOXviakOjuH3cZu3fUtyPVWbOIdKR6tzRFqGOBCHPomhlwOazFE
 q0rBMLopH2UX3e2hikvQdaTbW0sIaleL207X1MoI+Ke7MvEvANWcG96eLILWbzS8aK
 A2yvcN3v1B3Q/+w4g6ns1aBqPmOyDMC+RyTnzsdJW80UeqRHTC49fJvsqu5D8ww/C5
 icBXrsngyAFGpp/L8iL7SenMlg3iQyQPuhs0i53OFI48/XXAfJA+bifLg2LScKYsbR
 w/Xk5Oo0gjW4/0eReTPl0sSyuXqBJ24C3bvRl+IRcYHnMu9Db3/xZ+PJAsiybvK3Yw
 UHSZ23dMxbPvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=flV5A7Y8
Subject: [Buildroot] [PATCH 1/1] package/jsoncpp: bump version to 1.9.8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.8

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/180bb28cf330d570a1c6be7c78525a4e552f0d25
with the exception of bootlin-m68k-68040-uclibc and
bootlin-s390x-z13-glibc which cause unrelated configure errors "Unknown
CPU" in kodi that will be solved by a separate commit.

 ...reakage-when-compiled-with-C-17-1668.patch | 192 ------------------
 package/jsoncpp/jsoncpp.hash                  |   2 +-
 package/jsoncpp/jsoncpp.mk                    |   2 +-
 3 files changed, 2 insertions(+), 194 deletions(-)
 delete mode 100644 package/jsoncpp/0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668.patch

diff --git a/package/jsoncpp/0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668.patch b/package/jsoncpp/0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668.patch
deleted file mode 100644
index 938c332185..0000000000
--- a/package/jsoncpp/0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668.patch
+++ /dev/null
@@ -1,192 +0,0 @@
-From e9e752beacba6ee0fcb7819109229541c8b5a1e2 Mon Sep 17 00:00:00 2001
-From: Jordan Bayles <jophba@chromium.org>
-Date: Tue, 7 Apr 2026 21:58:40 -0700
-Subject: [PATCH] Fix C++11 ABI breakage when compiled with C++17 (#1668)
-
-When JSONCPP_HAS_STRING_VIEW was defined, the library dropped the
-`const char*` and `const String&` overloads for `operator[]`, `get`,
-`removeMember`, and `isMember`, breaking ABI compatibility for projects
-consuming the library with C++11.
-
-This change unconditionally declares and defines the legacy overloads
-so they are always exported, restoring compatibility.
-
-Upstream: https://github.com/open-source-parsers/jsoncpp/pull/1675
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- include/json/value.h        | 15 +++++----------
- src/lib_json/json_value.cpp | 15 +++++----------
- 2 files changed, 10 insertions(+), 20 deletions(-)
-
-diff --git a/include/json/value.h b/include/json/value.h
-index f32f456..1369f92 100644
---- a/include/json/value.h
-+++ b/include/json/value.h
-@@ -501,7 +501,7 @@ public:
-   /// that name.
-   /// \param key may contain embedded nulls.
-   const Value& operator[](std::string_view key) const;
--#else
-+#endif
-   /// Access an object value by name, create a null member if it does not exist.
-   /// \note Because of our implementation, keys are limited to 2^30 -1 chars.
-   /// Exceeding that will cause an exception.
-@@ -516,7 +516,6 @@ public:
-   /// that name.
-   /// \param key may contain embedded nulls.
-   const Value& operator[](const String& key) const;
--#endif
-   /** \brief Access an object value by name, create a null member if it does not
-    * exist.
-    *
-@@ -534,7 +533,7 @@ public:
-   /// Return the member named key if it exist, defaultValue otherwise.
-   /// \note deep copy
-   Value get(std::string_view key, const Value& defaultValue) const;
--#else
-+#endif
-   /// Return the member named key if it exist, defaultValue otherwise.
-   /// \note deep copy
-   Value get(const char* key, const Value& defaultValue) const;
-@@ -542,7 +541,6 @@ public:
-   /// \note deep copy
-   /// \param key may contain embedded nulls.
-   Value get(const String& key, const Value& defaultValue) const;
--#endif
-   /// Return the member named key if it exist, defaultValue otherwise.
-   /// \note deep copy
-   /// \note key may contain embedded nulls.
-@@ -589,12 +587,11 @@ public:
-   /// \post type() is unchanged
- #if JSONCPP_HAS_STRING_VIEW
-   void removeMember(std::string_view key);
--#else
-+#endif
-   void removeMember(const char* key);
-   /// Same as removeMember(const char*)
-   /// \param key may contain embedded nulls.
-   void removeMember(const String& key);
--#endif
-   /** \brief Remove the named map member.
-    *
-    *  Update 'removed' iff removed.
-@@ -603,12 +600,11 @@ public:
-    */
- #if JSONCPP_HAS_STRING_VIEW
-   bool removeMember(std::string_view key, Value* removed);
--#else
-+#endif
-   bool removeMember(String const& key, Value* removed);
-   /// Same as removeMember(const char* begin, const char* end, Value* removed),
-   /// but 'key' is null-terminated.
-   bool removeMember(const char* key, Value* removed);
--#endif
-   /// Same as removeMember(String const& key, Value* removed)
-   bool removeMember(const char* begin, const char* end, Value* removed);
-   /** \brief Remove the indexed array element.
-@@ -623,14 +619,13 @@ public:
-   /// Return true if the object has a member named key.
-   /// \param key may contain embedded nulls.
-   bool isMember(std::string_view key) const;
--#else
-+#endif
-   /// Return true if the object has a member named key.
-   /// \note 'key' must be null-terminated.
-   bool isMember(const char* key) const;
-   /// Return true if the object has a member named key.
-   /// \param key may contain embedded nulls.
-   bool isMember(const String& key) const;
--#endif
-   /// Same as isMember(String const& key)const
-   bool isMember(const char* begin, const char* end) const;
- 
-diff --git a/src/lib_json/json_value.cpp b/src/lib_json/json_value.cpp
-index 74f7789..953d58e 100644
---- a/src/lib_json/json_value.cpp
-+++ b/src/lib_json/json_value.cpp
-@@ -1200,7 +1200,7 @@ const Value& Value::operator[](std::string_view key) const {
- Value& Value::operator[](std::string_view key) {
-   return resolveReference(key.data(), key.data() + key.length());
- }
--#else
-+#endif
- const Value& Value::operator[](const char* key) const {
-   Value const* found = find(key, key + strlen(key));
-   if (!found)
-@@ -1221,7 +1221,6 @@ Value& Value::operator[](const char* key) {
- Value& Value::operator[](const String& key) {
-   return resolveReference(key.data(), key.data() + key.length());
- }
--#endif
- 
- Value& Value::operator[](const StaticString& key) {
-   return resolveReference(key.c_str());
-@@ -1265,14 +1264,13 @@ Value Value::get(char const* begin, char const* end,
- Value Value::get(std::string_view key, const Value& defaultValue) const {
-   return get(key.data(), key.data() + key.length(), defaultValue);
- }
--#else
-+#endif
- Value Value::get(char const* key, Value const& defaultValue) const {
-   return get(key, key + strlen(key), defaultValue);
- }
- Value Value::get(String const& key, Value const& defaultValue) const {
-   return get(key.data(), key.data() + key.length(), defaultValue);
- }
--#endif
- 
- bool Value::removeMember(const char* begin, const char* end, Value* removed) {
-   if (type() != objectValue) {
-@@ -1292,14 +1290,13 @@ bool Value::removeMember(const char* begin, const char* end, Value* removed) {
- bool Value::removeMember(std::string_view key, Value* removed) {
-   return removeMember(key.data(), key.data() + key.length(), removed);
- }
--#else
-+#endif
- bool Value::removeMember(const char* key, Value* removed) {
-   return removeMember(key, key + strlen(key), removed);
- }
- bool Value::removeMember(String const& key, Value* removed) {
-   return removeMember(key.data(), key.data() + key.length(), removed);
- }
--#endif
- 
- #ifdef JSONCPP_HAS_STRING_VIEW
- void Value::removeMember(std::string_view key) {
-@@ -1312,7 +1309,7 @@ void Value::removeMember(std::string_view key) {
-                      CZString::noDuplication);
-   value_.map_->erase(actualKey);
- }
--#else
-+#endif
- void Value::removeMember(const char* key) {
-   JSON_ASSERT_MESSAGE(type() == nullValue || type() == objectValue,
-                       "in Json::Value::removeMember(): requires objectValue");
-@@ -1323,7 +1320,6 @@ void Value::removeMember(const char* key) {
-   value_.map_->erase(actualKey);
- }
- void Value::removeMember(const String& key) { removeMember(key.c_str()); }
--#endif
- 
- bool Value::removeIndex(ArrayIndex index, Value* removed) {
-   if (type() != arrayValue) {
-@@ -1357,14 +1353,13 @@ bool Value::isMember(char const* begin, char const* end) const {
- bool Value::isMember(std::string_view key) const {
-   return isMember(key.data(), key.data() + key.length());
- }
--#else
-+#endif
- bool Value::isMember(char const* key) const {
-   return isMember(key, key + strlen(key));
- }
- bool Value::isMember(String const& key) const {
-   return isMember(key.data(), key.data() + key.length());
- }
--#endif
- 
- Value::Members Value::getMemberNames() const {
-   JSON_ASSERT_MESSAGE(
--- 
-2.47.3
-
diff --git a/package/jsoncpp/jsoncpp.hash b/package/jsoncpp/jsoncpp.hash
index 50344665a4..dcd1605996 100644
--- a/package/jsoncpp/jsoncpp.hash
+++ b/package/jsoncpp/jsoncpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  830bf352d822d8558e9d0eb19d640d2e38536b4b6699c30a4488da09d5b1df18  jsoncpp-1.9.7.tar.gz
+sha256  51828cf3574281d2b79ec2a1c56a9e4c20cc1103711321ea96384cffb8d2d904  jsoncpp-1.9.8.tar.gz
 sha256  cec0db5f6d7ed6b3a72647bd50aed02e13c3377fd44382b96dc2915534c042ad  LICENSE
diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index 3984903640..7a47277590 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSONCPP_VERSION = 1.9.7
+JSONCPP_VERSION = 1.9.8
 JSONCPP_SITE = $(call github,open-source-parsers,jsoncpp,$(JSONCPP_VERSION))
 JSONCPP_LICENSE = Public Domain or MIT
 JSONCPP_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
