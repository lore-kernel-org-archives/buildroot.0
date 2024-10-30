Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C78D6B6BF
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 19:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3FD360A5E;
	Wed, 30 Oct 2024 19:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bNxRSDWmFGtH; Wed, 30 Oct 2024 19:00:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13CF360A3C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13CF360A3C;
	Wed, 30 Oct 2024 19:00:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 787C25E4F
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 19:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A3E9811F7
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 19:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F6x0rKzonjaT for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 19:00:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 19811811F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19811811F0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19811811F0
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 19:00:31 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3a3b0247d67so578255ab.3
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 12:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730314830; x=1730919630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GI36vGPMmz9uTdU8J+53ysOZo6lh2N8gF1hKX8m5fUc=;
 b=Q12YoqIkJhGYxz+HGTrwVPYTBPsggtzCxXjIEhCO5VjpsqxTr77JmVZyBYlBrYLnGb
 YyVj7IDBD4nBQd/5mpJJITgqdIJXx+d1h/0pWijb6vDW/iMVN97q2h0/C5YvxhUvj2E/
 6EOECOxU/uf/Q3a4Od1URFcr+2pk5lNeGK4jYCaZWq3CwlE4QJ3ub2vRGtoHyUWtxwxz
 trp5SsaPGLsb2Y7+gQUPv6kdKtWoOSUtrU/c60I90SD4bA+kow47vfi7uMf5ecLQHF5r
 /6q31R/302tnXJ+GrZstWVFoxxlwHQ2j7pWbzgjp8WLSK3fdwNCOGmlHqeKFJCT53COK
 s/QA==
X-Gm-Message-State: AOJu0YwAKSlTH9udT9kgSlW0sC16wcY09wW2JNHAsDgEgt+d40aHG7Rj
 pPMR+V4z/1/1CrXiUssZZl5Mc234StIWEQZ6WmO7hXsFYUNwAXsTH0PVVg==
X-Google-Smtp-Source: AGHT+IGtMU4KWC9kIoMbCGyRgPQbtZJt3pCC2vinYhf2tJkYIl6Uccm2Ar/w5oDAXEaCDQxEcmkZ+w==
X-Received: by 2002:a05:6e02:1886:b0:3a0:8d60:8ba7 with SMTP id
 e9e14a558f8ab-3a4ed2f666amr154603585ab.14.1730314829565; 
 Wed, 30 Oct 2024 12:00:29 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4e6df3c48sm29881875ab.34.2024.10.30.12.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 12:00:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 30 Oct 2024 13:00:18 -0600
Message-Id: <20241030190020.1444105-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241030190020.1444105-1-james.hilliard1@gmail.com>
References: <20241030190020.1444105-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730314830; x=1730919630; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GI36vGPMmz9uTdU8J+53ysOZo6lh2N8gF1hKX8m5fUc=;
 b=X1+5+MAQ1WWwxJ/Su04MtVaNDlOp9jTiSRnB8MkvtfmXSPAQNhohPA1PAnVAjsHbQC
 U5kArE1tafi0KtZyOOP6GUDbQI9K71VoQoPs761x9dfqrti9lbgpmGpPs81d5qb4ajiZ
 /aGZb+jSfIZXyIjl8LEenjvYMHaVCKeWRiqPDIb/LdC5BKZdBLb7xz3Vs2oV8HADXruc
 foyppa7Bo87i+sUFcVbQXtQNhswJci/nPIpEpaKCfuSXasyY32JVFbOSgiufunm1AE9I
 y4zgYFFSuuY1ayV+R3ViuvkrTKRP1wdRXt6C11jQLb0z7xXFWOfxOutLc1mmhLmQAUgK
 g4yA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=X1+5+MAQ
Subject: [Buildroot] [PATCH v4 4/6] package/protobuf-c: fix protobuf >= 26.0
 compatibility
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Julien Olivain <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Stewart <christian@aperture.us>,
 Robert Rose <robertroyrose@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add some patches fixing protobuf >= 26.0 compatibility.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...ct-against-being-invoked-against-edi.patch | 57 +++++++++++++
 ...dSyntax-to-maximize-compatibility-ac.patch | 84 +++++++++++++++++++
 ...nerateHeader-Set-min_header_version-.patch | 44 ++++++++++
 3 files changed, 185 insertions(+)
 create mode 100644 package/protobuf-c/0001-CGenerator-Protect-against-being-invoked-against-edi.patch
 create mode 100644 package/protobuf-c/0002-Reimplement-FieldSyntax-to-maximize-compatibility-ac.patch
 create mode 100644 package/protobuf-c/0003-FileGenerator-GenerateHeader-Set-min_header_version-.patch

