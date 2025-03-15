Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EC3C28B28
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 19:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87469413AF;
	Sat, 15 Mar 2025 19:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vp-ejFTw4BbE; Sat, 15 Mar 2025 19:57:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C799541383
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C799541383;
	Sat, 15 Mar 2025 19:57:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A0C3C8
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9CF2400EC
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cZhhhgDS8oNF for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 19:57:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 33AE140465
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33AE140465
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33AE140465
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:21 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-391342fc0b5so2619903f8f.3
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 12:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742068639; x=1742673439;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7u09qQRxkuQ+XzcP0ue9PHAfMrX6zEdTNPfJA3K+n38=;
 b=ev3tT5DvT4dHgE2iBg7wSKXotn+NlbeUp9VtLPmDcdyTMUh5QZ/u/DHvE6aT/gnFyZ
 S8FvfI+lbCLjeYBwQJkCU9avutmNVlNi25z16oFoUA0qed30hQlrc3giemOT7qKV+8bu
 XRlb4b8UQzeCzch26KIps9WurwoVx4KhzEq/nX7HB9F39qvDI8hxNzNkshEZl4hMZNkW
 BjmP9b0n/AW38ISqf1uGMOfTTTZaL4NL0L1g3Kj+rsVDcfW16WraKT2TuvOyzXFivJDV
 bJV82rX1PH+JCuefjDRfiKcbqKceE2YYLqpXq+FsrKTuE23QuO9/5sbzIhR4x7yiB0qw
 YAuw==
X-Gm-Message-State: AOJu0YyDkvh3fTHM25dUHx5AS9qRjx7anGNHk4R6lr1pCp8jYzfLb7PJ
 KR7SkJJryTWeX11IDTDl6rVoMj2u1DpMHd/u2wmQO/zLH9c97Gba5oLR7w==
X-Gm-Gg: ASbGncs1bJD9Wika5LYoEnJaUfLVDiNJSU40O+N8nbrp8ym55HMejOiSVZ7Yj19YKfR
 BqHL+nZsZxdvfqbbPdxC97XhH4HwA4Ax4/xOMcfeoPO11+wFJfZx2mrSpuYXpNeoAyx9hHufZkT
 zbPPoinKnmQ9qI4oyvkqO5FJxJBjZzzh1cjyt64XnVZLAMHCPYkknZXloTh+VSduqlTEIBKJTH3
 tDaFr4Pj6VgonTGEWdQXB4zXRv9hsg81IyfjA+vRpnCdKJl4TnPWWoM5sq5T9TcJ+fZX3VNHVPE
 SiWOlt5G7t8cxE26fbG1swtfsj7tJQM0e7hKwoUYVRo75mC7w38ygNA=
X-Google-Smtp-Source: AGHT+IH0r77ssePZGaqJjUoOO/m+e1360QdmcoF6jRe0Wdf/PTUbsPIxMhbmVnpHPNwBjg3eQcbgiw==
X-Received: by 2002:a05:6000:1786:b0:390:ee34:228b with SMTP id
 ffacd0b85a97d-3971e876832mr10091771f8f.24.1742068639065; 
 Sat, 15 Mar 2025 12:57:19 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975afesm9756836f8f.47.2025.03.15.12.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Mar 2025 12:57:18 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sat, 15 Mar 2025 20:57:12 +0100
Message-ID: <8e08d90a84b25beb3d2e125e1bff187b29405466.1742068624.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1742068624.git.yann.morin.1998@free.fr>
References: <cover.1742068624.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742068639; x=1742673439; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7u09qQRxkuQ+XzcP0ue9PHAfMrX6zEdTNPfJA3K+n38=;
 b=Y0t678Fn+i3UNEgY8RrUX4vtofCFJj7oqvNrl1hpjylQAT+TfLSRH1dP2YLiHHDrev
 mar5v3UDZGn5OfiINzK7gaq4k40JtPrnsg6+L56stSAxsk6tVcrHZsaNBHHnM8/Om//b
 Dlmwuy7CiETQOa+ONoDbRKU4cOoEF5kQTSkoF0twy/8eSlPEsCS3xH5z3HLrDrB6cijn
 tQ3PvLqvNYBOAwaO2/ZKbr6fRLsGEDjMG9usOmyAIDtKppe/4m7n00brLNYabl8X6sHo
 PxxIyR8KwhEHp5oc+BYFAE3ZQ2FsGOVNcPvTgOB+c7to2Y8DtjKJ4DKyIi38XEyZcTN8
 EMCA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Y0t678Fn
Subject: [Buildroot] [PATCH 14/14 v4] system/skeleton: move target of
 /etc/resolv.conf symlink
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In commit ba70f94e629e (subversion makes it so we do not need a separate
tarball to store empty directories and symlinks for the target_skeleton.)
/etc/resolv.conf was made a symlink to ../tmp/resolv.conf. There was no
rationale behind this change, but back at the time (2006!), the only
location that Buildroot guaranteed to be writable was /tmp, and we
needed a writable location to create resolv.conf from a DHCP reply for
example, so the change made sense.

