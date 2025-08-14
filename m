Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456D8CA0EE6
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 19:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BF8260718;
	Thu, 14 Aug 2025 19:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V6rCFlkTsmab; Thu, 14 Aug 2025 19:56:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D17A26071D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D17A26071D;
	Thu, 14 Aug 2025 19:56:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E297228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86BD740488
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9hXAWEHHppxk for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 19:56:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9160940481
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9160940481
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F410868FB; Thu, 14 Aug 2025 19:56:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:26:08 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6336592f8979c81d52befc295ecabad57c908845
X-Git-Newrev: 6058704b1ddf4ce2a939aeec835b86047d7cd84f
X-Patchwork-Hint: ignore
Message-Id: <20250814195611.8F410868FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python3: add
 patch for CVE-2025-8194
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
Content-Type: multipart/mixed; boundary="===============0782689873506171381=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0782689873506171381==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6058704b1ddf4ce2a939aeec835b86047d7cd84f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This fixes the following vulnerability:

- CVE-2025-8194

    There is a defect in the CPython “tarfile” module affecting the
    “TarFile” extraction and entry enumeration APIs. The tar
    implementation would process tar archives with negative offsets
    without error, resulting in an infinite loop and deadlock during the
    parsing of maliciously crafted tar archives.   This vulnerability can
    be mitigated by including the following patch after importing the
    “tarfile” module: 
    https://gist.github.com/sethmlarson/1716ac5b82b73dbcbf23ad2eff8b33e1

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-8194
  - https://github.com/python/cpython/commit/c9d9f78feb1467e73fd29356c040bde1c104f29f

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...to-ensure-member-offsets-are-non-negative.patch | 218 +++++++++++++++++++++
 package/python3/python3.mk                         |   3 +
 2 files changed, 221 insertions(+)

