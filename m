Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91611CD98F2
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 17:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21AB0606B8;
	Wed, 17 Jun 2026 17:42:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zUQWngihIhjx; Wed, 17 Jun 2026 17:42:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E568A606B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781718142;
	bh=ke6C0ZzWMYg/Qspu2z/esMvpdup7SH2KpBvUaF7bgSk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=SnkUptXrNzMfbW4wc6gzg3kZrQqAJF/zte9+ShZrXPHOYI/tPw1gXSYV4LCHCte6O
	 3rgkrk5bm/9K8nTlmVjP+wNRrzB+GKYnCMy86SjOMzEV21rJCm8SoSbTduOUAmRAlo
	 hvy9mSoq/8Bwib8Vy5KLtBuWZ2qKJiG71C0+/1FueU3C2Ftxk3qtCrLfO/FGektUpk
	 roCaagQMKKRlzTFHji1+RHJVQ2UbnEVIy8mkYLBthq/D6WfiEtTH/tRhO4cyd09QCa
	 v+tVoREY5L+vPKrIBHhWth91uQ/PeRg/t9NdtnPZK77j2je2MSG9OHoH6np0xqosJ3
	 W6jRkd1B2ym/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E568A606B3;
	Wed, 17 Jun 2026 17:42:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C641355
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 17:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEA194011F
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 17:42:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U96npb5oAdGQ for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 17:42:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 17131400FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17131400FC
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17131400FC
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 17:42:18 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-4864a5c83f1so16911b6e.0
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 10:42:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781718138; x=1782322938;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pS4t9JSeHEuhAYbCb5uk0tbGAsvg5TVeaXoDRLSkNOo=;
 b=fGFWhi9Nx0h5EJnipRUYFwlCSDbV2etbBuhY4ZNoGZLY6tpipSJerxasdS4olG2jH0
 ft08k9P0ZYs5hlcEzPDe5bRZltNMg7VKB04vp54KDaHifKVq2a+x6Scl7h07UOAt8lai
 JTzajfbRUAGtMyDicbe8l9ZnVFeasSfNh/fGhdDYbUuZLjLVOaMNHRvDMJ+tEmKhiiuN
 w2bbQy/HiVxVVGJDZHNSyVSC2/LI9yTTwSuab8sOa06XiXT8JZQG9V0vmXwvApr3ziRu
 FTu2ujbW/RA1BWOjbyaT2+UispuWmnQyTBKXShuBSRHR6WCUYclaFWS4Vs931S31g4Dk
 1Sgw==
X-Gm-Message-State: AOJu0Yz0vn/Bxo4FCLNefmQOVB097L4I5MievV/AcdQcyCE8kYeORHCX
 YqrVgvSKsigx35sGP2i77ZXdKdpyJMh4j7RVqTQvdHjJCjy8oo9z82HxELLmS+PT
X-Gm-Gg: Acq92OEOfAELzLkaOpcv49/a9W5YasH+y7Y3X1paAu02MZsR3w/QEF7etj0TM8unEB3
 DqPDbUZ6K63ovkTkpdWMyoc5EDbSMgC4nbbDhHWc4JWxCzhqW4QFfJWPczNJ4oKXw+Lw9dKEN2j
 QAjGAunJXRuWivX2XFLZczUC6U1dVzJmHWM/xjLCCzplR/UqtdcF98H8fwUC6gpY8ce6sDuCn6j
 HxnF4nI/AV5t9E0EDVE52wwcwPvEXuKtJ5bcsNYzuCJaXQ/W127D2auyfM/s6dtb+sLqTPPi2PD
 7Gd0cq17y+RqX2FqeYkDTBiWizgrA2hQRG+WitYaZq5VzRkBIIjbv6mp8I+NFO8RnDcQrKdIqEd
 Q0N2rcZWqqetcrULMleNycO0fuQwkiH0H36l07SmvRWlIBUpF9lsabiPSQg4ZwXbHtnAbsV1rn5
 wOeyH5KZVUkNaOZjfsCgj/0TUQ5L8y0Js2IuN7pItyyjXzX8T0xmlE8XRetVsFRSwVAHDdv2gcI
 YQeLO4wTZQr/lux/iQ+0XuQg8PAOHSmgaHX8eXIMYUpM9XBvB5vz2gKRgSdUFk0VMMeA4mAfK52
 FjoKiWJ0jx9k6/k=
X-Received: by 2002:a05:6808:1912:b0:486:89d8:6d4d with SMTP id
 5614622812f47-48942a1d86emr3710444b6e.43.1781718137852; 
 Wed, 17 Jun 2026 10:42:17 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-16-141.hlrn.qwest.net.
 [174.29.16.141]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e79f5bb5fcsm10323561a34.9.2026.06.17.10.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 10:42:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 17 Jun 2026 11:42:06 -0600
Message-ID: <20260617174208.3968183-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781718138; x=1782322938; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pS4t9JSeHEuhAYbCb5uk0tbGAsvg5TVeaXoDRLSkNOo=;
 b=qnEEj8vMRUArG92xejaZ/ZJHaeRsKr60JW43zRY3FksFN8J1my7z7VHKPTedfA05gk
 Vmooqic8M4J870VC8p2rckkrbNpZenX85RJPEUD145AVrFK/T5gwofRDoRJaIftsmohq
 GXB01+SWnxodtZSju0K8kJM4U8AKVgdVdY2bS+hbgf2oQmF3QlDUZcZtI8HI49x7/vih
 aY8vc/zHOy/L7px1eh90tG9ytc8y5ckl5aPafMDhPDpZrd6T+HOa1VV1V/VWcY09al5D
 0WjZhEFoLx4/JQM3/PDmr2VjNVbrpjPCRyK8j+NG0Bl+sxH6KRKvkoGCjzyIL2H2f8fI
 dfLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=qnEEj8vM
Subject: [Buildroot] [PATCH v2 1/3] support/download: add blake2b-256 hash
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
