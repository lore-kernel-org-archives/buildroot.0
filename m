Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F86CA9EC9
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 08:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B653E80E9C;
	Sun, 11 Oct 2026 08:26:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVmBc9efYTib; Sun, 11 Oct 2026 08:26:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 107E180E83
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791707167;
	b=jAtinB0/L1nKaRvJgwrfI1Z01DCnAz6O4yo0Pl39ZiRLf6eGpoJycSQCg1YqbTLIkawz
	 bjUdB5xW5IsV0DvVFwDlvGay8HsK3G0hiFR1kbfQ6wPLcuPNttBznyPcRu8VVCdGLDqc5
	 ZD6A6/UVC03GQADIps+hw5P54OyhZWGfkRck0jU27r1AQQgZk25KD8wbFI2iiJ4bQtObE
	 VLwcPfuLNGgeKuqRsZMeh4qBm6/dD7lbTloiPpimHNvsg3j+qP3J/KNngUlUW7Uw06vlt
	 Qvx4Y/8ahV8bkTKnHuP9xAvZsbe09TeGbOW/Xtafyeixih6IboH9LmXcJaE0YrHvCAA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791707167;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5moKVDC4KZxKgt3V8wo56KYV1zbAvn0ibFpupVvYaA8=;
	b=WBTvaGnKwf573anWQOh1YShM7x8ddhexkk0/x2A5OudJ+M8gZ9ZrLK12FUt54UIT7UTh
	 4Z0+7N5UBJElPaXRXvsKayyc39RdU9gM4RM0bDDjliJmmHvE48ZF3w+k+Q9BcUZUVppLF
	 d9bx48bbJ/GZgpN0x+N1soOln6tG2QKBo9fFiomtBb30Bdv1PPS1zGzPWeJbKOgm3LiAG
	 3lThNQxHoSCVFzGZT4qOhebykaTjU5UwAU5SkMeyRvBWbiwzF+15MKX63Nn9sTYSnSx12
	 QHPGj7J0cK4vZmKTYVK4Ym+a52GXUDf4zp7x1+/z6MBByIa4FGFQHQpirvRbIGnP+BA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791707167;
	bh=5moKVDC4KZxKgt3V8wo56KYV1zbAvn0ibFpupVvYaA8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hugGRBX/axpJYvLhjAbSxHIUiFRo6uKfZqA8LZ3y9ByIRe1C1I+iU4XztyqfCa5+n
	 N1LtK97XJae3qJu1gO2PBap6oIOIJW7/J3AkMRiJSis8ke1rZjfFyHO9lsGoObH+rF
	 dwB+4HUNWFCyH8El2aFC2S0PXwd9wfqHda62wC8ZGHcTgMjvMVZJ/vxK/c3BIEAmmY
	 pHu7VGfGaBLakkQ63zNBejsxR4j2fZpKzRK+Wp22uglTq63Q96AT+9DP8s9CYE2RMZ
	 M8qZ4cNnWMevVCn1D/qAxxutpPJtYBBoLlDVStGr/Od1JhT2fN/r8UbjjS9zl1+EB3
	 EbqHbHt5qG8LQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 107E180E83;
	Sun, 11 Oct 2026 08:26:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E4AEE235
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D619560638
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VCx1dB5QrRyd for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 08:26:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1D7896061D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791707165;
 b=RDN4Vk1cbkbVhXtVPHWlZx+lCEAyrX6WLllWEyJFhmH8mDNC1JVuV61fH7R6IEYJBC1b
 qZ3Nng4Cfm2lpM/Y18nt0UsvetsG7PBnkq2oRpX2BRDLUsfcoSeHR7nBT3/X+JjqWPy1+
 xPMv3Rqq8HU/8LUl5SajnQ1sVIoYP7DoeeZ41v8glSxne4Th7LVKFrsyczQlvX7VPKDpB
 kU5ufE0G/HS3GqK5uhN1qpn2ZmeWpUbd359H+goqJhTDrb5aMeLuezi5hM8AHi81QdM07
 To3VYA5UUjTKKCjLfcEx5SCtTbJ6t8L+AGL7D3fPuT+oWXswtZi/AXdE99xUyZqubyA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791707165;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=qDwX98z/uwtqF7lF6fboa8+pvAZGhC/OoeQAynRsOko=;
 b=PLNLJbmFLMTZ48/Fj6qd/QAdZm0jhyEGwYq4/yR3mx4tCwsFWIDzOxLfGPEUCcpRo/fg
 14DjlW6GvFsLDpBlKktFk/Mb8Amo1JULkW8i6mhpqNn3tS/agdrQcThagPYfJtJ2ub2y9
 VckRt3TRfA2UDTFepxk8xSO8z1I+21zm3r/Z1/fyrlhCDNAy0lg6kol/sqySiQvQSbwwu
 YrfmRNr4jfxj9OuliDmu4hx+Yz4nsmKAKFVkYvB/mhLhkmSNl5qndlNuXMsG5Mt0Jn64y
 MA+Azd4MPabfrhqXrF5k12YXo+OPgi4e1BbQF9En1jSBexzRoi+ZZUQoWUKIIcxaHXg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D7896061D
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:26:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C00C935C7; Sun, 11 Oct 2026 08:24:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 10:23:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 552bf40db16505e1549f149b095d47e98da29594
X-Git-Newrev: 40abc660d497901f75a7ad4a901b93e8dad0eeef
X-Patchwork-Hint: ignore
Message-Id: <20261011082446.7C00C935C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/checkpackagelib: check IGNORE_CVES
 identifiers match patch trailers
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/40abc660d497901f75a7ad4a901b93e8dad0eeef
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The ability to check with `make check-package` the 'IGNORE_CVES'
variable content reference an existing patches was added in commit [1].