diff --git a/package/python3/0013-tarfile-now-validates-archives-to-ensure-member-offsets-are-non-negative.patch b/package/python3/0013-tarfile-now-validates-archives-to-ensure-member-offsets-are-non-negative.patch
new file mode 100644
index 0000000000..a078621e77
--- /dev/null
+++ b/package/python3/0013-tarfile-now-validates-archives-to-ensure-member-offsets-are-non-negative.patch
@@ -0,0 +1,218 @@
+From c9d9f78feb1467e73fd29356c040bde1c104f29f Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 4 Aug 2025 13:45:06 +0200
+Subject: [PATCH] [3.12] gh-130577: tarfile now validates archives to ensure
+ member offsets are non-negative (GH-137027) (#137171)
+
+(cherry picked from commit 7040aa54f14676938970e10c5f74ea93cd56aa38)
+
+Co-authored-by: Alexander Urieles <aeurielesn@users.noreply.github.com>
+Co-authored-by: Gregory P. Smith <greg@krypto.org>
+CVE: CVE-2025-8194
+Upstream: https://github.com/python/cpython/commit/c9d9f78feb1467e73fd29356c040bde1c104f29f
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ Lib/tarfile.py                                |   3 +
+ Lib/test/test_tarfile.py                      | 156 ++++++++++++++++++
+ ...-07-23-00-35-29.gh-issue-130577.c7EITy.rst |   3 +
+ 3 files changed, 162 insertions(+)
+ create mode 100644 Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EITy.rst
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index 9999a99d54d8b9..59d3f6e5cce165 100755
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -1615,6 +1615,9 @@ def _block(self, count):
+         """Round up a byte count by BLOCKSIZE and return it,
+            e.g. _block(834) => 1024.
+         """
++        # Only non-negative offsets are allowed
++        if count < 0:
++            raise InvalidHeaderError("invalid offset")
+         blocks, remainder = divmod(count, BLOCKSIZE)
+         if remainder:
+             blocks += 1
+diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
+index a184ba75a8851b..759fa03ead70b0 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -50,6 +50,7 @@ def sha256sum(data):
+ xzname = os.path.join(TEMPDIR, "testtar.tar.xz")
+ tmpname = os.path.join(TEMPDIR, "tmp.tar")
+ dotlessname = os.path.join(TEMPDIR, "testtar")
++SPACE = b" "
+ 
+ sha256_regtype = (
+     "e09e4bc8b3c9d9177e77256353b36c159f5f040531bbd4b024a8f9b9196c71ce"
+@@ -4488,6 +4489,161 @@ def extractall(self, ar):
+         ar.extractall(self.testdir, filter='fully_trusted')
+ 
+ 
++class OffsetValidationTests(unittest.TestCase):
++    tarname = tmpname
++    invalid_posix_header = (
++        # name: 100 bytes
++        tarfile.NUL * tarfile.LENGTH_NAME
++        # mode, space, null terminator: 8 bytes
++        + b"000755" + SPACE + tarfile.NUL
++        # uid, space, null terminator: 8 bytes
++        + b"000001" + SPACE + tarfile.NUL
++        # gid, space, null terminator: 8 bytes
++        + b"000001" + SPACE + tarfile.NUL
++        # size, space: 12 bytes
++        + b"\xff" * 11 + SPACE
++        # mtime, space: 12 bytes
++        + tarfile.NUL * 11 + SPACE
++        # chksum: 8 bytes
++        + b"0011407" + tarfile.NUL
++        # type: 1 byte
++        + tarfile.REGTYPE
++        # linkname: 100 bytes
++        + tarfile.NUL * tarfile.LENGTH_LINK
++        # magic: 6 bytes, version: 2 bytes
++        + tarfile.POSIX_MAGIC
++        # uname: 32 bytes
++        + tarfile.NUL * 32
++        # gname: 32 bytes
++        + tarfile.NUL * 32
++        # devmajor, space, null terminator: 8 bytes
++        + tarfile.NUL * 6 + SPACE + tarfile.NUL
++        # devminor, space, null terminator: 8 bytes
++        + tarfile.NUL * 6 + SPACE + tarfile.NUL
++        # prefix: 155 bytes
++        + tarfile.NUL * tarfile.LENGTH_PREFIX
++        # padding: 12 bytes
++        + tarfile.NUL * 12
++    )
++    invalid_gnu_header = (
++        # name: 100 bytes
++        tarfile.NUL * tarfile.LENGTH_NAME
++        # mode, null terminator: 8 bytes
++        + b"0000755" + tarfile.NUL
++        # uid, null terminator: 8 bytes
++        + b"0000001" + tarfile.NUL
++        # gid, space, null terminator: 8 bytes
++        + b"0000001" + tarfile.NUL
++        # size, space: 12 bytes
++        + b"\xff" * 11 + SPACE
++        # mtime, space: 12 bytes
++        + tarfile.NUL * 11 + SPACE
++        # chksum: 8 bytes
++        + b"0011327" + tarfile.NUL
++        # type: 1 byte
++        + tarfile.REGTYPE
++        # linkname: 100 bytes
++        + tarfile.NUL * tarfile.LENGTH_LINK
++        # magic: 8 bytes
++        + tarfile.GNU_MAGIC
++        # uname: 32 bytes
++        + tarfile.NUL * 32
++        # gname: 32 bytes
++        + tarfile.NUL * 32
++        # devmajor, null terminator: 8 bytes
++        + tarfile.NUL * 8
++        # devminor, null terminator: 8 bytes
++        + tarfile.NUL * 8
++        # padding: 167 bytes
++        + tarfile.NUL * 167
++    )
++    invalid_v7_header = (
++        # name: 100 bytes
++        tarfile.NUL * tarfile.LENGTH_NAME
++        # mode, space, null terminator: 8 bytes
++        + b"000755" + SPACE + tarfile.NUL
++        # uid, space, null terminator: 8 bytes
++        + b"000001" + SPACE + tarfile.NUL
++        # gid, space, null terminator: 8 bytes
++        + b"000001" + SPACE + tarfile.NUL
++        # size, space: 12 bytes
++        + b"\xff" * 11 + SPACE
++        # mtime, space: 12 bytes
++        + tarfile.NUL * 11 + SPACE
++        # chksum: 8 bytes
++        + b"0010070" + tarfile.NUL
++        # type: 1 byte
++        + tarfile.REGTYPE
++        # linkname: 100 bytes
++        + tarfile.NUL * tarfile.LENGTH_LINK
++        # padding: 255 bytes
++        + tarfile.NUL * 255
++    )
++    valid_gnu_header = tarfile.TarInfo("filename").tobuf(tarfile.GNU_FORMAT)
++    data_block = b"\xff" * tarfile.BLOCKSIZE
++
++    def _write_buffer(self, buffer):
++        with open(self.tarname, "wb") as f:
++            f.write(buffer)
++
++    def _get_members(self, ignore_zeros=None):
++        with open(self.tarname, "rb") as f:
++            with tarfile.open(
++                mode="r", fileobj=f, ignore_zeros=ignore_zeros
++            ) as tar:
++                return tar.getmembers()
++
++    def _assert_raises_read_error_exception(self):
++        with self.assertRaisesRegex(
++            tarfile.ReadError, "file could not be opened successfully"
++        ):
++            self._get_members()
++
++    def test_invalid_offset_header_validations(self):
++        for tar_format, invalid_header in (
++            ("posix", self.invalid_posix_header),
++            ("gnu", self.invalid_gnu_header),
++            ("v7", self.invalid_v7_header),
++        ):
++            with self.subTest(format=tar_format):
++                self._write_buffer(invalid_header)
++                self._assert_raises_read_error_exception()
++
++    def test_early_stop_at_invalid_offset_header(self):
++        buffer = self.valid_gnu_header + self.invalid_gnu_header + self.valid_gnu_header
++        self._write_buffer(buffer)
++        members = self._get_members()
++        self.assertEqual(len(members), 1)
++        self.assertEqual(members[0].name, "filename")
++        self.assertEqual(members[0].offset, 0)
++
++    def test_ignore_invalid_archive(self):
++        # 3 invalid headers with their respective data
++        buffer = (self.invalid_gnu_header + self.data_block) * 3
++        self._write_buffer(buffer)
++        members = self._get_members(ignore_zeros=True)
++        self.assertEqual(len(members), 0)
++
++    def test_ignore_invalid_offset_headers(self):
++        for first_block, second_block, expected_offset in (
++            (
++                (self.valid_gnu_header),
++                (self.invalid_gnu_header + self.data_block),
++                0,
++            ),
++            (
++                (self.invalid_gnu_header + self.data_block),
++                (self.valid_gnu_header),
++                1024,
++            ),
++        ):
++            self._write_buffer(first_block + second_block)
++            members = self._get_members(ignore_zeros=True)
++            self.assertEqual(len(members), 1)
++            self.assertEqual(members[0].name, "filename")
++            self.assertEqual(members[0].offset, expected_offset)
++
++
+ def setUpModule():
+     os_helper.unlink(TEMPDIR)
+     os.makedirs(TEMPDIR)
+diff --git a/Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EITy.rst b/Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EITy.rst
+new file mode 100644
+index 00000000000000..342cabbc865dc4
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EITy.rst
+@@ -0,0 +1,3 @@
++:mod:`tarfile` now validates archives to ensure member offsets are
++non-negative.  (Contributed by Alexander Enrique Urieles Nieto in
++:gh:`130577`.)
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 8bbff066ab..8adc76161d 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -13,6 +13,9 @@ PYTHON3_LICENSE_FILES = LICENSE
 PYTHON3_CPE_ID_VENDOR = python
 PYTHON3_CPE_ID_PRODUCT = python
 
+# 0013-tarfile-now-validates-archives-to-ensure-member-offsets-are-non-negative.patch
+PYTHON3_IGNORE_CVES += CVE-2025-8194
+
 # This host Python is installed in $(HOST_DIR), as it is needed when
 # cross-compiling third-party Python modules.
 

--===============0782689873506171381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0782689873506171381==--
