Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEB1C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 15:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C315A80E2A;
	Wed,  5 Feb 2025 15:32:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QYsesyYxK-QX; Wed,  5 Feb 2025 15:31:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D6A380BDE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D6A380BDE;
	Wed,  5 Feb 2025 15:31:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 096D312A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E229580BDE
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:31:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0JeCoE7SbmLn for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 15:31:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8AAF880A74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AAF880A74
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8AAF880A74
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:31:56 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3d051dca3b6so2459095ab.1
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 07:31:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738769515; x=1739374315;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=luBd1NHBiKyVLak2QjSXaIH+Blt5XP9crTbX84MXVHc=;
 b=B9ltPEYiaO/8pNPDmow35BGsPe0zZwzfD9VTlAtN0cbKA4bi0FeY4yB29CxHXG8Xhh
 hLBBQ5V9rX/nRYVpDOERwM+lM2X7rPzIOUvJ0PTpEC5RyEm/8YNLvnIwTcWboO5PP6Pq
 Gs6zsrilqFtSKDA+TcSE5v0SB/HY5InC+nbryH/hyHs0oGbJuRzy9BVLVt2NzkezMjBy
 Phn5J9QucnuYM2lmc+LkUFDRKOg4am0CvKwMndHBYFLp4xeWayawzaPEj5IyUgCg1vBi
 EB0+icJpT3txbwbsMUv7bNO4Mr9xsBKZcy4s5pcuCzGXVZblvUFrd7N9UqMLTkwdNmcG
 av0A==
X-Gm-Message-State: AOJu0YxNURScRIVsOEoeyC40TPFYS2YTWtXENm8siYTGtGddgCcEvmxr
 PwVxOqNJePGM4W60jhHciLL+2mPSAtCnYIORrU5ZE0u6QLw1QFLR7/0GXA==
X-Gm-Gg: ASbGncvc+gM1a1Hx88wOiStN6E9ORKFgvys2LFPZQ26+zc+vLWGDVM0niLG2DRuaXlp
 +LwPhcdXHyd0IBRjDObSfCC2jAWTu7Z4u5oG2isxcvnE4qy3G5BHltvGwW5620TCW8j2qT24MiK
 J9aKu1FVLkKnN0B6hWPMWjUMPYAkIDpkF0v4754e/9Y5BSfbdlEiMWMDIGPRUxMgQ6ENhqL1oR5
 lP7mw8WwQerk9sR2P2S9vpmVrwOR5wA467WVaVY3Rs8rQ0z3ySOPl3OfBjzs02SQTY/IcK7vGbZ
 lVvX2B68MztDndeqFDwMFxdoOaTse/Zo0eKVCuAQRw39hzIpw7hY8RXe6UGI16Azpw==
X-Google-Smtp-Source: AGHT+IGyxrhEpuTEETqEZZ4PrHatDI2CJsZeeJ1rmJD/hrghMFH49tFPwYImF3Y92iNHkIMiDXUkhA==
X-Received: by 2002:a05:6e02:1fe1:b0:3d0:4a82:3f40 with SMTP id
 e9e14a558f8ab-3d04f427d4fmr32430605ab.7.1738769515073; 
 Wed, 05 Feb 2025 07:31:55 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec746c2db5sm3274755173.123.2025.02.05.07.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2025 07:31:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Wed,  5 Feb 2025 08:31:53 -0700
Message-Id: <20250205153153.3283650-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738769515; x=1739374315; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=luBd1NHBiKyVLak2QjSXaIH+Blt5XP9crTbX84MXVHc=;
 b=jd/LXF6YPUFThOFYmIecOai+1Ej+sS0zR+tMCTDvhwenpywGfi+BgLXGdIZLlUp/gi
 lXjqQRMtMn3pSHQqTgNzfkdH6JIlPnANJzHH0NXtY96y5huigSbU/knw3I6NYdHRbH/U
 pdkNbDQpgepnzr/MKsecutOcyy+LU+bgF14BAzXsKfgnKCp34iVYrdYthhcVBbO2ctFX
 B72Xg56LFj5YRmFS9sk5qUgltplgm82e6vLiM5oA3EFXf32s1PE0i0BPYB4TpQBLGRyH
 YY9i+LUSFJYBrg8IQiF/ZfaS/STcIjjsqY1E1QyQv8KZ1xpbcgFquo7sJhaubTr3fG+B
 GlHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jd/LXF6Y
