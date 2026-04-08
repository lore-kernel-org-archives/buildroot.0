Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54497FD5F99
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 08:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BF6080A6A;
	Wed,  8 Apr 2026 08:54:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VAwH0Ts0-evx; Wed,  8 Apr 2026 08:54:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C83D280847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775638491;
	bh=sub9zwssLH6e08w91i+rMuRDjX7IwPiJ0a0f+pR8x90=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zmrx7Fo9DG9ufS1CWDcGAqRp3Jw89EfJuy4uhT9TTu8GrBhW755QWaC7BhoSsOs6V
	 s6gKMikCcqOyNvfCqEkjU8NqWa2kVbtpNyrX8rOsTA4O/rV2/vbodKGbKwF9wvHdSI
	 tUekcBMaXyFf7ofqApDoq77Y5cagXMgNmtyHtEbj4//PA8Vp+pSLSY/MHEjrAvhhP8
	 fHy8bAqDqqaRsDJVd0K8hmtJT0zG095qBHIcXN+AilkegifMtClxvKlsirUBiqD5iL
	 M4uIuTouu4RMgd+EUfT0euWCktvZVXt/zuX5GRs4TJ9hzdY9bg/xFlVcPa+lbvBhoV
	 K0E37GI3fCACA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C83D280847;
	Wed,  8 Apr 2026 08:54:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E031B237
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 08:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C65458082C
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 08:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-ocmKVJEnB8 for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 08:54:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C5D3280781
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5D3280781
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5D3280781
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 08:54:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 82710A4C10EC
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 10:54:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36176)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAOgN-0000000052L-2g9f
 for buildroot@buildroot.org; Wed, 08 Apr 2026 08:54:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  8 Apr 2026 10:54:43 +0200
Message-ID: <20260408085443.1641719-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775638484;
 bh=cSCfMSJZ1p15xlV5JamfORVkCS3IrF0KFQG/hrusbKo=;
 h=From:To:Subject:Date:From;
 b=uEJhQ0/lCfnQpj/K9AVIHrdHfNDc6E+KC0TRLEZCTWhORrMNZ82Ww7nYKmMK4AUua
 fP60C5n4c+yJ1R1wR9yoeC4oYy+UV09J0Ae1agl4m8SAg2wGRicLbsFsRGY4KMSmPD
 LicRoGeXaPVoGIoGINyi31RFWoxbc4/FoSjw+sjUvOFQ62gv+fsltfmFnUfo+huKsu
 C+1zDEVgJ/0y4Al7EEC+tAroN7Xix1QJ59YNFuJ13TIMNdC+8SaJwcLDY3ZoGWoGpd
 GeQlB/wr499pWBHlRXidTi8IVzXO5DeI6C1eNk8yLN6hGP8uMW9CVlXve9ajJRYecU
 V3+OoTZ1D3SOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=uEJhQ0/l
Subject: [Buildroot] [PATCH 1/1] package/jsoncpp: bump version to 1.9.7
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

https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.7

Added patch from upstream PR to fix a build error with C++17 seen with
gerbera.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...reakage-when-compiled-with-C-17-1668.patch | 192 ++++++++++++++++++
 package/jsoncpp/jsoncpp.hash                  |   2 +-
 package/jsoncpp/jsoncpp.mk                    |   2 +-
 3 files changed, 194 insertions(+), 2 deletions(-)
 create mode 100644 package/jsoncpp/0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668.patch

