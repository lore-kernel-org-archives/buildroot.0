Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FEFCCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 451F261040;
	Fri, 16 Oct 2026 13:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jGMkmpXALsdz; Fri, 16 Oct 2026 13:10:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 083216104C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156258;
	b=isI5o+12DFQaqEBMMt5tYVXBEgPq8fq43yLY5aL2NzMV7HPZJvkV6CWWsyY1yzeJ/+av
	 WOgJ0xSWO6muI/WuiDdc+PqUfyRFTK1XQgAB4hQ3nqNAuBtDbDD4B9xaxWYFYOwC9kf8U
	 HdUmPIXyomnW35ZMm7gtYfP6lYiK9QGT6puMby/bVfejSGE4bG5qCiG12O9BhXxgdn6xC
	 2ewHnu1Xkt+hJ/WFNsBuvQzbffJiLkJtFkoHyymYaeEy9ozgyfROrWmAaFMbZvalgQSqF
	 lrolsB5A3v3L/wWHs1ZYWf9idgF5I7rBuGoOGS0dUafPXqSZlUdhWTz/ouL3tfiTyMw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156258;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=1DwvO1z9wheQZkEnqnLsx4VDESFMsv3ZdMmqBVMaEmY=;
	b=XsxkvyiPzKUW0rLfDllRTBHOXEGrNh/wV5kZ2uXo25lmVXtJ+romLWPpF12IMHbdc6vt
	 Wv2ZjzxkwRSH5HBjR5exNFJaG9GzJHYkOWzI98d/La1DKev+dBFcOYZ8y1+9vCVjr1a3w
	 zgo6zcoNmEBkGdPnxsMAOdaMMz/tp+x/lt8UaTYk4ArpyUXYAZguO+vclU8MdalrxWr64
	 O7YEN1iYHGcE47JzRBQ/OjhKMLqPja+w6b6TBaG+Dvzfwvm36nTrXj73Xk/Fz3Dtl24Hl
	 Z7o08g8bvlQZsZKL8+hhjPhc5oc0lJznpOpN7cf8W0Zs59EkKh2trXePy1SVsAzrj4A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156258;
	bh=1DwvO1z9wheQZkEnqnLsx4VDESFMsv3ZdMmqBVMaEmY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oWXMVZlhD2rJPBQoruHPBDvt5ZsFkQMXvuuNzSK9DCUQbU0AMF+T4rcCBaEqXZ6+G
	 hZ+gypuh7NNHslv/6onhTde6lwEmlbBbii0O/9IPm4D0d7+8CdT/MzgMxWaQmJMkkp
	 KNB3aEFC2g90vpD1roQNl/+vfQ/2PkR7HwiaYPNpwEWLk81aAP1rXsPhnspPy7QIBq
	 J1g3uJIYu9voU+Ao1cIMeP4zQLjifK56DLiGX/o/tIdpRUpvvUNHQhrc7mJYpuxIXi
	 DxXmrPTiDOhrur+sIjRDjuAJwNmbgmRV4TXD+p7ur3yCKkzZj4SDSoBbWHYhwBr6Dy
	 H/zUZVTXY6AYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 083216104C;
	Fri, 16 Oct 2026 13:10:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BBB0255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BA7B814A0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zhPxh0ceZ0r8 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E6592814C9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156109;
 b=TwRivnVTGjwPEvPaFUF01A6kpo7jjVoS4WoZf7xI64bnqw4gRPjF/NJThV6eC2Z/5/Ay
 QLbrIdHPy1hZmh43a+bJ0Q4RhjjFJOvu0407+YfVFS8B7vWCKN/KC0p7tiG8hTIGd9cz+
 VetTHHMOAqPMbxziqIad+7HRGDjlsefva4Iy84GqzFMSckRORvvD/BAHgkTNEKnIyaJwO
 niu4NJKfJy5p1VnNcI9p+HYo43MqwStU32aa8cLzt+527Dt24aZHL7CfyxK+GDNK4zPd7
 KtnEYG459A8iTj/iFYr0/YFNwXASUXsAzJ/EAP1mpjmMWM9FJunGYhtQpCxuJewW14w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156109;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=PQPcn7zREQ4e7P9NF2qzjnGw+A7lyTPmfOx5jg9FBPM=;
 b=Jimx8Ych+eg8O+13XTdgfxAAFOwC9SuGxaoCV/d3Mx6m146v5nXGRiyicWLNVw7Upf5X
 StEHQxJ6XfSBKubSoHHp+KCUtAf4nXzD+RWJyENhzmm+3DMmmXZkvkw+884wB7iNyujrA
 M3NaZjFFsgaN174bUK+KDJZhMYv/5Q5/sOPmmWQixO0m7i3MPdYrKLG8f9q6qd9VfkLwd
 5X6gzlLyC9fZGlDnIT6eFycGLGmhGJd4YNcnimHx6nQHfw0qOez/sNsuQkcinjPOu9aBY
 BAK9zs3CXKvabHiLYNiRt56j60b6Y1UIRDlUl6Ysp4qMV7rAsPnd6Xshwho2KrjwqxA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6592814C9
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D714B960D7; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1dab7644a0febbc833f76ea3a3122a8838b5fbb4
X-Git-Newrev: f6acb76a5e45b16548474a91497f5edd560e7f34
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.D714B960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/checkpackagelib:
 check IGNORE_CVES identifiers match patch trailers
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
Content-Type: multipart/mixed; boundary="===============0468361144927110803=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0468361144927110803==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f6acb76a5e45b16548474a91497f5edd560e7f34
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit 40abc660d497901f75a7ad4a901b93e8dad0eeef)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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
index 31696a7e76..ba22ea6a5f 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -253,6 +253,38 @@ MissingCVEPatch = [
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
 
 

--===============0468361144927110803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0468361144927110803==--
