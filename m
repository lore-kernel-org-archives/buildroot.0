Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FA4C5478C
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 22:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5450408CE;
	Sat,  2 Mar 2024 22:03:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N5uOz1dzhp3Z; Sat,  2 Mar 2024 22:03:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3835E410B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3835E410B3;
	Sat,  2 Mar 2024 22:03:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB4DE1BF860
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 22:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D458B408CE
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 22:03:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FQn18Bdp3m_w for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 22:03:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFD43408CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFD43408CA
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 22:03:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA2C683F0F; Sat,  2 Mar 2024 22:03:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 2 Mar 2024 22:39:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 953230e176ef4357d5cc28039eb913951b79f513
X-Git-Newrev: 83a4c6f4fbedefb7aa12a887c2c073d9ade20c6e
X-Patchwork-Hint: ignore
Message-Id: <20240302220334.CA2C683F0F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rust: use host libraries from
 HOST_DIR
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=83a4c6f4fbedefb7aa12a887c2c073d9ade20c6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-rust package depends on several host packages to provide tools and
libraries but it doesn't take into account out host libraries in
HOST_DIR while building rustc compiler. Indeed, rustc needs zlib and
fails to link if zlib is not installed on the host.

  error: could not compile `rustc_driver` (lib) due to previous error

If zlib is installed on the host, we can notice it with ldd tool (while
it should be linked with the one provided by Buildroot host-zlib):

  ldd [...]TestRust/host/bin/rustc
  libz.so.1 => /lib64/libz.so.1

Provide HOST_LDFLAGS using llvm.ldflags in config.toml.
(HOST_LDFLAGS provides -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib)

With that fixed, rustc_driver link with libz from HOST_DIR but the
host-rust build still fail later due to another issue.

  error: could not compile `rustdoc-tool` (bin "rustdoc_tool_binary") due to previous error

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6256881545
http://autobuild.buildroot.org/results/a6b/a6b28783f29e6b729824bf42679a62f72ad5bee0

Signed-off-by: Romain Naour <romain.naour@smile.fr>
[yann.morin.1998@free.fr: slight rewording in commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rust/rust.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 16a397407f..4903060368 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -65,6 +65,7 @@ define HOST_RUST_CONFIGURE_CMDS
 		echo 'cc = "$(TARGET_CROSS)gcc"'; \
 		echo '[llvm]'; \
 		echo 'ninja = false'; \
+		echo 'ldflags = "$(HOST_LDFLAGS)"'; \
 	) > $(@D)/config.toml
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
