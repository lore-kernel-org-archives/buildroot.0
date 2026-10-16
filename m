Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CC4CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBDD960E9F;
	Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Erg8R79UDht; Fri, 16 Oct 2026 13:09:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B019560F26
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156191;
	b=MSPaGZ4ApypHxtw0OzewP/Fkj0G4AE8BbMs13ighjAFQ950wfuAl1IhgTWrIOZv75KCA
	 9eOzjiUFCxY6o6bHfBSagpLmEuAYfMzQV8IIKUNinyvBNP4SFMgeeC3VyYgmK2+ZT/+qp
	 B5iW6m3OwVxw6K8OfV1BrhfU9O3kUmCcupWz5YHN8M3G+m4BSCzuLZbxKlsLd0VTdVzCd
	 J5GKG0foZs3aBSxjF3FNUEVKDPFKGCJjrkXH12P6Ep6sD9tTSUZA2HY328MQ98K/H1wxY
	 9GTkATh1htsSalxmTgsfrWVipTwGulevxoisPFfBa+wCJT0JEiakga08UMkkBn56NnA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156191;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=90HDJevMxdIzPepfKcUFNP3fi6UQbTDhiAUBRWAIB2U=;
	b=D6xDX0eUxi7CEyhzt62i+MJRCv10TDt+8RhgkRjC2Og3FgWuaTebF7TQTJfH21kIgJRt
	 Y3kmr7fUwjo4rXIxafP38MU4q+f44yXJAs9VLmcBrEZxIEx+7/CvoQ7ZRPtgpP55mi7p9
	 +ZsfH6egWV4IumAiF8vbBLtTiIEnFL4IZW6xgSDw0KlpVXC9PqBRb+gZTJ2wQMGYctd25
	 A7fYTcXPtQf4dbxNppVAR4HTVrVVvhRE3p57R8LEUh1nWc3NXgWauXGSbilko9gB/IaRN
	 rybMGWGt6KnNw8DXcgXHfbXLDOBZd0QC4gp71Z6cxtt6HLLdKJjyPJBkNa4ilTwgcLg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156191;
	bh=90HDJevMxdIzPepfKcUFNP3fi6UQbTDhiAUBRWAIB2U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Hf9FNQ7fXTm+H3PBU/78jKYdqQrwddmQsLDGhgFXaI+lilVe54n8L3C46QHBfFqoH
	 B0ZIGgcvFEFuX1CUYdxDtrHMhHp3WpKvL3/Tei7n5wjB/FjLpNaCfjwqfapIxnyAAC
	 gEm22iiZPpTz2IxQITqyEkdURofc89MqgnoO2Z+AQ/njyjXoSTPiRN6xd4gnPqJp6L
	 a7XcxAxSZfX8A7jtX/ApLixHTv6UP73xjjuEZ7f7gXKAuxYwVdso3iNxyJzfpqP/hA
	 O+6w8eP+NghW3ofBIHVlpCbBk/3hD73hftaNOpX64/JoFP1ETf150z6fw1klItf9Jb
	 eDVYF7Ja2g5lA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B019560F26;
	Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C4933769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AABF0409F4
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FhbSR9i3WlaM for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DD9F8409FF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=OokSIwqadIQdjyj1r0mpmXF5wOonnAJViiYRBZj0gmuHkF8eAnvkLd55RMZUJyW5IR+4
 5McP8luQo/J5hvtEY5RUbYbjjw1f76c/LrEzPidK5lcxJNBI3j+RZmY7wKhLygw5SuQ5r
 xrZ249XHY5pqF7//VjnfcQUnGHuHjrzeU0be2XtUlFD/lzR6i2s7nOeEuRXMwvnG2nAOb
 vwKLnFx7xe0ngxqUqDo03jIQr56b1KZo/sswe+tOTO+H2htV6YIiIn+DxVx+hJNncmGPv
 7Eg/EtT1UwXHYqZ8PVohgsrEXWM6oU00ouEJG5MZ2FmgTvDunKvUDr4A2jrTGIfKIfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=XJZSMeKNNcZq7OLnen1dVYnpKxQ7QizdjIlk5NQ50B0=;
 b=Byaw7GRxdCflDKuu8XZjrKwIhOoYAl3AiIZybfmwMOWpEDR4xVAmlRxM1kmKsr8omfm8
 SlPRddOArcNjSnP4WZfR0sPKxrrpSrH0ruc+64JyKCtsLRlpnz15fVCeZRWANWhbDAIGh
 r7IGphxin+4BiycFcr2xHuwimpnW/gEA7DXN0o7EjatisKigw1qI28PVelLjmv9pyX4yH
 ZY9YScC+E7J5XviQi0ikft5dKOkiM//UCRUspp/5lKcKde012SZLRNbzENcLKB8m+F8yV
 T6NhAP3JnXesR0NNzpZlx6SZe9bUhxeUJP2ug2SL1+JHmt4lUY+L3hCqHcxpBa5q8oA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD9F8409FF
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CED95960D5; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f3fbc82d9db3febad1699205c8dca806ca4f2cb5
X-Git-Newrev: 1dab7644a0febbc833f76ea3a3122a8838b5fbb4
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.CED95960D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/checkpackagelib:
 support other identifiers than CVE
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
Content-Type: multipart/mixed; boundary="===============4489939582691342995=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4489939582691342995==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1dab7644a0febbc833f76ea3a3122a8838b5fbb4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Currently the MissingCVEPatch check will complain if another
identifiers than a CVE-YYYY-XXXX is passed after the 'CVE: '
trailer in the patch header introduced in [1].

