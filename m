Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9BCCD8CA7
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 21:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E37784DBB;
	Mon,  8 Jun 2026 21:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b4-DnOgaqTdH; Mon,  8 Jun 2026 21:21:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 138AB84D9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780953680;
	bh=hJHnFC7GajwIRsGFn4278bLO/Snr9UXcYdEGwA8/1PE=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=e1MQsRlxmwQnJiniWY+0a8qnjPbaGyG7mV2DqyvnJkAKWW1Zbe/aM+B64Mr4J48Do
	 Lh6W2B6H914QtYz5T5zy7M7eQKDGnvcCZAh2Qevr6TyYAJXbPPFgVDo9ozJuEueSHC
	 sQyEadhfSQ0eMAqcRYJlhBiTgWUwl+KLPfb9yaO88r7YZ4ZYBAsJhyU+jiUywyB7tD
	 n0c5/uIVRLZa/BPr+DkftTWnFBXw9eEI1w/vLq+GqEdtqNBZuS7k+qDJTGDGF7DOMw
	 7mLrRwF3xoCXTIV9Ywy0nkZT93X+c/qh6ylGGswtHPmV0S6TlpTjuBWhr4dts0hPgy
	 RYq2/9fG1xj/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 138AB84D9A;
	Mon,  8 Jun 2026 21:21:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 01DDE2C1
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 21:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC18161C74
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 21:21:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0lr5Gd439ulc for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 21:21:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 98A1861C73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98A1861C73
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98A1861C73
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 21:21:15 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-45fd461e4a5so3375705f8f.0
 for <buildroot@buildroot.org>; Mon, 08 Jun 2026 14:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780953673; x=1781558473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NERjiYXliemjaHCn84etydKSYb3mugrDGfxrjypE8PU=;
 b=jOGSuJtpmroX4tnBu/zBvDdV76rizsYszO924D8RIsgDZSXlrybQHU//yRy3PpjTMo
 /oj3mcH7Gr6nAu49ADL3hNXqsue5lkZTyUUyNpPzpbjoq/syomqIV74fnqPXm4YdqKu1
 uFqtrICG/N2b61VPhGmWBFK8VsUhJQD4O0IipmtRjviWjb4qTZnhd+WMR1hJPAykYrvK
 7vb1kngrw1JbFKCrfa+BLxHlSVnR78bmQjvSS2i9Wv7k6jxIcj1y0HdezGMIdn9iCyWl
 iMu+NYC0LqIpw4XRj6m0icnWsrenaW4U4O+L4DO7kR2CO9NdzgfPa1xVRM7LLRRbuOcs
 BBXQ==
X-Gm-Message-State: AOJu0YwjtyK+5QVTGBCOwo/qbYeXeXHbofg4JBoMd+iWhQawAcwOs4u6
 Bn2nYENh6ZRFR2w7hhyu6s3eSeI+DmFtkDi4SOL4ctd9N9OqquGCbxU5YKVNmFCEzhlC7OQdLaW
 PC5tM
X-Gm-Gg: Acq92OH4tocyg4bCtKDfDhN6BF1SdDzpz8qXT1HjE/J+H1lHAaNN1U/y5RyoF81yUou
 MKrmWhRVTaTviisgGBzcGHn9MYTTmZfGDvVJ2i3VAfRDxmI+eM9lDljKKs2FnkU9lnpKN9kkSmx
 VJxxH047j6Wv7+0x4zF52kyLml3VGUVpV8oE1wZir8fvvxn8QQ4wdfCY995xIue96h0tFvg4xw8
 CZQOmX0X9+N4xjpknOjHT7aMXriUI6oZOE20XGjhPQ15rWlbFMAaUcmzcYJ9j/AjexS4eRBaZZb
 YOC346fAveEZhpIaIsum6DYo+s+d3n6ct+84LeCnAdpEd1Pf+RwyWQR+K9F2uNNSjLa8QLwEFwH
 8/q4C//OGjKdyTV+D2j3WpURDTAphwvWyONIs9DuTqUuR1GL8x47pFdWkxz2dFNsQYyKx0XdkL9
 J4MNEEdf1z//Bb2n/HzQd3F0MyVIYL6RvqA/CEgnzehf65o78=
X-Received: by 2002:a05:6000:4384:b0:460:3233:beea with SMTP id
 ffacd0b85a97d-4603233bfddmr15197602f8f.42.1780953673481; 
 Mon, 08 Jun 2026 14:21:13 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46028a6dce6sm48710510f8f.30.2026.06.08.14.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2026 14:21:13 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  8 Jun 2026 23:20:49 +0200
