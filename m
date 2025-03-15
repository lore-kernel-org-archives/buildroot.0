Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1C4C35FF3
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 23:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 665AA83267;
	Sat, 15 Mar 2025 23:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rRkRlTfsGfDj; Sat, 15 Mar 2025 23:12:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FCEE839E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FCEE839E4;
	Sat, 15 Mar 2025 23:12:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E125361
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 23:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 188636079A
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 23:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qe6gdNBNbpzP for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 23:11:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 155FF607CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 155FF607CB
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 23:11:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10BC388009; Sat, 15 Mar 2025 23:11:52 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Mar 2025 22:23:59 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 54f79d804f8fc78d1ebbc064b91adc6c26cf01cc
X-Git-Newrev: 3a2baca4b785db33175058741f6123dfef85df84
X-Patchwork-Hint: ignore
Message-Id: <20250315231152.10BC388009@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] system/skeleton: move target
 of /etc/resolv.conf symlink
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3a2baca4b785db33175058741f6123dfef85df84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
