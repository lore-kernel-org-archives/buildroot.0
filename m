Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E97C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53F0D42D4F;
	Mon, 20 Feb 2023 21:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53F0D42D4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GjJv4NFPTOYm; Mon, 20 Feb 2023 21:31:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99C294766F;
	Mon, 20 Feb 2023 21:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99C294766F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 21C731BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D001D610E9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D001D610E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mQXoLpqFuBvA for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4041610C4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4041610C4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C24B2828C8; Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 11:03:15 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 13dc57c94f9f394441b6faeb864aefd2b8ed08ab
X-Git-Newrev: 39a2ff16f92a61a3e8593c394d211c18d01de8d4
X-Patchwork-Hint: ignore
Message-Id: <20230220205152.C24B2828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python3: add upstream
 security fix for CVE-2022-45061
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=39a2ff16f92a61a3e8593c394d211c18d01de8d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes the following security issue:

CVE-2022-45061: An issue was discovered in Python before 3.11.1.  An
unnecessary quadratic algorithm exists in one path when processing some
inputs to the IDNA (RFC 3490) decoder, such that a crafted, unreasonably
long name being presented to the decoder could lead to a CPU denial of
service.  Hostnames are often supplied by remote servers that could be
controlled by a malicious actor; in such a scenario, they could trigger
excessive CPU consumption on the client attempting to make use of an
attacker-supplied supposed hostname.  For example, the attack payload could
be placed in the Location header of an HTTP response with status code 302.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...33-Fix-quadratic-time-idna-decoding.-GH-9.patch | 86 ++++++++++++++++++++++
 package/python3/python3.mk                         |  3 +
 2 files changed, 89 insertions(+)

diff --git a/package/python3/0033-3.11-gh-98433-Fix-quadratic-time-idna-decoding.-GH-9.patch b/package/python3/0033-3.11-gh-98433-Fix-quadratic-time-idna-decoding.-GH-9.patch
new file mode 100644
index 0000000000..d281e7261d
--- /dev/null
+++ b/package/python3/0033-3.11-gh-98433-Fix-quadratic-time-idna-decoding.-GH-9.patch
@@ -0,0 +1,86 @@
+From 9bb8e18ca46fe66fa6802602f8a7228a24dd785f Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 7 Nov 2022 19:23:16 -0800
+Subject: [PATCH] [3.11] gh-98433: Fix quadratic time idna decoding. (GH-99092)
+ (GH-99222)
+
+There was an unnecessary quadratic loop in idna decoding. This restores
+the behavior to linear.
+
+(cherry picked from commit d315722564927c7202dd6e111dc79eaf14240b0d)
+
+(cherry picked from commit a6f6c3a3d6f2b580f2d87885c9b8a9350ad7bf15)
+
+Co-authored-by: Miss Islington (bot) <31488909+miss-islington@users.noreply.github.com>
+Co-authored-by: Gregory P. Smith <greg@krypto.org>
+[Peter: drop NEWS.d/*]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ Lib/encodings/idna.py                         | 32 +++++++++----------
+ Lib/test/test_codecs.py                       |  6 ++++
+ 2 files changed, 23 insertions(+), 17 deletions(-)
+
+diff --git a/Lib/encodings/idna.py b/Lib/encodings/idna.py
+index ea4058512f..bf98f51336 100644
+--- a/Lib/encodings/idna.py
++++ b/Lib/encodings/idna.py
+@@ -39,23 +39,21 @@ def nameprep(label):
+ 
+     # Check bidi
+     RandAL = [stringprep.in_table_d1(x) for x in label]
+-    for c in RandAL:
+-        if c:
+-            # There is a RandAL char in the string. Must perform further
+-            # tests:
+-            # 1) The characters in section 5.8 MUST be prohibited.
+-            # This is table C.8, which was already checked
+-            # 2) If a string contains any RandALCat character, the string
+-            # MUST NOT contain any LCat character.
+-            if any(stringprep.in_table_d2(x) for x in label):
+-                raise UnicodeError("Violation of BIDI requirement 2")
+-
+-            # 3) If a string contains any RandALCat character, a
+-            # RandALCat character MUST be the first character of the
+-            # string, and a RandALCat character MUST be the last
+-            # character of the string.
+-            if not RandAL[0] or not RandAL[-1]:
+-                raise UnicodeError("Violation of BIDI requirement 3")
++    if any(RandAL):
++        # There is a RandAL char in the string. Must perform further
++        # tests:
++        # 1) The characters in section 5.8 MUST be prohibited.
++        # This is table C.8, which was already checked
++        # 2) If a string contains any RandALCat character, the string
++        # MUST NOT contain any LCat character.
++        if any(stringprep.in_table_d2(x) for x in label):
++            raise UnicodeError("Violation of BIDI requirement 2")
++        # 3) If a string contains any RandALCat character, a
++        # RandALCat character MUST be the first character of the
++        # string, and a RandALCat character MUST be the last
++        # character of the string.
++        if not RandAL[0] or not RandAL[-1]:
++            raise UnicodeError("Violation of BIDI requirement 3")
+ 
+     return label
+ 
+diff --git a/Lib/test/test_codecs.py b/Lib/test/test_codecs.py
+index 8edd5ac063..2407567261 100644
+--- a/Lib/test/test_codecs.py
++++ b/Lib/test/test_codecs.py
+@@ -1535,6 +1535,12 @@ def test_builtin_encode(self):
+         self.assertEqual("pyth\xf6n.org".encode("idna"), b"xn--pythn-mua.org")
+         self.assertEqual("pyth\xf6n.org.".encode("idna"), b"xn--pythn-mua.org.")
+ 
++    def test_builtin_decode_length_limit(self):
++        with self.assertRaisesRegex(UnicodeError, "too long"):
++            (b"xn--016c"+b"a"*1100).decode("idna")
++        with self.assertRaisesRegex(UnicodeError, "too long"):
++            (b"xn--016c"+b"a"*70).decode("idna")
++
+     def test_stream(self):
+         r = codecs.getreader("idna")(io.BytesIO(b"abc"))
+         r.read(3)
+-- 
+2.30.2
+
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 4131941e11..2e17104102 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -13,6 +13,9 @@ PYTHON3_LICENSE_FILES = LICENSE
 PYTHON3_CPE_ID_VENDOR = python
 PYTHON3_CPE_ID_PRODUCT = python
 
+# 0033-3.11-gh-98433-Fix-quadratic-time-idna-decoding.-GH-9.patch
+PYTHON3_IGNORE_CVES += CVE-2022-45061
+
 # This host Python is installed in $(HOST_DIR), as it is needed when
 # cross-compiling third-party Python modules.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
