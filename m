Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171C2C02196
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 21:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 335DA606F3;
	Wed,  5 Feb 2025 21:14:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YDtrPN8oUU8V; Wed,  5 Feb 2025 21:14:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A56E960BD5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A56E960BD5;
	Wed,  5 Feb 2025 21:14:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C295912A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 21:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B18BC416EE
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 21:14:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TscwiYUmj7S2 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 21:13:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D28AD416D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D28AD416D1
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D28AD416D1
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 21:13:58 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso1327365e9.2
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 13:13:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738790036; x=1739394836;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cwx0rcaXX/Qsv8h+OpRTUa1y+lidqky+XHffpxj62lQ=;
 b=jOpnmrQi7d4Yy86CKli5T7vEI7X/pmgqETGgD25AtT0o2TRNPgp6SDPGqayW0pO7+e
 udeVgfoMskYSqrTPiDXpZGCkm6yIjNTXfF+K1k9/veUuIEjqZiNMbur9wj7lRQ3z/G/1
 +MFfmaP+RDc1qq/KwI9NCh6Ykb/ivzazqjtWzck4qIazdVhxz2gq5zQLfwoa++5GkDVU
 DBSc/blUTQ6s0Em7TVfCxAp+lc5fNaLcjGxDlM3IFe5cuIh437MHeXMOrxEmSwVXuUrw
 j8QZnTHP5hJIeSu2vGh6Gyb/DQXFiS0LhCyv6s67nSDJd6tHbKpha6KvXyN0rpwKkBCz
 BNFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVr1DpcYRHvmTZEIQVfzPO19fnTuy3I5pT8Smyo4hW73dAbFvqZH0hlm7MTk2dZ+gVqpte55099g5U=@buildroot.org
X-Gm-Message-State: AOJu0YxgQvPAxmqkTU8/+1NCrhIs0Cq9wf+zuVLQAw1qChzqDNlBZy85
 Gab/6GTJgMppiZlvAuKrl54uKQ3Clrd9o5zCM/Ah6V1so7hu+wCABUPvOWysAqE=
X-Gm-Gg: ASbGncuUq0g+E9buvQidVuf3782t20coLo6/1lPiSDfY3QCQegl8rHPUZTIbJO15ghZ
 LzC3QHpCKKSN/UTQZ/vXngmRI3gqTPrbBM3bu8tp8F2TX6uxhjPDHqA3iCRD/ijy4Ew6PbrQx5o
 eNxTLN+KM0wmfneT5uvHuoXft/hAx1kvqTFrS8engkON5TTr9A5peRVL4INUMacJ+MYQbQK5i5d
 SWDF20kVLZJuQzf2gzefgBlEr98VsVSNdhwdRyNeWbEmbnazFtL1ikOazQ1xu9JNAYzc4l6OBBU
 u6Qgn7fylsEfAM7Du7k4AoFyEACkuNgPaKuRQeoR3xqEjAmvau9FEdPb5KlesRhV/65yXEUKU3W
 MYuE/NJVjTjqWg2gDiyRKaEd+WjtezL6MvbDoj2DqoIyApQ==
X-Google-Smtp-Source: AGHT+IEaDBxSbEm+zmoaXvpY9LlI6ASpy3nk9eqZAPBNpculmi/P/KaO+bpogjXYSKT2GRFbzilrlQ==
X-Received: by 2002:a05:600c:4586:b0:434:f623:9ff3 with SMTP id
 5b1f17b1804b1-4390d43da00mr39039745e9.15.1738790036242; 
 Wed, 05 Feb 2025 13:13:56 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391400b6b4sm654625e9.32.2025.02.05.13.13.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 13:13:54 -0800 (PST)
Message-ID: <49e08065-2c0b-497e-9ab9-374816d73017@mind.be>
Date: Wed, 5 Feb 2025 22:13:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20250205153153.3283650-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20250205153153.3283650-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738790036; x=1739394836; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Cwx0rcaXX/Qsv8h+OpRTUa1y+lidqky+XHffpxj62lQ=;
 b=L1YZfdgX+wYk4MKxxr/eNy/oFy2FiAtFPR4YamuuUO7uiW6Be1FjJmOwGds+PhIQnu
 hhXVqcVlTBPtLXFAHDGticb9s+JxlNP0UkLK56n6mOevNlmtMAt3/4TLFrOWe1a/yhR/
 pyHyBs6+j/EwFz2tgeG0nxP9/nwtm0PVgperEibE70lPuWuR1CnzPp0wY8bXHnWo97lp
 qMHWJpP/GN5ScXxTRMULxS+DCHjFWK6+z8QVMF8GHK6o9yAP37VLWO3zzkz8kiofbqU3
 +oMPXcOANS9ZuEbRvzM0+BDuJ+Kf0hRco8TsI7QU01Lm3qSU+kKI/iT7BFzUH9QKdreY
 L1SA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=L1YZfdgX
