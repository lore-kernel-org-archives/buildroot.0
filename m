Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE029CA5FA3
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63BB780AEA;
	Mon, 28 Sep 2026 21:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ERzEYeVjkCmS; Mon, 28 Sep 2026 21:01:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5B02A80AFB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790629276;
	b=KhYZpPDZoF0xIE8NKhGAB3fP7nl9uE2j/Jaja9qTEC2VF9hV5ZhPGwFGfvP0ww3BM+nL
	 hjq5Oj458iL6uZfPJYHsnzNKKyGYQzy7RZCYcirahydI1Y7mgCBtNgYLEH+6vcD4mLj3y
	 hJ9jdhy9QG3Ib1eDxrrMG/eNzw7JkvICHV5A/b/52uypubZuhH1p60JC9meNB9/Yna7UF
	 TyQmLCBRuO4Q4fS6d8zYy7aO34uPeQDiHfY8Ud6ONx7ORN2JPxjCp9eQ+nH0kCx2HlGDI
	 /BKTw0oxqvN5MXiV1UujrnAhft/CbYbHqi8bJSKKXc0fmlAOoeu/tUsGFFA9bAJCSww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790629276;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qfOZ2WGQFrYk7SI74Ce0v+qBL0mcWtKmaUm06moSvoY=;
	b=UZ3/DVcNTTptIcInQ7vUcxBbOmZmnMWPSKjt1wl8ZSXEd5WZAgbtS41jryFN4FjpppyW
	 SHTO5+ZSHpVFxeV5jE8qernlSGC5PnZoRcHceMt32YHkOtQXnqZJabSIqYzzxMEBykVsC
	 pEkCDsr0XPCZRr0gVunobpHMX+LAWDGaofScnZJZJV9WIcqwoDq7TLrzwMsAC1ycpjR9S
	 qqws66aPRKAPvj5h62HQXlhGUTG1wZxnpN6kz6oHIALWeg6n4wl4XnyUoh9+Bhvj/Kiak
	 9gt2gzQtr71LgbXXL+4fxL80cwRdjLwBn3CrMppMLwk7HLv5YfkiYhpXP6Am1FTlybg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790629276;
	bh=qfOZ2WGQFrYk7SI74Ce0v+qBL0mcWtKmaUm06moSvoY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MZWPrV28o8A6NnWoWanobnMdDD7UQJgu0J6fi54dE2YG1Jsj+ZJfOGzsFD3pfC/8Z
	 ti96s02FQ1U8+w9wxP0eVjYJDqp76ZOxQWKofBEM+iJdy2FnC2zywBYo4nBIpMTduN
	 uf36lPAkpMZIyE8DqkWqRVxXxiON7gxrni9EDswSYzn26Tujb35I4JyfrpTN/sGTIN
	 nFHgIYh0LC/IXNXR7mNrtBnC5h+DlRIvtecsnKpESiw1/USaaVC1SV1rwk27YA21D+
	 Lnku/rCFktmEzhQNf5eBv1rS/06qa6zOsqLDQcdWLdeBIbFL7BuDOUBIOHRb8VUC4H
	 L9Sad5sHAe+Jw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B02A80AFB;
	Mon, 28 Sep 2026 21:01:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 454B961
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B4774018B
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uNRIPK_2ZLwA for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:01:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 1A69C400B4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790629273;
 b=gg6aEDCQJ2yczPr3aiAq+4e4d28l9ItLp4D0STl7G+zqMmArtUyq2SI81WZmfX9cH9pj
 YS9SyaBzVI+7eczDS/f9llC016u1lB/fuAEjpBXZCRsoE+wxRBZ7bs0Co+WqaZaJWs3gG
 FYmXjiHjjjsxAVNJMfZT0s084a/6sYbesHUTOYo67NvV+heEQL6gECzi0oO6O9lYW69Pb
 BbPIi6gPiKrHt/YbRQQFh317/x0f1kaA3hSWp7R+ZCe54+rF6UoAe51GvIsTIcrwNmGeQ
 MDYpe7zYvM9s4VCNuFtKd14zy33Q/nioUzUse3WjCmD7mXwQadubrdOgIdo+SJhTkqw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790629273;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pjVGSqyNiOYEt0eQEfvcQj1iAZXUAaWVgHbaZy1Q3Vc=;
 b=qJ6K3YYiwwx4j8H3xVzKaYeRMykGALuAHBRWPzArczSlmhGNC9K851VlBpmrzJOR28a3
 wGLJjJi/BPP5Oa9UsDHIfiGY520phQeO39IKoRaeC7adgM/e4CFd3OlMw73gDvLxRJ04E
 aXQ6NpCdx2xVYwxXXHAnYLF2pEnFiS5xCkTBfZzmKafexftWkIp1UesW2o0To3R/hpeyZ
 raGsCmiZG4nFus4R5eEEqdUez6y64gkPkRmc64BLK850UwTy8pW2qvNNVVaXZKCbSzqCS
 a9xcAicn4yulsF2Q5VjMe9xxffMNE3KSZMjYSJloGkgaWT59WcAEhnTBCt9xTaB6h+Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A69C400B4
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:01:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9EE45983D1; Mon, 28 Sep 2026 21:00:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 14:37:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e2f49a31c8429d321035a2ac674e102b1c9db7c9
X-Git-Newrev: ce1bde641bd7628e4db44e41f22eede540a89576
X-Patchwork-Hint: ignore
Message-Id: <20260928210000.9EE45983D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grpc: fix build with OpenSSL 4.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ce1bde641bd7628e4db44e41f22eede540a89576
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/grpc/0003-Add-support-for-OpenSSL-4.patch | 327 ++++++++++++++++++++++
 1 file changed, 327 insertions(+)