Message-ID: <20260608212054.902018-4-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608212054.902018-1-titouan.christophe@mind.be>
References: <20260608212054.902018-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780953673; x=1781558473; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NERjiYXliemjaHCn84etydKSYb3mugrDGfxrjypE8PU=;
 b=FgRuF8mAUpBoMXUoXzD/02som6e74Yyj0wDMZxbUm5rwBNJlPiF0N+WUnKgwSe31mp
 Nu5WkI7tt0P3rDWjHXK7EsxhDr4kqy2XZdqaeBDoSmcjn8e8NiWbUcmlQMeCunFBaiEc
 qeSyoOYz3fk8YryXcTQg8mNBJndlvA+GHAjRIo1YLl0YIWY7T30ro4BdZoqtxE4tyCQW
 0D4gW/4F/mKF2ffuL2ku8pMaJ/b5QUoIP7DatD9570TRIQCtoZKb5OYypM74y/Wd6GLf
 zcUmyERMBrK8y3XEqhZcfiWA/mVm7bA5qTfUSo+RR7SpN3LjzKdf6S7F4o+opWGeLVOj
 8IDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=FgRuF8mA
Subject: [Buildroot] [PATCH for 2025.02.x 3/4] package/python3: add patch
 for CVE-2026-7774
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>, thomas.perale@mind.be,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerability:

- CVE-2026-7774:
    tarfile.data_filter could be bypassed using crafted link entries,
    including symlinks with empty or directory-like names, to redirect
    later archive members outside the intended extraction directory. This
    allowed a malicious tar archive to cause tarfile.extractall() to write
    files outside the destination directory, subject to the permissions of
    the extracting process.
    https://www.cve.org/CVERecord?id=CVE-2026-7774

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...le-data_filter-validate-written-link.patch | 178 ++++++++++++++++++
 package/python3/python3.mk                    |   2 +
 2 files changed, 180 insertions(+)
 create mode 100644 package/python3/0014-tarfile-data_filter-validate-written-link.patch

diff --git a/package/python3/0014-tarfile-data_filter-validate-written-link.patch b/package/python3/0014-tarfile-data_filter-validate-written-link.patch
new file mode 100644
index 0000000000..b6337e9cbd
--- /dev/null
+++ b/package/python3/0014-tarfile-data_filter-validate-written-link.patch
@@ -0,0 +1,178 @@
+From 6df9892a802c124c4223e17c4a05ea7054166ac7 Mon Sep 17 00:00:00 2001
+From: Petr Viktorin <encukou@gmail.com>
+Date: Fri, 8 May 2026 14:16:06 +0200
+Subject: [PATCH] [3.12] gh-149486: tarfile.data_filter: validate written
+ link target (GH-149487)
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
+
+Upstream: https://github.com/python/cpython/pull/149556
+CVE: CVE-2026-7774
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ Lib/tarfile.py                                | 16 ++--
+ Lib/test/test_tarfile.py                      | 87 ++++++++++++++++++-
+ ...-05-03-21-00-00.gh-issue-149486.tarflt.rst |  5 ++
+ 3 files changed, 99 insertions(+), 9 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-05-03-21-00-00.gh-issue-149486.tarflt.rst
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index 59d3f6e5cce1650..fcb1040f2aefe29 100755
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -816,16 +816,22 @@ def _get_filtered_attrs(member, dest_path, for_data=True):
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
+index 759fa03ead70b04..fefae4b64c6182c 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -3701,10 +3701,19 @@ def test_parent_symlink(self):
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
+@@ -3978,6 +3987,76 @@ def test_sly_relative2(self):
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
+index 000000000000000..7c69edb683cf80a
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-05-03-21-00-00.gh-issue-149486.tarflt.rst
+@@ -0,0 +1,5 @@
++:func:`tarfile.data_filter` now validates link targets using the same
++normalised value that is written to disk, strips trailing separators from
++the member name when resolving a symlink's directory, and rejects link
++members that would replace the destination directory itself. This closes
++several path-traversal bypasses of the ``data`` extraction filter.
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 0881625ea3..96be4bd651 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -15,6 +15,8 @@ PYTHON3_CPE_ID_PRODUCT = python
 
 # 0013-Fix-O-n-2-canonical-ordering-in-unicodedata-normalize.patch
 PYTHON3_IGNORE_CVES += CVE-2026-3276
+# 0014-tarfile-data_filter-validate-written-link.patch
+PYTHON3_IGNORE_CVES += CVE-2026-7774
 
 # This host Python is installed in $(HOST_DIR), as it is needed when
 # cross-compiling third-party Python modules.
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