diff --git a/package/jsoncpp/0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668.patch b/package/jsoncpp/0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668.patch
new file mode 100644
index 0000000000..938c332185
--- /dev/null
+++ b/package/jsoncpp/0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668.patch
@@ -0,0 +1,192 @@
+From e9e752beacba6ee0fcb7819109229541c8b5a1e2 Mon Sep 17 00:00:00 2001
+From: Jordan Bayles <jophba@chromium.org>
+Date: Tue, 7 Apr 2026 21:58:40 -0700
+Subject: [PATCH] Fix C++11 ABI breakage when compiled with C++17 (#1668)
+
+When JSONCPP_HAS_STRING_VIEW was defined, the library dropped the
+`const char*` and `const String&` overloads for `operator[]`, `get`,
+`removeMember`, and `isMember`, breaking ABI compatibility for projects
+consuming the library with C++11.
+
+This change unconditionally declares and defines the legacy overloads
+so they are always exported, restoring compatibility.
+
+Upstream: https://github.com/open-source-parsers/jsoncpp/pull/1675
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ include/json/value.h        | 15 +++++----------
+ src/lib_json/json_value.cpp | 15 +++++----------
+ 2 files changed, 10 insertions(+), 20 deletions(-)
+
+diff --git a/include/json/value.h b/include/json/value.h
+index f32f456..1369f92 100644
+--- a/include/json/value.h
++++ b/include/json/value.h
+@@ -501,7 +501,7 @@ public:
+   /// that name.
+   /// \param key may contain embedded nulls.
+   const Value& operator[](std::string_view key) const;
+-#else
++#endif
+   /// Access an object value by name, create a null member if it does not exist.
+   /// \note Because of our implementation, keys are limited to 2^30 -1 chars.
+   /// Exceeding that will cause an exception.
+@@ -516,7 +516,6 @@ public:
+   /// that name.
+   /// \param key may contain embedded nulls.
+   const Value& operator[](const String& key) const;
+-#endif
+   /** \brief Access an object value by name, create a null member if it does not
+    * exist.
+    *
+@@ -534,7 +533,7 @@ public:
+   /// Return the member named key if it exist, defaultValue otherwise.
+   /// \note deep copy
+   Value get(std::string_view key, const Value& defaultValue) const;
+-#else
++#endif
+   /// Return the member named key if it exist, defaultValue otherwise.
+   /// \note deep copy
+   Value get(const char* key, const Value& defaultValue) const;
+@@ -542,7 +541,6 @@ public:
+   /// \note deep copy
+   /// \param key may contain embedded nulls.
+   Value get(const String& key, const Value& defaultValue) const;
+-#endif
+   /// Return the member named key if it exist, defaultValue otherwise.
+   /// \note deep copy
+   /// \note key may contain embedded nulls.
+@@ -589,12 +587,11 @@ public:
+   /// \post type() is unchanged
+ #if JSONCPP_HAS_STRING_VIEW
+   void removeMember(std::string_view key);
+-#else
++#endif
+   void removeMember(const char* key);
+   /// Same as removeMember(const char*)
+   /// \param key may contain embedded nulls.
+   void removeMember(const String& key);
+-#endif
+   /** \brief Remove the named map member.
+    *
+    *  Update 'removed' iff removed.
+@@ -603,12 +600,11 @@ public:
+    */
+ #if JSONCPP_HAS_STRING_VIEW
+   bool removeMember(std::string_view key, Value* removed);
+-#else
++#endif
+   bool removeMember(String const& key, Value* removed);
+   /// Same as removeMember(const char* begin, const char* end, Value* removed),
+   /// but 'key' is null-terminated.
+   bool removeMember(const char* key, Value* removed);
+-#endif
+   /// Same as removeMember(String const& key, Value* removed)
+   bool removeMember(const char* begin, const char* end, Value* removed);
+   /** \brief Remove the indexed array element.
+@@ -623,14 +619,13 @@ public:
+   /// Return true if the object has a member named key.
+   /// \param key may contain embedded nulls.
+   bool isMember(std::string_view key) const;
+-#else
++#endif
+   /// Return true if the object has a member named key.
+   /// \note 'key' must be null-terminated.
+   bool isMember(const char* key) const;
+   /// Return true if the object has a member named key.
+   /// \param key may contain embedded nulls.
+   bool isMember(const String& key) const;
+-#endif
+   /// Same as isMember(String const& key)const
+   bool isMember(const char* begin, const char* end) const;
+ 
+diff --git a/src/lib_json/json_value.cpp b/src/lib_json/json_value.cpp
+index 74f7789..953d58e 100644
+--- a/src/lib_json/json_value.cpp
++++ b/src/lib_json/json_value.cpp
+@@ -1200,7 +1200,7 @@ const Value& Value::operator[](std::string_view key) const {
+ Value& Value::operator[](std::string_view key) {
+   return resolveReference(key.data(), key.data() + key.length());
+ }
+-#else
++#endif
+ const Value& Value::operator[](const char* key) const {
+   Value const* found = find(key, key + strlen(key));
+   if (!found)
+@@ -1221,7 +1221,6 @@ Value& Value::operator[](const char* key) {
+ Value& Value::operator[](const String& key) {
+   return resolveReference(key.data(), key.data() + key.length());
+ }
+-#endif
+ 
+ Value& Value::operator[](const StaticString& key) {
+   return resolveReference(key.c_str());
+@@ -1265,14 +1264,13 @@ Value Value::get(char const* begin, char const* end,
+ Value Value::get(std::string_view key, const Value& defaultValue) const {
+   return get(key.data(), key.data() + key.length(), defaultValue);
+ }
+-#else
++#endif
+ Value Value::get(char const* key, Value const& defaultValue) const {
+   return get(key, key + strlen(key), defaultValue);
+ }
+ Value Value::get(String const& key, Value const& defaultValue) const {
+   return get(key.data(), key.data() + key.length(), defaultValue);
+ }
+-#endif
+ 
+ bool Value::removeMember(const char* begin, const char* end, Value* removed) {
+   if (type() != objectValue) {
+@@ -1292,14 +1290,13 @@ bool Value::removeMember(const char* begin, const char* end, Value* removed) {
+ bool Value::removeMember(std::string_view key, Value* removed) {
+   return removeMember(key.data(), key.data() + key.length(), removed);
+ }
+-#else
++#endif
+ bool Value::removeMember(const char* key, Value* removed) {
+   return removeMember(key, key + strlen(key), removed);
+ }
+ bool Value::removeMember(String const& key, Value* removed) {
+   return removeMember(key.data(), key.data() + key.length(), removed);
+ }
+-#endif
+ 
+ #ifdef JSONCPP_HAS_STRING_VIEW
+ void Value::removeMember(std::string_view key) {
+@@ -1312,7 +1309,7 @@ void Value::removeMember(std::string_view key) {
+                      CZString::noDuplication);
+   value_.map_->erase(actualKey);
+ }
+-#else
++#endif
+ void Value::removeMember(const char* key) {
+   JSON_ASSERT_MESSAGE(type() == nullValue || type() == objectValue,
+                       "in Json::Value::removeMember(): requires objectValue");
+@@ -1323,7 +1320,6 @@ void Value::removeMember(const char* key) {
+   value_.map_->erase(actualKey);
+ }
+ void Value::removeMember(const String& key) { removeMember(key.c_str()); }
+-#endif
+ 
+ bool Value::removeIndex(ArrayIndex index, Value* removed) {
+   if (type() != arrayValue) {
+@@ -1357,14 +1353,13 @@ bool Value::isMember(char const* begin, char const* end) const {
+ bool Value::isMember(std::string_view key) const {
+   return isMember(key.data(), key.data() + key.length());
+ }
+-#else
++#endif
+ bool Value::isMember(char const* key) const {
+   return isMember(key, key + strlen(key));
+ }
+ bool Value::isMember(String const& key) const {
+   return isMember(key.data(), key.data() + key.length());
+ }
+-#endif
+ 
+ Value::Members Value::getMemberNames() const {
+   JSON_ASSERT_MESSAGE(
+-- 
+2.47.3
+
diff --git a/package/jsoncpp/jsoncpp.hash b/package/jsoncpp/jsoncpp.hash
index 0fa9b89422..50344665a4 100644
--- a/package/jsoncpp/jsoncpp.hash
+++ b/package/jsoncpp/jsoncpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f93b6dd7ce796b13d02c108bc9f79812245a82e577581c4c9aabe57075c90ea2  jsoncpp-1.9.6.tar.gz
+sha256  830bf352d822d8558e9d0eb19d640d2e38536b4b6699c30a4488da09d5b1df18  jsoncpp-1.9.7.tar.gz
 sha256  cec0db5f6d7ed6b3a72647bd50aed02e13c3377fd44382b96dc2915534c042ad  LICENSE
diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index 9915907ea8..3984903640 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSONCPP_VERSION = 1.9.6
+JSONCPP_VERSION = 1.9.7
 JSONCPP_SITE = $(call github,open-source-parsers,jsoncpp,$(JSONCPP_VERSION))
 JSONCPP_LICENSE = Public Domain or MIT
 JSONCPP_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
