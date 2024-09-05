Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37609E6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9379C84A4F;
	Fri,  6 Sep 2024 20:11:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FbXWiwGIh1By; Fri,  6 Sep 2024 20:11:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1045184879
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1045184879;
	Fri,  6 Sep 2024 20:11:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 20E4E1BF37F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 20:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DA126110C
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6vZVinbHh6Y0 for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:59:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F18B060639
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F18B060639
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEAD6828EF; Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Sep 2024 21:02:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 713d63b613c67974c6b14a84bab77ea570893aa2
X-Git-Newrev: c9a184cf316cfdebe61ca2deacd0e4a0835a081a
X-Patchwork-Hint: ignore
Message-Id: <20240906195900.EEAD6828EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-cargo: don't install crates
 tracking
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5969845365062678720=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5969845365062678720==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c9a184cf316cfdebe61ca2deacd0e4a0835a081a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, 'cargo install' also installs a kind of "registry" in
/usr/.crates2.json and /usr/.crates.toml [0]:
    To track information of installed executables, some extra files,
    such as .crates.toml and .crates2.json, are also created under this
    root.

Presumably, this would be used by "cargo uninstall" to properly cleanup
the package [1]:
    By default all binaries are removed for a crate [...].

However, in the context of Buildroot, this is useless, as we do not
uninstall packages, and thus those files are superfluous.

Tell cargo to not create that tracking information, by using --no-track
to "cargo install".

Note that this would cause cargo to fail to install a file that already
exists [2], like would be the case when running foo-reinstall for example:
    --no-track
    By default, Cargo keeps track of the installed packages with a
    metadata file stored in the installation root directory. This flag
    tells Cargo not to use or create that file. With this flag, Cargo
    will refuse to overwrite any existing files unless the --force flag
    is used. This also disables Cargo’s ability to protect against
    multiple concurrent invocations of Cargo installing at the same
    time.

However, we do already use --force which allows cargo to overwrite
existing files without any further ado, so in our case, --no-track will
only disable the tracking information.

Also, in Buildroot, we do not have concurrent installation _to the same
location_: either PPD is disabled, in which case only one package will
be installed to the common target/ at a time, or we're using PPD, so
each package will get installed into its own target/. Thus, --no-track
has no adverse side effect for us.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/issues/17

[0] https://doc.rust-lang.org/cargo/reference/config.html#installroot
[1] https://doc.rust-lang.org/cargo/commands/cargo-uninstall.html
[2] https://doc.rust-lang.org/cargo/commands/cargo-install.html

Reported-by: Thomas Kindler @thomask77
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: Thomas Kindler @thomask77
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-cargo.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 41dfcbd096..d94a19024e 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -279,6 +279,7 @@ define $(2)_INSTALL_TARGET_CMDS
 			--root $$(TARGET_DIR)/usr/ \
 			--bins \
 			--path ./ \
+			--no-track \
 			--force \
 			--locked \
 			-Z target-applies-to-host \
@@ -298,6 +299,7 @@ define $(2)_INSTALL_CMDS
 			--root $$(HOST_DIR) \
 			--bins \
 			--path ./ \
+			--no-track \
 			--force \
 			--locked \
 			$$($(2)_CARGO_INSTALL_OPTS)

--===============5969845365062678720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5969845365062678720==--
