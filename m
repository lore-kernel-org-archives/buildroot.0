Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D05CD98DE
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 01:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A06B426D8;
	Tue, 16 Jun 2026 01:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvINC8vs_w6n; Tue, 16 Jun 2026 01:31:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7DDA41FEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781573483;
	bh=ke6C0ZzWMYg/Qspu2z/esMvpdup7SH2KpBvUaF7bgSk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=AUlbFhfMMwV61fpPCm5ciuXcgy2EFtkE0Ia4ntAyVvh3Y8EGJTKAaP9WleyXQYRC1
	 o5pXk0C7lDumbYtV7TizfE9XnKKJ1fk1szDvvN1ykkroVxKIOzFXzoMnHxkoZV9Fm/
	 tSYv+bXZO8f0O4/1fc12TNeDUUx/jeSry7u3WacJfpaoA+VI51212g8JLSaOR4qmSH
	 RiecU2lA8AZcdoVcZXtFs4yQvy8HE1Uzh4IY6CZTOyZRPmOuydWXH6rXUqfsj9adY1
	 U85QQRHI5Ud1LZ2juAicRRhtHtF+L0ZEx3CnCu56TI6oDa9wlYxCPt2paMXWsp/4tu
	 0CsgW5bfChzyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7DDA41FEA;
	Tue, 16 Jun 2026 01:31:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 64A7A2B8
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 01:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B43460674
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 01:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ehb2e6HIDgKs for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 01:31:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6DFDA60673
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DFDA60673
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DFDA60673
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 01:31:21 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-69e1f777bcaso3244380eaf.1
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 18:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781573480; x=1782178280;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pS4t9JSeHEuhAYbCb5uk0tbGAsvg5TVeaXoDRLSkNOo=;
 b=M4ajxX0tYMzFR8GKWU5QB+dDp2L4MHbdlx85ghu+LFOJ3Pj7RO+gJdOYfarj8HHlI+
 /JcaxDS7QZh+CgRsJxUpL0vWNzGsO786Lpo07FYeptC0UKIOd78ILb+znjQ/+c87rQ7b
 j4/JeIecDkSThRdCVmLnshVHcNjPmUHfXCIMtBJuEAz2tYGbQfvjvSX2jB7lbdy7ssZU
 dvNZ/sBZE/lltM1S+XY7FMXwSRUsL284+kn36A3wCqSogg+aHybbsJllsp2kll0Tux/9
 Xj7ebns3jAo/BuGlaKUPmMnIa6wGQot6iV3xUdbrAyviCGxJkSqp0eK9EkzMwieWUJWY
 BUeA==
X-Gm-Message-State: AOJu0Yx8fnqCmSTghGqCB11ioz++PIkCGvqkf9TWV6G1m/YGrgab76PT
 PJhgWXWUrhvXQhNlbtVJXD5YNv4c1NLRH2XVlzDYqG8G7CUpiOcCoVHS+mFrsc1V
X-Gm-Gg: Acq92OGDOde4O8AKQNbhIZFtGNZo1ngWOMymKG6s0s1Xcq/glNoFCLv3LwvdRR9v4tl
 XwAsK7VNYicqIM9J87L7wGXsdvEvQtCfAcXOF5N8Tl+gSksZ6dXdFS8AxhLlKtrqwi4Jp/FCfSq
 150d2mifSOlUOOm19PMzp1VfJnDTZm/sZA+0MZ3ZWsxUYKoUyaH8gYt/AXfEb7K/BcYwtFE/lj2
 o5mrbqTpJPUH/ZCrCgGvPt0MbN539YFhXpspivbREE23lSwHDek0fbRFwN8oBGe5KFNvJjXPWTh
 TmBpKV3NqI1X85R3F/mTZP3qebOZppIC6YqWj8ZSSmnxKrrl7MyJ84D2YV3la2x39yg+uCIMC4w
 Zsve4oylRvbQechm0OH7vWqAdf02ClPUlO6W4d4EFMugj9FdrTsL5IQLspa3+/E7W7c9HM+OoZn
 o1E6XdW0XackhQh968hvmc6X/SI2zbMuoIlATasUteBNTilEHGolm+0UwT6ZN5C/DzRTZuf9ibB
 d70JMVyTc/Tn5Bi6s3JDfN1cx05I/9svLOeqJZUXB+Bk1U3QK58aUXhhJHR8ZgU9V5PV/hFxy4S
 XlUIlpnErlz0hOVzxb16V8aGSg==