This commit extend it to actually check that the entries that are
referenced in the 'IGNORE_CVES' variable are matching the trailers in
the referenced patch.

With this change the following `foo.mk` content:

```
FOO_IGNORE_CVES += CVE-2000-1234
```

Running `make check-package` will output an error if the content of the
patch is the following:

```
CVE: CVE-2001-1234
```

[1] b00ac4e346 utils/checkpackagelib: add new check MissingCVEPatch

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Arnout: adapt to the trailers to using regex]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 utils/checkpackagelib/lib_mk.py      | 31 ++++++++++++++++++++++++++-----
 utils/checkpackagelib/test_lib_mk.py | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 1fa056cbf4..297cb14460 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -120,12 +120,14 @@ class Indent(_CheckFunction):
 
 class MissingCVEPatch(_CheckFunction):
     PATCH_COMMENT = re.compile(r"^#\s*(\S+\.patch)\s*$")
-    IGNORE_CVES = re.compile(r"^[A-Z0-9_]+_IGNORE_CVES\s*\+?=")
-    CVE_TAG_IN_PATCH = re.compile(r"^CVE: *([\w-]+)$")
+    IGNORE_CVES = re.compile(r"^[A-Z0-9_]+_IGNORE_CVES\s*\+?=\s*(.*)$")
+    CVE_TAG_IN_PATCH = re.compile(r"^CVE: *([\w-]+)$", re.M)
 
     def before(self):
         self.pending_patches = []
+        self.pending_cves = []
         self.package_dir = Path(self.filename).parent
+        self.line_continuation = False
 
     def check_patch_files(self):
         for patch_lineno, patch_name, patch_text in self.pending_patches:
@@ -136,11 +138,18 @@ class MissingCVEPatch(_CheckFunction):
                         .format(self.filename, patch_lineno, patch_name),
                         patch_text]
 
-            if not any(map(self.CVE_TAG_IN_PATCH.match, patch_file.open())):
+            matches = self.CVE_TAG_IN_PATCH.finditer(patch_file.read_text())
+            trailers = [match.group(1) for match in matches]
+            if not trailers:
                 return ["{}: patch file '{}' is missing 'CVE:' tag"
                         .format(self.filename, patch_name),
                         patch_text]
 