diff --git a/package/protobuf-c/0001-CGenerator-Protect-against-being-invoked-against-edi.patch b/package/protobuf-c/0001-CGenerator-Protect-against-being-invoked-against-edi.patch
new file mode 100644
index 0000000000..c674ca2ee1
--- /dev/null
+++ b/package/protobuf-c/0001-CGenerator-Protect-against-being-invoked-against-edi.patch
@@ -0,0 +1,57 @@
+From 2480f4d9d2fa97e5511ed0914ee529a344e969a7 Mon Sep 17 00:00:00 2001
+From: Robert Edmonds <edmonds@users.noreply.github.com>
+Date: Wed, 20 Mar 2024 22:43:30 -0400
+Subject: [PATCH] CGenerator: Protect against being invoked against "edition"
+ syntax .proto files
+
+The Google protobuf project is currently experimenting with a new syntax
+for .proto files called "editions". Since protobuf-c is a proto2/proto3
+compiler, after the previous commit reimplementing `FieldSyntax()`, the
+protobuf compiler will abort like this if presented with an "editions"
+syntax .proto file due to the safety check in `FieldSyntax()`:
+
+    $ protoc --experimental_editions --c_out=. test.proto
+    protoc-gen-c: ./protoc-c/c_helpers.h:178: int google::protobuf::compiler::c::FieldSyntax(const google::protobuf::FieldDescriptor*): Assertion `syntax == "proto2" || syntax == "proto3"' failed.
+    --c_out: protoc-gen-c: Plugin killed by signal 6.
+
+On protobuf 26, our `CodeGenerator` can implement certain methods to
+declare that we "support" editions, and then reject any other edition
+except proto2 and proto3, which have apparently been retroactively
+declared to be "editions". Of course this needs to be wrapped in a
+version guard.
+
+With this protection in place, the protobuf compiler cleanly exits with
+a nice error message like this:
+
+    $ protoc --experimental_editions --c_out=. test.proto
+    WARNING: All log messages before absl::InitializeLog() is called are written to STDERR
+    E0000 00:00:1710988958.296200   20022 descriptor.cc:4620] Invalid proto descriptor for file "test.proto":
+    E0000 00:00:1710988958.296239   20022 descriptor.cc:4623]   test.proto: Edition 2023 is later than the maximum supported edition PROTO3
+    --c_out: protoc-gen-c: Plugin failed with status code 1.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/protobuf-c/protobuf-c/pull/711
+---
+ protoc-c/c_generator.h | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/protoc-c/c_generator.h b/protoc-c/c_generator.h
+index b8b44aa..4aeb579 100644
+--- a/protoc-c/c_generator.h
++++ b/protoc-c/c_generator.h
+@@ -93,6 +93,12 @@ class PROTOC_C_EXPORT CGenerator : public CodeGenerator {
+                 const std::string& parameter,
+                 OutputDirectory* output_directory,
+                 std::string* error) const;
++
++#if GOOGLE_PROTOBUF_VERSION >= 5026000
++  uint64_t GetSupportedFeatures() const { return CodeGenerator::FEATURE_SUPPORTS_EDITIONS; }
++  Edition GetMinimumEdition() const { return Edition::EDITION_PROTO2; }
++  Edition GetMaximumEdition() const { return Edition::EDITION_PROTO3; }
++#endif
+ };
+ 
+ }  // namespace c
+-- 
+2.34.1
+
diff --git a/package/protobuf-c/0002-Reimplement-FieldSyntax-to-maximize-compatibility-ac.patch b/package/protobuf-c/0002-Reimplement-FieldSyntax-to-maximize-compatibility-ac.patch
new file mode 100644
index 0000000000..e14a9fbc75
--- /dev/null
+++ b/package/protobuf-c/0002-Reimplement-FieldSyntax-to-maximize-compatibility-ac.patch
@@ -0,0 +1,84 @@
+From ee3d9e5423c93ee6b828fdda8e7fef13a77634eb Mon Sep 17 00:00:00 2001
+From: Robert Edmonds <edmonds@users.noreply.github.com>
+Date: Wed, 20 Mar 2024 22:25:54 -0400
+Subject: [PATCH] Reimplement FieldSyntax() to maximize compatibility across
+ protobuf versions
+
+Recent versions of Google protobuf have broken the interfaces for
+determining the syntax version of a .proto file. The current protobuf-c
+1.5.0 release does not compile with Google protobuf 26.0 due to the most
+recentage breakage. There is a possible workaround involving the Google
+protobuf `FileDescriptorLegacy` class, which is documented as:
+
+// TODO Remove this deprecated API entirely.
+
+So we probably shouldn't rely on it.
+
+Instead, this commit obtains the `FileDescriptorProto` corresponding
+to the passed in `FieldDescriptor` and interrogates the `syntax` field
+directly. This is a single implementation with no version-specific
+workarounds. Hopefully this won't break in the next Google protobuf
+release.
+
+I tested the `FieldSyntax()` implementation in this commit across a
+number of different Google protobuf releases and found that it worked
+(`make && make check`) on all of them:
+
+- Google protobuf 3.6.1.3 (Ubuntu 20.04)
+- Google protobuf 3.12.4 (Ubuntu 22.04)
+- Google protobuf 3.21.12 (Debian 12 + Debian unstable)
+- Google protobuf 3.25.2 (Debian experimental)
+- Google protobuf 26.1-dev
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/protobuf-c/protobuf-c/pull/711
+---
+ protoc-c/c_helpers.h | 24 ++++++++++++++----------
+ 1 file changed, 14 insertions(+), 10 deletions(-)
+
+diff --git a/protoc-c/c_helpers.h b/protoc-c/c_helpers.h
+index 062d330..be28b60 100644
+--- a/protoc-c/c_helpers.h
++++ b/protoc-c/c_helpers.h
+@@ -70,10 +70,6 @@
+ #include <protobuf-c/protobuf-c.pb.h>
+ #include <google/protobuf/io/printer.h>
+ 
+-#if GOOGLE_PROTOBUF_VERSION >= 4023000
+-# include <google/protobuf/descriptor_legacy.h>
+-#endif
+-
+ namespace google {
+ namespace protobuf {
+ namespace compiler {
+@@ -173,13 +169,21 @@ struct NameIndex
+ int compare_name_indices_by_name(const void*, const void*);
+ 
+ // Return the syntax version of the file containing the field.
+-// This wrapper is needed to be able to compile against protobuf2.
+ inline int FieldSyntax(const FieldDescriptor* field) {
+-#if GOOGLE_PROTOBUF_VERSION >= 4023000
+-  return FileDescriptorLegacy(field->file()).syntax() == FileDescriptorLegacy::SYNTAX_PROTO3 ? 3 : 2;
+-#else
+-  return field->file()->syntax() == FileDescriptor::SYNTAX_PROTO3 ? 3 : 2;
+-#endif
++  auto proto = FileDescriptorProto();
++  field->file()->CopyTo(&proto);
++
++  if (proto.has_syntax()) {
++    auto syntax = proto.syntax();
++    assert(syntax == "proto2" || syntax == "proto3");
++    if (syntax == "proto2") {
++      return 2;
++    } else if (syntax == "proto3") {
++      return 3;
++    }
++  }
++
++  return 2;
+ }
+ 
+ // Work around changes in protobuf >= 22.x without breaking compilation against
+-- 
+2.34.1
+
diff --git a/package/protobuf-c/0003-FileGenerator-GenerateHeader-Set-min_header_version-.patch b/package/protobuf-c/0003-FileGenerator-GenerateHeader-Set-min_header_version-.patch
new file mode 100644
index 0000000000..d7d9cdf845
--- /dev/null
+++ b/package/protobuf-c/0003-FileGenerator-GenerateHeader-Set-min_header_version-.patch
@@ -0,0 +1,44 @@
+From a6cf1aa386067e26d582cc1d1e327787595c9f13 Mon Sep 17 00:00:00 2001
+From: Robert Edmonds <edmonds@users.noreply.github.com>
+Date: Wed, 20 Mar 2024 21:48:10 -0400
+Subject: [PATCH] FileGenerator::GenerateHeader(): Set `min_header_version`
+ unconditionally
+
+Previously, we were conditionally trying to set `min_header_version` to
+the lowest possible value, and relying on a "legacy" Google interface to
+determine the file descriptor's syntax version as part of that
+determination.
+
+Instead, simply bump the minimum version to 1003000 (1.3.0). This
+release was almost 7 years ago. In practice protobuf-c users should not
+be shipping pre-compiled .pb-c.c/.pb-c.h files, anyway.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/protobuf-c/protobuf-c/pull/711
+---
+ protoc-c/c_file.cc | 9 +--------
+ 1 file changed, 1 insertion(+), 8 deletions(-)
+
+diff --git a/protoc-c/c_file.cc b/protoc-c/c_file.cc
+index ca0ad34..c6d8a24 100644
+--- a/protoc-c/c_file.cc
++++ b/protoc-c/c_file.cc
+@@ -117,14 +117,7 @@ FileGenerator::~FileGenerator() {}
+ void FileGenerator::GenerateHeader(io::Printer* printer) {
+   std::string filename_identifier = FilenameIdentifier(file_->name());
+ 
+-  int min_header_version = 1000000;
+-#if GOOGLE_PROTOBUF_VERSION >= 4023000
+-  if (FileDescriptorLegacy(file_).syntax() == FileDescriptorLegacy::SYNTAX_PROTO3) {
+-#else
+-  if (file_->syntax() == FileDescriptor::SYNTAX_PROTO3) {
+-#endif
+-    min_header_version = 1003000;
+-  }
++  const int min_header_version = 1003000;
+ 
+   // Generate top of header.
+   printer->Print(
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
