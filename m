Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E1DCD6E74
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 17:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 540DE6F79E;
	Thu,  4 Jun 2026 17:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4PX-MjoDWFvi; Thu,  4 Jun 2026 17:37:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22F0B6F7A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780594635;
	bh=2vao5w3GSzq36Rk5zBZPZt7VK8ae5fyI6sYIcrlBwRo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=F/40rw7kCqgnMYUtWbahgPpGk6ujT1dYHAuoNWXsi31PWdE0KkOzd+1zzxKB8xbXo
	 DXmHlL2owsXoFljN1lVlDHo9qfiOE0uth2/pdbhSNKCkmL7ip8nTcGI4xUBUWlWlIK
	 v+z+XLTCAGXeML7srF67By4A2vycUxV8aThUBH2NNRFOki8Rr6DkyZzDruZWdV6qhJ
	 kyT3a9pQAgHo7at1/rWhMFe47V4jhSSD2n5ypuxy5oAy+iXuc5+V0EVmKKOUKCYA5h
	 9e6okkAuCoLxCLzvIAnanGcKr5IZBey7LB/M59A6Xc+l3JHOLcBwCPpeVWDVaBBduz
	 +MgZqVjebwN1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22F0B6F7A0;
	Thu,  4 Jun 2026 17:37:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3566726A
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 17:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CF7442730
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 17:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V8y-aNccIOC0 for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 17:37:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3B27242723
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B27242723
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B27242723
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 17:37:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d62.dip0.t-ipconnect.de [91.58.13.98])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EC7B9A4C39AD;
 Thu,  4 Jun 2026 19:37:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39050)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wVC0B-0000000050k-1b5W;
 Thu, 04 Jun 2026 17:37:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  4 Jun 2026 19:37:06 +0200
Message-ID: <20260604173707.2135315-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780594628;
 bh=K5lH4x1FbbTqmM8KNX4VqcjZW9r4lyH98F4ilUZ9QhM=;
 h=From:To:Cc:Subject:Date:From;
 b=DJUYQ92JdKkbYvTgF5iRL5lNo0hI+uEpQTyXeC5YYCQVEThCwBpMufrXzu2FPX1uS
 JKF0TLhJNORkhmZBUDTOOGqgXXX1QY3aEkb7Fx1GJctLsnPyZmYniOeUBPTgo3SDS2
 9FHX1mtuzOnWDcysoLWvvnHNAX3xQzDN04cUGbmuBonVF/YBbDsVHEJigA+4OrETNz
 SPs+iPjJeYqsAfoI0EXBLWm9bUb7hlviUXONCXot82EvwDNE6aPRD5YPBFivjn4x/0
 z+lpJZg7XFKZcknv0RkEhusUKHIcBriy3YnDHS6x9/wbJN9AzTXO+UDcGE1HQ/STHB
 si+lkNWXF1tkA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=DJUYQ92J
Subject: [Buildroot] [PATCH 1/2] package/python3: add upstream security
 patch for CVE-2026-7774
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://mail.python.org/archives/list/security-announce@python.org/thread/4FU62L2M6RMMHT2QPGQNPEHHUND7CEX5/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipeline:
https://gitlab.com/bkuhls/buildroot/-/commits/5b4549fd52313aa0caa2dbb919a8b98c11ab5768

 ...arfile.data_filter-validate-written-.patch | 268 ++++++++++++++++++
 package/python3/python3.mk                    |   3 +
 2 files changed, 271 insertions(+)
 create mode 100644 package/python3/0012-3.14-gh-149486-tarfile.data_filter-validate-written-.patch

