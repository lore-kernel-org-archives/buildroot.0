Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7B0CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A37D760F44;
	Fri, 16 Oct 2026 13:13:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LYjzvV24GkSs; Fri, 16 Oct 2026 13:13:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4838F6140A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156437;
	b=U/xaOBe3O6VgFZRNypefcDjGQFDhGur5hQ5N+Xn6ijEQwNKlCUqrZGoWHlqOFrKRkMSW
	 JQN4aOetyXwxV0/y4CWYivjAW+lgHnztJFvFdkyn8Hp1LWnCwsQrrH/UOJ4s6bzNp8S4Y
	 FelHQync5tVnmCmTd9W1ydrNbjEfvuSDeZsjGnZNwQ7nMdhHcelh253r/L9vbl9pM/9cS
	 u0LVkvB6d3UNLFY57AezBNKCXBaQzUNgHj/oZ5Q8aVJArd1gAush6tIMkcDFQS/AjP1I8
	 0yz/9Oo/UUitzoJA6K9dH97Rr84SmDNnxPP59mFkGbSNo89jp4uBpSIRpsaHLDohhpw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156437;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=0/j4ZAqGi/X0INq/efDU03E7jZr7STeaAdZeGaPWxag=;
	b=olYoyNGoyMKm+euRsTiK6T9pYGe2aLL477rsxFaxToasemNPGZoB2NwskjTco01DiKyp
	 o5bBe4LEjbj8bI0EnfY/Yje3XCAMKyeCj+3ko4UEHqdiVhiG+1XN21GpIJ14JNlAYkJU5
	 1LNSwepFHI7QJmE+f8ycSnKuCr2tW5GQreoalGSbmgiML5CPDZNyadNZpoNRABIdPQtn9
	 tJE7BTqhT2A54l/vFsAHO9L0wdGHGcnS4nUru7ZrhETj6LNH7t6Usi0/DJ3pPBAyBWNMW
	 wouj4wDpsO137xOH1OVh6GqSbrgJ3+AGjIhHeWAcH8d1tdSAvwdSq28A1ZkZ4WhtvzQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156437;
	bh=0/j4ZAqGi/X0INq/efDU03E7jZr7STeaAdZeGaPWxag=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H9g55oJjj5GnpYQUOVNBx66/1lh+GF9iz+TsM3mt/0BiXo3DLbUKYxIPSUASoETaA
	 C5Kj6SkucdqUqKWsor2tTe2qcDH3M4ukVc2DVGQ1eucLEvc95kSmv9ICc/+kTVhIDr
	 LAeId3No+9Yb61PvE217cOIwbgdEG66/BLAgQewjAGa6nHlOFs6jL+ye8+Nn9aY73z
	 eNCJVdE5H6GEy1FdGn6Dd8xfY1yiyhxK3dty/JJX1QQxFjqAPfTdPfMU4j1h+sjDh4
	 NfAzSqJMcAUfpSd8UhZSiz/qEndfBSClHxGmMmP77hxpNaK/HeIhaG4S+3F9iHpYyF
	 6NcF6sChxqZDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4838F6140A;
	Fri, 16 Oct 2026 13:13:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0474E1C64
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAE2860F24
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qYz143U0fnoH for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 256BC60F56
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156194;
 b=Rl15AsGWISo9HwZTo6v/n5nNebYIV0iFDaAZACs7PqCysovHpyX25qASeff9A1uZENAR
 kbQxoaMT7sfy+OyTW4aEpsQqm3K7Fe7sDn+ypchX2uofmRbdT9OqRFqe60nkZ6s7DHTDl
 be0ESXmIUIpCIIUHmSJKoreBvHC9qYzg5OCc/5t/5IYT++wNW0et7UDyJfXhYeoBlT803
 NceOWytyi4M0G6824O2L0NCPKkIXFpmtgdpIIkjn48+piPCU0iT0/cfvh21xRaoLpKUj+
 Ko22mLAuYLCrg1uYEkQ8GftcbVHvq4lBwuQ5HqTIpA7qL1qiHEID6Q4BO/zYUJPzwcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156194;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=RMMJ7Vr2dFkMBFZ3DkMi7qZVBjCu/we2U3VKIljBJDw=;
 b=SpzC417YNQWESVusLfvfEC/GpVSJ5fWwu1J8LFVkAVrEMD+Ks+ZKcn1H8TtitqsGaekT
 anGK22dEdVNvhJ6BEOJ7WPeetuaV1dWRuWPtYrKW0dzYKIloyHp0z/q1xfnjbT3zncpW9
 lc6gMFpZA8TAzmKy6NQklX4adDjDPqgsbvXPNyJwBlnXO9c0TQLvRUxnML1RTcatECJ0C
 4Tcpx/+MRZ6b9LuPTJ1mllrchJjvCCwftCIpT2JWwI5gLvph0IxQibBWxhSDpZGlq5XdL
 KOfOhjZ51MUa/jAQJgfhxzMqMwxvpMVraRJzQtSWjVhJE2nXF21v6NMkkyJODxEypaA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 256BC60F56
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15C2C960D0; Fri, 16 Oct 2026 13:08:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:46:10 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 949aebfaa6b03aa1cb795c5626895fdf9c4b037f
X-Git-Newrev: 7205564777b9c72345f6c434db1a1f9fceb21183
X-Patchwork-Hint: ignore
Message-Id: <20261016130833.15C2C960D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] utils/checkpackagelib:
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6065731453125785489=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6065731453125785489==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7205564777b9c72345f6c434db1a1f9fceb21183
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
index 21effa9489..9d2950ef79 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -239,6 +239,17 @@ MissingCVEPatch = [
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
 
 

--===============6065731453125785489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6065731453125785489==--