If a package 'foo' defines the following:

FOO_IGNORE_CVES += GHSA-abcd-1234-efgh

And correctly references it in a patch header:

CVE: GHSA-abcd-1234-efgh

check-package will report the following:

package/foo/foo.mk: patch file '0001-some-patch.patch' is missing 'CVE:' tag

While we could argue that GHSA identifier should not be present in the
'IGNORE_CVES' variable, it's still valuable for users to have a way to
correctly ignore and link a patch for their vulnerability report.

From our point of view it allows us to track GHSA vulnerabilities that
could later be assigned a CVE so we can update the IGNORE_CVES variable.

This commit relaxes the constraint on the 'CVE' trailer to just check
for the presence of any identifier. We still only allow alphanumerical
characters and dashes, to be sure that any tooling that uses the
identifiers won't break.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Arnout:
 - keep the regex but allow any alphanumerical string;
 - add a test that FOO:123 doesn't match]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 552bf40db16505e1549f149b095d47e98da29594)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 utils/checkpackagelib/lib_mk.py      |  2 +-
 utils/checkpackagelib/test_lib_mk.py | 11 +++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 065733d464..1fa056cbf4 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -121,7 +121,7 @@ class Indent(_CheckFunction):
 class MissingCVEPatch(_CheckFunction):
     PATCH_COMMENT = re.compile(r"^#\s*(\S+\.patch)\s*$")
     IGNORE_CVES = re.compile(r"^[A-Z0-9_]+_IGNORE_CVES\s*\+?=")
-    CVE_TAG_IN_PATCH = re.compile(r"^CVE: *CVE-\d+-\d+$")
+    CVE_TAG_IN_PATCH = re.compile(r"^CVE: *([\w-]+)$")
 
     def before(self):
         self.pending_patches = []
diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
index 81c3129b2f..31696a7e76 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -242,6 +242,17 @@ MissingCVEPatch = [
      {},
      'FOO_IGNORE_CVES += CVE-2000-1234\n',
      []),
+    ('invalid syntax in patch',
+     {'0001-some-fix.patch': 'CVE: FOO:123'},
+     '# 0001-some-fix.patch\n'
+     'FOO_IGNORE_CVES += FOO:123\n',
+     [['{}: patch file \'0001-some-fix.patch\' is missing \'CVE:\' tag',
+       '# 0001-some-fix.patch\n']]),
+    ('patches present with other identifier',
+     {'0001-some-fix.patch': 'CVE: GHSA-abcd-1234-efgh'},
+     '# 0001-some-fix.patch\n'
+     'FOO_IGNORE_CVES += GHSA-abcd-1234-efgh\n',
+     []),
     ]
 
 

--===============4489939582691342995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4489939582691342995==--
