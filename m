Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8048CD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB139411AE;
	Fri, 12 Jun 2026 11:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8vM-fgESgy-H; Fri, 12 Jun 2026 11:37:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0309B40657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264220;
	bh=jTnLh2E7MxjsDWLOPfrJ1CoXn71/T+Fp+TiZAopxM+g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Si6uLDaJ/e1vDQ/6W/8Wt82TN0KZjgu0RuNkFjter3Mt2G0/yqggbLZ7DtS8unSpK
	 yOF26oKd1i1O/TS7xZaFP2aim1F7jMatQgM+4XcymklBEAtli4PSDuUsuP8iMY0zgn
	 vY8BVBoOv2RyRmSprBGyeDXyglv+MLM55qj/mZc4UY3rqsD6phbnK2fSUpBnfzlBcq
	 RGjC2/RTvZkVgNwg0KXCFqiwIws4md7RjERlYFLo2kjtXkuLNsU3154zJ2qxz49Hoa
	 rxuvYeoNPlGjQ9ZUvul8lN5UI0adUXZmsCx8DT5t8kRNRuue8kAr6edGzwDbHaZSx4
	 VrHMWmnCnm7XQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0309B40657;
	Fri, 12 Jun 2026 11:37:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DB817237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9E7260F9A
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TZLrQT34LNkB for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:36:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 958F660F7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 958F660F7A
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 958F660F7A
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:36:53 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-490b4a8e28bso6406985e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264211; x=1781869011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EdhfbB60UqgonQHFGwnrSbePxjrlf+NqNBi+kid6zTI=;
 b=pItXExThjS6ia8LUrrW+NdJ53hjeR+g8EDZqxwT44IRrJuD12iFi2PfOnf/6kc5Peq
 tPSsO1cBOQKumRxF3iJLW4oVJeYklQ98ydUYyXUXIi4CE7uU9/QGtmMv1qNWDpJoYMPo
 IDTFntFH8ZlpvHN+s+tX5rZLJ2gTerixOd6a+NCY5swUwKSvlqvHYHF+VdBvB2i5lV6r
 ntE39ON+mq8PASpwZDY4IdZqwwlxfSY1tok0XHUZR78RTA+LR8tZUg6434vgcc+IPDMD
 9ZcYeMJiMBpT5/GV3PtWkdjC98gKBg0I+OjoNMbNxfB0O3WTyxHZWD23C+Ty6w9mAQxF
 VD1w==
X-Forwarded-Encrypted: i=1;
 AFNElJ+xIaRB8VDLGMyHxe4QozcsA7FBbhgv6Q5DKMuAi4FyRF+GQlKLSFbsbitwYiOOC6U6kBGFuB3ecsw=@buildroot.org
X-Gm-Message-State: AOJu0YzVUWhf0isFPsJZlvv1flgRrux5Fo2Y98fiW5slLZixfFLHXZOH
 6VvGJdJA2W3s5qf0eqmAZSYG/yiZhEirFge2XXkXQsWpp+4fPUT93CEbHYE7AkaIaLI=
X-Gm-Gg: Acq92OEryjeo8pIw/uydiMYkAbyFjWvF8hdosN4HHan/7Fyzr7MgSzEkQFtB/2NUwgQ
 JsHzVXB5xu8DxJyf1E6WQ5+QyN4qB7PVozgQ44HJF5DHnLQA8hyfTbnJ8cQlWuK1633fcdKC1E+
 RRrf+Mxd3XTy/9EJgqT8i5TvM2X2+7plnZLPSXpR2N4ZRbOJh3EMo0wnYbr18KuszyRKxnod9tO
 YGxqDkujI77yToOUL0Wp8UNy2R9/bmEiTSYKcdxaG/s37c+46QKhx9eXJ2Dp78wmULARenV1hxj
 W69M0U5zlVCxskhKqDgqW4HzsBC1VRsw9/hOkbBG46McaVxJzNd5cJ85jZv2lzx9HRO/2NkHCk9
 82t+N5jAV8Lu88MKdheHafOyXtVYDPlFN3pHr6FvjEiwdYMyYn6xlHB1YE/dSQVb4tljl2Xa3hQ
 TcdyNCIvNYOGZLFZU=