diff --git a/package/grpc/0003-Add-support-for-OpenSSL-4.patch b/package/grpc/0003-Add-support-for-OpenSSL-4.patch
new file mode 100644
index 0000000000..cc517a2461
--- /dev/null
+++ b/package/grpc/0003-Add-support-for-OpenSSL-4.patch
@@ -0,0 +1,327 @@
+From fb056ab0bb3ed003febe82f069ff41514288a4f3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bj=C3=B6rn=20Svensson?= <bjorn.a.svensson@est.tech>
+Date: Mon, 31 Aug 2026 09:52:46 -0700
+Subject: [PATCH] [OpenSSL] Add support for OpenSSL 4 (#41932)
+
+OpenSSL 4.0 removes several deprecated APIs and changes return types of various getter functions to `const`.
+This PR fixes all affected code in gRPC's SSL transport layer, credentials, and tests.
+
+To handle the `const` return type differences across OpenSSL versions without version-specific `#if` guards at every call site, `auto*` is used to let the compiler deduce the correct type.
+Where downstream serialization and copy functions (`i2d_X509_NAME`, `i2d_ASN1_OCTET_STRING`, `X509_NAME_dup`) have not yet been constified, `const_cast` is used at the call site to bridge the gap. These functions only read the data, so the cast is safe.
+
+Tested by building and running SSL tests against BoringSSL and OpenSSL 1.0.2u, 1.1.1w, 3.0.13, and 4.0.0.
+Each commit message in this PR has some more details.
+
+RELEASE NOTES:
+
+* Add OpenSSL 4.0 compatibility.
+
+Closes #41932
+
+COPYBARA_INTEGRATE_REVIEW=https://github.com/grpc/grpc/pull/41932 from Nordix:openssl4 c2edc3d46ab7e87ced5d9d95710885a8a8c7a3e2
+PiperOrigin-RevId: 973935241
+
+Upstream: https://github.com/grpc/grpc/commit/fb056ab0bb3ed003febe82f069ff41514288a4f3
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .../call/external/aws_request_signer.cc       | 16 ++++++++++
+ .../transport/tls/grpc_tls_crl_provider.cc    |  4 +--
+ src/core/tsi/ssl_transport_security.cc        | 32 +++++++++++++------
+ src/core/tsi/ssl_transport_security_utils.cc  | 14 ++++----
+ test/core/handshake/client_ssl.cc             |  4 ++-
+ test/core/handshake/server_ssl_common.cc      |  4 ++-
+ test/core/tsi/ssl_transport_security_test.cc  | 10 ++++++
+ 7 files changed, 65 insertions(+), 19 deletions(-)
+
+diff --git a/src/core/credentials/call/external/aws_request_signer.cc b/src/core/credentials/call/external/aws_request_signer.cc
+index f7fb7a25b1d0b..d3f506d095abf 100644
+--- a/src/core/credentials/call/external/aws_request_signer.cc
++++ b/src/core/credentials/call/external/aws_request_signer.cc
+@@ -18,12 +18,15 @@
+ #include <grpc/support/port_platform.h>
+ #include <openssl/crypto.h>
+ #include <openssl/evp.h>
++#if OPENSSL_VERSION_NUMBER < 0x30000000L
+ #include <openssl/hmac.h>
++#endif
+ #include <openssl/sha.h>
+ 
+ #include <utility>
+ #include <vector>
+ 
++#include "src/core/util/grpc_check.h"
+ #include "absl/status/statusor.h"
+ #include "absl/strings/ascii.h"
+ #include "absl/strings/escaping.h"
+@@ -41,6 +44,7 @@ namespace {
+ 
+ #if OPENSSL_VERSION_NUMBER >= 0x30000000L
+ const char kSha256[] = "SHA256";
++const char kHmacName[] = "HMAC";
+ #endif
+ const char kAlgorithm[] = "AWS4-HMAC-SHA256";
+ const char kDateFormat[] = "%a, %d %b %E4Y %H:%M:%S %Z";
+@@ -67,12 +71,24 @@ std::string SHA256Hex(const std::string& str) {
+ }
+ 
+ std::string HMAC(const std::string& key, const std::string& msg) {
++#if OPENSSL_VERSION_NUMBER < 0x30000000L
+   unsigned int len;
+   unsigned char digest[EVP_MAX_MD_SIZE];
+   HMAC(EVP_sha256(), key.c_str(), key.length(),
+        reinterpret_cast<const unsigned char*>(msg.c_str()), msg.length(),
+        digest, &len);
+   return std::string(digest, digest + len);
++#else
++  size_t len = 0;
++  unsigned char digest[EVP_MAX_MD_SIZE];
++  GRPC_CHECK_NE(EVP_Q_mac(nullptr, kHmacName, nullptr, kSha256, nullptr,
++                          reinterpret_cast<const unsigned char*>(key.c_str()),
++                          key.length(),
++                          reinterpret_cast<const unsigned char*>(msg.c_str()),
++                          msg.length(), digest, sizeof(digest), &len),
++                nullptr);
++  return std::string(digest, digest + len);
++#endif
+ }
+ 
+ }  // namespace
+diff --git a/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc b/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc
+index 5e24c18ee6127..dc95ba8457121 100644
+--- a/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc
++++ b/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc
+@@ -56,12 +56,12 @@ absl::StatusOr<std::string> IssuerFromCrl(X509_CRL* crl) {
+   if (crl == nullptr) {
+     return absl::InvalidArgumentError("crl cannot be null");
+   }
+-  X509_NAME* issuer = X509_CRL_get_issuer(crl);
++  auto* issuer = X509_CRL_get_issuer(crl);
+   if (issuer == nullptr) {
+     return absl::InvalidArgumentError("crl cannot have null issuer");
+   }
+   unsigned char* buf = nullptr;
+-  int len = i2d_X509_NAME(issuer, &buf);
++  int len = i2d_X509_NAME(const_cast<X509_NAME*>(issuer), &buf);
+   if (len < 0 || buf == nullptr) {
+     return absl::InvalidArgumentError("crl cannot have null issuer");
+   }
+diff --git a/src/core/tsi/ssl_transport_security.cc b/src/core/tsi/ssl_transport_security.cc
+index 6c1f20ebb5374..29ec47eeeef41 100644
+--- a/src/core/tsi/ssl_transport_security.cc
++++ b/src/core/tsi/ssl_transport_security.cc
+@@ -49,7 +49,9 @@
+ #include <grpc/support/thd_id.h>
+ #include <openssl/bio.h>
+ #include <openssl/crypto.h>  // For OPENSSL_free
++#if !defined(OPENSSL_NO_ENGINE)
+ #include <openssl/engine.h>
++#endif
+ #include <openssl/err.h>
+ #include <openssl/ssl.h>
+ #include <openssl/tls1.h>
+@@ -1021,9 +1023,7 @@ static int looks_like_ip_address(absl::string_view name) {
+ static tsi_result ssl_get_x509_common_name(X509* cert, unsigned char** utf8,
+                                            size_t* utf8_size) {
+   int common_name_index = -1;
+-  X509_NAME_ENTRY* common_name_entry = nullptr;
+-  ASN1_STRING* common_name_asn1 = nullptr;
+-  X509_NAME* subject_name = X509_get_subject_name(cert);
++  auto* subject_name = X509_get_subject_name(cert);
+   int utf8_returned_size = 0;
+   if (subject_name == nullptr) {
+     VLOG(2) << "Could not get subject name from certificate.";
+@@ -1035,12 +1035,13 @@ static tsi_result ssl_get_x509_common_name(X509* cert, unsigned char** utf8,
+     VLOG(2) << "Could not get common name of subject from certificate.";
+     return TSI_NOT_FOUND;
+   }
+-  common_name_entry = X509_NAME_get_entry(subject_name, common_name_index);
++  auto* common_name_entry =
++      X509_NAME_get_entry(subject_name, common_name_index);
+   if (common_name_entry == nullptr) {
+     LOG(ERROR) << "Could not get common name entry from certificate.";
+     return TSI_INTERNAL_ERROR;
+   }
+-  common_name_asn1 = X509_NAME_ENTRY_get_data(common_name_entry);
++  auto* common_name_asn1 = X509_NAME_ENTRY_get_data(common_name_entry);
+   if (common_name_asn1 == nullptr) {
+     LOG(ERROR) << "Could not get common name entry asn1 from certificate.";
+     return TSI_INTERNAL_ERROR;
+@@ -1081,7 +1082,7 @@ static tsi_result peer_property_from_x509_common_name(
+ static tsi_result peer_property_from_x509_subject(X509* cert,
+                                                   tsi_peer_property* property,
+                                                   bool is_verified_root_cert) {
+-  X509_NAME* subject_name = X509_get_subject_name(cert);
++  auto* subject_name = X509_get_subject_name(cert);
+   if (subject_name == nullptr) {
+     GRPC_TRACE_LOG(tsi, INFO) << "Could not get subject name from certificate.";
+     return TSI_NOT_FOUND;
+@@ -1177,17 +1178,30 @@ static tsi_result add_subject_alt_names_properties_to_peer(
+       char ntop_buf[INET6_ADDRSTRLEN];
+       int af;
+ 
++#if OPENSSL_VERSION_NUMBER >= 0x10100000L
++      if (ASN1_STRING_length(subject_alt_name->d.iPAddress) == 4) {
++        af = AF_INET;
++      } else if (ASN1_STRING_length(subject_alt_name->d.iPAddress) == 16) {
++        af = AF_INET6;
++#else
+       if (subject_alt_name->d.iPAddress->length == 4) {
+         af = AF_INET;
+       } else if (subject_alt_name->d.iPAddress->length == 16) {
+         af = AF_INET6;
++#endif
+       } else {
+         LOG(ERROR) << "SAN IP Address contained invalid IP";
+         result = TSI_INTERNAL_ERROR;
+         break;
+       }
++#if OPENSSL_VERSION_NUMBER >= 0x10100000L
++      const char* name =
++          inet_ntop(af, ASN1_STRING_get0_data(subject_alt_name->d.iPAddress),
++                    ntop_buf, INET6_ADDRSTRLEN);
++#else
+       const char* name = inet_ntop(af, subject_alt_name->d.iPAddress->data,
+                                    ntop_buf, INET6_ADDRSTRLEN);
++#endif
+       if (name == nullptr) {
+         LOG(ERROR) << "Could not get IP string from asn1 octet.";
+         result = TSI_INTERNAL_ERROR;
+@@ -1472,13 +1486,13 @@ static tsi_result x509_store_load_certs(X509_STORE* cert_store,
+       break;  // We're at the end of stream.
+     }
+     if (root_names != nullptr) {
+-      root_name = X509_get_subject_name(root);
+-      if (root_name == nullptr) {
++      auto* root_subject = X509_get_subject_name(root);
++      if (root_subject == nullptr) {
+         LOG(ERROR) << "Could not get name from root certificate.";
+         result = TSI_INVALID_ARGUMENT;
+         break;
+       }
+-      root_name = X509_NAME_dup(root_name);
++      root_name = X509_NAME_dup(const_cast<X509_NAME*>(root_subject));
+       if (root_name == nullptr) {
+         result = TSI_OUT_OF_RESOURCES;
+         break;
+diff --git a/src/core/tsi/ssl_transport_security_utils.cc b/src/core/tsi/ssl_transport_security_utils.cc
+index 7318bc3f78057..9bf292821565c 100644
+--- a/src/core/tsi/ssl_transport_security_utils.cc
++++ b/src/core/tsi/ssl_transport_security_utils.cc
+@@ -282,11 +282,11 @@ bool VerifyCrlCertIssuerNamesMatch(X509_CRL* crl, X509* cert) {
+   if (cert == nullptr || crl == nullptr) {
+     return false;
+   }
+-  X509_NAME* cert_issuer_name = X509_get_issuer_name(cert);
++  auto* cert_issuer_name = X509_get_issuer_name(cert);
+   if (cert_issuer_name == nullptr) {
+     return false;
+   }
+-  X509_NAME* crl_issuer_name = X509_CRL_get_issuer(crl);
++  auto* crl_issuer_name = X509_CRL_get_issuer(crl);
+   if (crl_issuer_name == nullptr) {
+     return false;
+   }
+@@ -317,9 +317,9 @@ absl::StatusOr<std::string> IssuerFromCert(X509* cert) {
+   if (cert == nullptr) {
+     return absl::InvalidArgumentError("cert cannot be null");
+   }
+-  X509_NAME* issuer = X509_get_issuer_name(cert);
++  auto* issuer = X509_get_issuer_name(cert);
+   unsigned char* buf = nullptr;
+-  int len = i2d_X509_NAME(issuer, &buf);
++  int len = i2d_X509_NAME(const_cast<X509_NAME*>(issuer), &buf);
+   if (len < 0 || buf == nullptr) {
+     return absl::InvalidArgumentError("could not read issuer name from cert");
+   }
+@@ -339,7 +339,8 @@ absl::StatusOr<std::string> AkidFromCertificate(X509* cert) {
+     if (X509_get_ext_by_NID(cert, NID_authority_key_identifier, j) != -1) {
+       return absl::InvalidArgumentError("Could not get AKID from certificate.");
+     }
+-    akid = X509_EXTENSION_get_data(X509_get_ext(cert, j));
++    akid = const_cast<ASN1_OCTET_STRING*>(
++        X509_EXTENSION_get_data(X509_get_ext(cert, j)));
+   } else {
+     return absl::InvalidArgumentError("Could not get AKID from certificate.");
+   }
+@@ -364,7 +365,8 @@ absl::StatusOr<std::string> AkidFromCrl(X509_CRL* crl) {
+     if (X509_CRL_get_ext_by_NID(crl, NID_authority_key_identifier, j) != -1) {
+       return absl::InvalidArgumentError("Could not get AKID from crl.");
+     }
+-    akid = X509_EXTENSION_get_data(X509_CRL_get_ext(crl, j));
++    akid = const_cast<ASN1_OCTET_STRING*>(
++        X509_EXTENSION_get_data(X509_CRL_get_ext(crl, j)));
+   } else {
+     return absl::InvalidArgumentError("Could not get AKID from crl.");
+   }
+diff --git a/test/core/handshake/client_ssl.cc b/test/core/handshake/client_ssl.cc
+index 1952c6055094f..c985c0de926f1 100644
+--- a/test/core/handshake/client_ssl.cc
++++ b/test/core/handshake/client_ssl.cc
+@@ -197,13 +197,15 @@ static void server_thread(void* arg) {
+   OpenSSL_add_ssl_algorithms();
+   args->ssl_library_info->Notify();
+ 
+-  const SSL_METHOD* method = TLSv1_2_server_method();
++  const SSL_METHOD* method = TLS_server_method();
+   SSL_CTX* ctx = SSL_CTX_new(method);
+   if (!ctx) {
+     perror("Unable to create SSL context");
+     ERR_print_errors_fp(stderr);
+     abort();
+   }
++  SSL_CTX_set_min_proto_version(ctx, TLS1_2_VERSION);
++  SSL_CTX_set_max_proto_version(ctx, TLS1_2_VERSION);
+ 
+   // Load key pair.
+   if (SSL_CTX_use_certificate_file(ctx, SSL_CERT_PATH, SSL_FILETYPE_PEM) < 0) {
+diff --git a/test/core/handshake/server_ssl_common.cc b/test/core/handshake/server_ssl_common.cc
+index ece1b6f50109e..7cb8f95e578f3 100644
+--- a/test/core/handshake/server_ssl_common.cc
++++ b/test/core/handshake/server_ssl_common.cc
+@@ -187,13 +187,15 @@ bool server_ssl_test(const char* alpn_list[], unsigned int alpn_list_len,
+   // server port.
+   s.Await();
+ 
+-  const SSL_METHOD* method = TLSv1_2_client_method();
++  const SSL_METHOD* method = TLS_client_method();
+   SSL_CTX* ctx = SSL_CTX_new(method);
+   if (!ctx) {
+     perror("Unable to create SSL context");
+     ERR_print_errors_fp(stderr);
+     abort();
+   }
++  SSL_CTX_set_min_proto_version(ctx, TLS1_2_VERSION);
++  SSL_CTX_set_max_proto_version(ctx, TLS1_2_VERSION);
+ 
+   // Load key pair.
+   if (SSL_CTX_use_certificate_file(ctx, SSL_CERT_PATH, SSL_FILETYPE_PEM) < 0) {
+diff --git a/test/core/tsi/ssl_transport_security_test.cc b/test/core/tsi/ssl_transport_security_test.cc
+index 806495f87ccca..8c3f4677495ec 100644
+--- a/test/core/tsi/ssl_transport_security_test.cc
++++ b/test/core/tsi/ssl_transport_security_test.cc
+@@ -23,6 +23,7 @@
+ #include <grpc/support/string_util.h>
+ #include <openssl/crypto.h>
+ #include <openssl/err.h>
++#include <openssl/evp.h>
+ #include <openssl/pem.h>
+ #include <stdbool.h>
+ #include <stdio.h>
+@@ -985,7 +986,16 @@ TEST_P(SslTransportSecurityTest, DoRoundTripForAllConfigs) {
+ TEST_P(SslTransportSecurityTest, DoRoundTripWithErrorOnStack) {
+   // Invoke an SSL function that causes an error, and ensure the error
+   // makes it to the stack.
++#if OPENSSL_VERSION_NUMBER < 0x30000000L
+   ASSERT_FALSE(EC_KEY_new_by_curve_name(NID_rsa));
++#else
++  // Use EVP_PKEY_CTX with an invalid operation to push an error.
++  EVP_PKEY_CTX* err_ctx = EVP_PKEY_CTX_new_id(EVP_PKEY_RSA, nullptr);
++  ASSERT_NE(err_ctx, nullptr);
++  // Calling sign_init without a key will fail and push an error.
++  ASSERT_LE(EVP_PKEY_sign_init(err_ctx), 0);
++  EVP_PKEY_CTX_free(err_ctx);
++#endif
+   ASSERT_NE(ERR_peek_error(), 0);
+   SetUpSslFixture(/*tls_version=*/std::get<0>(GetParam()),
+                   /*send_client_ca_list=*/std::get<1>(GetParam()));
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
