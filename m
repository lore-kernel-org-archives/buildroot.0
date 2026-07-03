Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E84C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 08:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB73740FFF;
	Fri,  3 Jul 2026 08:32:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YcPaUXJGok9E; Fri,  3 Jul 2026 08:32:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD8CF4107D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783067520;
	bh=Pfm50mz8UreE3dH7D1BIAiO4xZe0h+4YAQlXcRxxsRg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=k0fXgH3NgSKg2/9TnkvkP90YB+lBEOzguczqNyW1ZDMMclbNzn1mgIL3xSonSC6DA
	 ZbvScJh+eTUhAJJw6enDM4RksZ21ZA7fpxFSZibJWWpHQNDQdRPKADrNQhoubljyMP
	 CKBvpNx2yhLbv//vx4GL1Y0Xqa3y+DJmBx4+ucnZ5m1AXEJ6D9XbHAdT3RIUw6gW5H
	 BjzAOB+5B+Kjp1t4PacbDovEhLtk5X1lSCJXLa+q4zzoUIe8Pbu6OIugvaKeKtCLaW
	 qMVKA/Cxm2MDD7FfmikINRpIJJqUvTG8TMCdjmW6NhxbE92RIAfQFc7xXkqekUWZeB
	 1NIps4cJmRHfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD8CF4107D;
	Fri,  3 Jul 2026 08:32:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5116447E
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 08:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37A8540330
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 08:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r13sOXhbtUMO for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 08:31:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 19765401C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19765401C2
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19765401C2
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 08:31:56 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-493c2c0b9a8so2273115e9.1
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 01:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783067514; x=1783672314;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=z2ktUVt0kZQqSsxvIwATrjTh+6yUqz6+LjKoXGQElUU=;
 b=jE15wSrd4K+iSFHSZx1qxjLa6yg6yP5e6nmFuG+zRlEKitVlv740M1NKJZ7x5rKAMm
 H078/mZzbVHsom9QeOhfbeyQltMee3uFoCrye0vLJwcOcM/fyV7bYHx+p79n+KxiLUXn
 4pmFMzPaklF7I7Jg4bNPr6lzVQTpua/4pCx/nVUsCBwprkKJr4PWGFFIQtvT3mTgeBna
 rmVdy0Arg7C/gw5+YbRmgL59yca9VOn7vGBNoL+hMWYo0/dK/NvVIE70MJZCEwz9Dhk7
 ranRX0wOMPexrQVnwz8M9Hy1ubQp5wY56ebkyrT0p76E8gHTuu1LQkX94tt4JeRRIOZL
 EU+Q==
X-Gm-Message-State: AOJu0YxIgm7xPgyoX6y0gaLka6FlEG0HNlNOPjoemwWFRnr1iXnS8O7t
 /74zuGbVmLA+BS1l3GhduVTHKjELIfU937vQ7QM+iUyc9EyNkFpT9C3+yCVeIQMlFRzB8BcFgkB
 +vSJD
X-Gm-Gg: AfdE7cnnO1fX6+eaRqKAR2PAsuQNFHt/mwAJWSh62i9jOBjUsmgmCXtu8ZE63qZrHQV
 wF6RTr/D/RO4gv1WBxA9+clWm0nagxgZX8+CL2Af7qSigTbbiFZuJX5DzDtmkD1gcOc0kFbGyoF
 gleOOIeqAgwKU2DEZyhx1/6mGPFKay7enhOgNPACWkIr2c/RJXKedTQUjYQ01/ouneq3zrC4All
 3IpE8bUqS4RXT/bcoHsOaEZuIEyYbsWtfApxBkijclRX29zP5qt9OlYfaOOx5iiAM9aMuUCGwYs
 IZtvcIy/x5RW9HBrYqLQtqoNsC8Ehfkv6e6T0LmM84iaVxjVLpKfnA3CnSaRP8bMoo7n4gwrV7s
 iJAKlDzVYBQXtT2gXZdT6qmPdy5qHz6EqVkY0McMLcj9oMcZbRifh6RQwFq/88ci/E/RHDIriEs
 tv7GaBOqI/82CwG7hAFbupG80yRQ==
