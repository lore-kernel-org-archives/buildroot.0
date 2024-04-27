Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0EBC4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 18:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 532A56088D;
	Sat, 27 Apr 2024 18:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qmDeu2fVC8l; Sat, 27 Apr 2024 18:39:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D75EE60A7E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D75EE60A7E;
	Sat, 27 Apr 2024 18:38:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 18A441BF86D
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 18:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D4A360833
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 18:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D8YKQdF4MrUr for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 18:38:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B6864605D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6864605D8
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6864605D8
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 18:38:09 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-34b3374ae22so3507344f8f.0
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 11:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714243088; x=1714847888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DvAEe4RbTLej5w3p05/wWBmLVaTnBTHsNkBss+8HUB0=;
 b=EgXz5kT5EdVAk2HrWKl+T0Q2mNeQvHHihXKuOY5ddya9KYegIXtt0AX8x/m53PMkBT
 lphuRIrtfkQXY71wWHQuMVjI9oPqFCMpavqlAnbO+C2gyCawkSW243P+H+EcRztZYUQt
 6FwBMrOJbTr4fCzFOyG1ORBoO6aTY64WxnjjxTmWzzgEnGiscEgFGw+ztt5EqXacF88B
 eqyJWHqK5s61K08c+6swpj7tDm5re2S1nY3ftSt2vMyOtG/xaoWSp4QxhkFfn6vuiCS8
 h0nWjRqq/KrhD3HNCALmiKntVpuV/pp8tHFevvaGWW2qWRvL7SEudMWPPTmKYpVbDJuh
 G3ZQ==
X-Gm-Message-State: AOJu0YyrbzCBUdrKeHpc4bxapIzdbB0fuLHuvLFXTo88ERhYzhfBxMkF
 0lbbr3Qk7gQDmjzjJ95abuAVQcNzWl4Hd1o/wfPTWHhBWNeR6kuuzIoCbA==
X-Google-Smtp-Source: AGHT+IH4fFOmHeb0L1MRiakMVSeWgOOIV82sZjy333si9uZp1/sR76YZKyd4OmKEcMQSePcTlht4+A==
X-Received: by 2002:adf:fac4:0:b0:33e:69db:bf9e with SMTP id
 a4-20020adffac4000000b0033e69dbbf9emr5963206wrs.67.1714243087853; 
 Sat, 27 Apr 2024 11:38:07 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 k21-20020adfb355000000b0034c6b368aecsm4136589wrd.26.2024.04.27.11.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Apr 2024 11:38:07 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 20:37:58 +0200
Message-ID: <6b86df23cd0a56320c04e232d5f30e8d4e7fe645.1714243078.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714243078.git.yann.morin.1998@free.fr>
References: <cover.1714243078.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714243088; x=1714847888; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DvAEe4RbTLej5w3p05/wWBmLVaTnBTHsNkBss+8HUB0=;
 b=Jm8FRI4QGdwdR5He7hYh05hTAGTT3Y1lTBl3vse7n2p1t2MZwsQQ/XH/S9/ceiM5tw
 f5+QHBXNd+PmhycwXznUqP5uzmlixJtb8F9tRN4j+j+NI+cvhUMhOHpMKchRCMBQdTuS
 scDTWFxE2RGeFao3h8mEVRMrELnU8rUF186I97XDeMmH8fKlArN9XBj7XB6G5Xt6ZpYp
 8JufaO4Z2J2kQnqe3nSMdrz8lG5EtmIj/Y3SoFMWz6vNegct0fPEqE/PutZFiHEgBrS/
 c6TSTc5bHlueRlN4AHNPl51qVtZ9y9XRibA1g9F3OS97cI31XvGdii/XuzAltTizyCUR
 GOOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Jm8FRI4Q
Subject: [Buildroot] [PATCH 11/15 v2] support/download: even more
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
group names and id. Those are also accounted for and made reproducible.

The final touch (so far!) is that files have access rights (aka mode),
and those too are stored in tarballs. So far we accounted for those by
ensuring that Buildroot would always run under a known umask, thus
generating files with reproducible modes.

That falls short in one case that we did not envision, though: a shared
download directory, where extended attributes are set to provide a
default ACL that is permissive, to allow two or more users (with
fdifferent uid and gid) to all read and write to such a directory. This
is trivially (although slightly uncommon) achieved with something like:

    $ mkdir -p "${BR2_DL_DIR}"
    $ setfacl -m 'defaut:user::rwx' "${BR2_DL_DIR}"
    $ setfacl -m 'defaut:group::rwx' "${BR2_DL_DIR}"
    $ setfacl -m 'defaut:other::rwx' "${BR2_DL_DIR}"

This has the effect that:

  - files below BR2_DL_DIR are all set with user, group, and world read
    and write access,
  - files executalbe tby the owner will also be group and world
    executable,
  - directories are user, group, and world readable, writable, and
    searchabe.

This means that all the archives we generate from files in BR2_DL_DIR
will have modes that are different as those generated on other systems,
where the traditional umask is used.

There are various solutions to solve that issue:

  - detect the situation and abort: that's not nice, because users have
    a legitimiate reason to want to share that directory,

  - find a solution for each affected download mechanism: git, svn, hg,
    cvs, bzr... and for each of the affected vendoring mechanism: go and
    cargo [0]; this is not nice, because it means a lot of repetition,
    with the risk that they diverge over time (e.e one is fixed for a
    newer issue, while the others are left out due to an oversight...)

  - find a single, common solution that works in all cases, whatever the
    download mechanism and/or vendoring: this is the best, because we
    can extend and fix it once and eveything else benefits from it.

We obviously go for the third option.

This implies that we must bump the version-suffix for the download
backends [1] and for the vendoring post-processes.

[0] Note however that the vendoring is currently not done in a
sub-directory of BR2_DL_DIR, but the cargo and go caches are located
there. Files that get copied from there to the vendoring area would be
tainted a swell, and thus we want to address that situation as well.

[1] we currently do not have a CVS version suffix, because we do not
guarantee the reproducilibity of CVS archives (we can't); for hg, we are
currently using hg's own archive tool, and presumably that does not have
the mode issue because it is not using the checked-out files. Still,
doing the mode fix in a single location will help extend thos etwo
backends in the future (if that ever happens...).

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
