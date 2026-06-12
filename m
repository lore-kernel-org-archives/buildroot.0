Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91FFCD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BC1A611F1;
	Fri, 12 Jun 2026 11:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHwyhs5tYusa; Fri, 12 Jun 2026 11:37:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDA366107A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264240;
	bh=QS+iBM9gXRhhr4rGJHdIgkggDkJxBE/r6wDXa4fbyr0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y++V72uvxE0VqAKMH9h6JdlAN0+XbD6s3IB46Piq+F5Fs2LBMLKfA/kFL7OIWiXym
	 CEvJuFZ2/MGAx2a5JP3izHJtRWCjACxVsfbF0dVbfd5ZVJmWUosP7s5anTsTUT1K67
	 sMxGaZJCE4rYeztcfdlFi4TK4GXuToCDrS+f4iEVLHbyKRHQZEG0Kkt44BzbhnO8tO
	 /V2QvbjDDhjWve/o8wLrgKYb5hCxiLo0WP/rlHBRJZ+2Zsiv5VaGYPz8eq3oUjZYSd
	 UXvHuqWn1pgzGf+w5kB7TtphdMvd5BSUDQy32oJQHKb5l74QjP9uy8DQM16OKcA+Uj
	 GXhZKaeIcxRuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDA366107A;
	Fri, 12 Jun 2026 11:37:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AE3F812F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A018F4067C
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v2ARfiQsgxzo for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:37:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 24FA74066F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24FA74066F
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24FA74066F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:13 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-490abf12f0fso4940035e9.0
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264232; x=1781869032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=X62m05p62/lSUOeBKzlcGN+g4rN8QhnWgqi88/75hL0=;
 b=LIT+0I4ATVGfvU7CDUHdpDSKNXeQfafkRstvUlb7rFW730XQdXGr2om/atytpUL44y
 ahKAHJO4RfF6OZs5Do6GFX0+aAqBGPWVbhQKCwjwfFZYYzp/wrSCkbBqfv/98bw/Ft+l
 vJ8NMKwI6LJtbREF/vgi9Jzu69GtDGLezP7bJ7JmaApB6kHOriwinRZd0hLTvnSZH6xo
 2Nji1c586lP0TsvxDqCcH7edv99ItPxen5jELxQ4DYkSQLuPF2iO8pTXOI0YDmRja8ts
 oVIVYiBscosdImltCS7Rxj0c4DCEAHoMUsv3Nm5IiKAnPi6Y2icDU7H5uPMvMGJQyhXr
 ep9g==
X-Forwarded-Encrypted: i=1;
 AFNElJ8zwRzCwg0UW33qKbt6Bw6ddz4NLmWSam2mrQ9X2uoVHDoYybvWIHAz1hLNFQcQ7G8rZVPMeDRa+wc=@buildroot.org
X-Gm-Message-State: AOJu0YxzstPMNxUB8QEkgXJqfuQ+Y585t/gI2Aar/+2J/Cs+NKNPYDQK
 SUOl0pa41/1bjMROY1LVAn8qM0Uv5b16wbB7sIQq9GhX2u0UW1BDjhrw4RVzPEnXoVDWs+6muSG
 VYdc3
X-Gm-Gg: Acq92OEmbv9YyYCMjnCM4RdQ5ErVCCIbfy5mFhl2lwVlURHzjRqeEDldOMPyyPlYDVi
 ofL7OnKv11ganlNueHxvBCWLMzgcjK67tqrQIBrsFgF14hsD9h1i1PLsNK/gnMXBbuquxP1zXjV
 Ko93y06dBEZVWSTBHoNCdzJWlhd1pCboDIkPYH07vCTGoxdiMKy1maLD0i84ojCbDBE2XzwURK0
 t7/IMv4/cOuy4+QZIJ1mMV0LfyuL2nb7jD2iMjun8uqR1kmMbgWfjsT2/m9IMXY69+mwBI8GzkG
 f3AwCf5zJgnNXnCOl7orAJiOtbKjFvPHKrgfTahlzzaBsHK0Youqrwi3KbdjeX5js9dvL8EU6aj
 ddTzV4aN7QikZKXjX5Zbw6dwNXd8yLuq3ttcufPmSAsm9D94gCTYcsgUUYXbZUgqjOdi5wpg8Hz
 5BQSsLrJ0nTPIDqc8=
X-Received: by 2002:a05:600c:820c:b0:490:b4cb:3866 with SMTP id
 5b1f17b1804b1-490ec4d77a4mr23953205e9.10.1781264231886; 
 Fri, 12 Jun 2026 04:37:11 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea963cf8sm39154335e9.2.2026.06.12.04.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:37:11 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:37:10 +0200