diff --git a/package/python3/0012-3.14-gh-149486-tarfile.data_filter-validate-written-.patch b/package/python3/0012-3.14-gh-149486-tarfile.data_filter-validate-written-.patch
new file mode 100644
index 0000000000..94377fb832
--- /dev/null
+++ b/package/python3/0012-3.14-gh-149486-tarfile.data_filter-validate-written-.patch
@@ -0,0 +1,268 @@
+From 74cca9a92fb7d653e404843a56b8bdc7b0afdbbf Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 11 May 2026 11:57:50 +0200
+Subject: [PATCH] [3.14] gh-149486: tarfile.data_filter: validate written link
+ target (GH-149487) (GH-149554)
+
+* gh-149486: tarfile.data_filter: validate written link target (GH-149487)
+
+The data filter rewrote linknames with normpath() but ran the
+containment check against the un-normalised value, and computed a
+symlink's directory before stripping trailing slashes.  Both let a
+crafted archive create links pointing outside the destination.  Also
+reject link members that resolve to the destination directory itself,
+which could otherwise replace it with a symlink and redirect all
+subsequent members.
+
+(Patch by Greg; Petr's just reviewing & merging.)
+(cherry picked from commit 578411982c16f753f4893532510099ef665117da)
+
+Co-authored-by: Petr Viktorin <encukou@gmail.com>
+Co-authored-by: Gregory P. Smith <greg@krypto.org>
+Upstream: https://github.com/python/cpython/commit/74cca9a92fb7d653e404843a56b8bdc7b0afdbbf
+CVE: CVE-2026-7774
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Lib/tarfile.py                                |  16 +-
+ Lib/test/test_tarfile.py                      | 151 ++++++++++++++----
+ ...-05-03-21-00-00.gh-issue-149486.tarflt.rst |   5 +
+ 3 files changed, 133 insertions(+), 39 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-05-03-21-00-00.gh-issue-149486.tarflt.rst
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index 414aefe9744..a9eca7579ef 100644
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -830,16 +830,22 @@ def _get_filtered_attrs(member, dest_path, for_data=True):
+         if member.islnk() or member.issym():
+             if os.path.isabs(member.linkname):
+                 raise AbsoluteLinkError(member)
++            # A link member that resolves to the destination directory itself
++            # would replace it with a (sym)link, redirecting the destination
++            # for all subsequent members.
++            if target_path == dest_path:
++                raise OutsideDestinationError(member, target_path)
+             normalized = os.path.normpath(member.linkname)
+             if normalized != member.linkname:
+                 new_attrs['linkname'] = normalized
+             if member.issym():
+-                target_path = os.path.join(dest_path,
+-                                           os.path.dirname(name),
+-                                           member.linkname)
++                # The symlink is created at `name` with trailing separators
++                # stripped, so its target is relative to the directory
++                # containing that path.
++                link_dir = os.path.dirname(name.rstrip('/' + os.sep))
++                target_path = os.path.join(dest_path, link_dir, normalized)
+             else:
+-                target_path = os.path.join(dest_path,
+-                                           member.linkname)
++                target_path = os.path.join(dest_path, normalized)
+             target_path = os.path.realpath(target_path,
+                                            strict=os.path.ALLOW_MISSING)
+             if os.path.commonpath([target_path, dest_path]) != dest_path:
+diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
+index 8d9f8824f7c..837b6aa8c03 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -3682,6 +3682,39 @@ class TestExtractionFilters(unittest.TestCase):
+     # The destination for the extraction, within `outerdir`
+     destdir = outerdir / 'dest'
+ 
++    @classmethod
++    def setUpClass(cls):
++        # Posix and Windows have different pathname resolution:
++        # either symlink or a '..' component resolve first.
++        # Let's see which we are on.
++        if os_helper.can_symlink():
++            testpath = os.path.join(TEMPDIR, 'resolution_test')
++            os.mkdir(testpath)
++
++            # testpath/current links to `.` which is all of:
++            #   - `testpath`
++            #   - `testpath/current`
++            #   - `testpath/current/current`
++            #   - etc.
++            os.symlink('.', os.path.join(testpath, 'current'))
++
++            # we'll test where `testpath/current/../file` ends up
++            with open(os.path.join(testpath, 'current', '..', 'file'), 'w'):
++                pass
++
++            if os.path.exists(os.path.join(testpath, 'file')):
++                # Windows collapses 'current\..' to '.' first, leaving
++                # 'testpath\file'
++                cls.dotdot_resolves_early = True
++            elif os.path.exists(os.path.join(testpath, '..', 'file')):
++                # Posix resolves 'current' to '.' first, leaving
++                # 'testpath/../file'
++                cls.dotdot_resolves_early = False
++            else:
++                raise AssertionError('Could not determine link resolution')
++        else:
++            cls.dotdot_resolves_early = False
++
+     @contextmanager
+     def check_context(self, tar, filter, *, check_flag=True):
+         """Extracts `tar` to `self.destdir` and allows checking the result
+@@ -3853,10 +3886,19 @@ def test_parent_symlink(self):
+                     + "which is outside the destination")
+ 
+             with self.check_context(arc.open(), 'data'):
+-                self.expect_exception(
+-                    tarfile.LinkOutsideDestinationError,
+-                    """'parent' would link to ['"].*outerdir['"], """
+-                    + "which is outside the destination")
++                if self.dotdot_resolves_early:
++                    # 'current/../..' normalises to '..', which is rejected.
++                    self.expect_exception(
++                        tarfile.LinkOutsideDestinationError,
++                        """'parent' would link to ['"].*outerdir['"], """
++                        + "which is outside the destination")
++                else:
++                    # 'current/..' normalises to '.'; the rewritten link is
++                    # created and 'parent/evil' lands harmlessly inside the
++                    # destination.
++                    self.expect_file('current', symlink_to='.')
++                    self.expect_file('parent', symlink_to='.')
++                    self.expect_file('evil')
+ 
+         else:
+             # No symlink support. The symlinks are ignored.
+@@ -3946,35 +3988,6 @@ def test_parent_symlink2(self):
+         # Test interplaying symlinks
+         # Inspired by 'dirsymlink2b' in jwilk/traversal-archives
+ 
+-        # Posix and Windows have different pathname resolution:
+-        # either symlink or a '..' component resolve first.
+-        # Let's see which we are on.
+-        if os_helper.can_symlink():
+-            testpath = os.path.join(TEMPDIR, 'resolution_test')
+-            os.mkdir(testpath)
+-
+-            # testpath/current links to `.` which is all of:
+-            #   - `testpath`
+-            #   - `testpath/current`
+-            #   - `testpath/current/current`
+-            #   - etc.
+-            os.symlink('.', os.path.join(testpath, 'current'))
+-
+-            # we'll test where `testpath/current/../file` ends up
+-            with open(os.path.join(testpath, 'current', '..', 'file'), 'w'):
+-                pass
+-
+-            if os.path.exists(os.path.join(testpath, 'file')):
+-                # Windows collapses 'current\..' to '.' first, leaving
+-                # 'testpath\file'
+-                dotdot_resolves_early = True
+-            elif os.path.exists(os.path.join(testpath, '..', 'file')):
+-                # Posix resolves 'current' to '.' first, leaving
+-                # 'testpath/../file'
+-                dotdot_resolves_early = False
+-            else:
+-                raise AssertionError('Could not determine link resolution')
+-
+         with ArchiveMaker() as arc:
+ 
+             # `current` links to `.` which is both the destination directory
+@@ -4010,7 +4023,7 @@ def test_parent_symlink2(self):
+ 
+         with self.check_context(arc.open(), 'data'):
+             if os_helper.can_symlink():
+-                if dotdot_resolves_early:
++                if self.dotdot_resolves_early:
+                     # Fail when extracting a file outside destination
+                     self.expect_exception(
+                             tarfile.OutsideDestinationError,
+@@ -4130,6 +4143,76 @@ def test_sly_relative2(self):
+                     + """['"].*moo['"], which is outside the """
+                     + "destination")
+ 
++    @symlink_test
++    @os_helper.skip_unless_symlink
++    def test_normpath_realpath_mismatch(self):
++        # The link-target check must validate the value that will actually
++        # be written to disk (the normalised linkname), not the original.
++        # Here 'a' is a symlink to a deep nonexistent path, so realpath()
++        # of 'a/../../...' stays inside the destination while normpath()
++        # collapses 'a/..' lexically and escapes.
++        depth = len(self.destdir.parts) + 5
++        deep = '/'.join(f'p{i}' for i in range(depth))
++        sneaky = 'a/' + '../' * depth + 'flag'
++        for kind in 'symlink_to', 'hardlink_to':
++            with self.subTest(kind):
++                with ArchiveMaker() as arc:
++                    arc.add('a', symlink_to=deep)
++                    arc.add('escape', **{kind: sneaky})
++                with self.check_context(arc.open(), 'data'):
++                    self.expect_exception(
++                        tarfile.LinkOutsideDestinationError)
++
++    @symlink_test
++    @os_helper.skip_unless_symlink
++    def test_symlink_trailing_slash(self):
++        # A trailing slash on a symlink member's name must not cause the
++        # link target to be resolved relative to the wrong directory.
++        with ArchiveMaker() as arc:
++            t = tarfile.TarInfo('x/')
++            t.type = tarfile.SYMTYPE
++            t.linkname = '..'
++            arc.tar_w.addfile(t)
++            arc.add('x/escaped', content='hi')
++
++        with self.check_context(arc.open(), 'data'):
++            self.expect_exception(tarfile.LinkOutsideDestinationError)
++
++    @symlink_test
++    @os_helper.skip_unless_symlink
++    def test_link_at_destination(self):
++        # A link member whose name resolves to the destination directory
++        # itself must be rejected: otherwise the destination is replaced
++        # by a symlink and later members can be redirected through it.
++        for name in '', '.', './':
++            with ArchiveMaker() as arc:
++                t = tarfile.TarInfo(name)
++                t.type = tarfile.SYMTYPE
++                t.linkname = '.'
++                arc.tar_w.addfile(t)
++
++            with self.check_context(arc.open(), 'data'):
++                self.expect_exception(tarfile.OutsideDestinationError)
++
++    @symlink_test
++    @os_helper.skip_unless_symlink
++    def test_empty_name_symlink_chain(self):
++        # Regression test for a chain of empty-named symlinks that
++        # incrementally redirects the destination outwards.
++        with ArchiveMaker() as arc:
++            for name, target in [('', ''), ('a/', '..'),
++                                 ('', 'dummy'), ('', 'a'),
++                                 ('b/', '..'),
++                                 ('', 'dummy'), ('', 'a/b')]:
++                t = tarfile.TarInfo(name)
++                t.type = tarfile.SYMTYPE
++                t.linkname = target
++                arc.tar_w.addfile(t)
++            arc.add('escaped', content='hi')
++
++        with self.check_context(arc.open(), 'data'):
++            self.expect_exception(tarfile.FilterError)
++
+     @symlink_test
+     def test_deep_symlink(self):
+         # Test that symlinks and hardlinks inside a directory
+diff --git a/Misc/NEWS.d/next/Security/2026-05-03-21-00-00.gh-issue-149486.tarflt.rst b/Misc/NEWS.d/next/Security/2026-05-03-21-00-00.gh-issue-149486.tarflt.rst
+new file mode 100644
+index 00000000000..7c69edb683c
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-05-03-21-00-00.gh-issue-149486.tarflt.rst
+@@ -0,0 +1,5 @@
++:func:`tarfile.data_filter` now validates link targets using the same
++normalised value that is written to disk, strips trailing separators from
++the member name when resolving a symlink's directory, and rejects link
++members that would replace the destination directory itself. This closes
++several path-traversal bypasses of the ``data`` extraction filter.
+-- 
+2.47.3
+
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 61fab7e350..e14ddf4f20 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -16,6 +16,9 @@ PYTHON3_CPE_ID_PRODUCT = python
 # 0011-3.14-gh-149079-Fix-O-n-2-canonical-ordering-in-unico.patch
 PYTHON3_IGNORE_CVES += CVE-2026-3276
 
+# 0012-3.14-gh-149486-tarfile.data_filter-validate-written-.patch
+PYTHON3_IGNORE_CVES += CVE-2026-7774
+
 # This host Python is installed in $(HOST_DIR), as it is needed when
 # cross-compiling third-party Python modules.
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
