Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E6BC5478C
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 19:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E7DA81D47;
	Mon,  4 Mar 2024 19:26:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q5Kdmc8BXkE8; Mon,  4 Mar 2024 19:26:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E398781DF1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E398781DF1;
	Mon,  4 Mar 2024 19:26:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6FA1C1BF2AF
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 19:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68DA14010D
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 19:26:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kzd2_P9Y7Pmx for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 19:26:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DF0040105
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DF0040105
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 19:26:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3175C880AF; Mon,  4 Mar 2024 19:26:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 4 Mar 2024 20:24:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8708f3a23a7e28fdb04fc57406e13e6b7ff4a337
X-Git-Newrev: 20406b715946887902e40ffcf8815a90dcb5faaf
X-Patchwork-Hint: ignore
Message-Id: <20240304192649.3175C880AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rust: provide RUSTFLAGS for cargo
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

commit: https://git.buildroot.net/buildroot/commit/?id=20406b715946887902e40ffcf8815a90dcb5faaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While building the rust toolchain, the build system ends up using
cargo (from [...]/output/build/host-rust-bin-1.74.1/cargo/bin/cargo)
to build some tools like rustdoc-tool.

But the host-rust package doesn't use the cargo infractructure (since
it provides cargo binary) and our cargo environment variables [1] are
not set to crosscompile cargo packages in the rust toolchain.

For exemple, we usually set RUSTFLAGS="-C link-arg=-Wl,-rpath,$(HOST_DIR)/lib"
to force cargo using libraries provided by Buildroot in $(HOST_DIR)/lib.

RUSTFLAGS is actually needed to find zlib library (host-zlib) to link
rustdoc-tool when zlib is not installed on the host.

Add $(HOST_PKG_CARGO_ENV) in HOST_RUST_BUILD_CMDS since it already
includes RUSTFLAGS but also CARGO_HOME.

Fixes:

  error: could not compile `rustdoc-tool` (bin "rustdoc_tool_binary") due to previous error

[1] https://gitlab.com/buildroot.org/buildroot/-/blob/2024.02-rc1/package/pkg-cargo.mk#L165

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rust/rust.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 4903060368..c544582c99 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -70,7 +70,8 @@ define HOST_RUST_CONFIGURE_CMDS
 endef
 
 define HOST_RUST_BUILD_CMDS
-	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) x.py build
+	cd $(@D); $(HOST_MAKE_ENV) $(HOST_PKG_CARGO_ENV) \
+		$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) x.py build
 endef
 
 HOST_RUST_INSTALL_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