Commits 2f67d9e2fe7b (preparation for BR2_PACKAGE_BUSYBOX_SKELETON), in
2007, then d9119c0bc55d (move default skeleton to fs/ and drop busybox
skeleton), in 2010, and finally 6c3e3ad41977 (New top-level directory:
system), in 2012, propagated that /etc/resolv.conf without any change in
the target of the symlink.

However, since commit d380dde1d287 (skeleton: make /run a proper
directory/filesystem), in 2015, a tmpfs has been mounted on /run, so it
is now guaranteed to be writable as well for SYS-V-based systems. That
has also been the case for openrc since commit a840e485d174
(package/skeleton-init-openrc: new package), in 2019. This has also
always been the case for systemd as well.

resolv.conf is not a temporary file [0]; it is really more of a runtime
data; its location in /tmp is just a historical artefact of a long-wrong
assertion.

Nowadays, distributions either have an actual file as /etc/resolv.conf
(when /etc is writable), or it is a symlink to a location below /run.

Although resolv.conf is used by the C library resolver, a lot of
applications now will directly use it; this is the case for some
container management tools, such as podman (and its helpers, like
netavark), that expect /etc/resolv.conf to either be a file or a symlink
to somewhere in /run, and fail to provide DNS services if that is not
the case.

So, we move the target of /etc/resolv.conf to ../run/resolv.conf.

As a consequence, we can drop the workaround in podman's runtime test.

To be noted: there are tow custom fstab files in Buildroot that do not
explicitly mount a tmpfs on /run:
  - one for a systemd runtime test, so /run would also be a tmpfs there
    anyway, as systemd does mount one;
  - one for the mender_x86_64_efi_defconfig; that's a not a problem:
    / is an ext4 that is mounted r/w (and /tmp is not a tmpfs either, so
    the symlink to /tmp would not not have worked if / was not r/w
    anyway).

This leaves people with their own fstab, to adapt. Cater to them by
adding a little blurb in the documentation.

Note: the following 43 tests all built and ran successfully:
    tests.init
    tests.package.test_apache
    tests.package.test_docker_compose
    tests.package.test_dropbear
    tests.package.test_iputils
    tests.package.test_podman
    tests.package.test_skopeo
    tests.package.test_wget

(no other runtime test were attempted)

[0] temporary, as in relatively short-lived.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/migrating.adoc                   | 14 ++++++++++++++
 support/testing/tests/package/test_podman.py |  7 -------
 system/skeleton/etc/resolv.conf              |  2 +-
 3 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index 5e8c3ea2c6..1b55bc6173 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -195,3 +195,17 @@ host-mender-artifact. See +board/mender/x86_64/post-image-efi.sh+ for an
 example of how to generate the bootstrap.mender file. See 
 https://docs.mender.io/release-information/release-notes-changelog/mender-client#mender-3-5-0-1[the
 release notes], under features, for more information.
+
+[[migrating-resolv.conf]]
+=== Migrating to 2025.05
+
+In 2025.05, for SYS-V-like systems (busybox, sysvinit, openrc), the
+`/etc/resolv.conf` symlink was changed to point to `/run/resolv.conf`,
+rather than the legacy location in `/tmp`. Users of a custom `fstab`
+will need to ensure that `/run` is writable before resolv.conf is
+created (usually by a DHCP client), either with an entry for `/run`,
+or with a startup script.
+
+Note that systems using systemd are not impacted: systemd always ensures
+that `/run` is writable. Systems further using systemd-resolved already
+had a `/etc/resolv.conf` that pointed into `/run` anyway.
diff --git a/support/testing/tests/package/test_podman.py b/support/testing/tests/package/test_podman.py
index 4d9b19310e..9d86a06129 100644
--- a/support/testing/tests/package/test_podman.py
+++ b/support/testing/tests/package/test_podman.py
@@ -71,13 +71,6 @@ class PodmanBase(infra.basetest.BRTest):
         self.assertRunOk("touch /etc/subuid /etc/subgid")
         self.assertRunOk("usermod --add-subuids 10000-75535 foo")
         self.assertRunOk("usermod --add-subgids 10000-75535 foo")
-        # If /etc/resolv.conf is a symlink, it has to point either into /etc
-        # (or deep in there), or into /run (or deep in there), as only those
-        # would eventually get used by podman/netavark for # rootless containers.
-        # This is considered a workaround to the current situation; resolv,conf
-        # should ultimately be in /run rather than /tmp.
-        self.assertRunOk("mv /tmp/resolv.conf /run/resolv.conf")
-        self.assertRunOk("ln -sf /run/resolv.conf /etc/resolv.conf")
 
         # First, test podman as root (the current user)
         self.do_podman()
diff --git a/system/skeleton/etc/resolv.conf b/system/skeleton/etc/resolv.conf
index 71f6f96576..2ce2910f08 120000
--- a/system/skeleton/etc/resolv.conf
+++ b/system/skeleton/etc/resolv.conf
@@ -1 +1 @@
-../tmp/resolv.conf
\ No newline at end of file
+../run/resolv.conf
\ No newline at end of file
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