Message-ID: <20260612113710.251522-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604173707.2135315-1-bernd@kuhls.net>
References: <20260604173707.2135315-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264232; x=1781869032; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X62m05p62/lSUOeBKzlcGN+g4rN8QhnWgqi88/75hL0=;
 b=bmwMkWz7T992LMKZ8gP3AUou7awaVXQf0j7m6+McoIbWIf7Suj4jluiFTsvSDrzmgl
 /AqP4AUbjfBmJrboSHDFlRvq6xvqU/Ag1xffmk078aPPjYO/8ov8EJ0CbTvsJ6VKsNIF
 Mrc31L9SX0YRb70DwNZjMpdaJt29ISTehk4mYIkwK9xasQf8jx+wKNDdPu5K8/LuhVW6
 wb5tlZf2TL8wQvEuCnCFSYAHliXR11GmZN1uJjTLbdNDaOh+KuzbiPGMV6xBc1Hj5OTO
 GENG/5LjsW+k7x4NnDpupzxDuVLsYirmjbldu9xPDFsQ+/4iQoStta5d4/RjpojsVZHu
 C2Zw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bmwMkWz7
Subject: Re: [Buildroot] [PATCH 1/2] package/python3: add upstream security
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
> https://mail.python.org/archives/list/security-announce@python.org/thread/4FU62L2M6RMMHT2QPGQNPEHHUND7CEX5/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
> Series passed Gitlab pipeline:
> https://gitlab.com/bkuhls/buildroot/-/commits/5b4549fd52313aa0caa2dbb919a8b98c11ab5768
> 
>  ...arfile.data_filter-validate-written-.patch | 268 ++++++++++++++++++
>  package/python3/python3.mk                    |   3 +
>  2 files changed, 271 insertions(+)
>  create mode 100644 package/python3/0012-3.14-gh-149486-tarfile.data_filter-validate-written-.patch
> 
> diff --git a/package/python3/0012-3.14-gh-149486-tarfile.data_filter-validate-written-.patch b/package/python3/0012-3.14-gh-149486-tarfile.data_filter-validate-written-.patch
> new file mode 100644
> index 0000000000..94377fb832
> --- /dev/null
> +++ b/package/python3/0012-3.14-gh-149486-tarfile.data_filter-validate-written-.patch
> @@ -0,0 +1,268 @@
> +From 74cca9a92fb7d653e404843a56b8bdc7b0afdbbf Mon Sep 17 00:00:00 2001
> +From: "Miss Islington (bot)"
> + <31488909+miss-islington@users.noreply.github.com>
> +Date: Mon, 11 May 2026 11:57:50 +0200
> +Subject: [PATCH] [3.14] gh-149486: tarfile.data_filter: validate written link
> + target (GH-149487) (GH-149554)
> +
> +* gh-149486: tarfile.data_filter: validate written link target (GH-149487)
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
> +Upstream: https://github.com/python/cpython/commit/74cca9a92fb7d653e404843a56b8bdc7b0afdbbf
> +CVE: CVE-2026-7774
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + Lib/tarfile.py                                |  16 +-
> + Lib/test/test_tarfile.py                      | 151 ++++++++++++++----
> + ...-05-03-21-00-00.gh-issue-149486.tarflt.rst |   5 +
> + 3 files changed, 133 insertions(+), 39 deletions(-)
> + create mode 100644 Misc/NEWS.d/next/Security/2026-05-03-21-00-00.gh-issue-149486.tarflt.rst
> +
> +diff --git a/Lib/tarfile.py b/Lib/tarfile.py
> +index 414aefe9744..a9eca7579ef 100644
> +--- a/Lib/tarfile.py
> ++++ b/Lib/tarfile.py
> +@@ -830,16 +830,22 @@ def _get_filtered_attrs(member, dest_path, for_data=True):
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
> +index 8d9f8824f7c..837b6aa8c03 100644
> +--- a/Lib/test/test_tarfile.py
> ++++ b/Lib/test/test_tarfile.py
> +@@ -3682,6 +3682,39 @@ class TestExtractionFilters(unittest.TestCase):
> +     # The destination for the extraction, within `outerdir`
> +     destdir = outerdir / 'dest'
> + 
> ++    @classmethod
> ++    def setUpClass(cls):
> ++        # Posix and Windows have different pathname resolution:
> ++        # either symlink or a '..' component resolve first.
> ++        # Let's see which we are on.
> ++        if os_helper.can_symlink():
> ++            testpath = os.path.join(TEMPDIR, 'resolution_test')
> ++            os.mkdir(testpath)
> ++
> ++            # testpath/current links to `.` which is all of:
> ++            #   - `testpath`
> ++            #   - `testpath/current`
> ++            #   - `testpath/current/current`
> ++            #   - etc.
> ++            os.symlink('.', os.path.join(testpath, 'current'))
> ++
> ++            # we'll test where `testpath/current/../file` ends up
> ++            with open(os.path.join(testpath, 'current', '..', 'file'), 'w'):
> ++                pass
> ++
> ++            if os.path.exists(os.path.join(testpath, 'file')):
> ++                # Windows collapses 'current\..' to '.' first, leaving
> ++                # 'testpath\file'
> ++                cls.dotdot_resolves_early = True
> ++            elif os.path.exists(os.path.join(testpath, '..', 'file')):
> ++                # Posix resolves 'current' to '.' first, leaving
> ++                # 'testpath/../file'
> ++                cls.dotdot_resolves_early = False
> ++            else:
> ++                raise AssertionError('Could not determine link resolution')
> ++        else:
> ++            cls.dotdot_resolves_early = False
> ++
> +     @contextmanager
> +     def check_context(self, tar, filter, *, check_flag=True):
> +         """Extracts `tar` to `self.destdir` and allows checking the result
> +@@ -3853,10 +3886,19 @@ def test_parent_symlink(self):
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
> +@@ -3946,35 +3988,6 @@ def test_parent_symlink2(self):
> +         # Test interplaying symlinks
> +         # Inspired by 'dirsymlink2b' in jwilk/traversal-archives
> + 
> +-        # Posix and Windows have different pathname resolution:
> +-        # either symlink or a '..' component resolve first.
> +-        # Let's see which we are on.
> +-        if os_helper.can_symlink():
> +-            testpath = os.path.join(TEMPDIR, 'resolution_test')
> +-            os.mkdir(testpath)
> +-
> +-            # testpath/current links to `.` which is all of:
> +-            #   - `testpath`
> +-            #   - `testpath/current`
> +-            #   - `testpath/current/current`
> +-            #   - etc.
> +-            os.symlink('.', os.path.join(testpath, 'current'))
> +-
> +-            # we'll test where `testpath/current/../file` ends up
> +-            with open(os.path.join(testpath, 'current', '..', 'file'), 'w'):
> +-                pass
> +-
> +-            if os.path.exists(os.path.join(testpath, 'file')):
> +-                # Windows collapses 'current\..' to '.' first, leaving
> +-                # 'testpath\file'
> +-                dotdot_resolves_early = True
> +-            elif os.path.exists(os.path.join(testpath, '..', 'file')):
> +-                # Posix resolves 'current' to '.' first, leaving
> +-                # 'testpath/../file'
> +-                dotdot_resolves_early = False
> +-            else:
> +-                raise AssertionError('Could not determine link resolution')
> +-
> +         with ArchiveMaker() as arc:
> + 
> +             # `current` links to `.` which is both the destination directory
> +@@ -4010,7 +4023,7 @@ def test_parent_symlink2(self):
> + 
> +         with self.check_context(arc.open(), 'data'):
> +             if os_helper.can_symlink():
> +-                if dotdot_resolves_early:
> ++                if self.dotdot_resolves_early:
> +                     # Fail when extracting a file outside destination
> +                     self.expect_exception(
> +                             tarfile.OutsideDestinationError,
> +@@ -4130,6 +4143,76 @@ def test_sly_relative2(self):
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
> +index 00000000000..7c69edb683c
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2026-05-03-21-00-00.gh-issue-149486.tarflt.rst
> +@@ -0,0 +1,5 @@
> ++:func:`tarfile.data_filter` now validates link targets using the same
> ++normalised value that is written to disk, strips trailing separators from
> ++the member name when resolving a symlink's directory, and rejects link
> ++members that would replace the destination directory itself. This closes
> ++several path-traversal bypasses of the ``data`` extraction filter.
> +-- 
> +2.47.3
> +
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 61fab7e350..e14ddf4f20 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -16,6 +16,9 @@ PYTHON3_CPE_ID_PRODUCT = python
>  # 0011-3.14-gh-149079-Fix-O-n-2-canonical-ordering-in-unico.patch
>  PYTHON3_IGNORE_CVES += CVE-2026-3276
>  
> +# 0012-3.14-gh-149486-tarfile.data_filter-validate-written-.patch
> +PYTHON3_IGNORE_CVES += CVE-2026-7774
> +
>  # This host Python is installed in $(HOST_DIR), as it is needed when
>  # cross-compiling third-party Python modules.
>  
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
