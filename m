Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B916CD98F2
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 06:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1077161090;
	Thu, 18 Jun 2026 06:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L4PbWfzxv28Z; Thu, 18 Jun 2026 06:51:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 069A761091
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781765504;
	bh=eCu50l1Yx/PhBWt6jSMWavR/ELq+tU0QliXgtdi2B/g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=oJjW+XRRhn+OMfCXRh8T32zfbqsqwfZJWgKhtDrZd/T80edon3Cs7YtMOgNn/OfIP
	 lM8xPNy6zClwYeT8kER09iLHTCRSKyXYFqxb5KMn3r0rlC0tw6caNA1Z81hnmwuZmg
	 Ok97TPtv7YLnVTE7Q+sMU0xJD6Xg9dexJ9bYwjai01mWWNnDSBGPXpC7egneMwU9eT
	 pah25rLYxN3A1rLExP+wjCFvKaBwR7DnMltDJCmhbM6Lx8CVLgStwqDyY7fCvjqgmy
	 pug52g/v5JpHcvHVFwST89rsc1y3lg58iKls2Ax80ZuBWLefQpKgrhZvKGZzsadCnz
	 l+Gn3BaIq7NjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 069A761091;
	Thu, 18 Jun 2026 06:51:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B71361F3
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 06:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C2C341325
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 06:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FCj0WUDAypFy for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 06:51:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B647041322
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B647041322
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B647041322
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 06:51:41 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-7e6e9408e30so549718a34.2
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 23:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781765500; x=1782370300;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KFx1LtxpIlDWE2cMx1AlQI1cA/PUPf9PN/b+TjMHshU=;
 b=BqVBNQr+2Xet31A7FqEiX31/PqGclgpqT6KV6XnZ+sbKTNF358447aQyvp5XMruQPN
 RTfZHAJBScWy3/nZQcGysU2oQCScKZQk5ArriGwitRDzfp1/WaEMSySMCT5yjV9ppkR6
 uZFKlUHj4SaplWdY41AGvP4KoMgaWktyFSb1JpEVUXRw1IliiupZXHb6KNZF1YH/mQMi
 w2ZBJ/NhGqIDjq4wOWJup6L9g035d3AWTPflBP0ZohyhzR1Al6sKz66SrgzrY8bzBgqV
 QC78ISatSLjZObG9v1rm10zogka4vYuAhlo4uWkIVNGIKfJZRivUSDZ4mM5+tX0io0vm
 0S5A==
X-Gm-Message-State: AOJu0YySCbUI9ICA+rTcoPN+nSzkf01IlBtpDM6zFtYB+G1DgiG4L/I2
 pKtJ/WLBaLouVVoVJKAOHQf+TmWPCBHxuFxge6h1SaXdwzvrD+9jPbRN6Y5qm7RF
X-Gm-Gg: Acq92OHzlIt5ctq9doPN5qsiraKkMJEhNnsoVwguyS/UrQQj/pOIPmjthd5zJ5BuGwY
 mAmf1BMBVFCFg0HbV+6A7jLMNdgwyjREKxYRozYI1ltXLgRpYwSDdPvb7kPwThLNu+QTQoz+khg
 J3CRGfLcW3c2q7FIFhw89l3Isn9R3nHGNG6SGcMdvrAerx0abuG8BxYYq0CZ+LV91tD0I+eIr+j
 ArIVLND+nid/UOLEvaD0SpDORC/fFwb8L4QAZ1U1mFkMNtHYgFvTRA5r5cjNIvjkGQjywoQiuhf
 YbcCn8XXbHDVMyiY06Y4a9FfvZ6JUHRdCd81hfZ1tER3H4ClekZQOCyom8tkaaJgCDcXNwf7L2J
 DUJx8hyN8N9f2KxCX4x2Wq+RaI7CGdG7IZ/1aNRR/TRkuWn+/J/txAdeZZFfJBk3L3W1n+8elAC
 jPkVYRiA84qkhsEhsXkUHRqz3BvI6+oOit4T5goBD+CO39oUOX9wJj8EGwMLl24M6B4Xn7RNDFd
 wNwESkpvJMpCnwo8zZoH8Mc0QeDyUOU0xTI8O1kN29RnMYlffcf4xOVlkGr/zjr3QiRzUXGO+hq
 33DRKNiKAJuCyWQ=