X-Received: by 2002:a05:600c:e494:20b0:493:9661:f55d with SMTP id
 5b1f17b1804b1-493c3cfd391mr101895375e9.30.1783067513983; 
 Fri, 03 Jul 2026 01:31:53 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c63172fesm197106005e9.0.2026.07.03.01.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 01:31:53 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Chris Packham <judge.packham@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin@orange.com>, thomas.perale@mind.be
Date: Fri,  3 Jul 2026 10:31:36 +0200
Message-ID: <20260703083137.155274-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783067514; x=1783672314; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=z2ktUVt0kZQqSsxvIwATrjTh+6yUqz6+LjKoXGQElUU=;
 b=fjC6jw3/A3Pe61SQgOeD7kVGP7fvK9DLbth1X2QrAf4oAoGT3ldD9J9nSR29f2do3A
 NAhKbJyQnLL9IijrYgf/K+KtamIOkfBLbzM9Tgjejqs5ZZJhSxya6oAlerrSm7w8+LM6
 YxyykHAhHo8IsGenBqnIax1sSuLur7IJbFIN4sifyb/XGIs9tYDPmfti5gIqvI6Oec9Y
 aCSRosT2TZglM7fRcGHUrYZfJVBO03EyxeG2AY1jwv5cWzvubMCGGHUmTTunmEiFoex6
 One/Js9ukTeJLRMDhq7RZdMTphvUGFakeq7Ed2fVd22+w5zvD/dc/zulxFMrdMKUdyKT
 xnGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fjC6jw3/
Subject: [Buildroot] [PATCH v2 1/2] utils/checkpackagelib: add new check
 MissingCVEPatch
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To indicate that a patch fixes a vulnerability in Buildroot, the convention is:
1. In the patch file, add a tag 'CVE: <cve id>'
2. In <pkg>.mk, and an entry to <PKG>_IGNORE_CVES, and add a comment above
   that new entry to reference the patch file(s)

However, as packages get bumped and their patches are added, removed or
rebased; it happens that IGNORE_CVES get outdated. One important issue is
marking a CVE as ignored, while the corresponding patch is not in Buildroot.

To detect such cases, add a new checker to checkpackagelib that finds
occurences of:

    # 000x-some-patch.patch
    PKG_IGNORE_CVES += CVE-XXXX-YYYY

For each one of them, ensure that the mentioned patch files actually exist
and contain the `CVE: ...` tag.

Assisted-by: Claude:claude-opus-4.8
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
Changes v1->v2:
- Support multiple patch files for a single <PKG>_IGNORE_CVES line
- Add check for `CVE:` tag present in patch file
---
 utils/checkpackagelib/lib_mk.py      | 42 ++++++++++++++++++++
 utils/checkpackagelib/test_lib_mk.py | 57 ++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 5d48e8929c..eb5fbf474c 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -6,6 +6,7 @@
 
 import os
 import re
+from pathlib import Path
 
 from checkpackagelib.base import _CheckFunction
 from checkpackagelib.lib import ConsecutiveEmptyLines  # noqa: F401
@@ -117,6 +118,47 @@ class Indent(_CheckFunction):
                         text]
 
 