Subject: [Buildroot] [PATCH 1/1] package/protobuf-c: bump to version 1.5.1
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

License hash changed due to year update:
https://github.com/protobuf-c/protobuf-c/commit/53e0b201db240694f8c8aabf0d0b579de33bf24d

Drop patches which are now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...ct-against-being-invoked-against-edi.patch | 57 -------------
 ...dSyntax-to-maximize-compatibility-ac.patch | 84 -------------------
 ...nerateHeader-Set-min_header_version-.patch | 44 ----------
 package/protobuf-c/protobuf-c.hash            |  4 +-
 package/protobuf-c/protobuf-c.mk              |  2 +-
 5 files changed, 3 insertions(+), 188 deletions(-)
 delete mode 100644 package/protobuf-c/0001-CGenerator-Protect-against-being-invoked-against-edi.patch
 delete mode 100644 package/protobuf-c/0002-Reimplement-FieldSyntax-to-maximize-compatibility-ac.patch
 delete mode 100644 package/protobuf-c/0003-FileGenerator-GenerateHeader-Set-min_header_version-.patch

diff --git a/package/protobuf-c/0001-CGenerator-Protect-against-being-invoked-against-edi.patch b/package/protobuf-c/0001-CGenerator-Protect-against-being-invoked-against-edi.patch
deleted file mode 100644
index c674ca2ee1..0000000000
--- a/package/protobuf-c/0001-CGenerator-Protect-against-being-invoked-against-edi.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 2480f4d9d2fa97e5511ed0914ee529a344e969a7 Mon Sep 17 00:00:00 2001
-From: Robert Edmonds <edmonds@users.noreply.github.com>
-Date: Wed, 20 Mar 2024 22:43:30 -0400
-Subject: [PATCH] CGenerator: Protect against being invoked against "edition"
- syntax .proto files
-
-The Google protobuf project is currently experimenting with a new syntax
-for .proto files called "editions". Since protobuf-c is a proto2/proto3
-compiler, after the previous commit reimplementing `FieldSyntax()`, the
-protobuf compiler will abort like this if presented with an "editions"
-syntax .proto file due to the safety check in `FieldSyntax()`:
-
-    $ protoc --experimental_editions --c_out=. test.proto
-    protoc-gen-c: ./protoc-c/c_helpers.h:178: int google::protobuf::compiler::c::FieldSyntax(const google::protobuf::FieldDescriptor*): Assertion `syntax == "proto2" || syntax == "proto3"' failed.
-    --c_out: protoc-gen-c: Plugin killed by signal 6.
-
-On protobuf 26, our `CodeGenerator` can implement certain methods to
-declare that we "support" editions, and then reject any other edition
-except proto2 and proto3, which have apparently been retroactively
-declared to be "editions". Of course this needs to be wrapped in a
-version guard.
-
-With this protection in place, the protobuf compiler cleanly exits with
-a nice error message like this:
-
-    $ protoc --experimental_editions --c_out=. test.proto
-    WARNING: All log messages before absl::InitializeLog() is called are written to STDERR
-    E0000 00:00:1710988958.296200   20022 descriptor.cc:4620] Invalid proto descriptor for file "test.proto":
-    E0000 00:00:1710988958.296239   20022 descriptor.cc:4623]   test.proto: Edition 2023 is later than the maximum supported edition PROTO3
-    --c_out: protoc-gen-c: Plugin failed with status code 1.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Upstream: https://github.com/protobuf-c/protobuf-c/pull/711
----
- protoc-c/c_generator.h | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/protoc-c/c_generator.h b/protoc-c/c_generator.h
-index b8b44aa..4aeb579 100644
---- a/protoc-c/c_generator.h
-+++ b/protoc-c/c_generator.h
-@@ -93,6 +93,12 @@ class PROTOC_C_EXPORT CGenerator : public CodeGenerator {
-                 const std::string& parameter,
-                 OutputDirectory* output_directory,
-                 std::string* error) const;
-+
-+#if GOOGLE_PROTOBUF_VERSION >= 5026000
-+  uint64_t GetSupportedFeatures() const { return CodeGenerator::FEATURE_SUPPORTS_EDITIONS; }
-+  Edition GetMinimumEdition() const { return Edition::EDITION_PROTO2; }
-+  Edition GetMaximumEdition() const { return Edition::EDITION_PROTO3; }
-+#endif
- };
- 
- }  // namespace c
--- 
-2.34.1
-
diff --git a/package/protobuf-c/0002-Reimplement-FieldSyntax-to-maximize-compatibility-ac.patch b/package/protobuf-c/0002-Reimplement-FieldSyntax-to-maximize-compatibility-ac.patch
deleted file mode 100644
index e14a9fbc75..0000000000
--- a/package/protobuf-c/0002-Reimplement-FieldSyntax-to-maximize-compatibility-ac.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From ee3d9e5423c93ee6b828fdda8e7fef13a77634eb Mon Sep 17 00:00:00 2001
-From: Robert Edmonds <edmonds@users.noreply.github.com>
-Date: Wed, 20 Mar 2024 22:25:54 -0400
-Subject: [PATCH] Reimplement FieldSyntax() to maximize compatibility across
- protobuf versions
-
-Recent versions of Google protobuf have broken the interfaces for
-determining the syntax version of a .proto file. The current protobuf-c
-1.5.0 release does not compile with Google protobuf 26.0 due to the most
-recentage breakage. There is a possible workaround involving the Google
-protobuf `FileDescriptorLegacy` class, which is documented as:
-
-// TODO Remove this deprecated API entirely.
-
-So we probably shouldn't rely on it.
-
-Instead, this commit obtains the `FileDescriptorProto` corresponding
-to the passed in `FieldDescriptor` and interrogates the `syntax` field
-directly. This is a single implementation with no version-specific
-workarounds. Hopefully this won't break in the next Google protobuf
-release.
-
-I tested the `FieldSyntax()` implementation in this commit across a
-number of different Google protobuf releases and found that it worked
-(`make && make check`) on all of them:
-
-- Google protobuf 3.6.1.3 (Ubuntu 20.04)
-- Google protobuf 3.12.4 (Ubuntu 22.04)
-- Google protobuf 3.21.12 (Debian 12 + Debian unstable)
-- Google protobuf 3.25.2 (Debian experimental)
-- Google protobuf 26.1-dev
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Upstream: https://github.com/protobuf-c/protobuf-c/pull/711
----
- protoc-c/c_helpers.h | 24 ++++++++++++++----------
- 1 file changed, 14 insertions(+), 10 deletions(-)
-
-diff --git a/protoc-c/c_helpers.h b/protoc-c/c_helpers.h
-index 062d330..be28b60 100644
---- a/protoc-c/c_helpers.h
-+++ b/protoc-c/c_helpers.h
-@@ -70,10 +70,6 @@
- #include <protobuf-c/protobuf-c.pb.h>
- #include <google/protobuf/io/printer.h>
- 
--#if GOOGLE_PROTOBUF_VERSION >= 4023000
--# include <google/protobuf/descriptor_legacy.h>
--#endif
--
- namespace google {
- namespace protobuf {
- namespace compiler {
-@@ -173,13 +169,21 @@ struct NameIndex
- int compare_name_indices_by_name(const void*, const void*);
- 
- // Return the syntax version of the file containing the field.
--// This wrapper is needed to be able to compile against protobuf2.
- inline int FieldSyntax(const FieldDescriptor* field) {
--#if GOOGLE_PROTOBUF_VERSION >= 4023000
--  return FileDescriptorLegacy(field->file()).syntax() == FileDescriptorLegacy::SYNTAX_PROTO3 ? 3 : 2;
--#else
--  return field->file()->syntax() == FileDescriptor::SYNTAX_PROTO3 ? 3 : 2;
--#endif
-+  auto proto = FileDescriptorProto();
-+  field->file()->CopyTo(&proto);
-+
-+  if (proto.has_syntax()) {
-+    auto syntax = proto.syntax();
-+    assert(syntax == "proto2" || syntax == "proto3");
-+    if (syntax == "proto2") {
-+      return 2;
-+    } else if (syntax == "proto3") {
-+      return 3;
-+    }
-+  }
-+
-+  return 2;
- }
- 
- // Work around changes in protobuf >= 22.x without breaking compilation against
--- 
-2.34.1
-
diff --git a/package/protobuf-c/0003-FileGenerator-GenerateHeader-Set-min_header_version-.patch b/package/protobuf-c/0003-FileGenerator-GenerateHeader-Set-min_header_version-.patch
deleted file mode 100644
index d7d9cdf845..0000000000
--- a/package/protobuf-c/0003-FileGenerator-GenerateHeader-Set-min_header_version-.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From a6cf1aa386067e26d582cc1d1e327787595c9f13 Mon Sep 17 00:00:00 2001
-From: Robert Edmonds <edmonds@users.noreply.github.com>
-Date: Wed, 20 Mar 2024 21:48:10 -0400
-Subject: [PATCH] FileGenerator::GenerateHeader(): Set `min_header_version`
- unconditionally
-
-Previously, we were conditionally trying to set `min_header_version` to
-the lowest possible value, and relying on a "legacy" Google interface to
-determine the file descriptor's syntax version as part of that
-determination.
-
-Instead, simply bump the minimum version to 1003000 (1.3.0). This
-release was almost 7 years ago. In practice protobuf-c users should not
-be shipping pre-compiled .pb-c.c/.pb-c.h files, anyway.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Upstream: https://github.com/protobuf-c/protobuf-c/pull/711
----
- protoc-c/c_file.cc | 9 +--------
- 1 file changed, 1 insertion(+), 8 deletions(-)
-
-diff --git a/protoc-c/c_file.cc b/protoc-c/c_file.cc
-index ca0ad34..c6d8a24 100644
---- a/protoc-c/c_file.cc
-+++ b/protoc-c/c_file.cc
-@@ -117,14 +117,7 @@ FileGenerator::~FileGenerator() {}
- void FileGenerator::GenerateHeader(io::Printer* printer) {
-   std::string filename_identifier = FilenameIdentifier(file_->name());
- 
--  int min_header_version = 1000000;
--#if GOOGLE_PROTOBUF_VERSION >= 4023000
--  if (FileDescriptorLegacy(file_).syntax() == FileDescriptorLegacy::SYNTAX_PROTO3) {
--#else
--  if (file_->syntax() == FileDescriptor::SYNTAX_PROTO3) {
--#endif
--    min_header_version = 1003000;
--  }
-+  const int min_header_version = 1003000;
- 
-   // Generate top of header.
-   printer->Print(
--- 
-2.34.1
-
diff --git a/package/protobuf-c/protobuf-c.hash b/package/protobuf-c/protobuf-c.hash
index aafd98416a..ea7262028c 100644
--- a/package/protobuf-c/protobuf-c.hash
+++ b/package/protobuf-c/protobuf-c.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7b404c63361ed35b3667aec75cc37b54298d56dd2bcf369de3373212cc06fd98  protobuf-c-1.5.0.tar.gz
-sha256  ad28bbf89340b86d15aad1ff62c4f4590025d836415307dc66cf0338235cc2f4  LICENSE
+sha256  20d1dc257da96f8ddff8be4dd9779215bbd0a6069ed53bbe9de38fa7629be06b  protobuf-c-1.5.1.tar.gz
+sha256  2d1d028bd27f8c85bc970d720519d2069ca6213fcb26b9dea444a7c39d24bbb3  LICENSE
diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index 2b3e86a1bc..b1e8c25496 100644
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROTOBUF_C_VERSION = 1.5.0
+PROTOBUF_C_VERSION = 1.5.1
 PROTOBUF_C_SITE = https://github.com/protobuf-c/protobuf-c/releases/download/v$(PROTOBUF_C_VERSION)
 PROTOBUF_C_DEPENDENCIES = host-protobuf-c
 HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf host-pkgconf
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