X-Received: by 2002:a05:6830:7104:b0:7e7:5e4:ee11 with SMTP id
 46e09a7af769-7e91c2ee8ecmr2049642a34.16.1781765500403; 
 Wed, 17 Jun 2026 23:51:40 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-16-141.hlrn.qwest.net.
 [174.29.16.141]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e79f5bb9c3sm11717542a34.10.2026.06.17.23.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 23:51:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 00:51:35 -0600
Message-ID: <20260618065137.3987932-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781765500; x=1782370300; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KFx1LtxpIlDWE2cMx1AlQI1cA/PUPf9PN/b+TjMHshU=;
 b=cBLiDMca7eOWr8Jxwr89QdOwKfSDl8+pnb3HrU2BmHcUGXBM6F1Mhy8jsuPgds8542
 zsafZKWRKwt1LRPNNI6rfawuBkwWbmJTcUTa03h4bKU1DeRuzhY7bOaFCXhgDkLycGdM
 tAPDhVRdkghUM0dzY8FksBRx4GyRVp8IWY/QLF8jdX16s4bpbB+MB/FYuMIelkkMRj5R
 Z9BVEGgDWpGuy+8DdVTGMqkHi7sWf8yBHvHg+6lPc6y3cI1r6/kd/ViIM+mCFnyODNB1
 ltaWuPJIO/E3XZCsi+9AU+TjmnR2AdyHIpoGZ7LvHXKIztSxUIF6ybP7aH2s8T8pe6JY
 cTGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=cBLiDMca
Subject: [Buildroot] [PATCH v3 1/3] support/download: add blake2b-256 hash
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
Changes v2 -> v3:
  - Require b2sum -l 256 in the host coreutils suitability check.
---
 docs/manual/adding-packages-directory.adoc             | 3 ++-
 support/dependencies/check-host-coreutils.mk           | 2 +-
 support/dependencies/check-host-coreutils.sh           | 3 +++
 support/download/check-hash                            | 7 ++++++-
 support/testing/tests/utils/test_generate_cyclonedx.py | 9 +++++++++
 utils/checkpackagelib/lib_hash.py                      | 2 +-
 utils/checkpackagelib/test_lib_hash.py                 | 4 ++++
 utils/generate-cyclonedx                               | 1 +
 utils/scanpypi                                         | 7 ++++++-
 9 files changed, 33 insertions(+), 5 deletions(-)

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
diff --git a/support/dependencies/check-host-coreutils.mk b/support/dependencies/check-host-coreutils.mk
index 87a3f446ea..32aed6eb3b 100644
--- a/support/dependencies/check-host-coreutils.mk
+++ b/support/dependencies/check-host-coreutils.mk
@@ -1,5 +1,5 @@
 # Check whether the host's coreutils are up to date enough
-# to provide 'ln --relative' and 'realpath'.
+# to provide 'ln --relative', 'realpath' and 'b2sum -l'.
 
 ifeq (,$(call suitable-host-package,coreutils))
 BR2_COREUTILS_HOST_DEPENDENCY = host-coreutils
diff --git a/support/dependencies/check-host-coreutils.sh b/support/dependencies/check-host-coreutils.sh
index 4d36d74933..36c7a802cf 100755
--- a/support/dependencies/check-host-coreutils.sh
+++ b/support/dependencies/check-host-coreutils.sh
@@ -9,4 +9,7 @@ ln --relative --help >/dev/null 2>&1
 # Does realpath exist?
 realpath --help >/dev/null 2>&1
 
+# Does b2sum exist and support the BLAKE2b-256 length option?
+b2sum -l 256 /dev/null >/dev/null 2>&1
+
 echo OK
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