+class MissingCVEPatch(_CheckFunction):
+    PATCH_COMMENT = re.compile(r"^#\s*(\S+\.patch)\s*$")
+    IGNORE_CVES = re.compile(r"^[A-Z0-9_]+_IGNORE_CVES\s*\+?=")
+    CVE_TAG_IN_PATCH = re.compile(r"^CVE: *CVE-\d+-\d+$")
+
+    def before(self):
+        self.pending_patches = []
+        self.package_dir = Path(self.filename).parent
+
+    def check_patch_files(self):
+        for patch_lineno, patch_name, patch_text in self.pending_patches:
+            patch_file = self.package_dir / patch_name
+            self.pending_patch = None
+
+            if not patch_file.is_file():
+                return ["{}:{}: patch file '{}' mentioned for ignored CVEs is missing"
+                        .format(self.filename, patch_lineno, patch_name),
+                        patch_text]
+
+            if not any(map(self.CVE_TAG_IN_PATCH.match, patch_file.open())):
+                return ["{}: patch file '{}' is missing 'CVE:' tag"
+                        .format(self.filename, patch_name),
+                        patch_text]
+
+    def check_line(self, lineno, text):
+        m = self.PATCH_COMMENT.match(text.rstrip())
+        if m:
+            self.pending_patches.append((lineno, m.group(1), text))
+            return
+
+        # other comments do not break the association between the patch
+        # comment and the following _IGNORE_CVES assignment
+        if text.lstrip().startswith("#"):
+            return
+
+        if self.IGNORE_CVES.search(text):
+            return self.check_patch_files()
+
+        self.pending_patches = []
+
+
 class OverriddenVariable(_CheckFunction):
     CONCATENATING = re.compile(r"^([A-Z0-9_]+)\s*(\+|:|)=\s*\$\(\1\)")
     END_CONDITIONAL = re.compile(r"^\s*({})".format("|".join(end_conditional)))
diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
index 3f97c25b2d..21effa9489 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -197,6 +197,63 @@ def test_Indent(testname, filename, string, expected):
     assert warnings == expected
 
 
+MissingCVEPatch = [
+    ('patches present',
+     {'0001-some-fix.patch': 'CVE: CVE-2000-1234', '0002-other-fix.patch': 'CVE: CVE-2000-1234'},
+     '# 0001-some-fix.patch\n'
+     '# 0002-other-fix.patch\n'
+     'FOO_IGNORE_CVES += CVE-2000-1234\n',
+     []),
+    ('patch missing',
+     {'0002-other-fix.patch': 'CVE: CVE-2000-1234'},
+     '# 0001-some-fix.patch\n'
+     '# 0002-other-fix.patch\n'
+     'FOO_IGNORE_CVES += CVE-2000-1234\n',
+     [['{}:1: patch file \'0001-some-fix.patch\' mentioned for ignored CVEs is missing',
+       '# 0001-some-fix.patch\n']]),
+    ('CVE tag missing',
+     {'0001-some-fix.patch': ''},
+     '# 0001-some-fix.patch\n'
+     'FOO_IGNORE_CVES += CVE-2000-1234\n',
+     [['{}: patch file \'0001-some-fix.patch\' is missing \'CVE:\' tag',
+       '# 0001-some-fix.patch\n']]),
+    ('patch in version subdir',
+     {'1.0/0001-some-fix.patch': 'CVE: CVE-2000-1234'},
+     '# 1.0/0001-some-fix.patch\n'
+     'FOO_IGNORE_CVES += CVE-2000-1234\n',
+     []),
+    ('comments between patch and ignore',
+     {},
+     '# 0001-some-fix.patch\n'
+     '# this entry is not stale\n'
+     'FOO_IGNORE_CVES += CVE-2000-1234\n',
+     [['{}:1: patch file \'0001-some-fix.patch\' mentioned for ignored CVEs is missing',
+       '# 0001-some-fix.patch\n']]),
+    ('comment not followed by ignore',
+     {},
+     '# 0001-some-fix.patch\n'
+     'FOO_DEPENDENCIES = host-foo\n'
+     'FOO_IGNORE_CVES += CVE-2000-1234\n',
+     []),
+    ('ignore without patch comment',
+     {},
+     'FOO_IGNORE_CVES += CVE-2000-1234\n',
+     []),
+    ]
+
+
+@pytest.mark.parametrize('testname,patches,string,expected', MissingCVEPatch)
+def test_MissingCVEPatch(testname, patches, string, expected, tmp_path):
+    filename = str(tmp_path / 'foo.mk')
+    for patch_name, content in patches.items():
+        patch_path = tmp_path / patch_name
+        patch_path.parent.mkdir(parents=True, exist_ok=True)
+        patch_path.write_text(content)
+    warnings = util.check_file(m.MissingCVEPatch, filename, string)
+    expected = [[w[0].format(filename)] + w[1:] for w in expected]
+    assert warnings == expected
+
+
 OverriddenVariable = [
     ('simple assignment',
      'any.mk',
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
