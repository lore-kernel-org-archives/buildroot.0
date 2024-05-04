Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C56C10F1A
	for <buildroot@archiver.kernel.org>; Sat,  4 May 2024 21:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F5C841EA7;
	Sat,  4 May 2024 21:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id svteXWPKadgo; Sat,  4 May 2024 21:41:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8742241E6C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8742241E6C;
	Sat,  4 May 2024 21:41:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A1911BF86B
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3E3441587
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LatkMgRxxZ4j for <buildroot@lists.busybox.net>;
 Sat,  4 May 2024 21:40:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 886B44155E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 886B44155E
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 886B44155E
 for <buildroot@buildroot.org>; Sat,  4 May 2024 21:40:33 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-34ef66c0178so81408f8f.1
 for <buildroot@buildroot.org>; Sat, 04 May 2024 14:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714858831; x=1715463631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IPX6KIsyV9LEIkFtfzJegTKrmePl93FNsXqmcb274bM=;
 b=n51wU7qrLkUv/3j5t4GH+AqcLsLYG+LlN+2ivrDmcIYpWf5rsyVaVZ1AhJqEj6sJAt
 GuTqXlazeoSUVWwuAXVsaJeET1SE0r5QHObbMIMPUSLUNDM/+S4kGK7Z6oseH0+2yXit
 qtNucLz94dA9Yw0SE9Jmr+mUa36NZK8Qqui53B+lA97MGFDMntp81YD+pEVzRUkuVKUX
 yead8qlveMusAqEcDd4zhcZ4+8ug7sCRKit96pnuWDX83IzsqhKHbpS9Gi46P6ZpSzpy
 BtsImUFI4TS5nsipBwmZlt3He1f7mrLJv7IOm332iYmkQFAL9bglPzpI/PSdPqkcJUoa
 hNQQ==
X-Gm-Message-State: AOJu0Yx2gJjFa0M851la4znKfWso8l+1evPzLnzqeMac9I95gTXo/3+U
 H3UKyRUFu/J/86vpxFjzvmUZ5UWj6QnWUybrHWysfvmqhMrYTtQM/obVpw==
X-Google-Smtp-Source: AGHT+IHyMIfQuZqAgeetSrFYC0y7upcTlyp+5fD91rRpxB3cA37Ui3S29GSsigLReBKdqzhNtiqAEg==
X-Received: by 2002:adf:e6c2:0:b0:34d:7def:a2 with SMTP id
 y2-20020adfe6c2000000b0034d7def00a2mr5364071wrm.68.1714858831522; 
 Sat, 04 May 2024 14:40:31 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b0041b43d2d745sm10464230wmq.7.2024.05.04.14.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 May 2024 14:40:31 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  4 May 2024 23:40:12 +0200
Message-ID: <4adbe48574f1868fa89446a101999cd5262f775f.1714858818.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714858818.git.yann.morin.1998@free.fr>
References: <cover.1714858818.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714858831; x=1715463631; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IPX6KIsyV9LEIkFtfzJegTKrmePl93FNsXqmcb274bM=;
 b=bs4buw2qoFvEjlOys2uS8cRbREq+tmfSRKacowGA23WMe7Ni/TGlfvdZA2N5lwgxuM
 CgxA88ytsP/59soHYhH+3E2VA4ONhJ/gPiJ2jDcCwOkvZzmCQEMwBmRIqDyhXyAfqYsU
 acVLbSxFoFpIr/NSU2nIftJk+n5f9W3XYxuV9gd0JpEyOb98ySQ5kTxdfOXohfuhVsnV
 XVclw4FbboGjH9FUXaqBKP9P2acdpDkKM7DcXTAz+Dxt1CQZWMH1dyYmqKvfOU+KqRN5
 AyYC0+R08m4kzWZ2ZaGcMkZ20gnDc9EOFkthSaY0RQs/thM87UIBZcHNEqxImuPAEzWF
 vYGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bs4buw2q