+            if set(self.pending_cves) != set(trailers):
+                return ["{}: patch file '{}' 'CVE:' tag(s) '{}' does not match the ignored identifier(s) '{}'"
+                        .format(self.filename, patch_name, ", ".join(trailers), ", ".join(self.pending_cves)),
+                        patch_text]
+
     def check_line(self, lineno, text):
         m = self.PATCH_COMMENT.match(text.rstrip())
         if m:
@@ -152,9 +161,21 @@ class MissingCVEPatch(_CheckFunction):
         if text.lstrip().startswith("#"):
             return
 
-        if self.IGNORE_CVES.search(text):
-            return self.check_patch_files()
+        m = self.IGNORE_CVES.search(text)
+        if m or self.line_continuation:
+            value = (m.group(1) if m else text).rstrip()
+            self.line_continuation = value.endswith("\\")
+            if self.line_continuation:
+                value = value[:-1]
+            self.pending_cves += value.split()
+            if self.line_continuation:
+                return
+            result = self.check_patch_files()
+            self.pending_cves = []
+            self.pending_patches = []
+            return result
 
+        self.pending_cves = []
         self.pending_patches = []
 
 
diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
index 9d2950ef79..1bbb0af20c 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -250,6 +250,38 @@ MissingCVEPatch = [
      '# 0001-some-fix.patch\n'
      'FOO_IGNORE_CVES += GHSA-abcd-1234-efgh\n',
      []),
+    ('CVE tag does not match ignored identifier',
+     {'0001-some-fix.patch': 'CVE: CVE-2000-1234'},
+     '# 0001-some-fix.patch\n'
+     'FOO_IGNORE_CVES += CVE-2001-1234\n',
+     [['{}: patch file \'0001-some-fix.patch\' \'CVE:\' tag(s) \'CVE-2000-1234\' '
+       'does not match the ignored identifier(s) \'CVE-2001-1234\'',
+       '# 0001-some-fix.patch\n']]),
+    ('multiple ignored identifiers, patch matches one',
+     {'0001-some-fix.patch': 'CVE: CVE-2000-1234'},
+     '# 0001-some-fix.patch\n'
+     'FOO_IGNORE_CVES += CVE-2000-1234 CVE-2001-1234\n',
+     [['{}: patch file \'0001-some-fix.patch\' \'CVE:\' tag(s) \'CVE-2000-1234\' '
+       'does not match the ignored identifier(s) \'CVE-2000-1234, CVE-2001-1234\'',
+       '# 0001-some-fix.patch\n']]),
+    ('multiple ignored identifiers, all referenced across patch',
+     {'0001-some-fix.patch': 'CVE: CVE-2000-1234\nCVE: CVE-2001-1234\n'},
+     '# 0001-some-fix.patch\n'
+     'FOO_IGNORE_CVES += CVE-2000-1234 CVE-2001-1234\n',
+     []),
+    ('multiple ignored identifiers, all referenced across multiple patches',
+     {'0001-some-fix.patch': 'CVE: CVE-2000-1234\nCVE: CVE-2001-1234',
+      '0002-other-fix.patch': 'CVE: CVE-2000-1234\nCVE: CVE-2001-1234'},
+     '# 0001-some-fix.patch\n'
+     '# 0002-other-fix.patch\n'
+     'FOO_IGNORE_CVES += CVE-2000-1234 CVE-2001-1234\n',
+     []),
+    ('ignored identifiers split across continuation lines',
+     {'0001-some-fix.patch': 'CVE: CVE-2000-1234\nCVE: CVE-2001-1234\n'},
+     '# 0001-some-fix.patch\n'
+     'FOO_IGNORE_CVES += CVE-2000-1234 \\\n'
+     '\tCVE-2001-1234\n',
+     []),
     ]
 
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