X-Received: by 2002:a05:6820:1746:b0:69e:a233:6154 with SMTP id
 006d021491bc7-6a0a3ec48d7mr1040868eaf.8.1781573480230; 
 Mon, 15 Jun 2026 18:31:20 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-16-141.hlrn.qwest.net.
 [174.29.16.141]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-44308b0057csm1183962fac.8.2026.06.15.18.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 18:31:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 19:31:11 -0600
Message-ID: <20260616013113.3899641-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781573480; x=1782178280; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pS4t9JSeHEuhAYbCb5uk0tbGAsvg5TVeaXoDRLSkNOo=;
 b=Ht98T0NOaaPd7RtYDxEwJ/tgK2V5XehJB8GaSTAU0fcnKEMpqjy8rG/l2EdTyzfRn7
 SYG2RFWZ607g8lVND0Ba4bOWqCwQE59JN2QLwvXAfZbzkxPbGyLm55P5oe0vUWFGHZJg
 E2G2c+YfVjexhDDz3tiJMnfXxR62e3HnxgBxqqSh7NloE3efjnkGGGSa5u5B8X56LxNc
 ffljN9lBqbnO4BkvmIPL7CxAPjZ8b2rfFJeDRzUBIIOA/kG0k5IzspaZPL4j+nLLOpi1
 FSuRCPPjXFopbA6Cgwq7/aYxsxu8ChXgFY4PVU2kBuG6DjwKgCbNr/hIn6qwZpiVEaNI
 wn1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Ht98T0NO
Subject: [Buildroot] [PATCH 1/3] support/download: add blake2b-256 hash
 support
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

PyPI exposes a blake2b_256 digest for distribution files, and that
same digest is used in the hash-based files.pythonhosted.org download
paths. Add support for storing those hashes in Buildroot .hash files.

Teach the download hash checker to validate blake2b-256 entries using
b2sum -l 256, and update check-package so the new hash type and length
are accepted. Also add the CycloneDX hash spelling so generated SBOMs
can include blake2b-256 hashes from .hash files.

Update scanpypi to write the PyPI-provided blake2b_256 digest alongside
the existing md5 and sha256 entries.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 docs/manual/adding-packages-directory.adoc             | 3 ++-
 support/download/check-hash                            | 7 ++++++-
 support/testing/tests/utils/test_generate_cyclonedx.py | 9 +++++++++
 utils/checkpackagelib/lib_hash.py                      | 2 +-
 utils/checkpackagelib/test_lib_hash.py                 | 4 ++++
 utils/generate-cyclonedx                               | 1 +
 utils/scanpypi                                         | 7 ++++++-
 7 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-directory.adoc b/docs/manual/adding-packages-directory.adoc
index 15de559deb..27f0fcd9a9 100644
--- a/docs/manual/adding-packages-directory.adoc
+++ b/docs/manual/adding-packages-directory.adoc
@@ -464,7 +464,7 @@ The format of this file is one line for each file for which to check the
 hash, each line with the following three fields separated by two spaces:
 
 * the type of hash, one of:
-** +md5+, +sha1+, +sha224+, +sha256+, +sha384+, +sha512+
+** +md5+, +sha1+, +sha224+, +sha256+, +sha384+, +sha512+, +blake2b-256+
 * the hash of the file:
 ** for +md5+, 32 hexadecimal characters
 ** for +sha1+, 40 hexadecimal characters
@@ -472,6 +472,7 @@ hash, each line with the following three fields separated by two spaces:
 ** for +sha256+, 64 hexadecimal characters
 ** for +sha384+, 96 hexadecimal characters
 ** for +sha512+, 128 hexadecimal characters
+** for +blake2b-256+, 64 hexadecimal characters
 * the name of the file:
 ** for a source archive: the basename of the file, without any directory
    component,
diff --git a/support/download/check-hash b/support/download/check-hash
index d18ec8b134..74079dac1a 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -49,6 +49,7 @@ check_one_hash() {
     case "${_h}" in
         md5|sha1)                       ;;
         sha224|sha256|sha384|sha512)    ;;
+        blake2b-256)                    ;;
         *) # Unknown hash, exit with error
             printf "ERROR: unknown hash '%s' for '%s'\n"  \
                    "${_h}" "${base}" >&2