Subject: Re: [Buildroot] [PATCH 1/1] package/protobuf-c: bump to version
 1.5.1
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/02/2025 16:31, James Hilliard wrote:
> License hash changed due to year update:
> https://github.com/protobuf-c/protobuf-c/commit/53e0b201db240694f8c8aabf0d0b579de33bf24d
> 
> Drop patches which are now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...ct-against-being-invoked-against-edi.patch | 57 -------------
>   ...dSyntax-to-maximize-compatibility-ac.patch | 84 -------------------
>   ...nerateHeader-Set-min_header_version-.patch | 44 ----------
>   package/protobuf-c/protobuf-c.hash            |  4 +-
>   package/protobuf-c/protobuf-c.mk              |  2 +-
>   5 files changed, 3 insertions(+), 188 deletions(-)
>   delete mode 100644 package/protobuf-c/0001-CGenerator-Protect-against-being-invoked-against-edi.patch
>   delete mode 100644 package/protobuf-c/0002-Reimplement-FieldSyntax-to-maximize-compatibility-ac.patch
>   delete mode 100644 package/protobuf-c/0003-FileGenerator-GenerateHeader-Set-min_header_version-.patch
> 
> diff --git a/package/protobuf-c/0001-CGenerator-Protect-against-being-invoked-against-edi.patch b/package/protobuf-c/0001-CGenerator-Protect-against-being-invoked-against-edi.patch
> deleted file mode 100644
> index c674ca2ee1..0000000000
> --- a/package/protobuf-c/0001-CGenerator-Protect-against-being-invoked-against-edi.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -From 2480f4d9d2fa97e5511ed0914ee529a344e969a7 Mon Sep 17 00:00:00 2001
> -From: Robert Edmonds <edmonds@users.noreply.github.com>
> -Date: Wed, 20 Mar 2024 22:43:30 -0400
> -Subject: [PATCH] CGenerator: Protect against being invoked against "edition"
> - syntax .proto files
> -
> -The Google protobuf project is currently experimenting with a new syntax
> -for .proto files called "editions". Since protobuf-c is a proto2/proto3
> -compiler, after the previous commit reimplementing `FieldSyntax()`, the
> -protobuf compiler will abort like this if presented with an "editions"
> -syntax .proto file due to the safety check in `FieldSyntax()`:
> -
> -    $ protoc --experimental_editions --c_out=. test.proto
> -    protoc-gen-c: ./protoc-c/c_helpers.h:178: int google::protobuf::compiler::c::FieldSyntax(const google::protobuf::FieldDescriptor*): Assertion `syntax == "proto2" || syntax == "proto3"' failed.
> -    --c_out: protoc-gen-c: Plugin killed by signal 6.
> -
> -On protobuf 26, our `CodeGenerator` can implement certain methods to
> -declare that we "support" editions, and then reject any other edition
> -except proto2 and proto3, which have apparently been retroactively
> -declared to be "editions". Of course this needs to be wrapped in a
> -version guard.
> -
> -With this protection in place, the protobuf compiler cleanly exits with
> -a nice error message like this:
> -
> -    $ protoc --experimental_editions --c_out=. test.proto
> -    WARNING: All log messages before absl::InitializeLog() is called are written to STDERR
> -    E0000 00:00:1710988958.296200   20022 descriptor.cc:4620] Invalid proto descriptor for file "test.proto":
> -    E0000 00:00:1710988958.296239   20022 descriptor.cc:4623]   test.proto: Edition 2023 is later than the maximum supported edition PROTO3
> -    --c_out: protoc-gen-c: Plugin failed with status code 1.
> -
> -Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> -Upstream: https://github.com/protobuf-c/protobuf-c/pull/711
> ----
> - protoc-c/c_generator.h | 6 ++++++
> - 1 file changed, 6 insertions(+)
> -
> -diff --git a/protoc-c/c_generator.h b/protoc-c/c_generator.h
> -index b8b44aa..4aeb579 100644
> ---- a/protoc-c/c_generator.h
> -+++ b/protoc-c/c_generator.h
> -@@ -93,6 +93,12 @@ class PROTOC_C_EXPORT CGenerator : public CodeGenerator {
> -                 const std::string& parameter,
> -                 OutputDirectory* output_directory,
> -                 std::string* error) const;
> -+
> -+#if GOOGLE_PROTOBUF_VERSION >= 5026000
> -+  uint64_t GetSupportedFeatures() const { return CodeGenerator::FEATURE_SUPPORTS_EDITIONS; }
> -+  Edition GetMinimumEdition() const { return Edition::EDITION_PROTO2; }
> -+  Edition GetMaximumEdition() const { return Edition::EDITION_PROTO3; }
> -+#endif
> - };
> -
> - }  // namespace c
> ---
> -2.34.1
> -
> diff --git a/package/protobuf-c/0002-Reimplement-FieldSyntax-to-maximize-compatibility-ac.patch b/package/protobuf-c/0002-Reimplement-FieldSyntax-to-maximize-compatibility-ac.patch
> deleted file mode 100644
> index e14a9fbc75..0000000000
> --- a/package/protobuf-c/0002-Reimplement-FieldSyntax-to-maximize-compatibility-ac.patch
> +++ /dev/null
> @@ -1,84 +0,0 @@
> -From ee3d9e5423c93ee6b828fdda8e7fef13a77634eb Mon Sep 17 00:00:00 2001
> -From: Robert Edmonds <edmonds@users.noreply.github.com>
> -Date: Wed, 20 Mar 2024 22:25:54 -0400
> -Subject: [PATCH] Reimplement FieldSyntax() to maximize compatibility across
> - protobuf versions
> -
> -Recent versions of Google protobuf have broken the interfaces for
> -determining the syntax version of a .proto file. The current protobuf-c
> -1.5.0 release does not compile with Google protobuf 26.0 due to the most
> -recentage breakage. There is a possible workaround involving the Google
> -protobuf `FileDescriptorLegacy` class, which is documented as:
> -
> -// TODO Remove this deprecated API entirely.
> -
> -So we probably shouldn't rely on it.
> -
> -Instead, this commit obtains the `FileDescriptorProto` corresponding
> -to the passed in `FieldDescriptor` and interrogates the `syntax` field
> -directly. This is a single implementation with no version-specific
> -workarounds. Hopefully this won't break in the next Google protobuf
> -release.
> -
> -I tested the `FieldSyntax()` implementation in this commit across a
> -number of different Google protobuf releases and found that it worked
> -(`make && make check`) on all of them:
> -
> -- Google protobuf 3.6.1.3 (Ubuntu 20.04)
> -- Google protobuf 3.12.4 (Ubuntu 22.04)
> -- Google protobuf 3.21.12 (Debian 12 + Debian unstable)
> -- Google protobuf 3.25.2 (Debian experimental)
> -- Google protobuf 26.1-dev
> -
> -Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> -Upstream: https://github.com/protobuf-c/protobuf-c/pull/711
> ----
> - protoc-c/c_helpers.h | 24 ++++++++++++++----------
> - 1 file changed, 14 insertions(+), 10 deletions(-)
> -
> -diff --git a/protoc-c/c_helpers.h b/protoc-c/c_helpers.h
> -index 062d330..be28b60 100644
> ---- a/protoc-c/c_helpers.h
> -+++ b/protoc-c/c_helpers.h
> -@@ -70,10 +70,6 @@
> - #include <protobuf-c/protobuf-c.pb.h>
> - #include <google/protobuf/io/printer.h>
> -
> --#if GOOGLE_PROTOBUF_VERSION >= 4023000
> --# include <google/protobuf/descriptor_legacy.h>
> --#endif
> --
> - namespace google {
> - namespace protobuf {
> - namespace compiler {
> -@@ -173,13 +169,21 @@ struct NameIndex
> - int compare_name_indices_by_name(const void*, const void*);
> -
> - // Return the syntax version of the file containing the field.
> --// This wrapper is needed to be able to compile against protobuf2.
> - inline int FieldSyntax(const FieldDescriptor* field) {
> --#if GOOGLE_PROTOBUF_VERSION >= 4023000
> --  return FileDescriptorLegacy(field->file()).syntax() == FileDescriptorLegacy::SYNTAX_PROTO3 ? 3 : 2;
> --#else
> --  return field->file()->syntax() == FileDescriptor::SYNTAX_PROTO3 ? 3 : 2;
> --#endif
> -+  auto proto = FileDescriptorProto();
> -+  field->file()->CopyTo(&proto);
> -+
> -+  if (proto.has_syntax()) {
> -+    auto syntax = proto.syntax();
> -+    assert(syntax == "proto2" || syntax == "proto3");
> -+    if (syntax == "proto2") {
> -+      return 2;
> -+    } else if (syntax == "proto3") {
> -+      return 3;
> -+    }
> -+  }
> -+
> -+  return 2;
> - }
> -
> - // Work around changes in protobuf >= 22.x without breaking compilation against
> ---
> -2.34.1
> -
> diff --git a/package/protobuf-c/0003-FileGenerator-GenerateHeader-Set-min_header_version-.patch b/package/protobuf-c/0003-FileGenerator-GenerateHeader-Set-min_header_version-.patch
> deleted file mode 100644
> index d7d9cdf845..0000000000
> --- a/package/protobuf-c/0003-FileGenerator-GenerateHeader-Set-min_header_version-.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From a6cf1aa386067e26d582cc1d1e327787595c9f13 Mon Sep 17 00:00:00 2001
> -From: Robert Edmonds <edmonds@users.noreply.github.com>
> -Date: Wed, 20 Mar 2024 21:48:10 -0400
> -Subject: [PATCH] FileGenerator::GenerateHeader(): Set `min_header_version`
> - unconditionally
> -
> -Previously, we were conditionally trying to set `min_header_version` to
> -the lowest possible value, and relying on a "legacy" Google interface to
> -determine the file descriptor's syntax version as part of that
> -determination.
> -
> -Instead, simply bump the minimum version to 1003000 (1.3.0). This
> -release was almost 7 years ago. In practice protobuf-c users should not
> -be shipping pre-compiled .pb-c.c/.pb-c.h files, anyway.
> -
> -Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> -Upstream: https://github.com/protobuf-c/protobuf-c/pull/711
> ----
> - protoc-c/c_file.cc | 9 +--------
> - 1 file changed, 1 insertion(+), 8 deletions(-)
> -
> -diff --git a/protoc-c/c_file.cc b/protoc-c/c_file.cc
> -index ca0ad34..c6d8a24 100644
> ---- a/protoc-c/c_file.cc
> -+++ b/protoc-c/c_file.cc
> -@@ -117,14 +117,7 @@ FileGenerator::~FileGenerator() {}
> - void FileGenerator::GenerateHeader(io::Printer* printer) {
> -   std::string filename_identifier = FilenameIdentifier(file_->name());
> -
> --  int min_header_version = 1000000;
> --#if GOOGLE_PROTOBUF_VERSION >= 4023000
> --  if (FileDescriptorLegacy(file_).syntax() == FileDescriptorLegacy::SYNTAX_PROTO3) {
> --#else
> --  if (file_->syntax() == FileDescriptor::SYNTAX_PROTO3) {
> --#endif
> --    min_header_version = 1003000;
> --  }
> -+  const int min_header_version = 1003000;
> -
> -   // Generate top of header.
> -   printer->Print(
> ---
> -2.34.1
> -
> diff --git a/package/protobuf-c/protobuf-c.hash b/package/protobuf-c/protobuf-c.hash
> index aafd98416a..ea7262028c 100644
> --- a/package/protobuf-c/protobuf-c.hash
> +++ b/package/protobuf-c/protobuf-c.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  7b404c63361ed35b3667aec75cc37b54298d56dd2bcf369de3373212cc06fd98  protobuf-c-1.5.0.tar.gz
> -sha256  ad28bbf89340b86d15aad1ff62c4f4590025d836415307dc66cf0338235cc2f4  LICENSE
> +sha256  20d1dc257da96f8ddff8be4dd9779215bbd0a6069ed53bbe9de38fa7629be06b  protobuf-c-1.5.1.tar.gz
> +sha256  2d1d028bd27f8c85bc970d720519d2069ca6213fcb26b9dea444a7c39d24bbb3  LICENSE
> diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
> index 2b3e86a1bc..b1e8c25496 100644
> --- a/package/protobuf-c/protobuf-c.mk
> +++ b/package/protobuf-c/protobuf-c.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PROTOBUF_C_VERSION = 1.5.0
> +PROTOBUF_C_VERSION = 1.5.1
>   PROTOBUF_C_SITE = https://github.com/protobuf-c/protobuf-c/releases/download/v$(PROTOBUF_C_VERSION)
>   PROTOBUF_C_DEPENDENCIES = host-protobuf-c
>   HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf host-pkgconf

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
