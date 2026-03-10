Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87290EB1049
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 10:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8311E84089;
	Tue, 10 Mar 2026 10:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NHxFZr4PcANG; Tue, 10 Mar 2026 10:45:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87ECD84054
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773139507;
	bh=fRQP7cQdI6ailc+N/CgrqVxQcUqAhRwk3dTcdT1rOEk=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=g/ROyQV2C5fbs+46dW2FYmTjnS4mimGXUGpgRMU6qJqB5zqKtXTyRJwTkM2LL1e3r
	 AmAtDh7yN97dRc06h1i7PCwAlFG9//xe+bOZVobZf8ZjmWArmdbSuUkHuc9swbj9rm
	 j/FRthqIJFDRhxBkhs2cAVb67jy5g0Xs0yHzgvhqa6Smhio38YY/Kh3MUz+uDI1GAO
	 yLuP4GnpKuLebkBzK/7div0uR6hHeYv+GtmVeif4RaLPPDEm+OCALVHzIZiYkjz1wi
	 0E3pM2FAhWcxQgEp/+fj8Rc9Q22aet1S0yvs4eFgctvekOKcsGLoJGOdUhYe0j7y/N
	 9u+vYWmDjAamA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87ECD84054;
	Tue, 10 Mar 2026 10:45:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C77C201
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 10:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CAD28404F
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 10:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uLTde98U8I51 for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 10:45:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C273384054
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C273384054
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C273384054
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 10:45:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 711691814BA; Tue, 10 Mar 2026 11:45:00 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 10 Mar 2026 11:43:42 +0100
Message-ID: <20260310104354.2488409-3-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310104354.2488409-2-buildroot@heine.tech>
References: <20260310104354.2488409-2-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1773139500; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=7CK3bVecqSQw9i51+Kkpuvucim2+YSbCXwbG+bzLC7U=;
 b=QPq6/HaOaE164npwY8F7ZjSh4quhS7QF0IoYjibgjBpZivbnYE7wdWG7Xagid2uFhVshsn
 378Ux4xjjEggaPOJAxyqbotzO690QZcDfCZn33YCQVQmHmq5tsCmjcAXoBIwmDyp0DRAL0
 fKvZfGJ/EJ2423ASq1N13N676J6Wrh4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=QPq6/HaO
Subject: [Buildroot] [PATCH v2 2/2] package/protobuf-c: fix protobuf v34.0
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

pull in patch from https://github.com/protobuf-c/protobuf-c/pull/797
which fixes compatibility with Protobuf v34.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 .../0001-fix-protobuf-34-compatibility.patch  | 208 ++++++++++++++++++
 1 file changed, 208 insertions(+)
 create mode 100644 package/protobuf-c/0001-fix-protobuf-34-compatibility.patch