X-Received: by 2002:a05:600d:6452:20b0:490:bc46:1a58 with SMTP id
 5b1f17b1804b1-490ec4fb6d6mr22349205e9.18.1781264211255; 
 Fri, 12 Jun 2026 04:36:51 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea4a128csm72395185e9.0.2026.06.12.04.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:36:50 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:36:50 +0200
Message-ID: <20260612113650.250831-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608212054.902018-4-titouan.christophe@mind.be>
References: <20260608212054.902018-4-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264211; x=1781869011; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EdhfbB60UqgonQHFGwnrSbePxjrlf+NqNBi+kid6zTI=;
 b=DlTJDiV+m7tSEbZ0Hiq/4zaBkHPBA87uUNpRB6uWqXzn/ylO7Wko3ezewCGyc9Mray
 S/WUAamvvzHXG7HGb9Xvs8FU0onvU6IcFyH+06ZOOp5L3DYwjsNmF0eM7lQ9fml4GYLM
 v+4ybNTePKX27fJq5ZlJTp1hX1i8xpfcQfNl9d+CfH5zueywi2Np81CtS5kpXPaIu6NR
 SU6Y/hRd5iuPiKPoLu6LQWof0COpk2PLFjQVoeHhnDGtPK2TxIJDN+IquX8Vp3QxGDO2
 bD7QwWygs8rlS3HZhTk6S/ZU3TcgnNbaTD30g6LPt3Lc3cZqsYaKF1/oFvepFR5KsER3
 qnIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DlTJDiV+
