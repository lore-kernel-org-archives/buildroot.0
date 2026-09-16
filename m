Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5DDC982DF
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BFB560D84;
	Fri, 18 Sep 2026 13:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rqyBcuY0Bnyc; Fri, 18 Sep 2026 13:06:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9145E60D8A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736774;
	b=bKJ9SCuaqJA29Lqm1jpP/lFIXpfTNCxU2GVcZk+RYAkG4KdDtncA5hhNF31gBC6WFXdc
	 7aLB/raBZTZjUbOfQBV+s5SZHEWvCUWUWdOexdHlA4iSJ01qWqhbKeH4hFsd36h5jfL0O
	 NDW/zwYPoxHk2NJVXjliSX9wz1U2x4i5SERHGHSPUkitd92+lnp5iQXGyMMWg5L41tIPg
	 08vbosN7auoKEROVt1SeiFIjABiHk8VBRzNyhAvdITWiTVW+UV3zmZNHky1pdZ8PUx2Ie
	 aD611kBbkotzCUSTT+bzhQ2j3uPJuZWrjyb75N/YTjtm9nuMsK7CpAqFGyLSnYSkIwg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736774;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3lsJpa+kYIKN34l/MKoRKuLa2bYYeY6ggjg7XGt79Xc=;
	b=DUYEnCVeJqVrgP8YYNwXS27tQJnTuqMA21esIAyjKikFVjg04rPZ8vb9XwuKmxs0CjzK
	 /NFeAfRvCZ6OyCRRtmlwIPfLwY+OIrC2Rqhppyvai0NJ0zgm2LsG4cwvWjNTsr9l6AlVK
	 qMGQ0Q8vA1J1Q9Rzml4Qpnw04AEGm8UVbP0QWmpzsHhHnD3U7kJOSHSTTE/7TIsmKR3mt
	 DzMiz/5p51qQfkgW6+BYMXgiDlcGi0DCh13L/5ea10VMv2EjRZrT2BCk/J+xObpexELVh
	 Td3+pI4WBqYs+fB93tJkXYKDJ328ZsPqjT0CNdMUqT96mbzHUhf/OTS1Pa1UtGDaWIA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736774;
	bh=3lsJpa+kYIKN34l/MKoRKuLa2bYYeY6ggjg7XGt79Xc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HXaa03DPZO+++3Y2cmvQR0Hko3mOR845HGzoJDCaLxjCLjtp+hvW1Ky5V+WO9rIZW
	 YDhLt11XuGddxUlaD7sVdS6Qe0nhqMl0PsREMGoaBxlCenp5R5utGxZAsJ6JQlvAAa
	 rurI3dZ2jn5R7yTVXYJ8Qiy7JdzeGpPMuZIf62mM72fD5fN5R4AdZWtSZO6Gh3PqjB
	 s2EbnWbbW7d7VAsJhWvEbnNSJazd56RtFwQ+yq5Gh6sGHHzROq0b2Y8O0Z2sYpQUa5
	 RA7v/XhPkj+UySt3FydtOnUpA9xi92WlzKCbH6qLGG7bWAobKYyzZWlECwt/WwPjH1
	 bYOTe1qRxkNzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9145E60D8A;
	Fri, 18 Sep 2026 13:06:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B6D59DC9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CE9740B70
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T3uG6GBhJwti for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5FA4F40B79
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736747;
 b=RnT5wrGXQaZ6Wa3qVGyxkCOZUD1j9ejjqGmk7IUf6eKaq7vvGWu/joMrFwbok0Ok5Nyi
 M/lGwm0a+iCw0ULmSQt5b9P8/V/kxumk3lF2vTDWSuhLW8AsrpKXaPn43H6GrIhOlwmgf
 C4STRCIeR7dmvAILiZ7YQYOrutA4y14+yU/ocrd/KE+MlfdkZ5Lh2U56uLUzoTVBotD14
 eycDrPOQaKhOlXvadhu8DgXcs4vazyFGQ7zzoNJ0XawQ1TZZBL/t2gxBkyR/y+uLpNxjf
 XgahhxtLHiqwVt5mH11ABeDPjuk5JtAHNKtLM7CE83HJMydeSKIR5fCH+CuDIbwzCKw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736747;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=uzAb+Byw60dGQCO4uw0aDkTQ7AJDZXuBdwkQ5LY8Vu0=;
 b=QxnRguog5ro1xrLh86EB9g/PrB3ID4mm1C55+3TS6Ez1JprJskrG0fw/thofbNn5xtTC
 6v5Vr5iqVSTQmBec9WqskXTxWA6plpd8j7eVmhGpXMd6jz/fbl0CkkB949JFXjZBpwhRT
 d8qpaMU1TXPol71E9sG/CIVKjAqIYUI4GAbsz4LinHkgucEAYxYc5PtisS8GtSU5XGGEd
 GbJq5D0CEo2NiJrgXAMN0xNHKPzViq+ED0/OGZ1XDkgN3xU1gdfqi9C2CthKc6EMvhrDv
 qTtk3FZ+wG+HX+6hXiGsoVA+wfLVXcwwEKarBRm0bzW/sXytfCwinuQBXukEDwwYhYA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FA4F40B79
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C16097698; Fri, 18 Sep 2026 13:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 11:43:59 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 81d6597a2c3935151d6a49942dc36ea80cde59c4
X-Git-Newrev: c4c66023437c090938af34598e582d2545b9ecd2
X-Patchwork-Hint: ignore
Message-Id: <20260918130440.0C16097698@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/checkpackagelib:
 add new check MissingCVEPatch
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c4c66023437c090938af34598e582d2545b9ecd2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b00ac4e34626eec9af5cf8f4f0a034103628d9bd)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/checkpackagelib/lib_mk.py      | 42 ++++++++++++++++++++++++++
 utils/checkpackagelib/test_lib_mk.py | 57 ++++++++++++++++++++++++++++++++++++
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
index c86c55b9cb..81c3129b2f 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -200,6 +200,63 @@ def test_Indent(testname, filename, string, expected):
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