diff --git a/package/protobuf-c/0001-fix-protobuf-34-compatibility.patch b/package/protobuf-c/0001-fix-protobuf-34-compatibility.patch
new file mode 100644
index 0000000000..d1acdf232e
--- /dev/null
+++ b/package/protobuf-c/0001-fix-protobuf-34-compatibility.patch
@@ -0,0 +1,208 @@
+From d39f001b4578966600de0aaf7fc665eec6e057e5 Mon Sep 17 00:00:00 2001
+From: Leon White <l.white@interstellarlab.earth>
+Date: Tue, 10 Mar 2026 10:37:18 +0100
+Subject: [PATCH] Fix compilation against protobuf v34
+
+Upstream: https://github.com/protobuf-c/protobuf-c/pull/797
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
+
+---
+ protoc-gen-c/c_bytes_field.cc     |  4 ++--
+ protoc-gen-c/c_enum_field.cc      |  4 ++--
+ protoc-gen-c/c_field.cc           | 10 +++++-----
+ protoc-gen-c/c_helpers.cc         | 11 +++++++++++
+ protoc-gen-c/c_helpers.h          |  5 +++++
+ protoc-gen-c/c_message_field.cc   |  4 ++--
+ protoc-gen-c/c_primitive_field.cc |  4 ++--
+ protoc-gen-c/c_string_field.cc    |  4 ++--
+ 8 files changed, 31 insertions(+), 15 deletions(-)
+
+diff --git a/protoc-gen-c/c_bytes_field.cc b/protoc-gen-c/c_bytes_field.cc
+index c8ac7725..ab101177 100644
+--- a/protoc-gen-c/c_bytes_field.cc
++++ b/protoc-gen-c/c_bytes_field.cc
+@@ -94,7 +94,7 @@ BytesFieldGenerator::~BytesFieldGenerator() {}
+ 
+ void BytesFieldGenerator::GenerateStructMembers(google::protobuf::io::Printer* printer) const
+ {
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+       printer->Print(variables_, "ProtobufCBinaryData $name$$deprecated$;\n");
+       break;
+@@ -135,7 +135,7 @@ std::string BytesFieldGenerator::GetDefaultValue(void) const
+ }
+ void BytesFieldGenerator::GenerateStaticInit(google::protobuf::io::Printer* printer) const
+ {
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+       printer->Print(variables_, "$default_value$");
+       break;
+diff --git a/protoc-gen-c/c_enum_field.cc b/protoc-gen-c/c_enum_field.cc
+index c3111f50..78ffb1c7 100644
+--- a/protoc-gen-c/c_enum_field.cc
++++ b/protoc-gen-c/c_enum_field.cc
+@@ -95,7 +95,7 @@ EnumFieldGenerator::~EnumFieldGenerator() {}
+ 
+ void EnumFieldGenerator::GenerateStructMembers(google::protobuf::io::Printer* printer) const
+ {
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+       printer->Print(variables_, "$type$ $name$$deprecated$;\n");
+       break;
+@@ -117,7 +117,7 @@ std::string EnumFieldGenerator::GetDefaultValue(void) const
+ }
+ void EnumFieldGenerator::GenerateStaticInit(google::protobuf::io::Printer* printer) const
+ {
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+       printer->Print(variables_, "$default$");
+       break;
+diff --git a/protoc-gen-c/c_field.cc b/protoc-gen-c/c_field.cc
+index 8d22343f..8f83e1b1 100644
+--- a/protoc-gen-c/c_field.cc
++++ b/protoc-gen-c/c_field.cc
+@@ -125,11 +125,11 @@ void FieldGenerator::GenerateDescriptorInitializerGeneric(google::protobuf::io::
+     variables["oneofname"] = CamelToLower(oneof->name());
+ 
+   if (FieldSyntax(descriptor_) == 3 &&
+-    descriptor_->label() == google::protobuf::FieldDescriptor::LABEL_OPTIONAL) {
++    FieldLabel(descriptor_) == google::protobuf::FieldDescriptor::LABEL_OPTIONAL) {
+     variables["LABEL"] = "NONE";
+     optional_uses_has = false;
+   } else {
+-    variables["LABEL"] = CamelToUpper(GetLabelName(descriptor_->label()));
++    variables["LABEL"] = CamelToUpper(GetLabelName(FieldLabel(descriptor_)));
+   }
+ 
+   if (descriptor_->has_default_value()) {
+@@ -145,11 +145,11 @@ void FieldGenerator::GenerateDescriptorInitializerGeneric(google::protobuf::io::
+ 
+   variables["flags"] = "0";
+ 
+-  if (descriptor_->label() == google::protobuf::FieldDescriptor::LABEL_REPEATED
++  if (FieldLabel(descriptor_) == google::protobuf::FieldDescriptor::LABEL_REPEATED
+    && is_packable_type (descriptor_->type())
+    && descriptor_->options().packed()) {
+     variables["flags"] += " | PROTOBUF_C_FIELD_FLAG_PACKED";
+-  } else if (descriptor_->label() == google::protobuf::FieldDescriptor::LABEL_REPEATED
++  } else if (FieldLabel(descriptor_) == google::protobuf::FieldDescriptor::LABEL_REPEATED
+    && is_packable_type (descriptor_->type())
+    && FieldSyntax(descriptor_) == 3
+    && !descriptor_->options().has_packed()) {
+@@ -179,7 +179,7 @@ void FieldGenerator::GenerateDescriptorInitializerGeneric(google::protobuf::io::
+     "  $value$,\n"
+     "  PROTOBUF_C_LABEL_$LABEL$,\n"
+     "  PROTOBUF_C_TYPE_$TYPE$,\n");
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+       printer->Print(variables, "  0,   /* quantifier_offset */\n");
+       break;
+diff --git a/protoc-gen-c/c_helpers.cc b/protoc-gen-c/c_helpers.cc
+index e5c177c9..fcfc2588 100644
+--- a/protoc-gen-c/c_helpers.cc
++++ b/protoc-gen-c/c_helpers.cc
+@@ -338,6 +338,17 @@ std::string GetLabelName(google::protobuf::FieldDescriptor::Label label) {
+   return "bad-label";
+ }
+ 
++google::protobuf::FieldDescriptor::Label FieldLabel(
++    const google::protobuf::FieldDescriptor* field) {
++  if (field->is_repeated()) {
++    return google::protobuf::FieldDescriptor::LABEL_REPEATED;
++  }
++  if (field->is_required()) {
++    return google::protobuf::FieldDescriptor::LABEL_REQUIRED;
++  }
++  return google::protobuf::FieldDescriptor::LABEL_OPTIONAL;
++}
++
+ unsigned
+ WriteIntRanges(google::protobuf::io::Printer* printer, int n_values, const int *values, compat::StringView name)
+ {
+diff --git a/protoc-gen-c/c_helpers.h b/protoc-gen-c/c_helpers.h
+index 69369997..210f17a9 100644
+--- a/protoc-gen-c/c_helpers.h
++++ b/protoc-gen-c/c_helpers.h
+@@ -153,6 +153,11 @@ std::string FilenameIdentifier(compat::StringView filename);
+ // return 'required', 'optional', or 'repeated'
+ std::string GetLabelName(google::protobuf::FieldDescriptor::Label label);
+ 
++// Returns the field label in a way that is compatible with protobuf versions
++// where FieldDescriptor::label() is unavailable.
++google::protobuf::FieldDescriptor::Label FieldLabel(
++  const google::protobuf::FieldDescriptor* field);
++
+ // write IntRanges entries for a bunch of sorted values.
+ // returns the number of ranges there are to bsearch.
+ unsigned WriteIntRanges(google::protobuf::io::Printer* printer, int n_values, const int *values, compat::StringView name);
+diff --git a/protoc-gen-c/c_message_field.cc b/protoc-gen-c/c_message_field.cc
+index 9fca9208..43661353 100644
+--- a/protoc-gen-c/c_message_field.cc
++++ b/protoc-gen-c/c_message_field.cc
+@@ -83,7 +83,7 @@ void MessageFieldGenerator::GenerateStructMembers(google::protobuf::io::Printer*
+   vars["name"] = FieldName(descriptor_);
+   vars["type"] = FullNameToC(descriptor_->message_type()->full_name(), descriptor_->message_type()->file());
+   vars["deprecated"] = FieldDeprecated(descriptor_);
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+     case google::protobuf::FieldDescriptor::LABEL_OPTIONAL:
+       printer->Print(vars, "$type$ *$name$$deprecated$;\n");
+@@ -103,7 +103,7 @@ std::string MessageFieldGenerator::GetDefaultValue(void) const
+ }
+ void MessageFieldGenerator::GenerateStaticInit(google::protobuf::io::Printer* printer) const
+ {
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+     case google::protobuf::FieldDescriptor::LABEL_OPTIONAL:
+       printer->Print("NULL");
+diff --git a/protoc-gen-c/c_primitive_field.cc b/protoc-gen-c/c_primitive_field.cc
+index 588f60e6..b3a4a46e 100644
+--- a/protoc-gen-c/c_primitive_field.cc
++++ b/protoc-gen-c/c_primitive_field.cc
+@@ -109,7 +109,7 @@ void PrimitiveFieldGenerator::GenerateStructMembers(google::protobuf::io::Printe
+   vars["name"] = FieldName(descriptor_);
+   vars["deprecated"] = FieldDeprecated(descriptor_);
+ 
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+       printer->Print(vars, "$c_type$ $name$$deprecated$;\n");
+       break;
+@@ -156,7 +156,7 @@ void PrimitiveFieldGenerator::GenerateStaticInit(google::protobuf::io::Printer*
+   } else {
+     vars["default_value"] = "0";
+   }
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+       printer->Print(vars, "$default_value$");
+       break;
+diff --git a/protoc-gen-c/c_string_field.cc b/protoc-gen-c/c_string_field.cc
+index 163f4246..6aea8dd3 100644
+--- a/protoc-gen-c/c_string_field.cc
++++ b/protoc-gen-c/c_string_field.cc
+@@ -94,7 +94,7 @@ void StringFieldGenerator::GenerateStructMembers(google::protobuf::io::Printer*
+ {
+   const ProtobufCFileOptions opt = descriptor_->file()->options().GetExtension(pb_c_file);
+ 
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+     case google::protobuf::FieldDescriptor::LABEL_OPTIONAL:
+       if (opt.const_strings())
+@@ -138,7 +138,7 @@ void StringFieldGenerator::GenerateStaticInit(google::protobuf::io::Printer* pri
+   } else {
+     vars["default"] = "(char *)protobuf_c_empty_string";
+   }
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+     case google::protobuf::FieldDescriptor::LABEL_OPTIONAL:
+       printer->Print(vars, "$default$");
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
