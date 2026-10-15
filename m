Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CBCCC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95B0461484;
	Fri, 16 Oct 2026 13:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mkv0h_iFGXID; Fri, 16 Oct 2026 13:14:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8F17961492
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156463;
	b=ebNWexeNPYltj2DRT6vMUIDmFcwJ609cjLl8IDiBb6JBcLSR8Y5QnI5KYf+WbL1KFoe7
	 PnyP8/rBDbK1Srl/2qSH3/hAMM4+/XXfB4RIDBhJa4nDfkrgd3OeJyphm1lonrbXSW5UL
	 fb8RA5456dvQtL+PSMZb3IEku2eMTKbWkeDYbKxhbI7b4ZHjKBe/RilnyUCAEXFanJOHn
	 SofqY7yw+C/fysMNy1uMjg+lJ3ebw9jXOY1T2GII35gNhr3i1YBY0TsXbAK11/lvM5okt
	 v37YWcD4F5jIHyO6c8+0QzaW7P8u2cFLh4/YsIUbwfvj9t5LkqxMH0qdorgmd3saa8g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156463;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=vAG4ob9NH/17FKM5JmOi0HACiCxqM0FYYPsSPUZxlTw=;
	b=n+j92m72g0vnxqjX3MLPwMIuip3UZFb4m8/U/8gi60jljbfmlKY33P0F1r8GbHC/BjNN
	 eDFU7eIIKYuH8JNrqkuBKsG6yl+oE3Axk/+sHYDjoxEpBeXVbPswH6D9fkSCx2eILhWWZ
	 HD/i58G4r8LIb9rbztTnnHw8gpy5YW7MLQNAPoUhon/kp54+k/0h5svUxZ/kfpB/9SVZ2
	 twRluaSyq5eSKSrOS0Z/VGa+nWuk/g/RKruStP1YdsRIvKK/dg6u+sbRqsbC1CCCEM2+4
	 wUu3Q6wz+DoSdX6JU6gaHrwpPvb9YvF1roc8lXklrk9JKjCXF2yOK5c02Vcs3TL5NCA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156463;
	bh=vAG4ob9NH/17FKM5JmOi0HACiCxqM0FYYPsSPUZxlTw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UbvmHlRENNh3DibyXyxYMrAKK+p2+jpGJRwczjK8R9QyZg1zgMpNDrBEPbdpSJsOL
	 uSHiwYHnivGgkYDJPgx0/IRCR92w/U68XoNfBEseI627XanLa1KMcfvo5r3Wffagyp
	 NIH4LhYIRHrHC4DvxnMhLPCCKyPdRIRKdMVKJcVMP3EZ6FqWQSPGuLiWjMijniUpgK
	 C3Or7dv39VqHoCc9nFYIZRpY1lAuGsxhxeCJWg/XVff1n+v/JwMwRPAiP7zaNR71N+
	 5XuDgg1kL0alMr2FnmmZ6sBQ8eL5DM0Ze0Gm705dd3SGBd1oJtSAbspD70BzDUsbSU
	 JG+kcpokF3QWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F17961492;
	Fri, 16 Oct 2026 13:14:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 77284769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FC6360F39
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oQEotQCLqBhp for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 56FCD60F05
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156196;
 b=DmoqAIVEVnaCOTIbP+VCQv2YGCVrxaRLIQyCPyLrFK7MrY7CeD5/bcEnSjPWIDQcA0bE
 AW6s6ibpEbq79ddhc95VdMMUgv3owcKJnvlrhniSrfz4n4CD1wD4pIRWUDV44lHESjl+8
 7R8ULaeKn2KVlsx0nsoBzLNRCjuOvlsOG2oAP1Pf0/UJhbh4HtVauTEx0hSrNOpRaXNRu
 5zMFlHyIQZE2hBPwZIN3MDH3Xedt6UJwiFfAOY3DQMU7ID4UdziSof1TL0dZfmbKvvBp2
 1n3msohUCIDkdTTWJEPKiTTK4dk5kxqEc14ibZUF/ABccyFKeNxFtQrj43coyPqvesw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156196;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WcA+ZP/Bukw3g3oYua8tuH/BcdyEsQAbBY22SHLxuEo=;
 b=drkTtgbAvi6DxRCK/N4wt4lb9OffceFNnAlebXPKdVdoUgo4s57u7RwkA1BC6jFp/oox
 1GmHzfPdBy+D+RMD01ZdwnlfCiDdPptweNNNYq2U93Soo3DAJHeo56+114/8f3xR1p3Uv
 kn0JB8P8JuVxnNn0DknSppBK/c6Tw1TZn4aqgSobB7uT2zxDMnnhWUHRwrrSymF1+DNr7
 fCewTbuTZVzZOns6p0RBGZqQgfb/SuHackc1Hdnsj/GSMscRMgum7f3d8NV/arWdhFCaz
 MVLhEYL1zrYU/eHv0Vvl+1AZraitun7KiWu394Rvr2WLHQkGIhgoebdBx37zN9u+OLg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56FCD60F05
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 468D0960CB; Fri, 16 Oct 2026 13:08:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:46:17 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 7205564777b9c72345f6c434db1a1f9fceb21183
X-Git-Newrev: 849098d88602d378876451cb6ec0e8d4c8e19f4b
X-Patchwork-Hint: ignore
Message-Id: <20261016130833.468D0960CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] utils/checkpackagelib:
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4575425281588390824=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4575425281588390824==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/849098d88602d378876451cb6ec0e8d4c8e19f4b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
 
 

--===============4575425281588390824==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4575425281588390824==--
