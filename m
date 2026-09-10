Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C97C79FBB
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 19:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 286DD40B9C;
	Thu, 10 Sep 2026 19:39:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WrT8TM7H5KOU; Thu, 10 Sep 2026 19:39:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2B16E40AB9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789069144;
	b=RFGQds5NmGxr3fA2qgnLFyqVp+nf6g/oFOQ4RSoBKw0EY7YWbTnQ0yBTFY1sD94FwRDn
	 JqiScq5mpX1HltFeeqSYqYUVEuXLDEu9g9vFKZ5mdBhpBoBICmW7UHzo15CBayrXhTteT
	 j4ayq/sm+rsLueZmB+V1dHokaMkvvNoCn23m/2MMILzndxprPGEb2p17GXDv5H9+5kxVU
	 X4HvNaC6PoCoNQXKeY+m7ToEwK8rKMubnAavH6MYEhJgD7Yml2befk7T+BKj2AuDbBySs
	 vDa+U6SDLQZzKRP6YVnaRDmls/akFwhdF84hgWKKX49N4TPLRYXXA94pb1TGz+FrpLA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789069144;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=c3yDxH2saYmsD317vogWqzHgk/ilniMcfrKQt0CAPtI=;
	b=WC4y/JEVXhBLIFaC+b1ENjuJbnzKZsNHVa1oFR8HoECvjiPxins7fJu/4loCdBB+26sF
	 Vfxw1P7L8wRl9tC88fFF4LYHXrQTuBvFD/whIHoNguLadXvzhclVmzPL3fGTBTlntfmJ3
	 HHhP8e0vM+QCdmJJ9cfpb87MApL/mL4kFmmH3OUQ8yIYxlMQB1zx/cNVW0EvEU1QVBoMs
	 aUvM2jy+4RPojsBOhv57qq25+Whj5gXheImabnbKyUSyBv2PLeUuilrECeqTOl0fyTtsu
	 diunFh/Kgv6Eb7hkm9tPpJLwhKUrfrQMUmMe2y9WphI5u3IEeMj9hJlv1jWn7HTe5hw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789069144;
	bh=c3yDxH2saYmsD317vogWqzHgk/ilniMcfrKQt0CAPtI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K+OOh2Y+GqYJ0AAP8m+bGBMQJ3AZIh50d4u5tELdzQAF0Em8CwkId8kiiqcCCVvt4
	 7UB7HCmsev1YtVy60arYvr6IUBwi72Zjq5XAuQtVSdbaH0U0896chtty8kiKU7JfBS
	 w+zIXKReEJ54u5qlXIHW95aHYGCQstN9vqPFtcawGff5O9BRrVex2s6NY7vWpisxi5
	 hfksLmvpaLPG80QgRxHy03g+u+ZBZ5SNJVtfSbjChiSZage+P6QgyfuZpnrvI5QVV1
	 YRqYBWjgSWW3VOEd3/QmG7SmB+zDgMw0lnPnXDPIXZS2CB6sPJkszm/QElfL8fu8T8
	 icM1+ppkzUfRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B16E40AB9;
	Thu, 10 Sep 2026 19:39:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 54F5F769
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3ADF440AB9
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 628xi9CMm5mx for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 19:39:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 61D5240AB6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789069140;
 b=TB7FLNMNT8aeHNUNyUhUl/KOK0EyMq9CEQkw17NvYoSo0/xbKotXT0luDbkKeOmj8V98
 lJVowmP9hpV3X2y11gFDtbNVjwO3yEWfGAlWVw1f4CllXVZZjspcw/hOFmnnZ57u211vH
 4R1Uy5CpX2yGlOIpuUDd1PRk/ts4brWvE4fNAS6mnwcJ1BqlqQPNGQhPPPfFh7az8qTdc
 YuUZ/Ytvh31xiJCOdMipL35WErgRi7J4JVr2ZhqOdTycYz5RYm3Q2g6O75PB89dgQQF1q
 LZC5aU1Od+BqEPAcDbWFc3w0GyU3woNAfvMw3zod6YB4o52GPZIHhYydOAwxpoL/+jA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789069140;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=p+jBF/liTc7LGHT9bTet2VTezYPDugqwdwY6zLJtfpA=;
 b=QqadDWS8/F6fy2jVY/spbeHA3ZYDsphIDl5lDnRaqwjF6000f1de889hMhq+hlcpAp0d
 PCkMlJreWRCBdzz3ly83aoZWB0E3cCjwO6loNUF26S3AuiIfVpME4vkihGdpw7RExPlCP
 veR9Qn7jL1xstcJhc72tLFz/bspJlK/ST/lovwwXAITbHlpmjPtznIDzmkb4JYgUvbLMB
 c0KVPTH1t5m0Gh59LtqvVG8KfzKz6yZJOJYo2PEKaU0H/oMSRlCKGjUb25jCQB1APo2Y4
 72H0lEHA8hG7evZhhwsSJd0h5oUYHJBMEaYbjqo7Yvqay7oc0HaEvq6p1+Xq42ITzHg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61D5240AB6
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:39:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CEE7795447; Thu, 10 Sep 2026 19:37:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Sep 2026 21:38:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 636f69ab450e9d1bf48eda22b507a68272c5c9d5
X-Git-Newrev: b00ac4e34626eec9af5cf8f4f0a034103628d9bd
X-Patchwork-Hint: ignore
Message-Id: <20260910193756.CEE7795447@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/checkpackagelib: add new check
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b00ac4e34626eec9af5cf8f4f0a034103628d9bd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