@@ -57,7 +58,11 @@ check_one_hash() {
     esac
 
     # Do the hashes match?
-    _hash="$( "${_h}sum" "${_file}" |cut -d ' ' -f 1 )"
+    if [ "${_h}" = "blake2b-256" ]; then
+        _hash="$( b2sum -l 256 "${_file}" |cut -d ' ' -f 1 )"
+    else
+        _hash="$( "${_h}sum" "${_file}" |cut -d ' ' -f 1 )"
+    fi
     if [ "${_hash}" = "${_known}" ]; then
         printf "%s: OK (%s: %s)\n" "${base}" "${_h}" "${_hash}"
         return 0
diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index e6640fbd0d..bb80a5ff23 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -186,6 +186,7 @@ class TestGenerateCycloneDX(unittest.TestCase):
                 "# source archive checksums\n"
                 "sha256 1111111111111111111111111111111111111111111111111111111111111111 foo-1.2.tar.gz\n"
                 "sha1 2222222222222222222222222222222222222222 foo-1.2.tar.gz\n"
+                "blake2b-256 3333333333333333333333333333333333333333333333333333333333333333 foo-1.2.tar.gz\n"
                 "sha256 aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa LICENSE\n"
             )
 
@@ -220,6 +221,10 @@ class TestGenerateCycloneDX(unittest.TestCase):
                             "alg": "SHA-1",
                             "content": "2222222222222222222222222222222222222222",
                         },
+                        {
+                            "alg": "BLAKE2b-256",
+                            "content": "3333333333333333333333333333333333333333333333333333333333333333",
+                        },
                     ]
                 },
                 {
@@ -234,6 +239,10 @@ class TestGenerateCycloneDX(unittest.TestCase):
                             "alg": "SHA-1",
                             "content": "2222222222222222222222222222222222222222",
                         },
+                        {
+                            "alg": "BLAKE2b-256",
+                            "content": "3333333333333333333333333333333333333333333333333333333333333333",
+                        },
                     ],
                 }
             ],
diff --git a/utils/checkpackagelib/lib_hash.py b/utils/checkpackagelib/lib_hash.py
index 5968c809bf..3eafe7d9e0 100644
--- a/utils/checkpackagelib/lib_hash.py
+++ b/utils/checkpackagelib/lib_hash.py
@@ -31,7 +31,7 @@ class HashNumberOfFields(_CheckFunction):
 
 class HashType(_CheckFunction):
     len_of_hash = {"md5": 32, "sha1": 40, "sha224": 56, "sha256": 64,
-                   "sha384": 96, "sha512": 128}
+                   "sha384": 96, "sha512": 128, "blake2b-256": 64}
 
     def check_line(self, lineno, text):
         if _empty_line_or_comment(text):
diff --git a/utils/checkpackagelib/test_lib_hash.py b/utils/checkpackagelib/test_lib_hash.py
index fdc6338189..cbccad647d 100644
--- a/utils/checkpackagelib/test_lib_hash.py
+++ b/utils/checkpackagelib/test_lib_hash.py
@@ -124,6 +124,10 @@ HashType = [
      'sha512 1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678'
      '9012345678\n',
      []),
+    ('blake2b-256',
+     'any',
+     'blake2b-256 1234567890123456789012345678901234567890123456789012345678901234\n',
+     []),
     ]
 
 
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index bade018cd4..2f5981934f 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -298,6 +298,7 @@ def cyclonedx_source_hashes(comp, source):
         "sha256": "SHA-256",
         "sha512": "SHA-512",
         "md5": "MD5",
+        "blake2b-256": "BLAKE2b-256",
     }
 
     hashes = []
diff --git a/utils/scanpypi b/utils/scanpypi
index 61879e39d4..de658328fe 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -672,7 +672,7 @@ class BuildrootPackage():
         print('Creating {filename}...'.format(filename=path_to_hash))
         lines = []
         if self.used_url['digests']['md5'] and self.used_url['digests']['sha256']:
-            hash_header = '# md5, sha256 from {url}\n'.format(
+            hash_header = '# md5, sha256, blake2b-256 from {url}\n'.format(
                 url=self.metadata_url)
             lines.append(hash_header)
             hash_line = '{method}  {digest}  {filename}\n'.format(
@@ -685,6 +685,11 @@ class BuildrootPackage():
                 digest=self.used_url['digests']['sha256'],
                 filename=self.filename)
             lines.append(hash_line)
+            hash_line = '{method}  {digest}  {filename}\n'.format(
+                method='blake2b-256',
+                digest=self.used_url['digests']['blake2b_256'],
+                filename=self.filename)
+            lines.append(hash_line)
 
         if self.license_files:
             lines.append('# Locally computed sha256 checksums\n')
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