Subject: [Buildroot] [PATCH 11/22 v3] support/download: even more
 reproducible archives (until next time)
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, when we generate archives, we rely on a few assumptions and
mechanisms to ensure reproducilibity. So far, we mostly accounted for
the content (i.e. content, filenames, and path) of the files we
archived, and this is OK (git and svn should provide reproducilbe
content by design, and cargo and go vendoring are also supposed to be
generating reproducible content.

However, tarballs do not only contain the content of the files; they
also have a few metadata about those files. Beyond filenames and paths,
which are already reproducible, there is the timestamp, the user and
group name and ID. Those are also accounted for and made reproducible.

The final touch (so far!) is that files have access rights (aka mode),
and those too are stored in tarballs. So far we accounted for those by
ensuring that Buildroot would always run under a known umask, thus
generating files with reproducible modes.

That falls short in one case that we did not envision, though: a shared
download directory, where extended attributes are set to provide a
default ACL that is permissive, to allow two or more users (with
different uid and gid) to all read and write to such a directory. This
is trivially achieved with something like:

    $ mkdir -p "${BR2_DL_DIR}"
    $ setfacl -m 'default:user::rwx' "${BR2_DL_DIR}"
    $ setfacl -m 'default:group::rwx' "${BR2_DL_DIR}"
    $ setfacl -m 'default:other::rwx' "${BR2_DL_DIR}"

This has the effect that:

  - files below BR2_DL_DIR are all set with user, group, and world read
    and write access,
  - files executable by the owner will also be group and world
    executable,
  - directories are user, group, and world readable, writable, and
    searchable.

This means that all the archives we generate from files in BR2_DL_DIR
will have modes that are different from those generated on other systems,
where only the traditional umask is used.

There are various solutions to solve that issue:

  - detect the situation and abort: that's not nice, because users have
    a legitimiate reason to want to share that directory,

  - find a solution for each affected download mechanism: git, svn, hg,
    cvs, bzr... and for each of the affected vendoring mechanism: go and
    cargo [0]; this is not nice, because it means a lot of repetition,
    with the risk that they diverge over time (e.g. one is fixed for a
    newer issue, while the others are left out due to an oversight...)

  - find a single, common solution that works in all cases, whatever the
    download mechanism and/or vendoring: this is the best, because we
    can extend and fix it once and everything else benefits from it.

We obviously go for the third option.

The common solution is rather simple. When creating the tarball in
support/download/helpers, give an option to tar to set the group and
other permissions to those of the user, but without write permission.

This implies that we must bump the version-suffix for the download
backends [1] and for the vendoring post-processes. It also implies that
the hash may change, under the following circumstances:

- Symlinks normally have permissions 0777 (because symlink permissions
  are in fact meaningless). They will now have permission 0755 in the
  tarball.
- If the original tarball (for vendored go and cargo packages) contained
  files that are readable or executable by owner but not by group or
  other, they will now be readable resp. executable by group and other
  too. Note that for writeable it is not the case, because those were
  already handled by our 0022 umask (which makes them not writeable by
  group and other).

Because the hash may change, we need to update the BR_FMT_VERSION for
everything that creates tarballs. Go and cargo didn't have one up to
now, the the previous commit added the possibility to give one. The ones
for git and svn have to be updated. Since it is now possible to have a
suffix for both the VCS and the post-processing, change the suffix to
something more descriptive than "-brX", i.e. -git3 for git, -go1 for
golang, etc.

The hash updates and filename changes will be handled in a follow-up
commit.

[0] Note however that the vendoring is currently not done in a
sub-directory of BR2_DL_DIR, but the cargo and go caches are located
there. Files that get copied from there to the vendoring area would be
tainted as well, and thus we want to address that situation as well.

[1] we currently do not have a CVS version suffix, because we do not
guarantee the reproducilibity of CVS archives (we can't); for hg, we are
currently using hg's own archive tool, and presumably that does not have
the mode issue because it is not using the checked-out files. Still,
doing the mode fix in a single location will help extend those two
backends in the future (if that ever happens...).

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-download.mk  | 8 +++++---
 support/download/helpers | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 9047e99f86..61e565b002 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -19,9 +19,11 @@ export SFTP := $(call qstrip,$(BR2_SFTP))
 export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 # Version of the format of the archives we generate in the corresponding
-# download backend:
-BR_FMT_VERSION_git = -br2
-BR_FMT_VERSION_svn = -br3
+# download backend and post-process:
+BR_FMT_VERSION_git = -git3
+BR_FMT_VERSION_svn = -svn4
+BR_FMT_VERSION_go = -go1
+BR_FMT_VERSION_cargo = -cargo1
 
 DL_WRAPPER = support/download/dl-wrapper
 
diff --git a/support/download/helpers b/support/download/helpers
index 90a7d6c1ec..823e4d2f91 100755
--- a/support/download/helpers
+++ b/support/download/helpers
@@ -61,7 +61,7 @@ mk_tar_gz() {
     # Create POSIX tarballs, since that's the format the most reproducible
     tar cf - --transform="s#^\./#${base_dir}/#S" \
              --numeric-owner --owner=0 --group=0 --mtime="${date}" \
-             --format=posix --pax-option="${pax_options}" \
+             --format=posix --pax-option="${pax_options}" --mode='go=u,go-w' \
              -T "${tmp}.sorted" >"${tmp}.tar"
 
     # Compress the archive
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