Subject: Re: [Buildroot] [PATCH for 2025.02.x 3/4] package/python3: add
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> This fixes the following vulnerability:
> 
> - CVE-2026-7774:
>     tarfile.data_filter could be bypassed using crafted link entries,
>     including symlinks with empty or directory-like names, to redirect
>     later archive members outside the intended extraction directory. This
>     allowed a malicious tar archive to cause tarfile.extractall() to write
>     files outside the destination directory, subject to the permissions of
>     the extracting process.
>     https://www.cve.org/CVERecord?id=CVE-2026-7774
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  ...le-data_filter-validate-written-link.patch | 178 ++++++++++++++++++
>  package/python3/python3.mk                    |   2 +
>  2 files changed, 180 insertions(+)
>  create mode 100644 package/python3/0014-tarfile-data_filter-validate-written-link.patch
> 
> diff --git a/package/python3/0014-tarfile-data_filter-validate-written-link.patch b/package/python3/0014-tarfile-data_filter-validate-written-link.patch
> new file mode 100644
> index 0000000000..b6337e9cbd
> --- /dev/null
> +++ b/package/python3/0014-tarfile-data_filter-validate-written-link.patch
> @@ -0,0 +1,178 @@
> +From 6df9892a802c124c4223e17c4a05ea7054166ac7 Mon Sep 17 00:00:00 2001
> +From: Petr Viktorin <encukou@gmail.com>
> +Date: Fri, 8 May 2026 14:16:06 +0200
> +Subject: [PATCH] [3.12] gh-149486: tarfile.data_filter: validate written
> + link target (GH-149487)
> +
> +The data filter rewrote linknames with normpath() but ran the
> +containment check against the un-normalised value, and computed a
> +symlink's directory before stripping trailing slashes.  Both let a
> +crafted archive create links pointing outside the destination.  Also
> +reject link members that resolve to the destination directory itself,
> +which could otherwise replace it with a symlink and redirect all
> +subsequent members.
> +
> +(Patch by Greg; Petr's just reviewing & merging.)
> +(cherry picked from commit 578411982c16f753f4893532510099ef665117da)
> +
> +Co-authored-by: Petr Viktorin <encukou@gmail.com>
> +Co-authored-by: Gregory P. Smith <greg@krypto.org>
> +
> +Upstream: https://github.com/python/cpython/pull/149556
> +CVE: CVE-2026-7774
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + Lib/tarfile.py                                | 16 ++--
> + Lib/test/test_tarfile.py                      | 87 ++++++++++++++++++-
> + ...-05-03-21-00-00.gh-issue-149486.tarflt.rst |  5 ++
> + 3 files changed, 99 insertions(+), 9 deletions(-)
> + create mode 100644 Misc/NEWS.d/next/Security/2026-05-03-21-00-00.gh-issue-149486.tarflt.rst
> +
> +diff --git a/Lib/tarfile.py b/Lib/tarfile.py
> +index 59d3f6e5cce1650..fcb1040f2aefe29 100755
> +--- a/Lib/tarfile.py
> ++++ b/Lib/tarfile.py
> +@@ -816,16 +816,22 @@ def _get_filtered_attrs(member, dest_path, for_data=True):
> +         if member.islnk() or member.issym():
> +             if os.path.isabs(member.linkname):
> +                 raise AbsoluteLinkError(member)
> ++            # A link member that resolves to the destination directory itself
> ++            # would replace it with a (sym)link, redirecting the destination
> ++            # for all subsequent members.
> ++            if target_path == dest_path:
> ++                raise OutsideDestinationError(member, target_path)
> +             normalized = os.path.normpath(member.linkname)
> +             if normalized != member.linkname:
> +                 new_attrs['linkname'] = normalized
> +             if member.issym():
> +-                target_path = os.path.join(dest_path,
> +-                                           os.path.dirname(name),
> +-                                           member.linkname)
> ++                # The symlink is created at `name` with trailing separators
> ++                # stripped, so its target is relative to the directory
> ++                # containing that path.
> ++                link_dir = os.path.dirname(name.rstrip('/' + os.sep))
> ++                target_path = os.path.join(dest_path, link_dir, normalized)
> +             else:
> +-                target_path = os.path.join(dest_path,
> +-                                           member.linkname)
> ++                target_path = os.path.join(dest_path, normalized)
> +             target_path = os.path.realpath(target_path,
> +                                            strict=os.path.ALLOW_MISSING)
> +             if os.path.commonpath([target_path, dest_path]) != dest_path:
> +diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
> +index 759fa03ead70b04..fefae4b64c6182c 100644
> +--- a/Lib/test/test_tarfile.py
> ++++ b/Lib/test/test_tarfile.py
> +@@ -3701,10 +3701,19 @@ def test_parent_symlink(self):
> +                     + "which is outside the destination")
> + 
> +             with self.check_context(arc.open(), 'data'):
> +-                self.expect_exception(
> +-                    tarfile.LinkOutsideDestinationError,
> +-                    """'parent' would link to ['"].*outerdir['"], """
> +-                    + "which is outside the destination")
> ++                if self.dotdot_resolves_early:
> ++                    # 'current/../..' normalises to '..', which is rejected.
> ++                    self.expect_exception(
> ++                        tarfile.LinkOutsideDestinationError,
> ++                        """'parent' would link to ['"].*outerdir['"], """
> ++                        + "which is outside the destination")
> ++                else:
> ++                    # 'current/..' normalises to '.'; the rewritten link is
> ++                    # created and 'parent/evil' lands harmlessly inside the
> ++                    # destination.
> ++                    self.expect_file('current', symlink_to='.')
> ++                    self.expect_file('parent', symlink_to='.')
> ++                    self.expect_file('evil')
> + 
> +         else:
> +             # No symlink support. The symlinks are ignored.
> +@@ -3978,6 +3987,76 @@ def test_sly_relative2(self):
> +                     + """['"].*moo['"], which is outside the """
> +                     + "destination")
> + 
> ++    @symlink_test
> ++    @os_helper.skip_unless_symlink
> ++    def test_normpath_realpath_mismatch(self):
> ++        # The link-target check must validate the value that will actually
> ++        # be written to disk (the normalised linkname), not the original.
> ++        # Here 'a' is a symlink to a deep nonexistent path, so realpath()
> ++        # of 'a/../../...' stays inside the destination while normpath()
> ++        # collapses 'a/..' lexically and escapes.
> ++        depth = len(self.destdir.parts) + 5
> ++        deep = '/'.join(f'p{i}' for i in range(depth))
> ++        sneaky = 'a/' + '../' * depth + 'flag'
> ++        for kind in 'symlink_to', 'hardlink_to':
> ++            with self.subTest(kind):
> ++                with ArchiveMaker() as arc:
> ++                    arc.add('a', symlink_to=deep)
> ++                    arc.add('escape', **{kind: sneaky})
> ++                with self.check_context(arc.open(), 'data'):
> ++                    self.expect_exception(
> ++                        tarfile.LinkOutsideDestinationError)
> ++
> ++    @symlink_test
> ++    @os_helper.skip_unless_symlink
> ++    def test_symlink_trailing_slash(self):
> ++        # A trailing slash on a symlink member's name must not cause the
> ++        # link target to be resolved relative to the wrong directory.
> ++        with ArchiveMaker() as arc:
> ++            t = tarfile.TarInfo('x/')
> ++            t.type = tarfile.SYMTYPE
> ++            t.linkname = '..'
> ++            arc.tar_w.addfile(t)
> ++            arc.add('x/escaped', content='hi')
> ++
> ++        with self.check_context(arc.open(), 'data'):
> ++            self.expect_exception(tarfile.LinkOutsideDestinationError)
> ++
> ++    @symlink_test
> ++    @os_helper.skip_unless_symlink
> ++    def test_link_at_destination(self):
> ++        # A link member whose name resolves to the destination directory
> ++        # itself must be rejected: otherwise the destination is replaced
> ++        # by a symlink and later members can be redirected through it.
> ++        for name in '', '.', './':
> ++            with ArchiveMaker() as arc:
> ++                t = tarfile.TarInfo(name)
> ++                t.type = tarfile.SYMTYPE
> ++                t.linkname = '.'
> ++                arc.tar_w.addfile(t)
> ++
> ++            with self.check_context(arc.open(), 'data'):
> ++                self.expect_exception(tarfile.OutsideDestinationError)
> ++
> ++    @symlink_test
> ++    @os_helper.skip_unless_symlink
> ++    def test_empty_name_symlink_chain(self):
> ++        # Regression test for a chain of empty-named symlinks that
> ++        # incrementally redirects the destination outwards.
> ++        with ArchiveMaker() as arc:
> ++            for name, target in [('', ''), ('a/', '..'),
> ++                                 ('', 'dummy'), ('', 'a'),
> ++                                 ('b/', '..'),
> ++                                 ('', 'dummy'), ('', 'a/b')]:
> ++                t = tarfile.TarInfo(name)
> ++                t.type = tarfile.SYMTYPE
> ++                t.linkname = target
> ++                arc.tar_w.addfile(t)
> ++            arc.add('escaped', content='hi')
> ++
> ++        with self.check_context(arc.open(), 'data'):
> ++            self.expect_exception(tarfile.FilterError)
> ++
> +     @symlink_test
> +     def test_deep_symlink(self):
> +         # Test that symlinks and hardlinks inside a directory
> +diff --git a/Misc/NEWS.d/next/Security/2026-05-03-21-00-00.gh-issue-149486.tarflt.rst b/Misc/NEWS.d/next/Security/2026-05-03-21-00-00.gh-issue-149486.tarflt.rst
> +new file mode 100644
> +index 000000000000000..7c69edb683cf80a
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2026-05-03-21-00-00.gh-issue-149486.tarflt.rst
> +@@ -0,0 +1,5 @@
> ++:func:`tarfile.data_filter` now validates link targets using the same
> ++normalised value that is written to disk, strips trailing separators from
> ++the member name when resolving a symlink's directory, and rejects link
> ++members that would replace the destination directory itself. This closes
> ++several path-traversal bypasses of the ``data`` extraction filter.
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 0881625ea3..96be4bd651 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -15,6 +15,8 @@ PYTHON3_CPE_ID_PRODUCT = python
>  
>  # 0013-Fix-O-n-2-canonical-ordering-in-unicodedata-normalize.patch
>  PYTHON3_IGNORE_CVES += CVE-2026-3276
> +# 0014-tarfile-data_filter-validate-written-link.patch
> +PYTHON3_IGNORE_CVES += CVE-2026-7774
>  
>  # This host Python is installed in $(HOST_DIR), as it is needed when
>  # cross-compiling third-party Python modules.
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
